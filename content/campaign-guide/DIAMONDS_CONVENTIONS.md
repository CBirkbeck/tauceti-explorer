# Shared conventions for diamonds and geometric local Langlands

The ten roadmaps for Peter Scholze's *Etale cohomology of diamonds* (ECD) retain all
numbered constructions and results of §§2–27 of the supplied
14 April 2026 revision. ECD Questions 21.4 and 24.7 remain questions; no conjectural statement
is a proof obligation. The eight Fargues–Scholze successors supply reusable geometric,
categorical and representation theoretic infrastructure, with the actual hypotheses of the
356-page accepted manuscript. They do not assert a full categorical local Langlands equivalence.

Fix a prime p. General perfectoid Tate rings and explicit integral plus subrings are required;
an ambient perfectoid coefficient field is not imposed globally. Completeness includes
Hausdorffness. Reuse the adic carriers, valuations up to equivalence, rational localizations
and absolute Q_p Fargues–Fontaine curve of upstream AdicSpaces.

Diamonds are sheaves of sets admitting the specified perfectoid pro-étale relation; small
v-stacks retain groupoid automorphisms. These are distinct from stable infinity categories
of coefficients. Cutoff-site enlargement and its comparison functors require proofs; universe
polymorphism alone does not establish them. All enhanced categories use the quasicategory
and dg-nerve model of EnhancedDerivedSheaves, shared with algebraic K-theory.

For ECD, D_et is left completed and the main symmetric monoidal six operations use a
commutative coefficient ring annihilated by an integer prime to p. Exceptional operations
require a compactifiable morphism representable in locally spatial diamonds and locally of
finite dim.trg. Compactifiable means open immersion followed by partially proper.
For a cartesian square, the projection formula places A on the base and B on the source:
Rf!(B tensor^L f*A) = Rf!B tensor^L A. All functorial identities include coherent natural maps.
Adic coefficients require the explicit derived completion conditions in AdicCoefficientsAndComparisons.
Prime-to-p statements never implicitly extend to p-adic coefficients.

For Fargues–Scholze, E is a nonarchimedean local field with residue F_q, of either
characteristic. Use Perf over an algebraic closure k of F_q for Bun_G and geometric strata;
record Weil descent to F_q separately. G is a connected reductive E-group and need not be
split or unramified. ReductiveGroupsPartII owns arithmetic forms and the pinned dual/L-group;
SmoothRepresentationsOfLocalGroups owns abstract smooth representation categories. Fix the
Frobenius generator and the q-power Frobenius on period rings explicitly. Semilinear descent,
geometric Frobenius, and arithmetic reciprocity conventions require comparison lemmas.

Torsion étale categories, derived adic categories, solid categories D_solid and lisse categories
D_lis are separately constructed and related by specified functors. Rational coefficients
use localization after the integral construction and the lisse/solid comparison, not an
unjustified interchange of inverse limits and inversion of ell. Fix ell different from p.
When a half Tate twist occurs, include a chosen square root of q in the coefficient ring.
Integral spectral action retains ell not dividing the torsion order of pi_1 of the dual group;
its rational coefficient version does not impose that particular restriction.

## Ownership and ordering adjustments to the preserved ECD graph

AdicSpacesPartII owns the completed tensors and ordinary finite/étale/smooth morphism,
diagonal, properness, analytification and formal geometry previously requested in A0–A2.
AdicEtaleGeometry A0 and A2 are now import/comparison contracts; its A1 owns the sites and
generalized presentations, A3 the diamond-independent nonnoetherian approximation, A4 the
analytic cover construction. The PartII sousperfectoid endpoint is a later consumer of P1–P3,
not an early prerequisite for them. This retains the original milestone order without a cycle.

PerfectoidSpaces is the sole owner of Shimura PerfectoidGeometry. Its P7–P9 add tilde-limits,
finite quotients including p-power groups and structural/coefficient torsor descent. Diamonds
and v-stacks belong to DiamondsAndVStacks; tower geometry belongs to
PerfectoidShimuraVarieties, never to a second perfectoid carrier.

EnhancedDerivedSheaves E5 owns common monoidal enhancement and animated algebra foundations;
DerivedDeRhamCohomology DD.0–1 owns generic cotangent complexes and derived completion;
PrismaticCohomology PR.0–2 owns the general prism construction. Q0–Q2 import these
and retain the perfectoid applications. E4 and E5:cotangent-export are reexports.
The ECD graph's original Q0 algebra paragraph is therefore a use/comparison obligation,
not duplicate ownership. E5:abstract/animation are early branches; presentability and
the later cotangent/spectra returns have their own dependencies, not one blanket E5 input.
StableHomotopyKTheory owns the concrete spectra models. LanglandsParameterStacks owns the
actual derived mapping stack and its algebraic representability proof.

The historical scheme supplier CohomologicalPointCounting is an external roadmap contract,
not a claim of implementation. Its finite/Noetherian bounds remain in force; L2 owns the
qcqs and coefficient extension, L5 the general-dimensional alterations. If the global campaign
assigns these prerequisites a more general canonical owner, the comparison with that owner
must preserve these exact contracts. Numbered references and hashes are recorded in the
reference manifests; source ownership is not evidence of a proved theorem.

ArithmeticGaloisDuality R02.1–R02.2 is the sole general owner of all-degree continuous
Hochschild–Serre and compact/discrete comparisons, extending the actual upstream
ProfiniteCohomology carrier. DiamondEtaleCohomology C8 imports its discrete torsion
specialization and proves the diamond quotient/dimension application. The copied ECD
dependency graph records this campaign adjustment as PROFINITE_COH_PLUS.

Round-2 ordering fences: RF0:integral-Y/RF2:integral-divisors retain the Witt special
fibre. GS0:Schubert-smoothness supplies BG2:smooth-Artin independently of GS4 and
EDC.7/DWP.9. GS4:rational-reductivity is the late decomposition input, never an
assertion of integral semisimplicity. ES5 constructs the semisimple parameter class
over every algebraically closed field of characteristic different from p; its
coefficient range is not narrowed to ES3's integral spectral-action range. ES6–ES7
own the proved compatibility diagrams, not a full categorical LLC. ET.6a is the
separate mixed-characteristic three-action tower input; the equal-characteristic
realization has its own LRS/Hausberger construction and corrected duality formulas.
