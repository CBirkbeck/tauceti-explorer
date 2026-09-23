# Binda–Kato–Vezzani (2025): extraction and routing

Issue [#1211](https://github.com/CBirkbeck/tauceti-explorer/issues/1211). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** F. Binda, H. Kato and A. Vezzani, *On the p-adic weight–monodromy conjecture for complete intersections in toric varieties*, Invent. Math. 241 (2025), 559–603.
  - The version of record is not openly available. arXiv v2, the authors' revised version, was read (SHA-256 150ba497…).
- **Items.** The result has **131 items: 6 library, 6 planned and 119 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Fourteen are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Reclassified findings.** Five findings marked as affecting a stated result are slips whose intended form the paper uses; they now affect nothing.
- **E2.** The monoids in Definition 2.9 are sharp in every use (N, Q≥0).
- **E3.** Inverting Q(1) or the cofiber Q(1)[1] gives the same stable category.
- **E6.** O_X[1/p] should be O_X[1/ϖ].
- **E8.**
  - The problem: Definition 3.1 does not require φ bijective, so "N is nilpotent" in Definition 5.1 can fail (φ = 0, N = id).
  - Why it is harmless: Definition 5.1 is only applied to Hyodo–Kato cohomology, where φ is bijective.
- **E12.** Theorem 1.3 is labelled "(Corollary 3.13)", and Corollary 3.13 states the normalized RΓ^(e)_HK; the introduction drops the superscript.

**Unchanged.**
- **E10.** The trace in Remark 3.21 needs geometric irreducibility unless "variety" includes integrality, and the paper does not say which.
- **E13.** The uniqueness of the augmentation in Appendix A.1.
- **E14.** The cited AGV lemma, with its published erratum. Its `known` value names the correction and stays.

**Gaps.**
- G2 and G7 are recorded as findings.
- G1 is unavailable.
- The others are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), v2 Remark2.4(1) p6; persists in v1 Remark2.6. *Printed:* q=q′+φ(p) *Correction:* Replace with q+q′=φ(p).
- **E2** (error; affects nothing), v2 Definition2.9 pp7–8. *Printed:* integral monoid *Correction:* Require Gamma sharp integral and gamma a nonunit, or explicitly redefine the prelog map and allowed log-base map.
- **E3** (misprint; affects nothing), v2 Definition2.11(2) p8. *Printed:* Q(1) *Correction:* The raw reduced G_m cofiber is the suspension of the conventional Tate object: define Q(1)=T[−1].
- **E4** (misprint; affects nothing), v2 Remark2.17 p9. *Printed:* QS(X)⊗QS(X) *Correction:* Use Q_S(X) tensor Q_S(X′) for X×_S X′.
- **E5** (misprint; affects nothing), v2 Theorem2.20 proof p11. *Printed:* [Ogu90] *Correction:* Replace the bibliographic attribution by the correct source for Corollaries I.2.2.5 and IV.3.1.11, apparently Ogu18; verify the exact book statements before using them.
- **E6** (misprint; affects nothing), v2 Remark2.8 p7. *Printed:* OX[1/p] *Correction:* Use O_X[1/pi] with a pseudo-uniformizer in the general characteristic allowed there, or restrict this formula to mixed characteristic.
- **E7** (error; affects the proof), v2 Proposition3.29 proof p22, both torus equalities. *Printed:* M(Xη×Tk)≅M(Xη)(k)[k] *Correction:* Retain all summands: M(X×T^k)=⊕_j M(X)(j)[j] with binomial multiplicities, in particular M(X×T)=M(X)⊕M(X)(1)[1].
- **E8** (error; affects nothing), v2 Definition5.1(3) p27 versus Definition3.1 p15. *Printed:* nilpotent endomorphism *Correction:* Restrict to finite-dimensional modules with invertible Frobenius, or require nilpotent N separately.
- **E9** (error; affects the proof), v2 Remark5.8 p29 and Theorem5.6 rank-one step p28; v1 same remark p28. *Printed:* geometrically connected *Correction:* Retain geometric connectedness in the rank-one proof or prove a genuine componentwise argument. For the cited SGA2 connectedness result retain ampleness of the cutting divisor at every application.
- **E10** (gap; affects a stated result), v2 Remark3.21 p20. *Printed:* Hc2d(Z)(d)→Λ *Correction:* For general varieties require geometric irreducibility for the top trace; for the smooth proper endpoint geometric connectedness suffices. Clarify whether 'variety' already includes integrality.
- **E11** (misprint; affects the proof), v2 proofs of Corollaries3.34 and3.39 pp23–24; same broken reference in v1. *Printed:* Proposition3.8(2) *Correction:* Identify and cite the actual comparison assertion used in each diagram; do not guess a replacement number.
- **E12** (misprint; affects nothing), v2 Theorem1.3 p3–4 versus Corollary3.13 p18. *Printed:* RΓHK(Z0/W(k)) *Correction:* Use the ramification-normalized complex with N/e in the introduction's comparison, or explicitly declare that normalization in its notation.
- **E13** (error; affects a stated result), v2 AppendixA.1 p29; same passage in v1. *Printed:* only one algebra morphism *Correction:* Keep the chosen projection augmentation over arbitrary perfect k. It is unique when k is algebraic over F_p; generally augmentations form a torsor under k* tensor_Z Q.
- **E14** (error; affects a stated result), External input AGV22 original Lemma2.1.4; used in the §2 descent framework. *Printed:* preserves 0-truncated objects *Correction:* Use the published 2025 erratum: require target-cover refinement by source covers and hypercovers by essential-image objects, truncated for the non-hypercomplete case, in addition to preservation of covers/base-change squares and ordinary-topos full faithfulness.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Journal-version collation** (unavailable). The Inventiones version is not openly available (only a submitted-version repository copy); arXiv v2, the authors' revised version, was read.
- **G2, Connectedness convention and componentwise splitting** (recorded). The connectedness conventions are E9 and E10.
- **G3, Log-specialization proof leaves** (deferred). The log-specialization inputs are cited suppliers.
- **G4, Motivic tilting and Fargues–Fontaine comparison** (deferred). Motivic tilting and the Fargues–Fontaine comparison are cited suppliers.
- **G5, Original Hyodo–Kato comparison models** (deferred). The original Hyodo–Kato comparison models are cited suppliers.
- **G6, Laurent-series weight–monodromy source** (deferred). The Laurent-series weight–monodromy input is a cited supplier.
- **G7, Arithmetic diagram cross-references** (recorded). The broken cross-references are E11.
- **G8, Weight-complex and full-monodromy comparisons** (deferred). The weight-complex and full-monodromy comparisons are cited suppliers.
- **G9, Remaining numbered-source subdivision** (deferred). Further subdivision of numbered sources is design work.
- **G10, Library and candidate follow-through** (deferred). Library follow-through is design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, and every missing item is routed exactly once. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or classifies E2, E3, E6, E8 or E12 as affecting a stated result, this continuation supersedes it.

