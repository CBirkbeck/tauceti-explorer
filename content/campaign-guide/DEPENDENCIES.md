# Campaign dependencies and implementation order

**September 15 navigation:** [the current implementation guide](IMPLEMENTATION_ORDER.md), current stage validation and contract register cover all 152 roadmaps. The Round02 route discussion below is retained for its detailed original-area ownership decisions; its earlier audit reports describe their own edition.

The manifest gives every canonical area's broad dependencies.
The qualified stage graph records explicit cross-area
handoffs, the original 65-stage ECD graph and reviewed internal stages. It is not
a complete formal dependency closure: every README's hypotheses and proof inputs
still apply. A directory-level cycle is often two comparisons at different stages,
not permission to assume a theorem while constructing its prerequisite.

Round-02 adds strict [stage resolution and coverage](GRAPH_AUDIT.md), canonical
aliases and the restored original K-pack unit graph with explicit readiness
checkpoints. STAGE_GRAPH_AUDIT.json reports
area-level strongly connected components and stages whose prerequisites are not
yet separately encoded. An acyclic graph is not a proof of mathematical completeness.

## Shared ownership contracts

| Theory | Canonical supplier | Important consumers |
| --- | --- | --- |
| Scalar number/local fields, adeles/ideles | Existing number-field/local-field roadmaps | AdelicAlgebraicGroups, arithmetic K, Iwasawa, Galois theory |
| Algebraic reductive groups | Existing ReductiveGroups | ReductiveGroupsPartII, ShimuraData, Langlands parameters |
| Local rational-point geometry/buildings | ReductiveGroupsPartII | Local representations, adelic levels, Hecke stacks |
| Algebraic spaces/moduli/coherent base change | AlgebraicModuliForArithmeticGeometry | Abelian schemes, Shimura, formal geometry, GAGA |
| Scheme étale cohomology/base change/ell-adic realization | Open PR196 suppliers | Arithmetic Galois realizations, scheme K-theory, analytic comparisons |
| Scheme exceptional pullback, duality, cycle maps and perverse/IC theory | EtaleDualityAndPerverseSheaves | Weil theory, ET.2a, Satake and Igusa applications |
| Scheme nearby/vanishing cycles, Lefschetz pencils and Picard–Lefschetz | LefschetzPencilsAndVanishingCycles | DeligneWeightsAndPurity, R34 and specialized boundary consumers |
| Deligne purity and mixed weights | DeligneWeightsAndPurity | WeilConjectures, R34 applications and late IC/decomposition |
| Finite-field Weil-conjectures assembly and numerical consequences | WeilConjectures | Point counts, curves and source-qualified Frobenius-factor interfaces |
| General enhancements/animated categories | EnhancedDerivedSheaves | Spectra, sheaf operations, patching, Habiro cohomology, FS |
| Spectra and stable homotopy | StableHomotopyKTheory | K-theory, trace methods and spectral module models |
| Continuous/compact cohomology and global duality | ArithmeticGaloisDuality | Deformations, Selmer complexes, diamond dimension bounds |
| Finite-flat/p-divisible groups and integral Hodge classification | FiniteFlatGroupsAndIntegralPadicHodgeTheory | Abelian schemes, local deformation rings, PA Fontaine–Laffaille branch |
| Rational periods and p-adic Hodge comparison | PadicHodgeTheory | Regulators, Galois realizations, local deformation conditions |
| Generic finite-quotient/profinite ordinary projector | PadicFamilies:L0a | GL₂ ordinary towers, higher-rank PA.2 after verifying convergence hypotheses |
| General completed/derived arithmetic tower cohomology | CompletedCohomologyPartII:CC.0–8 | ALS.6 reexports, TC.2, GL₂/Q_p R31 specialization; ALS.0–4 and ALS.5:finite-level-duality are early inputs, not the full spectral comparison |
| Van Est and invariant forms | AutomorphicFormsOnReductiveGroups:AF.1a | BorelRegulators:R.2, arithmetic cohomology comparison |
| Weil restriction and Deligne torus | ReductiveGroupsPartII:RG2.0a | ShimuraData:D0, adelic restriction-of-scalars comparisons |
| Herr/ψ and Perrin–Riou Iwasawa theory | PhiGammaModulesAndIwasawaCohomology | Iwasawa control, p-adic regulators, Coleman and Kato consumers |
| Metaplectic covers and half-integral-weight forms | MetaplecticAutomorphicForms | Quadratic-twist nonvanishing and rank-zero/one BSD route |
| Higher-weight generalized Heegner cycles | GeneralizedHeegnerCycles | Source-qualified multiplicative BSD branch and local-condition comparisons |
| Finite-level arithmetic cohomology/boundary complexes | ArithmeticLocallySymmetricSpaces | Completed cohomology, ordinary towers, torsion and patching |
| Polynomial laws, determinants and integral congruence algebra | IntegralHeckeAndGaloisDeterminants | Torsion, deformations, Iwasawa/Eisenstein congruences |
| Abstract commutative/derived patching | DeformationAndDerivedPatchingAlgebra | GL₂ lifting, ordinary lifting, potential automorphy |
| Geometric torsion comparison with nilpotent control | TorsionCohomologyInfrastructure | General-rank arithmetic determinant/local-condition interfaces |
| Compactified Igusa geometry and generic concentration | IgusaVarietiesAndTorsionConcentration | Potential-automorphy degree shifting |
| Transfer and unitary trace comparison | EndoscopicTransferAndUnitaryTraceComparison | Igusa genericity, higher-rank global Galois geometry |
| Cotangent complexes and algebraic derived completion | DerivedDeRhamCohomology | Crystalline/prismatic cohomology, animated deformation theory, Habiro comparisons |
| PD envelopes, crystalline sites and crystals | CrystallineCohomology | A_inf/prismatic comparisons and integral p-adic Hodge applications |
| Integral A_inf cohomology and BKF module comparison | AInfCohomology | Integral étale/crystalline/de Rham comparison and regulators |
| Relative prisms, prismatic complexes and Nygaard/Frobenius | PrismaticCohomology | CohomologyComparisons and qualified q-prismatic/Habiro charts |
| Coherent diagram of cohomology comparisons | CohomologyComparisons | Transport between the constructed theories, not duplicate comparison proofs |
| Relative Habiro rings and coefficient interfaces | HabiroRings | Number-field/relative specializations and HabiroCohomologyFoundations |
| Abstract Euler/Kolyvagin/Stark descent | EulerSystemsAndKolyvaginSystems | Cyclotomic, Kato and Heegner applications; no upstream BSD assumption |
| Canonical elliptic heights, Selmer/Sha and isogeny invariance | Existing EllipticCurves | Gross–Zagier normalization bridge and RankZeroOneBSD |
| Arithmetic-height formula and actual Heegner classes | GrossZagierAndArithmeticHeights; HeegnerPointEulerSystems | Rank-zero/one rank equality, finite Sha and qualified p-part identities |

