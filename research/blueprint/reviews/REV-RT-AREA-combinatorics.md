# Independent review of RT-AREA-combinatorics

Job: REV-RT-AREA-combinatorics; Refs #1544. Reviewer: **Codex / codex-7e92bd**, 2026-09-24.

All **44** submitted findings have an individual verdict: **36 confirmed, 8 rejected**.
The machine-readable reasons in `research/blueprint/redteam/RT-AREA-combinatorics.review.json`
are the correction contracts, including qualifications that replace overbroad proposed fixes.
No roadmap, audit, upstream library, baseline, or existing finding was edited by this review.

## Independence and evidence

The red-team report names Claude Code / cc-2aeb03. Issue #1545 independently records that
worker's claim and submission in PR #2686. I did not write RT-AREA-combinatorics. My separate
RT-AUDIT-16 work is not this red-team submission and is not substituted for checking its findings.

Repository inputs were frozen at `f9236b81ec7f9a2347e8f1847216959995efff21`. I read the complete finding records,
the focal roadmaps, the relevant decomposition nodes/gaps, reviewed coverage, restructuring and
link-map entries, paper-routing records, and the named upstream/source passages. The focal README
blobs also match those read in full during RT-AUDIT-16. Source searches and declaration statements
were checked at the binding **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and
**Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. Later upstream files are identified as
post-pin prior art, never used to upgrade a pinned library verdict.

This is verification of the submitted findings, not a new exhaustive area audit or a compilation
certificate. The broad post-pin PR inventory in /23 is not certified as a replacement audit.
Public source PDFs and immutable repository files were obtained directly; the report below records
public URLs and the decisive locators. No unavailable private source is assumed.

## Material corrections to the proposed fixes

**Source selection is not an automatic prerequisite edge.** Finding /1 treats an unselected route
as an unavoidable cycle, although AC.2 expressly owns its selected ergodic/combinatorial inputs and
the decomposition already records acquisition of a complete Szemeredi proof as a gap. Findings /10
and /11 similarly turn newer valid results into mandatory extensions of source-scoped targets.
Those three findings are rejected. This does not close the existing source-acquisition obligations.

**The graph-limit cycle is not inevitable.** For /31 I checked both the LNGL/migration route and
the alternative the README actually names. LNGL 10.31–10.32 uses the Second Sampling Lemma;
the migration source uses it too. But Janson 8.10 points separately to BCL uniqueness, whose
anchor-sequence/moment proof in §§5.3–5.4 does not require the cut-distance sampling target in
Layer 9c. Reject /31's universal claim. If the fixer selects the sampling route, it must split the
sampling phases; it must not silently impose that route through /40. The sampling branch's own
missing cut-norm estimates (/32) are still confirmed. The wrong LNGL locator (/42) is separately
confirmed.

**Preserve the binding baseline and existing ownership decisions.** /23 is an orchestrator's
possible baseline-update request, not an error at the specified pins. /28 overlooks ACT-O02's
explicit three-way Fourier coordination; shared notation does not justify a new whole-stage
dependency. /19 does not identify a duplicated theorem in PM.5, and /20 describes a route the
independent paper review has already rejected. These findings do not authorize expansion or new
edges. Conversely, /13 must preserve the accepted LieGroups Part II allocation for global
nilpotent and quotient geometry, and /39 requires maintainer reconciliation of the upstream
finite-only proof design rather than an unauthorized rewrite of it.

**Use corrected mathematical contracts.** /12 needs Tao–Vu's actual cyclic `(rho/d)^d N` bound
and a separate general-group coset-progression form. /17 must ensure enough distinct terms, not
only a nonzero difference in a too-small cyclic group. /21 must keep the nonempty-coordinate
hypothesis when excluding even Construction A for odd modulus. /29 must address the zero code
and empty-coordinate cases before using a minimum-norm formula. /30 separates division by the
code cardinality from the real square-root change of variables. /38's arity-3 companion is not an
all-arities hypergraph-removal theorem. /44 needs an actual split or relocation, since a bare
Layer2-to-Layer1 edge creates a reverse dependency on the kernels and cut norms.

The confirmed analytic gaps remain substantive: quantitative inverse/box interfaces for Kai;
Siegel-corrected Mitsui and ideal Type I/II inputs; a consistent transference route; finite-family
lattice/discriminant comparison; conditional-expectation and compactness contracts; sampled
cut-norm estimates; reflection positivity with merged labeled edges; coupling reuse; and
countable projective extension. A named theorem or thematic overlap is not treated as a supplied
proof of these interfaces.

## Verdict register

The JSON reason for each ID contains the evidence and the accepted correction or rejection rationale.

