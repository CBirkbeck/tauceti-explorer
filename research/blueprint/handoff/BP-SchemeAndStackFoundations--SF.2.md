# Handoff: BP-SchemeAndStackFoundations--SF.2 (Claude Code, session cc-2f3ba9)

## State

Complete. `research/blueprint/packets/SchemeAndStackFoundations--SF.2.json` (status `complete`, part
`SF.2`, coverage of `SchemeAndStackFoundations:SF.2` = `planned`) adds 85 target-level nodes to the 55
SF.2 nodes of the accepted whole-roadmap packet (cited by id, not edited): 7 definitions, 17
constructions, 49 theorems, 5 lemmas, 7 comparisons; 159 API items, 85 unit tests, 3 planets (Hilbert's
Theorem 90 for schemes, Nisnevich topology, Bhatt–Scholze pro-étale comparison; with the accepted pass's
three this gives six for the layer). 83 baseline declarations, each read at Mathlib 082e2d3 / Tau Ceti
f790474. Checker: `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.2.json --index <worker declarations.tsv>` → 0 errors, 0 warnings.

Reader: `research/blueprint/readmes/SchemeAndStackFoundations--SF.2.md` (generated from the packet, so the
two agree; purpose, boundaries, conventions incl. coefficient regimes, seven sub-layers with every node's
statement, proof outline, API, uses, tests, dependencies and sources, the UPSTREAM integration table,
requests, gaps, acceptance tests, restructure proposals, remaining refinements, sources).

Suggested Lean file: `research/blueprint/suggested/SchemeAndStackFoundations--SF.2.lean` compiled with
the swarm's `lean-check` tool (`lake env lean` in the shared build at the pins): exit 0, only `sorry` warnings (102).
Carriers that the pinned libraries cannot yet type (D_QCoh internals, torsors, Cousin terms, big-site
cohomology) are typed as `sorry` carriers or recorded as comments; a closing "Packet index" comment lists
every node, API item and test by its packet name (all names verified present). Tau Ceti's
`Scheme.Modules.Cohomology` module is not built in the shared environment, so the file uses its defining
expression (`Sheaf.H` of the underlying sheaf).

## What was closed (accepted pass's remaining list)