## Suggested construction waves

### Repair-edition scope gates

The CM/unitary torsion branch uses ET/AG2's specified Shin route. The totally-real
symplectic realization retains an explicitly conditional external Arthur input;
the selected unitary trace machinery does not prove the twisted weighted
fundamental lemma. TC's abstract determinant-factor algebra stays general.

SR.2a/3a construct complex second adjointness and uniform admissibility before
Bernstein-center applications. SR.6 is a **late integral strengthening** using
FS excursion-center theory; it is not an FS prerequisite. Huber's H1 valuation
nearby-cycle theory owns the nondiscrete base seam, with LPV's trait comparison.

The classical GL₂ path currently elects to use the full general ET/local-Langlands
engine; it is mathematically staged but expensive. The general norm-residue,
resolution, trace/stabilization and geometric Satake engines likewise remain
substantial projects, not low-cost bridge lemmas. Do not advertise a small
first implementation merely because a stage-level graph is acyclic.

### Weil extension: required early/late split

Use the existing PR196 finite-level/compact-support/trace foundations, then
EDC.0–4 and LPV.0–5 for duality, weak Lefschetz, pencils and monodromy. These
feed DWP.4's original smooth-projective RH proof. DWP.7–8 supply the general
weight/invariant-cycle inputs; DWP.9 proves absolute hard Lefschetz, followed
by the late EDC.7 IC/decomposition stage. EDC.5 is early perversity and does
not import its own late decomposition theorem. EDC.8's functional-equation
interface uses early duality only, despite its numerical position in the file.
Within early duality, use EDC.1:adjoint → EDC.2:trace-purity →
EDC.1:biduality → EDC.2:pairings, not a whole-chapter 1→2 order.

WC.1 rationality and WC.2 duality do not consume full RH; WC.3's individual
integral ell-independent factors do. R34 and ET.2a reexport their corresponding
suppliers instead of reconstructing them. The staged graph must retain this
order, particularly the return from general weights to later invariant cycles
and decomposition. Folder-level acyclicity is not the criterion.

### Existing campaign waves

These are parallel work packages, **not whole-directory completion barriers**.

1. Stabilize common APIs against current upstream and open suppliers. In parallel,
   construct early algebraic moduli, continuous cochains, categorical enhancements,
   local group topology, measures/distributions and cyclotomic completion algebra.
   Check finite groups, finite fields, tori and ordinary module projectors first.
2. Build independent structural engines: spectra and exact K-theory; formal/adic
   and perfectoid geometry; local smooth representations; rational/integral p-adic
   Hodge theory; finite-level arithmetic complexes; general deformation algebra.
   Low-degree symbol presentations can start before their higher-K comparison.
3. Construct arithmetic and geometric realizations: modular-curves Part II,
   abelian/PEL/Hilbert geometry and canonical Shimura models; scheme/motivic
   K-theory, regulators and integral Iwasawa control; diamond cohomology and six
   operations; automorphic forms, reduction, Eisenstein and spectral analysis.
