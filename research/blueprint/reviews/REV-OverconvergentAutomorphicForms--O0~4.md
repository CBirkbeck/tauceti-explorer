# REV-OverconvergentAutomorphicForms--O0~4: accepted

Independent reviewer: **Codex — codex-bnuA6h**, 20 October 2026. Refs #11303.
The reviewer did none of the four input planning jobs. This review is complete.

Accept the corrected **complete target-level plan**, with its three precise
gaps and four planned stages retained. This does not certify a closed roadmap,
prove the missing inputs, or claim that the proposed geometry is implemented.
PROTOCOL §§0 and 3 expressly allow a complete planning pass whose outstanding
inputs are recorded. The current WORKERS shape makes the reader definitive and
limits Suggested.lean to light definitions and milestones statable at the pins.
The previous review's exhaustive-prototype-name rejection is therefore no longer
an acceptance criterion. Its historical assessment is preserved unchanged.

All 79 node contracts and their cited source passages, 38 pinned baseline
statements, exact named supplier interfaces, API/test contracts, coverage,
prerequisites and 32 planets were checked. Six contracts needed mathematical
correction. Six register entries remain unverifiable as unconditional conclusions
because they depend on the explicitly recorded gaps. The other 67 verdicts
verify mathematical contracts at roadmap level, including their hypotheses and
conditional assertions; they are not Lean proof-completion claims.

## Inventory and coverage

| Item | Final reviewed plan |
| --- | ---: |
| Nodes | 79 |
| Definitions / constructions | 5 / 31 |
| Lemmas / theorems / comparisons / applications | 5 / 23 / 13 / 2 |
| API items / test contracts | 133 / 113 |
| Planets / pinned baseline declarations | 32 / 38 |
| Requests / explicit gaps | 2 / 3 |
| Closed / planned but not closed stages | 4 / 4 |
| Suggested Lean lines / proved examples | 280 / 4 |
| Lean placeholder-proof warnings / other diagnostics | 15 / 0 |

O1, O2, O4 and O6 are closed at the packet's planning granularity. O0 remains
planned for the Jacquet eigenvariety geometry; O3 and O5 for full-character
positive-radius integral freeness; O7 for the nondiscrete unit-ball comparison.
Every stage target is represented. The local prerequisite graph is acyclic.
Its leaves are exact baseline declarations, supplier nodes, the two stage
interfaces or one of the three gaps. No node or planet was added or removed.
Every definition/construction has its API, recorded uses and at least three
discriminating tests. The 32 planet counts by O0–O7 are 6,3,3,3,5,2,6,4;
they name central mathematical objects/results, not proof helpers or source
locators. All implementation statuses remain unchecked.

## Corrections made in this review

**Admission.** The p=3,m=1 test contradicted its own strict T4 hypothesis.
It now uses ε<1/9 and excludes both ε=1/9 and ε=1/3. The other prime-dependent
endpoints, ramified level-two bound and scaled Atkin–Lehner source domains
are retained. An existential analytic extension is never obtained from the
disproved printed numerical radius.

**AIP torsor and valued lifting.** An analytic frame torsor locally trivial
for the étale topology has positive-dimensional fibres; its projection is
not an étale morphism. The torsor-invariants node now states this correctly
over X(ε), rather than over its Igusa cover. A valued base point first lifts
through an étale splitting cover after a finite separable residue-field
extension, and the unit section then gives a point of the frame torsor.
This proves reflection of pointwise integral bounds. Invariant functions on
each split chart are evaluations at the unit section, and étale O/O+ descent
glues the result on every open.

**Finite-character factor.** The node now forms eigenfunctions on the actual
analytic product of the level-two Igusa cover with the smooth weight base.
It does not identify that geometric O+ sheaf with a completed tensor of
formal integral rings. On the split product over the full admitted tower,
the function e(σ·a)=χ(a) inverse is an integral unit and generates the
eigenfunctions newly formed there. Rational finite étale base change is
valid. Ordinary integral module pullback need not commute with that
equalizer. The positive-radius integral local-freeness gap is retained.