| Finding | Topic | Verdict |
|---|---|---|
| /1 | Szemeredi route and ordering | rejected |
| /2 | Arithmetic removal closure | confirmed |
| /3 | Import pinned Roth and related results | confirmed |
| /4 | Corrected and quantitative inverse-theorem sources | confirmed |
| /5 | Kai number-field branch | confirmed |
| /6 | Mitsui inside Kai | confirmed |
| /7 | Type I/II and progression estimates | confirmed |
| /8 | Transference proof-route mismatch | confirmed |
| /9 | Unsupported Bombieri–Vinogradov edge | confirmed |
| /10 | Mandatory PFR expansion | rejected |
| /11 | Mandatory modern progression bounds | rejected |
| /12 | Minkowski-II and Bohr/GAP contract | confirmed |
| /13 | Shared nilmanifold carrier | confirmed |
| /14 | Fourier ownership and torsion specialization | confirmed |
| /15 | Unsupported/retired AC.0 inputs | confirmed |
| /16 | Wrong audit identifier | confirmed |
| /17 | Nontrivial progression statement | confirmed |
| /18 | Complex and box Gowers interfaces | confirmed |
| /19 | Alleged PM.5 duplication | rejected |
| /20 | Already-rejected norm-form route | rejected |
| /21 | Type II at all even moduli | confirmed |
| /22 | Finite-family lattice discriminants | confirmed |
| /23 | Changing the binding baseline | rejected |
| /24 | Missing coding dependency graph | confirmed |
| /25 | Coding forward references | confirmed |
| /26 | Gluing constructor name | confirmed |
| /27 | Existing matrix code API | confirmed |
| /28 | Already-recorded Fourier sharing | rejected |
| /29 | Lattice-code consumer contract | confirmed |
| /30 | Normalized MacWilliams coefficient ring | confirmed |
| /31 | Alleged unavoidable sampling cycle | rejected |
| /32 | Sampled cut-norm input | confirmed |
| /33 | Map versus mod-null isomorphism | confirmed |
| /34 | Compactness construction contracts | confirmed |
| /35 | Conditional expectation identification | confirmed |
| /36 | Reflection-positive graphon parameter | confirmed |
| /37 | Coupling API ownership | confirmed |
| /38 | Untracked regularity companion | confirmed |
| /39 | Finite/analytic regularity overlap | confirmed |
| /40 | Graph-limit edges and stale status | confirmed |
| /41 | Countable projective-limit supplier | confirmed |
| /42 | Graph-limit source locators | confirmed |
| /43 | Built interval-map theorem | confirmed |
| /44 | Step approximation before triangle | confirmed |

## Public source register and locators