4. Prove comparison-intensive theory: perfectoid Shimura towers, Hodge–Tate maps,
   Igusa compactifications and concentration; unitary transfer and trace comparison;
   characteristic-zero higher-rank Galois constructions; integral Hecke determinants;
   cohomological comparison; Euler-system and p-adic family machinery.
5. Assemble the reusable arithmetic integrations: Scholze torsion infrastructure,
   Fontaine–Laffaille/ordinary degree shifting and derived Ihara avoidance; general
   Selmer/main-conjecture applications and source-preserved modularity endpoints.
   In parallel continue Habiro cohomology/refined traces and the relative
   Fargues–Fontaine vector-bundle/Bun_G construction.
6. Complete the geometric local Langlands chain: lisse sheaves on v-stacks,
   geometric Satake and fusion, Hecke stacks/local shtukas, parameter stacks,
   excursion operators and spectral action, with the source's coefficient regime.

The integral-cohomology branch begins early: animated algebra precedes cotangent
complexes/derived completion, then derived de Rham and PD/crystalline theory;
perfectoid geometry supplies the A_inf/pro-étale route. Relative prismatic
cohomology is independently constructed from prisms and descent. Comparisons
are later arrows between those objects, not assumptions defining either side.
q-prismatic charts used by Habiro theory are source-qualified special cases.

The BSD branch can proceed in parallel with FS: existing elliptic arithmetic and
modular-curves geometry feed heights/CM points; actual norm-compatible Heegner
classes feed general Kolyvagin descent; Gross–Zagier and auxiliary-twist
nonvanishing give the analytic-rank-zero/one consequences. Sharp p-part BSD
identities form a later branch and do not supply a premise of the basic
rank/finite-Sha proof. Arithmetic rank 1 alone is not replaced by analytic rank 1
without the separately stated converse hypotheses.

The waves are planning guidance. A late application never licenses omitting the
explicit proof of an early supplier. Long engines such as the fundamental lemma,
GAGA or spectral decomposition should be subdivided further during later review.

## Important staged returns

| Earlier construction | Intermediate consumer | Later return |
| --- | --- | --- |
| K₂ symbols T.1–T.6 | Motivic/étale comparison M.3–M.5 | K₂ comparison T.7 |
| Borel stable cohomology R.1–R.3 | Arithmetic K finite-generation/rank N.3–N.4 | Regulator lattice/covolume R.4–R.7 |
| Finite cyclotomic units and index | Coleman norms/power series | Infinite tower exact sequence and Iwasawa comparison |
| Ordinary/noncritical symbols | Family/eigencurve construction | Critical/secondary specialization |
| Abstract enhancements E0/E5 | Spectra H.5 | Spectral module realization of enhanced categories |
| Topological complexes ALS.1 and de Rham maps | Franke comparison AS.5 | Full arithmetic/automorphic comparison ALS.5 |
| Early Shimura quotient/canonical models | PEL/Hilbert realization and compactifications | General comparisons and perfectoid towers |
| Relative FF curve RF0–RF3 | Definition of Bun_G BG0 | RF4 G-torsor transfer |
| Positive basic Banach–Colmez examples and projectivized properness | Vector-bundle classification VB2 | General Banach–Colmez conclusions VB3 |
| Bun_G geometry BG3 and sheaf descent VS1 | Newton-stratum recollement BG4 | Later lisse-category glueing VS4–VS5 |
| Animated algebra in EDS E5, before cotangent suffix | DD.0 cotangent and DD.1 derived completion | EDS cotangent/coefficient-completion applications |
| Classical/relative Habiro coefficient rings | q-Hodge/Habiro cohomology construction | Ring-to-cohomology specializations and coherent comparisons |
| Selmer conditions and general ES descent | Cyclotomic/Kato/Heegner class construction and verification | Application bounds, nonvanishing and separately justified equalities |

The exact branch orders appear in the metadata and
[diamonds dependency guide](DIAMONDS_DEPENDENCY_ORDER.md). ECD's unusual early
endpoint ordering and forbidden later prerequisites are retained, not replaced by
the chapter order of the paper.

## Noncircular arithmetic routes

Characteristic-zero Galois representations used to interpolate torsion systems
must be constructed independently of those torsion systems. The higher-rank
Galois Part II separates the polarized/cohomological route from the general
regular-algebraic interpolation route and records what compatibility each proves.
The Igusa trace argument imports an appropriate characteristic-zero package and
local GLₙ/inner-form correspondence, not FS's later semisimple parameter map.

Potential automorphy consumes the specialized generic concentration theorem; it
does not assume arbitrary torsion cohomology vanishes. Its ordinary functor in
characteristic p is not the exact ell-not-p Jacquet functor. Ultrapatching fixes
an ultrafilter and proves the specified transition-map independence, not a general
canonical independence from every ultrafilter choice.

## Validation scope

Integration validation checks all 91 input
destinations, metadata owners and cycles in the **encoded** graph. It cannot prove
that an informal hypothesis is supplied or that an omitted mathematical lemma is
unnecessary. The independent audit supplies
the complementary human-readable check and motivated the additional Igusa,
endoscopy and higher-rank Galois owners.