Descent to X(ε) now uses the **full Čech relation**: if
σ(y₂)=σ(y₁)a(y₁,y₂), then g(y₂)=χ(a(y₁,y₂)) inverse times g(y₁).
The diagonal-entry formula a=d_γ mod p² is only the restriction of that
relation to Γ₀*(p∞). That subgroup alone reaches an intermediate quotient,
not the base. The independent-coefficients proof was corrected accordingly.
An integral character projector requires the order of the whole group being
averaged to be invertible, not just the order of the character image.
AIP ADIC Lemma 2.4, pp.7–8, and §6.4, p.29, give the finite-character
factor; AIP CUSP Proposition 3.14 and Remark 3.15, p.17, explicitly separate
rational from integral base change. The annulus nonfreeness model remains a
check that a unit on a split cover proves insufficient.

**Cusp higher vanishing.** The former proof used unjustified group-cohomology
vanishing and finite étale trivialization of arbitrary torsion lines,
including p-torsion. It is replaced by the actual split-power-map argument.
Choose a unit-invariant polarization h and ample toric divisor
D_h=−Σ a_ρD_ρ. For ℓ>max a_ρ, the finite flat toric power map has an
equivariant split injection O(−D)=O(floor(D_h/ℓ))→Φ_ℓ*O(D_h).
Complete at the boundary and descend the split map to the unit quotient.
Positive-degree cusp-ideal cohomology is then a direct summand of an ample
twist's cohomology, which vanishes after scaling h. The monomial splitting
does not divide by ℓ. These are AIP CUSP Definition 6.1, Proposition 6.2,
Lemma 6.3 and Proposition 6.4, pp.31–33. The extension to a torsion
invertible sheaf, with no prime-to-p restriction, is explicitly stated in
the proof of AIP ADIC Theorem 8.2, p.35. The misleading assertion of a
universal length-one untwisted cusp stalk was removed.

Generic proper formal functions for algebraic spaces is already
ShimuraCompactifications C3.6a, named
ToroidalRefinement.algebraicSpace_formalFunctions. Its atlas packet has no
finer node id, so the exact C3 interface is recorded as the second request.
It is an existing supplier target, not a newly invented gap or a construction
duplicated here. A toroidal refinement's acyclicity alone is insufficient
for contraction to the minimal compactification; the Hilbert cusp argument
belongs to O6.

**Family expansions.** The expansion target is now the boundary-completed
series module in the weight coefficient line D_{c,κ}, with its κ-dependent
cusp-unit action and chart support condition. It uses a chosen Tate splitting
and compatible Igusa generator. At algebraic weights it specializes to B5.16's
line, after the AIP weight conversion. It is not a scalar series module
independent of the weight. The sufficient expansion-principle hypothesis
is stated on every relevant finite-level ordinary Igusa component on each
weight chart; infinite-level use is through these finite charts. The old
negative test incorrectly inferred noninjectivity on a descended eigenspace
from failure of that sufficient condition. It now gives the valid test of
an unrestricted function supported on an omitted component and leaves the
weighted descent argument explicit.

The common hypotheses also spell out the existing arithmetic torsor scope:
quotient stacks, or coarse spaces over the respective action-free loci of
H3.6/H4.17/S5.8. N≥4 by itself is not freeness of a polarization or diagonal
action. This is a supplier restriction, not an assertion that all coarse
points satisfy it.

## What remains open

1. **Definite-unitary Jacquet eigenvariety geometry.** Ding Proposition 4.14,
   §4.2.2, pp.66–68, uses a Hecke spectral construction on the coherent
   Jacquet dual, BHS local dimension/depth inputs and classical-density
   reducedness. LR.6 already owns generic Jacquet modules and character
   varieties; the request asks only for the additional precise geometry.
   The dimension is n·d_K and the Cohen–Macaulay assertion is about the
   coherent sheaf. Those BHS inputs were not independently established
   in this review and are not passed off as supplied theorems. O0's
   completed coefficient construction stays local to this roadmap.