- **/1–3, /10–12, /17:** [Tao–Vu, Additive Combinatorics](https://math.bme.hu/~gabor/oktatas/SztoM/TaoVu.AddComb.pdf), Lemma 4.22 and Proposition 4.23, printed pp.168–169; [Kral–Serra–Vena](https://arxiv.org/pdf/0804.4847v1), §2 Lemma 6 and its cycle application, pp.5–6, and §3; [GT2008](https://arxiv.org/pdf/math/0404188v6), §2. The existing Roth statements were read in the pinned [Mathlib Roth file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Additive/Corner/Roth.lean#L137), alongside ThreeAPFree, Behrend, Hales–Jewett and triangle removal.
- **/4–6, /13, /18:** [GTZ v5](https://arxiv.org/pdf/1009.3998v5), (1.1), Lemma 13.2 and p.72 footnote 7, Appendix A; [2024 erratum](https://terrytao.wordpress.com/wp-content/uploads/2024/04/erratum-4.pdf), pp.1–2; [polynomial-orbits erratum](https://arxiv.org/pdf/1311.6170v2), introduction and multiparameter correction; [LSS inverse theorem](https://arxiv.org/pdf/2402.17994v3), Theorem 1.2 and p.2 local-inverse discussion; [Leng equidistribution](https://arxiv.org/pdf/2312.10772), the quantitative source identified by LSS/Kai; [Kai v5](https://arxiv.org/pdf/2306.16983v5), §§2.1–2.6, Proposition 6.4, Lemma 7.1, Theorems 12.1/13.1, pp.54–57. Kai's Proposition 6.4 explicitly identifies [Kai's Mitsui paper](https://arxiv.org/pdf/2209.11816), Theorem 5.1, as its input; this review does not certify the entire analytic proof of either paper.
- **/7–9:** [Mobius–nilsequence orthogonality](https://arxiv.org/pdf/0807.1736v4), Theorem 1.1, §3 Proposition 3.1, §7 p.19 and Appendix A Propositions A.1–A.2; [Linear equations in primes](https://arxiv.org/pdf/math/0606088v2), Appendix D, especially Theorem D.3 and its following remarks; [CFZ relative Szemeredi](https://arxiv.org/pdf/1305.5440v2), p.2; [CFZ exposition](https://arxiv.org/pdf/1403.2957v4), §8 and footnote 9. These support the distinction between the existing heavier proof and the optional smoother-majorant/dense-model proof; no complete replacement proof is certified by this review.
- **/10–11:** [GGMT characteristic two](https://arxiv.org/pdf/2311.05762v2), introduction; [GGMT bounded torsion](https://arxiv.org/pdf/2404.02244v2), Theorem 1.1; [PFR project](https://github.com/teorth/pfr), README; [Bloom–Sisask exposition](https://arxiv.org/pdf/2302.07211v3), Theorem 1; [Green–Tao four-term bound](https://arxiv.org/pdf/1705.01703v3), introduction; [LSS progression bounds](https://arxiv.org/pdf/2402.17995v2), Theorem 1.1; [LeanAPAP](https://github.com/YaelDillies/LeanAPAP), README. These are checked as proposed extensions, not silently incorporated into scope. Live project README progress statements are not compilation evidence.
- **/20:** [Matthiesen](https://arxiv.org/pdf/1409.5028v2), Theorems 1.1/1.3 and pp.1–3. The decisive intake evidence is the existing Harpaz–Wittenberg route-8 rejection in the frozen atlas.
- **/21, /29:** [Harada–Miezaki](https://arxiv.org/pdf/1205.6947v2), §§2.1 and 2.4, pp.4,6–7. This public primary research source explicitly attributes the all-even-modulus Type II definition/iff to Bannai–Dougherty–Harada–Oura. The even-modulus congruence also follows directly from `(2k-a)^2-a^2 = 4k(k-a)`; odd-modulus non-evenness uses a coordinate vector, hence needs a coordinate. The report's extra 1999/2022 examples are not needed for the verdict.
- **/22, /26–28:** pinned [binary discriminant sums](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Operations.lean), [coding matrices](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/InformationTheory/Coding/Matrix.lean), and Overlattice/{Basic,Isotropic,OrthogonalQuotient/Bilinear,OrthogonalQuotient/Quadratic}. I checked the statements and their active hypotheses, not merely names. The [post-pin character sums](https://github.com/TauCetiProject/TauCeti/blob/b3decc7/TauCeti/InformationTheory/Coding/CharacterSum.lean) are supplementary prior art. The [upstream coding Suggested file](https://github.com/TauCetiProject/TauCetiRoadmap/blob/2172af4/TauCetiRoadmap/AlgebraicCodingTheory/Suggested.lean) confirms the outdated two-power docstring and the corrected gluing interface.
- **/31–36, /42, /44:** [Lovasz author's draft](https://www.cs.elte.hu/~lovasz/bookxx/hombook-almost.final.pdf), printed pp.149–150,160–165,169–170,174: Theorem 9.23, Lemmas 10.6–10.9,10.16,10.31–10.32, Corollary 10.34, Theorems 11.3/11.5. PDF SHA-256 `2d1f1ed87a75d0d137bfc67e61dd1b86f8b69f16078966846afceb103af0f088`. [Janson v3](https://arxiv.org/pdf/1009.2376v3), Theorems 7.1/8.10/A.7/A.9 and Lemma 7.3; [BCL uniqueness](https://arxiv.org/pdf/0803.1244v2), §§5.3–5.4; [Lovasz–Szegedy](https://arxiv.org/pdf/math/0408173v2), §5.5 and Theorem 2.7. BCL is decisive contrary evidence to /31.
- **/31–34:** [pinned migration source](https://github.com/cameronfreer/graphon/tree/6eccca5bbe5c9df46d7129bf59575b8b9b1d6699), InverseCounting.lean around 2485–2530, SamplingPointwise.lean design notes, CutDistance.lean around 1038–1072, Compactness.lean around 1470–1505. Its proof route is evidence about that implementation, not an impossibility theorem for other proofs.
- **/33, /35, /37, /40–44:** pinned Tau Ceti CutMetric/{Pullback/Basic,UnitIntervalModel,Triangle}, GraphonSpace/Basic, StepGraphon/{Energy,Regularity}, HomDensity/Finite, both coupling files, UnitIntervalMap and [Countable projective limits](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean#L167); Mathlib [kernel representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Probability/Kernel/Representation.lean#L126), martingale convergence and NoAtoms/NullSingletonClass. Source searches distinguish absent bridge theorems from already-built constituents.
- **/38–39:** [TauCetiRoadmap PR66](https://github.com/TauCetiProject/TauCetiRoadmap/pull/66), still open when checked, head `7ffda51c239fcceaee33c6f3e4e3b49a3b56f756`; [Regularity README at that head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7ffda51c239fcceaee33c6f3e4e3b49a3b56f756/TauCetiRoadmap/Regularity/README.md), Layers 0–3 and Required interoperability results. Its finite-only design and arity-3 limit are explicit constraints on any reconciliation.

## Validation and publication

**PASS:** red-team checker; all 44 source findings covered exactly once (36 confirmed, 8 rejected); exact two-file intake with zero problems. All 39 captured input blobs and both absent-output guards matched fresh main `f37263ec05ac8a5af7207306d55f202112c7ed9e`. The full issue instructions and bot-confirmed claim (comment 5807285450, confirmation 5807287239) were unchanged before publication.

No Lean file is delivered and no Lean compilation was performed. Static source inspection and
mathematical counterexamples are not presented as kernel-checked proofs. Upstream changes are
maintainer notes under PROTOCOL §15, not edits made by this review.
