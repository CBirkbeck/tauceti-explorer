# Binda–Kato–Vezzani: extraction and routing

Codex, session codex-a71f92. Refs #1211. Status: partial checkpoint.

## Result and source scope

The paper adapts Scholze's perfectoid reduction to p-adic cohomology by replacing the prime-to-p étale argument with rational rigid analytic motives. A smooth scheme-theoretic complete intersection has a small neighbourhood with the same motive. Tilting transfers an approximating equal-characteristic variety into that neighbourhood. A smooth alteration, a positive top-degree cycle class and multiplicative Poincaré duality then supply an equivariant cohomological splitting. Equal-characteristic weight–monodromy transfers to the desired direct summand.

The extraction has 131 items: six exact baseline items, six current-stage planned items and 119 missing items, each routed exactly once. All 46 definitions/constructions have use records, three API specifications and three discriminating mathematical tests. These are planning statements, not Lean declarations or formalization claims. There are 16 routes, including four Part II routes; one reuses the existing Jannsen weight-complex candidate rather than creating another roadmap.

The entire [arXiv v2](https://arxiv.org/pdf/2207.00369v2), dated 10 June 2025, was read: §§1–5, all Appendix A, footnotes and bibliography, 36 pages. Images of pages 6, 8, 22, 27 and 29 were inspected where extracted formulas were ambiguous. The [publisher record](https://link.springer.com/article/10.1007/s00222-025-01344-x) identifies Inventiones 241 (2025), 559–603, accepted 9 June and published 17 June 2025. Metadata, abstract and references match the authors' version; the publisher full-PDF request returned paywall HTML. No full journal collation is claimed. Selected v1 passages were compared, not the whole v1. Every downloaded source actually used has URL, hash and reading extent in the JSON.

Supplementary reading includes Scholze's published Proposition 8.7, Corollary 8.8 and Theorem 9.6 with the beginning of its proof; SGA2 XII Corollaries 3.4–3.5 and surrounding remarks; AGV's Tate definitions and entire published three-page erratum; and BGV v2 §4.1's module/nearby-cycle/augmentation discussion. The large original comparison inputs remain individually named gaps, not implicitly read references.

## Mathematical contract

The field of geometric coefficients is the algebraic maximal unramified extension K0^nr, not its completion. A semilinear p-Frobenius becomes a linear q-Frobenius only after its a-th iterate, with q=p^a. The coefficient relation is N phi=p phi N. Ramified comparison changes N to N/e; equality of its monodromy filtration under nonzero scaling does not justify an unscaled operator identity.

The paper's initial coefficient category permits Frobenius endomorphisms. That is larger than the isocrystal category. The nilpotence assertion used for quasi-purity is valid with invertible Frobenius, not for an arbitrary endomorphism: phi=0 and N=identity on Q_p is a counterexample. The quasi-purity items use the corrected scope.

The geometric input is a scheme-theoretic intersection of c hypersurfaces of codimension c, not merely the same reduced zero set. That is what makes the local defining map smooth near its zero fibre. No ampleness of the cutting line bundles is introduced by §4. The tube requires integral formal trivializations and a common rescaling of the sections; transition units preserve its valuation inequalities. The motive-valued local-constancy theorem assumes smoothness, unlike the more general étale neighbourhood statement discussed by the authors.

The motive categories use rational coefficients, strict-étale hyperdescent, A1 invariance for log formal schemes and B1 invariance for rigid spaces. Kummer/log-étale descent or the logarithmic interval (P1,infinity) produces a different further localization. The special-fibre theorem has the disjunction “fine” or “finite topological Krull dimension”; its non-fine general-coefficient extension cannot be assumed without the stated admissibility conditions. The reduced G_m motive is the conventional Tate object shifted by one. Stabilization is unaffected by that shift, but duality and twist formulas are not.

Hyodo–Kato realization is cohomological: it reverses motive maps, and its stated monoidality is on compact objects. The final duality splitting needs multiplicativity and compatibility with traces and operators. A nonzero map of vector spaces alone does not give the required equivariant splitting.

Theorem 5.6 is formulated over C_p without assuming that Y descends to Q_p-bar. Conjecture 5.2 includes that descent hypothesis. Proposition 5.3's equal-characteristic input does require descent to the algebraic closure of F_p((p-flat)). These are separate scopes.

## Proof inventory

Section 2 is decomposed into log structures and local fine models; verticality and value-log bases; semistable charts; strict-étale log motives and Tate stabilization; compact generation, monoidal structure and full subsite comparison; fine and non-fine special-fibre equivalence; affine-limit continuity; generic fibre and the Monsky–Washnitzer adjunction; motivic tilting; the Fargues–Fontaine natural transformation; and rig-étale localization compatibility. The nontrivial contraction/lifting argument inside Theorem 2.20 is a separate item and source gate.

Section 3.1 distinguishes log-rigid HK, proper crystalline comparison, unramified and ramified base change, the geometric coefficient colimit, motivic invariance, overconvergent de Rham comparison, rig-étale descent, the rigid/tilted realization and compact Künneth. Corollary 3.13 is recorded with its normalized monodromy.

Section 3.2 extracts the general realization contract, motivic duality, representability and cycle classes, positivity of the top class and the trace-rank hypothesis. These are reusable inputs, not opaque assumptions in the final theorem.

All of §3.3 was read, although the main proof does not need it. The inventory retains the four parts of Proposition 3.23, chi(1)-modules, unipotent G_m motives, the rational de Rham structure, plurinodal reduction, its blowup/Mayer–Vietoris proof, equal-characteristic arithmetic HK, Galois descent and the arithmetic comparison diagrams. “Generated by good reduction” does not mean every member has a smooth formal model. Two broken references in the arithmetic comparisons are recorded.

Sections 4–5 contain the rational-germ continuity argument, local constant relative motives, contractible small bases, Gabber's geometric local product construction, toric invariant divisors and integral models, smoothness of the defining map, the tube theorem, monodromy/purity linear algebra, alterations and rational splitting, equal-characteristic weight–monodromy, toric motive tilting, the open-domain square, approximation, alpha, top nonvanishing and the final splitting.

Appendix A is not collapsed into “log-free HK.” It separately supplies a chosen augmentation, nearby cycles, motivic monodromy, bounded weight structures, the Chow and good-reduction hearts, the weight-complex functor, the spectral sequence functorial from E2, orthogonal-purity degeneration, the finite-residue-field weight filtration and weight-graded monodromy. Full-complex monodromy and its log-free comparison are explicitly imported from BGV. The comparison with classical log weight spectral sequences is expected in the appendix, not proved there. The Jannsen/Gillet–Soulé model and the Bondarko/Sosnilo model must be compared by an actual theorem.

## Existing ownership and routes

The complete upstream AnalyticToricGeometry and HodgeStructures documents served as granularity models. The toric roadmap's analytic scope is complex; its fan carrier is useful but does not supply valuation-ring models. Current stage descriptions, proposed roadmaps, prior paper routes, packets, decompositions and reserved IDs were screened.

| Owner | This extraction adds or imports |
| --- | --- |
| EnhancedDerivedSheaves E0–E3/E5 | Shared enhancement, hyperdescent, localization, adjoints, monoidal/Ind machinery; corrected AGV site comparison |
| CrystallineCohomology CR.5 | Non-fine quasi-coherent log algebra, verticality, value-log bases, semistable charts |
| CrystallineCohomology CR.6 | Classical HK comparison and normalized log base change |
| AdicSpacesPartII F0/R0–R2 | Generic fibres, analytification, rational domains and local product geometry |
| PerfectoidSpaces P1–P3/P7 | Geometric tilting and perfectoid tower foundations |
| PadicHodgeTheory R06.2 | Actual (phi,N) carriers, normalization and invertible-Frobenius nilpotence |
| PadicDifferentialEquationsAndRigidCohomology RD.4–5 | Log-rigid/geometric HK and overconvergent de Rham interfaces, respecting the Disegni–Liu route |
| MotivesAndAlgebraicCycles MC.4 | Existing algebraic rational motives and transfers |
| MotivesAndAlgebraicCycles MC.1–2 | General realization, duality, cycle classes and multiplicative PD splitting |
| SchemeAndStackFoundations SF.5 | Proper cycle pushforward and positive degree |
| DeligneWeightsAndPurity DWP.0 | Coefficient-independent Weil-number and spectral weight algebra |
| AdicCoefficientsAndComparisons L5 | Existing de Jong alteration owner |
| MotivesRigidAnalyticPartII | New log-formal/rigid motives, special-fibre/tilting comparisons, HK realizations, motive-valued tubes and nearby cycles |
| AnalyticToricGeometryNonarchimedeanPartII | Extension of upstream toric geometry to nonarchimedean models and approximation |
| PadicWeightMonodromyPartII | Local-field quasi-purity, LP input and toric weight–monodromy application |
| MotivesPartIIWeightHomology | Reuse Jannsen candidate, adding enhanced Chow weight complexes and realization filtrations |

Each Part II brief names exact endpoints, suppliers, exclusions, tests and a suggested file. No roadmap definition or Lean file is authored outside this issue's deliverables.

Avoid a coarse whole-roadmap cycle between the rigid-motive and weight-complex extensions. The generic algebraic weight-structure/weight-complex prefix precedes the rigid-heart application. Rigid motives and their chi-module/nearby-cycle construction precede that application; the later full realization comparison can consume it. The explicit item graph is acyclic.

At the pinned commits, the six baseline items are SSet.Quasicategory, DerivedCategory, WittVector.fontaineTheta, its Teichmüller formula, WittVector.Isocrystal and TauCeti.Toric.Fan. Their actual statements were read. None proves stable presentability, rigid motives, geometric HK or a toric scheme over O_C.

The merged AUDIT22 enhancement entries and AUDIT01 SF.5 were read. Several cohomology/motive/perfectoid owners have no merged audit entry; that absence is not an audited negative verdict. In particular the pinned theta and fan infrastructure prevent a blanket assertion that perfectoid or toric mathematics is absent.

## Source findings requiring review

Fourteen findings are recorded with exact version/locator, short literal excerpt, correction, counterexample or proof check, reach and correction-search record. No finding has an independent-review verdict, and nothing was sent to the authors.

E1 corrects the vertical monoid equation. E2 restricts the log-point prelog construction to sharp monoids/nonunit parameters. E3 fixes the Tate shift, checked against AGV. E4 fixes the repeated tensor factor. E5 flags the Ogus bibliographic mismatch while leaving the exact replacement unverified. E6 replaces inversion of p by a uniformizer in the equal-characteristic formula. E7 restores every torus summand in the plurinodal proof. E8 fixes the Frobenius-invertibility condition.

E9 is the substantial connectedness concern. On P1×P1, the zero scheme of X0X1 in O(2,0) is two disjoint P1 fibres. It is smooth and a positive-dimensional scheme-theoretic hypersurface, but has top cohomology of rank two. SGA2 XII3.5 assumes an ample line bundle. Scholze's published Theorem9.6 explicitly assumes geometric connectedness. The printed BKV rank-one step therefore needs either an integrality convention for “variety,” an explicit connectedness hypothesis, or a componentwise construction. One cannot simply assert that each component remains a complete intersection. This does not disprove the weight–monodromy conclusion.

E10 similarly qualifies the general top trace: a connected union of two intersecting projective lines has two top components. It may be resolved by an integral-variety convention. E11 records the nonexistent Proposition3.8(2) references. E12 records the introductory normalization omission. E13 distinguishes a chosen augmentation from a unique one: [BGV v2 Remarks4.17–18](https://arxiv.org/pdf/2306.05099v2) identifies the rational-unit torsor and the finite-residue-field restriction.

E14 records an already published correction in an imported source: [AGV's 2025 erratum](https://doi.org/10.1017/fms.2024.97). Ordinary-topos equivalence alone does not imply enhanced sheaf equivalence. Cover refinement and essential-image hypercover hypotheses are needed; the non-hypercomplete case requires truncated hypercovers. The erratum's authors verify their original applications, but that is not a substitute for checking a new log-site application.

## Completion boundary and verification

The JSON contains ten exact gaps with consuming item IDs. Resume with journal collation and the connectedness convention, then LP16's original local-field theorem, log-specialization lifting, Vez/LBV/CN/EY comparison maps, arithmetic cross-references and the enhanced weight-complex/full-monodromy comparisons. Further split the remaining bundled subsidiary assertions before claiming declaration-level closure.

The full BKV paper has been read; this does not mean its entire imported mathematical dependency tree has been established. Every extracted missing item is routed, but the extraction remains partial because those source and granularity boundaries remain real.

Validation: the paper checker, intake path validation, paper-checker tests, source-issue tests, and separate structural/mathematical checks are run before publication. The last checks test unique IDs, known stages, acyclicity, exact-once missing ownership, API/test counts and small monoid/Frobenius/normalization examples. They do not prove the research mathematics. No Lean compilation was attempted because no Lean deliverable is authorized.