2. **Full-character integral local freeness at positive radius.** AIP's
   universal-character formal part is free; the finite factor is coherent
   and rationally invertible and has a split-cover unit. None of those facts
   proves base-local O+ freeness for the full character, especially of
   p-primary order. The independent completed-formal-lattice/geometric-O+
   comparison also cannot be inferred from integral tensor pullback.
   O3/O5 retain the exact gap. The integral comparison of actual analytic
   eigenfunction equalizers uses valuations and does not require freeness.
3. **Ordinary unit balls after nondiscrete base change.** Formal smoothness
   and reduced special fibre prove R_i=A_i° at a discretely valued level.
   For the perfectoid coefficient field, O_L/ϖ need not be reduced, so the
   same criterion does not apply. A spectral/tensor-norm proof, or comparison
   before base change followed by completion, remains necessary. Heuer
   Proposition 3.8 supplies the natural map, not this missing equality.
   The conditional ordered-completion argument in O7 is sound under it.

These gaps are accepted as precisely described follow-up inputs under
PROTOCOL §0. The packet is complete, not closed, and is not ready to claim
an unconditional gap-free upstream implementation.

## Sources, baseline and ownership

Seven public PDF versions were read at the passages each target cites and
fingerprinted against the packet. The source records now name this review,
its date, hashes and actual reading scope, preserving previous reading history.
No source passage or source-by-section digest was added to the repository.
The AIP source locators use the stated author-PDF pagination. The BHW
published PDF has 87 pages with printed page = PDF page +1707.

