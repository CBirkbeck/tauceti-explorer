# BP-ArithmeticStatistics--ST.5 handoff

Agent: Codex. Session: codex-nILjKa. Issue: [#6357](https://github.com/CBirkbeck/tauceti-explorer/issues/6357). Branch: codex-nILjKa-arithmetic-statistics-st5.

## Delivered status

This is a complete additive target-level pass, not a checkpoint. Packet status is **complete** and coverage of `ArithmeticStatistics:ST.5` is **planned**, not closed. The 194 accepted ST.5 parent targets are imported unchanged. There are 55 new targets: nine definitions, one construction and 45 theorems; 37 API items, 32 planned unit tests, twelve pinned baseline receipts, sixteen gaps and nineteen supplier requests. There are zero new planets; the accepted parent's six ST.5 planets exhaust the shared layer budget. Every implementation status is unchecked. Inclusion of a conjecture means formulation of its proposition, not a claimed proof.

Deliverables:

- [Packet](../packets/ArithmeticStatistics--ST.5.json): exact statements, source/version receipts, typed dependency chains, acceptance cases, requests, gaps, ownership reconciliation and five new source findings.
- [Reader](../readmes/ArithmeticStatistics--ST.5.md): every new target with its hypotheses, prerequisites, proof contract, API/tests and native-interface boundary, plus a full accepted-import catalogue.
- [Suggested interfaces](../suggested/ArithmeticStatistics--ST.5.lean): seven native target signatures, 22 API signatures and seventeen discriminating examples; 48 target propositions, fifteen API items and fifteen tests have explicit prose omission catalogues.

Only these deliverables and this handoff were edited. The parent and all other part packets remain untouched.

## What the pass establishes

The planned locally compact quadratic carrier stores actual continuous homogeneous quadratic data and a homeomorphic polar adjoint, with locally compact Hausdorff topological-group assumptions. Weak metabolicity retains compactness, openness, quadratic vanishing and self-annihilation. The finite reduction and projective-measure targets give the Poonen–Rains locally compact interpretation; the arithmetic application retains the theta quadratic refinement, the finite-group-scheme Sha¹ quotient and fppf cohomology where required.

The finite-prime law uses one common parity, including the empty prime selection. Its model moments are distinct from the conjectured arithmetic moments. Integral OGr uses locally direct-summand subbundles and the quadratic equation over ℤ, including two; intrinsic Schubert measures replace conditioning on null ambient events. The all-prime Delaunay model is finite almost surely for positive rank and infinite almost surely at rank zero. Sparse-prime weights and the harmonic denominator are stated with their actual summability conditions.

The Wood plan gives an explicit entire grid separator, absolute coefficient estimates, a subgroup-growth bound, multivariate uniqueness and the general bounded-exponent moment-limit theorem. It does not infer full-group convergence from quotient laws. The current scalar moment-determinacy theorem has a stronger exponential-integrability hypothesis and is not a substitute.

The arithmetic consequences include balanced-family three-Selmer rank bounds, the exact special analytic rank-zero criterion, aggregate two-Selmer nonlifting, five-Selmer rank bounds with finite-height limit handling, a marked-quartic Jacobian average, general abelian three-isogeny averages and signature-dependent twist conclusions. The imaginary-quadratic conclusion retains the union of ranks zero and one. The unrestricted BKLOS endomorphism index step is a gap; a conditional index version and the direct multiplication-by-three version retain the valid finite-extension consequence.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.5.json --json` reports zero errors and zero warnings against the registered pinned declaration index. The packet's target, API, test, import, source and native-omission catalogues were also checked against the reader and suggested file. The suggested file was elaborated serially with `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the only Lean diagnostics were unimplemented-proof warnings. This validates signatures and example types, not proofs. No language server or library build was started.

The five numerical examples in the suggested file are minor proof-sketch inequalities, not extra nodes. Exact rational calculations check the full-family mixtures: 88497/100000, 100501/120000 and 16503/80000. The direct-summand count at n=2,p=2,e=2 is twelve, and the n=1 count is two at every level.

## Current upstream and owner boundaries

The current read-only upstream trees are TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Full ProfiniteArithmetic and StandardDistributions readers, relevant IntegralLattices, OrthogonalSpinGroups and EllipticCurves interfaces, and actual library sources informed the audit. Pinned finite quadratic modules already exist. Restricted products are already owned and completed; the convenience additive alias in current Tau Ceti postdates the pin, so the baseline citation is Mathlib `RestrictedProduct`.

The generic Grassmannian belongs to `AlgebraicModuliForArithmeticGeometry:R09.1`. All-prime integral quadratic OGr and its statistical comparison extend what the current field-based OrthogonalSpinGroups supplies. The Oesterlé–Serre integral-point measure belongs to AdelicAlgebraicGroups, Part II; its general finite-type reduction-image count must not be replaced by the full count of nonliftable finite-level points. The compact/discrete finite-exponent and finite-flat Poitou–Tate extensions belong to ArithmeticGaloisDuality, Part II.

**Move down for assembly:** the exact special three-Selmer analytic-rank-zero criterion is now `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`. ArithmeticStatistics is tier 14 in the AnalyticNumberTheory bundle. OrdinaryAutomorphicFormsAndModularityLifting is tier 20 and must import this criterion; it cannot be an upward supplier here. Its primary proof is `G-analytic`, not an existing lower-tier theorem.

## Existing supplier refinements

The packet's `supplierRefinements` gives exact mappings to ST.0–ST.4. In particular:

- ST.2 now has the acceptable ternary, quaternary and quinary counts used by the 3-, 4- and 5-Selmer averages; their orbit and local-mass assembly remains requested.
- ST.2's smoothed fixed-A quaternary count does not close BSS's increasingly sparse leading-coefficient-dependent lattices. The even-degree monicization is not ST.1's generic odd-dimensional BGW dictionary.
- ST.2's number-field twist-orbit count is conditional on six axioms, its actual coregular main term and the finite archimedean representative window. GlobalFields I's squareclass tail does not supply those.
- ST.4's PGL₃ projective cubic transfer counts globally soluble cubics, not all locally soluble three-Selmer orbits.
- ST.3's dihedral/tower means supply symbolic exact formulas, not a certified numerical quadratic moment. The enhanced-law existence and finite-field limit frontiers remain inherited gaps.

## Source checks and repairs

All statements are in original words, with theorem/section and printed-page locators. No source passage, extracted text, PDF or private book material is committed. Primary reading was targeted at the source routes needed by ST.5; unread proof obligations are identified below.

The new source findings are `ArithmeticStatistics/E740` through `E744`. These are evidence to be checked in independent review, not self-review verdicts:

- E740: PR Corollary 2.12 uses a finite quotient in the separability argument; countable is the correct assertion, as the self-dual Z×ℝ/ℤ example demonstrates.
- E741: Wood Lemma 8.1 needs absolute coefficient values and the maximum absolute finite-polynomial coefficient for the signed-sum interchange.
- E742: the BKLPR sparse-prime proof has an inadequate truncation constant. A 2ε log N numerator and (1/2) log N denominator give 4ε, enough for the same limit; the author-final theorem has different numbering.
- E743: the BS5 root-balanced proof cannot simultaneously attain separate conditional limsups. The target proof uses finite-height sums and the single total mean, retaining the numerical theorem.
- E744: the BKLOS general endomorphism proof's degree/index coefficient need not control an arbitrary Mordell–Weil module over Z[ψ]. The added explicit index hypothesis, and the [3] case with c=1, avoid that unsupported step. No counterexample to the claimed average theorem is asserted.

The version fingerprints, public URLs, access dates and exact passages read are in `sources`. The main sources checked are PR 1009.0287v2; BKLPR 1304.3971v2 and its author-final copy; Wood 1402.5149v2 and 1504.04391; BS3 1007.0052v2; BS4 1312.7333v1; BS5 1312.7859v1; BSS 2110.09063v1; and BKLOS 1709.09790v2 plus its author-linked copy. The Kane receipt is a statement-level lead, not proof closure. Kane §§2–7 with Swinnerton-Dyer and de Jong's primary proof remain explicit source gaps.

## Precise remaining gaps


### G-lc-duality — Topological quadratic reductions and projective measure

Prove the requested compact-open annihilator and finite-exponent Pontryagin exactness, consistent finite-isotropic cylinder construction, cofinal inverse-limit topology and a.s. discreteness. The suggested carrier is available; these are mathematical proof/interface inputs, not existing general biduality theorems at the pin.

Resume at `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`.


### G-fppf-theta — Finite-flat theta obstruction and global duality

Export genuine fppf H¹/Brauer/local-invariant/theta-group interfaces and prove local quadratic Kummer isotropy and global maximal isotropy. The finite group-scheme Sha¹ quotient in Theorem4.13 must survive the comparison.

Resume at `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`.


### G-ogr — Integral orthogonal geometry and Oesterlé proof inputs

Complete the integral split OGr charts/component morphism and SGA7 proof contract, including characteristic2. The generic Grassmannian belongs to R09.1. Read or supply Oesterlé/Serre’s underlying p-adic estimates in AA.2 Part II; BKLPR Proposition2.1 is a stated source-qualified input, not a verified decomposition of those references.

Resume at `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`.


### G-wood-analysis — Analytic coefficient and bounded-exponent moment interfaces

Prove locally uniform convergence of the infinite product, its entire Taylor expansion with absolute bounds, justified countable interchanges, subgroup-bound growth and dominated tightness. Export the partition/group realization carrier from the parent to state the full bounded-exponent group theorem natively. The scalar real moment theorem in current Tau Ceti has a different exponential-integrability hypothesis and does not discharge this gap.

Resume at `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`.


### G-full-group-tail — From bounded exponents to the parent full Cohen–Lenstra law

Wood Theorem3.1 establishes quotient laws for each a. To close the parent all-p,u full finite-p-group limit, additionally bound large rank and exponent tails uniformly in n using its surjection moments and the exact cyclic/elementary-abelian target formulas. Never identify the bounded-exponent theorem with a full-group assertion without this step.

Resume at `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u`.


### G-selmer-orbit-mass — Selmer descent-to-count comparison

The ST.2 counts for n=3,4,5 now exist at target level. What remains is the exact ST.1 locally soluble descent dictionary, integral multiplicity weights and ST.4 local/global mass assembly with the source quotient groups. These are the proof gaps of the parent averages, not missing copies of the coefficient-count theorems.

Resume at `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.


### G-bss — BSS even-degree and sparse-count closure

Complete R-bss-monicization and R-bss-sparse-count with their increasingly sparse a-dependent support. The accepted smoothed-quaternary theorem is a key input with a fixed nonzero power saving and constrained weights/ranges; it alone does not prove the full marked Jacobian average or second moment. Both remain upper bounds.

Resume at `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`.


### G-analytic — Special analytic nonvanishing proof and generic residual input

The exact BS3 Theorem43 criterion is now a lower-tier target, but its Skinner–Urban primary proof has not been read/decomposed. Supply the specialized ordinary main-conjecture implication, elliptic L-function and quantitative residual3 irreducibility with multiplicative inertia at5. The ST.4 rank-one criterion does not substitute for it.

Resume at `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`.


### G-five-density — Certified root-balanced family density

Verify the finite2-adic and3-adic local tables and remaining Euler-product tail in BS5 §5 with exact archimedean sign weights and rational interval bounds proving density>.5501. The rounded decimal is not an unverified floating-point implementation claim.

Resume at `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`.


### G-twist-count — Number-field coregular twist count

The accepted ST.2 number-field twist theorem is explicitly conditional. Discharge its six axioms, native mirror/orbit/local-mass adapters and finite representative-window measure using R-bklos-orbit-adapter and R-bklos-count-closure. Extend from elliptic to general degree3 abelian kernels; do not declare a general asymptotic from ordinary cubic-field counting.

Resume at `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`.


### G-endomorphism — Unrestricted BKLOS endomorphism rank claim

The source proof treats an arbitrary finitely generated Z[ψ]-module as if its ψ-index were (e/t) times its Z-rank. Unit simple factors and unequal component ranks invalidate this estimate. The general source claim therefore remains an explicit unresolved result. The present conditional index theorem and unconditional [3] specialization are safe; prove a suitable additional componentwise hypothesis or repair the broader theorem before removing this gap.

Resume at `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`.


### G-local-isogeny — Local3-isogeny and Cassels–Tate proof ownership

Read the primary Dokchitser–Dokchitser norm-index formulas and discharge the Cassels–Tate adjoint quotient pairing, local Selmer ratio ranges, torsion exceptions and the finite k choice in the complex-place construction. These are R-local-isogeny-invariants and R-duality-pairing, not fresh probability laws.

Resume at `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`, `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.


### G-kane — Full-two-torsion twist law analytic inputs

The parent Kane theorem retains full rational2-torsion, no rational cyclic4-subgroup and the source squarefree twist ordering. Read and close Kane §§2–7 character-sum bounds and the Swinnerton-Dyer combinatorial limiting law at their actual owner. The source listed as nonpublic in the parent has not been used from an uncleared copy here.

Resume at `ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families`.


### G-dejong — Primary de Jong function-field verification

Obtain and directly read Counting elliptic surfaces over finite fields, Moscow Math. J.2(2002),281–311. Until then the parent function-field3-Selmer limsup≤4+O(1/q) remains explicitly second-hand with3∤q and source denominator; no direct proof or ordinary-limit claim is added.

Resume at `ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound`.


### G-inherited-frontiers — Retained random-group and function-field frontiers

Retain the parent certified D₄ weighted-vs-uniform comparison (ST.3 now supplies proven symbolic constants but not error-bounded numeric evaluation); enhanced CL existence (joint cokernels of noncoprime polynomials); finite-field abelian inputs in the existing Part II; EVW homological stability as an imported source-qualified input; and nonabelian Schur–Zassenhaus conjugacy as an explicit hypothesis without a cyclic upward request. Preserve Smith Part II conditional use, Wood non-good liminf/boundary remainder, LWZB iterated limsup/liminf, and all corrected finite-field exclusions. This pass supplies ownership adapters, not proofs of these already owned targets.

Resume at `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-finite-level-law`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-conjecture`, `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law`, `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs`, `ArithmeticStatistics:ST.5/large-q-cohen-lenstra-theorem`, `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-lower-bound`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer`, `ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion`, `ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions`, `ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments`.


### G-native — Native arithmetic and geometric signatures

The suggested file elaborates seven supported native targets. The remaining targets require supplier exports for scheme-valued OGr points, finite group isomorphism classes, normalized arithmetic families, fppf cohomology and theta maps, or elliptic L-functions. Each omitted declaration is catalogued in the file with its full proposition and a node-specific reason. No arbitrary Prop, numerical-law wrapper or opaque model stands in for these objects.

Resume at `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`, `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`, `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`, `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes`, `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`, `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights`, `ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit`, `ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`, `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`, `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift`, `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.


## Supplier requests to discharge

These nineteen requests are recorded in the packet, with exact consumer IDs. They are not claims that another worker has supplied the result.

- **R-probability**, `PadicMeasuresIwasawaAlgebras:L1`: Countable projective limits of consistent finite probability spaces, with cylinder-set uniqueness; countable independent product laws; first and second Borel–Cantelli, including countable finite-group carriers. Extend the owner as Part II rather than duplicating general measure theory.
- **R-local-global-cohomology**, `SelmerIwasawaCohomology:L0`: Finite flat fppf H¹, including inseparable torsion, the Kummer exact sequences for n and divisors m|n, restriction/corestriction, Shapiro and localization to restricted products. Supply the genuine cohomological carriers and maps, not opaque propositions.
- **R-duality-pairing**, `SelmerIwasawaCohomology:L1`: The finite-flat local perfect cup-product pairing and self-dual Kummer annihilation; Cassels–Tate pairing with its isogeny adjointness, nondegeneracy after maximal divisible quotient, and alternation for elliptic curves. For the parent 3-isogeny parity, the induced dual-isogeny quotient pairing forces even F₃-dimension; do not assume all Sha finite.
- **R-selmer-parity**, `SelmerIwasawaCohomology:L2`: Dokchitser–Dokchitser finite reduced p-Selmer parity for elliptic curves over Q, with torsion removed and local/global root number conventions. Supply the descent rank bound and the divisible-Sha correction needed to connect finite and p∞ parity.
- **R-special-ordinary-input**, `SelmerIwasawaCohomology:L3`: Ordinary residual3 Selmer structures and comparison to the elliptic3-Selmer carrier for the precise specialized analytic-rank-zero criterion owned here. The Skinner–Urban nonvanishing implication itself is G-analytic in this lower-tier stage.
- **R-poitou-tate**, `ArithmeticGaloisDuality:D7`: Poitou–Tate for the self-dual finite-flat group scheme A[λ], including the fppf case, the local invariant maps and reciprocity; kernel Sha¹ of localization and the topological annihilator statement for the global image. Add the finite-exponent compact/discrete character exactness and annihilator duality needed by the compact-open quadratic reductions.
- **R-theta-quadratic**, `AbelianSchemesAndArithmeticModuli:A2`: Symmetric line sheaves, theta-group central extensions and their quadratic Brauer obstruction for self-dual isogenies; compatibility with the Weil/cup pairing and odd-degree replacement. This is an extension in the existing owner direction, with fppf base change.
- **R-finite-flat-isogeny**, `AbelianSchemesAndArithmeticModuli:A3`: Degree3 finite flat kernels, dual isogenies, quadratic twists and kernel mirror algebra; finite subgroup-scheme quotients and complete rational3-torsion flags factoring[3]. Export the Weil pairing and residual torsion action, including characteristic restrictions.
- **R-endomorphism-action**, `AbelianSchemesAndArithmeticModuli:A6`: The actual action of endomorphisms on the finitely generated Mordell–Weil group and index under[3]. For general ψ distinguish free modules over a domain from arbitrary Z[ψ]-modules and unit components; do not import the invalid universal e/t rank-index estimate.
- **R-integral-grassmannian**, `AlgebraicModuliForArithmeticGeometry:R09.1`: Import Gr(n,2n), universal locally direct-summand subbundle, quadratic vanishing closed loci and determinantal intersection loci over Z. The split integral OGr smoothness, parity components and Schubert dimensions are specific new targets here; the source SGA7 proof inputs remain G-ogr.
- **R-oesterle-measure**, `AdelicAlgebraicGroups:AA.2`: Part II: for finite-type X/Z_p, d=dim X_Qp, a unique bounded Borel measure satisfying µ(S)=lim_e #red_e(S)/p^(ed) for clopen S; lower-generic-dimension subschemes have measure0, and a smooth generic point makes every containing open set positive. Count the reduction IMAGE of integral points. Normalize only when total mass is positive and finite. Provide affine-cover gluing and the nonreduced subscheme correction inherited as E705.
- **R-descent-orbits**, `ArithmeticStatistics:ST.1`: For n=3,4,5 supply the complete locally soluble descent-orbit bijection at fixed scaled integral invariants, integral representatives and E[n] stabilizers. Use the source projective/central quotient groups: ternary cubics with determinant-twisted PGL₃ (ST.4 only has the globally soluble transfer); BS4 determinant-kernel GL₂×GL₄ quotient on2⊗Sym²4; BS5 determinant-kernel GL₅×GL₅ quotient on5⊗∧²5. Exact-order4 corresponds to strong irreducibility, not the entire Sel₄ group. Reuse ST.1/refinement-genus-one-stabilizer-schemes.
- **R-selmer-local-masses**, `ArithmeticStatistics:ST.4`: For the accepted ST.2 ternary, quaternary and quinary acceptable-weight counts, construct the rational-to-integral orbit weights, local Kummer cokernel/kernel factors and real/global Jacobian/Tamagawa mass assembly. Preserve the BS5 real stabilizer divisor1/5 corrected in ST.2; prove means4,7,6 on large families before using rank consequences.
- **R-bss-monicization**, `ArithmeticStatistics:ST.1`: BSS Theorem1.4: even n monicization f_mon=f₀^(−1)f(x,f₀y), the quadratic-twist2-torsion cohomology comparison, injection of Sel₂(J_f) into SL_n/µ₂(Q) pencil orbits with invariant f_mon; local solubility when n≡0 mod4. Theorem3.2 gives a fixed κ(n) scaling and integral representative with split antidiagonal A. This is distinct from the odd-degree BGW pencil targets. Supply BSS Theorem4.2 local integral uniqueness and its hypotheses.
- **R-bss-sparse-count**, `ArithmeticStatistics:ST.2`: Reuse the accepted smoothed fixed-A quaternary count and its weight/range restrictions. Complete BSS §§5–7 for leading coefficient a: increasingly sparse congruence subsets of density about a^(−6), uniform small-leading-coefficient and powerful-part estimates, cusp control and local mass assembly. This does not follow from a fixed ordinary quartic count or a product of marginal Selmer averages.
- **R-bklos-orbit-adapter**, `ArithmeticStatistics:ST.1`: BKLOS Theorems4.2,5.3,6.2 and7.2: normalized-discriminant SL₂ binary cubics (a,3b,3c,d), mirror quadratic algebra and norm-one kernel description, locally φ-soluble orbit dictionary for general abelian A, unique reducible identity orbit, fixed integral scale and local mass comparison. The number-field coregular count in ST.2 is conditional until these exact adapters and six counting axioms hold.
- **R-bklos-count-closure**, `ArithmeticStatistics:ST.2`: Discharge G-twist in refinement-number-field-twist-orbit-count: the actual coregular SL₂ invariant-height main term (not merely Global Fields I), all six axioms, uniform large-prime tail and compatible finite archimedean squareclass representative window. Prove positive height densities of finite unions of local rectangles and the local average product.
- **R-local-isogeny-invariants**, `ArithmeticStatistics:ST.4`: Route the parent Dokchitser–Dokchitser Lemmas4.6–4.7 and Table1 local Tamagawa/formal-group calculations to a Part II of the existing elliptic local-reduction owner. The needed conclusions are the norm-index cancellation for potentially good quadratic twists over2-adic/3-adic fields and the p≠3 type-IV and split-multiplicative3-isogeny ratios. Obtain a directly read primary version before claiming proof closure.
- **R-family-adapters**, `ArithmeticStatistics:ST.0`: Reuse the source-specific finite-height denominators and height rescaling nodes. Connect the existing ST.5 exact-slice Wood extension carriers to wood-average-normalizations, without changing the existing rigidification formulas. Supply the explicit balanced BS3/BS5 finite-union local-family interfaces and the BSS quotient genus-one family ordered by Jacobian height.


## Resumption and independent review

The next mathematical pass should work through the sixteen gaps above in dependency order, starting with actual supplier carrier exports, theta/finite-flat duality and integral measure/OGr geometry. Then close Wood's analytic proof contracts and distinguish bounded-exponent uniqueness from the full-group tail. Reconcile the precise 3-/4-/5-Selmer orbit masses, BSS sparse counting and BKLOS six-axiom/window closure before claiming arithmetic proof closure. Certify the five-Selmer density tables and prime-product tail; verify the general endomorphism source finding independently. Kane/Swinnerton-Dyer, de Jong and the inherited finite-field and enhanced-law sources still need their primary proof routes.

The independent reviewer should check all five source findings, the three finite-height rank mixtures, the OGr quadratic/direct-summand convention at two and the actual general-abelian twist denominator. Assembly should preserve the 194 parent IDs, use the supplier reconciliation rather than editing those imports, keep the parent source repairs and move the special analytic criterion down. The 48 native omissions have explicit reasons: replace them only with signatures over the real exported carriers, with their planned API and examples.

The manager's prioritized issues were unavailable when checked. Focus review candidates had existing handoffs documenting incompatible live/output versus queued/input scopes; taking those would not permit a valid independent review of the requested artifact. This available blueprint follow-up was claimed with `/claim Codex — codex-nILjKa`; the bot confirmed the claim. This run claims no second issue.
