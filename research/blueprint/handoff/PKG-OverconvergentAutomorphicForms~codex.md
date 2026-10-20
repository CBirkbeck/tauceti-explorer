# Package handoff: OverconvergentAutomorphicForms

Complete package for #11515, job `PKG-OverconvergentAutomorphicForms~codex`.
Author: Codex, session `codex-qxltM1`, 20 October 2026. Branch:
`codex-qxltM1-overconvergent-automorphic-forms`. Claim confirmed by the claim bot
at 21:09:29 UTC, comment 6301540101. This run takes no second issue.

## Deliverables and coverage

The README is a nine-layer mathematical roadmap, with sources, exact supplier
contracts, named APIs, definition Checks, and Examples and Dependencies in every
layer. The suggested file keeps only real-bodied light definitions and signatures
on existing pinned carriers; it is not a formalization of the analytic geometry.
`metadata.toml` assigns `math.NT`.

The assembled root has 96 effective targets (four local refinements plus 92
imported targets). The accepted O0 part also contains five later additions not
listed in the root: AIP torsor structural invariants, finite-character integral
generator, AIP Frobenius/restriction, all-degree cusp higher vanishing, and p-adic
Hilbert family expansions. All 101 are accounted for in the table below. The
packets/readers were queried/read as inputs and left unchanged. No accepted target
was discarded for space or because its carrier is absent at the pins. Targets
owned upstream are supplied dependencies, with their applications retained here.

## What the README could not support from the weaker inputs

This is a complete roadmap package, not a claim that its theorems have been proved.
The following distinctions are explicit in the README so that no source or
supplier is credited with a stronger assertion than it establishes.

1. The established odd-prime Hilbert period-position estimate is strict.
   `hilbertPeriod_endpointExtension` names the additional equality-endpoint proof;
   it is not inferred by closure. The dyadic included endpoint is stated separately.
2. `hilbertPeriod_unsplitRamifiedGenerator` requires the unsplit integral canonical
   generator comparison. Generic embeddingwise splitting cannot prove it. The
   modified differential lattice is supplied by T5, not rebuilt as an eigenline sum.
3. A finite-character unit on the Igusa tower does not by itself produce an
   integral unit on its base. `finiteCharacter_integralBaseGenerator` and the
   formal-model comparison record the needed extra input, including its descent
   counit. Rational line invertibility alone is weaker. The annulus example in
   §5.3 distinguishes these conditions.
4. `ordinaryIgusa_powerBoundedModel` identifies the chosen completed formal rings
   with geometric spectral unit balls isometrically, also after the specified
   base extension. `ordinaryWeightedLattice_modelComparison` compares actual
   weighted lattices. Neither follows from a claim that O_Cp/p is reduced (it is
   not), from a limit's generic fibre alone, or from rational equality of lines.
5. Finite locally free descent is not a general Banach descent theorem.
   `coefficientFunctions_siteComparison` is the coefficient-specific analytic,
   v- and pro-Kummer-étale comparison for the actual normalized modules and Gauss
   lattices. Infinite-rank effectivity retains the specified locally trivial
   analytic/Banach descent setting; arbitrary coherence is not promised.
6. Full formal AIP coefficients are coherent and ordinarily invertible; the small
   universal formal line and rational invertibility have stronger conclusions.
   Integral base change retains its flatness/completion conditions. There is no
   integral finite-group averaging at a p-divisible index.
7. Cuspidal property-(Pr) and compact restriction require the actual cofinal
   global-Hasse affinoid cover and strict analytic radius improvement. They are
   not asserted from an unproved partial-Hasse affinoid assertion or at equal
   radii. Family Koecher needs d>1, normality and the specified boundary codimension.
8. The definite unitary dimension, depth and reducedness need arithmetic local
   regularity, finite-projective slope charts, componentwise accumulation of
   noncritical classical refinements and semisimplicity on the classical slope
   fibres. These have named targets in §0.7, with the actual local source arguments.
   Neither an arbitrary coherent Hecke sheaf nor a Cohen–Macaulay sheaf implies
   reducedness. The spectral operator's unnormalized sum is explicitly rescaled
   to Emerton's normalized average, including the refinement labels.
9. General toroidal towers are diamonds; perfectoid-space representability is
   limited to the supplier's actual cases. Bruhat local projectivity is rational
   and requires the specified finite-flat trivializing covers. The derived
   comparison is in all cohomological degrees on the stated finite unions of
   quasi-Stein opens, rather than on arbitrary opens.

The root's eleven recorded gaps and the parts' recorded requests are inherited
planning data. This package does not edit or purport to close them by changing
JSON statuses. In particular, the all-open scalar function gap is now covered by
current PerfectoidTowers P9.11 (see below); the remaining stronger applications
have their exact mathematical inputs named in the roadmap. The package does not
claim existing Lean implementations for any of these new analytic constructions.

## Moved-down notions and dependency direction

The Caraiani–Newton order does not place either
`LocallyAnalyticRepresentationsOfLocalGroups` or
`LocallyAnalyticDistributionsPartII` below this package. The accepted input used
LR.2/LR.6 and the latter distribution direction. They cannot remain upward
citations. Section 0.6 therefore owns the missing general foundations: analytic
vectors; admissible Banach and locally analytic representations; noncommutative
locally analytic distribution algebras and Fréchet–Stein presentations;
coadmissibility and duality; full locally analytic character spaces with the
noncompact central coordinates; essential admissibility; finite slope; and the
locally analytic Jacquet construction for **any parabolic of a connected
reductive group**, with its smooth and locally algebraic comparisons. The
higher roadmaps must import these notions from here. This is not a GL_n-only or
one-representation substitute. Section 0.4 likewise owns the required general
Levi analytic induction and the bounded-open-polydisc distribution version,
while consuming the lower locally analytic chart and Banach tools.

The general spectral machine remains in PadicFamilies. Section 0.7 owns its
arithmetic inputs and general-rank definite-unitary specialization with one
varying p-place and coefficients at every other p-place. CompletedCohomologyPartII
§8.5's rank-three specialization does not supply all of that application.
Classical coefficients and boundary results remain in AutomorphicBundles;
analytic-family boundary/expansion adapters belong here. General torsors,
canonical subgroups and period maps remain with their geometric suppliers.
ComputationalNumberTheory is not cited: numerical or explicit coefficient data
needed by a theorem are its hypotheses.

## Duplication audit and current upstream changes

Read-only current TauCetiRoadmap main: `0d144d044dacebca17b654695b6f1ad58f159b27`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Pinned elaboration: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The atlas input base is `22270899b7b46f2eebcbe280b44a9551f9b47323`.
No lake command was run in either read-only current checkout.

Object searches covered current roadmaps and Completed, the nine newer roadmaps,
the current Tau Ceti library and the pinned Mathlib. Statements of the used
library declarations were read. In particular, current AlgebraicVectorBundles
and LocalGaloisGroups were inspected, as were upstream AdicSpaces and
ReductiveGroups and the approved measures exemplar. These are the removals or
ownership corrections:

- Module tensor, dual, norm, finite/free base change and determinant identities
  are Mathlib, not new general algebra targets. Only their applications to the
  actual O_p and character map remain; the README names the exact declarations.
- Narrow-class-group finiteness and the existing highest-weight module/weight-cone
  theory are Tau Ceti. No new abstract highest-weight construction is proposed.
- Finite locally free sheaves, their tensor/dual operations and the geometric
  vector-bundle equivalence are AlgebraicVectorBundles L0B–L2B. The analytic
  coefficient compatibility assertions retain their new topology/lattice content.
- Classical automorphic bundles, highest-weight conventions, canonical/subcanonical
  extensions and classical Fourier/Koecher statements are AutomorphicBundles.
  Analytic families and their comparisons, not a second classical theory, remain.
- Canonical subgroups, modified differential frames, Hilbert period estimates and
  general Hodge–Tate torsors remain T3–T6 and PerfectoidShimuraVarieties.
- The accepted O8 graph-normalization, factor-composition, coordinate-composition
  and Hodge-frame transformation targets are already PerfectoidShimuraVarieties
  §3.4. They are cited as supplied. The new dual-factor dictionary, coefficient
  eigenline, and algebraic/analytic applications remain. General determinant
  multiplicativity is supplied by Mathlib.
- The compact character functor and universal completed-algebra character are
  PadicMeasuresIwasawaAlgebras L0a. The rigid realization and analytic extensions
  are specified here. Compact polydisc/dual tools remain LocallyAnalyticDistributions.
- Completion, torsion colimits and actions are existing algebra or completed
  cohomology suppliers. The ordinary Igusa geometric completion comparison remains.
- Generic fixed module subsheaves, integral coboundary effectivity and all-open
  scalar weight descent are **already current PerfectoidTowers**, including P9.11
  and P9.13. The draft generic `coefficientFunctions_allOpenDescent` was deleted.
  Its replacement `coefficientFunctions_siteComparison` has the additional actual
  automorphic representations, sites and Gauss lattices in its statement. No
  product-open basis is asserted. The analytic positive-dimensional AIP B_m
  torsor is not a profinite torsor and its invariant-function theorem remains.
