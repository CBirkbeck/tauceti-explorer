# BP-MetaplecticAutomorphicForms--MP.8 handoff

Worker: **Codex — codex-KMZtHy**, 6 October 2026. Issue: [#772](https://github.com/CBirkbeck/tauceti-explorer/issues/772). The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/772#issuecomment-6015246109) and [winning bot reply](https://github.com/CBirkbeck/tauceti-explorer/issues/772#issuecomment-6015248989) were read before work and rechecked before submission. Branch: `codex-KMZtHy-mp8`. Starting explorer commit: `6fe1f6c06133b4fd5599c3433d1227fc11b82d61`.

## Delivered planning pass

The packet is **complete** under PROTOCOL §0: every MP.8 target has a declaration-level plan. MP.8 coverage is **planned, not closed**. Seven precise gaps, fourteen supplier contracts and signature refinements remain. All implementation statuses are **unchecked**; this pass makes no formalization claim.

Only the four authorized deliverables are changed. The original nine integral quadratic Fourier-index nodes and stable identifiers are preserved. The expanded plan has **85 nodes: 16 definitions, 18 constructions, 6 lemmas, 41 theorems and 4 comparisons**; **104 API items, 102 definition/construction tests, 6 planets, 26 checked baseline declarations and 35 proposed modules**. The reader has approximately 23,848 words. Every definition/construction has at least three API items and three tests derived from its uses. Both node and proposed-module graphs are acyclic.

The plan covers the genus-two Siegel domain; positive symplectic similitudes and their actual square-root double cover; arithmetic and Jacobi comparisons; theta functions, torus pairing, contour shift and coefficient decomposition; elliptic-newform seeds and genuine induced Eisenstein families; archimedean Whittaker continuation and test vectors; both cusp expansions and primitive-pair/Möbius arithmetic; local root counts and Euler factors; cover-specific spectral comparisons, constant terms and residue interchanges; and the jointly meromorphic two-variable polar formula exported to BSD.2.

## Sources and corrections

The published BFH Inventiones paper, *Nonvanishing theorems for L-functions of modular forms and their derivatives*, Invent. Math. 102 (1990), 543–618, DOI 10.1007/BF01233440, was read throughout, including the previously unread printed pages 558–612. The [public scan](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) has SHA-256 `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`. Its first physical page is a repository cover sheet; zero-based PDF page index is printed page minus 542. OCR was checked against rendered pages for the formulas, domains, transposes, branches and normalizations used by the nodes. Node source records give exact locators and literal excerpts of at most 300 characters.

The distinct BFH paper *Eisenstein series on the metaplectic group and nonvanishing theorems for automorphic L-functions and their derivatives*, Annals 131 (1990), 53–127, DOI 10.2307/1971508, has only had its [publisher metadata](https://annals.math.princeton.edu/1990/131-1/p03) inspected. Its §5 is a precise unread Bessel-formula gap. The cited Gradshteyn–Ryzhik, Jacquet–Piatetski-Shapiro–Shalika and Maass passages are also unread. Weil/Kudla and general Jacobi sources remain supplier-owned foundations, not sources decomposed by this MP.8 job.

Four proposed source issues require independent review:

- **E-MP8-2**, p.548: the full stabilizer of iI₂ in GSp₄⁺ includes positive central scalars. The matrix 2I₄ fixes iI₂ and is not orthogonal; the compact stabilizer is its Sp₄ part.
- **E-MP8-3**, p.550: restore original conductor M in the original newform's Fricke equation and completion. Keep auxiliary N in the separate transformed seed. The level-one discriminant form with N=8 distinguishes these conventions.
- **E-MP8-4**, p.568, Proposition 3.9: the printed condition Im x₁ < ε includes x₁=−i, a singularity of (1+x₁²)⁻¹ᐟ². Use a bounded strip, or the upward-shift strip needed by the proof.
- **E-MP8-5**, p.602, Proposition 8.1: (6.1), n₂=1/N, and (3.37) give F±(u,s,N⁻¹y₂), consistently with the later boundary formula. The printed unscaled y₂ is recorded as a normalization discrepancy for review.

**Withdraw inherited E-MP8-1.** Rendered p.545 already says N divides m, not m divides N. That incorrect inherited finding is removed. Exact-title correction/erratum searches and publisher/author lists found no addressing correction on 6 October 2026; this is not proof that none exists, and these findings do not assert failure of the main theorem.

## Ownership and baseline

The reviewed AUDIT-15 MP.8 row, campaign/stage targets, MP.0–7 stages, relevant spectral/automorphic/L-function stages, BSD.2, QM.1, link screen and confirmed RT-AREA-automorphic-1/20 with its verification were read. General H(W) ⋊ Sp(W), its unitary analogue, Schrödinger–Weil action, Jacobi weight/index/multiplier spaces, Fourier–Jacobi extraction and theta decomposition belong in **MP.6 before MP.7**. MP.8 imports this theory and supplies its BFH genus-two arithmetic/similitude specializations and actual cover-specific Eisenstein analysis. QM.1 retains q-series applications. No MP dependency on that consumer or a converse-theorem consumer is added. BSD.2 owns the ultimate twist nonvanishing/local-condition argument.

Fresh main `ed9e36ce0a1ef390431039e3695e63a672a354c3` was checked before submission. Binding protocols, baseline, MP.8 target and deliverables are unchanged. Its QM.1 fix now imports MP.6 in seven classical Jacobi nodes and adds a scalar-index comparison. The new RT-AREA-automorphic-1.fixes-2 /20 record and exact QM.1 request were read; they agree with this packet's boundary but do not supply the missing MP.6 native interface. This job edits neither those files nor the atlas stages.

Pinned declarations were read at **Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`** and **Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`**. The native quadratic-form interface is retained. New checked inputs include positive-definite matrices, unitary groups, the two-variable Jacobi theta series, arithmetic Möbius function, PID diagonalization, matrix-to-linear-map equivalence, one-variable meromorphic functions and Tau Ceti's Cholesky equivalence. Cholesky gives lower-triangular LLᵀ; reversing the basis gives BFH's upper-triangular QQᵀ. Generic Gaussian, Smith normal form, Peter–Weyl, classical newform/Hecke/Fricke/L-function and supplier-owned Jacobi theory are imported, not replanned. Upstream InductionRestriction, ConformalMapping and relevant ModularForms layers were read for structure and exact boundaries.

The fourteen requests are to MP.1, MP.2, MP.4, MP.6, GN.0, AF.1, AL.3, AS.1, AS.2, upstream CompactGroups layer 5 and upstream ModularForms layers 2, 4, 6 and 7. Each gives a mathematical contract and exact consuming nodes. Retarget stage-level requests when native supplier declaration ids exist.

## Conventions to preserve

Keep the integral component's full discriminant quadratic form, not merely its determinant, and distinguish a prescribed residue lift from a canonical one. Its normalization is a=m/N, c=N at cusp j=0 and c=1 at j=1; classification requires a≠0. BFH uses J with blocks (0,−I;I,0), Y=QQᵀ and CDᵀ=DCᵀ. Normalize the cover root by the positive similitude μ. The J lift is i√(−det Z); compare the theta factor with its compensating Weil phase. Similitudes transport m to μm. The theta torus norm is √det Y/(2a); retain the coordinate-change Jacobian. Compare native G/H classes gH and BFH H\G classes Hg by inversion.

Distinguish holomorphic Jacquet V from gamma-normalized meromorphic W. Nondegenerate rapid decay does not imply the same two-variable decay for W⁰. The Novodvorsky integral is iterated, without an unjustified joint Fubini step. The normalized inducing parameter is ν=s−2, with reflection 4−s. Keep M distinct from N and retain rank-one opposite-cusp terms until cuspidal extraction cancels them. The polar formula uses N⁻¹y₂ and joint meromorphy in two complex variables.

## Validation and signature limits

The packet checker reports **0 errors, 0 warnings**. Intake checks report **four files, zero problems**. Manual checks confirm node/API/test names agree across deliverables, every definition/construction meets the three-item requirements, statuses are unchecked, excerpts obey the length limit and both dependency graphs are acyclic. No packet contains Lean code or private paths. Git whitespace checks pass.

The suggested file elaborated with **lean-check** in the shared pinned Mathlib build: **exit 0, zero errors, 309 warnings, all `declaration uses sorry`**. It has **152 named theorem/lemma signatures and 106 examples** (102 named tests and four additional inherited examples). No language server or library build was started. Suggested-file SHA-256: `fd7517ee0608a219534169a46a486b5c5fe1fcd91c5f966c6622d366ed2a4f09`.

Missing supplier interfaces are explicit in packet `signatureOmissions` and Lean comments. The arithmetic-adelic comparison has no pretended native signature. Raw-function sketches omit identified supplier conditions and are not unconditional mathematical claims; full mathematical statements are in the reader and packet. Available native measurable, integrable, continuous and convergence conditions are used; no opaque proposition or stored theorem conclusion substitutes for a missing object. Placeholders and compilation establish only that displayed signatures elaborate.

## Follow-up frontier

Resume from the seven gaps and their exact consuming nodes, rather than restarting the finished BFH target inventory:

1. Establish MP.4 rational/finite-place splitting, finite theta vector, dyadic lift and added similitude comparison with the MP.6 Jacobi dictionary.
2. Read or prove Gradshteyn–Ryzhik 3.384.9 and 9.237 with exact branches, chambers and gamma factors.
3. Read or prove Jacquet–Piatetski-Shapiro–Shalika §8.3.3 with uniform parameter, compact-convolution and differentiated hypotheses for both kinds of Whittaker bound.
4. Read or prove Maass §11 and p.160: primitive symmetric-pair completion and rank-one normal form with precise congruence reductions.
5. Obtain BFH Annals §5, reconcile its Bessel formula/measures and give the finite K-type construction omitted in Inventiones Proposition 3.15.
6. Prove the omitted ramified P(s,0,r) regularity near s=2 by independent arithmetic factor calculations. Avoid circular use of E-regularity and P-regularity to establish each other.
7. Complete the AS.1–2 genuine-cover adaptation: actual induced topology/Haar measures, convergence/differentiation bounds, normalized intertwiners, constant terms/poles, Fourier/residue exchanges and joint two-variable meromorphy.

Discharge the fourteen contracts and replace partial signatures once supplier types exist. Independently verify the four source issues, all local root-count rows and completed-function normalizations. Independent review must assess this planning pass before follow-up/assembly. Scratch files are disposable; this note and the mathematical deliverables hold the continuation information.
