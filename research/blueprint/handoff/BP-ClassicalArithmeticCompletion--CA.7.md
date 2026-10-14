# BP-ClassicalArithmeticCompletion--CA.7 handoff

Issue: #9671. Worker: Codex, session `codex-ruGjB5`. Branch: `codex-ruGjB5-ca7`.
Claim: [bot-confirmed worker claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9671#issuecomment-6165755668), 2026-10-14.

## What this pass delivers

A completed target-level continuation for the single stage `ClassicalArithmeticCompletion:CA.7`, with **planned** coverage. The accepted main packet is unchanged. All 55 inherited target IDs are retained, and all 49 inherited independent-review obligations have a specific response in `reviewFrontierAudit`. This is a planning submission for independent review, not an independent review of this worker’s work and not a checkpoint.

New material: 71 targets (2 definitions, 20 constructions, 45 theorems, 4 comparisons), 94 API items, 88 discriminating unit tests, 6 planet markers, 25 checked baseline declarations, 15 precise existing-roadmap dependency contracts, 8 recorded boundaries and 1 source misprint. Every new definition/construction has at least three API items, at least three tests and a consuming use. The README also carries the full accepted target contracts, APIs, checks and source locators.

The four inherited unfinished areas now have target-level supplier plans:

1. **Finite-projective K₀:** the existing Tau Ceti carrier, common finite-free stabilization, projective complements, balanced scalar extension, restricted scalar maps, Steinitz decomposition and comparison with the existing ideal class group. No replacement K₀ type is introduced.
2. **Semisimple rank-one realization:** arithmetic idele double cosets, reduced norm and stable matrix classification for every semisimple number-field algebra. Rank-m splitting is derived by lifting the matrix reduced norm to a rank-one idele; it does not assume hereditary maximal-order theory. Differences and zero classes are treated explicitly. The broader inherited Dedekind contract is retained with a scope boundary.
3. **Jacobinski cancellation:** the exact Eichler condition, the norm-one inner-form/archimedean adapter to the accepted strong-approximation target, fibres over conjugate orders, and cancellation. Matrix algebras over a definite quaternion division algebra are allowed; the division algebra itself is the excluded case.
4. **Fröhlich–Taylor:** the character Hom quotient, positive-unit kernel comparison, embedding norm resolvends, symplectic root signs and their class, Gauss valuations and products, the integral group logarithm and torsion kernel, elementary reduction/crossed products/fixed points, and Taylor’s diagonal/off-diagonal determinant factors. The full obstruction equality precedes its order-two, no-symplectic and odd-order corollaries. Source-dependent proof inputs remain explicit below.

## Mathematical and interface corrections

- Relative local rank is one over O_F[G]; absolute local rank is d=[F:Q] over Z[G]. The free-module conclusion uses a witnessed module isomorphism, not noncommutative finrank.
- General restriction sends cΓ(P) to cΛ(Res P)−n cΛ(Res Γ). For Z[G]→O_F[G], the restricted coefficient module is globally free of rank d, so the correction vanishes.
- The generic completion consequences require a nonfield Dedekind base, finiteness and torsion-freeness. Fields use their actual generic basis; empty height-one spectra cannot prove rank, equality or projectivity.
- Finite residue trace is calculated on the A/p-vector space B/pB, using its primary filtration. Its graded pieces are residue-field lines; its nonreduced primary quotient is not asserted to be a vector space over B/P.
- Projective group norm gives an isomorphism from coinvariants to invariants, which supplies the augmentation computation as well as trace surjectivity.
- Our ν=L/p differs from CPT’s unnormalized ν. The exact character formula applies coefficient Frobenius before evaluating the Adams-transformed character. Equal logarithms leave determinant torsion, which Taylor’s congruences must eliminate.
- Taylor’s diagonal theorem uses the completed integer rings fixed by wild inertia of a sufficiently large finite Galois coefficient extension. The statement has no unspecified inertia-norm modification.
- The all-place kernel numerator is positive on symplectic characters at all infinite components. The finite-S sign representative has positive infinite value one and a positive principal denominator.
- Definition facets of the inherited Cl subgroup and integer-ring class precede their theorem APIs. `prerequisiteFacets` and `definitionFacetOrder` record this order; the positive-unit quotient does not depend on the Fröhlich kernel-membership conclusion.

## Exact remaining boundaries

### G-LOCALCONSTANTS: Relations and induction for local Galois constants

F76 Theorem3, pp.392–393 uses the local-constant formalism to extend degree-one Gauss sums to R_G. Supply a proved relation-independent extension, the degree correction under induction, duality, change-of-additive-character and Galois formulas, with the stated Artin/different convention. The read one-dimensional formula alone does not prove these relations.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/tame-local-gauss-sum`, `ClassicalArithmeticCompletion:CA.7/continuation/gauss-galois-compatibility`, `ClassicalArithmeticCompletion:CA.7/continuation/symplectic-root-sign-law`.

### G-ARTIN: Comparison with the analytic Artin root factor

The algebraic inverse-Gauss expression is specified and F76 equations(2.4)–(2.5), p.390 identify it with the root factor of the completed Artin functional equation. An exact lower-tier proof/interface for that analytic identification has not been read or found. This gap concerns the analytic comparison API, not the existence of the algebraic sign representative.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/symplectic-root-sign`.

### G-DH: The residual p-power ambiguity in Hasse–Davenport

DH Appendix(A.6), p.19 states the exact product relation and refers its proof to an uncleared book. Digit-sum valuations and leading residues leave a p-power root-of-unity ambiguity; supply a full proof eliminating it. The formula is a target, not a conclusion inferred from equal valuations.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/finite-gauss-product`, `ClassicalArithmeticCompletion:CA.7/continuation/gauss-log-image`.

### G-LOCALBRAUER: Q_p-rational elementary induction

CPT Theorem5.4, p.29 cites Serre’s uncleared representation book for the Q_p-p-elementary refinement. The existing InductionRestriction Layer6 owns generic Brauer induction but not this refinement. Supply the exact prime-to-p multiplier identity in integral lattice characters with its cyclotomic-action condition.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/p-elementary-determinant-reduction`.

### G-CROSSEDPRODUCT: The elementary crossed-product matrix identification

CPT Theorem6.2, pp.31–32 relies on Wall’s matrix-ring identification for a cyclotomic étale factor with its p-group action. Supply the full coefficient-equivariant isomorphism, its restriction/norm formula and the determinant invariant comparison. A split-field matrix isomorphism alone does not give this integral assertion.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/elementary-crossed-product-descent`.

### G-FTCONGRUENCE: The Gauss congruence supplier used in Taylor’s torsion test

Taylor Theorem4, pp.59–61 and its proof in §§9–10, pp.65–75 give four detecting congruence branches. The degree>2 Gauss congruence at §9 Ia invokes Fröhlich–Taylor 1980 §5.1; the adjusted Gauss equivariance input also invokes its Propositions3.6–3.7. The publisher refused the full text (DOI10.1098/rsta.1980.0242), and no cleared/public full copy was found. Read and prove these exact congruences before closing the determinant assertion.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/adjusted-gauss-sum`, `ClassicalArithmeticCompletion:CA.7/continuation/gauss-torsion-detection`.

### G-COMPLETION: Generic Dedekind localization-to-valuation-completion adapter

Construct the canonical A_v→valuationRing(v.adicCompletion(Frac A)) for a nonfield Dedekind domain; prove injectivity, localness and torsion-freeness over the DVR, then apply the pinned faithfully-flat local-map theorem. Current NumberFieldArithmetic Layer5 owns the number-field version, not this generic Dedekind adapter. Supply the compatibility with finite lattice scalar change needed for projectivity descent and sublattice equality.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/dedekind-completion-detection`.

### G-GENERALIDEAL: The inherited rank-one statement beyond arithmetic orders

F75 proves stable idele classification and rank-one realization for arithmetic orders in semisimple number-field algebras. The inherited rank-one target is stated for a nonfield Dedekind base without consistently restricting it to that arithmetic setting. Keep its ID and record the broader Dedekind statement as a scope/proof boundary: supply a general order decomposition theorem at that contract, or have the independent reviewer approve restricting that contract to arithmetic orders. No general theorem is inferred from the number-field strong-approximation proof.

Direct consumers: `ClassicalArithmeticCompletion:CA.7/continuation/semisimple-rank-one-class-supplier`.

The new chains are fully inventoried at target level, but these boundaries prevent **closed** coverage. Their descendant inherited contracts identify the affected boundaries explicitly. In particular the analytic Artin comparison is separate from the algebraic sign definition; generic completion and generic Dedekind rank-one scope must not be inferred from the arithmetic cases.

## Imported owners and moves

Existing current-roadmap contracts are read imports, not requests to recreate their targets. The packet records 15 precise dependency contracts for SemisimpleAlgebras, CharacterTheory, InductionRestriction, NumberFieldArithmetic, ClassFieldTheory, LocalFieldsRamification and ReductiveGroups. The exact accepted node `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem` is also imported. No upward dependency on general K-theory, finite-field character sums or analytic Artin L-functions is introduced.

Moves to reconcile during assembly:

- **KTheoryLowDegrees Z.1/Z.4 → CA.7:** stable equality/free complements, balanced scalar extension/restriction on finite projectives, and Steinitz/class-group comparison. KTheoryLowDegrees imports the new continuation IDs; its general higher K-theory/K₁ programme remains there.
- **FiniteFieldsAndCharacterSums FF.1 → CA.7:** only `finite-gauss-valuation` and `finite-gauss-product`, needed for Taylor. The existing Mathlib Gauss-sum carrier stays in Mathlib, and the wider character-sum programme stays in its owner.
- **Structure:** propose three blocks for integral bases/trace, orders/stable modules, and character determinants/tame obstruction. This respects the existing RS-03 stage until the manager approves a change. Reconcile continuation and inherited markers at assembly. If the stage stays unsplit, the proposed combined six-planet palette is Normal integral basis, Noether theorem, Hilbert–Speiser theorem, Locally free class group, Jacobinski cancellation and Fröhlich–Taylor theorem. Do not concatenate two six-marker palettes.

Current upstream and current-library screening is recorded in `ownershipAudit`, separately from the pins. In particular current G₀ restriction is not projective-K₀ restriction, current ring-equivalence functoriality does not give arbitrary scalar maps, and the local orbit lattice is not the full integer-ring NIB theorem. OrthogonalSpinGroups does not supply generic semisimple reduced norm. The nine roadmap additions listed in WORKERS were screened without re-planning their mathematics.

## Sources and access

All new statements and proof recipes are written in the roadmap’s own words with theorem/section/page locators. No source passage or source file enters the repository. The reader is organized by targets, rather than as a section-by-section source summary.

- **F75**: [Locally free modules over arithmetic orders](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0274_0275/LOG_0014.pdf). Read §§1–5, pp.112–122; §6 consulted only to delimit scope.
- **F76**: [Arithmetic and Galois module structure for tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0286_0287/LOG_0033.pdf). Read §§1–2, pp.384–394; §§3–11, pp.395–418; Appendix I–VII, pp.426–437.
- **T81**: [On Fröhlich’s conjecture for rings of integers of tame extensions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf). Read Entire article, §§1–12, pp.41–79.
- **J68**: [Genera and decompositions of lattices over orders](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6057-11511_2006_Article_BF02391907.pdf). Read Definitions and Theorem1.4; §§2–4, pp.5–19; §5.3–5.5.
- **CPT**: [K₁ of a p-adic group ring I. The determinantal image](https://arxiv.org/pdf/0904.2563v1). Read Hypothesis and Theorems1.2–1.5, pp.2–4; §3, pp.12–22; §4a, pp.23–24; §§5–6, pp.26–36; Appendix pp.36–38.
- **LOGSURVEY**: [The group logarithm past and present](https://www.mathi.uni-heidelberg.de/~otmar/workshopms/logsurvey10-3Final.pdf). Read §§2–3, pp.3–8; §5, pp.11–15; §6.2, pp.20–23.
- **W-I**: [The K-book, Chapter I: Projective Modules and Vector Bundles](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf). Read I§2, pp.6–8; I§3, pp.16–19.
- **W-II**: [The K-book, Chapter II: The Grothendieck Group K₀](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf). Read II§1, pp.1–2; II§2, pp.5–13.
- **JOHN**: [Notes on Galois Modules](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf). Read §§1–10 and §§13–15, pp.1–30; §12 inspected to delimit scope.
- **KNE**: [Lectures on Galois Cohomology of Classical Groups](https://mathweb.tifr.res.in/Documents/Publications/Lectures/tifr47.pdf). Read §5.4, retypeset pp.66–69, original pp.87–91.
- **PRR**: [Algebraic Groups and Number Theory, Volume I](https://doi.org/10.1017/9781139017756). Read §1.4.1–1.4.3, pp.29–33; §1.5.2 Theorem1.34, p.43; §2.3.4 Proposition2.37 and proof, pp.100–101.
- **MART**: [Modules projectifs sur un ordre](https://www.numdam.org/item/STNB_1970-1971____A15_0.pdf). Read Entire exposé, I–V, pp.17-01–17-05.
- **STICK**: [Jacobi sums and Stickelberger’s congruence](https://kconrad.math.uconn.edu/articles/jacobistick.pdf). Read Theorems1–2 and their proofs, pp.1–5; pp.6–9 not used.
- **DH**: [Gauss and Jacobi sums on finite fields and Z/mZ](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf). Read Appendix, formula(A.6), p.19; its proof reference is not treated as a read proof.
- **VOIGHT**: [Quaternion Algebras](https://jvoight.github.io/quat-book.pdf). Read §9.4, pp.139–142, localization and lattice gluing; Chapter10 §§10.2–10.4, pp.152–155, especially Lemmas10.2.7 and10.3.7 and paragraph10.4.2.

The PRR Chapters1–5 material was read in place from the maintainer-cleared library. The global norm theorem’s unproved book citation is replaced by the read Kneser local/global polynomial argument; the inner-form adapter uses the actual proof of PRR Proposition2.37. Reiner, Fröhlich’s book, Serre’s book, Curtis–Reiner, Washington and Berndt–Evans–Williams were not read from uncleared copies. The Stickelberger base calculation is supplied directly instead of using the Washington reference. The exact unread Hasse–Davenport remainder is recorded rather than filled by its book citation.

Fröhlich–Taylor 1980, DOI10.1098/rsta.1980.0242, remains unavailable: the publisher refused full text and no cleared/public full copy was found. CPT’s cited local rational induction and Wall matrix input remain precise source/proof boundaries. The source-access boundaries inherited for cancellation and semisimple arithmetic-order classes have public replacement arguments, rather than continuing to cite inaccessible books.

`ClassicalArithmeticCompletion/E901` records only the additive-identity misprint in CPT arXiv v1 Corollary3.3, p.13. The formula has zero, not multiplicative one, as logarithm value. ArXiv lists only v1; Pappas’s old and current publication pages list no correction; publisher DOI10.1016/j.jalgebra.2010.08.006 was identified, but full text returned403. This finding is scoped to the preprint and claims no published-version error. Existing Johnston corrections in the accepted packet are retained without duplicate findings.

## Validation and suggested file

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion--CA.7.json`: **0 errors, 0 warnings** against the pinned declaration index.
- `lean-check research/blueprint/suggested/ClassicalArithmeticCompletion--CA.7.lean`: **exit0**, with only the expected admitted-proof warnings, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded 20GB; one worker compile ran at a time. No language server or build/cache/update command was run.
- Suggested file: 188 lines, existing carriers, light real-bodied definitions, statable signatures and examples. No admitted data definition, uninterpreted replacement type or fabricated proposition carrier. Heavy carriers are fully specified in the README.
- Independent consistency checks verify 55 retained IDs, the exact 49-item frontier, distinct new IDs, all definition APIs/tests/uses, all eight boundary references, all README target anchors and the six-marker limit.
- Submission file check, source-issue format check, absence of source excerpts/prohibited planning labels, and whitespace check are run before committing. Only the four authorized deliverables change.

## What the next pass must do

Independent review should check the supplier graph and conventions, especially the inherited definition/API facets and the arithmetic-versus-general-Dedekind scope. Closure work should start with G-LOCALCONSTANTS and G-FTCONGRUENCE, then resolve the exact product, local rational induction and crossed-product inputs. The completion adapter and broad rank-one contract are separate arithmetic interface tasks. The handoff and packet preserve all necessary locators, statements and boundaries; no continuation depends on this worker’s scratch files.

No second issue is claimed by this run. The claim ends when the pull request opens, and the worker stops after recording its URL.