| Source version | Passages read for these targets | SHA-256 |
| --- | --- | --- |
| [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | PDF pp.29–30, 42–58, 61, 66, 68–85: the coefficient, weight, canonical/frame, arithmetic descent, Hecke and ordinary comparison passages cited by this packet, including the nine source-issue formulas. | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` |
| [BHW-ARXIV-V4](https://arxiv.org/pdf/1902.03985v4) | Corresponding §§6–7 passages, PDF pp.27–31, checked against the version of record for the sign, boundedness/radius, subgroup rank and comparison-arrow findings. | `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac` |
| [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | Lemma 2.4 and Proposition 2.8, pp.7–10; §§4.1–4.3, pp.15–19; §6.4 and Theorem 6.7, pp.27–30; §§8.1–8.5, pp.34–39, including the torsion-line claim in Theorem 8.2’s proof, p.35. | `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd` |
| [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | Cited coefficient/torsor/cohomology and arithmetic passages, pp.14–24 and 26–28; Proposition 3.14/Remark 3.15, p.17; Appendix Definition 6.1, Proposition 6.2, Lemma 6.3 and Proposition 6.4, pp.31–33. | `1f42b2c19b9542e937b6d02c244f71c7a1ef1d15840b8fab209950227269c406` |
| [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) | §§6.2–6.3, pp.147–154: algebraic and analytic induced coefficients, analytic neighbourhoods of M_1, the dual conventions and algebraic comparison. | `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae` |
| [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | §4.2.2, pp.66–68, including Proposition 4.14 and its precise BHS dependencies; those cited BHS results are a recorded missing input, not claimed read. | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf) | Theorem 1.4, p.3, and Proposition 3.8 with proof, p.16: line effectivity and the natural formal-to-analytic integral map, without an automatic ordinary unit-ball identification. | `1a435945b817b8081b34e490b39b43c707676d4142cb83b77493b112908cdadf` |

All nine recorded source issues E1–E9 were independently confirmed. Their
new reasons state the mathematical check, and all previous verdicts remain
in reviewHistory. E1–E6 concern the inverse norm, all-unit boundedness,
numerical radius, canonical subgroup rank, Banach citation and named
comparison-map direction. E7–E9 concern all congruence units in the central
kernel, ramified integral nonsplitting and diagonal contracted-product
equivariance. E8 is a failure of a proof step, not a counterexample to the
inclusion theorem. The exact source locators and counterexamples are in the
packet's sourceIssues and reader. Fresh title/author searches with
erratum/correction on 20 October returned no correction in the inspected
results; the [publisher page](https://aif.centre-mersenne.org/articles/10.5802/aif.3560/)
and [author publication page](https://bheuer.github.io/) were among the
results. This does not prove absence of an erratum. No author was contacted.

Every one of the 38 baseline declaration statements and its surrounding
hypotheses was read at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The fresh confirmation is in
each baseline entry. In particular:

- Determinants, norms and base change require the specified finite-free
  hypotheses; the generic embedding product is not an integral splitting.
- Module topology and finite/free base change provide the algebraic and
  topological tensor inputs, not analytic induction or adic coefficient rings.
- Representation, tensor and dual are algebraic; analytic orbit maps and
  integral Banach lattices are separate requirements.
- SheafOfModules gives no adic ringed site on its own.
- Valuation and its integer subring allow arbitrary ordered value groups;
  no real-valued restriction is inserted into the O+ comparison.
- Tau Ceti's narrow class group and its finiteness supply precisely those
  arithmetic facts, not a Hilbert coefficient-space construction.

The reviewed library audit for O0–O8 was checked against the current library.
AdicSpaces and ModularForms upstream reader documents were read as nearby
models of scope and API. Current TauCetiRoadmap main was inspected at
0d144d044dacebca17b654695b6f1ad58f159b27. The nine post-snapshot roadmap
Suggested files, including the nested OperatorTheory files, were searched
for overlapping targets; the current Tau Ceti library was also searched.
Existing module, operator and classical modular-form material is consumed;
no duplicate generic geometry or Hilbert analytic construction was found.
These searches are evidence of scope, not a proof that every synonym is absent.
No upstream file was changed and no lake command was run there.

Named supplier contracts were compared with the following PR heads. Other
interfaces use the current main reader documents: AdicSpacesPartII R0,
AdicSpacesPartIII R3, AdicSpacesPartIV R5, AdicEtaleGeometry A1,
PadicFunctionalAnalysis and PadicMeasuresIwasawaAlgebras. Atlas P9 ids now
refer to PerfectoidTowers; atlas R3/R5 ids retain the older roadmap names.

| Supplier | PR | Head read |
| --- | --- | --- |
| LocallyAnalyticDistributions | [#854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854) | `3fd4e006c5aa12664e7193943c310f1acd0cc540` |
| CompletedCohomologyPartII | [#1035](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1035) | `1337958d2e3b2f68f5589ad3ef3c4ee2e71e0e10` |
| AutomorphicBundles | [#1069](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1069) | `218de510ae5e76e447293fcacb7c9c1949f037de` |
| HodgeTateAndCanonicalSubgroups | [#1084](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1084) | `c024ddcf595ebc700814ce08c53e67b67cbf2e6f` |
| HilbertModularVarietiesAndShimuraCurves | [#1005](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1005) | `5db7b73b405791d16da682c5f9e7c52c6b864fbf` |
| PerfectoidShimuraVarieties | [#1085](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1085) | `21b9aa169621b507da3e0cacf76d38b09af04531` |
| ShimuraCompactifications | [#1053](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1053) | `b5675ac208c9deb521a784a27908f77e09b19c73` |
| PerfectoidTowers | [#816](https://github.com/TauCetiProject/TauCetiRoadmap/pull/816) | `537fec2d9dc75b76b85fd4c203bc00a6a974b579` |

The exact interfaces read are LAD §§0.3,4.1,4.15; completed cohomology
§§1.1–1.3,2.1,2.6,2.10 and the narrower §8.5 adapter; H3/H4 quotient,
congruence-unit and torsor contracts; T4's prime/radius/unsplit comparison
and T5's Igusa, modified-lattice, frame and comparison contracts;
S5 §§5.4–5.10; B0's associated coefficients/ineffective-fibre criterion,
B4.12 and B5.10,5.16–5.19; C3.6a and C5/C6's Koecher, boundary,
Hasse-domain and cusp-model contracts; P9.6–P9.13 all-open descent and
integral effectivity; R0 completed tensors/unit balls, R3 trace/compact
restriction and R5 actual coefficient products. LR.2/LR.6's analytic
vectors, character variety and generic Jacquet contracts were also read.
The compact eigenvariety engine is not substituted for Ding's Jacquet
eigenvariety, and smooth weight products are not called perfectoid.

The O4 effective-arithmetic-descent node is in the assembled packet and is
imported, not duplicated. Its inputs are the norm/congruence-unit and H3/H4/S5
contracts; the dependency is acyclic. The assembled packet records an older
O0 input fingerprint. Refreshing its provenance and propagating these review
corrections is a maintainer integration action outside this issue's allowed
files; it is recorded in the handoff rather than silently editing the assembly.

## Lean shape and validation

The 280-line suggested file imports Mathlib only, since no Tau Ceti declaration
is used in its statable signatures. Its light definitions are actual tensors,
norms, characters, congruence kernels and right cocycles over pinned carriers;
there are no fabricated geometric carriers or sorry-defined data. Analytic
and geometric targets are explicitly reader-only. Two proved weight-map
examples remain. The two cocycle checks now use the actual RightCocycle:
one tests the inverse law at the translated point, and an S3 example detects
the reversed noncommutative factor order. The standalone matrix multiplication
and valuation-negation library examples were removed. The cocycle identity
at one is proved by cancellation, removing one placeholder.

The full revised file elaborated through lean-check at the pinned Mathlib
with exit code zero, 15 sorry warnings and no other warnings or errors.
Available memory was checked before compilation. No language server, library
build, dependency update or cache download was started.

Final checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/OverconvergentAutomorphicForms--O0.json`:
  zero errors and zero warnings.
- Reader/packet comparison: every node statement, hypothesis, proof step,
  acceptance clause, API/test name and statement, and prerequisite occurs in
  its corresponding reader block; zero mismatches.
- All 36 definition/construction nodes have at least three tests, API and uses.
- Fresh review register covers the exact 79 node ids once, and all seven
  source hashes and nine source-issue histories are retained.
- `git diff --check`: clean. Only this issue's deliverables and own handoff
  are changed.

## Complete node register

Each verdict below assesses the final mathematical contract. Corrected means
the error was repaired here; unverifiable identifies an explicit missing
input. The statement of a conditional milestone is not proof of its condition.
Source locators, full API/tests and direct input lists remain beside each
contract in the packet and reader.

### OverconvergentAutomorphicForms:O0

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `units-at-p` | verified | Finite freeness and the module topology give rank [F:Q] and compactness; no integral decomposition into embedding factors is used. |
| `norm-at-p` | verified | Determinant norm, base change and its restriction to units have the stated domains and global-unit compatibility. |
| `principal-units` | verified | Reduction kernels are open of finite index; positive-depth successive congruence quotients give the pro-p assertion. |
| `geometric-weight-characters` | verified | The point-character functor is correct. Its representing rigid space is imported from LR.6/character-variety; no rigid representability is attributed to Iwasawa character spaces alone. |
| `arithmetic-weight-characters` | verified | Restriction to the two factors and multiplication are inverse, with the specified units topology and coefficient functor. |
| `weight-dual-group-map` | verified | The inverse norm coordinate gives the desired character pullback. This corrects the published sign without changing the intended weight convention. |
| `weight-comparison` | verified | Precomposition with the inverse-norm map defines the comparison and its coefficient naturality; the rigid-space version uses the LR.6 supplier. |
| `weight-comparison-formula` | verified | Evaluation gives w(x)^2 t(N(x)) inverse, with w and t on their separate domains. |
| `weight-comparison-norm-factor` | verified | Cancellation yields the inverse norm-character factor, including the algebraic exponent test. |
| `weight-comparison-totally-positive-units` | verified | The integer norm of a unit is ±1 and the real product is positive, so it is 1. Total positivity is sufficient here; the central-kernel lemma below handles all congruence units. |
| `weight-radius-parameter` | verified | The pro-p supremum is only a boundedness diagnostic. AIP universal coordinates and an actual analytic extension radius remain separate. |
| `continuous-character-bounded` | verified | The compact pro-p image and spectral ultrametric hypotheses give the strict bound; this is not a claim for arbitrary equivalent Banach norms. |
| `analytic-continuation-of-bounded-weights` | verified | AIP Proposition 2.8 and the affinoid universal-character analytic-stage contract supply existential extension. The disproved numerical radius is not used. |
| `bounded-weight-families` | verified | Bounded image in a weight affinoid is distinct from smoothness of its base; a common analytic chart is part of the admitted-family data. |
| `finite-analytic-coefficients` | verified | The finite projective representation includes analytic orbit maps and the canonical Banach topology; an integral stable lattice is extra data. |
| `coefficient-tensor-dual` | verified | Diagonal tensor action, contragredient action at the inverse group element and finite-projective completed scalar extension agree with the supplier scope. |
| `analytic-induced-coefficients` | verified | BP induction uses analytic Iwahori neighbourhoods of the closed subgroup M_1. Its Banach dual is distinguished from the projective distribution dual. |
| `algebraic-induced-comparison` | verified | The algebraic subrepresentation has the source highest-weight/dual twist; polynomial functions do not exhaust analytic induction. |
| `unitary-completed-coefficients` | verified | Ding’s definite-unitary single-place model retains the fixed away-from-place coefficient lattice, inverse equivariance, ordered limits and s≥1. The GL_3 all-place supplier is not substituted. |
| `unitary-jacquet-eigenvariety` | unverifiable | The target correctly asks for the full torus character variety and the Hecke spectral algebra of the coherent Jacquet dual. The additional construction is an explicit LR.6 request and recorded gap, not independently established here. |
| `unitary-eigenvariety-geometry` | unverifiable | Ding Proposition 4.14 has the stated n·d_K dimension and coherent-sheaf Cohen–Macaulay conclusion. The BHS local regularity/dimension input remains the precise recorded gap. |
| `unitary-eigenvariety-reduced` | unverifiable | The target retains the separate classical-density/local-geometry argument. Reducedness does not follow from Cohen–Macaulayness; its BHS inputs remain unverified supplier work. |

### OverconvergentAutomorphicForms:O1

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `right-automorphy-cocycle` | verified | The right cocycle, inverse representation action and gauge transport retain noncommutative order. Two actual cocycle examples now test the translated inverse identity and failure of reversed factors. |
| `equivariant-coefficient-sheaf` | verified | The sheaf is the actual analytic torsor equalizer with a separately specified integral lattice, using all-open coefficient descent rather than a set quotient. |
| `coefficient-descent-functoriality` | verified | Gauge change, tensor and dual operations use effective descent. Coarse stabilizers and integral averaging require their explicit hypotheses. |
| `analytic-line-effectivity` | verified | Heuer’s dense-open analytic result applies to lines; formal pro-étale unit-cocycle effectivity has a separate scope. No arbitrary-rank conclusion is inferred. |

### OverconvergentAutomorphicForms:O2

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `admitted-hilbert-domain` | corrected | Corrected the p=3,m=1 test to ε<1/9, excluding the endpoint. Other prime-dependent endpoints, ramified bounds and scaled Atkin–Lehner transport agree with T4/T5. |
| `hilbert-automorphy-factor` | verified | The left Hilbert factor cz+d is evaluated on the actual period coordinate; common admission controls the character and its inverse. |
| `hilbert-cocycle-law` | verified | Matrix multiplication gives j(γδ,x)=j(γ,δx)j(δ,x). The right adapter inverts both the group element and the coefficient. |
| `geometric-hilbert-sheaf` | verified | The independent rational equalizer uses the geometric tower and inverse weight; line effectivity follows through the ordinary formal tower and the imported analytic criterion. |
| `hilbert-level-radius-maps` | verified | Level/radius maps preserve the equalizer, including p-scaled Atkin–Lehner source radii and separate level-zero transport. |
| `hilbert-algebraic-specialisation` | verified | The supplied Hodge coefficient is recovered with the algebraic weight convention. A norm character is not confused with the trivial weight. |

### OverconvergentAutomorphicForms:O3

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `integral-hilbert-sheaf` | verified | The geometric O+ equalizer exists independently of local freeness. Its full-character positive-radius freeness assertion is explicitly conditional on the O5 gap. |
| `integral-rationalisation` | verified | On quasicompact inverse-image patches a finite denominator clears the pointwise bounds and preserves equivariance; no integral invariants/tensor interchange is used. |
| `hilbert-weight-pullback` | verified | Rational weight pullback and conditional integral pullback retain flatness/chart hypotheses; AIP Remark 3.15 prevents an unconditional integral base-change claim. |
| `fixed-radius-hilbert-forms` | verified | Sections retain level, radius, polarization and weight base. Naming their space makes no finite-rank or freeness assertion. |
| `overconvergent-hilbert-forms` | verified | The shrinking-radius colimit and LB topology are distinguished from restriction to the ordinary endpoint. |
| `ramified-modified-lattice` | verified | The actual modified lattice on the Igusa cover is imported from T5; the naive integral Hodge lattice and an integral embedding product are not substituted. |

### OverconvergentAutomorphicForms:O4

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `presentation-geometric-small` | verified | The small geometric cover and Γ0* equalizer are defined independently, with the source inverse-weight convention. |
| `presentation-geometric-full` | verified | The hybrid full cover, Γ0 action and coefficient equalizer are separate from the small geometric presentation. |
| `presentation-arithmetic-intermediate` | verified | The E(p^n) presentation uses the completed effective group, its full central-unit closure and quotient-stack/free-locus scope. |
| `presentation-arithmetic-full` | verified | The arithmetic full cover and PΓ0 presentation keep the determinant twist and full central-unit relation, on the supplier torsor domains. |
| `arithmetic-representatives` | verified | Norm congruence gives N(η)=1 for every unit η≡1 mod N, N≥4, including nonpositive units. Continuity extends cancellation to the full closure. |
| `geometric-full-cover-comparison` | verified | The contracted-product span is a Z_p× torsor. The diagonal action, rather than a scalar action, implements its small/full comparison. |
| `twisted-polarisation-action` | verified | The inverse polarization pullback and weight twist kill the square relation and factor through finite Δ(N), not profinite Δ(p∞N). |
| `finite-polarisation-descent` | verified | Actual finite twisted invariants identify the intermediate presentation without division by the group order; coarse assertions retain the free-locus condition. |
| `weil-pairing-comparison` | verified | Multiplication by w(eβ) inverse gives the full/intermediate map; its det(γ)x inverse law cancels the respective twists and preserves integral units. |
| `polarisation-class-forms` | verified | Only global totally positive p-units transport fractional ideals. The arithmetic quotient is indexed by narrow classes, not by arbitrary local units. |
| `polarisation-choice-independence` | verified | Composed transports and trivial arithmetic positive-unit stabilizers give canonical arithmetic independence; geometric comparisons retain their choices. |

### OverconvergentAutomorphicForms:O5

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `aip-independent-coefficients` | corrected | Corrected the proof to separate actual analytic O/O+ eigenfunctions from completed formal lattices. The finite-character node supplies the analytic equalizer, not integral tensor/base-change identification. |
| `aip-translation-valuation-units` | verified | Both character and inverse have valuation one on admitted frames, including finite p-primary values; translation preserves every valuation bound in both directions. |
| `aip-line-and-gluing` | unverifiable | The unit-eigenfunction and invariant-function criterion would give integral freeness on every open. The full-character positive-radius generator on the base remains the O5 gap; the split Igusa product alone does not provide it. |
| `geometric-aip-comparison` | verified | Rational frame comparison plus valued lifting/transitivity compares the two integral eigenfunction equalizers without presupposing freeness. T5 bounds and scaled source admission remain necessary. |
| `arithmetic-aip-comparison` | verified | The geometric frame map descends through the actual twisted arithmetic presentations with the inverse second AIP character; no averaging is introduced. |
| `aip-comparison-naturality` | verified | Compatible frame pullbacks give the weight, level and radius diagrams on their common comparison domain. |
| `aip-torsor-structure-invariants` | corrected | Corrected étale-local triviality versus an étale morphism and the base X(ε). Lifting first through an étale splitting cover, then through its unit section, justifies the residue-field and O+ criteria. |
| `finite-character-integral-generator` | corrected | Corrected the actual smooth weight product, integral base-change disclaimer and full Čech relation over X(ε). The split-product unit gives no integral pullback identification or positive-radius base freeness. |
| `aip-frobenius-restriction` | verified | AIP Theorem 6.7(3) and the canonical-quotient frame/Igusa maps give the restriction–Frobenius comparison, with the modified lattice and common radii retained. |

### OverconvergentAutomorphicForms:O6

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `hilbert-cusp-forms` | verified | The boundary ideal defines cusp forms independently of Koecher. The comparison transports the actual boundary ideal on the admitted domain. |
| `hilbert-koecher` | verified | The codimension-two extension is for g>1 via the ordinary locus; degree one uses the cusp chart. Extension is not cuspidality. |
| `tame-hilbert-hecke` | verified | The degree q+1 correspondence is q inverse times pull–identify–trace, retaining the polarization-component change. |
| `wild-hilbert-hecke` | verified | The degree q correspondence has an integral coefficient map, extra level ne+1 and directional radius gain; its rational normalization need not preserve O+. |
| `hilbert-diamond-operators` | verified | Degree-one level automorphisms use their coefficient transports; the central S operator remains a separate source operator. |
| `aip-hecke-equivariance` | verified | Actual isogeny/frame compatibility identifies coefficient maps before trace and retains comparison admission at source and target. |
| `hilbert-q-expansion-comparison` | verified | The boundary-compatible frame comparison uses the family expansion construction here and algebraic B5 specialization; it is not imported wholesale from tame algebraic q-expansions. |
| `fixed-cusp-banach-modules` | verified | The source arithmetic weight affinoid and global-Hasse cofinal refinement are retained. The projective Banach/property-(Pr) conclusion does not mean finite rank. |
| `compact-radius-restriction` | verified | Refined relatively compact Hasse affinoids give strict complete continuity over A, with finite A-generated approximating ranges. |
| `controlling-hilbert-operator` | verified | The product of partial operators with the ramification exponents improves all radii. A single partial U need not be controlling. |
| `controlling-complete-continuity` | verified | Factoring through a smaller radius and compact restriction gives complete continuity in the affinoid-module sense, not real/complex compact-operator theory. |
| `hecke-lattice-renormalisation` | verified | The integral coefficient map and unnormalized trace give sufficient denominator clearing. No minimal normalization or unscaled lattice preservation is asserted. |
| `cuspidal-coefficient-vanishing` | verified | AIP Theorem 3.17, Corollary 3.20 and refined Proposition 3.22 apply the separately stated cusp higher-vanishing theorem; the former unnamed cusp-cohomology request is no longer used. |
| `hilbert-cusp-higher-vanishing` | corrected | Corrected the proof to the U-equivariant toric split-power map of AIP CUSP Lemma 6.3/Proposition 6.4. AIP ADIC Theorem 8.2 supplies its torsion-line extension, including p-torsion; no finite étale trivialization or group-cohomology vanishing is used. |
| `padic-hilbert-q-expansion` | corrected | Corrected the target to the boundary-completed weight-line-valued series with its unit action and chosen Tate/Igusa frame. Injectivity uses every relevant finite ordinary Igusa component; failure of this sufficient condition alone does not prove noninjectivity on a descended eigenspace. |

### OverconvergentAutomorphicForms:O7

| Node suffix | Verdict | Independent assessment |
| --- | --- | --- |
| `ordinary-completed-functions` | verified | The precision inverse limit follows the finite-level direct limits, on actual formal affine patches and after sheafification. Reversing these limits is not allowed. |
| `ordinary-weighted-forms` | verified | Inverse weight equivariance is imposed after the ordered completion, with the weight lattice specified. No uniform finite-level descent is assumed. |
| `igusa-completion-comparison` | unverifiable | The approximation proof is valid under R_i=A_i° and the isometric analytic norm completion. Reduced reduction proves the discrete case, but not nondiscrete perfectoid base change; that exact missing input remains recorded. |
| `ordinary-restriction` | verified | Restriction uses the actual compatible ordinary charts and frames, preserving precision, level and the inverse-weight law. |
| `ordinary-coefficient-comparison` | unverifiable | The coefficient comparison follows conditionally from the structural completion and unit frame cocycle. The nondiscrete unit-ball gap is inherited, with no Hida control assertion. |
| `ordinary-hecke-expansions` | verified | Finite-level isogeny, boundary and trace diagrams pass through the specified ordered completion with their precision/level compatibility. |
