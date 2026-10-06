# BP-Polylogarithms--P.3 — handoff

Issue #6388; worker Codex (GPT-6), session `codex-mZTIGY`, 6 October 2026.
This is a completed target-level planning pass for P.3, submitted for independent
review. It is not a checkpoint and claims no formalisation. No second issue is
claimed by this run.

## Deliverables and coverage

The packet `research/blueprint/packets/Polylogarithms--P.3.json`, its reader
`research/blueprint/readmes/Polylogarithms--P.3.md`, and its suggested file
`research/blueprint/suggested/Polylogarithms--P.3.lean` agree on the conventions.
Only those files and this handoff change. The packet has 27 nodes: 10
constructions, 2 definitions, 13 theorems and 2 comparisons; 68 API items;
36 tests; 25 freshly checked baseline declarations; and 2 new planets.
All nodes remain unchecked. Coverage is **planned**, with zero closed stages,
6 gaps and 5 supplier requests. Packet status **complete** means the pass has
planned every target, as in PROTOCOL section 0; it does not mean gap-free closure.

The parent supplies B₃, Γ, residues, the H³–Milnor equivalence, comparison targets
and the existence theorem. This part supplies the explicit coordinate relation,
configuration quotient and complex, three comparison components, geometric
presentation and duality, stabilization, norm transport, functional descent,
regulator calibration, cycle lifting and every-family determinant chain.
The two new planets are Grassmannian configurations and Configuration comparison.
Together with the two parent landmarks, P.3 has four planets.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.3.json`
reports 0 errors and 0 warnings. The same check with the supplied declaration
index also reports 0 errors and 0 warnings. Every API and test name, and every
named theorem, appears in the suggested file. No packet or reader contains Lean
code or private filesystem paths. The baseline source statements were read at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports Mathlib only.

`lean-check research/blueprint/suggested/Polylogarithms--P.3.lean` completed
elaboration with **no errors and only expected declaration-uses-placeholder
warnings** (`sorry`, 93 warnings). The shared production Lake configuration
sets `warningAsError=true`, so its wrapper returns exit status 1 for those
warnings; this is not an elaboration error. No other warnings occurred.
Compilation used the prebuilt Mathlib at the pin; no library build, update,
cache fetch or language server was started. Memory available exceeded 20 GB,
and this worker ran one elaboration at a time.

Names whose faithful statement still needs a supplier carrier are explicitly
marked “not stated” in the suggested file, with the missing interface named.
They include general field-map comparisons, primitive Hurewicz/rank comparisons,
measurable/continuous configuration cohomology, exact regulator calibration,
valuation-family transfer laws, and the derived transfer. General duality
signatures also need the dependent finite-index transports. These comments
are honest prototype limits, not placeholder proposition fields. Most native
constructions, concrete computations and the determinant signature are present.

## Sources and findings to review first

The packet records exact URLs, hashes, read sections and versions. Primary
passages read are Goncharov's published 1995 scan §§1, 2.5, 3, the §5 conclusion,
§§6–9 and Lemma 10.1, at the precise page intervals in the packet; GR arXiv v5
§1.2, all §5.1 and §§7.1–7.3; and Zhao's supplement formula (3) with its
nondegeneracy condition. Goncharov's 1991 announcement was a check, not a
replacement for the published proof. The complete §§4–5 choice-independence
proof has not been read. Suslin 1984 could not be obtained through MathNet;
V.4 owns both its stability theorem and its existing primary-source gap.
No source binaries are committed. The two upstream documents read for the
roadmap standard were Hodge structures and algebraic topology.

Four source findings need the independent review's verdicts:

1. Gon95 p. 298 prints H¹ as the target of c₂. Theorem 1.14 and (6.11b) give H².
2. GR v5 (142) prints coefficient 2 on Alt₄. With its printed r₅ and the
   parent boundary (1−x)∧x, the right square forces coefficient −3.
3. Gon95 §9.2 p. 310 asserts the higher-differential cycle-lifting computation
   without displaying it. This is a precise proof gap for arbitrary families.
4. Gon95 (1.16), p. 208, omits the minus sign inside its sixth cyclic argument.
   Zhao (3) independently has the negative denominator. Substitution a=b=c=1
   gives the decisive check: the corrected relation is 3[1]+4[−1], with zero
   L₃ value; the printed version has value 21ζ(3)/4.

Do not silently promote either coefficient correction to a confirmed erratum.
The GR finding is scoped to v5, not an uncollated journal version. The packet
records where corrections were searched for and the exact effect of each finding.

## Reproducing the rational normalization calculations

These calculations can be reconstructed without retained scratch files. Represent
u(x), for nonzero rational x, by its prime-valuation vector. Ignore its sign,
since −1 is torsion. Expand a threefold wedge by products of three coordinates,
discard repeated primes, and sort the remaining primes with the permutation sign.
Use exact integers/rationals throughout. Determinants use the displayed column
order; alternations are unnormalized signed sums over all permutations.

For v(t)=(1,t,t²) at t=1,2,3,5,7, the signed five-point boundary gives
`d₂r₅ = 36 u(2)∧u(3)∧u(5)`. The printed `2 Alt₄` after deletion gives −24
on that same wedge. The corrected `−3 Alt₄` gives 36. Multiplying just the
first vector by 2 changes d₂r₅ to 18 on the wedge, showing why projectivizing
these vector configurations loses data. For the four vectors
(1,8,2),(7,3,11),(1,3,2),(9,4,3), the corrected r₄ is
`18 u(5)∧u(67)∧u(197)`; the printed coefficient gives −12 instead.
Direct expansion also gives Alt₄=−6 f₀ of Gon95 (3.3).

Additional generic five-vector fixtures used to check the coefficient ratio were:

- (1,8,2),(7,3,11),(1,3,2),(9,4,3),(3,1,11);
- (1,3,4),(9,8,9),(7,4,10),(2,2,1),(7,6,4);
- (4,6,7),(6,10,4),(4,4,7),(10,11,9),(1,1,3).

All three give the same correction ratio −3/2. This is computational evidence,
not a Lean proof of the general chain square.

## Remaining work and where to resume

The six packet gaps give exact consumers and statements:

- **Geometric normalization:** read Gon95's full §§4–5 comparison proof;
  reconcile its M₃, GR's 3/2 alternation factor, r₆'s 1/5 factor and the corrected
  coordinate relation. §§7–8 duality and their 46-term cancellation have been read.
- **Analytic identity:** supply the derivative/constant/continuation proof that
  L₃ kills the corrected coordinate relation. Cobracket vanishing is insufficient.
- **Cycle lifting:** start at Gon95 §9.2 p. 310, write the asserted higher
  differentials, and check PGL₃-to-stable-GL and primitive pairing. Do not assume
  the full H¹Γ–K₅ conjecture.
- **Primitive symbol adapter:** import V.4's integral Suslin theorem, then
  compare diagonal symbols with primitive Hurewicz and the configuration map.
  The source-access gap remains with V.4.
- **Regulator normalization:** R.7 must compare the original real Borel class
  with R.4's Burgos/Tate-divided coordinates. The expected factor is π²·Q×;
  determinant exponents detect it but do not prove the class-level adapter.
- **Full transfer:** the H³ Milnor transfer is unconditional; the derived Γ
  transfer needs P.4's weight-four homotopy/residue quasi-isomorphism and the
  specified independence and compatibility checks.

The five requests belong to GeneralAlgebraicKTheory K.2, K3BlochGroups V.4,
BorelRegulators R.7, K2SymbolsBrauer T.3 and Polylogarithms P.4. The packet's
rescope proposal describes their Part II interfaces; the worker did not create
new general foundations in P.3.

At assembly, correct the parent comparison's rank-restricted domain, reconcile
its regulator wording with R.4's π² coordinates, and orient its every-family
formula as determinant equals q times the period, with q possibly zero.
This run does not edit the parent. Independent review should begin with the
four source findings and the normalization gap, then verify ownership,
source/baseline matches, and the faithful signatures. Scratch is disposable;
all information needed to resume is in this note and the three deliverables.