- Noncommutative algebra / Azumaya descent: `quasi-coherent-algebra-descent`, `azumaya-equivalent-conditions`.
- Native H² units bridge: `nonabelian-torsor-h1`, `gerbe-h2-class`, `azumaya-trivialization-gerbe` (δ in Mathlib's Sheaf.H).
- Derived QCoh/RHom, compactification, coherent adjunction: `derived-quasi-coherent-category`, `derived-tensor-internal-hom`, `derived-pullback-pushforward-qcoh`, `perfect-generator`, `tor-independent-base-change`, `pushforward-right-adjoint`, `upper-shriek-compactification-independence` (Nagata imported from CPC CompactSupport L1), `sheafified-grothendieck-duality`.
- Semilinear equivariant category, enough injectives, derived-composite acyclicity: `equivariant-module-category`, `equivariant-coinduction`, `coinduced-sections-acyclic`, `equivariant-ext-spectral-sequence`.
- Site comparisons at each coefficient level, sheaf cohomology, localization (coherent supports), Cousin, pro-étale, Nisnevich: sub-layers SF.2a–SF.2d.

## Confirmed red-team findings

- RT-AREA-algebraicgeometry/18: coherent duality planned once in SF.2 in the Stacks "Duality for Schemes" generality (f^! with flat base change, étale/smooth/lci formulas, relative dualizing complexes and modules, Serre duality for proper Cohen–Macaulay schemes, sheafified duality) and compared with StableReduction Layer 2 (`curve-dualizing-comparison`). Restructure proposes re-pointing PILLONI-20 r10, BCGP-21 r11, CALEGARI-GERAGHTY-18 r18, GUO-REINECKE-24 r9 and AnalyticStacks AS.1 (classical part) to SF.2 and adding the link SF.2 → AlgebraicModuliForArithmeticGeometry:A0-extension.
- RT-AREA-etale/2: SF.2 plans no purity theorem. Absolute purity stays with EtaleDualityAbsolutePurityPartII, Brauer purity with the proposed PurityForFlatCohomology (current CESNAVICIUS-19 route 16), étale supports with EDC.0; both purity owners import SF.2's early prefix. This also respects the tier rule (SF.2 is tier 2).
- RT-AREA-ktheory-2/38: Nisnevich topology planned in SF.2 (nine nodes; distinguished squares as Mathlib MayerVietorisSquares; sheaf criterion, henselian points, cd ≤ dim, Čech comparison, Brown–Gersten vanishing). The spectrum-valued descent criterion is assigned to SchemeKTheoryOperations S.4 (restructure), deduced from SF.2's criterion and Brown–Gersten vanishing.

## Moves down (upstream-tier rule) — point the higher plans at SF.2

- Generic site-cohomology functoriality, higher direct images, Leray and Čech spectral sequences (planned by DiamondsAndVStacks D0, tier 3) → `site-cohomology-pullback`, `site-derived-pushforward`, `site-leray-spectral-sequence`, `cech-to-cohomology`.
- Étale cohomology of limits (planned by AdicCoefficientsAndComparisons L2, tier 10) → `etale-cohomology-limits`.

## Requests (Tau Ceti layers, in `requests`)

JacobianChallenge A, B, C, D; StableReduction L2; ModularCurves 0E; ProfiniteCohomology L9, L10;
QuadraticFormInvariants L7. CohomologicalPointCounting (open TauCetiRoadmap PR 196, head 4bd7237) is not
an atlas stage: its layers are recorded in `importsFromTauCetiRoadmaps`, in five gaps, and every
`UPSTREAM:` entry owned by SF.2 is mapped to the child layer it stands for in the packet field
`upstreamIntegration` (and the reader's table). Upstream notes ask for the family's registration and flag
two scope gaps (qcqs constructible approximation; Rf_! over limits of Noetherian bases), and ask
JacobianChallenge B/C to state affine acyclicity and flat base change in qcqs generality.

## Source issue

SchemeAndStackFoundations/E-SF2-1 (gap, new): Stacks Lemmas 85.36.3–85.36.4 (proper hypercover descent)
are stated for all K ∈ D^+ but their proof uses Lemma 84.8.2, which needs torsion cohomology; the node
`proper-hypercover-descent` is stated for torsion K.

## What remains (coverage `remaining`, all refinements)

Lemma-level splitting of all nodes; CS19 Appendix A field cohomology and its finite-flat/punctured H²
descent items; perfect-scheme p-primary vanishing; Kings–Sprang derived limits and Borel construction;
Benoist 2019/194; FKW/147 torus cohomology; HW20/33; Scholze 2017/208 (finite flat refinement of fppf
covers of strictly henselian rings); cd_ℓ over non-closed fields; Dedekind G_m sequence; Rf_! over limits
of Noetherian bases; constructible approximation on qcqs schemes (gap). Not SF.2 by ownership: étale
supports, purity, Benoist–Wittenberg coniveau/real package, DM-stack Poincaré duality, Hansen–Scholze ULA.

## Sources read (2026-10-09; files kept outside the repository)

Stacks Project (tags in the packet); Milne, LEC v2.21 (jmilne.org/math/CourseNotes/LEC.pdf);
Bhatt–Scholze arXiv:1309.1198v2; Morel–Voevodsky, Publ. IHÉS 90 (numdam PMIHES_1999__90__45_0);
Grothendieck, Brauer I and II (numdam SB_1964-1966__9__199_0, __287_0); Česnavičius arXiv:1711.06456v4;
SGA 2 arXiv:math/0511279; BCGP arXiv:1812.09269v3; Kings–Sprang arXiv:1912.03657v4; Grothendieck,
Tôhoku (J-STAGE tmj1949/9/3/9_3_185); Harpaz–Wittenberg arXiv:1904.06512v2; CohomologicalPointCounting
READMEs at TauCetiRoadmap 4bd7237. Not read: Grothendieck, Brauer III (Thm 11.7 taken through Česnavičius;
recorded as a gap); Kedlaya–Liu and Boxer–Pilloni (cited through their accepted extractions, checked against
Bhatt–Scholze and Stacks).
