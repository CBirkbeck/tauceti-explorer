# Bhatt–Scholze (2017): projectivity of the Witt vector affine Grassmannian, extraction and routing

Issue [#1300](https://github.com/CBirkbeck/tauceti-explorer/issues/1300). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** B. Bhatt and P. Scholze, *Projectivity of the Witt vector affine Grassmannian*, Invent. Math. 209 (2017), 329–423.
  - arXiv v3, the final arXiv version, was re-fetched; its SHA-256 (b4d5a4e0…) matches the checkpoint.
  - Unpaywall lists only the arXiv submitted version, so the version of record could not be collated.
  - Crossref registers no erratum.
- **Items.** The result has **266 items: 23 library, 35 planned and 208 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-six are recorded under `sourceIssues`.

## Independent review (REV-PAPER-BHATT-SCHOLZE-17)

The independent review (Claude Code, session cc-2aeb03, 23 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-BHATT-SCHOLZE-17.md`; the counts in the sections below it are the earlier ones
and are superseded by these.

- **Items: 363** (17 library, 35 planned, 311 missing), each missing item routed once.
  - 139 fields corrected: 73 statements, 63 locators, 2 kinds, 1 name.
  - 104 items added for definitions, constructions and cited inputs the proofs use.
  - Seven removed as not in the paper: L07–L10, L16, L17 (tori and cocharacters, never mentioned) and G816 (a Keel lemma the
    paper does not cite).
- **Routes.** All eighteen stand; route 18's brief and the items of the source routes carry the confirmed corrections.
- **Prerequisites.** Rebuilt as 28 cited works with DOIs or stable links.
- **Mistakes: 56** (40 misprints, 11 gaps, 5 errors); 5 reach a stated result and 10 a proof.
  - **E1–E26** are confirmed; nine are revised (E2 was introduced in v3; E23's argument is also in v2, with a counterexample).
  - **E27–E56** are new, each checked independently. The main ones:
    - **E27:** Theorem 1.3 needs "of finite presentation".
    - **E28:** Proposition 3.12 fails in the cardinality-truncated Perf.
    - **E41:** Proposition 9.7 needs k algebraically closed.
    - **E29, E31, E36, E37, E39, E42, E52:** gaps in Lemma 4.6, Corollary 5.6, Theorem 6.13, Lemma 7.7, Theorem 8.3,
      Proposition 10.1 and Proposition 11.41, all fillable.
  - Theorem 1.1 and the other main results stand.

## This continuation (cc-442dc5)

**Items.**
- Question 10.6 was only in the `openQuestions` list; it is now a statement-only item.
- Theorem 1.2 is the introduction form of Theorem 4.1; the corresponding items now name it.

**Reclassified to affect nothing.** Twelve misprints whose intended form is fixed by the objects named around them:
- E2, E3, E4, E5, E6, E8, E9, E15, E20 and E25, which the checkpoint had marked as affecting the proof;
- E10 ("projective dimension 1" for "at most one");
- E14 (X/Y for X/S).

**Unchanged.**
- **E16.** The truncation bound; the proof needs only a finite bound.
- **E23 and E24.** Earlier-version errors corrected in v3, with `known` values naming the correction. E24 is the one finding that still affects a stated result.

**Gaps.**
- Q-Tor is recorded as a finding (E24).
- Q-source is unavailable.
- The others are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), arXivv3 abstract p1. *Printed:* charactristic *Correction:* characteristic
- **E2** (misprint; affects nothing), arXivv3 Example2.3 p5. *Printed:* does not lift to X-tilde *Correction:* The valuation does not lift to the deleted open subscheme X.
- **E3** (misprint; affects nothing), arXivv3 proof Lemma2.6 p5. *Printed:* dim Z ≤ n−1 *Correction:* Use dim Z≤dim Y−1 in the induction on the target dimension.
- **E4** (misprint; affects nothing), arXivv3 proof Lemma3.18 p15. *Printed:* B tensor_A^L A′ = B′ *Correction:* With X=Spec A and Y=Spec B as named, use A tensor_B^L B′=A′.
- **E5** (misprint; affects nothing), arXivv3 proof Lemma4.6 p16. *Printed:* E = O_Xperf *Correction:* Use E=O_Yperf.
- **E6** (misprint; affects nothing), arXivv3 proof Lemma4.6 p17. *Printed:* I^n/I^(n+1) *Correction:* For extension from nE to (n+1)E use I^(n+1)/I^(n+2), since mE was defined by I^(m+1).
- **E7** (misprint; affects nothing), arXivv3 proof Theorem4.1 p17. *Printed:* Condition (i) of Proposition4.5 *Correction:* Use condition(i) of Corollary2.14.
- **E8** (misprint; affects nothing), arXivv3 proof Proposition6.1 p20. *Printed:* E ∈ Vect(X) *Correction:* Use E∈Vect(Y).
- **E9** (misprint; affects nothing), arXivv3 proof Theorem6.13 p26. *Printed:* H0(X_eta,O_Xeta) ≃ K^r *Correction:* Use H0(X_eta,E_eta)≃K^r.
- **E10** (misprint; affects nothing), arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention. *Printed:* projective dimension 1 *Correction:* Use projective dimension at most one, or separately exclude Q=0 when claiming equality one.
- **E11** (misprint; affects nothing), arXivv3 proof Lemma7.7 p29. *Printed:* if M is of projective dimension 1 *Correction:* Use Q in place of M.
- **E12** (misprint; affects nothing), arXivv3 Lemma7.9 p29. *Printed:* {type(Q)≤λ} subset { ... } *Correction:* Use equality when defining the type locus by the following set of primes.
- **E13** (misprint; affects nothing), arXivv3 Remark7.12 p30. *Printed:* K0(W(X) → X) *Correction:* Use K0(W(X) on X).
- **E14** (misprint; affects nothing), arXivv3 Theorem11.12 p42. *Printed:* the Cech nerve of X/Y *Correction:* Use X/S.
- **E15** (misprint; affects nothing), arXivv3 proof Theorem11.27 p46. *Printed:* Rf0,* O_Y0 *Correction:* Use Rf0,*O_X0.
- **E16** (error; affects the proof), arXivv3 proof Theorem11.2 p47. *Printed:* Perf[a,b](X) is (b−a)-truncated *Correction:* Its core object space is (b−a+1)-truncated; the mapping spaces have the printed bound b−a.
- **E17** (misprint; affects nothing), arXivv3 proof Theorem11.2 p47. *Printed:* (a), (c), (d) *Correction:* Use (1), (3), (4) for the theorem’s numbered assertions.
- **E18** (misprint; affects nothing), arXivv3 proof Lemma11.36 p50. *Printed:* cosimplicial A-complexes *Correction:* Use R-complexes.
- **E19** (misprint; affects nothing), arXivv3 §12 p55, nerve description. *Printed:* n−1 morphisms *Correction:* Use n composable morphisms for an n-simplex of the ordinary nerve.
- **E20** (misprint; affects nothing), arXivv3 Remark12.11 p58. *Printed:* π0 ΩBX = π1 X *Correction:* Use π0 ΩBX=π1 BX.
- **E21** (misprint; affects nothing), arXivv3 bibliography [Mat14] p60. *Printed:* Akhil Matthew *Correction:* Akhil Mathew.
- **E22** (misprint; affects nothing), arXivv3 proof Lemma11.23(2) p45. *Printed:* [Mat14, Proposition3.31] *Correction:* Use [Mat14, Corollary3.31].
- **E23** (error; affects the proof), arXivv1 proof Lemma4.6 PDF16–17, corrected in arXivv3 PDF16–17. *Printed:* H^i(X,I^m) ≃ I^(m−c) H^i(X,I^c) *Correction:* Use the revised argument: reduce to an actual blowup and apply Serre vanishing on the exceptional Cartier divisor, then Frobenius and formal existence.
- **E24** (error; affects a stated result), arXivv2 Remark5.33 PDF26–27; corrected arXivv3 Remark11.33 PDF49. *Printed:* Tor dimension ≤ d *Correction:* Use the corrected bound 2d for pfp algebras over a perfect field. The additional global bound 2d+1 is announced without proof.
- **E25** (misprint; affects nothing), arXivv3 proof Lemma7.13 p31. *Printed:* decreasing filtration *Correction:* The kernels K_m=ker(p^m:Q/pQ→p^mQ/p^(m+1)Q) increase with m. Reverse the finite indexing to use the decreasing-filtration convention of Lemma7.14.
- **E26** (misprint; affects nothing), arXivv3 Proposition11.6 p41. *Printed:* commtuative *Correction:* commutative

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **Q-closure** (deferred). Declaration-sized splitting of compound inputs is design work; every numbered statement is now an item.
- **Q-sites** (deferred). Rydh, Raynaud–Gruson, Huber, Yanagihara and BST13 are cited suppliers.
- **Q-valuations** (deferred). BGR84 and RG71 are cited suppliers.
- **Q-Kdet** (deferred). Quillen, Thomason–Trobaugh, Bhatt14 and de Jong are cited suppliers.
- **Q-Keel** (deferred). Keel's contraction theorem and Artin's contraction are cited suppliers.
- **Q-infinity** (deferred). Mathew's descendability and Lurie's ∞-categorical inputs are cited suppliers; the truncation bound is E16.
- **Q-Tor** (recorded). E24 records the Tor-dimension correction and the announced 2d+1 bound. Kunz and Gabber are cited suppliers.
- **Q-Witt** (deferred). BBE07 and the algebraization input are cited suppliers.
- **Q-groups** (deferred). Zhu 2017 (a separate paper job) and the quasi-affine quotient theorem are cited suppliers.
- **Q-source** (unavailable). The Inventiones version of record is not openly available; arXiv v3, the final arXiv version, was read in full.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-BHATT-SCHOLZE-17 — Witt Grassmannian projectivity and its foundations

This is a **partial extraction checkpoint**, by Codex, session `codex-c83e7a`, for issue #1300. The entire 61-page final arXiv v3 has been read, including the full derived-descent section, determinant appendix, acknowledgments and bibliography. Recursive original-source proofs and declaration-sized closure remain open. No result is claimed formalized and no Lean file was written or compiled.

The primary source is Bhargav Bhatt and Peter Scholze, [Projectivity of the Witt vector affine Grassmannian, arXiv1507.06490v3](https://arxiv.org/pdf/1507.06490v3), revised 21 February 2017. [Springer’s publication record](https://link.springer.com/article/10.1007/s00222-016-0710-4) identifies Inventiones mathematicae209(2),329–423. Its published PDF was not obtained: a request returned HTML. The 95-page published layout is therefore **not** claimed to have been read or collated with the 61-page arXiv layout. Every source issue names the version actually inspected.

The paper constructs bounded mixed-characteristic lattice Grassmannians as perfections of projective schemes, together with a canonical ample determinant line. Its proof supplies reusable mathematics well beyond that target: valuative covers, perfect-scheme descent, Witt vector bundles, fibre-trivial descent, a signed spectral determinant, descendability, unbounded derived h-descent, and Frobenius-inverted Witt cohomology. Sections11–12 are fully included even though the geometric projectivity proof can avoid the K-theory route.

### Proof structure and the ownership decisions

The geometric branch runs from the h/v-cover criteria through perfected abstract-blowup patching and valuation-base vector-bundle descent. A proper pfp map with cohomologically trivial fibres then descends fibre-trivial bundles. Applied to the determinant of the graded quotients on a Demazure resolution, this constructs the line on the Grassmannian. The stronger connected-fibre-only theorem6.13 is recorded separately; it is not made a prerequisite of the earlier theorem6.8.

The second determinant branch goes through graded Picard groupoids, perfect complexes, support K-theory at the Witt special fibre, regular devissage and alterations. After sheafification, low K-theory identifies with the signed Picard target. This constructs the support determinant with a contractible uniqueness statement. The geometric branch uses ordinary exterior-power determinants and does not depend on the spectral construction. A common full-flag refinement compares the resulting lines and gives coherent compatibility across bounds.

The resolution is a tower of Grassmann bundles. Weighted quotient determinants are ample, ordinary quotient determinants have sections at open-stratum points, and the descended line is strictly positive on curves. Its pullback is nef and big with exceptional locus inside the boundary. Keel’s criterion and induction on the finite dominance interval give semiampleness. Stein factorization yields a projective contraction; equality of the two reduced closed equivalence relations identifies its v-coequalizer with the original lattice sheaf. Zhu’s algebraic-space representability theorem8.2 is an alternate input and is excluded from this scheme-projectivity dependency chain. Zhu’s ind-properness and Kottwitz component theorem are genuine inputs in the general parahoric branch of §9.

The atlas already assigns this Witt geometry to `GeometricSatakeAndFusion:GS0:Witt-geometry`. General perfect schemes, classical sites, Picard groupoids, positivity and birational models remain shared `SchemeAndStackFoundations` suppliers. The newly landed `PAPER-BHATT-MATHEW-21` supplies the candidate `ArcTopologyAndDescent`; its early scheme h/v sites, universal descent and valuation toolkit are reused here. Witt vector-bundle and fibre-trivial descent remain GS0 obligations. General perfection retains GS as a consumer while using the SF supplier. The enhanced category and descendability work belongs to `EnhancedDerivedSheaves`, with the early abstract, animation and hyperdescent layers kept separate from later concrete spectrum comparisons. The K-theory constructions, supports, determinants, group completion, spectra and K2 comparison use the existing K-theory family’s different owners.

The existing arc candidate is reused with its original brief and these additional BS17 proof inputs; it is not a second roadmap identifier. Only one new continuation is proposed: `CrystallineCohomologyWittHDescentPartII`. CR.4 owns ordinary Witt complexes and smooth comparisons, while CR.7 explicitly leaves general singular/nonproper theories to source-qualified extensions. Proposition11.41 supplies h-descent of Frobenius-inverted Witt cohomology for arbitrary finitely presented schemes over a finite-dimensional noetherian F_p-base, followed by rational Witt descent. The existing `CrystallineCohomologyConvergentPartII` concerns log/convergent tensor extensions and is a different consumer; the two must not duplicate their shared ordinary Witt or derived foundations.

### Important scope distinctions

- Proper pfp in perfect schemes is not ordinary proper finite presentation. General perfection, the inverse-limit ring construction called `Perfection`, and the direct-limit perfect closure are not interchangeable carriers.
- Tor-independence in Lemma3.16 is for a diagram of perfect **algebras**. It does not imply every perfect-ring map is flat on arbitrary modules.
- A line-bundle class is not a line bundle with a gluing isomorphism. The graded determinant needs the Koszul symmetry and cannot be replaced by an ungraded symmetric functor.
- The ordinary derived category and its triangulated structure do not provide the enhanced mapping spaces and coherent category limits used in §11.
- The core of `Perf[a,b]` is `(b−a+1)`-truncated. Its mapping spaces have the smaller bound printed in the paper. For vector bundles over F3, the nontrivial automorphisms detect the missing degree.
- The finite global-dimension bound from a regular presentation is measured using that presentation’s dimension. The corrected intrinsic Tor bound is `2 dim R`; the intrinsic global bound `2 dim R+1` is announced without proof in the paper.
- The SLn extension comparison uses the stable K2 extension pulled back to SLn. At rank two it does not assert an identification with every unstable universal Steinberg kernel.
- Positive-dimensional perfected projective stages already have infinite-dimensional sections of an ample line. This is different from ordinary finite-type projective geometry.
- “Strict” in Definition12.1 means trivial self-braiding, not strict associativity or unit constraints. The spectrum connectivity convention is explicitly `π_j(X_i)=0` for `j<i`.
- The questions in10.6 and11.24 are listed as questions posed in2017. Their current research status was not investigated and is not asserted open.

### Concrete mathematical checks

The dominance comparison was checked on every equal-size partition pair of total length at most10. For `μ≤λ`, the first quotient kernel has dimension `r=n_μ(0)−n_λ(0)`, and the exact incidence threshold is

`a_m = r + Σ_(i≥m+1)(n_μ(i)−n_λ(i))`.

The checks verify `a_m≤r` and `a_m≤n_μ(0)−n_μ(m)`. The kernels `K_m=ker(p^m:Q/pQ→p^mQ/p^(m+1)Q)` increase; reverse their finite indexing before applying the decreasing-filtration convention of Lemma7.14. This last direction is a further source misprint, with its own correction search.

There is also an explicit witness for the corrected nodal counterexample. Let `R=(k[x,y]/xy)_perf`, `M=R/(x)`, `N=R/(y)`, and `I_y=Ann_R(x)`. Two short exact sequences identify

`Tor₂^R(M,N) = ker(I_y/yI_y → R/(y))`.

In the monomial description of R, `I_y` is spanned by positive y-exponents in `Z[1/p]`. The class of y maps to zero in `R/(y)` and is nonzero modulo `yI_y`, since all monomials of `yI_y` have exponent strictly greater than one. Thus Tor₂ is nonzero. The quotients by `(x)` and `(y)` are not perfect: for example, `y^(1/p)` is a nonzero nilpotent modulo `(y)`. This explains exactly why the perfect-algebra Tor theorem does not apply.

Other finite checks cover the determinant block-swap sign, the `(2,1,0)` Demazure example, the corrected exceptional-thickening index, and a declared tame-symbol convention. They are mathematical diagnostics, not Lean proof checks. The appendix’s homotopy equivalences and the geometric tame-symbol comparison remain proof obligations.

The result contains **265 items**: 23 library imports, 35 planned items and 207 missing items. There are 18 routes, 77 definitions/constructions, 231 API statements and 231 mathematical acceptance specifications. All 26 source findings await independent review.

### Route briefs and destinations

#### 1. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; `source` route; 31 items.

Own general perfection, pfp models, morphism properties, pushouts and formal blowup geometry once. GS0 consumes these common results; it does not create a private theory of perfect schemes.

Stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

Imports: Pinned Scheme and PerfectClosure carriers, SchemeAndStackFoundations:SF.1/SF.2.

Suggested future module: `TauCeti/AlgebraicGeometry/Perfect/Models.lean`.

#### 2. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; `source` route; 3 items.

Reuse the Picard-groupoid owner found in PAPER-WITASZEK-22. Add the abstract Picard interface needed for coherent determinant descent, retaining the pinned invertible-sheaf category as its carrier.

Stages: `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

Imports: Pinned Core and InvertibleSheaf, KTheoryLowDegrees:Z.3 signed determinant consumer, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/Picard/Groupoid.lean`.

#### 3. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; `source` route; 5 items.

Supply general positivity, finite Frobenius power descent and Keel’s criterion from the existing divisor/intersection/birational foundations. Keep original Artin contraction and gluing as explicit source gates.

Stages: `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`.

Imports: Pinned line-bundle carrier, SchemeAndStackFoundations:SF.0 perfection, GeometricSatakeAndFusion:GS0:Witt-geometry consumes semiampleness.

Suggested future module: `TauCeti/AlgebraicGeometry/LineBundle/Keel.lean`.

#### 4. EnhancedDerivedSheaves

Owner `EnhancedDerivedSheaves`; `source` route; 12 items.

These perfect-ring Tor, projective-dimension and valuation-module lemmas supply the existing derived-module foundation. Import ordinary commutative algebra from Mathlib; add the perfect-ring hypotheses and the exact finite-dimension bridges used by BS, without a parallel private derived category.

Stages: `EnhancedDerivedSheaves:E1`.

Imports: Pinned Tor, DerivedCategory and finite projective modules, SchemeAndStackFoundations:SF.0, Existing commutative algebra and valuation suppliers.

Suggested future module: `TauCeti/Algebra/Homology/PerfectRing/TorDimension.lean`.

#### 5. EnhancedDerivedSheaves

Owner `EnhancedDerivedSheaves`; `source` route; 17 items.

The existing coherent derived-sheaf and hyperdescent layers own unbounded Dqc, base change, boundedness detection and h-hyperdescent. Preserve the ordinary/perfect/derived scheme distinctions and finite-dimensional base hypotheses.

Stages: `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`.

Imports: SchemeAndStackFoundations:SF.2, EnhancedDerivedSheaves:E5:abstract/E5:animation, Pinned DerivedCategory, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/Derived/PerfectHDescent.lean`.

#### 6. EnhancedDerivedSheaves

Owner `EnhancedDerivedSheaves`; `source` route; 19 items.

The early abstract monoidal enhancement owns descendability, quantitative tensor nilpotence and module descent once. PAPER-BHATT-SCHOLZE-22/48 consumes this generic object in prismatic perfection; do not rebuild it in PR2. No late concrete spectrum-realization edge is needed for the abstract construction.

Stages: `EnhancedDerivedSheaves:E5:abstract`.

Imports: EnhancedDerivedSheaves:E0/E1, Pinned category and symmetric monoidal carriers, StableHomotopyKTheory:H.6 for the derived-limit comparison, after abstract categorical setup.

Suggested future module: `TauCeti/CategoryTheory/Monoidal/Descendable.lean`.

#### 7. EnhancedDerivedSheaves

Owner `EnhancedDerivedSheaves`; `source` route; 11 items.

Animated F_p-algebras, Frobenius discreteness and derived Witt adapters belong to the existing animation layer, with Witt-vector formulas imported from their coefficient owner. The late cotangent-return and spectrum-realization layers are not prerequisites here.

Stages: `EnhancedDerivedSheaves:E5:animation`.

Imports: EnhancedDerivedSheaves:E0/E5:abstract, Pinned WittVector and simplicial objects, CrystallineCohomology:CR.4 for ordinary Witt operators.

Suggested future module: `TauCeti/Algebra/Animated/PerfectWitt.lean`.

#### 8. SchemeKTheoryOperations

Owner `SchemeKTheoryOperations`; `source` route; 7 items.

The shared perfect-complex and scheme-descent layers own the enhanced Perf carrier, its Tor-amplitude strata and the four separate v-hyperdescent assertions. Ordinary DerivedCategory is only a baseline homotopy-category carrier.

Stages: `SchemeKTheoryOperations:S.1`, `SchemeKTheoryOperations:S.4`.

Imports: EnhancedDerivedSheaves:E1/E2/E5:animation, SchemeAndStackFoundations:SF.2, Pinned finite projective modules, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/PerfectComplex/VDescent.lean`.

#### 9. SchemeKTheoryOperations

Owner `SchemeKTheoryOperations`; `source` route; 10 items.

Own K of schemes and Witt complexes supported at p=0, localization, regular devissage and its sheafified extension. The general K model and colimit theorems stay in GeneralAlgebraicKTheory.

Stages: `SchemeKTheoryOperations:S.2`, `SchemeKTheoryOperations:S.3`, `SchemeKTheoryOperations:S.4`.

Imports: GeneralAlgebraicKTheory:K.3/K.4:construction/K.7, SchemeKTheoryOperations:S.1, SchemeAndStackFoundations:SF.4 alterations, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/KTheory/WittSupport.lean`.

#### 10. KTheoryLowDegrees

Owner `KTheoryLowDegrees`; `source` route; 14 items.

Extend the existing determinant and comparison interfaces to graded Picard targets, coherent perfect-complex determinants and the Witt-support determinant. Import the general Picard groupoid from SF and spectra from H.5; do not re-plan the upstream Grothendieck group or exact category.

Stages: `KTheoryLowDegrees:Z.3`, `KTheoryLowDegrees:U.3`, `KTheoryLowDegrees:U.6`.

Imports: SchemeAndStackFoundations:SF.1/SF.3, SchemeKTheoryOperations:S.1/S.2/S.3, StableHomotopyKTheory:H.4/H.5:spectra, GeneralAlgebraicKTheory:K.2:plus/K.4:construction.

Suggested future module: `TauCeti/Algebra/KTheory/Determinant/GradedPicard.lean`.

#### 11. GeneralAlgebraicKTheory

Owner `GeneralAlgebraicKTheory`; `source` route; 3 items.

Reuse the Q/plus/S models and their comparison theorems. Add the symmetric-monoidal projective model and its filtered-colimit interface as compared models, with the landed split exact structure imported unchanged.

Stages: `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.4:construction`, `GeneralAlgebraicKTheory:K.7`.

Imports: tauceti:TauCetiRoadmap/GrothendieckEulerForms, StableHomotopyKTheory:H.4/H.5:spectra, Pinned finiteProjectiveModulesExactStructure.

Suggested future module: `TauCeti/Algebra/KTheory/SymmetricMonoidal.lean`.

#### 12. StableHomotopyKTheory

Owner `StableHomotopyKTheory`; `source` route; 6 items.

The existing homotopy group-completion layer owns the Fin*-Segal construction, coherent subset model and bar/group-completion adjunction. This is different from topological uniform completion or the group completion of a discrete monoid.

Stages: `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.4`.

Imports: Pinned nerve, Core and Quasicategory, EnhancedDerivedSheaves:E0 abstract higher-category operations.

Suggested future module: `TauCeti/AlgebraicTopology/GroupCompletion/Segal.lean`.

#### 13. StableHomotopyKTheory

Owner `StableHomotopyKTheory`; `source` route; 3 items.

The early connective-spectrum layer owns iterated deloopings and the Picard/1-truncated-spectrum comparison. Do not take a late S-construction comparison or EDS concrete spectrum realization as an input to these foundations.

Stages: `StableHomotopyKTheory:H.5:spectra`.

Imports: StableHomotopyKTheory:H.1/H.4, EnhancedDerivedSheaves:E0, SchemeAndStackFoundations:SF.1 abstract Picard interface.

Suggested future module: `TauCeti/AlgebraicTopology/Spectrum/Picard.lean`.

#### 14. GeometricSatakeAndFusion

Owner `GeometricSatakeAndFusion`; `source` route; 64 items.

GS0 explicitly owns bounded Witt lattices, Demazure resolutions and projectivity. This extraction supplies both determinant proofs, the exact Keel induction and the general integral/parahoric loop-group extension, consuming the shared SF/EDS/K suppliers once.

Stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Imports: SchemeAndStackFoundations:SF.0/SF.2/SF.3/SF.4/SF.5, KTheoryLowDegrees:Z.3, SchemeKTheoryOperations:S.3 only for the alternate spectral determinant proof, RelativeFarguesFontaine:RF0, ReductiveGroupsPartII parahorics, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/AffineGrassmannian/WittProjective.lean`.

#### 15. RelativeFarguesFontaine

Owner `RelativeFarguesFontaine`; `source` route; 1 items.

RF0 already owns the ramified Witt coefficient ring; §9 is an additional source for its group-valued geometric use, not another coefficient-ring construction.

Stages: `RelativeFarguesFontaine:RF0`.

Imports: Pinned WittVector, Specified O_K over W(k), GeometricSatakeAndFusion:GS0:Witt-geometry consumer.

Suggested future module: `TauCeti/Algebra/PeriodRing/RamifiedWitt.lean`.

#### 16. K2SymbolsBrauer

Owner `K2SymbolsBrauer`; `source` route; 3 items.

The existing Steinberg and tame-residue layers own the stable K2 extension and localization-boundary comparison. Add the determinant-geometric realization as a late application, with a stable pullback for small rank rather than a universal unstable-kernel claim.

Stages: `K2SymbolsBrauer:T.1:classical`, `K2SymbolsBrauer:T.1:plus`, `K2SymbolsBrauer:T.3:symbols`, `K2SymbolsBrauer:T.3:localization-comparison`.

Imports: GeometricSatakeAndFusion:GS0:Witt-geometry, KTheoryLowDegrees:Z.3/U.3, SchemeKTheoryOperations:S.3, GeneralAlgebraicKTheory:K.2:plus.

Suggested future module: `TauCeti/Algebra/KTheory/K2/WittLoopExtension.lean`.

#### 17. The arc-topology and descent for étale cohomology

Owner `ArcTopologyAndDescent`; `new` route; 30 items.

Reuse the candidate identifier and design scope newly supplied by PAPER-BHATT-MATHEW-21; this is an additional source for that one roadmap, not a second arc owner. Its h/v scheme topology and universal-descent toolkit include these earlier BS17 inputs. SF.2 supplies classical sites; perfectoid v-sites remain distinct.

Plan the arc-topology of Bhatt and Mathew and the descent theorems it yields for étale cohomology of schemes. The final theorems are: (1) the criterion (their Theorem 4.1): for an ∞-category C compactly generated by cotruncated objects and a finitary functor F : Sch_qcqs^op → C satisfying v-descent, F satisfies arc-descent if and only if F is excisive, if and only if F satisfies aic-v-excision, i.e. for every absolutely integrally closed valuation ring V and every prime p ⊂ V the square F(V) → F(V/p), F(V_p) → F(κ(p)) is cartesian; (2) arc-descent for étale cohomology (their Theorems 5.4 and 5.13): for a torsion coefficient sheaf, X ↦ RΓ(X_ét, F) is an arc-sheaf, and for a finite ring Λ the functor X ↦ D^b_cons(X_ét, Λ) is a hypercomplete arc-sheaf; (3) the consequences (their Theorems 1.12 and 1.15, Corollaries 4.25 and 6.7): every arc-sheaf valued in an ∞-category with small limits satisfies excision for Milnor squares and formal glueing; (4) the classical applications reproved from them: the Gabber–Huber affine analogue of proper base change in the stated class of examples, the Fujiwara–Gabber theorem on the étale cohomology of the complement of a henselian pair (their Theorem 6.11), GAGA for the étale cohomology of proper rigid spaces (their Corollary 6.18), and Artin–Grothendieck vanishing for affinoids over a complete algebraically closed nonarchimedean field (their Theorem 7.3): H^i(Spec(A)_ét, F) = 0 for i > d + 1 for every torsion sheaf, and for i > d when F is ℓ-power torsion with ℓ prime to the residue characteristic. The roadmap must cover: the v-topology and the arc-topology on qcqs schemes with their comparison (a v-cover is an arc-cover; they agree over a noetherian base) and the characterisation of arc-covers as universal spectral submersions; the valuation-theoretic toolkit — rank ≤ 1 and absolutely integrally closed valuation rings, faithfully flat aic extensions, cardinality bounds, filtered colimit presentations by finite-rank subrings, and the structure of specialisations; the ∞-categorical descent formalism — finitary functors, universal F-descent and its sorites, targets compactly generated by cotruncated objects, and detection of descent by ultraproducts and by aic valuation rings; the interval induction and the proof of the criterion; the arc-topos on schemes of bounded size, its coherence, and the pushout descriptions of excision and formal glueing squares that remove the finitariness hypothesis; the examples — étale cohomology and constructible complexes, Rydh's étale objects, Huber–Jörder h-differentials in characteristic zero, and perfect complexes on perfect F_p-schemes with the identification of arc-covers as universally effective epimorphisms; and the arc_t-variant for rigid geometry with its invariance and Künneth statements, leading to the vanishing theorem of Section 7. Import, and do not re-plan: schemes, morphisms and limits of schemes from Scheme and stack foundations (SchemeAndStackFoundations), stage SF.0; fpqc/fppf descent and algebraic spaces from SF.1; the Zariski, étale, fppf and pro-étale sites of schemes, sheaf cohomology and proper and smooth base change from SF.2; constructible coefficient categories from Étale duality and perverse sheaves (EtaleDualityAndPerverseSheaves), stage EDC.0, and affine Artin vanishing as EDC.4 imports it; unbounded cohomological descent, Postnikov completion and hypercompleteness from Enhanced derived sheaves (EnhancedDerivedSheaves), stage E2; spectral spaces, the constructible topology and profinite techniques from Diamonds and v-stacks (DiamondsAndVStacks), stage D0; ultraproducts and Łoś's theorem from Logic and definability in number theory (LogicAndDefinabilityInNumberTheory), stage LD.0; Milnor squares, relative K-theory and excision from General algebraic K-theory (GeneralAlgebraicKTheory), stages K.5 and K.6; Tate algebras, Huber rings and topologically finite type algebras from the Tau Ceti roadmap Adic spaces, Layers 0 and 1, and adic spectra and their étale sites from Adic étale geometry (AdicEtaleGeometry), stages A0 and A1; and perfections of schemes in characteristic p from Geometric Satake and fusion (GeometricSatakeAndFusion), stage GS0:Witt-geometry. Record explicitly that the v-topology here is the one on qcqs schemes and is not the v-topology on perfectoid spaces and diamonds of DiamondsAndVStacks D2: the two have different covering conditions, and Example 6.15 of the paper is the only comparison between them. Additional source BS17: construct h/v covers on qcqs schemes, Rydh proper/open refinement and finite inductive levels of proper covers. Prove the set- and space-valued abstract-blowup criteria, cohomological variants, approximation of affine v-covers and the finite-truncation/continuity criterion for v-descent. Prove composition and right cancellation for universal F-descent as separate statements. Construct valuation-product covers and ultrafilter components, using the existing model-theory supplier, and finite-rank valuation approximation; compare the perfect convex-subgroup decomposition with the arc excision square. Export these early inputs to GS0’s Witt vector-bundle theorem and the EDS derived h-descent theorem. Later perfect-complex arc-descent consumes those earlier geometric results, so the shared candidate must use stage-level order and must not introduce a cycle. Keep the scheme h/v topology distinct from perfectoid v-sites. BS17 supplies the earlier proof route, not a claim that its paper proves the later arc applications.

Imports: SchemeAndStackFoundations:SF.0/SF.1/SF.2, EnhancedDerivedSheaves:E0/E2, LogicAndDefinabilityInNumberTheory:LD.0, DiamondsAndVStacks:D0, GeometricSatakeAndFusion:GS0:Witt-geometry.

Suggested future module: `TauCeti/AlgebraicGeometry/Topology/ValuativeDescent.lean`.

#### 18. Crystalline cohomology, de Rham–Witt and logarithmic foundations, Part II: Witt cohomology under h-covers

Owner `CrystallineCohomologyWittHDescentPartII`; `part-ii` route; 3 items.

CR.4 owns ordinary Witt complexes and smooth comparisons; CR.7 explicitly leaves more general singular/nonproper theories to separate source-qualified extensions. The existing convergent/log tensor-section continuation does not own this ordinary singular h-descent theorem.

Extend Crystalline cohomology, de Rham–Witt and logarithmic foundations (CrystallineCohomology), importing its ordinary Witt operators at CR.4, Scheme and stack foundations (SchemeAndStackFoundations SF.0/SF.2/SF.4) for sites, proper-cover refinement, blowups and pushouts, and Enhanced derived sheaves (EnhancedDerivedSheaves E5:animation/E2) for derived Witt vectors and coherent descent. For a noetherian F_p-scheme S of finite Krull dimension prove that X↦RΓ(X,W O_X)[1/F] is an h-sheaf on finitely presented S-schemes, and deduce the rational [1/p] theorem of Berthelot–Bloch–Esnault. This permits singular and nonproper X; it is not a smooth crystalline comparison theorem. Prove finite Witt fppf descent, invariance under finite universal homeomorphisms after F-inversion, the corrected blowup/formal-thickening reduction, and the distinguished Witt triangle for every derived self-product in the Čech nerve. Use the derived-discreteness supplier to remove derived structure only after inverting F. Close the pushout and original BBE proof sources before claiming completion. Test a perfect field, a nilpotent thickening, an abstract blowup square, an imperfect-base derived intersection and the distinction between F-inversion and p-inversion. Preserve the separate convergent/log tensor-section owner CrystallineCohomologyConvergentPartII.

Imports: CrystallineCohomology:CR.4, EnhancedDerivedSheaves:E5:animation/E2, SchemeAndStackFoundations:SF.0/SF.2/SF.4, ArcTopologyAndDescent, reused candidate: early scheme h/v-site and universal-descent layers.

Suggested future module: `TauCeti/AlgebraicGeometry/Cohomology/WittHDescent.lean`.

### Item inventory

Each statement below has its prerequisites, API and tests in the companion JSON. The inventory retains the source’s actual version and the corrected conventions above. Missing and planned entries are specifications, not implementation claims.

#### L01 — Witt-vector coefficient carrier

**definition; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

The pinned p-typical Witt-vector carrier is defined for a commutative coefficient ring. Perfect characteristic-p hypotheses are imposed separately for p-torsionfreeness and the geometry used here.

Pinned imports: `mathlib:WittVector`.

API: Reuse WittVector.mk on a coefficient sequence. Equality follows from equality of every coefficient. The map to L preserves the existing ring operations.

Acceptance cases: Equal coefficient sequences give equal vectors. Over F_p the fraction field specializes to Q_p after the standard comparison. Witt addition in positive coordinates is not coordinatewise addition in general.

#### L06 — Connected reductive group predicate

**definition; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Pinned imports: `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `tauceti:TauCeti.reductiveCommHopfAlgProperty_iff`.

API: Reuse the geometric normal-unipotent-subgroup characterization. Transport the predicate through permitted field extensions. Transport reductivity under Hopf-algebra isomorphisms.

Acceptance cases: G_m is reductive. GL_n is reductive in characteristic zero. The additive group is not reductive.

#### L07 — Algebraic torus predicate

**definition; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Pinned imports: `tauceti:TauCeti.torusCommHopfAlgProperty`, `tauceti:TauCeti.torusCommHopfAlgProperty_iff`.

API: A geometric split-torus isomorphism proves the predicate. The geometric fiber has the specified finite rank. Transport the torus predicate along an isomorphism.

Acceptance cases: G_m is rank one. A norm-one quadratic torus need not be split. G_a is not a torus.

#### L08 — Geometric character lattice

**definition; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Pinned imports: `tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`.

API: Expose the action inherited from geometric scalar extension. Identify a character with a group-scheme map to G_m. Addition of characters corresponds to multiplication of their values.

Acceptance cases: X*(G_m) is Z. Conjugation acts by minus one on a real norm-one torus. The trivial torus has zero character group.

#### L09 — Cocharacter lattice and pairing

**definition; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Pinned imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing`.

API: Use the integral-dual linear equivalence. Evaluate a character on a cocharacter as an integer exponent. The dual action evaluates against the inverse Galois action on characters.

Acceptance cases: For G_m, exponents a and b pair to ab. The zero cocharacter pairs to zero. Simultaneous sign reversal on a norm-one torus preserves the pairing.

#### L10 — Perfect character-cocharacter pairing

**theorem; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

For a torus over a field, its integral character-cocharacter pairing is perfect.

Pinned imports: `tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L16 — Finite free cocharacter lattice

**theorem; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

For a torus over a field its integral cocharacter module is finite free.

Pinned imports: `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free`, `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L17 — Galois invariance of the pairing

**theorem; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged.

Pinned imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L23 — Perfect coefficient-ring predicate

**construction; library**. Source: §§1–3,9, imported coefficient or reductive-group foundation.

For a commutative ring R of characteristic p, PerfectRing R p asserts that x↦x^p is bijective. The pinned predicate is more general and needs only a power operation; its characteristic-p ring use is the present specialization.

Pinned imports: `mathlib:PerfectRing`.

API: Supply injectivity and surjectivity of the p-power map. Every element has a unique pth root. Ring maps between perfect characteristic-p rings commute with inverse Frobenius.

Acceptance cases: A finite field is perfect. The zero ring has a bijective power map. Fp[t] is not perfect since t has no polynomial pth root.

#### L30 — Truncated Witt-vector carrier

**construction; library**. Source: §4.

For prime p use W_n(R)=TruncatedWittVector p n R, with its established Witt operations; the underlying type is Fin n→R.

Pinned imports: `mathlib:TruncatedWittVector`.

API: Construct from n coefficients. Equality is coefficientwise. Truncate full Witt vectors and compose finite truncations.

Acceptance cases: W_1(F_p)=F_p. W_0(R) has one element. Coordinatewise multiplication is not the Witt product in general.

#### L31 — Direct-limit perfect closure

**construction; library**. Source: §3.

For a commutative characteristic-p ring, p prime, PerfectClosure R p is the quotient of pairs (n,x) by (n,x)~(n+1,x^p). This is the affine coordinate-ring construction used for scheme perfection.

Pinned imports: `mathlib:PerfectClosure`.

Prerequisites: `L23`.

API: Construct the class of (n,x). The successor Frobenius relation identifies (n+1,x^p) with (n,x). Use its existing perfect-closure maps when forming affine geometric adapters.

Acceptance cases: The class of x^(1/p) has pth power x. PerfectClosure F_p p is F_p. Mathlib Perfection R p is an inverse limit of rings and cannot replace this direct limit for arbitrary R.

#### L32 — Ordinary categorical core

**construction; library**. Source: §12.

Core C retains objects and only isomorphisms, with composition and inverse inherited from C.

Pinned imports: `mathlib:CategoryTheory.Core`.

API: Construct Core objects and morphisms from isomorphisms. CoreHom is the isomorphism type in C. Include Core C faithfully into C and transport functors.

Acceptance cases: Core of a discrete category remains discrete. Core of the terminal category is terminal. The zero map of a nonzero module is excluded.

#### L33 — Categorical nerve

**construction; library**. Source: §12, p.55.

The nerve of C has n-simplices consisting of n composable arrows; its maps are induced by precomposition in the simplex category.

Pinned imports: `mathlib:CategoryTheory.nerve`, `mathlib:CategoryTheory.nerveMap`.

Prerequisites: `L32`.

API: Construct the n-simplex from n composable arrows. Zero simplices are objects and one simplices are arrows. Apply nerveMap to a functor, preserving faces and degeneracies.

Acceptance cases: Two composable arrows form a 2-simplex. The identity gives a degenerate 1-simplex. A chain of n−1 arrows is not an n-simplex.

#### L34 — Quasicategory predicate

**construction; library**. Source: §§11–12.

A simplicial set is a quasicategory when every inner horn admits a filler; this existing predicate supplies the concrete model, not its missing mapping-space and stable-category theory.

Pinned imports: `mathlib:SSet.Quasicategory`.

Prerequisites: `L33`.

API: Verify all inner horn fillers. Expose the inner-index conditions 0<i<n. Transport along simplicial equivalences once their theory is constructed.

Acceptance cases: A categorical nerve is a quasicategory. Every Kan complex is a quasicategory. Outer horn filling is not part of the quasicategory predicate.

#### L35 — Symmetric monoidal category predicate

**construction; library**. Source: §12.

A symmetric category is a braided monoidal category whose double braiding is the identity.

Pinned imports: `mathlib:CategoryTheory.SymmetricCategory`.

API: Supply a monoidal category and symmetric braiding. Double braiding is identity for every pair of objects. A symmetric monoidal functor must preserve this braiding.

Acceptance cases: Swapping two one-dimensional summands twice is identity. The tensor unit has its standard symmetry. Self-braiding need not be identity; BS Definition12.1 imposes an additional condition.

#### L36 — Ordinary unbounded derived category

**construction; library**. Source: §11.

For an abelian category C with a chosen localization, DerivedCategory C is the category of integer cochain complexes localized at quasi-isomorphisms.

Pinned imports: `mathlib:DerivedCategory`.

API: Choose HasDerivedCategory.standard in the required universe. Q sends quasi-isomorphisms to isomorphisms. Compare enhanced derived functors to this ordinary localization.

Acceptance cases: An acyclic complex maps to zero. The zero abelian category has a zero derived category. Its ordinary categorical nerve does not supply the stable enhancement.

#### L37 — Tor bifunctor

**construction; library**. Source: Lemma3.16.

In an abelian monoidal preadditive category with projective resolutions, Tor C n left-derives tensoring in the second factor; higher Tor vanishes for projective second argument.

Pinned imports: `mathlib:CategoryTheory.Tor`, `mathlib:CategoryTheory.isZero_Tor_succ_of_projective`.

API: Apply the left-derived tensor functor in degree n. For projective Y, Tor_(n+1)(X,Y)=0. Use its bifunctorial maps on both arguments.

Acceptance cases: Tor_1(R,R)=0. Tensor with the zero object gives zero. The existing Tor functor alone does not prove Tor vanishing for perfect-ring diagrams.

#### L38 — Invertible module predicate

**construction; library**. Source: Construction5.1.

Module.Invertible R M asserts that evaluation M dual tensor M→R is bijective.

Pinned imports: `mathlib:Module.Invertible`.

API: Provide bijective evaluation. Identify the evaluation map with a linear equivalence. Transport through module isomorphisms and tensor products.

Acceptance cases: R is invertible over itself. A nonzero rank-two free module over a field is not invertible. Invertibility is not the same as an arbitrary finite projective module.

#### L39 — Invertible sheaf category

**construction; library**. Source: Construction5.1.

Use Tau Ceti’s full category InvertibleSheaf X of invertible O_X-modules. Its morphisms include noninvertible maps; Pic(X) takes its core.

Pinned imports: `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

Prerequisites: `L38`.

API: Form an invertible sheaf from the existing local rank-one condition. Its underlying object is an O_X-module. Use the existing trivial sheaf and sheaf morphisms before passing to the core.

Acceptance cases: O_X is an invertible sheaf. On the empty scheme the local condition is vacuous. This full category is not a groupoid: zero endomorphisms remain.

#### L40 — Finite projective splitting

**theorem; library**. Source: §§4,7,12.

For a finite projective module over a semiring there are maps R^n→M→R^n with surjective first map, injective second map and composite id_M.

Pinned imports: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`.

Use the pinned finite-generator surjection and projective lifting property.

#### L41 — Exact category of finite projective modules

**construction; library**. Source: §§5,12.

Tau Ceti equips the full finite-projective module category with the exact structure induced from modules; it equals the split exact structure.

Pinned imports: `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`.

Prerequisites: `L40`.

API: Use finiteProjectiveModulesExactStructure. Its conflations are precisely ambient short exact sequences. Compare it to the split structure before group completion.

Acceptance cases: A split sequence P→P⊕Q→Q is a conflation. The zero projective is allowed. Nonsplit exact structures on other categories cannot be discarded.

#### L42 — Scheme carrier

**construction; library**. Source: §2.

A scheme is a locally ringed space locally isomorphic to Spec of a commutative ring; morphisms are locally ringed-space morphisms.

Pinned imports: `mathlib:AlgebraicGeometry.Scheme`.

API: Reuse Scheme and Scheme.Hom. Affine neighborhoods identify the structure sheaf. Use existing fibre products and morphism properties.

Acceptance cases: Spec F_p is a scheme. The empty scheme is allowed. A sheaf-valued lattice functor is not a scheme without representability.

#### L43 — Fppf topology on schemes

**construction; library**. Source: Theorem2.8.

Use the Grothendieck topology generated by jointly surjective flat locally finitely presented families.

Pinned imports: `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

Prerequisites: `L42`.

API: Form covering families through fppfPrecoverage. Each arrow is flat and locally of finite presentation. Base change and compose coverings using the existing instances.

Acceptance cases: A surjective finite etale map gives a cover. An identity is a cover. A proper nonflat cover need not be fppf.

#### S201 — Valuative covers

**definition; missing**. Source: Definition2.1.

For qcqs schemes, f:X→Y is a v-cover if every Spec V→Y from a valuation ring lifts to X after an extension of valuation rings V⊂W.

Prerequisites: `L42`.

API: Construct a cover from valuation-extension lifts. Retain all valuation ranks, not only rank one. Pull back and compose covers, carrying the chosen lift witnesses.

Acceptance cases: A faithfully flat map is a v-cover. The identity is a v-cover. Surjectivity of topological spaces alone is insufficient.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S202 — Refinement of a v-cover

**construction; missing**. Source: Definition2.1.

A refinement X′→Y of X→Y factors through X and is itself a v-cover.

Prerequisites: `S201`.

API: Supply a factorization and cover proof. A factorization without a cover proof is insufficient. Compose refinements and pull them back.

Acceptance cases: A cover followed by its further covering refinement works. The identity refinement preserves all data. The empty subspace of a nonempty cover is not a refinement.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S203 — Subtrusive and submersive comparisons

**theorem; missing**. Source: Definition2.1 and Rydh Cor2.9/Th2.8.

The valuation-extension criterion agrees with universally subtrusive morphisms; a v-cover is universally submersive, and a universally submersive map with noetherian target is a v-cover.

Prerequisites: `S201`.

Import Rydh’s valuation and specialization-lifting proof, retaining the noetherian converse hypothesis.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S204 — Adic detection of v-covers

**theorem; missing**. Source: Remark2.2.

The embedding sending Spec R to Spa(R,R) identifies v-covers with surjections on the underlying adic spaces.

Prerequisites: `S201`.

Use valuations bounded by one, not just scheme points; original Huber construction remains a source gate.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S205a — Flat covers

**theorem; missing**. Source: Example2.3.

A faithfully flat qcqs morphism is a v-cover.

Prerequisites: `S201`.

Lift a suitable specialization or generic valuation point, then use flatness or the valuative criterion of properness.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S205b — Proper covers

**theorem; missing**. Source: Example2.3.

A proper surjective morphism is a v-cover.

Prerequisites: `S201`.

Lift a suitable specialization or generic valuation point, then use flatness or the valuative criterion of properness.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S205c — h-covers

**theorem; missing**. Source: Example2.3.

Every h-cover is a v-cover.

Prerequisites: `S201`.

Lift a suitable specialization or generic valuation point, then use flatness or the valuative criterion of properness.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S206 — Surjective non-v-cover

**theorem; missing**. Source: Example2.3.

Delete one exceptional point from Bl_0(A²_k). The map of the remaining scheme to A² is surjective but fails the v-cover condition for a valuation specializing in the deleted direction.

Prerequisites: `S201`.

The valuation lifts to the proper blowup; its unique relevant lift lies at the deleted point. Correct the printed target X-tilde to X.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S207 — Rydh refinement theorem

**theorem; missing**. Source: Theorem2.4.

A finitely presented v-cover X→Y with Y affine has a refinement that is a quasi-compact open covering of a proper surjective finitely presented Y-scheme.

Prerequisites: `S202`.

Import Rydh Th3.12 with finite presentation and affine target; do not infer this factorization for arbitrary v-covers.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S208 — Inductive level of proper covers

**definition; missing**. Source: Definition2.5.

Level zero means refinement by a proper fppf map followed by a finitely presented nilimmersion. Level≤n adds an abstract modification whose restriction to the exceptional closed subset has level≤n−1, with the proper fppf and nilimmersion refinements of Definition2.5.

Prerequisites: `S202`.

API: Build the level-zero or successor factorization. Track the exceptional restriction and its smaller level. Base change a level witness and preserve the upper bound.

Acceptance cases: A proper fppf cover has level zero. Identity maps have level zero. The exceptional restriction must have a smaller level, not merely be proper.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S209 — Finite inductive level

**theorem; missing**. Source: Lemma2.6.

Every proper surjective finitely presented morphism of qcqs schemes has finite inductive level.

Prerequisites: `S208`.

Approximate over a finite-type Z-model, reduce the target, then induct on its dimension using generic flatness and Raynaud–Gruson flattening.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S210 — h-topology

**definition; missing**. Source: Definition2.7.

On finitely presented S-schemes, the h-topology is generated by finitely presented v-covers.

Prerequisites: `S201`, `S207`.

API: Generate a Grothendieck topology from these covers. Compare generators to proper surjections and fppf maps. Restrict along base change with the finite-presentation condition.

Acceptance cases: A blowup cover belongs to h. An isomorphism generates a trivial covering sieve. Representable presheaves on all schemes are not automatically h-sheaves.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S211 — Abstract blowup square

**construction; missing**. Source: Theorems2.8–2.9.

A cartesian square E→X over Z→Y, with Z finitely presented closed, X→Y proper finitely presented and an isomorphism outside Z, is an abstract blowup square. The criteria may be tested with Y affine.

Prerequisites: `L42`.

API: Build E as X×Y Z with all four maps. Check properness and the complement isomorphism. Base change the square and its hypotheses.

Acceptance cases: The blowup of a closed ideal gives such a square. An identity modification gives a cartesian tautology. An arbitrary proper square without the complement isomorphism is insufficient.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S212 — Set-valued h-descent criterion

**theorem; missing**. Source: Theorem2.8.

A presheaf of sets on finitely presented S-schemes is an h-sheaf iff it is an fppf sheaf and sends every abstract blowup square with affine Y to a pullback square.

Prerequisites: `S209`, `S210`, `S211`.

Induct on proper-cover level after Rydh refinement; sheafify representables before using quotient arguments.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S213 — Space-valued h-descent criterion

**theorem; missing**. Source: Theorem2.9.

The same criterion holds for presheaves of spaces, replacing pullbacks by homotopy pullbacks.

Prerequisites: `S212`, `S211`.

The closed immersion makes the relevant map a monomorphism, so the discrete pushout is also a homotopy pushout; keep the enhanced sheafification.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S214 — Universal descent for a presheaf

**construction; missing**. Source: Lemma2.10.

A map is of universal F-descent if its augmented Cech diagram computes F on the target and this remains true after every base change.

Prerequisites: `S213`.

API: Supply the Cech limit equivalence and every base change. Separate descent for one map from universal descent. Compose universal descent maps and cancel on the right.

Acceptance cases: A split cover has universal descent. The identity Cech nerve is constant. An accidental limit equivalence without base-change control is not universal descent.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S215 — Composition of universal descent

**theorem; missing**. Source: Lemma2.10.

If X→Y and Y→Z are universal F-descent maps, so is X→Z.

Prerequisites: `S214`.

Use the augmented bisimplicial Čech diagram and commute its two homotopy limits.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S216 — Cohomological h criterion

**theorem; missing**. Source: Corollary2.11.

For an abelian fppf sheaf F, if fppf derived sections send every abstract blowup square to a distinguished triangle, h and fppf cohomology of F agree.

Prerequisites: `S213`.

Apply Dold–Kan to truncations of derived sections and the space-valued h criterion.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S217 — Approximation of affine v-covers

**theorem; missing**. Source: Lemma2.12.

Every affine v-cover is a cofiltered limit of h-covers between schemes finitely presented over an affine base.

Prerequisites: `S207`.

Use noetherian approximation and the valuative condition; keep the cover condition throughout the system.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S218 — v-topology on qcqs schemes

**definition; missing**. Source: Definition2.13.

The v-topology is the topology generated by valuation-extension covers on qcqs schemes.

Prerequisites: `S201`.

API: Generate the topology in a fixed universe. Covering families retain the valuation extension condition. Compare h covers and refinements into this topology.

Acceptance cases: An affine valuation product can v-cover a scheme. Identity sieves cover. Rank-one tests alone define a different candidate topology.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S219 — Truncated space-valued v criterion

**theorem; missing**. Source: Corollary2.14.

For fixed finite n, an n-truncated space presheaf on qcqs schemes is a v-sheaf if it satisfies fppf descent, abstract blowup pullbacks and continuity under filtered colimits of affine coordinate rings.

Prerequisites: `S213`, `S217`, `S218`.

Finite truncation lets Cech totalizations commute with filtered colimits; no unrestricted replacement by arbitrary spaces.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S220 — Cohomological v criterion

**theorem; missing**. Source: Corollary2.15.

An abelian fppf sheaf with filtered affine continuity and the abstract-blowup cohomology triangle has v-cohomology equal to fppf cohomology.

Prerequisites: `S216`, `S219`.

Apply the truncated-space criterion degree by degree to the cohomological construction.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S301 — Perfect schemes and geometric perfection

**construction; planned**. Source: Definitions3.1–3.2.

A perfect F_p-scheme has invertible absolute Frobenius. Its perfection is the inverse limit of schemes under Frobenius, hence uses direct-limit perfect closures on affine coordinate rings. Perf is the category of qcqs perfect F_p-schemes.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `L31`, `L42`.

API: Glue affine Spec(PerfectClosure R p) charts. Frobenius on every perfect affine coordinate ring is bijective. Construct X_perf→X and the universal factorization of maps from perfect schemes.

Acceptance cases: The perfection of A¹ has all p-power roots of its coordinate. Perfection kills a nilpotent thickening. The scheme inverse limit must not be modeled by Mathlib’s inverse-limit ring Perfection.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S302 — Size cutoff for the perfect site

**theorem; missing**. Source: Remark3.3.

An uncountable strong-limit cardinal cutoff supplies a small-enough category of qcqs perfect schemes stable under the constructions used here, including the valuation-product cover after increasing the cutoff as needed.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Carry explicit universe growth through the product of valuation rings; do not quantify over a proper class as a set.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3040 — Quasi-compact under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is quasi-compact if and only if its perfection is quasi-compact.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3041 — Quasi-separated under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is quasi-separated if and only if its perfection is quasi-separated.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3042 — Affine under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is affine if and only if its perfection is affine.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3043 — Separated under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is separated if and only if its perfection is separated.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3044 — Integral under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is integral if and only if its perfection is integral.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3045 — Universally closed under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is universally closed if and only if its perfection is universally closed.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3046 — A universal homeomorphism under perfection

**theorem; missing**. Source: Lemma3.4(i).

A morphism of F_p-schemes is a universal homeomorphism if and only if its perfection is a universal homeomorphism.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use the affine universal-homeomorphism maps X_perf→X and the corresponding descent/stability argument of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3050 — Perfection preserves a closed immersion

**theorem; missing**. Source: Lemma3.4(ii).

If a morphism of F_p-schemes is a closed immersion, its perfection is a closed immersion; no converse is asserted by this item.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Pass through affine perfect closures or the universal-homeomorphism comparison, with the stated morphism property.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3051 — Perfection preserves an open immersion

**theorem; missing**. Source: Lemma3.4(ii).

If a morphism of F_p-schemes is an open immersion, its perfection is an open immersion; no converse is asserted by this item.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Pass through affine perfect closures or the universal-homeomorphism comparison, with the stated morphism property.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3052 — Perfection preserves a locally closed immersion

**theorem; missing**. Source: Lemma3.4(ii).

If a morphism of F_p-schemes is a locally closed immersion, its perfection is a locally closed immersion; no converse is asserted by this item.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Pass through affine perfect closures or the universal-homeomorphism comparison, with the stated morphism property.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3053 — Perfection preserves etale

**theorem; missing**. Source: Lemma3.4(ii).

If a morphism of F_p-schemes is etale, its perfection is etale; no converse is asserted by this item.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Pass through affine perfect closures or the universal-homeomorphism comparison, with the stated morphism property.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S3054 — Perfection preserves faithfully flat

**theorem; missing**. Source: Lemma3.4(ii).

If a morphism of F_p-schemes is faithfully flat, its perfection is faithfully flat; no converse is asserted by this item.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Pass through affine perfect closures or the universal-homeomorphism comparison, with the stated morphism property.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S306 — Picard group after perfection

**theorem; missing**. Source: Lemma3.5.

For a qcqs F_p-scheme X, pullback identifies Pic(X_perf) with Pic(X)⊗Z[1/p], functorially in X.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`, `D501`.

Line bundles descend to a finite Frobenius stage; Frobenius pullback is pth tensor power.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S307 — Ampleness survives and descends through perfection

**theorem; missing**. Source: Lemma3.6.

A line bundle L on a qcqs F_p-scheme is ample iff its pullback to X_perf is ample.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`, `G811`.

Use affine nonvanishing loci and descent to a finite Frobenius stage. Ordinary finite type is not imposed on the perfect scheme.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S308 — Etale-site invariance

**theorem; missing**. Source: Theorem3.7.

X_perf→X induces an equivalence of small etale sites.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Import topological invariance of the etale site under universal homeomorphisms.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S309 — Universal homeomorphisms of perfect schemes

**theorem; missing**. Source: Lemma3.8.

A universal homeomorphism between perfect F_p-schemes is an isomorphism.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S301`.

Use weak normality and the affine integral radicial comparison. The later v-descent alternative of Remark3.9 is not the primary proof dependency.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S310 — Perfect finite presentation

**definition; planned**. Source: Definition3.10.

A map of perfect rings B→A is perfectly finitely presented when A is the perfect closure of a finitely presented B-algebra. The corresponding local scheme property is denoted pfp.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Planned stages: `SchemeAndStackFoundations:SF.0`.

Prerequisites: `S301`.

API: Supply a finite-presentation model. Require perfection of the model, not ordinary finite presentation of A. Transport a model under perfect base change and compose pfp maps.

Acceptance cases: F_p[t^(1/p∞)] is pfp over F_p. A perfect field’s identity is pfp. This algebra is not ordinarily finite type over F_p.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S311 — Comparison of perfect models

**theorem; missing**. Source: Discussion after Definition3.10.

Finite-presentation models of a pfp perfect algebra admit common refinements through finite purely inseparable maps after suitable Frobenius shifts.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S310`.

Use descent of the finitely many generators, relations and comparison maps to a finite Frobenius stage.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S312 — Local characterizations of pfp

**theorem; missing**. Source: Proposition3.11.

Perfect finite presentation can be checked on a suitable affine cover and then holds on every eligible affine chart.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S310`.

Spread generators and relations through localization; compare affine models.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S313 — Limit characterization of pfp

**theorem; missing**. Source: Proposition3.11.

For a morphism of perfect schemes, pfp is equivalent to its Hom functor commuting with cofiltered limits of perfect schemes with affine transition maps.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S310`.

Prove the affine finite-presentation criterion and glue; retain the qcqs conventions.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S314 — Descent of pfp objects along limits

**theorem; missing**. Source: Proposition3.12.

The category of pfp objects over a cofiltered limit of perfect schemes with affine transitions is the corresponding 2-colimit of pfp categories over finite stages.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S313`.

Descend objects, morphisms and equalities; object descent alone is insufficient.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S315 — Finite-presentation model over a perfect base

**theorem; missing**. Source: Proposition3.13.

A pfp morphism X→Y of perfect schemes is the perfection of a finitely presented morphism X0→Y.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S314`.

Use absolute finite-presentation approximation and the Frobenius retraction argument over Y.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S316 — Properness in Perf

**definition; missing**. Source: Definition3.14.

A morphism in Perf is proper in this paper when it is pfp, separated and universally closed.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S310`.

API: Combine pfp with separatedness and universal closedness. Distinguish this from the ordinary finite-type definition. Check properness by finite-presentation models and base change.

Acceptance cases: Perfection of a projective variety is proper in Perf. An identity in Perf is proper. A positive-dimensional perfect variety need not be ordinary finite type.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S317 — Proper finite models

**theorem; missing**. Source: Corollary3.15.

A finite-presentation model X0→Y over a perfect base is proper iff its perfection is proper in Perf.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S315`, `S316`.

Use the preserved/reflected separated and universally closed properties of Lemma3.4.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S318 — Frobenius-root ideal

**construction; missing**. Source: Lemma3.16 proof.

In a perfect ring R of characteristic p, the radical of (f) is the union of the ideals (f^(1/p^n)); it is a filtered colimit of copies of R with transition multiplication f^(1/p^n−1/p^(n+1)).

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `L23`, `L37`.

API: Construct the root ideal and its transition maps. Its image in R is the radical of (f). Base change to a perfect R-algebra and identify the image ideal.

Acceptance cases: For f=t in F_p[t^(1/p∞)], all roots lie in the ideal. For f=0 the root ideal is zero. The ordinary ideal (t) is smaller than its radical.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### S319 — Root ideal flatness

**theorem; missing**. Source: Lemma3.16 proof.

The Frobenius-root ideal of one element in a perfect ring is flat.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `S318`.

Use its explicit filtered colimit of free modules; this does not make every quotient flat.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### S320 — Tor vanishing for perfect algebras

**theorem; missing**. Source: Lemma3.16.

For a diagram B←A→C of perfect F_p-algebras, Tor_i^A(B,C)=0 for every i>0.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `S319`, `L37`.

Factor through a free perfect algebra, then resolve radical quotients by root ideals; reduce finitely many generators one at a time.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### S321 — Finite Tor dimension of radical finite quotients

**theorem; missing**. Source: Remark3.17; Proposition11.29 proof.

For perfect R, a quotient by the radical of an ideal generated by m elements has Tor dimension at most m over R.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `S319`.

Induct on generators through flat root ideals, keeping the bound as a bound rather than asserting flatness.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### S322 — Unrestricted perfect-scheme derived base change

**theorem; missing**. Source: Lemma3.18.

For a cartesian square of perfect qcqs schemes and any K∈Dqc(X), derived pullback commutes with derived pushforward across the square.

Prerequisites: `S320`, `Q1101`.

Reduce to affines. With X=Spec A and Y=Spec B, the required ring identity is A⊗^L_B B′≃A′; the printed reversed expression is corrected.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### S401 — Witt schemes and formal Witt schemes

**construction; missing**. Source: §4 opening.

For a perfect scheme X, glue Spec W_n(O_X) into W_n(X); the compatible system in n gives the p-adic formal scheme W(X).

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `L01`, `L30`, `S301`.

API: Glue the finite Witt thickenings on affine opens. Reduction W_n(X)→X is the characteristic-p special fibre. Construct the compatible restriction system and inverse-limit bundle category.

Acceptance cases: W_n(Spec F_p)=Spec Z/p^n. W_1(X)=X. The formal W(X) is not simply an ordinary finite-type scheme.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S402 — Vector-bundle groupoids on Witt schemes

**construction; missing**. Source: §4 opening.

Vect(W_n(X)) and Vect(W(X)) retain finite locally free modules and their isomorphisms, with compatible pullbacks.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S401`, `L32`, `L41`.

API: Construct a bundle and isomorphism in the finite or compatible formal system. On affine X=Spec A use finite projective W_n(A) or W(A)-modules. Pull back along perfect-scheme maps and reduce in n.

Acceptance cases: A free rank-two Witt bundle stays rank two on reduction. The rank-zero bundle is allowed. An arbitrary torsion Witt module is not a vector bundle.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### S403 — Acyclicity of affine Witt bundles

**theorem; planned**. Source: Theorem4.1(i), finite level.

For perfect affine X=Spec A and a finite projective W_n(A)-module M, the associated v-sheaf has derived v-sections M in degree zero.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `S220`, `S402`, `S406`.

Induct on n using the Witt p-filtration and additive cohomology descent.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S404 — Formal Witt acyclicity

**theorem; missing**. Source: Theorem4.1(i), formal case.

The same affine derived v-section statement holds for a finite projective W(A)-module via its compatible finite-level system.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S403`.

Control inverse limits and finite-projective completeness; do not discard a possible derived-limit term without this argument.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S405 — Finite Witt vector-bundle descent

**theorem; planned**. Source: Theorem4.1(ii).

For every n≥1, X↦Vect(W_n(X)) is a v-stack on perfect schemes.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `S219`, `S402`, `S407`.

For n=1 use abstract blowup bundle patching. For n>1 descend the sheaf and its p-filtration, recover a finite projective module from acyclic global sections; then take compatible limits.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S406 — Abstract blowup cohomology triangle

**theorem; missing**. Source: Lemma4.6(i).

For a proper modification of noetherian F_p-schemes and any vector bundle on Y_perf, fppf derived sections on Y, X, Z and E form the abstract-blowup distinguished triangle.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S211`, `S301`.

Reduce by faithful-flat completion and finite-projective splitting to the structure sheaf, then use BST13 Lemma3.9. The bundle is on Y_perf, correcting the proof’s X subscript.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S407 — Abstract blowup vector-bundle patching

**theorem; planned**. Source: Lemma4.6(ii).

For that square, Vect(Y_perf)≃Vect(X_perf)×Vect(E_perf)Vect(Z_perf), as groupoids with a specified overlap isomorphism.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `S406`, `S408`, `S409`.

Full faithfulness uses Hom-bundle cohomology. Essential surjectivity uses the revised blowup reduction, not the invalid v1 formal-functions step.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S408 — Reduction to a blowup and Serre vanishing

**theorem; missing**. Source: Lemma4.6 proof, pp.16–17.

After a covering refinement and thickening the exceptional closed subset, the modification may be treated as a blowup with effective Cartier exceptional divisor and relatively ample ideal; high associated-graded ideal cohomology vanishes.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S209`.

Use Raynaud–Gruson Cor5.7.12 and Serre vanishing. A general proper modification does not directly supply the asserted vanishing.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S409 — Frobenius extension of bundle gluing

**theorem; missing**. Source: Lemma4.6 proof, p.17.

An overlap isomorphism lifts after a sufficiently large Frobenius pullback to a thickening nE, and then successively to every thickening; formal existence algebraizes the compatible isomorphisms.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S408`.

For mE=V(I^(m+1)), the obstruction from nE to (n+1)E uses I^(n+1)/I^(n+2). Serre vanishing kills it; lift bundles only uniquely up to isomorphism.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S410 — v-topology is subcanonical on Perf

**theorem; missing**. Source: Remark4.2.

Representable presheaves on Perf are v-sheaves.

Prerequisites: `S405`.

Apply descent of functions and affine gluing. This assertion does not apply to representables on all schemes.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S411 — Affineness does not descend for perfect v-covers

**theorem; missing**. Source: Remark4.3.

The inclusion of punctured perfect A² into perfect A² is nonaffine, but its pullback along the blowup at the origin is affine.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S301`, `S201`.

Use the exceptional Cartier divisor on the blowup and nonaffineness of punctured affine plane.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S412 — Flat sheaves can fail h-descent

**theorem; missing**. Source: Remark4.3.

For the punctured-plane open immersion j, the derived object Rj_*O becomes a flat quasi-coherent sheaf after the blowup h-cover, yet is not a flat sheaf on the original plane.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S411`, `Q1101`.

Keep the nonzero higher cohomology on the original space; derived descent will recover the complex, not abelian flat descent.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S413 — Hom between Witt bundles is a v-sheaf

**theorem; missing**. Source: Corollary4.4.

For two finite projective Witt bundles E1,E2 over perfect X, the presheaf on Perf/X taking pullback Hom is a v-sheaf.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S403`, `S405`.

Apply affine acyclicity to the Hom bundle and glue.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S414 — Translation from schemes to perfections

**theorem; missing**. Source: Proposition4.5.

For a space presheaf F on Perf, F is a v-sheaf iff X↦F(X_perf) is a v-sheaf on qcqs F_p-schemes.

Prerequisites: `S301`, `S218`.

Perfection preserves the finite products in Cech diagrams and carries covers to covers.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### D501 — Picard groupoid of a scheme

**construction; missing**. Source: Construction5.1; Definition12.14.

Pic(X) is the core of the invertible-sheaf category, with tensor product, unit and dual. Its object classes form Pic(X), while Aut(O_X)=Γ(X,O_X)×.

Prerequisites: `L39`, `L32`, `L35`.

API: Take the core of invertible sheaves and its tensor structure. Keep automorphisms as well as line-bundle isomorphism classes. Construct symmetric monoidal pullback and compare with the ordinary Picard group.

Acceptance cases: Pic(Spec k) has automorphism group k× at its unit. The tensor unit represents the zero Picard class. Equality of Picard classes does not specify a gluing isomorphism.

Open gates: `Q-closure`, `Q-source`.

#### D502 — Graded Picard groupoid

**construction; missing**. Source: Construction5.1; Example12.2(iii).

Pic^Z(X) consists of (L,f) with L a line bundle and f:X→Z locally constant; isomorphisms require equal gradings. Tensor adds gradings and the symmetry multiplies by (−1)^(fg).

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D501`, `L35`.

API: Construct graded lines and their isomorphisms. The self-braiding of degree f is multiplication by (−1)^f. Pull back both the line and its locally constant degree.

Acceptance cases: Two odd lines acquire a minus sign when swapped. The unit is (O_X,0). Ungraded symmetry gives the wrong determinant of a rank-one block swap.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D503 — Homotopy groups of graded Picard objects

**theorem; missing**. Source: Construction5.1.

For a scheme X, π0 Pic^Z(X)=Pic(X)×H0(X_et,Z).

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D502`.

Use classification of line isomorphism classes and the locally constant grading.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D504 — Automorphisms of graded Picard objects

**theorem; missing**. Source: Construction5.1.

π1 Pic^Z(X) at the unit is Γ(X,O_X)×, and its higher homotopy groups vanish.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D502`.

Compute invertible endomorphisms of the trivial line; nerves of groupoids are 1-truncated.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D505 — Graded Picard fibre sequence

**theorem; missing**. Source: Construction5.1.

Pic(X)→Pic^Z(X)→H0(X_et,Z) is a fibre sequence of connective spectra once Picard groupoids are compared with such spectra.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D502`, `A1215`.

The fibre of the grading map is the ungraded Picard groupoid.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D506 — Forgetting degree is not symmetric

**theorem; missing**. Source: Construction5.1; Remark5.4.

The functor (L,f)↦L is monoidal and splits the preceding sequence as E1-spaces, but is generally not symmetric monoidal and does not split it as spectra.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D505`.

Over a field of odd characteristic test the self-braiding of the degree-one trivial line.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D507 — Graded Picard v-descent

**theorem; missing**. Source: Proposition5.2.

X↦Pic^Z(X) is a v-stack on perfect schemes.

Prerequisites: `D502`, `S405`, `S410`.

Use vector-bundle descent, the local rank-one condition and descent of locally constant integers.

Open gates: `Q-closure`, `Q-source`.

#### D508 — Enhanced perfect complexes

**construction; planned**. Source: §5; Theorem11.2.

Perf(X) is the stable enhanced category of O_X-complexes locally equivalent to bounded finite locally free complexes, with pullback and coherent mapping spaces.

Planned stages: `SchemeKTheoryOperations:S.1`.

Prerequisites: `L36`, `L34`.

API: Construct the full enhanced subcategory from local finite resolutions. On an affine scheme compare with compact or dualizable modules over its ring. Pull back perfect complexes and identify their ordinary homotopy category with the existing derived carrier.

Acceptance cases: A finite projective module in degree zero is perfect. The zero complex is perfect. A bounded complex of arbitrary infinitely generated modules need not be perfect.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### D509 — Scheme K-theory spectrum

**construction; planned**. Source: §5 before Proposition5.3.

K(X) is the connective algebraic K-theory spectrum of the enhanced perfect-complex category, compatible with the Thomason–Trobaugh construction and with projective-module K-theory on affines.

Planned stages: `SchemeKTheoryOperations:S.2`.

Prerequisites: `D508`, `A1216`.

API: Apply the common K-theory functor to Perf(X). Compare the affine model to K of finite projectives via the actual comparison theorem. Construct pullbacks and their composition coherence.

Acceptance cases: K0 of a field is generated by its one-dimensional vector space. K of the empty scheme is contractible. The spectrum is not merely the discrete group K0.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D510 — Determinant of perfect complexes

**theorem; missing**. Source: Proposition5.3.

For every qcqs scheme X there is a natural map of connective spectra det:K(X)→Pic^Z(X), sending a finite projective module to its determinant and locally constant rank.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D509`, `A1217`.

Use the affine construction from §12 and Zariski descent; coherent additivity across exact triangles must survive descent.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D511 — Additivity of determinant

**theorem; missing**. Source: Proposition5.3 discussion.

For a distinguished triangle C′→C→C″ of perfect complexes, det C is coherently identified with det C′ tensor det C″.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D510`.

Use K-theory additivity, retaining the associativity and symmetry homotopies for filtrations.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D512 — Witt complexes supported on the special fibre

**construction; planned**. Source: §5, p.19.

Perf(W(X) on X) is the full stable subcategory of perfect W(X)-complexes that become acyclic after inverting p. On affines this is the category of perfect W(R)-complexes supported at p=0.

Planned stages: `SchemeKTheoryOperations:S.3`.

Prerequisites: `D508`, `S401`.

API: Take the kernel of localization to W(X)[1/p]. Support means derived acyclicity after p-inversion, not necessarily termwise p-torsion. Pull back along perfect bases and forget perfect O_X-complexes into this support category.

Acceptance cases: W(R)/p is represented by the two-term multiplication-p complex. The zero complex is supported. W(R) itself is not supported when R is nonzero.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D513 — Witt support K-theory

**construction; missing**. Source: §5, p.19.

K(W(X) on X) is K-theory of the support category; the forgetful exact functor Perf(X)→Perf(W(X) on X) induces a natural map α:K(X)→K(W(X) on X).

Prerequisites: `D512`, `D509`.

API: Apply K to the support category and to the forgetful functor. Distinguish support K from the fibre of K(W(R))→K(R). Pull back α and compare all support maps.

Acceptance cases: For perfect k, a k-vector space gives a p-torsion Witt complex. The zero class maps to zero. α need not be asserted an unsheafified equivalence for every perfect ring.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D514 — Regular devissage for support K-theory

**theorem; planned**. Source: Theorem5.5.

If Y is a regular scheme and Z⊂Y is a regular closed subscheme in the qcqs noetherian K/G setting, K(Z)→K(Y on Z) is an equivalence.

Planned stages: `SchemeKTheoryOperations:S.3`.

Prerequisites: `D513`.

Compare regular K with coherent G on Y,Z and the open complement, then compare localization fibre sequences and Quillen devissage.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D515 — Perfect regular-base Witt devissage

**theorem; missing**. Source: Corollary5.6.

If R is the perfection of a regular F_p-algebra R0, then α:K(R)→K(W(R) on R) is an equivalence.

Prerequisites: `D514`, `D516`, `D517`.

Choose a p-complete flat lift with a Frobenius lift, pass to its Frobenius colimit and p-completion, and apply finite-stage devissage. The lifting argument for general regular R0 remains an explicit original-source gate.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D516 — Frobenius-colimit lift

**construction; missing**. Source: Corollary5.6 proof.

In the proof of Corollary5.6, start with a p-complete flat Z_p-lift A0 of R0 and a Frobenius lift φ. Set A∞=colim_φ A0; its p-adic completion identifies with W(R0_perf).

Prerequisites: `L31`, `S401`.

API: Build A∞ from a specified compatible lift. Keep the completion in the comparison with W(R). Compare reductions modulo p^n and supported perfect complexes.

Acceptance cases: For R0=F_p the construction gives Z_p. Reducing the completion modulo p gives R. The uncompleted colimit cannot simply be identified with W(R).

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D517 — Supported perfect complexes and p-completion

**theorem; missing**. Source: Corollary5.6 proof; Bhatt14 Lemma5.12.

For the p-torsionfree A∞ in Corollary5.6, base change to its p-completion gives an equivalence of perfect complexes acyclic after inverting p.

Prerequisites: `D516`.

Compactness makes a power of p nullhomotopic on a supported perfect complex; compare the resulting finite-level structure on both rings. Recursive proof of the cited algebraization lemma is still pending.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D518 — Filtered-colimit K compatibility

**theorem; planned**. Source: Corollary5.6 proof; TT90 Prop3.20.

The K-theory comparison used in Corollary5.6 commutes with the Frobenius filtered colimit of the support categories.

Planned stages: `GeneralAlgebraicKTheory:K.7`.

Prerequisites: `D517`.

Use compact finite-presentation descent of perfect complexes, their morphisms and K-theory diagrams.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D519 — Sheafified devissage

**theorem; missing**. Source: Theorem5.7 proof.

On perfect schemes the map τ≤1 K(X)→τ≤1 K(W(X) on X) becomes an equivalence after h-sheafification, hence after v-sheafification.

Prerequisites: `D515`, `D518`, `S210`.

Reduce by finite presentation and de Jong alterations to regular perfect models; retain the comparison map, not merely equal K0 ranks.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D520 — Witt support determinant

**theorem; missing**. Source: Theorem5.7.

There is a natural map of connective spectra det-tilde:K(W(X) on X)→Pic^Z(X) extending det on K(X); it is unique up to a contractible space of choices.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D519`, `D507`, `A1218`.

Identify both 1-truncated K presheaves with Pic^Z after sheafification, then compose the canonical map to sheafification.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### D521 — Filtration formula for Witt determinant

**theorem; missing**. Source: Theorem5.7 discussion.

For a supported perfect Witt complex with a finite filtration whose gradeds are perfect O_X-complexes, det-tilde is the tensor product of their graded determinants, coherently independent of the chosen filtration.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D520`, `D511`.

Compare with the regular v-local case and descend the coherent isomorphism; equality of K0 classes alone does not construct the descent datum.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### F601 — Fully faithful pullback across connected proper fibres

**theorem; planned**. Source: Proposition6.1.

For a proper surjective pfp map f:X→Y in Perf with geometrically connected fibres, Vect(Y)→Vect(X) is fully faithful.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `S309`, `S316`, `S402`.

Reduce Hom bundles to O_Y→f_*O_X, and apply Stein factorization: the finite universal homeomorphism becomes an isomorphism after perfection.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F602 — Witt-bundle full faithfulness

**theorem; missing**. Source: Proposition6.1 following sentence.

Under Proposition6.1’s hypotheses, pullback is fully faithful also for Vect(W_n(Y)) and Vect(W(Y)).

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `F601`, `S402`.

Use the finite Witt filtration and then compatible inverse limits; do not infer an essential-surjectivity statement.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F603 — Valuation-product cover

**construction; missing**. Source: Lemma6.2.

A qcqs scheme has a v-cover Spec A where A is a product of representative valuation rings mapping to it. Each connected component of Spec A is a valuation-ring spectrum, and the closed-point subset is closed.

Prerequisites: `S201`, `S302`.

API: Choose representatives at an adequate universe cutoff and form the product. Identify the closed subset Spec(product residue fields) with the space of components. Base change to this cover and spread finite data from a component to a clopen neighborhood.

Acceptance cases: A finite product of fields gives a finite discrete component space. One valuation factor gives its original spectrum. An infinite product spectrum is not the disjoint union of its factor spectra.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### F604 — Ultrafilter valuation components

**construction; missing**. Source: Lemma6.2 proof.

Components of the product spectrum in Lemma6.2 are indexed by ultrafilters; the component ring is the filtered colimit of subproducts over the ultrafilter, hence an ultraproduct valuation ring.

Prerequisites: `F603`.

API: Form the filtered system of subproducts. Use the ultrafilter alternative to prove the domain property and the valuation divisibility alternative. Identify clopen subsets with subsets of the indexing set.

Acceptance cases: A principal ultrafilter recovers the corresponding factor. A one-point index has one component. Treating all ultrafilters as principal loses components.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### F605 — Convex-subgroup valuation decomposition

**construction; missing**. Source: Lemma6.3.

For a perfect valuation ring V and an ordered-value-group quotient Γ→Γ′, construct the localization V′, quotient valuation ring V0 and its fraction field V0′ as in Lemma6.3.

Prerequisites: `L23`.

API: Localize elements mapping to valuation one and quotient elements mapping below one. Identify the common kernel ideal in V and V′. Base change the resulting ring square to a perfect V-scheme.

Acceptance cases: The trivial quotient makes V′ its fraction field and V0=V. The identity quotient isolates the residue field as V0. The disconnected map Spec V′ ⊔ Spec V0→Spec V is generally not a v-cover.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### F606 — Valuation decomposition exact sequence

**theorem; missing**. Source: Lemma6.3.

The maps of Lemma6.3 give 0→V→V′⊕V0→V0′→0.

Prerequisites: `F605`.

The kernel ideal agrees before and after localization; identify the square as a fibre product.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### F607 — Valuation decomposition for derived sections

**theorem; missing**. Source: Lemma6.3.

For any perfect V-scheme X and K∈Dqc(X), the three-term derived-section diagram after base change to V′,V0,V0′ is a distinguished triangle.

Prerequisites: `F606`, `S322`.

Tensor the exact ring square using perfect-scheme derived base change.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### F608 — Finite-rank valuation approximation

**theorem; missing**. Source: Lemma6.4 proof, p.22.

A valuation ring is the filtered union of its finite-rank valuation subrings obtained from finitely generated subalgebras; the corresponding maps of spectra are surjective.

Prerequisites: `F605`.

Restrict valuations to finite-transcendence-degree subfields; torsionfree modules over valuation rings are flat, and the closed point lifts.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### F609 — Localization and reduction detect zero

**theorem; missing**. Source: Lemma6.6.

For a ring R, non-zero-divisor g and C∈D(R), if C[1/g]=0 and C⊗^L_R R/g=0, then C=0.

Prerequisites: `L36`.

The first condition makes every cohomology group g-power torsion; the second makes multiplication by g invertible.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### F610 — Residue tests may fail without noetherianity

**theorem; missing**. Source: Remark6.7.

For a nondiscrete rank-one perfect valuation ring V with fraction field K and maximal ideal m, the nonzero complex K/m has zero derived base change to both K and V/m.

Prerequisites: `F605`.

Use flatness and idempotence of m. The quotient V/g, rather than only the residue field, is needed in Lemma6.4.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### F611 — Triviality over a valuation base

**theorem; missing**. Source: Lemma6.4.

Let f:X→Spec V be proper pfp with V perfect valuation and RΓ(X,O)=V. A vector bundle trivial on every geometric fibre is trivial on X.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `F608`, `F607`, `F609`, `F601`.

Reduce to a complete rank-one algebraically closed fraction field, choose a section, spread special-fibre triviality to a derived V/g thickening, and apply the two zero tests to the section’s cone.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F612 — Cohomologically trivial fibre descent

**theorem; planned**. Source: Theorem6.8.

For proper pfp f:X→Y in Perf with Rf_*O_X=O_Y, E∈Vect(X) descends iff it is trivial on every geometric fibre.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `F603`, `F611`, `S405`, `F601`.

After a valuation-product v-cover, trivializations spread from components to clopen neighborhoods, and effective v-descent finishes.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F613 — Fibrewise cohomology detects the structure pushforward

**theorem; missing**. Source: Lemma6.9.

For proper surjective pfp f:X→Y in Perf, if RΓ(X_ybar,O)=k(ybar) at all geometric points, then Rf_*O_X=O_Y.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `F603`, `F607`, `S315`.

Reduce to rank-one valuations and a finite-presentation model. Frobenius on its finitely presented cohomology modules becomes uniformly nilpotent from the generic and special fibre tests.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F614 — Frobenius splitting consequence

**theorem; missing**. Source: Lemma6.9 discussion.

For a proper finite-type model f0:X0→Y0 over a perfect field, if X0 is Frobenius split and the perfected map satisfies Lemma6.9, then R^i f0_*O_X0=0 for i>0.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `F613`.

O_X0 is a direct summand of the perfected structure sheaf; pass the splitting to higher direct images.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### F615 — Point fibres force an isomorphism

**theorem; missing**. Source: Corollary6.10.

A proper pfp morphism of perfect F_p-schemes with every geometric fibre equal to Spec of its field is an isomorphism.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S317`, `S309`.

A finite-presentation model is proper quasi-finite, hence finite; it is a universal homeomorphism. Alternatively use Lemma6.9 after proving affineness.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### F616 — Filtered torsion determinant line

**construction; missing**. Source: Lemma6.11.

Let k be perfect and Q a finite-length W(k)-module. On perfect X/k let Q_X have a finite decreasing filtration with finite projective O_X-gradeds. Form the tensor product of their determinants.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D502`, `A1203`.

API: Construct the line from the given filtration. Use O_X-linear determinants only on its graded pieces. Pull back filtrations and determinant identifications.

Acceptance cases: For Q=k with its one-step filtration the line is trivial. For Q=0 the empty tensor is O_X. Q itself is not generally an O_X-module.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### F617 — Fibre determinant triviality

**theorem; planned**. Source: Lemma6.11.

The line in Lemma6.11 is trivial on X, for every such filtration of a constant finite-length Witt module.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `F616`, `F612`, `F613`.

One proof uses det-tilde(Q) pulled back from k. The independent geometric proof refines to lines, builds a tower of perfect projective spaces, and descends backward using the p-adic-filtration flag locus.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F618 — Bounded saturated valuation lattice

**construction; missing**. Source: Lemma6.14.

For a spherically complete nonarchimedean field K with full real value group and valuation ring V, a bounded submodule M⊂K^r is m-saturated if M→Hom_V(m,M) is an isomorphism.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

API: Provide the embedding, boundedness and saturation comparison. For r=1, saturation closes an open valuation ball. Transport under a linear isomorphism of the ambient finite vector spaces.

Acceptance cases: A closed ball with radius in |K×| is a free rank-one lattice. The zero submodule is saturated and finite free of rank zero. An open nonzero ball is not saturated under the full real value-group hypothesis.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### F619 — Saturated bounded modules are finite free

**theorem; missing**. Source: Lemma6.14.

Every module M in Lemma6.14 is finite free.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `F618`.

Induct on r via intersection with K^(r−1). Spherical completeness gives Ext1_V(m,V)=0; full real value group makes every closed ball principal.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### F620 — Descent using only connected fibres

**theorem; planned**. Source: Theorem6.13; Theorem1.3.

Let f:X→Y be proper surjective pfp in Perf with geometrically connected fibres. Then E∈Vect(X) descends to Y iff E is trivial on every geometric fibre; the descent is unique up to the unique compatible isomorphism.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `F601`, `F603`, `F619`, `S405`, `F621`, `F622`.

Reduce to valuation bases; replace by flat generic closure, normalize using BGR84, enlarge to a spherically complete algebraically closed field, and apply bounded saturation to H0(X,E). This strengthens Theorem6.8 and is not used to prove it.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F621 — Flat closure and normalization reduction

**theorem; missing**. Source: Theorem6.13 proof, pp.25–26.

In Theorem6.13 the perfect valuation-base problem reduces to a flat model integrally closed in its generic fibre after further v-covers and normalization; vector bundles glue across the special-fibre square.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S405`, `F601`.

Use the closure of the generic fibre, geometric connectedness, BGR84 finite-presentation normalization and the overlap full-faithfulness argument. The original normalization hypotheses remain to be recursively checked.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### F622 — Saturation of global sections

**theorem; missing**. Source: Theorem6.13 proof, p.26.

For the normalized flat model in Theorem6.13, H0(X,E) is bounded in H0(X_eta,E_eta)≃K^r and equals Hom_V(m,H0(X,E)).

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `F621`, `F618`.

Use integral closedness, locally free possibly infinite-rank V-modules from RG71 Cor3.3.13, and Hom_V(m,V)=V. Correct the printed O_Xeta to E_eta.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G701 — Partitions and dominance

**construction; missing**. Source: Definition7.1.

A partition λ is a decreasing eventually-zero sequence of nonnegative integers. Write μ≤λ when λ−μ is a nonnegative sum of the adjacent positive coroots, and λ−1 for subtracting one from each positive entry.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

API: Construct finite-support decreasing sequences and their transpose column counts n_λ(i)=#{j:λ_j>i}. Relate dominance to partial row sums with equal total size. Transport partitions under zero padding and iterate the positive-entry subtraction.

Acceptance cases: For λ=(2,1,0), the column counts are (2,1). The empty partition is the zero type. (2) and (1) have different total size and are incomparable in this order.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G702 — Witt torsion module type

**construction; missing**. Source: Definition7.2.

For algebraically closed perfect k, a finite-length W(k)-module has type λ if it is the direct sum of W(k)/p^λ_i. Over perfect R take this type after base change to geometric points.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G701`, `S401`.

API: Define geometric-fibre type through elementary divisors. Record length and the ranks of p^i Q/p^(i+1)Q for constant type. Transport type under extension of algebraically closed residue fields.

Acceptance cases: W(k)/p² ⊕ k has type (2,1). The zero module has empty type. An arbitrary torsion W(R)-module does not have a single globally constant type.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G703 — Constant type gives projective gradeds

**theorem; missing**. Source: Lemma7.3; Remark7.4.

For perfect R and a finitely generated torsion W(R)-module Q of constant geometric type λ, every p^iQ/p^(i+1)Q is a finite projective R-module of rank n_λ(i).

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G702`, `L40`.

Use reducedness of R and constant fibre ranks for finite modules, then induction on the p-filtration.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G7050 — Dominance criterion 1

**theorem; missing**. Source: Lemma7.5(1).

For partitions λ,μ, the following criterion is equivalent to μ≤λ: λ−μ is a nonnegative integral sum of adjacent positive coroots.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G701`, `G702`.

Identify column tails with sum_j max(λ_j−m,0); use the concavity duality between partial sums and these tails.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G7051 — Dominance criterion 2

**theorem; missing**. Source: Lemma7.5(2).

For partitions λ,μ, the following criterion is equivalent to μ≤λ: For every r the first r entries of μ sum to at most those of λ, and their total sums agree.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G701`, `G702`.

Identify column tails with sum_j max(λ_j−m,0); use the concavity duality between partial sums and these tails.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G7052 — Dominance criterion 3

**theorem; missing**. Source: Lemma7.5(3).

For partitions λ,μ, the following criterion is equivalent to μ≤λ: For every m the sum of n_μ(i) over i≥m is at most the corresponding sum for λ, and their total sums agree.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G701`, `G702`.

Identify column tails with sum_j max(λ_j−m,0); use the concavity duality between partial sums and these tails.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G7053 — Dominance criterion 4

**theorem; missing**. Source: Lemma7.5(4).

For partitions λ,μ, the following criterion is equivalent to μ≤λ: For every m≥0, length(p^m Q_μ)≤length(p^m Q_λ), with equality for m=0.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G701`, `G702`.

Identify column tails with sum_j max(λ_j−m,0); use the concavity duality between partial sums and these tails.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G706 — Isogeny of projective Witt modules

**construction; missing**. Source: Lemma7.6.

An isogeny M1→M2 of finite projective W(R)-modules is a map becoming an isomorphism after p-inversion, with p-power-torsion cokernel; it is injective.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S401`, `L40`.

API: Construct the map and its inverse after inverting p. Use p-torsionfreeness to prove injectivity. Base change isogenies along perfect coefficient rings.

Acceptance cases: Multiplication by p^a on W(R)^r is an isogeny for a≥0. An identity has zero cokernel. A map with a nonzero free cokernel is not an isogeny.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G707 — Isogeny cokernel criterion

**theorem; missing**. Source: Lemma7.7, zero-module convention corrected.

A finitely presented p-power-torsion W(R)-module Q is the cokernel of an isogeny of finite projective Witt modules iff its projective dimension is at most one.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G706`, `L40`.

Take a finite free presentation; its kernel is finite projective by the projective-dimension bound. Conversely the isogeny is a length-one projective resolution. Include Q=0.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G708 — Projectivity after reduction modulo p

**theorem; missing**. Source: Lemma7.8, zero-module convention corrected.

For a finitely presented R-module Q, viewed as a W(R)-module, Q is projective over R iff its projective dimension over W(R) is at most one.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G707`, `S401`.

Lift an idempotent presentation for one implication; for the converse reduce a length-one Witt resolution and use the periodic Tor computation.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G709 — Closed bounded-type locus

**theorem; missing**. Source: Lemma7.9.

For Q as in Lemma7.7, the locus of geometric type ≤λ is represented by a closed subscheme of Spec R; the type has locally constant total length.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G7053`, `G707`.

The determinant valuation gives clopen total-length loci. Express the remaining inequalities as rank conditions on finite presentations of Q/p^mQ.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G710 — Demazure filtration functor

**construction; missing**. Source: Definition7.10.

For a p-torsion W(R)-module Q of projective dimension at most one, Dem_λ(Q) parametrizes finite filtrations with finite projective O-gradeds of ranks n_λ(i), satisfying the specified p-step condition.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G702`, `G707`.

API: Give every submodule, quotient and p-containment in the filtration. Recognize its graded ranks from λ and its quotient isogenies. Pull back the full filtration, not just its isomorphism classes.

Acceptance cases: For one-column λ this is the relevant Grassmann quotient functor. For λ=0 only the clopen locus Q=0 contributes. The functor for arbitrary Q need not be smooth.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G711 — Filtration representability

**theorem; missing**. Source: Proposition7.11.

Dem_λ(Q) is a proper pfp perfect scheme over Spec R.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G710`, `G708`, `S317`.

Induct on λ by a Grassmann quotient of Q/pQ; impose the closed p-containment condition and recurse on the kernel.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G712 — Witt support rank

**theorem; missing**. Source: Remark7.12.

The support class of an isogeny cokernel has a locally constant integer degree, equal at geometric points to its Witt-module length.

Prerequisites: `D513`, `G706`.

Apply the graded determinant degree or the determinant valuation; write K0(W(X) on X), not an arrow-category expression.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### G713 — Image of the filtration scheme

**theorem; missing**. Source: Lemma7.13(i).

Dem_λ(Q) has image exactly the locus type(Q)≤λ.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G711`, `G7053`, `G714`, `G717`.

Use the column-tail inequalities for a filtration; construct filtrations inductively over an algebraically closed point using the incidence Grassmannian.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G714 — Filtered Grassmann incidence variety

**theorem; missing**. Source: Lemma7.14.

Let k be perfect, V a finite-dimensional k-vector space, F^mV (1≤m≤N) a decreasing filtration, and a_m integers with a_m≤dim F^mV. For 0≤n≤dim V and n≥a_m for all m, the closed Grassmannian locus of n-dimensional F with dim(F∩F^mV)≥a_m is projective, nonempty, and its perfection has RΓ(O)=k.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `S314`, `F613`.

Identify the inequalities with Schubert incidence conditions; resolve by successive flag Grassmannians and apply the fibre-cohomology criterion. Keep all rank bounds and the nonempty condition in the declaration-sized sequel.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G715 — Exact-type uniqueness

**theorem; missing**. Source: Lemma7.13(ii).

Over the exact-type λ locus the morphism Dem_λ(Q)→Spec R is an isomorphism.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G703`, `G713`, `F615`.

The only admissible filtration at exact type is the p-adic one; use properness and point fibres.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G716 — Cohomology of filtration fibres

**theorem; missing**. Source: Lemma7.13(iii).

Every nonempty geometric fibre of Dem_λ(Q) has RΓ(O)=its residue field.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G714`, `F613`.

Induct through the incidence Grassmannian and smaller filtration schemes; use Lemma6.9 for the structural pushforward.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G801 — Bounded Witt lattice Grassmannian

**construction; planned**. Source: Definition8.1.

For perfect R, Gr≤λ(R) classifies finite projective W(R)-lattices M⊂W(R)^n[1/p] with M⊂W(R)^n and Q=W(R)^n/M of type ≤λ. Gr_λ is the exact-type open subfunctor.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G702`, `G706`, `S405`, `S415`.

API: Construct lattices as isogenies and form their quotient. Recognize lower type bounds as closed subfunctors. Pull back lattices and compare bounds after multiplication by a power of p.

Acceptance cases: λ=0 gives the standard lattice alone. For n=1 each fixed length gives one lattice. The bound ≤λ includes equality of total lengths, not all smaller lengths.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G802 — Bounded Grassmannian is a v-sheaf

**theorem; missing**. Source: Definition8.1 discussion.

Gr≤λ is a v-sheaf on perfect schemes.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G801`, `G709`, `S405`.

Descend the Witt bundle and its isogeny into the standard bundle, then detect the closed type condition v-locally.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G803 — Prior algebraic-space representability

**theorem; planned**. Source: Theorem8.2 [Zhu14].

Zhu’s result gives Gr≤λ as a proper pfp perfect algebraic space. This is a cited alternate input, and is not used in the paper’s scheme-projectivity proof.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G801`.

Read the cited original representability theorem with its perfect-base convention before using this alternate route.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G804 — Global Demazure resolution

**construction; planned**. Source: Definition8.4.

The sheaf Gr-tilde_λ classifies the lattices of Gr≤λ equipped with the filtration of Definition7.10; ψ forgets the filtration.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G801`, `G710`.

API: Construct the relative filtration functor over every lattice family. Identify base changes of ψ with Dem_λ(Q). Compare refinements of filtrations through their common full-flag refinement.

Acceptance cases: The exact-type locus has one filtration. The zero partition gives an identity map on a point. ψ may have positive-dimensional boundary fibres.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G805 — Proper cohomological resolution

**theorem; missing**. Source: Remark8.5.

The relative map ψ is representable by proper pfp schemes, surjective and an isomorphism over Gr_λ; Rψ_*O=O in the representable-base-change sense.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G804`, `G711`, `G713`, `G715`, `G716`, `F613`.

Apply the relative filtration theorem after every perfect scheme mapping to Gr; do not assume Gr is already representable.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G806 — Smooth projective resolution tower

**theorem; missing**. Source: Proposition8.6.

Gr-tilde_λ is the perfection of a smooth projective variety built as successive Grassmann bundles.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G804`, `G708`.

Construct E_(i+1) as the kernel of E_i→Q_i, use the Witt projectivity criterion at each stage, and identify the next quotient with an ordinary Grassmann bundle.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G807 — First nontrivial boundary fibre example

**theorem; missing**. Source: Example8.7.

For n=3 and λ=(2,1,0), Gr-tilde_λ is a four-dimensional tower of two P²-bundles; the boundary type (1,1,1) is a point whose fibre is P².

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G806`, `G710`.

Write the first two quotient choices and specialize to Q=k³ killed by p; the admissible filtration becomes a single ordinary flag choice.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G808 — Determinant line on the Grassmannian

**construction; planned**. Source: Theorem8.8.

The tensor product of the determinants of the resolution gradeds descends to a line L on Gr≤λ; identify it canonically on every common refinement and under inclusions of bounds.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G805`, `F617`, `F612`.

Alternate proof: Apply the support determinant directly to the universal quotient and compare with the geometric construction on a common full-flag refinement.

API: Construct the line by cohomologically trivial fibre descent. Compare its pullback with the tensor product of the graded quotient determinants. Use common full-flag refinements and full faithfulness to make the comparison across λ coherent.

Acceptance cases: On the one-column Grassmannian it is the Plücker line. The zero bound has the trivial line. Equality of fibrewise determinant degrees alone does not give a descended line.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G809 — Ample weighted quotient determinants

**theorem; missing**. Source: Lemma8.9(i).

On the resolution, a tensor product of det Q_i with sufficiently rapidly decreasing positive exponents is ample.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G806`, `G811`.

Induct up the projective Grassmann bundle tower using the relatively ample Plücker line at each step.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G810 — Sections at the open stratum

**theorem; missing**. Source: Lemma8.9(ii).

For any point of Gr_λ each det Q_i has a global section not vanishing at that point.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G703`, `G806`.

Use p^i times the standard Witt generators and their images in Q_i, then take an appropriate maximal exterior minor.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G811 — Ample, nef, big and exceptional locus interfaces

**construction; missing**. Source: §8; Keel99 Definitions0.1 and1.0.

For a projective finite-type model and line L, retain ampleness, nonnegative curve degree (nef), top self-intersection positivity (big), and E(L), the union of subvarieties where L is not big; compare these with pullback to perfection.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `L39`, `S301`.

API: Specify each predicate on a finite-type model and its pullback to the perfect scheme. Relate curve degree, powers and positive top intersection under finite purely inseparable pullback. Show independence under a common Frobenius refinement of models.

Acceptance cases: O(1) on projective space is ample, nef and big. The trivial line on a positive-dimensional proper integral variety is nef but not big. Strictly positive degree on curves is not used as a general ampleness theorem without the additional argument here.

Open gates: `Q-closure`, `Q-Keel`, `Q-source`.

#### G812 — Strict positivity on Grassmannian curves

**theorem; missing**. Source: Lemma8.10.

The line L has positive degree on every nonconstant proper curve mapping to Gr≤λ; ψ*L is nef on the resolution.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G808`, `G809`, `G810`.

Choose a quotient determinant with positive degree along the first varying stage and sections for the other factors; reduce curves on Gr by proper lifting to the resolution.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G813 — Bigness and boundary exceptional locus

**theorem; missing**. Source: Lemma8.11.

The line ψ*L is big, and its exceptional locus lies in the inverse image of the boundary Gr<λ.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G809`, `G810`, `G811`.

For a chosen open-stratum point, factor a sufficiently high power as an ample weighted tensor times an effective divisor avoiding that point; use Keel Lemma1.7.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G814 — Keel positive-characteristic criterion

**theorem; missing**. Source: Keel99 Theorem0.2; Corollary1.9, used §8.

On a projective scheme over a positive-characteristic field, a nef line is semiample iff its restriction to E(L) is semiample.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `G811`, `G816`, `G817`.

Reduce using an ample-plus-effective-Cartier decomposition, the exceptional-locus inclusion and the finite-universal-homeomorphism power descent. Original Artin contraction and the remaining gluing proof are open prerequisites.

Open gates: `Q-closure`, `Q-Keel`, `Q-source`.

#### G815 — Keel finite-union semiampleness

**theorem; missing**. Source: Keel99 Lemma1.8, used Theorem8.3.

For X=X1∪X2 with L|X1 semiample and L|X2 nef, the exceptional-locus hypothesis E(L|X2)⊂X1 makes L semiample, with the precise reduced gluing setup of Lemma1.8.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `G811`, `G814`.

Apply the ample-plus-effective reduction to X2 and glue powers along the intersection. Close the original gluing hypotheses before exporting a general union theorem.

Open gates: `Q-closure`, `Q-Keel`, `Q-source`.

#### G816 — Powers descend across universal homeomorphisms

**theorem; missing**. Source: Keel99 Lemma1.4.

For a finite universal homeomorphism in characteristic p, sufficiently high p-powers of sections of a pulled-back line descend; the Picard comparison becomes an isomorphism after inverting p under Keel’s hypotheses.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `D501`, `S306`.

Factor a Frobenius power through the finite map and compare line pullbacks and sections; preserve the finite-type hypotheses supplying the uniform power.

Open gates: `Q-closure`, `Q-Keel`, `Q-source`.

#### G817 — Ample-plus-effective reduction

**theorem; missing**. Source: Keel99 Proposition1.6 and Lemma1.7.

If L=A+D with A ample and D effective Cartier on a projective scheme, then E(L)⊂D, and semiampleness reduces to the restriction to D in the precise nef setting of Keel1.6–1.7.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `G811`, `G816`.

Use the formal neighborhoods of D and an algebraic-space contraction; record Artin70 as an unclosed source instead of assuming this contraction.

Open gates: `Q-closure`, `Q-Keel`, `Q-source`.

#### G818 — Semiampleness on the resolution

**theorem; missing**. Source: Theorem8.3 proof.

The line ψ*L is semiample.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G813`, `G814`, `G815`.

Induct on the finite dominance interval. Boundary pieces are smaller Grassmannians already projective with ample L; apply the exceptional-locus criterion to the finite-type resolution model.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G819 — Semiample contraction and relation comparison

**construction; missing**. Source: Theorem8.3 proof.

A sufficiently high power of ψ*L defines a contraction Gr-tilde_λ→X after Stein factorization, with X a perfect projective scheme. Compare its reduced closed equivalence relation with that induced by ψ.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G818`, `G805`.

API: Construct the contraction from a basepoint-free power on a finite-type model. Compare the two relations after algebraically closed field points using connected contracted curves and strict positivity. Pass equality of reduced perfect closed relations to their v-sheaf coequalizers.

Acceptance cases: The zero partition contracts a point to itself. A positive-dimensional ψ-fibre is contracted because L descends. Set-theoretic comparison without closedness and reducedness is insufficient for scheme-level equality.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G820 — Projectivity of bounded Witt Grassmannians

**theorem; planned**. Source: Theorem8.3; Theorem1.1.

Gr≤λ is the perfection of a projective F_p-variety, proper pfp as a perfect scheme, and its canonical determinant line L is ample.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G819`, `G812`, `G802`.

Identify the two v-coequalizers and hence Gr≤λ with the contraction X. The descended positive power of L is ample, which implies L is ample.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G901 — Ramified Witt coefficient ring

**construction; missing**. Source: §9 opening.

For a complete mixed-characteristic discrete valuation field K with perfect residue field k, set W_OK(R)=W(R)⊗_{W(k)}O_K on perfect k-algebras.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `L01`, `S401`.

API: Form the finite base extension using the specified W(k)-algebra structure on O_K. Compare reduction by a uniformizer with R and localization with the loop coefficient field algebra. Transport along perfect k-algebra maps.

Acceptance cases: For O_K=W(k) recover W(R). At R=k recover O_K. The construction requires its coefficient embedding and is not an arbitrary unramified Witt functor.

Open gates: `Q-closure`, `Q-groups`, `Q-source`.

#### G902 — Mixed-characteristic loop groups

**construction; missing**. Source: Definition9.1.

For a smooth affine O_K-group scheme G with generic fibre G_K, define L+G(R)=G(W_OK(R)) and LG(R)=G_K(W_OK(R)[1/p]).

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G901`, `L06`.

API: Define group-valued functors with multiplication and inversion. Include the positive loop group in the full loop group. Base change coefficients and compare faithful matrix representations.

Acceptance cases: For GL1 the values are the corresponding unit groups. The identity section belongs to both functors. Perfectness is essential to the representability assertion used here.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G903 — Loop representability

**theorem; missing**. Source: Proposition9.2; Remark9.3.

L+G is represented by a perfect affine scheme, and LG by a strict ind-affine perfect scheme.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G902`.

Use Witt coordinates for L+ and impose simultaneous pole bounds on matrix entries and inverse entries for L. Do not export this assertion to arbitrary nonperfect test rings.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G904 — Affine Grassmannian of an integral group model

**construction; planned**. Source: Definition9.4.

Gr_G is the fpqc sheaf quotient LG/L+G on perfect k-algebras.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G902`, `S405`, `S415`.

API: Sheafify the action quotient with its specified topology. Compare GLn points with W_OK-lattices, retaining descent for locally free modules. Construct maps induced by integral group homomorphisms.

Acceptance cases: For GLn recover the lattice Grassmannian. The neutral coset is the standard torsor with trivialization. Raw pointwise cosets need not already be the fpqc sheaf quotient.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G905 — Integral-model ind-quasi-projectivity

**theorem; missing**. Source: Corollary9.6 first assertion.

For a smooth affine O_K-model with connected reductive generic fibre, Gr_G is a strict ind-quasi-projective perfect scheme.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G904`, `G820`.

Use a faithful integral representation with quasi-affine quotient and locally closed lattice conditions; reduce ramification through Weil restriction. Read the original embedding theorem before claiming closure.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G906 — Parahoric ind-projectivity

**theorem; planned**. Source: Corollary9.6 second assertion.

If G is a parahoric O_K-model, Gr_G is ind-projective in perfect schemes.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G905`.

Combine the locally closed projective bounds with Zhu’s ind-properness theorem; this general-group branch does use the cited input.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G907 — Kottwitz connected components

**theorem; missing**. Source: Proposition9.7 [Zhu14, Proposition1.21].

For a parahoric model, π0(LG)=π0(Gr_G)=π1(G_K)_Gal(K), compatibly with the Kottwitz map.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G904`, `L16`, `L17`.

Import the original Kottwitz component comparison, its Galois coinvariants and the connectedness of positive loops. This is a cited theorem, not a calculation proved anew in BS17.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G1001 — Normalized determinant for SLn lattices

**construction; missing**. Source: Proposition10.1.

On the determinant-trivial lattice Grassmannian, define L from det-tilde(p^a W_OK^n/M) for a sufficiently negative bound a, with the fixed standard-lattice normalization and coherent independence of a.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `D520`, `G901`, `G808`, `G1008`.

API: Construct the supported quotient and its determinant line. Compare successive bounds by the fixed determinant of the standard quotient. Transport the normalized line along the SLn loop action.

Acceptance cases: At the standard lattice the normalization specifies a trivialization. For n=1 the SL1 Grassmannian is a point. Omitting the standard quotient line loses the canonical comparison between bounds.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G1002 — Determinant central extension

**construction; missing**. Source: Definition10.2.

The extension of LSLn has pairs (g,α) with α:g*L≅L; compose by pullback and composition of the line isomorphisms.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G1001`, `D501`.

API: Define the pair group with its coherent multiplication. Identify kernel elements with automorphisms of L. Construct the projection and compare its pullback to field-valued points.

Acceptance cases: The identity loop with the identity line map is the identity. Scalar automorphisms commute with every lifted loop. A line isomorphism class without an actual α does not define an extension element.

Open gates: `Q-closure`, `Q-groups`, `Q-source`.

#### G1003 — Exact determinant extension

**theorem; missing**. Source: Proposition10.3.

The determinant construction gives a Zariski-sheaf exact central extension 1→Gm→LSLn-tilde→LSLn→1.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G1002`, `G820`.

Use the determinant’s local functorial identifications for local lifts, and Γ(Gr_R,O)=R from the connected perfect projective exhaustion to identify scalar automorphisms.

Open gates: `Q-closure`, `Q-groups`, `Q-source`.

#### G1004 — K2 boundary comparison

**theorem; missing**. Source: Proposition10.4.

On k-points the determinant central extension is the pushout of the stable K2(K) extension pulled back to SLn(K), along the localization boundary K2(K)→K1(k)=k×.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G1003`, `D514`, `A1218`.

Compare the homotopy fibre of localization with the supported determinant; identify the boundary with the tame symbol with the paper’s convention. For n=2 do not replace the stable pullback by an unproved assertion about the universal unstable Steinberg kernel.

Open gates: `Q-closure`, `Q-groups`, `Q-source`.

#### G1005 — Infinite-dimensional sections

**theorem; missing**. Source: Proposition10.5.

For the nontrivial SLn affine Grassmannian and m>0, H0(Gr,L^m) is infinite-dimensional over k. The argument uses n≥2 and its nontrivial projective bounds.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G820`, `G1001`, `G1006`.

On any positive-dimensional bounded perfected projective stage, H0(L^m) is the Frobenius colimit of H0(L0^(m p^r)) and is already infinite-dimensional. Serre vanishing gives surjective restriction maps between stages. The inverse limit along a countable projective exhaustion surjects onto each stage by recursively lifting sections.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### Q1101 — Enhanced unbounded quasi-coherent complexes

**construction; planned**. Source: §11.1; Theorem11.2.

Dqc(X) is the stable enhanced category of unbounded quasi-coherent complexes on a qcqs scheme, with derived tensor, coherent pullback and derived pushforward; on affines it is the module category of the ring spectrum.

Planned stages: `EnhancedDerivedSheaves:E1`.

Prerequisites: `L36`, `L34`.

API: Construct the enhancement and compare its homotopy category to the ordinary derived category. Identify the affine category with derived modules and its perfect objects with dualizable ones. Construct pullback, pushforward and their adjunction with coherent base-change maps.

Acceptance cases: For an affine field, a vector space in degree zero gives its ordinary derived module. The zero complex is both perfect and bounded. An ordinary triangulated category alone does not supply the homotopy limit of categories.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1102 — Tor-amplitude strata

**construction; missing**. Source: Theorem11.2 proof, p.47.

Perf[a,b](R) is the core space of perfect R-complexes with Tor-amplitude in [a,b], detected by tensoring with residue fields. Its mapping spaces are (b−a)-truncated and its object space is (b−a+1)-truncated.

Prerequisites: `D508`, `L32`.

API: Define the full core by uniform Tor-amplitude bounds. Prove the corrected finite truncation bound from the mapping-complex amplitude. Commute this functor with filtered ring colimits and descend the amplitude condition.

Acceptance cases: Perf[0,0](F3) contains a component with automorphism group F3×. For a>b the only possible complex is zero. The core of vector bundles is not a discrete set.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1103 — Animated commutative rings

**construction; planned**. Source: §11.2.

Use simplicial commutative rings localized at weak equivalences, with derived tensor products and homotopy groups, and with Frobenius on animated F_p-algebras.

Planned stages: `EnhancedDerivedSheaves:E5:animation`.

Prerequisites: `L34`.

API: Construct free animated rings and their homotopy groups from simplicial models. Compare ordinary rings with discrete animated rings. Construct Frobenius and derived pushouts functorially.

Acceptance cases: The constant simplicial ring F_p is discrete. The zero ring is discrete and perfect. Ordinary tensor products cannot replace derived pushouts over arbitrary bases.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1106 — Perfect animated Fp-algebras are discrete

**theorem; missing**. Source: Proposition11.6.

If Frobenius is invertible on an animated F_p-algebra A, then π_i(A)=0 for i>0.

Prerequisites: `Q1103`, `Q1108`.

Factor Frobenius on positive homotopy through multiplication at the zero component; equivalently use free animated algebras and the iterated bar construction.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1107 — Cosimplicial perfection is different

**theorem; missing**. Source: Remark11.7.

An analogous discreteness assertion fails for cosimplicial commutative F_p-algebras: perfected ordinary elliptic-curve cohomology can retain H1.

Prerequisites: `Q1106`.

Use the ordinary elliptic curve with bijective Frobenius on coherent H1; the sign of the cohomological degrees matters.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1108 — Multiplication at the zero component

**theorem; missing**. Source: Remark11.8, Gabber argument.

For an animated commutative ring A and i>0, the map π_i(A×A,(0,0))→π_i(A,0) induced by multiplication is zero.

Prerequisites: `Q1103`.

Test universally on Sym_Z(Z²[i]); the cross term lies in connectivity 2i and hence has zero contribution to π_i.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1109 — Perfection forgets derived structure

**theorem; missing**. Source: Corollary11.9.

The perfection of a derived F_p-scheme agrees with the perfection of its classical truncation.

Prerequisites: `Q1106`, `S301`.

Apply the affine discreteness result and glue across derived open covers.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1110 — Perfect-ring pushouts are already derived

**theorem; missing**. Source: Lemma11.10.

For maps A→B,A→C of perfect F_p-algebras, B⊗^L_A C is discrete and equals the ordinary perfect-ring tensor product; the analogous comparison holds for colimits of perfect rings.

Prerequisites: `Q1106`, `Q1103`.

The derived pushout is again Frobenius-invertible, so discreteness identifies its π0 with the ordinary pushout.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1111 — Imperfect bases invalidate the tensor shortcut

**theorem; missing**. Source: Remark11.11.

When A is an imperfect field and B=C=A_perf, the ordinary tensor B⊗_A C can have nonzero nilpotents; the perfect-base condition in the preceding comparison cannot be dropped.

Prerequisites: `Q1110`.

For a missing pth root, the difference of its copies is nonzero but its pth power vanishes.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1114 — Stable monoidal homotopy theory

**construction; planned**. Source: Definition11.14.

A stable homotopy theory here is a presentable symmetric monoidal stable infinity-category whose tensor product preserves colimits separately, with modules over commutative algebra objects.

Planned stages: `EnhancedDerivedSheaves:E5:abstract`.

Prerequisites: `L34`, `L35`.

API: Specify stability, presentability and the colimit-preserving tensor. Construct commutative algebra objects and their module categories. Transport algebra and module objects along appropriately monoidal colimit-preserving functors.

Acceptance cases: The enhanced derived category of modules over a ring is an example. The zero category has the trivial module theory. A symmetric monoidal ordinary category does not automatically carry the required stable enhancement.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1115 — Descendable algebra map

**construction; missing**. Source: Definition11.14; Mathew v1 Definition3.17 and Proposition3.19.

A→B is descendable when the unit A lies in the thick tensor ideal generated by B, equivalently when the augmented truncated Amitsur totalization tower is pro-constant with value A.

Prerequisites: `Q1114`.

API: Construct the Amitsur cosimplicial algebra and its finite totalization tower. Compare thick tensor generation with the pro-constant criterion. Base change a descendable map and transport its witnesses.

Acceptance cases: The identity map is descendable with index at most one. A nilpotent quotient is descendable. Z_p→F_p has convergent completion totalization but is not descendable.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1116 — Module-category descent

**theorem; missing**. Source: Theorem11.15; Mathew v1 Proposition3.21.

For a descendable algebra map A→B, Mod(A) is equivalent to the totalization of Mod(B^tensor_A(•+1)), with its full coherent descent data.

Prerequisites: `Q1115`.

Apply the Barr–Beck argument to extension of scalars, using thick generation for conservativity and preservation of the requisite totalizations.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1117 — Completion is weaker than descendability

**theorem; missing**. Source: Remark11.16.

Z_p→F_p is not descendable, although its Amitsur totalization recovers the p-complete unit: after inverting p, extension of scalars kills a nonzero module.

Prerequisites: `Q1115`.

Use Q_p as a nonzero object annihilated by tensoring with F_p, contrary to conservativity for a descendable map.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1118 — Composition of descendability

**theorem; missing**. Source: Lemma11.17(1); Mathew v1 Proposition3.23.

For A→B→C, if A→B and B→C are descendable then A→C is descendable.

Prerequisites: `Q1115`.

Compose thick tensor generation witnesses or finite tensor-nilpotence bounds.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1119 — Right cancellation of descendability

**theorem; missing**. Source: Lemma11.17(2).

For A→B→C, if A→C is descendable then A→B is descendable.

Prerequisites: `Q1115`.

The thick tensor ideal generated by C is contained in the one generated by B.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1120 — Descendability index

**construction; missing**. Source: Definition11.18.

For F=fib(A→B), the map has index at most m if the m-fold tensor map F^tensor_A m→A is nullhomotopic, with m a nonnegative integer; at m=0 the tensor power is A, so the bound requires the unit object itself to be zero.

Prerequisites: `Q1115`.

API: Record a specified nullhomotopy of the m-fold fibre map. A larger nonnegative bound follows from a smaller one by tensoring the witness; index zero only occurs when the unit is zero. Preserve a bound under base change and the functors of Lemma11.20.

Acceptance cases: An identity has zero fibre and bound one. For a square-zero quotient the square of the ideal map vanishes. Mere convergence of an infinite tower gives no finite index.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1121 — Finite index characterizes descendability

**theorem; missing**. Source: Lemma11.20 first assertion; Mathew v1 Proposition3.26.

An algebra map is descendable iff it has finite descendability index.

Prerequisites: `Q1120`.

Compare the tensor powers of the augmentation fibre with the fibres of the finite Amitsur totalizations.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1122 — Functorial preservation of the index

**theorem; missing**. Source: Lemma11.20 second assertion.

A colimit-preserving lax symmetric monoidal functor between the stable settings of Lemma11.20 preserves an established finite descendability index on the induced algebra map.

Prerequisites: `Q1120`, `Q1114`.

Use the bar presentation of relative tensor and the lax structure maps to carry the explicit nullhomotopy; keep the stated hypotheses on the functor.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1123 — A quantitative open-cover example

**theorem; missing**. Source: Example11.19.

For R=Z[a,b,c,d]/(ab+cd−1), the cover D(a)⊔D(c) is descendable with index at most five. The proof uses dim R=4 and its Gorenstein injective-dimension bound.

Prerequisites: `Q1120`.

Resolve the extension class of the two-open cover and make the fivefold tensor obstruction vanish by the relevant Ext bound. This is an upper bound, not a minimality assertion.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1124 — No unrestricted filtered-colimit stability

**theorem; missing**. Source: Example11.21.

A filtered colimit of descendable maps need not be descendable when their indices are unbounded; a locally nilpotent but nonnilpotent quotient ideal supplies the example.

Prerequisites: `Q1121`.

Every finite nilpotent subideal supplies descent, but no finite tensor power kills the full ideal map.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1125 — Uniform-index sequential colimits

**theorem; missing**. Source: Lemma11.22, case proved in the paper.

For a sequential filtered diagram of algebra maps whose descendability indices admit one finite bound, the colimit map is descendable.

Prerequisites: `Q1120`.

Use the Milnor exact sequence: stagewise null maps leave a lim1 obstruction, and tensoring two such obstructions lands in lim2=0. This may double the index.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1126 — Uniform-index colimits in finite cohomological dimension

**theorem; missing**. Source: Lemma11.22 general statement.

The uniform-index assertion extends to index categories of finite cohomological dimension, as announced in Lemma11.22; the paper only writes the sequential proof.

Prerequisites: `Q1125`.

Supply the finite-cohomological-dimension derived-limit multiplication argument before using this generality. Treat this as a separate proof gate.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1127 — Finite open covers are descendable

**theorem; missing**. Source: Lemma11.23(1).

For a finite qc open cover U_i of a qcqs scheme X, O_X→product_i Rj_i,* O_Ui is descendable.

Prerequisites: `Q1115`, `Q1101`.

Use the finite Čech filtration or thick tensor generation by the open localizations.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1128 — Fppf covers are descendable

**theorem; missing**. Source: Lemma11.23(2); Mathew v1 Corollary3.31.

An fppf cover in the qcqs setting gives a descendable structure-algebra map.

Prerequisites: `Q1115`, `Q1101`.

Reduce to the affine faithfully flat countably presented map covered by Mathew’s Corollary3.31, then use finite-open descent and composition. The citation is a Corollary, not Proposition.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1129 — Nilpotent quotients are descendable

**theorem; missing**. Source: Lemma11.23(3); Mathew v1 Proposition3.33.

A closed immersion defined by a nilpotent ideal gives a descendable structure-algebra map.

Prerequisites: `Q1120`.

If I^m=0, the m-fold tensor map through I^m is null; track the derived multiplication witness.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1130 — Pushforward preserves descendability

**theorem; missing**. Source: Lemma11.23(4).

For a qcqs morphism f, derived pushforward carries a descendable algebra map in Dqc(X) to a descendable map of the resulting algebras in Dqc(Y).

Prerequisites: `Q1122`, `Q1101`.

Use the lax monoidal, colimit-preserving derived pushforward in the qcqs setting.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1131 — Countably generated faithfully flat algebras

**theorem; missing**. Source: Remark11.24.

The paper notes descendability of a faithfully flat algebra that is countably generated over the base, by reducing to countably presented faithfully flat subalgebras as in the cited argument.

Prerequisites: `Q1128`.

Close the exact countability reduction in the original Mathew proof before exporting a countably-generated theorem. The question whether the hypothesis is necessary is recorded separately.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1132 — Noetherian h-covers are descendable

**theorem; missing**. Source: Proposition11.25.

For an h-cover f:X→Y of noetherian schemes, O_Y→Rf_*O_X is descendable.

Prerequisites: `Q1127`, `Q1128`, `Q1129`, `Q1130`, `S208`, `S209`.

Induct on the finite level. In the abstract blowup step the bounded coherent fibre is supported on the center and lifts to a thickening; multiply tensor powers to obtain a null map.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1133 — Descent for noetherian schemes

**theorem; missing**. Source: Theorem11.12.

For an h-cover X→S of noetherian schemes, Dqc(S) is the limit of Dqc on the derived Čech nerve X/S.

Prerequisites: `Q1132`, `Q1116`.

The structure algebra is descendable and derived affine Čech terms realize its tensor powers. Correct the printed X/Y to X/S.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1134 — Perfect and pseudocoherent objects detected by h-descent

**theorem; missing**. Source: Remark11.13.

In the noetherian setting of Theorem11.12, an object is perfect or pseudocoherent iff its h-cover pullback is so, with the corresponding descent equivalences.

Prerequisites: `Q1133`, `D508`.

Descend dualizability for perfect objects; for pseudocoherence use finite approximation and the bounded-below detection argument.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1135 — Derived h-hyperdescent counterexample

**theorem; missing**. Source: Remarks11.4 and11.13.

For derived schemes an h-hypercover obtained by repeated classical truncation can fail perfect-complex hyperdescent; for A=Sym_C(C[2]) the nonzero localization inverting its positive-degree generator is killed by truncation.

Prerequisites: `Q1103`, `Q1133`.

Compute the truncation and the localization module. Keep the ordinary noetherian hypothesis in Theorem11.12.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1136 — Finite-presentation converse to descendability

**theorem; missing**. Source: Theorem11.26.

For a finitely presented map of noetherian rings A→B, Spec B→Spec A is an h-cover iff A→B is descendable.

Prerequisites: `Q1132`, `Q1116`.

For the converse descend suitable eventually connective idempotent algebra objects representing qc opens; apply BHL15 Theorem1.10 and compactness of truncated mapping spaces. This cited classification is an open recursive input.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1137 — Perfect h-covers are descendable

**theorem; missing**. Source: Theorem11.27.

For an h-cover f:X→Y of perfect schemes, O_Y→Rf_*O_X is descendable.

Prerequisites: `Q1132`, `Q1125`, `Q1110`, `S315`.

Choose a noetherian model, preserve its finite index along Frobenius and use the uniform sequential-colimit theorem. Correct Rf0,*O_Y0 to Rf0,*O_X0.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1138 — Quasi-coherent h-descent on perfect schemes

**theorem; planned**. Source: Theorem11.2(1).

The category-valued presheaf X↦Dqc(X) satisfies h-descent on perfect schemes.

Planned stages: `EnhancedDerivedSheaves:E2`.

Prerequisites: `Q1137`, `Q1116`, `Q1101`.

Perfect-ring tensor products are already derived, so the geometric Čech nerve realizes module descent.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1139a — Hypercomplete v-descent for Perf(X)

**theorem; planned**. Source: Theorem11.2(2).

On perfect schemes, X↦Perf(X) satisfies hypercomplete v-descent.

Planned stages: `SchemeKTheoryOperations:S.4`.

Prerequisites: `Q1138`, `Q1102`, `S219`, `D508`.

Use Tor-amplitude strata and finite truncation for Perf, then the finite Witt filtration, compatible p-complete systems and the p-inverted acyclicity condition for support. Split all completion/effectivity comparisons before declaring closure.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1139b — Hypercomplete v-descent for Perf(W_n(X))

**theorem; planned**. Source: Theorem11.2(2).

On perfect schemes, X↦Perf(W_n(X)) satisfies hypercomplete v-descent.

Planned stages: `SchemeKTheoryOperations:S.4`.

Prerequisites: `Q1138`, `Q1102`, `S219`, `S401`, `D508`.

Use Tor-amplitude strata and finite truncation for Perf, then the finite Witt filtration, compatible p-complete systems and the p-inverted acyclicity condition for support. Split all completion/effectivity comparisons before declaring closure.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1139c — Hypercomplete v-descent for Perf(W(X))

**theorem; planned**. Source: Theorem11.2(2).

On perfect schemes, X↦Perf(W(X)) satisfies hypercomplete v-descent.

Planned stages: `SchemeKTheoryOperations:S.4`.

Prerequisites: `Q1138`, `Q1102`, `S219`, `S401`, `D508`.

Use Tor-amplitude strata and finite truncation for Perf, then the finite Witt filtration, compatible p-complete systems and the p-inverted acyclicity condition for support. Split all completion/effectivity comparisons before declaring closure.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1139d — Hypercomplete v-descent for Perf(W(X) on X)

**theorem; planned**. Source: Theorem11.2(2).

On perfect schemes, X↦Perf(W(X) on X) satisfies hypercomplete v-descent.

Planned stages: `SchemeKTheoryOperations:S.4`.

Prerequisites: `Q1138`, `Q1102`, `S219`, `D512`.

Use Tor-amplitude strata and finite truncation for Perf, then the finite Witt filtration, compatible p-complete systems and the p-inverted acyclicity condition for support. Split all completion/effectivity comparisons before declaring closure.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### Q1140 — Derived abstract-blowup patching

**theorem; missing**. Source: Corollary11.28.

For an abstract blowup square of perfect schemes, Dqc(Y) is the homotopy fibre product of Dqc(X) and Dqc(Z) over Dqc(E).

Prerequisites: `Q1138`, `S213`.

Apply h-descent and the abstract-blowup excision criterion to the enhanced category, retaining all coherent matching maps.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1141 — Finite Tor dimension of perfect finite-presentation maps

**theorem; missing**. Source: Proposition11.29.

A pfp algebra over a perfect ring has finite Tor dimension; for a quotient of a perfect polynomial algebra defined by the radical of m generators, the quotient step has Tor dimension at most m.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `S319`, `S321`.

Perfect polynomial extensions are flat; kill the radical generators one at a time using the flat root-ideal resolution.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1142 — Boundedness is h-local

**theorem; planned**. Source: Lemma11.30; Theorem11.2(3).

For an h-cover f:X→Y in Perf and K∈Dqc(Y), boundedness of f*K implies boundedness of K.

Planned stages: `EnhancedDerivedSheaves:E2`.

Prerequisites: `Q1141`, `Q1140`, `S209`.

Induct on cover level using the abstract-blowup triangle, projection formula and finite cohomological dimension of qcqs pushforward. Finite Tor dimension controls pullbacks; do not assert v-descent for all bounded Dqc.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1143 — Finite global dimension after perfection

**theorem; missing**. Source: Proposition11.31.

Let k be the perfection of a regular ring of finite Krull dimension and R a pfp k-algebra. Then R has finite global dimension. If R is a quotient of P=P0_perf with P0 regular of dimension d, the proof gives the bound d+1.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `S320`, `Q1141`.

Kunz makes Frobenius on P0 flat; represent modules using the countable Frobenius tower and its telescope resolution. The homological epimorphism P→R transfers the bound. Here d is the chosen regular presentation dimension, not dim R.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1144 — Bounded complexes admit bounded projective representatives

**theorem; missing**. Source: Remark11.32.

Under Proposition11.31, bounded Dqc objects are locally represented by bounded complexes of projective modules, which may have infinite rank.

Prerequisites: `Q1143`.

Use the finite global-dimension bound to truncate a projective resolution; no finite-generation conclusion follows.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1145 — Intrinsic Tor-dimension bound

**theorem; missing**. Source: Remark11.33, corrected version.

If k is a perfect field and R a pfp k-algebra of dimension d, its Tor dimension is at most 2d, as explained in Remark11.33.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `Q1143`, `S319`.

Apply Noether normalization and almost finite étaleness away from one element, then the two exact sequences involving flat idempotent ideals. Close Gabber’s detailed proof before using the sharp intrinsic bound.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1146 — The earlier dimension bound fails

**theorem; missing**. Source: Remark11.33 footnote24; arXiv v2 Remark5.33.

For R=(k[x,y]/xy)_perf, the ordinary modules R/(x) and R/(y) have nonzero Tor2. Thus the old bound Tor-dim R≤dim R is false. The ideals (x),(y) here are not radical.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `Q1145`.

Write I_y=Ann_R(x), the span of all positive y-monomials with exponents in Z[1/p]. The two exact sequences for R/(x) and (x) identify Tor2(R/(x),R/(y)) with ker(I_y/yI_y→R/(y)). The class of y is in this kernel and is nonzero because every monomial of yI_y has exponent strictly greater than one. This gives an explicit algebraic witness, independent of the invalid old bound.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1147 — Intrinsic global bound announced in the correction

**theorem; missing**. Source: Remark11.33 footnote24.

Remark11.33 footnote24 states the additional bound global-dim R≤2dim R+1 for pfp algebras over a perfect field, without a proof in this paper.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `Q1145`.

Supply a separate original-source proof; do not infer that the paper’s d+1 presentation bound proves this intrinsic bound.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1148 — Kunz converse via perfection

**theorem; missing**. Source: Corollary11.35.

For a noetherian ring of characteristic p, flatness of Frobenius implies regularity; the proof can be recovered using finite Tor dimension of a perfected regular presentation and faithful flatness.

Perfect rings are perfect F_p-algebras unless explicitly stated otherwise. Ordinary modules over them need not be perfect rings. Finiteness, regularity, valuation rank and the chosen presentation dimension must remain in each theorem.

Prerequisites: `Q1143`.

Reduce by completion and a regular presentation, then transfer finite projective-dimension bounds through the faithfully flat perfection. The classical forward implication regular⇒Frobenius flat is an input to Proposition11.31, so this converse does not prove that input circularly.

Open gates: `Q-closure`, `Q-valuations`, `Q-Tor`, `Q-source`.

#### Q1149 — Tensor commutes with a bounded cosimplicial totalization

**theorem; missing**. Source: Lemma11.36.

Let R have finite global dimension, M∈D(R), and N• a cosimplicial diagram of discrete R-modules with bounded totalization. Then M⊗^L_R Tot(N•)→Tot(M⊗^L_R N•) is an equivalence.

Prerequisites: `Q1143`.

Use the projective-dimension bound, homological and cohomological truncations with their distinct conventions, and finite windows in each total degree. Preserve the discreteness and bounded-totalization assumptions.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1150 — Hyperdescent of derived sections

**theorem; missing**. Source: Lemma11.37.

For X pfp over a base as in Proposition11.31 and K∈Dqc(X), the functor Y↦RΓ(Y,f*K) on X’s pfp h-site is hypercomplete.

Prerequisites: `Q1149`, `Q1138`.

Compute on an affine h-hypercover, commute tensor with totalization by Lemma11.36, and use hyperdescent for the structure sheaf.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1151 — Relative truncation preserves hypercompleteness

**theorem; missing**. Source: Lemma11.38.

In an infinity-topos, an n-truncated map to a hypercomplete object has hypercomplete source.

Prerequisites: `L34`.

Use the slice infinity-topos and the Postnikov characterization of hypercomplete objects.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1152 — Hypercomplete h-descent of unbounded Dqc

**theorem; planned**. Source: Theorem11.2(4); Remark11.39.

For k the perfection of a regular finite-dimensional ring, Dqc on pfp k-schemes is a hypercomplete h-sheaf of categories.

Planned stages: `EnhancedDerivedSheaves:E2`.

Prerequisites: `Q1150`, `Q1151`, `Q1138`.

Embed quasi-coherent complexes fully faithfully into hypercomplete h-modules; the relative map is (−1)-truncated, and existing h-descent makes the essential image effective.

Open gates: `Q-closure`, `Q-infinity`, `Q-Tor`, `Q-source`.

#### Q1153 — Derived Witt vectors and operators

**construction; missing**. Source: §11.5, before Lemma11.43.

Apply Witt-vector functors termwise to simplicial F_p-algebras to obtain derived W and W_n, with Frobenius F and Verschiebung V satisfying FV=VF=p.

Prerequisites: `Q1103`, `L01`, `L30`.

API: Construct termwise Witt functors and their homotopy-invariant derived interpretation. Compare truncation and the F,V identities. Transport along animated algebra maps and derived Čech diagrams.

Acceptance cases: A discrete perfect ring recovers its usual Witt ring. W_1(A)=A. The derived Witt functor cannot be replaced by W(π0 A) before applying the stated comparison.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1154 — Frobenius-inverted derived Witt discreteness

**theorem; missing**. Source: Lemma11.43.

For an animated F_p-algebra A, W(A)[1/F]→W(π0A)[1/F] is an equivalence; the analogous finite-level assertion holds.

Prerequisites: `Q1153`, `Q1108`.

Describe higher homotopy of the Witt coordinates and use the zero action of Frobenius there; localization kills all positive homotopy.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1155 — p-torsion comparison cone

**theorem; missing**. Source: Remark11.44.

The cone of W(A)→W(π0A) is killed by p, as asserted in Remark11.44 using F,V and the preceding argument.

Prerequisites: `Q1154`.

Verify a nullhomotopy of multiplication by p on the cone, rather than merely checking p kills its homotopy groups. This distinction is an explicit proof gate.

Open gates: `Q-closure`, `Q-infinity`, `Q-Witt`, `Q-source`.

#### Q1156 — Frobenius-inverted Witt blowup excision

**theorem; missing**. Source: Lemma11.45.

For the Cartesian square of Lemma11.45 with affine base, constructible closed center and structure-cohomology excision, Frobenius-inverted Witt cohomology has the corresponding distinguished triangle, including all iterated self-products required by Čech descent.

Prerequisites: `Q1154`, `S406`.

Use derived base change for each self-product and remove its derived structure by Lemma11.43. The non-inverted argument for one square does not by itself handle higher self-products.

Open gates: `Q-closure`, `Q-Witt`, `Q-source`.

#### Q1157 — Frobenius-inverted Witt h-descent

**theorem; missing**. Source: Proposition11.41.

For a noetherian F_p-scheme S of finite Krull dimension, X↦RΓ(X,W O_X)[1/F] satisfies h-descent on finitely presented S-schemes.

Prerequisites: `Q1156`, `S209`, `Q1158`.

Start with fppf descent via finite Witt filtrations, invert universal-homeomorphism Frobenius powers, reduce proper covers to blowups and use the finite universal-homeomorphism pushout and dimension induction.

Open gates: `Q-closure`, `Q-Witt`, `Q-source`.

#### Q1158 — Blowup contraction used for Witt descent

**theorem; missing**. Source: Proposition11.41 proof, pp.53–54.

After thickening the exceptional divisor of a blowup in the proof of Proposition11.41, the relevant pushout exists and maps to the original base by a finite universal homeomorphism, giving the excision square used by Lemma11.45.

Use qcqs schemes in a fixed adequate universe. Statements on Perf mean perfect characteristic-p schemes; proper pfp means the perfect-category notion, not ordinary finite presentation. Keel inputs require positive characteristic and the displayed projective finite-type models.

Prerequisites: `S408`, `S409`, `G816`.

Use Serre vanishing and the original pushout existence theorem; retain derived self-products until Frobenius inversion. The original algebraization/pushout proof remains to be read.

Open gates: `Q-closure`, `Q-sites`, `Q-Witt`, `Q-source`.

#### Q1159 — Rational Witt h-descent

**theorem; missing**. Source: Theorem11.40; consequence of Proposition11.41.

Under the hypotheses of Proposition11.41, rational Witt cohomology RΓ(X,W O_X)[1/p] satisfies h-descent; this recovers the Berthelot–Bloch–Esnault theorem cited as Theorem11.40.

Prerequisites: `Q1157`, `Q1153`.

Inverting p makes F invertible through FV=p, so further localize the stronger Frobenius-inverted descent comparison.

Open gates: `Q-closure`, `Q-Witt`, `Q-source`.

#### A1201 — Self-braiding-trivial symmetric category

**construction; missing**. Source: Definition12.1; Example12.2.

A symmetric monoidal category is called strict in Definition12.1 when c_(X,X)=id for every object X. This is a self-braiding condition, separate from strict associativity and unit constraints.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `L35`.

API: Define the self-braiding predicate on an existing symmetric monoidal category. Test the predicate on Pic, graded Pic and vector spaces under direct sum. Transport it under symmetric monoidal equivalence.

Acceptance cases: Ungraded lines under tensor have identity self-braiding. The tensor unit has identity self-braiding. Two copies of a nonzero rank-one vector space under direct sum are exchanged nontrivially.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### A1203 — Symmetric monoidal determinant of vector bundles

**theorem; missing**. Source: Proposition12.3.

The functor E↦(top exterior power E, rank E) from Vect(X) with direct sum to Pic^Z(X) with tensor is symmetric monoidal.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `D502`, `L40`.

Construct the wedge-product comparison, check associativity and units, and compute the block-swap sign (−1)^(rank E·rank F).

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### A1204 — Segal E-infinity monoid

**construction; missing**. Source: Definition12.4.

An E-infinity monoid is a functor Fin*→Spaces such that X([n])→X([1])^n is an equivalence for every n≥0; π0X([1]) is a commutative monoid.

Prerequisites: `L34`, `L33`.

API: Define the pointed finite-set diagram and all Segal maps. Recover unit and coherently commutative multiplication from collapse maps. Construct maps as natural transformations preserving the diagram.

Acceptance cases: The terminal diagram gives the one-element monoid. At [0] the Segal condition requires a contractible space. A bare homotopy-commutative multiplication without higher coherence is insufficient.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1205 — Coherent subset construction

**construction; missing**. Source: Construction12.5; Remark12.6.

For a symmetric monoidal category, construct its Fin*-diagram using families X_T indexed by all subsets T of the nonbasepoint set, with coherent tensor identifications for disjoint unions; take the nerve of the maximal subgroupoid.

Prerequisites: `A1204`, `L32`, `L33`, `L35`.

API: Provide subset objects, empty-set unit and disjoint-union isomorphisms with associativity and symmetry compatibility. Use inverse images of subsets to obtain a strict diagram at the model level. Compare its value at [n] with n copies of the core nerve.

Acceptance cases: At [1] recover the core of the original category. At [0] the unit data give a contractible core. Choosing one ordered tensor product without coherence does not produce the asserted strict Fin*-functor.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1207 — Grouplike E-infinity monoid

**construction; missing**. Source: Definition12.7.

An E-infinity monoid is grouplike when π0 is an abelian group.

Prerequisites: `A1204`.

API: Define invertibility of connected components. Compare this with the shear maps becoming equivalences. Transport grouplikeness under E-infinity equivalences.

Acceptance cases: A discrete abelian group is grouplike. The one-element monoid is grouplike. The additive monoid N is not grouplike.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1208 — Connective spectrum via deloopings

**construction; planned**. Source: Definition12.8.

A connective spectrum is modeled by a sequence of spaces X_i with X_i≃ΩX_(i+1), where X_i has π_j=0 for j<i. The paper’s connectivity convention is this displayed vanishing condition.

Planned stages: `StableHomotopyKTheory:H.5:spectra`.

Prerequisites: `L34`.

API: Give the sequence, loop equivalences and connectivity witnesses. Recover homotopy groups and the infinite-loop-space functor. Construct spectrum maps compatible with every delooping.

Acceptance cases: The Eilenberg–Mac Lane spectrum of an abelian group has its group in degree zero. The zero spectrum has contractible spaces. Using a convention that forces π_iX_i=0 would incorrectly remove degree-zero coefficients.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1209 — Infinite-loop-space equivalence

**theorem; missing**. Source: Theorem12.9.

Grouplike E-infinity monoids are equivalent to connective spectra.

Prerequisites: `A1207`, `A1208`.

Build compatible iterated deloopings and recover the Segal operations from the infinite-loop structure. The appendix sketches this comparison; its original coherent proof remains open.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1210 — Bar construction and delooping

**construction; missing**. Source: Proposition12.10.

For an E-infinity monoid X, form BX as the geometric realization of the simplicial bar diagram with degree n equal to X^n. The canonical X→ΩBX is an equivalence precisely in the grouplike case.

Prerequisites: `A1204`, `A1207`.

API: Construct faces by multiplication, degeneracies by the unit and the realization. Produce the canonical loop comparison and its multiplication coherence. Iterate the bar construction with its connectivity estimate.

Acceptance cases: For discrete Z, BZ has π1=Z. The bar of the trivial monoid is contractible. For N the comparison N→ΩBN identifies the target components with Z, so it is not an equivalence.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1211 — Components of the looped bar construction

**theorem; missing**. Source: Remark12.11, corrected formula.

π0(ΩBX)=π1(BX); for a grouplike X this is π0(X).

Prerequisites: `A1210`.

Use the definition of based loop homotopy groups; the printed π1X omits the bar construction.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1212 — Group completion

**construction; planned**. Source: Proposition12.12.

The functor X↦X_gp=ΩBX is left adjoint to the inclusion of grouplike E-infinity monoids into all E-infinity monoids.

Planned stages: `StableHomotopyKTheory:H.4`.

Prerequisites: `A1210`.

API: Construct the universal map X→X_gp. Identify maps from X_gp to a grouplike target with maps from X. Transport completion along symmetric monoidal functors and compare π0 with ordinary monoid group completion.

Acceptance cases: The completion of N is Z on components. A grouplike input is unchanged up to equivalence. Ordinary π0 group completion alone does not determine the higher homotopy of X_gp.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1213 — K-theory of a symmetric monoidal category

**construction; missing**. Source: Definition12.13.

K(C) is the connective spectrum corresponding to the group completion of the E-infinity space constructed from the maximal subgroupoid of C.

Prerequisites: `A1205`, `A1212`, `A1209`.

API: Apply the subset-diagram construction to the core and then group completion. Keep automorphisms through the nerve rather than passing to object classes. Construct spectrum maps from symmetric monoidal functors.

Acceptance cases: Finite-dimensional k-vector spaces give π0=Z. The category with only a tensor unit gives the zero spectrum. Using the nerve of all vector-space linear maps makes the zero object contract the wrong input.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### A1214 — Abstract Picard groupoid

**construction; missing**. Source: Definition12.14.

A Picard groupoid is a symmetric monoidal groupoid in which every object is tensor-invertible, with all monoidal coherence retained.

Prerequisites: `L32`, `L35`.

API: Specify the groupoid, tensor structure and inverse-object witnesses. Identify π0 as a group and π1 as the automorphisms of the unit. Construct symmetric monoidal functors and equivalences.

Acceptance cases: Lines over a ring and their isomorphisms give a Picard groupoid. The one-object trivial groupoid is Picard. The groupoid of vector spaces under direct sum is not Picard until group completion.

Open gates: `Q-closure`, `Q-source`.

#### A1215 — Picard groupoids and truncated spectra

**theorem; missing**. Source: Proposition12.15.

The core nerve of a symmetric monoidal groupoid is grouplike iff the groupoid is Picard; Picard groupoids are equivalent to connective spectra with homotopy only in degrees zero and one.

Prerequisites: `A1214`, `A1209`.

Apply the infinite-loop-space equivalence, preserving the symmetry coherence which contains the degree-one sign information.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

#### A1216 — Projective-module K-theory spectrum

**construction; planned**. Source: Definition12.16.

For a commutative ring R, K(R) is K of finite projective R-modules with direct sum, compared by the split exact/additivity theorem with the common algebraic K-theory model.

Planned stages: `GeneralAlgebraicKTheory:K.4:construction`.

Prerequisites: `A1213`, `L40`, `L41`.

API: Construct K from the core of finite projectives and direct sum. Compare with plus, exact-category and perfect-complex models using actual comparison maps. Construct extension-of-scalars maps and their coherence.

Acceptance cases: For a field, rank identifies K0 with Z. The zero ring has contractible K. Group completion of the object-class monoid alone omits K1 and higher K groups.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### A1217 — Spectral determinant for rings

**theorem; missing**. Source: Corollary12.17.

The symmetric monoidal determinant induces a natural map K(R)→Pic^Z(R) of connective spectra.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `A1216`, `A1203`, `A1215`.

Apply group completion to the signed determinant functor; the Picard target is already grouplike.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### A1218 — Zariski-sheafified low K-theory

**theorem; missing**. Source: Proposition12.18.

The determinant identifies Pic^Z with the Zariski sheafification of τ≤1K on affine schemes. This is not an unsheafified equivalence on every ring.

Schemes are qcqs; lines and their isomorphisms retain the signed symmetric monoidal coherence. Witt-support assertions use perfect F_p-schemes.

Prerequisites: `A1217`, `D504`.

On local rings use K0=Z and determinant K1≃units; compare stalks of 1-truncated spectra and glue. Original local K1, group-completion and sheafification comparisons remain proof obligations.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### G1008 — Restriction of scalars on ramified support K-theory

**construction; missing**. Source: Proposition10.1 proof.

Since W_OK(R) is finite free over W(R), restricting scalars carries perfect W_OK(R)-complexes acyclic after p-inversion to perfect supported W(R)-complexes and induces a K-theory map.

Prerequisites: `G901`, `D513`.

API: Restrict supported complexes along W(R)→W_OK(R). Prove perfectness and p-inverted acyclicity are preserved by finite freeness. Compose with det-tilde and compare coefficient base change.

Acceptance cases: For O_K=W(k) this is the identity functor. O_K/π contributes length one over W(k) when the residue extension is the specified identity. Without a finite-perfect coefficient extension, restriction need not preserve perfect complexes.

Open gates: `Q-closure`, `Q-Kdet`, `Q-source`.

#### G717 — Incidence parameters of the first filtration quotient

**construction; missing**. Source: Proof Lemma7.13, p31.

Put μ=type(Q), V=Q/pQ, r=n_μ(0)−n_λ(0), and K_m=ker(p^m:Q/pQ→p^mQ/p^(m+1)Q). For μ≤λ, the first quotient kernel F has dimension r and must satisfy dim(F∩K_m)≥a_m=r+sum_(i≥m+1)(n_μ(i)−n_λ(i)). The K_m increase with m; reverse the finite indexing to apply the decreasing-filtration Lemma7.14.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G7053`, `G710`.

API: Construct K_m and a_m from the two partitions. Compute length(p^m Fil1Q)=length(p^mQ)−n_μ(m)+r−dim(F∩K_m). Prove a_m≤r and a_m≤dim K_m from dominance, then transport the incidence locus to a reversed filtration.

Acceptance cases: For μ=(1,1,1), λ=(2,1), r=1 and the first kernel lies in a projective plane. For μ=λ, r=0 and the forced filtration is the p-adic one. The kernels K_m are increasing, so treating them as decreasing without reindexing reverses the flag convention.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G908 — GLn lattice quotient comparison

**theorem; missing**. Source: Proposition9.5.

For perfect k-algebra R, Gr_GLn(R) identifies with finite projective W_OK(R)-submodules M⊂W_OK(R)[1/p]^n that become the full module after p-inversion.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G904`, `G901`.

Descend the finite projective module and its trivialization from an fpqc trivializing cover, and reconstruct the positive-loop torsor of frames.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G1007 — SLn determinant-trivial lattice comparison

**theorem; missing**. Source: Proposition10.1 first assertion.

Gr_SLn is the subfunctor of Gr_GLn whose determinant lattice is the standard W_OK(R) lattice in its fraction algebra, with the trivialization induced by that embedding.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G908`, `G1001`.

Compare determinant-one frame torsors and the lattice determinant; keep the specified standard-volume normalization.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### G1006 — Restriction of sections to perfect projective bounds

**theorem; missing**. Source: Proposition10.5, second assertion.

For a bounded perfect projective closed stage X⊂Gr_SLn and m≥1, H0(Gr_SLn,L^m)→H0(X,L^m) is surjective. If dim X>0 the target is infinite-dimensional.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Prerequisites: `G820`, `G1001`.

Use Frobenius powers and Serre vanishing for surjectivity between closed stages, then recursive lifts in a countable cofinal exhaustion. The assertion concerns perfect projective stages.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### S221 — Right cancellation of universal descent

**theorem; missing**. Source: Lemma2.10(2).

If X→Y→Z has composite X→Z of universal F-descent, then Y→Z is of universal F-descent.

Prerequisites: `S214`.

Base change to the composite cover, where the resulting augmented Čech comparison is split, then use the two Čech directions.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-source`.

#### S415 — Formal Witt vector-bundle descent

**theorem; planned**. Source: Theorem4.1(ii), formal Witt assertion.

X↦Vect(W(X)) is a v-stack on perfect schemes.

§§7–8 use perfect F_p-algebras and finite projective Witt modules, with n≥0 and a partition of length at most n. §§9–10 use a specified complete mixed-characteristic discrete valuation field K with perfect residue field k and its smooth affine integral group model. The SLn section assertions use n≥2.

Planned stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `S405`, `S404`.

Identify finite projective p-complete Witt modules with compatible systems modulo p^n, then commute limits with descent.

Open gates: `Q-closure`, `Q-sites`, `Q-valuations`, `Q-Keel`, `Q-groups`, `Q-source`.

#### Q1160 — Gorenstein faithful-flat index bound

**theorem; missing**. Source: Example11.19, generalization.

If A is a noetherian Gorenstein ring of dimension d and A→B is faithfully flat, its descendability index is at most d+1.

Prerequisites: `Q1120`.

The flat quotient B/A makes the m-fold fibre concentrated in cohomological degree m; injective dimension d of A kills the obstruction when m>d.

Open gates: `Q-closure`, `Q-infinity`, `Q-source`.

### Source findings awaiting independent review

These findings concern the named arXiv versions. None has an independent verdict yet. Two are corrections already acknowledged by the authors in v3; the remaining entries record the exact formula, index, scope or spelling issue and its check. They do not establish failure of a main theorem.

#### E1 — misprint

arXivv3 abstract p1. Affects: **nothing**.

Printed: “charactristic”.

Correction: characteristic

Reason: Spelling visible in the rendered PDF.

Existing correction: new.

#### E2 — misprint

arXivv3 Example2.3 p5. Affects: **the proof**.

Printed: “does not lift to X-tilde”.

Correction: The valuation does not lift to the deleted open subscheme X.

Reason: Properness of the blowup X-tilde gives its valuation lift; the deleted exceptional point prevents lifting to X.

Existing correction: new.

#### E3 — misprint

arXivv3 proof Lemma2.6 p5. Affects: **the proof**.

Printed: “dim Z ≤ n−1”.

Correction: Use dim Z≤dim Y−1 in the induction on the target dimension.

Reason: Here n denotes an eventual inductive-level bound, not the dimension parameter used to cut down Y.

Existing correction: new.

#### E4 — misprint

arXivv3 proof Lemma3.18 p15. Affects: **the proof**.

Printed: “B tensor_A^L A′ = B′”.

Correction: With X=Spec A and Y=Spec B as named, use A tensor_B^L B′=A′.

Reason: The printed tensor uses the ring map in the wrong direction. The corrected formula is perfect-ring Tor-independence.

Existing correction: new.

#### E5 — misprint

arXivv3 proof Lemma4.6 p16. Affects: **the proof**.

Printed: “E = O_Xperf”.

Correction: Use E=O_Yperf.

Reason: E was specified as a vector bundle on Yperf, and the reduction is to the unit bundle on that base.

Existing correction: new.

#### E6 — misprint

arXivv3 proof Lemma4.6 p17. Affects: **the proof**.

Printed: “I^n/I^(n+1)”.

Correction: For extension from nE to (n+1)E use I^(n+1)/I^(n+2), since mE was defined by I^(m+1).

Reason: The kernel of O/ I^(n+2)→O/ I^(n+1) is the corrected quotient. The large-exponent Serre argument still applies.

Existing correction: new.

#### E7 — misprint

arXivv3 proof Theorem4.1 p17. Affects: **nothing**.

Printed: “Condition (i) of Proposition4.5”.

Correction: Use condition(i) of Corollary2.14.

Reason: Proposition4.5 is the perfection-translation statement; the enumerated v-descent criterion is Corollary2.14.

Existing correction: new.

#### E8 — misprint

arXivv3 proof Proposition6.1 p20. Affects: **the proof**.

Printed: “E ∈ Vect(X)”.

Correction: Use E∈Vect(Y).

Reason: The adjunction E→f_*f*E and its Hom reduction require E on the target of f:X→Y.

Existing correction: new.

#### E9 — misprint

arXivv3 proof Theorem6.13 p26. Affects: **the proof**.

Printed: “H0(X_eta,O_Xeta) ≃ K^r”.

Correction: Use H0(X_eta,E_eta)≃K^r.

Reason: The module being embedded is H0(X,E) for a rank-r fibre-trivial vector bundle, not just global functions.

Existing correction: new.

#### E10 — misprint

arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention. Affects: **a stated result**.

Printed: “projective dimension 1”.

Correction: Use projective dimension at most one, or separately exclude Q=0 when claiming equality one.

Reason: The identity isogeny has cokernel zero and the zero R-module is projective; its projective dimension is not exactly one under the usual conventions.

Existing correction: new.

#### E11 — misprint

arXivv3 proof Lemma7.7 p29. Affects: **nothing**.

Printed: “if M is of projective dimension 1”.

Correction: Use Q in place of M.

Reason: Q is the cokernel to which the hypothesis is applied; M was not that module.

Existing correction: new.

#### E12 — misprint

arXivv3 Lemma7.9 p29. Affects: **nothing**.

Printed: “{type(Q)≤λ} subset { ... }”.

Correction: Use equality when defining the type locus by the following set of primes.

Reason: This is the definition of the named locus, subsequently shown closed, rather than an asserted strict containment.

Existing correction: new.

#### E13 — misprint

arXivv3 Remark7.12 p30. Affects: **nothing**.

Printed: “K0(W(X) → X)”.

Correction: Use K0(W(X) on X).

Reason: The support K-theory category is the one defined in §5; the printed arrow does not name that category.

Existing correction: new.

#### E14 — misprint

arXivv3 Theorem11.12 p42. Affects: **a stated result**.

Printed: “the Cech nerve of X/Y”.

Correction: Use X/S.

Reason: The theorem specifies an h-cover X→S and contains no base scheme Y.

Existing correction: new.

#### E15 — misprint

arXivv3 proof Theorem11.27 p46. Affects: **the proof**.

Printed: “Rf0,* O_Y0”.

Correction: Use Rf0,*O_X0.

Reason: The map is f0:X0→Y0, so its pushforward takes a sheaf on X0.

Existing correction: new.

#### E16 — error

arXivv3 proof Theorem11.2 p47. Affects: **the proof**.

Printed: “Perf[a,b](X) is (b−a)-truncated”.

Correction: Its core object space is (b−a+1)-truncated; the mapping spaces have the printed bound b−a.

Reason: For a=b=0 and X=Spec F3, the object O_X has automorphism group F3×, so its core has nonzero π1. The proof only needs a finite bound, so Corollary2.14 still applies after repair.

Existing correction: new.

#### E17 — misprint

arXivv3 proof Theorem11.2 p47. Affects: **nothing**.

Printed: “(a), (c), (d)”.

Correction: Use (1), (3), (4) for the theorem’s numbered assertions.

Reason: The actual statement lists four numerically indexed assertions.

Existing correction: new.

#### E18 — misprint

arXivv3 proof Lemma11.36 p50. Affects: **nothing**.

Printed: “cosimplicial A-complexes”.

Correction: Use R-complexes.

Reason: The coefficient ring throughout the lemma is R. Its subscript homological and superscript cohomological truncations are intentional and are not errors.

Existing correction: new.

#### E19 — misprint

arXivv3 §12 p55, nerve description. Affects: **nothing**.

Printed: “n−1 morphisms”.

Correction: Use n composable morphisms for an n-simplex of the ordinary nerve.

Reason: A 1-simplex is a morphism, and a 2-simplex is a composable pair. The printed formula shifts both by one.

Existing correction: new.

#### E20 — misprint

arXivv3 Remark12.11 p58. Affects: **the proof**.

Printed: “π0 ΩBX = π1 X”.

Correction: Use π0 ΩBX=π1 BX.

Reason: For the discrete grouplike space Z, π1X=0 but π0ΩBZ=Z.

Existing correction: new.

#### E21 — misprint

arXivv3 bibliography [Mat14] p60. Affects: **nothing**.

Printed: “Akhil Matthew”.

Correction: Akhil Mathew.

Reason: The original arXiv1404.2156 title page gives the author’s surname with one final w.

Existing correction: new.

#### E22 — misprint

arXivv3 proof Lemma11.23(2) p45. Affects: **nothing**.

Printed: “[Mat14, Proposition3.31]”.

Correction: Use [Mat14, Corollary3.31].

Reason: Original arXiv1404.2156v1 p24 labels the countably presented faithfully flat result Corollary3.31. Its statement and preceding proof were read.

Existing correction: new.

#### E23 — error

arXivv1 proof Lemma4.6 PDF16–17, corrected in arXivv3 PDF16–17. Affects: **the proof**.

Printed: “H^i(X,I^m) ≃ I^(m−c) H^i(X,I^c)”.

Correction: Use the revised argument: reduce to an actual blowup and apply Serre vanishing on the exceptional Cartier divisor, then Frobenius and formal existence.

Reason: The v1 argument uses this formal-functions comparison to force high-power vanishing for a general proper modification. The final version explicitly withdraws that argument and proves the needed special geometry first. The original EGA passage itself was not read here.

Existing correction: Known: arXivv3 acknowledgments p4 explain the earlier Lemma4.6 error and its origin in [GD61, Corollary3.3.2]; revised proof pp16–17. Both earlier and revised BS passages read..

#### E24 — error

arXivv2 Remark5.33 PDF26–27; corrected arXivv3 Remark11.33 PDF49. Affects: **a stated result**.

Printed: “Tor dimension ≤ d”.

Correction: Use the corrected bound 2d for pfp algebras over a perfect field. The additional global bound 2d+1 is announced without proof.

Reason: Gabber’s corrected footnote gives R=(k[x,y]/xy)_perf with nonzero Tor2(R/(x),R/(y)), contradicting d=1. These principal quotients are not perfect, so Lemma3.16 does not force their Tor to vanish.

Existing correction: Known: arXivv3 Remark11.33 footnote24 explicitly corrects the previous bound and supplies Gabber’s counterexample. v2 PDF26–27 and v3 PDF49 read in full..

#### E25 — misprint

arXivv3 proof Lemma7.13 p31. Affects: **the proof**.

Printed: “decreasing filtration”.

Correction: The kernels K_m=ker(p^m:Q/pQ→p^mQ/p^(m+1)Q) increase with m. Reverse the finite indexing to use the decreasing-filtration convention of Lemma7.14.

Reason: For Q=W(k)/p², K_0=K_1=0 and K_2=Q/pQ. The displayed dimension formula n_μ(0)−n_μ(m) is also nondecreasing.

Existing correction: new.

#### E26 — misprint

arXivv3 Proposition11.6 p41. Affects: **nothing**.

Printed: “commtuative”.

Correction: commutative

Reason: Spelling in the proposition statement; the intended algebra object is clear.

Existing correction: new.

Correction searches examined the official Springer record, arXiv version history, the author publication list and targeted erratum queries on22September2026. Each JSON entry records those searches; E25 adds the filtration-specific queries. The published PDF remains unavailable for collation.

### Questions as posed in2017

- **Question10.6(1)**: Construct an explicit nonzero section or theta divisor of L or a power on Gr_SLn. Question as posed in2017; no claim about its current open status.

- **Question10.6(2)**: Describe H0(Gr_SLn,L^m) as a loop-group representation and decide topological irreducibility. Question as posed in2017; no claim about its current open status.

- **Question10.6(3)**: Determine whether Pic(Gr_SLn)=Z[1/p] generated by L. Question as posed in2017; no claim about its current open status.

- **Question10.6(4)**: For split simple simply connected G construct a primitive L_G, determine Pic(Gr_G), and compare the adjoint determinant with L_G^(2h∨), including the E8 exponent60. Question as posed in2017; no claim about its current open status.

- **Question10.6(5)**: Compare the analogous general-G geometric extension with the K2 central extension and tame boundary. Question as posed in2017; no claim about its current open status.

- **Question10.6(6)**: Find natural finite-type scheme structures before perfection on the mixed-characteristic Grassmannian bounds. Question as posed in2017; no claim about its current open status.

- **Remark11.24**: Is countable generation necessary for descendability of a faithfully flat algebra? Question as posed in2017; current status not investigated.

### Remaining closure work

- **Q-closure**: Complete recursive declaration-sized closure. All61 main-source pages are read and the main named results/constructions are indexed, but compound cited inputs, model comparisons and coherence proofs remain. API/test entries are mathematical acceptance specifications, not Lean declarations.

- **Q-sites**: Read the original Rydh10 refinement and valuative equivalence, Raynaud–Gruson flattening, Huber valuations, Yanagihara perfect weak normality, BST13 cohomological excision and formal existence/pushout sources. Separate scheme size/universe, noetherian approximation and every thickening map.

- **Q-valuations**: Close BGR84 normalization over valuation rings, RG71 local freeness, finite-rank approximation, spherical completion, Ext1(m,V)=0 and the bounded-saturated lattice proof with full hypotheses.

- **Q-Kdet**: Read Quillen devissage, TT localization/filtered colimits, Bhatt14 supported-complex completion and de Jong alterations in full at the used locators. Prove regular R0 lifting and coherent symmetric determinant compatibility, not merely a K0 formula.

- **Q-Keel**: Keel PDF1–2 and7–12 were read, including1.4,1.6–1.10. Close Artin contraction and remaining gluing references; verify the explicit G717 rank inequalities and the7.14 incidence resolution, normality/coequalizer and finite-type model comparisons. Preserve the two determinant routes and avoid a circular use of8.2.

- **Q-infinity**: Mathew original v1 PDF19–24 read; close original Barr–Beck, pro-Amitsur and uniform-index arguments. Read the appendix’s Segal/Lurie models and prove all coherence/comparison statements. Use the corrected amplitude-core truncation and keep ordinary triangulated carriers separate from enhancements.

- **Q-Tor**: Complete Kunz forward implication, regular-presentation/global-dimension bounds, Gabber2d argument and an independent verification of the explicit Tor2 cycle for the nodal counterexample. The intrinsic2d+1 global bound is only announced in the paper. Verify tensor–totalization with both truncation conventions.

- **Q-Witt**: Read BBE07 and the exact pushout/algebraization source, then prove Frobenius-inverted excision for every derived self-product. Check the p-nullhomotopy of the comparison cone, not just its homotopy groups.

- **Q-groups**: Read Zhu’s ind-properness and Kottwitz component proof, the integral faithful-representation/quasi-affine quotient theorem, ramified Weil restriction and the stable K2/tame-symbol comparison. Supply the countable-exhaustion section-lifting proof. Do not replace stable pullback at n=2 by an unstated universal extension.

- **Q-source**: Independently review all26 sourceIssues against the named versions, and obtain the published95-page PDF for a final collation. Author PDF and arXivv3 are not asserted text-identical to the publication.

### Prerequisite reading register

- **Rydh, Submersions and effective descent of etale morphisms,2010** — BS bibliography [Ryd10], Bull.Soc.Math.France138(2),181–230. Theorems2.8,3.12 and Cor2.9 for valuative and proper/open refinement; original full proofs remain unread.

- **Raynaud–Gruson, Critères de platitude et de projectivité,1971** — BS bibliography [RG71], Inventiones13,1–89. Flattening by blowups and valuation local-freeness Cor3.3.13; exact hypotheses and proof closure remain.

- **Berthelot–Bloch–Esnault, On Witt vector cohomology for singular varieties,2007** — BS bibliography [BBE07], Compositio143(2),363–392. Theorem11.40’s rational h-descent comparison and singular Witt theory; original text not yet read.

- **Mathew, The Galois group of a stable homotopy theory,2014** — https://arxiv.org/abs/1404.2156v1. Original PDF19–24 read. Finish thick tensor ideals, Barr–Beck descent and all referenced pro-object comparison arguments; preserve original-v1 numbering.

- **Keel, Basepoint freeness for nef and big line bundles in positive characteristic,1999** — https://arxiv.org/abs/math/9901149. Original PDF1–2,7–12 read. Finish Artin contraction and gluing closure of the semiampleness criterion.

- **Artin, Algebraization of formal moduli II: existence of modifications,1970** — Keel99 Proposition1.6 Artin contraction input; original article acquisition pending. The contraction/algebraization input needed through Keel and formal geometry remains unread.

- **Bhatt, Algebraization and Tannaka duality,2014** — BS bibliography [Bha14], arXiv1404.7483. Lemma5.12 supported perfect complexes and p-completion; regular lifting and algebraization proof remain.

- **Quillen, Higher algebraic K-theory I; Thomason–Trobaugh, Higher algebraic K-theory of schemes and of derived categories** — BS bibliography [Qui73], [TT90]. Devissage, localization, comparison of projective and perfect-complex K, and filtered colimits. Existing roadmap owners do not certify the proof inputs.

- **de Jong, Smoothness, semi-stability and alterations,1996** — BS bibliography [dJ96], Publ.Math.IHES83,51–93. Regular alteration covers used in sheafified devissage remain a recursive source obligation.

- **BGR, Non-archimedean analysis,1984; Yanagihara, Some results on weakly normal ring extensions,1983** — BS bibliography [BGR84], [Yan83]. Normalization over valuation bases, spherical completeness, and perfect universal-homeomorphism comparisons; originals not read.

- **Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic** — BS bibliography [Zhu14], arXiv1407.8519. Original ind-properness and Proposition1.21 Kottwitz components, plus the optional8.2 algebraic-space route. Reuse the GS owner.

- **Bhatt–Halpern-Leistner, Tannaka duality revisited,2015** — https://arxiv.org/abs/1507.01925. Theorem1.10 classification of qc open localizations used in the converse11.26; unread original proof.

- **Bhatt–Schwede–Takagi, The weak ordinarity conjecture and F-singularities,2013** — https://arxiv.org/abs/1307.3763. Lemma3.9 cohomological excision used in revised4.6; original proof still open.

- **Kunz, Characterizations of regular local rings of characteristic p,1969** — Classical Kunz source for the forward implication; original article acquisition pending. Forward flatness of Frobenius is an input to11.31; keep it separate from the converse recovered in11.35.

- **Carlsson, Derived completions in stable homotopy theory,2008; Lurie, Higher Topos Theory and Higher Algebra** — BS bibliography [Car08], [Lur09], [Lur14b]. Pro-Amitsur fibre comparison, infinity-topos hypercompletion, spectra/group-completion and coherent determinant comparison. Appendix12 sketches do not close these originals.

### Provenance and validation

- **bs17**: All61 pages read, including introduction, §§2–12, acknowledgments and bibliography; displayed formulas additionally checked in rendered pages1,5,15,16,17,19,20,26,28,29,30,42,46,47,49,50,55,58,60. SHA256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.
- **author**: First4 pages read in full and targeted version searches; not a full collation. September2016 author version. SHA256 `774032c0daee98e339b7be165174185c77714b0e729a39a985ee876ccc7e7b64`.
- **arxiv-v1**: PDF16–17 read in full for the earlier Lemma4.6 proof; rest not read. SHA256 `4716463d5c5a73d0d51b3bb988643ec574811b285c729b60f143af4567137211`.
- **arxiv-v2**: PDF26–27 read in full for the superseded Tor-dimension argument; rest not read. SHA256 `259370c8811855454b36c3d602a40e828819b6b78ac824dcbc25d2b9b3f6d96d`.
- **mathew-v1**: PDF19–24 read in full, §§3.3–3.6 including Corollary3.31; remaining93-page paper not read. SHA256 `eb83eb034db81ca3787b2ae30e73c4cc37b9ea46c8ca9aa23d13af90cec352b8`.
- **keel-99**: PDF1–2 and7–12 read in full, covering main criterion and Lemmas1.4–1.10; remaining34-page paper not read. SHA256 `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398`.

The manifest records 390 verified repository blobs at `18b447582f3601c0a9fcb7c40227e702aedc5757`. Relevant reviewed audit entries and roadmap scopes were read; CR.4 has no reviewed audit entry in this snapshot. All pinned declaration imports retain module, statement span and SHA256. No universal absence claim is inferred from keyword searches.

The graph has unique item ids, no unresolved internal prerequisites and no cycles, including the alternate determinant route. Every missing item is routed exactly once. Every definition/construction has at least three API statements and three tests. Source, input and pinned-module digests were checked.

- **Dominance and incidence bounds**: 3583 equal-size partition pairs through total length10; 1720 dominated pairs satisfy both exact G717 rank bounds.

- **Signed determinant symmetry**: 49 block swaps of ranks0–6 have determinant sign (−1)^(mn); odd rank-one swap is −1 over F3.

- **Demazure example8.7**: The λ=(2,1,0) tower has dimension2+2=4; the boundary rank-one kernel in k³ is P².

- **Nodal Tor2 witness**: In I_y/yI_y, the exponent-one monomial y is nonzero since all yI_y exponents exceed1; it maps to zero in R/(y). Checked21 root-exponent instances; the report supplies the general exact-sequence proof.

- **Amplitude-core truncation**: The unit line over F3 has two automorphisms; Perf[0,0] has nontrivial π1 and cannot be0-truncated.

- **Nerve indexing**: Degree0 is an object, degree1 has one arrow and degree2 two composable arrows; the n−1 formula fails at degree1.

- **Dimension-bound distinctions**: The dimension4 open-cover example has upper index5; the nodal dimension1 Tor2 class refutes the earlier bound1 and is compatible with the corrected bound2.

- **Exceptional-thickening index**: When nE is defined by I^(n+1), the next restriction has kernel I^(n+1)/I^(n+2).

- **Tame-symbol convention test**: 256 unit/valuation pairs over residue F5 satisfy reciprocity for the convention (−1)^(ab) u^b/v^a. This checks the acceptance formula, not the geometric comparison theorem.

- **Looped bar components**: Discrete Z has π1=0 but π0ΩBZ=Z; arithmetic checks the additive component law. The homotopy equivalence is a planned theorem.

- **Scope and provenance**: 265 unique acyclic items, 32 pinned declaration references, 390 repository blobs, 6 source digests; every missing item routed once, every construction has API and tests; no self-review verdict.

The paper schema and intake deliverable-path checks pass. No Lean file was written or compiled; this issue authorizes only the result, this report and the handoff. Suggested module paths are future design destinations.