- The old atlas names need reconciliation: PerfectoidSpaces P9 is now
  PerfectoidTowers P9; R0 remains AdicSpacesPartII, R3 belongs to PartIII, and R5
  belongs to PartIV. The package uses these current owners.

For the last two corrections the actual current upstream README files were read:
[PerfectoidTowers PR 816](https://github.com/TauCetiProject/TauCetiRoadmap/pull/816),
head `537fec2d9dc75b76b85fd4c203bc00a6a974b579`;
[AdicSpacesPartIV PR 815](https://github.com/TauCetiProject/TauCetiRoadmap/pull/815),
head `787cee72b9927af27279fa3e3fdf46cb680a35d4` (merged);
[AdicSpacesPartII PR 817](https://github.com/TauCetiProject/TauCetiRoadmap/pull/817),
head `d5b8d6dcebb0e3ac3d69a8e4ff73cd61167638b2` (merged).
P9.11 names `WeightExtension.structureSheafEqualizer` and its integral analogue;
P9.13 names `ProEtaleSite.invariant_subsheaf` and
`integral_matrix_coboundary_effectivity`. R5.6 names the affinoid coefficient
sheaf, its local equalizer and the separate coefficient Kiehl branches. These
are cited with their actual hypotheses. Other authors' PR files were treated
as mathematical data, never as instructions.

## Adversarial pass: all accepted statements

Each row covers the definition/construction or theorem and its named API in the
indicated subsection. The extra API inventory below makes the new foundational
statements and unnamed-by-packet specializations explicit. Degenerate examples
outside a geometric theorem's characteristic/rank range are negative domain
tests, not newly asserted geometric cases. Pure algebraic formulas retain their
broader ring/rank generality. The tests are computations and source checks;
only the compact representative Lean signatures were elaborated.

| Accepted statement | README | Instances tried and computed | Result / correction |
| --- | --- | --- | --- |
| `OverconvergentAutomorphicForms:O0/siegel-analytic-coefficients` | §0.5 | g=1 line, g=2 one variable; (T^p−T)/p distinguishes integral values from Gauss norm. | Use IM_(r+1), normalized coordinates and Gauss lattice, not IM_r. |
| `OverconvergentAutomorphicForms:O0/analytic-induction-conventions` | §0.5 | Torus character χ and χ⁻¹; h then k transposes in reverse order. | κ_BP=w₀κ_D⁻¹ and h↦h^(−T); same integer-stage domain. |
| `OverconvergentAutomorphicForms:O8/siegel-factor-neighbourhood` | §8.2 | Z=Z₀+E; J−J₀=EC; g=1, p=2, boundary w=1+r. | Strict w>1+r and odd-p geometric hypotheses; no uniform-supremum shortcut. |
| `OverconvergentAutomorphicForms:O4/effective-arithmetic-descent` | §4.2 | Trivial Δ; sign stabilizer; order-two group over residue F₂. | Actual torsor or stack, finite integral effectivity; no p-power averaging. |
| `OverconvergentAutomorphicForms:O0/units-at-p` | §0.1 | F=Q; split quadratic; ramified quadratic; p=2; zero/nonunit element. | Full integral tensor algebra; no integral product over embeddings. |
| `OverconvergentAutomorphicForms:O0/norm-at-p` | §0.1 | Scalar a has norm a^d; split (a,b) has ab; zero has norm zero. | Determinant specialization, continuous units, generic splitting only. |
| `OverconvergentAutomorphicForms:O0/principal-units` | §0.1 | r=0 full units; r=1 at p=2; positive depth and ramification. | Kernel of quotient-unit map, including the zero quotient at depth zero. |
| `OverconvergentAutomorphicForms:O0/geometric-weight-characters` | §0.2 | Trivial character; norm character; mixed exponents on split degree two. | Continuous characters; distinguish literal 1 from parallel weight one. |
| `OverconvergentAutomorphicForms:O0/arithmetic-weight-characters` | §0.2 | w=1, t=1 independently; rank-two exponents; zero ring units. | Product-character construction with separate coordinates and restriction laws. |
| `OverconvergentAutomorphicForms:O0/weight-dual-group-map` | §0.2 | x=1; x=2 in Q₅ gives (4,1/2); multiplicativity. | Inverse norm coordinate and continuous group map retained. |
| `OverconvergentAutomorphicForms:O0/weight-comparison` | §0.2 | Trivial arithmetic weight; w alone; t alone. | Pullback along (x²,N(x)⁻¹), on points and rigid spaces. |
| `OverconvergentAutomorphicForms:O0/weight-comparison-formula` | §0.2 | w=x^a,t=x^v gives 2a−v; split quadratic gives (2a₁−v,2a₂−v). | Sign fixed by independent-coordinate Lean tests. |
| `OverconvergentAutomorphicForms:O0/weight-comparison-norm-factor` | §0.2 | t=1 gives quotient 1; w=1 gives t(N)⁻¹; norm-one kernel. | Norm factorization rather than a claim of arbitrary character surjectivity. |
| `OverconvergentAutomorphicForms:O0/weight-comparison-totally-positive-units` | §0.2 | N=4 congruence; unit norm ±1; positivity and absence of positivity. | Congruence forces norm +1; positivity unnecessary for this norm assertion. |
| `OverconvergentAutomorphicForms:O0/weight-radius-parameter` | §0.3 | Trivial pro-character radius 0; finite high conductor; dyadic torsion. | Chosen pro-p basis, basis independence of max norm; dyadic depth two. |
| `OverconvergentAutomorphicForms:O0/continuous-character-bounded` | §0.3 | Uniform reduced algebra; trivial character; non-power-multiplicative norm. | Compact image and all powers/inverses imply norm exactly 1 in chosen norm. |
| `OverconvergentAutomorphicForms:O0/analytic-continuation-of-bounded-weights` | §0.3 | Point weight; high conductor; dyadic radius at depth one vs two. | Extension on a sufficiently small chosen neighborhood; no global analytic extension. |
| `OverconvergentAutomorphicForms:O0/bounded-weight-families` | §0.3 | Point; constant family; rational restriction; unbounded conductors. | Smooth base differs from smooth weight map; record common extension. |
| `OverconvergentAutomorphicForms:O0/finite-analytic-coefficients` | §0.4 | Zero, trivial line, two distinct characters; continuous nonanalytic action. | Finite projective topology plus actual analytic orbit maps and specified lattice. |
| `OverconvergentAutomorphicForms:O0/coefficient-tensor-dual` | §0.4 | Ranks 2×3=6; χ dual χ⁻¹; zero; nonflat coefficient map. | General module laws supplied; new assertions are analytic/lattice compatibility. |
| `OverconvergentAutomorphicForms:O0/analytic-induced-coefficients` | §0.4 | Torus line; SL₂ z^(k+1) outside algebraic degree-k subspace; nonopen M₁. | Genuine thickened group and positive action, compact-type limit, correct dual. |
| `OverconvergentAutomorphicForms:O0/algebraic-induced-comparison` | §0.4 | Rank-one character; finite factor at excessive conductor; product kernel 1⊗z−z⊗1. | Retain w₀κ twist and finite smooth character; injection rather than equality. |
| `OverconvergentAutomorphicForms:O0/unitary-completed-coefficients` | §0.7 | n=2, nontrivial other-p coefficients; zero multiplicity; order of limits. | General rank, one varying place, s≥1; integral free-orbit local regularity. |
| `OverconvergentAutomorphicForms:O0/unitary-jacquet-eigenvariety` | §0.7 | Characters equal on units but different on uniformizer; zero eigenspace. | Full T(K) character, actual analytic vectors, character inversion and Hecke labels. |
| `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-geometry` | §0.7 | n=2, [K:Qp]=1/2 gives dimension 2/4; module A/(f); zero rank. | Finite-projective charts and depth input named; no inference from coherence alone. |
| `OverconvergentAutomorphicForms:O0/unitary-eigenvariety-reduced` | §0.7 | A[ε]/ε²; classical points on only one component; index two. | Componentwise classical accumulation and semisimplicity explicit; rational normalization adapter. |
| `OverconvergentAutomorphicForms:O1/right-automorphy-cocycle` | §1.1 | Trivial group; noncommuting upper/lower unipotents; frame b=2. | Inverse factor and multiplication order fixed by matrix negative control. |
| `OverconvergentAutomorphicForms:O1/equivariant-coefficient-sheaf` | §1.2 | Identity torsor; ranks 0/1/2; sign stabilizer; infinite induction. | Specialize invariant subsheaf; separate finite descent from Banach effectivity. |
| `OverconvergentAutomorphicForms:O1/coefficient-descent-functoriality` | §1.2 | Identity/composite maps; trivial line tensor; χ dual; nonflat integral map. | Maps require intertwiners; tensor/dual isomorphisms require effective finite descent. |
| `OverconvergentAutomorphicForms:O1/analytic-line-effectivity` | §1.3 | Smooth rigid vs perfectoid base; dense open vs empty open; arbitrary O+ cocycle. | Heuer line criterion only, correct v2 locator; formal units and effective finite reductions. |
| `OverconvergentAutomorphicForms:O2/admitted-hilbert-domain` | §2.1 | ε=0; p=3 ε=1/12,1/9,1/3; p=2 endpoint 1/8; n=0/1/2. | Odd-p strict range; equality and unsplit ramified inputs are named extra targets. |
| `OverconvergentAutomorphicForms:O2/hilbert-automorphy-factor` | §2.2 | Upper unipotent factor 1; diag(a,d) factor d; lower unipotent 1+cz. | Unit on admitted subgroup/domain; not determinant or undefined zero denominator. |
| `OverconvergentAutomorphicForms:O2/hilbert-cocycle-law` | §2.2 | Two denominators 2,3 give 6; lower-unipotent variable dependence. | Left action convention and explicit right-action conversion. |
| `OverconvergentAutomorphicForms:O2/geometric-hilbert-sheaf` | §2.2 | Trivial character O; algebraic norm; n=0; perfectoid infinite base. | Finite smooth effectivity first; infinite sheaf pullback, not smooth-base criterion. |
| `OverconvergentAutomorphicForms:O2/hilbert-level-radius-maps` | §2.1–2.2 | n=2→1→0; AL₁ at n=0; ε target 1/100 at p=5. | Actual tower maps and scaled source radius; identity/composite laws. |
| `OverconvergentAutomorphicForms:O2/hilbert-algebraic-specialisation` | §2.3 | k=0,1,−1; distinct exponents in degree two; finite nebentype. | Actual Hodge frame comparison, dual powers and full character retained. |
| `OverconvergentAutomorphicForms:O3/integral-hilbert-sheaf` | §3.1 | Trivial character O+; lattice pO+ vs O+; inverse denominator. | Geometric power bounds and two-sided valuation units, not arbitrary tensor lattice. |
| `OverconvergentAutomorphicForms:O3/integral-rationalisation` | §3.1 | O+ and pO+ rationalize equally; non-quasicompact open unbounded denominators. | Local sheaf rationalization; no unjustified global sections localization. |
| `OverconvergentAutomorphicForms:O3/hilbert-weight-pullback` | §3.2 | Identity/composite weight maps; nonflat integral map; nonuniform norms. | Rational and integral hypotheses separated; no universal integral exactness. |
| `OverconvergentAutomorphicForms:O3/fixed-radius-hilbert-forms` | §3.2 | n=0/1/∞; trivial coefficient; restriction to smaller domain. | Actual H⁰ on finite/infinite objects; finite-level Banach property needs later hypotheses. |
| `OverconvergentAutomorphicForms:O3/overconvergent-hilbert-forms` | §3.3 | ε positive only; ε=0 outside index; common smaller positive radius. | Filtered colimit with explicit equality criterion; ordinary space not a colimit stage. |
| `OverconvergentAutomorphicForms:O3/ramified-modified-lattice` | §3.4 | Unramified split; ramified unsplit; ordinary Hdg=1. | Supplied modified lattice, not unchanged integral differential or eigenline decomposition. |
| `OverconvergentAutomorphicForms:O4/presentation-geometric-small` | §4.1 | Trivial character; n=0; central unit kernel. | Independent small geometric equalizer with actual effective deck group. |
| `OverconvergentAutomorphicForms:O4/presentation-geometric-full` | §4.1 | Full vs small tower; extra local units; trivial character. | Independent full equalizer; comparison is theorem, not definitional alias. |
| `OverconvergentAutomorphicForms:O4/presentation-arithmetic-intermediate` | §4.1 | Changing unit representative; Np(η)=1; finite Δ trivial/nontrivial. | Independent intermediate arithmetic relation and both coordinate characters. |
| `OverconvergentAutomorphicForms:O4/presentation-arithmetic-full` | §4.1 | Pairing variable; t nontrivial; p=2 roots-of-unity component. | Independent full arithmetic equalizer; retain pairing twist and full action. |
| `OverconvergentAutomorphicForms:O4/arithmetic-representatives` | §4.1 | η≡1 mod N; norm ±1; mixed global/unit representatives. | Norm-one cancellation and actual central kernel; arbitrary units not silently trivial. |
| `OverconvergentAutomorphicForms:O4/geometric-full-cover-comparison` | §4.2 | Trivial extra group; χ nontrivial; order-two integral coefficients. | All-open function descent plus explicit character-equivariant torsor maps. |
| `OverconvergentAutomorphicForms:O4/twisted-polarisation-action` | §4.2 | Positive unit; w nontrivial; two successive twists. | Weight-dependent inverse twist; group action verified before quotient. |
| `OverconvergentAutomorphicForms:O4/finite-polarisation-descent` | §4.2 | Δ=1; nontrivial fibre stabilizer; residue F₂. | Effective finite torsor/stack descent; N≥4 alone does not prove freeness. |
| `OverconvergentAutomorphicForms:O4/weil-pairing-comparison` | §4.3 | t=1; change pairing ζ↦ζ^a; a=2,3 product. | Independent Weil-pairing eigenfunction and inverse t factor; no formal relabeling. |
| `OverconvergentAutomorphicForms:O4/polarisation-class-forms` | §4.4 | Single narrow class; several classes; zero component. | Finite sum over actual narrow classes with integral version, not single representative. |
| `OverconvergentAutomorphicForms:O4/polarisation-choice-independence` | §4.4 | Identity change; two changes compose; unit representative. | Actual transport and inverse, compatibility with finite descent and pairing. |
| `OverconvergentAutomorphicForms:O5/aip-independent-coefficients` | §5.1 | Ordinary frame; nontrivial analytic character; torsor with no chosen section. | Independent analytic B_m-eigenfunctions and geometric O+ lattice. |
| `OverconvergentAutomorphicForms:O5/aip-translation-valuation-units` | §5.1 | κ=1; t=2 unit at p=5; t=p excluded. | Both κ(t) and its inverse power bounded; analytic unit alone insufficient. |
| `OverconvergentAutomorphicForms:O5/aip-line-and-gluing` | §5.1 | Ordinary formal invertibility; rational invertibility; torsion base change. | Full formal sheaf coherent, ordinary invertible; small universal formal line separate. |
| `OverconvergentAutomorphicForms:O5/geometric-aip-comparison` | §5.4 | Ordinary frame; finite character; ramified prime; scaled lattice. | Actual common torsor and integral generator, not two rational lines of rank one. |
| `OverconvergentAutomorphicForms:O5/arithmetic-aip-comparison` | §5.4 | Nontrivial t; finite Δ; changing pairing/polarization. | All four independent presentations; finite-character and integral inputs retained. |
| `OverconvergentAutomorphicForms:O5/aip-comparison-naturality` | §5.4 | Identity/composite changes; dense-open equality; nonflat integral map. | Uniqueness on actual reduced base and admitted restriction/base-change hypotheses. |
| `OverconvergentAutomorphicForms:O6/hilbert-cusp-forms` | §6.1 | Empty boundary; modular-curve noncuspidal constant; zero coefficient. | Kernel of boundary map/subcanonical sheaf, not an arbitrary vanishing-at-point rule. |
| `OverconvergentAutomorphicForms:O6/hilbert-koecher` | §6.1 | d=1 negative test; d>1 normal family; boundary codimension one. | Normal Igusa/family Hartogs input; higher-dimensional condition explicit. |
| `OverconvergentAutomorphicForms:O6/tame-hilbert-hecke` | §6.3 | Unit ideal degree 1; prime q degree q+1; prime square degree q(q+1). | General degree product and actual Norm(a)⁻¹ trace, not universal q+1. |
| `OverconvergentAutomorphicForms:O6/wild-hilbert-hecke` | §6.4 | p=2; ne=0→1; constant section; partial radius coordinate. | Actual level/radius changes and p-power normalized trace; no integral division asserted. |
| `OverconvergentAutomorphicForms:O6/hilbert-diamond-operators` | §6.4 | Identity; two units multiply; nontrivial character. | Actual tower transport, pairing and polarization compatibility. |
| `OverconvergentAutomorphicForms:O6/aip-hecke-equivariance` | §6.4 | Trivial coefficient; two-step correspondences; finite-character twist. | Coefficient pullback identification, trace and normalization compared on common span. |
| `OverconvergentAutomorphicForms:O6/hilbert-q-expansion-comparison` | §6.5 | Constant/positive coefficients; distinct cusp components; nontrivial coefficient line. | Independent family expansion, coefficient-line values and all cusp components. |
| `OverconvergentAutomorphicForms:O6/fixed-cusp-banach-modules` | §6.6 | Point weight; open affinoid U; infinite-dimensional analytic module. | Property-(Pr), not finite projective; actual global Hasse affinoid exhaustion. |
| `OverconvergentAutomorphicForms:O6/compact-radius-restriction` | §6.6 | r<R gives tails (r/R)^j; r=R identity on infinite module. | Strict smaller analytic radius yields relative compactness; identity generally not compact. |
| `OverconvergentAutomorphicForms:O6/controlling-hilbert-operator` | §6.7 | All prime factors; one partial U insufficient; exponents e>0. | Positive product of partial U's with full improvement cycle. |
| `OverconvergentAutomorphicForms:O6/controlling-complete-continuity` | §6.7 | Strict radius factorization; boundary radius equality; zero module. | Factor through compact restriction on property-(Pr) modules, not setwise compactness. |
| `OverconvergentAutomorphicForms:O6/hecke-lattice-renormalisation` | §6.7 | Trace degree p^d sends 1 to p^d; normalized U1=1; p=2. | Unnormalized integral trace vs p^(−d) normalization; κ-dependent lattice bound. |
| `OverconvergentAutomorphicForms:O7/ordinary-completed-functions` | §7.1 | Locally constant functions vs arbitrary continuous; OCp/p nilpotents; field vs DVR. | Complete lim_m colim_i torsion functions first, then invert; nonaffine sheaf version. |
| `OverconvergentAutomorphicForms:O7/ordinary-weighted-forms` | §7.2 | κ=1; nontrivial inverse weight; independent arithmetic t. | Actual completed equalizer and separate integral weighted model input. |
| `OverconvergentAutomorphicForms:O7/igusa-completion-comparison` | §7.3 | Fixed formal R_i vs A_i°; nondiscrete base; nonaffine open. | Isometric power-bounded model and density target, not automatic perfectoidization. |
| `OverconvergentAutomorphicForms:O7/ordinary-restriction` | §7.4 | Positive-radius representative; common refinement; ordinary form without overconvergence. | Well-defined map to completed ordinary forms; no all-ordinary surjectivity. |
| `OverconvergentAutomorphicForms:O7/ordinary-coefficient-comparison` | §7.4 | Formal unit cocycle; finite twist; distinct rationally equal lattices. | Independent AIP ordinary construction and exact integral model comparisons. |
| `OverconvergentAutomorphicForms:O7/ordinary-hecke-expansions` | §7.4 | U1=1; q coefficient on each cusp; two successive diamonds. | Torsion-level diagrams before completion; same normalization and coefficient lines. |
| `OverconvergentAutomorphicForms:O6/cuspidal-coefficient-vanishing` | §6.2 | i=0 and i>0; p-torsion line; F₂; finite order divisible by p. | All-degree boundary vanishing without dividing by torsion order; coefficient devissage explicit. |
| `OverconvergentAutomorphicForms:O8/graph-normalisation` | §Scope,8.1 | Z=0; rank one fractional formula; rank two noncommuting blocks. | Supplied by PerfectoidShimuraVarieties §3.4, no duplicate target. |
| `OverconvergentAutomorphicForms:O8/factor-composition` | §Scope,8.1 | Identity; two matrices; noncommuting factor order. | Supplied §3.4; coefficient application retains right cocycle order. |
| `OverconvergentAutomorphicForms:O8/coordinate-composition` | §Scope,8.1 | Translation; inversion swaps charts; zero denominator. | Supplied §3.4 with actual overlap, no globally defined fractional action. |
| `OverconvergentAutomorphicForms:O8/antidiagonal-dual-factor` | §8.1 | g=0 algebra; g=1; g=2 W swap, Z upper, C lower. | Dual is I+C^dual Z, not I+Z C^dual; Lean computes unequal diagonals. |
| `OverconvergentAutomorphicForms:O8/determinant-character-cocycle` | §8.1 | g=0 determinant 1; diag(2,3) determinant 6; trivial χ. | General determinant multiplication supplied; new application to actual chart factors. |
| `OverconvergentAutomorphicForms:O8/hodge-frame-transformation` | §Scope,8.1 | g=1 sign/dual; quotient-frame vs dual-Lagrangian frame. | Supplied §3.4; consume quotient-frame convention, not a second transformation theorem. |
| `OverconvergentAutomorphicForms:O8/determinant-frame-transformation` | §8.1 | g=1,2; factor diag(2,3); determinant vs repeated scalar. | Apply supplied Hodge frame and Mathlib determinant, not new determinant multiplicativity. |
| `OverconvergentAutomorphicForms:O8/scalar-coefficient-identification` | §8.3 | χ=1; g=1; χ nontrivial; full similitude unit. | Actual full inverse-diagonal group and all pairing components; fixed fibre has smaller group. |
| `OverconvergentAutomorphicForms:O8/determinant-hodge-specialisation` | §8.3 | m=0,1,−1; frame factor 2 gives coefficient 2^(−m). | All integer powers, including dual line; no confusion with full induced sheaf. |
| `OverconvergentAutomorphicForms:O8/algebraic-levi-specialisation` | §8.3 | Zero/trivial/rank-two representation; extra similitude character. | Finite algebraic representation comparison with supplied automorphic bundle. |
| `OverconvergentAutomorphicForms:O8/determinant-line-map` | §8.4 | χ=1; diag(2,3) gives 6; evaluate identity recovers a; g=0. | Real S-linear map and injectivity; local analytic χ not extended to all GL by decree. |
| `OverconvergentAutomorphicForms:O8/siegel-analytic-instance` | §8.4 | g=1 line; g=2 nonconstant coordinate; w=1+r boundary. | Normalized IM_(r+1) module, Gauss lattice and actual factor bound w>1+r. |
| `OverconvergentAutomorphicForms:O8/algebraic-induced-injection` | §8.4 | Dominant polynomial weights; m≥0; negative determinant line separate. | Injection, not equality; BP inverse-character/inverse-transpose dictionary. |
| `OverconvergentAutomorphicForms:O8/atkin-lehner-chart` | §8.5 | q=0 algebraic identity; q=1; q=2,z=3 gives [-6,1]. | Other chart first; Möbius value −1/(qz) only after invertibility. |
| `OverconvergentAutomorphicForms:O8/toroidal-coefficient-instance` | §8.6 | Finite rank vs infinite Banach; torus; general non-Hodge datum. | General tower diamond and actual reduction, no universal perfectoid-space assertion. |
| `OverconvergentAutomorphicForms:O8/toroidal-algebraic-comparison` | §8.6 | μ-central weight j=0,1; chosen Tate trivialization; nontrivial cyclotomic action. | Retain Qp(j) and transported action; common cone refinement for Hecke maps. |
| `OverconvergentAutomorphicForms:O8/supplied-domain-instance` | §8.6 | Identity reduction; torus line; datum with no canonical ordinary locus. | Associated analytic coefficients on supplied domain only; no generic canonical subgroup claim. |
| `OverconvergentAutomorphicForms:O8/bruhat-reduced-family` | §8.7 | n=0; m=n; m−n>m′−1 excluded; torus; mixed restriction-of-scalars example. | Exact BP root and 2ρ_nc shifts, projected subgroup, finite-flat rational projectivity, all degrees. |
| `OverconvergentAutomorphicForms:O5/aip-torsor-structure-invariants` | §5.2 | Trivial weight; ordinary frame; positive-dimensional analytic group. | Own all-open B_m invariant-function theorem; profinite P9 descent alone insufficient. |
| `OverconvergentAutomorphicForms:O5/finite-character-integral-generator` | §5.3 | Trivial character; conductor H; y²=T annulus irrational radius. | Actual tower unit and additional base-unit comparison; upstairs unit alone insufficient. |
| `OverconvergentAutomorphicForms:O5/aip-frobenius-restriction` | §5.5 | Ordinary v=0; v→v/p; two Frobenius steps; coefficient inverse. | Separate inclusion and Frobenius pullback, actual differential frame factor. |
| `OverconvergentAutomorphicForms:O6/hilbert-cusp-higher-vanishing` | §6.2 | i=0/1/all; torsion order p; char p; F₂ toric chart. | Monomial power-map splitting, not averaging by a p-divisible order. |
| `OverconvergentAutomorphicForms:O6/padic-hilbert-q-expansion` | §6.5 | F=Q; d>1; zero/nonzero positive coefficient; all components. | Family integral coefficient lines, admissible unramified cusp charts, injectivity/density conditions. |

## Additional general foundations and all named API statements

The following tests apply to every named statement in their respective rows,
with construction hypotheses retained under restriction and coefficient change.
This inventory also records APIs added to close the moved-down prerequisite
chains, rather than relying only on the 101 accepted target names.

| Statements | Instances / result | Correction |
| --- | --- | --- |
| `groupAnalyticDistributions`, convolution and Fréchet–Stein presentation | H={1} gives E; additive Zp gives δ_aδ_b=δ_(a+b); nonabelian H retains δ_hδ_k=δ_hk. | Convolution is noncommutative in general, not multiplication of scalar moments. |
| `frechetSteinStructure`, `coadmissibleModule`, stage recovery, kernel, cokernel, finite sum and independence | A=E gives finite-dimensional modules; zero system gives zero; arbitrary unrelated stage modules fail tensor recovery. Nonclosed subspace cannot be a Hausdorff quotient by decree. | Left modules, right-flat transition maps and specified Banach topologies; abelian category is a theorem. |
| `analyticVectors` and functoriality | Trivial group keeps V; C(H,E) has proper analytic-vector subspace; deeper-stage germ persists. | Locally convex colimit topology and actual orbit analyticity, not pointwise continuity alone. |
| `admissibleBanachRepresentation` and analytic-vector admissibility | H={1}: exactly finite dimension; closed equivariant subspace of C(H,E)^a qualifies; infinite trivial Banach space fails. | Closed topological embedding/finite distribution dual, not arbitrary algebraic embedding. |
| `admissibleAnalyticRepresentation`, coadmissible duality | C_la(H,E) dual is D_la(H,E); zero dual is zero; E²→E reverses arrows. | Compact-type category and contravariance explicit; no arbitrary LB-space equivalence. |
| `fullCharacterSpace`, product, naturality, Mellin injection and compact equivalence | Z={1}: point; Z=Z: G_m; K×: units plus uniformizer; split rank n has n noncompact coordinates. | Mellin is onto only in compact assertion; distinguish locally K-analytic and Qp-analytic dimensions. |
| `essentiallyAdmissibleRepresentation`, independence, abelianness and coherent duality | G=Z=Z: coherent O(G_m) need not be punctual; two distinct supports remain distinct; compact abelian case recovers compact theory. | Compatible two central actions and good integral-model tensor presentation required. |
| `finiteSlopePart`, evaluation, universal property, left exactness, character eigenspace | Generator 0 on E gives 0; generator a≠0 gives E; diag(0,2) gives second line; trivial Z gives V. | Universal equivariant maps from O(character space), not arbitrary projector union. |
| `positiveJacquetHecke`, representatives, multiplication and shrinking | Identity fixes; GL₂(Q₂), diag(2,1), index 2: normalized constant 1, sum 2. Changing coset representative acts identically on N₀-invariants. | Index inverse is rational, not integral at p-power index. |
| `locallyAnalyticJacquet`, M-action, independence, left exactness and essential admissibility | P=G gives V; zero gives zero; smooth V gives V_N; standard algebraic GL₂ gives W^N (first line) vs W_N (last quotient). | Any parabolic of connected reductive G; general analytic functor is left exact, not all unipotent coinvariants. |
| `unitaryJacquet_fredholmNormalization` and stage factorizations | Index 2 rescales a↦2a; adjacent αβ and βα have same nonzero spectral data. | Transport spectral coordinate and semigroup character; no patching variables or integral unit claim. |
| `unitaryJacquet_projectiveCharts`, dimension and depth | Rank 0 gives empty support; positive rank finite projective over regular weight algebra has full dimension; A/(f) fails model hypothesis. | Finite faithful Hecke image, componentwise finite surjectivity and module CM statement. |
| `unitaryClassicalPoints_accumulate`, `unitaryClassicalHecke_semisimple`, reducedness | Large separated algebraic weights at bounded slopes vs critical weights; A[ε]/ε² fails semisimple fibre test; one-component density insufficient. | Noncritical factorization, actual classical comparison and no embedded components all explicit. |

### Complete subsection API inventory

Each row includes every code-styled name in that subsection (including names
used in Checks). Its cases are the calculations in that subsection and the
corresponding accepted-statement rows above, rather than a claim that the mere
name list is a verification. This prevents subsidiary restriction, comparison,
action, lattice and change-of-weight promises from escaping the pass table.

| Subsection / statements | Cases and outcome |
| --- | --- |
| §0.1: `Op F p`, `compactSpace_Op`, `finrank_Op`, `normAlgebra F p`, `Algebra.norm`, `normUnits F p`, `Units.map`, `unitsToOp`, `norm_tmul_one`, `continuous_normUnits`, `normUnits_unitsToOp`, `normUnits_embeddings`, `Op`, `normAlgebra`, `normUnits`, `principalUnits F p r`, `mem_principalUnits_iff`, `principalUnits_antitone`, `open_finiteIndex_principalUnits` | F=Q; split quadratic; ramified quadratic; p=2; zero/nonunit element. Scalar a has norm a^d; split (a,b) has ab; zero has norm zero. r=0 full units; r=1 at p=2; positive depth and ramification. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.2: `GeomWeight F p R`, `ArithWeight F p R`, `ArithWeight.mk w t`, `arithWeight_restrict_left`, `arithWeight_restrict_right`, `arithWeight_mk_unique`, `hilbertWeightSpace`, `arithmeticWeightSpace`, `GeomWeight`, `ArithWeight.mk`, `ArithWeight`, `ArithWeight.mk w 1`, `ArithWeight.mk 1 t`, `weightDualMap`, `weightMap`, `weightMap_mk_apply`, `weightMap_norm_factor`, `weightMap_totallyPositiveUnit`, `Suggested.lean`, `congruence_unit_norm_one`, `weightMap_mk_congruenceUnit` | Trivial character; norm character; mixed exponents on split degree two. w=1, t=1 independently; rank-two exponents; zero ring units. x=1; x=2 in Q₅ gives (4,1/2); multiplicativity. Trivial arithmetic weight; w alone; t alone. w=x^a,t=x^v gives 2a−v; split quadratic gives (2a₁−v,2a₂−v). t=1 gives quotient 1; w=1 gives t(N)⁻¹; norm-one kernel. N=4 congruence; unit norm ±1; positivity and absence of positivity. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.3: `proWeightRadius`, `proWeightRadius_lt_one`, `continuousCharacter_eventuallyAnalytic`, `boundedWeightFamily`, `boundedWeightFamily.restrict`, `pullback`, `changeRadius` | Trivial pro-character radius 0; finite high conductor; dyadic torsion. Uniform reduced algebra; trivial character; non-power-multiplicative norm. Point weight; high conductor; dyadic radius at depth one vs two. Point; constant family; rational restriction; unbounded conductors. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.4: `finiteAnalyticCoefficient A H`, `coefficientTensor`, `coefficientDual`, `coefficientBaseChange`, `coefficientTensor_action`, `coefficientDual_eval`, `coefficientBaseChange_action`, `coefficientTensor_rank`, `finiteAnalyticCoefficient`, `analyticInduction M1 n κ`, `locallyAnalyticInduction`, `analyticInduction.iwahoriChart`, `leftAction`, `restrict`, `positiveAction`, `locallyAnalyticInduction.compactType`, `analyticDistribution`, `locallyAnalyticDistribution`, `analyticDistribution.projectiveBanach`, `locallyAnalyticDistribution.pairing`, `analyticInduction`, `restriction`, `algebraicInduction_injective`, `finiteCharacterInduction_comparison`, `inductionProduct` | Zero, trivial line, two distinct characters; continuous nonanalytic action. Ranks 2×3=6; χ dual χ⁻¹; zero; nonflat coefficient map. Torus line; SL₂ z^(k+1) outside algebraic degree-k subspace; nonopen M₁. Rank-one character; finite factor at excessive conductor; product kernel 1⊗z−z⊗1. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.5: `siegelAnalyticCoefficient κ r`, `siegelAnalyticCoefficient.integral`, `siegelTransposeAction h`, `siegelTransposeAction.mul`, `isometry`, `integralStable`, `radiusCompatible`, `siegelCoefficientProduct`, `siegelCoefficientProduct.equivariant`, `normBound`, `associative`, `siegelAnalyticCoefficient`, `siegelTransposeAction`, `bpSiegelInduction_comparison` | g=1 line, g=2 one variable; (T^p−T)/p distinguishes integral values from Gauss norm. Torus character χ and χ⁻¹; h then k transposes in reverse order. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.6: `groupAnalyticDistributions H`, `frechetSteinStructure A`, `coadmissibleModule A`, `groupDistributions_frechetStein`, `coadmissibleModule.stageRecovery`, `closedKernel`, `hausdorffCokernel`, `finiteSum`, `presentationIndependent`, `groupAnalyticDistributions`, `frechetSteinStructure`, `restriction`, `coadmissibleModule`, `analyticVectors V`, `analyticVectors.inclusion`, `localOrbitCriterion`, `functoriality`, `conjugation`, `admissibleBanachRepresentation`, `admissibleBanach_closedRegularEmbedding`, `analyticVectors_stronglyAdmissible`, `admissibleAnalyticRepresentation`, `admissibleAnalytic_duality`, `admissibleAnalytic_closedKernel`, `analyticVectors`, `fullCharacterSpace Z`, `fullCharacterSpace.product`, `fullCharacterSpace.compactMellinEquiv`, `essentiallyAdmissibleRepresentation`, `essentiallyAdmissible_independentH`, `admissible_implies_essentiallyAdmissible`, `essentiallyAdmissible_abelian`, `abelianDual_coherentSheaf`, `fullCharacterSpace`, `finiteSlopePart Zplus V`, `finiteSlopePart.evaluation`, `finiteSlopePart.leftExact`, `finiteSlopePart.characterEigenspace`, `positiveJacquetHecke m`, `locallyAnalyticJacquet P V`, `jacquet_MAction`, `jacquet_independentN0`, `jacquet_leftExact`, `jacquet_essentiallyAdmissible`, `jacquet_smoothComparison`, `jacquet_locallyAlgebraicComparison`, `finiteSlopePart`, `positiveJacquetHecke`, `locallyAnalyticJacquet` | Trivial group; zero/finite/infinite trivial modules; noncommutative Dirac products; noncompact Z=Z; diag(0,2) finite slope; P=G; algebraic invariants vs smooth coinvariants. See the general-foundations rows above. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §0.7: `unitaryCompletedCoefficient`, `unitaryCompletedCoefficient.localAction`, `tameHecke`, `integralLattice`, `localRegularity`, `unitaryJacquetCoefficients`, `unitaryJacquetCoefficients.coherent`, `unitaryCoefficientEigenvariety`, `unitaryEigenvariety_points`, `unitaryClassicalPoint`, `unitaryClassicalPoint.eigenvectorCriterion`, `locallyAlgebraicWeight`, `unramifiedTwist`, `unitaryEigenvariety_dimension`, `unitaryJacquetSheaf_cohenMacaulay`, `unitaryEigenvariety_reduced`, `unitaryJacquet_fredholmNormalization`, `unitaryJacquet_projectiveCharts`, `unitaryClassicalPoints_accumulate`, `unitaryClassicalHecke_semisimple` | n=2, nontrivial other-p coefficients; zero multiplicity; order of limits. Characters equal on units but different on uniformizer; zero eigenspace. n=2, [K:Qp]=1/2 gives dimension 2/4; module A/(f); zero rank. A[ε]/ε²; classical points on only one component; index two. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §1.1: `RightAutomorphyCocycle`, `rightCocycle_one`, `rightCocycle_inv`, `right_cocycle_of_left`, `rightCocycle_gauge` | Trivial group; noncommuting upper/lower unipotents; frame b=2. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §1.2: `analyticCoefficientSheaf q ρ J`, `analyticCoefficientSheaf.section_iff`, `restrict`, `map_intertwiner`, `gauge_equiv`, `pullback_map`, `coefficientFunctions_siteComparison`, `coefficientDescent_rank`, `coefficientDescent_tensor_iso`, `coefficientDescent_dual_iso` | Identity torsor; ranks 0/1/2; sign stabilizer; infinite induction. Identity/composite maps; trivial line tensor; χ dual; nonflat integral map. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §1.3: `denseOpenLine_analytic`, `formalUnitCocycle_analytic` | Smooth rigid vs perfectoid base; dense open vs empty open; arbitrary O+ cocycle. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §2.1: `HilbertCoefficientDomain κ n ε`, `hilbertDomain.restrict`, `forgetLevel`, `atkinLehner`, `hilbertPeriod_endpointExtension`, `hilbertPeriod_unsplitRamifiedGenerator`, `HilbertCoefficientDomain` | ε=0; p=3 ε=1/12,1/9,1/3; p=2 endpoint 1/8; n=0/1/2. n=2→1→0; AL₁ at n=0; ε target 1/100 at p=5. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §2.2: `hilbertFactor γ x = cz(x)+d`, `hilbertFactor_unit`, `hilbertFactor_analytic`, `hilbertFactor_leftCocycle`, `hilbertWeightFactor κ γ x = κ(j_γ(x))⁻¹`, `hilbertFactor`, `hilbertWeightFactor`, `geometricHilbertSheaf κ n ε`, `geometricHilbertSheaf.section_iff`, `locallyFree_one`, `levelPullback`, `radiusPullback` | Upper unipotent factor 1; diag(a,d) factor d; lower unipotent 1+cz. Two denominators 2,3 give 6; lower-unipotent variable dependence. Trivial character O; algebraic norm; n=0; perfectoid infinite base. n=2→1→0; AL₁ at n=0; ε target 1/100 at p=5. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §2.3: `hilbertAlgebraicSpecialisation` | k=0,1,−1; distinct exponents in degree two; finite nebentype. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §3.1: `integralHilbertSheaf κ n ε`, `integralHilbertSheaf.inject`, `integralHilbertSheaf.restrict`, `integralHilbertSheaf.rationalise`, `integralHilbertSheaf.locallyFree_one`, `integralHilbertSheaf` | Trivial character O+; lattice pO+ vs O+; inverse denominator. O+ and pO+ rationalize equally; non-quasicompact open unbounded denominators. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §3.2: `hilbertWeightPullback`, `integralHilbertWeightPullback`, `fixedRadiusHilbertForms κ n ε c`, `integralFixedRadiusHilbertForms`, `fixedRadiusHilbertForms.restrictRadius`, `changeLevel`, `weightMap`, `integralInclusion`, `restriction` | Identity/composite weight maps; nonflat integral map; nonuniform norms. n=0/1/∞; trivial coefficient; restriction to smaller domain. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §3.3: `overconvergentHilbertForms κ n c`, `integralOverconvergentHilbertForms`, `overconvergentHilbertForms.representative`, `eventualEquality`, `lift`, `cofinalRadius`, `restriction` | ε positive only; ε=0 outside index; common smaller positive radius. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §3.4: `hilbertModifiedCoefficient`, `modifiedCoefficient.frame`, `modifiedCoefficient.hodgeInclusion`, `modifiedCoefficient.ordinaryComparison` | Unramified split; ramified unsplit; ordinary Hdg=1. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §4.1: `smallGeometricCoefficient κ n`, `fullGeometricCoefficient κ n`, `intermediateArithmeticCoefficient w t n`, `fullArithmeticCoefficient w t n`, `section_iff`, `integralInclusion`, `radiusMap`, `levelMap`, `weightMap`, `smallGeometricCoefficient`, `fullGeometricCoefficient`, `intermediateArithmeticCoefficient`, `fullArithmeticCoefficient`, `arithmeticMultiplier_central`, `congruence_unit_norm_one`, `arithmeticAction_representativeIndependent`, `restriction` | Trivial character; n=0; central unit kernel. Full vs small tower; extra local units; trivial character. Changing unit representative; Np(η)=1; finite Δ trivial/nontrivial. Pairing variable; t nontrivial; p=2 roots-of-unity component. η≡1 mod N; norm ±1; mixed global/unit representatives. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §4.2: `geometricCoverCoefficient_comparison`, `twistedPolarisationAction ε`, `twistedPolarisationAction_factors`, `finitePolarisationDescent`, `intermediateArithmeticCoefficient_comparison`, `twistedPolarisationAction` | Trivial Δ; sign stabilizer; order-two group over residue F₂. Trivial extra group; χ nontrivial; order-two integral coefficients. Positive unit; w nontrivial; two successive twists. Δ=1; nontrivial fibre stabilizer; residue F₂. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §4.3: `pairingWeight_transform`, `weilPairingCoefficient_comparison` | t=1; change pairing ζ↦ζ^a; a=2,3 product. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §4.4: `arithmeticClassForms`, `polarisationTransport_comp`, `polarisationTransport_principalIdeal`, `arithmeticClassForms_finiteRepresentatives`, `arithmeticClassForms_choiceIndependent` | Single narrow class; several classes; zero component. Identity change; two changes compose; unit representative. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §5.1: `aipAnalyticCoefficient κ`, `aipIntegralCoefficient κ`, `aipCoefficient.eigencondition`, `integralInclusion`, `restrictChart`, `changeWeight`, `translationUnits`, `aipUniversalFormalLine`, `proWeightRadius`, `aipTranslation_valuationUnit`, `aipAnalyticCoefficient`, `aipIntegralCoefficient` | Ordinary frame; nontrivial analytic character; torsor with no chosen section. κ=1; t=2 unit at p=5; t=p excluded. Ordinary formal invertibility; rational invertibility; torsion base change. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §5.2: `aipTorsor_structureInvariants`, `aipTorsor_valuedPointLift`, `aipTorsor_reflectsBounds` | Trivial weight; ordinary frame; positive-dimensional analytic group. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §5.3: `aipFiniteCharacter χ`, `aipFullFormalCoefficient`, `finiteCharacterGenerator χ σ`, `finiteCharacterGenerator.unit`, `evaluate_section`, `change_section`, `finiteCharacter_integralBaseGenerator`, `aipFullIntegral_modelComparison`, `aipFiniteCharacter`, `finiteCharacterGenerator` | Trivial character; conductor H; y²=T annulus irrational radius. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §5.4: `geometricAip_comparison`, `geometricAip_integralComparison`, `arithmeticAip_comparison`, `aipComparison_natural` | Ordinary frame; finite character; ramified prime; scaled lattice. Nontrivial t; finite Δ; changing pairing/polarization. Identity/composite changes; dense-open equality; nonflat integral map. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §5.5: `aipFrobenius_restriction`, `aipFrobenius_iterate`, `aipFrobenius_weightMap` | Ordinary v=0; v→v/p; two Frobenius steps; coefficient inverse. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.1: `hilbertCuspSheaf κ`, `fixedRadiusHilbertCuspForms`, `overconvergentHilbertCuspForms`, `hilbertCuspSheaf.inclusion`, `cuspForms_boundaryKernel`, `cuspForms_radiusMap`, `cuspForms_weightMap`, `cuspForms_classDescent`, `hilbertCuspSheaf`, `restriction`, `hilbertFamily_Koecher` | Empty boundary; modular-curve noncuspidal constant; zero coefficient. d=1 negative test; d>1 normal family; boundary codimension one. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.2: `hilbertCusp_torsionHigherVanishing`, `cuspidalCoefficient_pushforwardVanishing` | i=0 and i>0; p-torsion line; F₂; finite order divisible by p. i=0/1/all; torsion order p; char p; F₂ toric chart. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.3: `tameHilbertHecke a`, `tameHilbertHecke.integral`, `cusp`, `radius`, `weight`, `level`, `classTransport`, `tameHilbertHecke_constant`, `tameHilbertHecke` | Unit ideal degree 1; prime q degree q+1; prime square degree q(q+1). Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.4: `wildHilbertHecke pfr`, `wildCoefficientMap.integral`, `uniformizerIndependent`, `wildHilbertHecke.partialRadiusImprovement`, `hilbertDiamond`, `hilbertDiamond.one`, `mul`, `inv`, `cuspStable`, `coefficientComparison`, `wildHilbertHecke`, `aipComparison_HeckeEquivariant` | p=2; ne=0→1; constant section; partial radius coordinate. Identity; two units multiply; nontrivial character. Trivial coefficient; two-step correspondences; finite-character twist. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.5: `familyHilbertQExpansion c`, `familyQExpansion_changeFrame`, `radius`, `level`, `weight`, `algebraicSpecialisation`, `familyQExpansion_injective`, `familyQExpansion_cusp_iff`, `aipComparison_qExpansion`, `familyHilbertQExpansion` | Constant/positive coefficients; distinct cusp components; nontrivial coefficient line. F=Q; d>1; zero/nonzero positive coefficient; all components. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.6: `hilbertCuspBanach U v`, `hilbertCuspBanach.propertyPr`, `hilbertCuspBanach.specialisationSurjective`, `hilbertCuspBanach_weightBaseChange`, `cuspRadiusRestriction`, `cuspRadiusRestriction_completelyContinuous`, `hilbertCuspBanach`, `restriction` | Point weight; open affinoid U; infinite-dimensional analytic module. r<R gives tails (r/R)^j; r=R identity on infinite module. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §6.7: `hilbertControllingOperator`, `controllingOperator_factorisation`, `hilbertControllingOperator_completelyContinuous`, `wildHecke_renormalizedIntegral`, `controllingOperator_renormalizedIntegral` | All prime factors; one partial U insufficient; exponents e>0. Strict radius factorization; boundary radius equality; zero module. Trace degree p^d sends 1 to p^d; normalized U1=1; p=2. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §7.1: `ordinaryCompletedFunctionsPlus`, `ordinaryCompletedFunctions`, `ordinaryCompletedFunctionsPlus.projection`, `complete`, `separated`, `torsionFree`, `ordinaryCompletedFunctions.action` | Locally constant functions vs arbitrary continuous; OCp/p nilpotents; field vs DVR. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §7.2: `ordinaryWeightedFormsPlus κ`, `ordinaryWeightedForms κ`, `ordinaryWeightedForms.section_iff`, `integralInclusion`, `weightMap`, `levelMap`, `arithmeticComparison`, `ordinaryWeightedFormsPlus`, `ordinaryWeightedForms` | κ=1; nontrivial inverse weight; independent arithmetic t. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §7.3: `ordinaryIgusa_completionComparison`, `ordinaryIgusa_completionComparison.isometric`, `ordinaryIgusa_powerBoundedModel`, `ordinaryWeightedLattice_modelComparison` | Fixed formal R_i vs A_i°; nondiscrete base; nonaffine open. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §7.4: `ordinaryRestriction`, `overconvergent_to_ordinary`, `ordinaryAip_comparison`, `ordinaryIgusa_powerBoundedModel`, `ordinaryWeightedLattice_modelComparison`, `ordinaryRestriction_Hecke`, `ordinaryRestriction_qExpansion`, `restriction` | Positive-radius representative; common refinement; ordinary form without overconvergence. Formal unit cocycle; finite twist; distinct rationally equal lattices. U1=1; q coefficient on each cusp; two successive diamonds. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.1: `HodgeTate.siegelGraphChart_act`, `HodgeTate.hodgeFrame_transform`, `antidiagonalDualFactor W A C Z = W(A+ZC)ᵀW`, `antidiagonalDualFactor_add`, `antidiagonalDualFactor_basisChange`, `antidiagonal_dual_factor`, `antidiagonalDualFactor`, `Suggested.lean` | g=0 algebra; g=1; g=2 W swap, Z upper, C lower. g=0 determinant 1; diag(2,3) determinant 6; trivial χ. g=1,2; factor diag(2,3); determinant vs repeated scalar. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.2: `siegelFactor_neighbourhood` | Z=Z₀+E; J−J₀=EC; g=1, p=2, boundary w=1+r. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.3: `siegelScalarCoefficient χ w`, `siegelScalarCoefficient.section_iff`, `radiusMap`, `weightMap`, `integralInclusion`, `siegelDeterminantHodge_specialisation`, `siegelAlgebraicCoefficient ρ w`, `siegelAlgebraicCoefficient_comparison`, `siegelScalarCoefficient`, `siegelAlgebraicCoefficient` | χ=1; g=1; χ nontrivial; full similitude unit. m=0,1,−1; frame factor 2 gives coefficient 2^(−m). Zero/trivial/rank-two representation; extra similitude character. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.4: `determinantLineMap χ`, `determinantLineMap_injective`, `determinantLineMap_translation`, `siegelAnalyticSheaf κ w`, `siegelIntegralAnalyticSheaf`, `siegelAnalyticSheaf.restrictRadius`, `changeWeight`, `coefficientMap`, `integralInclusion`, `siegelDeterminantLine_injective`, `siegelScalarCoefficient`, `siegelAlgebraicInduction_injective`, `siegelAnalyticSheaf`, `restriction` | χ=1; diag(2,3) gives 6; evaluate identity recovers a; g=0. g=1 line; g=2 nonconstant coordinate; w=1+r boundary. Dominant polynomial weights; m≥0; negative determinant line separate. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.5: `atkin_lehner_chart`, `siegelAtkinLehner_coefficientTransport` | q=0 algebraic identity; q=1; q=2,z=3 gives [-6,1]. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.6: `toroidalAnalyticCoefficient`, `toroidalCoefficient.section_iff`, `coefficientMap`, `radiusRestriction`, `levelPullback`, `commonRefinement`, `toroidalAlgebraicCoefficient_comparison`, `reducedDomainCoefficient`, `reducedDomainCoefficient.section_iff`, `changeRepresentation`, `pullback`, `changeReduction`, `algebraicComparison` | Finite rank vs infinite Banach; torus; general non-Hodge datum. μ-central weight j=0,1; chosen Tate trivialization; nontrivial cyclotomic action. Identity reduction; torus line; datum with no canonical ordinary locus. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |
| §8.7: `bruhatCoefficientFamily`, `bruhatDistributionFamily`, `bruhatCoefficientFamily.radiusMap`, `levelMap`, `changeCoefficient`, `bruhatDistributionFamily.radiusMap`, `bruhatCoefficient_algebraicInjection`, `bruhatCoefficient_finiteCharacter`, `bruhatCoefficient_locallyProjectiveBanach`, `bruhatCoefficient_cohomologyComparison` | n=0; m=n; m−n>m′−1 excluded; torus; mixed restriction-of-scalars example. Hypotheses are the displayed construction hypotheses; no universal-data assertion is inferred. |

## Lean signatures: variables, truth and equal generality

The file has no data-valued `sorry`, auxiliary synthetic carriers, theorem chains,
admitted examples, `True` placeholders or unused Tau Ceti imports. All instances
and definitions have real bodies. Layer comments follow upstream form. Exactly
thirteen theorem declarations are admitted; the warnings are only those admits.
The geometric/analytic definitions absent at the pins are named in one closing
comment and keep their full statements in the README.

| Kept declaration(s) | Variable audit and degenerate cases | README agreement |
| --- | --- | --- |
| `Op`, finite/free/topological instances, `compactSpace_Op`, `finrank_Op` | Any number field F, any prime p including 2; no total-real, unramified or splitting assumption. Positive degree follows from number-field hypotheses. | §0.1 states this algebraic generality, then adds total reality only for Hilbert geometry. |
| `normAlgebra`, `norm_tmul_one` | Full algebra, not just units; zero gives zero, scalar gives a^d; integrals map into Zp. | §0.1 determinant base change, not embedding decomposition over Zp. |
| `normUnits`, `continuous_normUnits`, `unitsToOp`, `normUnits_unitsToOp` | Restrict actual determinant homomorphism and tensor inclusion to units; η=1,−1 and degree-two examples. | Same actual maps; global integral norm is not replaced by an assumed positive norm. |
| `principalUnits`, `open_finiteIndex_principalUnits` | Every r:N including zero; quotient by p^0 is zero and its unit group is trivial, so kernel is top. | Explicit depth-zero README Check and proved Lean example. |
| `GeomWeight`, `ArithWeight`, `ArithWeight.mk` | Any topological commutative ring R; continuous unit-valued homomorphisms, coordinate restrictions and trivial characters. | §0.2 first defines character points this generally, then separately constructs rigid representatives. |
| `weightDualMap`, `weightMap`, `weightMap_mk_apply` | Source commutative units ensure x↦x² multiplicative; inverse norm, t=1 and w=1 independently. | §0.2 same continuous group map and 2a−v sign. |
| `congruence_unit_norm_one`, `weightMap_mk_congruenceUnit` | N≥4, integral congruence η≡1; field norm of global unit is ±1, congruence forces +1. No positivity required. | §0.2 and arithmetic representative cancellation use exactly this stronger algebraic statement. |
| `right_cocycle_of_left` | Arbitrary groups Γ,C, arbitrary Γ-set; K genuinely satisfies left cocycle. Trivial Γ, noncommutative C and inverse order. | §1.1 same conversion; theorem does not assert a cocycle for arbitrary K. |
| `antidiagonalDualFactor`, `antidiagonal_dual_factor` | Any commutative R and finite index n including empty; actual W²=I and W Zᵀ W=Z. Zero ring allowed. | §8.1 algebraic formula, with genus≥1 only for geometric application. |
| `determinantLineMap`, `determinantLineMap_injective` | Any commutative R,S and character R×→S×; any finite n including empty; evaluation at identity injects, also in zero S. | §8.4 algebraic map this generally, local analytic restriction is separate. |
| `atkin_lehner_chart` | Every commutative R, every q including zero and one, any finite n. Block identity needs no inverse. | §8.5 distinguishes this identity from a geometric group action and the chart formula requiring qZ invertible. |

Proved examples pin the norm specialization, the units inclusion, depth-zero
principal units, both independent weight coordinates, the noncommuting inverse
cocycle order, determinant line values, wrong dual-factor order and the
Atkin–Lehner sign q=2,z=3. The weight/cocycle/matrix examples test this roadmap's
kept definitions and conventions. Heavy torsor, analytic induction and Jacquet
normalizations have explicit computed README Checks; their geometric carriers
are absent at the pins, so they are not encoded with ad hoc weakened substitutes
in Lean just to manufacture an example.

## Source audit, versions and access

All writing is in the worker's own words, organized by the mathematical build,
not as a section-by-section source summary. Sources were read at the stated
locators, including hypotheses and relevant proofs. No verbatim passage, PDF,
source-text extraction or restricted-library file is committed. No restricted
book was needed. Public source data were fetched and read, never executed.
No suspicious instruction was encountered in the fetched source/PR data.

Read date for all entries: 20 October 2026. Hashes identify the exact public PDF
bytes used; locators use the printed pages of those versions.

| Source | Version / passages checked | SHA-256 | Public URL |
| --- | --- | --- | --- |
| bhw | AIF 73 (2023), 1709–1794; §§6–7 pp.1756–1765; §9 pp.1780–1788; §10 pp.1788–1792; period comparison pp.1751–1753. | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` | [PDF](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) |
| aip-adic | Hilbert_adicfinal author manuscript; §2.4 and Prop.2.8; §§4.1–4.8 pp.15–19; §6.5–6.7 pp.27–29; §8.2–8.5 pp.35–38. | `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd` | [PDF](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) |
| aip-cusp | AIP2 author manuscript, 35 pages; §3.13–3.27 pp.17–22; §4.1–4.5 pp.22–25; §6.2–6.4 pp.31–33. | `1f42b2c19b9542e937b6d02c244f71c7a1ef1d15840b8fab209950227269c406` | [PDF](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) |
| bp | 180-page revised HigherColeman manuscript; Thm.4.4.40 pp.79–80; §4.6.8–4.6.15 pp.92–95; §6.2 pp.148–153; §6.3 pp.153–154. | `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae` | [PDF](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) |
| ding | Published 2025 article PDF; §4.2.2 and Prop.4.14 with proof pp.66–67; references 14,20,21,25 followed to public versions. | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` | [PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) |
| drw | arXiv:2106.00094v3, 9 April 2026, 108 pages; §§2.3–2.5 pp.15–20; Defs.3.1.10,3.1.13,3.1.14 and Remark3.1.15 pp.23–25; §3.4 pp.37–38; Remark3.6.2 p.43. | `41ced4964ca50027e9fb93813047820a2853b9632fed221cbd5690be4d3294a8` | [PDF](https://arxiv.org/pdf/2106.00094v3) |
| heuer | arXiv:2012.07918v2, 5 May 2021; Cor.1.5 p.3 and Prop.3.8 p.15. Corrects the inherited Cor.1.4/p.16 numbering. | `7d07fca4f8fdf0fb80a49509b5116852a537b19e38fd6aa094adfd3b88ae261f` | [PDF](https://arxiv.org/pdf/2012.07918) |
| bhs1 | BHS1final author manuscript; Lem.3.10, Prop.3.11 and Cor.3.12 pp.23–26; Thm.3.19 pp.29–31; Cor.3.20 and complete proof pp.31–33; Prop.5.3 and analytic-stage proof pp.44–45. | `98c39b2d432ec418cbaf73f17e9d1cf56f3dca1701a2b1a663bbc1661791d026` | [PDF](https://math.univ-lyon1.fr/homes-www/schraen/BHS1final.pdf) |
| bhs2 | BHS2 author manuscript; Lemma3.8 p.24, finite projective regular-base model implies coefficient-module Cohen–Macaulayness. | `fd1427b20d7cdd70bb0fc09384347766f91098d0fb166561ba9400929afc63ab` | [PDF](https://math.univ-lyon1.fr/homes-www/schraen/BHS2.pdf) |
| breuil-ding | compaGL3 author manuscript; Lemma6.1 and proof pp.83–84, general n local integral regularity. | `41a0e1c2d3f4161d6664facd3e8c476345978bff5e84e717cc1e09f6b5f0d751` | [PDF](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compaGL3.pdf) |
| chenevier-jl | arXiv:math/0301032v1, 5 January 2003; §6.1, Prop.6.4 and Lem.6.5 pp.20–21. Published Prop.3.9 was not substituted for the actual version read. | `e691b2b4322a127ad0e7bb72c3294d23615b18ab1a2cb04d0bca1fbb1d38400f` | [PDF](https://arxiv.org/pdf/math/0301032) |
| emerton-analytic | 146-page author draft, 19 September 2011; §1.2 pp.22–27; Def.3.5.3 p.64; Cor.5.3.19 and Prop.5.3.22 pp.107–110; §6.1–6.2 pp.110–119; §6.4 pp.124–130. | `e123a87644ef29d96db71525903344307ac2d70f46dba3b82fd87100a49e3b79` | [PDF](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf) |
| emerton-jacquet | Ann. ENS39 (2006), 775–839; Def.3.2.1 and Props.3.2.4,3.2.6,3.2.8,3.2.12 pp.796–799; Defs.3.4.1–5 and Prop.3.4.6 pp.806–808; Thm.4.2.32 p.828; Props.4.3.4,4.3.6 p.834. | `c7d6eceaab1b49357851c0431838ad5ef2595b7db68d85d1d719fd2a7319206e` | [PDF](https://www.numdam.org/item/10.1016/j.ansens.2006.08.001.pdf) |

The outdated source-number references were reconciled against the exact public
versions rather than silently mixing page numbers. The Chenevier author-site
TLS hostname failed; it was not bypassed. The public arXiv version supplies the
same reducedness argument with Proposition 6.4/Lemma 6.5 numbering. No claim is
made to have read the differently numbered publisher PDF.

## Validation and submission

- All three input packets: `python3 scripts/check_blueprint.py` reports zero
  errors and zero warnings for each. The packet files are unchanged.
- `lean-check research/blueprint/packages/OverconvergentAutomorphicForms/Suggested.lean`:
  **exit 0**, thirteen `declaration uses sorry` warnings and no other warnings or
  errors, at the pinned shared build. Memory was checked before compilation;
  one compile at a time, no language server, no build/update/cache commands.
- Four-file intake check: **4 files, 0 problems**. The three package files and
  this handoff are the only deliverables. Whitespace checks pass for all new files; the staged diff
  is checked again before commit.
- PR submission uses `Refs #11515`, session attribution and validation results.
  The worker does not merge, close the issue, change labels or claim another job.

No implementation work remains within this packaging job. The independent
package review should first recheck the five late accepted additions, the
coefficient-specific site comparison against P9's current supplied scalar
statement, the exact finite-character integral generator input, and the general
Jacquet-to-unitary specialization and normalization in §0.7. All necessary
handoff information is here; no deleted scratch artifact is needed to resume.
