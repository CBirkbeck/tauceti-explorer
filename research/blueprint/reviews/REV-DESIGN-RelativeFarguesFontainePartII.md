# REV-DESIGN-RelativeFarguesFontainePartII

**Accepted as a complete target-level planning pass, after corrections.** This does not close the seven mathematical gaps or five open supplier extensions. All twelve stages remain planned, none is closed, and every node remains implementation-unchecked. No unresolved contradiction remains in the corrected statements: targets dependent on missing arguments identify those obligations explicitly.

Reviewer: Codex, session `codex-0pVXh0`, 19 October 2026. Issue: [#5052](https://github.com/CBirkbeck/tauceti-explorer/issues/5052). The design was written by the separate session `codex-NqetLM` for #4971. The packet records the reviewer as `independent-review-REV-DESIGN-RelativeFarguesFontainePartII`.

## Inventory and scope

| Item | Result |
| --- | --- |
| Node verdicts | 109 checked: 72 verified, 37 corrected, 0 added, 0 unverifiable |
| Node kinds | 69 theorems, 15 definitions, 9 constructions, 13 comparisons, 3 applications |
| Definition/construction interfaces | 97 API entries and 73 discriminating tests; all 24 objects have at least three tests |
| Planets | 44, at most six per layer; names and mathematical significance checked |
| Baseline | 15 confirmed declarations: 14 retained, 1 added; no original baseline entry removed |
| Routed input ledger | All 348 distinct input ids accounted for |
| Source findings | 51 independently confirmed: 44 original, 5 additional inherited findings, 2 findings added by this review |
| Open work | 7 mathematical gaps; 7 supplier records, of which 5 are open and 2 provided |

The build order HF0–HF7, HF9–HF10, HF8, HF11 respects local dependencies. Target-level granularity is retained: corrections to internal arguments stay in proof steps rather than becoming artificial lemma nodes. Each checked node has its own verdict and mathematical justification in `review.checked`.

I read the statements and hypotheses at all cited node locators, their `match` fields, direct supplier statements, proof sketches, uses, API entries and tests. The reader was checked as a deliverable and synchronized with each changed node. Every target statement is also present in its roadmap stage description. The suggested file was read in full and compiled without changes.

## Corrections to nodes

The table records every changed node. Source locators are the corrected locators in the packet and reader; FF17 always means the dated public author copy, not a collation of the published volume.

| Target | Correction and reason |
| --- | --- |
| `HF0/absolute-annulus-comparison` | The common dense Witt localization fixes the absolute/relative norm dictionary and endpoint scalar topologies. Import current AdicSpaces Layer 6 for the Q_p interval carrier; no second carrier is planned. |
| `HF0/gauss-coefficient-calculus` | The coefficient estimates and Proposition 1.4.9 supply multiplicativity. Added the omitted locator and additive initial exponent; removed the unjustified uniqueness claim from two generator values alone. |
| `HF0/legendre-newton-conventions` | Corrected to the convex decreasing envelope with right horizontal rays. The monomial test now distinguishes it from a single-point hull and checks the extended transform on negative parameters. |
| `HF0/completed-newton-polygon` | The derivative-jump multiplicity and endpoint conventions agree with the source. Corrected Corollary 1.6.17/Definition 1.6.18 and the subsequent locators. |
| `HF0/compact-norm-stabilization` | Separated the positive-radius compact proof from an included radius zero. Pi-adic stabilization of initial coefficients plus a positive-radius tail bound handles the latter without applying Proposition 1.6.16 outside its domain. |
| `HF1/witt-bivectors` | Replaced an unsupported arbitrary-ring covector-to-bivector lift by the finite Laurent constructor over perfect O_F. Extensionality, summation and the exponential-versus-linear tail tests remain valid. |
| `HF1/crystalline-saturation` | Added the perfect subfield of O_F and explicit finite dimension. Replaced the too-narrow VB0 coefficient-field import by the pinned WittVector.Isocrystal structure over arbitrary perfect k; the radius inclusions and invariant equality then match Corollary 1.10.13. |
| `HF1/boundary-valuation-quotient` | Distinguished uniform positivity from coefficientwise positivity and replaced a vague completeness argument by the positive radius-one completion quotient. Its later eigenvector comparison is algebraic. |
| `HF2/primitive-kernel-criterion` | Corrected the generator expansion to Q-Teichmuller lifts. Pi-torsion-freeness and the zeroth-coordinate pi-times-unit condition are retained in the iterative division proof. |
| `HF2/berkovich-topology-comparison` | Restricted the equal-truncation identity to A. Continuity on B^b then follows by localization and the continuous positive normalization v_y(pi), without asserting a false identity for all fractions. |
| `HF3/near-zero-weierstrass-product` | Allowed finite and empty families as well as infinite null families. The compact product estimates give the exact near-zero divisor and extend the zero-free remainder. |
| `HF3/locally-finite-divisors` | The finite-support specialization is the pinned WeilDivisor API. Clarified that endpoint notation uses I intersect (0,1); testing finiteness on intervals touching one would wrongly exclude eigenvector divisors. |
| `HF5/half-open-bezout` | Added nonzero hypotheses for the minimum-divisor criterion and separate zero-generator cases. Dense compact corrections give the required compatible Bezout relation. |
| `HF5/nonclosed-maximal-ideal` | Corrected the density proof by deleting all zeros of the majorant on each compact exhaustion member. Remaining escaping zeros give properness; late generators are compact units even if the majorant has extra zeros. |
| `HF5/meromorphic-functions` | Restricted the divisor-bearing definition to I subset (0,1). The compatible inverse limit of compact fraction fields and local DVR orders has the required restriction and finite-support APIs. |
| `HF6/eigen-banach-refinement` | Corrected the barB comparison to an algebraic isomorphism and transported its Banach topology explicitly. Its inherited boundary valuation topology is discrete; negative degrees, rather than eigenvalues, vanish. |
| `HF6/eigen-coefficient-and-uniformizer-change` | The twisting line is over the correct coefficient field and unramified changes iterate Frobenius. Corrected the subsection/page locators while retaining the residue-constant hypotheses. |
| `HF6/homogeneous-factoriality` | The geometric factorization statement concerns the homogeneous monoid, not the entire ungraded ring. Corrected its source to Theorem 6.2.1, p. 245. |
| `HF6/orbit-divisors` | The carrier is the existing finite WeilDivisor on Frobenius orbits and its primitive-degree weight. Corrected the definition and lemma locators; pullback is locally finite only in the interior. |
| `HF6/eigenvector-divisor-map` | Degree and injectivity hold for every standing F; surjectivity is geometric. Corrected the proposition/theorem locators and retained the character obstruction in the general case. |
| `HF6/positive-weierstrass-product` | The forward product, recurrence and divisor use the fixed ideal action of Frobenius. Corrected the product construction and Definition 6.2.11 locators. |
| `HF6/negative-weierstrass-solutions` | Restored b in B^b with v_pi=0, using a Teichmuller rescaling before integral lifting. The object is a solution line, not an asserted convergent unnormalized negative product; corrected its locators. |
| `HF6/orbit-product-eigenvectors` | Forward and backward recurrences give the full eigenvector and orbit divisor up to E units. Corrected the locator to Lemma 6.2.12, pp. 250–251. |
| `HF6/lubin-tate-product-logarithm` | The logarithm product is grouped by torsion level, with the equal-characteristic R-LT input retained. Corrected Proposition 6.3.1/Remark 6.3.2 and the comparison-page locators. |
| `HF6/fundamental-exact-sequence` | The sequence uses orbit-separated degree-one points, including repeated jets, and the strict Banach topology. Corrected to Theorem 6.4.1 and Example 6.4.2, pp. 253–254. |
| `HF6/graded-fibre-and-interpolation-ideal` | Restored the integral ideal gA from Theorem 6.4.4 as well as gB. The quotient proof checks both integrality boundaries; the Frobenius shift and pointwise-supremum correction prevent omitted or duplicated zeros. |
| `HF8/coefficient-field-base-change` | The unramified stage keeps B and iterates Frobenius; the ramified stage uses tensor and line twists. The supplier Veronese API has no generation hypothesis; corrected coefficient-change locators. |
| `HF8/algebraic-closure-tower` | Corrected eventual stabilization to the number of primes and ramification indices. Residue fields may grow; unramified colimit local rings retain a uniformizer. The normal-stage subgroup is contained in the point stabilizers. |
| `HF8/rank-one-degree-and-characters` | Added the actual annular Frobenius-descent and geometric classification suppliers to obtain a free B_C line. Character reconstruction uses all-interval descent and therefore retains G-RADIUS. |
| `HF8/runge-and-adic-reconstruction` | The corrected approximant has dominant term pi/[b] and only the chosen pole. Existing AdicSpaces carriers and quotient topology are imported; the new claim is reconstruction from schematic charts plus radial norms. |
| `HF9/interval-site` | Replaced the insufficient finite-original-subcover condition by finite compact refinements. Pullback/composition follow, and a new disjoint adjacent half-open cover test prevents a false product sheaf. |
| `HF9/mayer-vietoris-and-sheaf` | The two-interval exact sequence is inside the common overlap ring. Updated the sheaf/H^1 proof to use the corrected finite compact refinements and closed chains. |
| `HF9/frechet-stein-comparison` | The noetherian PID/field restrictions are flat and dense. Added a separate ST02 citation for general complete nonarchimedean fields and its exact-sections/base-change results through ND.2. |
| `HF9/finite-projective-bundle-equivalence` | After G-GENERATORS supplies finite global generators, exact sections of coherent Hom systems lift the identity to a splitting. This proves projectivity without a false claim that compact classical points exhaust all maximal ideals. |
| `HF10/bundle-galois-descent` | Removed the impossible contained value-group exhaustion for irrational singletons or included irrational endpoints. G-RADIUS explicitly supplies arbitrary-compact base change and norm estimates before the interval limit. |
| `HF10/endpoint-one-failure` | The source assertions are retained as targets requiring actual counterexamples in G-BOUNDARY. Corrected Remark 11.1.11 to p. 366; failed contraction alone is not treated as an example. |
| `HF11/closed-primes-of-integral-period-ring` | The weakly closed prime classification separates the vertical prime, primitive primes and the limiting coefficient prime. It is not a classification of all abstract primes. Renamed the planet to the integral period ring: Ainf without a ramified qualifier conventionally denotes the narrower p-typical carrier. |

The consequential source checks include FF17 Proposition 1.4.9, p. 64; Proposition 1.6.16 and Corollary 1.6.17–Corollary 1.6.21, pp. 73–75; Corollary 1.10.13, p. 94; Proposition 4.1.6, pp. 154–155; Theorems 6.4.1 and 6.4.4, pp. 253–254; Proposition 7.5.1, p. 269; Remark 11.2.8, p. 371; and Propositions 11.2.2–11.2.3 and 11.2.12, pp. 369–374. These checks distinguish source hypotheses, genuine corrections, and explicitly unresolved proof steps.

## Baseline declarations and ownership

All declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records exact modules and line numbers; the reader explains each contribution.

| Pinned module | Declarations and limits |
| --- | --- |
| `Mathlib.RingTheory.Perfectoid.FontaineTheta` | `WittVector.fontaineTheta` (165), `WittVector.fontaineTheta_teichmuller` (182), `surjective_fontaineTheta` (195). The p-typical complete-ring hypotheses are retained; the ramified comparison is future work. |
| `Mathlib.RingTheory.Perfectoid.BDeRham` | `fontaineThetaInvertP` (64), `BDeRhamPlus` (77), `BDeRham` (90). These are existing p-typical carriers, with the indicated completion and kernel-generator localization. |
| `Mathlib.RingTheory.PrincipalIdealDomain` and `Mathlib.RingTheory.Bezout` | `IsBezout` (65) and `IsBezout.TFAE` (55). Finite-generation principality is distinguished from principality of all ideals; the generic degree argument needs a domain. |
| `Mathlib.Analysis.Normed.Operator.Banach` | `ContinuousLinearMap.isOpenMap` (229) and `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` (279). The complete nontrivially normed scalar hypotheses apply to normalized norms. The section is norm-bounded, with no continuity or linearity assumption. |
| `TauCeti.AlgebraicGeometry.WeilDivisor.Basic` | `TauCeti.AlgebraicGeometry.WeilDivisor` (45), `.weightedDegree` (330), `.ofPoint` (99), `.weightedDegree_ofPoint` (357). Finite supports and integer weights are the existing interface; noncompact local finiteness is additional work. |
| `Mathlib.RingTheory.WittVector.Isocrystal` | **Added** `WittVector.Isocrystal` (113), over the fraction field of W(k). This supplies arbitrary perfect k; finite dimension must be imposed separately. For a perfect field the Witt DVR identifies this fraction field with W(k)[1/p]. |

No original baseline citation was invalid or removed. One cross-roadmap citation was too narrow: HF1 crystalline saturation previously used VB0's isocrystal over the fixed field W_OE(F_q-bar)[1/pi]. That does not supply an arbitrary perfect subfield k of O_F. I replaced that prerequisite with the existing pinned Mathlib isocrystal structure, added its baseline entry, and made finite-dimensionality explicit. This is a replacement of a supplier citation, not a newly planned isocrystal definition.

The reviewed library audit has no entry for this new continuation or its parent under those ids; that absence is not evidence of library absence. I read the relevant GeometricSatakeAndFusion GS0 audit: it distinguishes existing de Rham carriers from missing relative/DVR interfaces. Direct pinned checks determine what is reused here.

Current upstream checks used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All nine newer roadmap families named by WORKERS.md were screened, including their suggested files. The relevant existing ownership was read directly:

- **AlgebraicVectorBundles** owns the generic affine equivalence. Current Tau Ceti's `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv` in `VectorBundle.Affine.Basic` implements it. HF9's new target concerns noncompact period intervals.
- **AdicSpaces**, Layer 6.1–6.4, owns the Q_p period annuli and Frobenius quotient for arbitrary perfect F. Current `FarguesFontaine.Y` and `.Quotient` provide `spaY`, `spaX`, the open quotient map and wandering windows. The quotient module explicitly leaves sheaf and affinoid-chart identifications for further work. R-ADIC records the provided owner interface; HF0 compares norms and HF8 adds schematic reconstruction. Its plus ring is power-bounded, unlike the positive-function subring used here.
- **OptimalTransport**, Layer 5(1)–(2), owns general convex conjugation and Fenchel–Moreau. R-CONVEX remains provided; only the Newton sign bridge is planned here.
- The parent relative roadmap, VB1/VB2, ND.2 and the scheme foundations retain their ring, curve, bundle, Fréchet–Stein, quotient and relative-Proj interfaces. I checked the exact annular Frobenius-descent and geometric classification imports before using them to obtain a free rank-one B_C module. The module can then be reconstructed through interval descent; half-open freeness alone was insufficient.

No upstream file is changed and no theory is transferred away from its existing owner.

## Other edits and open obligations

Besides the node corrections, the packet, roadmap and reader were reconciled as follows:

- Added G-RADIUS for effective descent on arbitrary compact radii. Density of the value group does not give a contained compact exhaustion for an irrational singleton or an included irrational endpoint. The obligation names completed base change and trace/matrix bounds in the actual compact norm, without assuming extension of an object or cocycle to an enclosing interval.
- Strengthened R-TATE to include filtered principal-unit bounds for normalized primitive generators and the arbitrary-radius estimates. Its consuming nodes are explicit.
- Refined G-GENERATORS to isolate uniform finite generation. Once generators exist, exact sections of coherent Hom systems split the finite-free presentation, proving projectivity without an incorrect claim about all maximal ideals being classical.
- Added provided R-ADIC, direct owner prerequisites at HF0/HF8, and the corresponding roadmap imports. Added the VB1/VB2 imports at HF8. Updated current-library reuse notes.
- Recomputed every stage's transitive `openInputs` and `remaining` from the actual node graph, excluding provided R-CONVEX/R-ADIC. HF0 and HF3 have no unresolved local input; they still remain planned. No stage was promoted to closed.
- Added one fourth definition test to the interval site: the disjoint adjacent half-open cover must fail admissibility. The other APIs and tests were checked and retained. Renamed the closed-prime planet from Ainf to the integral period ring to include ramified E.
- Corrected source locators and source-version scope, extended ST02's locator through Lemma 3.6, and synchronized every changed statement, proof plan, source, prerequisite, API and test with the reader. Stage target inventories were rebuilt from the corrected packet statements. Added the review metadata and individual verdicts.

The other six mathematical gaps remain G-MATRIX, G-GENERATORS, G-BOUNDARY, G-HOMOGENEITY, G-EQUALCHAR and G-COORDINATE. Their records describe the exact missing estimates, examples or hypotheses. In particular, local matrix factorization does not establish the moving-neighborhood approximation, and failure of a contraction estimate does not supply an endpoint-one counterexample. The five open supplier records remain R-TATE, R-CRYS, R-LT, R-KT and R-BC. No existing supplier is claimed to prove more than its statement.

## Source findings and accessible versions

The public sources read were [Fargues–Fontaine's 16 April 2017 author copy](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), [Kedlaya–Temkin v6, 29 March 2016](https://math.huji.ac.il/~temkin/papers/Endomorphisms_of_Power_Series.pdf), [Berger's published article, Remark 1.1.3, p. 96](https://msp.org/ant/2008/2-1/ant-v2-n1-p04-p.pdf), and [Schneider–Teitelbaum's public arXiv version, §3, pp. 7–11](https://arxiv.org/abs/math/0206056). The packet and reader preserve their fingerprints, access date and exact locators. No restricted library source was needed.

All 44 original findings were reread and received individual confirmed verdicts with reasons. E45 was restricted to the Q_p coordinate model; E55 was reclassified as an explicitly omitted proof calculation; E63 was restricted to integral A before extending continuity by localization. The following seven records were added, retaining extraction ids for the first five:

| Finding | Checked correction |
| --- | --- |
| E28 | Proposition 1.4.9, p. 64: the initial product exponent is n_0+m_0. |
| E38 | Proposition 1.6.25, p. 77: the tail estimate is a lower bound, not an equality. |
| E39 | Same proof: the Legendre linear term has positive sign. |
| E58 | Proposition 2.2.16, p. 111: an element in 1+m_F has valuation zero. |
| E195 | Proposition 1.6.25, p. 78: the final uniform estimate ranges over compact J. |
| E221 | Remark 11.2.8, p. 371: require finite compact refinements. The weaker covering condition allows a disjoint adjacent half-open cover and would force a domain to be a product. |
| E222 | §1.7.2, p. 82, under §1.1, p. 52: X→X^q is finite radicial in characteristic p; the derivative vanishes. Finite etaleness requires characteristic zero, as the existing node already states. |

The first five are typographical slips with clear intended corrections. E221 and E222 were absent from the routed extraction. I searched the extraction, the dated author copy, public errata/corrigenda queries, and [Fargues's publications page](https://webusers.imj-prg.fr/~laurent.fargues/Publications.html); no published correction was located. The Astérisque volume was not collated, so these findings are scoped only to the author copy. No claim that the published volume contains them is made. All records and documents use original wording, with no source passages or section-by-section source summaries.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontainePartII.json` with the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/RelativeFarguesFontainePartII.lean`: **success**, exactly ten intended proof-placeholder warnings, no errors or other warnings. The unchanged 137-line file contains two milestones and eight examples over available carriers; this checks signatures, not proofs.
- Inventory checks confirm identical target statements in the packet, reader and stage descriptions; complete API/test coverage; all 348 routing ids; 109 distinct review verdicts; 51 confirmed source findings; acyclic prerequisites; and no copied-source fields or private paths.
- File-scope/JSON checks and `git diff --check` pass for the five changed deliverables, including this report and the handoff.

No clarification is required to accept this pass. For later proof-completion work, route the five supplier extensions to their named owners and the seven gaps to this continuation's follow-up work. Preserve the arbitrary-radius obligation and the separation between geometric classification and general-field function theory. Publication collation remains separate source work. This review claims no implementation and does not promote a stage or edit atlas data.