## Binda–Kato–Vezzani: extraction and routing

Codex, session codex-a71f92. Refs #1211. Status: partial checkpoint.

### Result and source scope

The paper adapts Scholze's perfectoid reduction to p-adic cohomology by replacing the prime-to-p étale argument with rational rigid analytic motives. A smooth scheme-theoretic complete intersection has a small neighbourhood with the same motive. Tilting transfers an approximating equal-characteristic variety into that neighbourhood. A smooth alteration, a positive top-degree cycle class and multiplicative Poincaré duality then supply an equivariant cohomological splitting. Equal-characteristic weight–monodromy transfers to the desired direct summand.

The extraction has 131 items: six exact baseline items, six current-stage planned items and 119 missing items, each routed exactly once. All 46 definitions/constructions have use records, three API specifications and three discriminating mathematical tests. These are planning statements, not Lean declarations or formalization claims. There are 16 routes, including four Part II routes; one reuses the existing Jannsen weight-complex candidate rather than creating another roadmap.

The entire [arXiv v2](https://arxiv.org/pdf/2207.00369v2), dated 10 June 2025, was read: §§1–5, all Appendix A, footnotes and bibliography, 36 pages. Images of pages 6, 8, 22, 27 and 29 were inspected where extracted formulas were ambiguous. The [publisher record](https://link.springer.com/article/10.1007/s00222-025-01344-x) identifies Inventiones 241 (2025), 559–603, accepted 9 June and published 17 June 2025. Metadata, abstract and references match the authors' version; the publisher full-PDF request returned paywall HTML. No full journal collation is claimed. Selected v1 passages were compared, not the whole v1. Every downloaded source actually used has URL, hash and reading extent in the JSON.

Supplementary reading includes Scholze's published Proposition 8.7, Corollary 8.8 and Theorem 9.6 with the beginning of its proof; SGA2 XII Corollaries 3.4–3.5 and surrounding remarks; AGV's Tate definitions and entire published three-page erratum; and BGV v2 §4.1's module/nearby-cycle/augmentation discussion. The large original comparison inputs remain individually named gaps, not implicitly read references.

### Mathematical contract

The field of geometric coefficients is the algebraic maximal unramified extension K0^nr, not its completion. A semilinear p-Frobenius becomes a linear q-Frobenius only after its a-th iterate, with q=p^a. The coefficient relation is N phi=p phi N. Ramified comparison changes N to N/e; equality of its monodromy filtration under nonzero scaling does not justify an unscaled operator identity.

The paper's initial coefficient category permits Frobenius endomorphisms. That is larger than the isocrystal category. The nilpotence assertion used for quasi-purity is valid with invertible Frobenius, not for an arbitrary endomorphism: phi=0 and N=identity on Q_p is a counterexample. The quasi-purity items use the corrected scope.

The geometric input is a scheme-theoretic intersection of c hypersurfaces of codimension c, not merely the same reduced zero set. That is what makes the local defining map smooth near its zero fibre. No ampleness of the cutting line bundles is introduced by §4. The tube requires integral formal trivializations and a common rescaling of the sections; transition units preserve its valuation inequalities. The motive-valued local-constancy theorem assumes smoothness, unlike the more general étale neighbourhood statement discussed by the authors.

The motive categories use rational coefficients, strict-étale hyperdescent, A1 invariance for log formal schemes and B1 invariance for rigid spaces. Kummer/log-étale descent or the logarithmic interval (P1,infinity) produces a different further localization. The special-fibre theorem has the disjunction “fine” or “finite topological Krull dimension”; its non-fine general-coefficient extension cannot be assumed without the stated admissibility conditions. The reduced G_m motive is the conventional Tate object shifted by one. Stabilization is unaffected by that shift, but duality and twist formulas are not.

Hyodo–Kato realization is cohomological: it reverses motive maps, and its stated monoidality is on compact objects. The final duality splitting needs multiplicativity and compatibility with traces and operators. A nonzero map of vector spaces alone does not give the required equivariant splitting.

Theorem 5.6 is formulated over C_p without assuming that Y descends to Q_p-bar. Conjecture 5.2 includes that descent hypothesis. Proposition 5.3's equal-characteristic input does require descent to the algebraic closure of F_p((p-flat)). These are separate scopes.

### Proof inventory

Section 2 is decomposed into log structures and local fine models; verticality and value-log bases; semistable charts; strict-étale log motives and Tate stabilization; compact generation, monoidal structure and full subsite comparison; fine and non-fine special-fibre equivalence; affine-limit continuity; generic fibre and the Monsky–Washnitzer adjunction; motivic tilting; the Fargues–Fontaine natural transformation; and rig-étale localization compatibility. The nontrivial contraction/lifting argument inside Theorem 2.20 is a separate item and source gate.

Section 3.1 distinguishes log-rigid HK, proper crystalline comparison, unramified and ramified base change, the geometric coefficient colimit, motivic invariance, overconvergent de Rham comparison, rig-étale descent, the rigid/tilted realization and compact Künneth. Corollary 3.13 is recorded with its normalized monodromy.

Section 3.2 extracts the general realization contract, motivic duality, representability and cycle classes, positivity of the top class and the trace-rank hypothesis. These are reusable inputs, not opaque assumptions in the final theorem.

All of §3.3 was read, although the main proof does not need it. The inventory retains the four parts of Proposition 3.23, chi(1)-modules, unipotent G_m motives, the rational de Rham structure, plurinodal reduction, its blowup/Mayer–Vietoris proof, equal-characteristic arithmetic HK, Galois descent and the arithmetic comparison diagrams. “Generated by good reduction” does not mean every member has a smooth formal model. Two broken references in the arithmetic comparisons are recorded.

Sections 4–5 contain the rational-germ continuity argument, local constant relative motives, contractible small bases, Gabber's geometric local product construction, toric invariant divisors and integral models, smoothness of the defining map, the tube theorem, monodromy/purity linear algebra, alterations and rational splitting, equal-characteristic weight–monodromy, toric motive tilting, the open-domain square, approximation, alpha, top nonvanishing and the final splitting.

Appendix A is not collapsed into “log-free HK.” It separately supplies a chosen augmentation, nearby cycles, motivic monodromy, bounded weight structures, the Chow and good-reduction hearts, the weight-complex functor, the spectral sequence functorial from E2, orthogonal-purity degeneration, the finite-residue-field weight filtration and weight-graded monodromy. Full-complex monodromy and its log-free comparison are explicitly imported from BGV. The comparison with classical log weight spectral sequences is expected in the appendix, not proved there. The Jannsen/Gillet–Soulé model and the Bondarko/Sosnilo model must be compared by an actual theorem.

### Existing ownership and routes

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

### Source findings requiring review

Fourteen findings are recorded with exact version/locator, short literal excerpt, correction, counterexample or proof check, reach and correction-search record. No finding has an independent-review verdict, and nothing was sent to the authors.

E1 corrects the vertical monoid equation. E2 restricts the log-point prelog construction to sharp monoids/nonunit parameters. E3 fixes the Tate shift, checked against AGV. E4 fixes the repeated tensor factor. E5 flags the Ogus bibliographic mismatch while leaving the exact replacement unverified. E6 replaces inversion of p by a uniformizer in the equal-characteristic formula. E7 restores every torus summand in the plurinodal proof. E8 fixes the Frobenius-invertibility condition.

E9 is the substantial connectedness concern. On P1×P1, the zero scheme of X0X1 in O(2,0) is two disjoint P1 fibres. It is smooth and a positive-dimensional scheme-theoretic hypersurface, but has top cohomology of rank two. SGA2 XII3.5 assumes an ample line bundle. Scholze's published Theorem9.6 explicitly assumes geometric connectedness. The printed BKV rank-one step therefore needs either an integrality convention for “variety,” an explicit connectedness hypothesis, or a componentwise construction. One cannot simply assert that each component remains a complete intersection. This does not disprove the weight–monodromy conclusion.

E10 similarly qualifies the general top trace: a connected union of two intersecting projective lines has two top components. It may be resolved by an integral-variety convention. E11 records the nonexistent Proposition3.8(2) references. E12 records the introductory normalization omission. E13 distinguishes a chosen augmentation from a unique one: [BGV v2 Remarks4.17–18](https://arxiv.org/pdf/2306.05099v2) identifies the rational-unit torsor and the finite-residue-field restriction.

E14 records an already published correction in an imported source: [AGV's 2025 erratum](https://doi.org/10.1017/fms.2024.97). Ordinary-topos equivalence alone does not imply enhanced sheaf equivalence. Cover refinement and essential-image hypercover hypotheses are needed; the non-hypercomplete case requires truncated hypercovers. The erratum's authors verify their original applications, but that is not a substitute for checking a new log-site application.

### Completion boundary and verification

The JSON contains ten exact gaps with consuming item IDs. Resume with journal collation and the connectedness convention, then LP16's original local-field theorem, log-specialization lifting, Vez/LBV/CN/EY comparison maps, arithmetic cross-references and the enhanced weight-complex/full-monodromy comparisons. Further split the remaining bundled subsidiary assertions before claiming declaration-level closure.

The full BKV paper has been read; this does not mean its entire imported mathematical dependency tree has been established. Every extracted missing item is routed, but the extraction remains partial because those source and granularity boundaries remain real.

Validation: the paper checker, intake path validation, paper-checker tests, source-issue tests, and separate structural/mathematical checks are run before publication. The last checks test unique IDs, known stages, acyclicity, exact-once missing ownership, API/test counts and small monoid/Frobenius/normalization examples. They do not prove the research mathematics. No Lean compilation was attempted because no Lean deliverable is authorized.
