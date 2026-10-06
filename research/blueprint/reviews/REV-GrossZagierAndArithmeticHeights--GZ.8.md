# Independent review: Gross–Zagier formulas and arithmetic heights, GZ.8–GZ.9

**Verdict: needs_changes. This independent review is finished.** The input plan requires revision; this submission is not an unfinished-review checkpoint. All 36 nodes, all 24 baseline citations, all original requests, the API and test inventories, the suggested file, the planet selection, the source findings, the library audit and RT-AREA-iwasawa-1/11 were checked.

Reviewer: Codex, session `codex-mGNHO0`, 2026-10-06. Job: `REV-GrossZagierAndArithmeticHeights--GZ.8`, [issue #422](https://github.com/CBirkbeck/tauceti-explorer/issues/422). The input was written by Claude Code in a different session. The packet records `independent-review-REV-GrossZagierAndArithmeticHeights--GZ.8`.

The formulas have identifiable sources, and several algebraic prototypes are useful. Acceptance is prevented by unresolved identifications between mathematical carriers, actual proof cycles, insufficient supplier scopes, and the disagreement between the arithmetic API and the suggested file. A successful elaboration of signatures proved by `sorry` does not resolve these problems. Unavailable YZZ text also prevents independent confirmation of its exact coefficient-valued normalization.

## Counts and changes

| Item | Result |
| --- | --- |
| Nodes | 36 unchanged: 19 in GZ.8, 17 in GZ.9 |
| Kinds | 20 theorems, 6 lemmas, 4 constructions, 3 definitions, 3 comparisons |
| Node review | 4 verified, 17 corrected, 15 unverifiable; every node has a checked entry |
| Added nodes | 0; unresolved mathematical inputs are explicit gaps |
| Baseline | 24 pinned declarations independently inspected; one mixed-source citation replaced |
| API | 46 → 50; four useful algebraic API items added |
| Packet tests | 28: four for each of seven definitions/constructions |
| Suggested file inventory | 37 of 50 API names, 27 of 28 test names; four actual `example`s |
| Planets | 10 unchanged: six in GZ.8 and four in GZ.9 |
| Requests | 14 → 15, adding the integral-model owner R18.2 |
| Gaps | 2 → 7, retaining the unavailable-book and unread-measure inputs |
| Source findings | E2–E5 confirmed; E6–E7 added and confirmed |
| Packet / stage coverage | `complete` → `partial`; both stages `planned` → `partial` |
| Implementation | Every node remains `unchecked` |

The packet and suggested file were corrected in place. This report and the review's handoff are the other changes. The reader document is outside this issue's deliverable paths; its required revisions are recorded below.

## Sources and versions

The public PDFs were opened, their relevant sections compared with the node excerpts, and their SHA-256 values checked. Eleven of the packet's thirteen sources were independently accessible. YZZ's book and the cited YZZ erratum were unavailable: inherited decomposition excerpts are evidence of earlier work, not a substitute for this review opening those texts. Their exact L-valued pairing, toric volume and corrected constant remain unverifiable.

The packet records public URLs, versions, read date, hashes and sections read. Its `sourceVersions` distinguishes the published texts from the preprints used for older node locators. Important independent collations are:

| Source/version opened | Scope checked |
| --- | --- |
| [Brooks, published IMRN PDF](https://infoscience.epfl.ch/server/api/core/bitstreams/c151dcd9-ff05-4c82-90d5-de19eec6f189/content) | Weight two §6.4, Lemma 7.5, §8 character spaces, Waldspurger and interpolation formulas, Theorem 8.11 and Propositions 8.12–8.13 |
| [BDP, published Duke PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Remark 2.6/Proposition 2.7 and §5, especially Assumption 5.12 and Theorem 5.13 |
| [Cai–Shu–Tian, v2](https://arxiv.org/abs/1408.1733v2) | Definitions 1.3–1.4, Theorems 1.1/1.5/1.6 and the local test-vector input |
| [Zhang, public 2010 notes](https://web.math.princeton.edu/~shouwu/publications/crmnote.pdf) | §§4.2–4.3, toric integrals and nonvanishing restatements; exact retrieval URL is also in the packet |
| [JSW, published CJM PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2017/0005/0003/CJM-2017-0005-0003-a002.pdf) | §5.1 pp.408–413, compared with arXiv:1512.06894v1 |
| [Castella–Hsieh, v2](https://arxiv.org/abs/1505.08165v2) | §3.3 square-root measure and Proposition 3.8; §4.5 logarithm and Theorem 4.9 |
| [Skinner, published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) | §§2.5–2.6 pp.341–344, compared with the packet's preprint |
| [Castella, published multiplicative-primes PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2018/0006/0001/CJM-2018-0006-0001-a001.pdf) | §3 pp.13–15, compared with arXiv:1704.06608v2 |
| [Castella's author erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | Read in full; changes §4 and the main BSD theorem, not §3 Theorem 3.2 |
| [Castella, exceptional specializations v1](https://arxiv.org/abs/1507.04260v1) | Theorem 2.11 and the separate Hida-family exceptional-zero formula |
| [Gross–Zagier, published scan](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | Rendered pp.229–230, 307–309 and 311; coefficient identity and corollaries |
| [Burungale–Skinner–Wan, v2](https://arxiv.org/abs/2603.20886v2) | Theorems 1.1/2.8(i), real-embedding and algebraic-point conditions; rendered introductory formula (1.1) |

Corrected BDP Remark 2.6/Proposition 2.7's locator from p.1053 to **p.1063**. Skinner's integrality/dictionary quotations now use published p.343 and its reference numbers [2]/[6], rather than mixing editions. The measure's published coefficient ring on p.342 is **O^ur[[Γ]]**; its preprint used O[[Γ]]. Earlier locators explicitly scoped to preprints remain so scoped.

Castella's erratum concerns an auxiliary-character choice in the proof of Theorem 4.2 and therefore Theorem 4.4 and main Theorem A. Its replacement theorem adds hypotheses for the BSD application. Those hypotheses must not be copied onto the unaffected weight-two Theorem 3.2. Downstream BSD work should use the corrected theorem at its own owner.

### Source findings checked

| Finding | Independent result |
| --- | --- |
| E2 | Confirmed: published Brooks p.4239 omits the logarithm square in Propositions 8.12–8.13; Theorem 8.11 and published JSW Proposition 5.1.6 retain it. |
| E3 | Confirmed: published JSW p.409 still omits the weight-two y² factor in its Petersson integrand. The proposed invariant normalization is correct. |
| E4 | Confirmed: Brooks's closing sum on p.4239 needs the indexed CM point P_a. Corrected the original justification: finite-character orthogonality would apply to the norm-adjusted twist, not directly to the central-critical character. |
| E5 | Confirmed: Castella's published proof on p.13 twists the CH square-root measure without printing the square required by the central-value convention. The normalization also involves an explicitly identified Iwasawa unit. The separate author erratum does not correct this display. |
| E6 (new) | Confirmed: Brooks Proposition 8.7 p.4236 drops the inverse on the RHS L-value despite its LHS and Proposition 8.5. Corrected the copied algebraic-value definition in the packet. |
| E7 (new) | Confirmed, scoped to BSW v2 only: its introductory formula (1.1) drops p⁻¹ multiplying a_p(f). The packet already has the correct Euler factor. This does not challenge either eigenlogarithm theorem. |

Each finding has the prescribed independent verdict and reason. E6–E7 include searches for existing corrections; none was located. E2 credits JSW's corrected restatement. Findings are kept separate from errors introduced by the blueprint itself. Full locators, printed/corrected formulas, evidence, version hashes and searches are in `sourceIssues` and `sourceVersions`.

## Node-by-node review

Identifiers below are the suffixes of `GrossZagierAndArithmeticHeights:GZ.8/` or `:GZ.9/`, with the stage given separately. A `verified` verdict confirms the stated sourced result; it does not erase a separately recorded closure gap. A `corrected` verdict records an established correction and can likewise retain an explicit gap. `Unverifiable` means the required source or implication is not independently established, even when the displayed formula has corroborating evidence.

| Stage / node | Verdict | Check and correction |
| --- | --- | --- |
| GZ.8 / `chi-isotypic-mordell-weil-space` | corrected | CST §1.2 supplies the finite χ-space. Added the splitting-field qualification and rational descent averaging. Mordell–Weil’s exact supplier remains open. |
| GZ.8 / `l-linear-neron-tate-pairing` | corrected | CST §1.2 gives the coefficient pairing. GZ.1 already owns its M-form: corrected the import boundary, Galois hypotheses and mixed-source baseline. Lean still lacks L-base change. |
| GZ.8 / `chi-heegner-point` | unverifiable | CST finite sum and Zhang’s complex toric integral verified. The unavailable YZZ L-valued/measure-normalization comparison is not independently established. |
| GZ.8 / `toric-integral-versus-finite-sum` | unverifiable | Finite coset averaging is correct once carriers and measure normalization are fixed; the identification with Skinner’s normalized average is still open. |
| GZ.8 / `heegner-functional-equivariance` | verified | CST/Zhang toric equivariance and χ^{-1} convention agree; translation/reindexing proves the stated formal equivariance. |
| GZ.8 / `general-quaternionic-gross-zagier-identity` | unverifiable | Public Zhang/CST statements corroborate the general identity, but YZZ’s precise L-coefficient constant and erratum cannot be independently collated. |
| GZ.8 / `vacuous-case` | unverifiable | The zero-Hom formal implication is correct; its precise YZZ alternatives and projector normalization remain inherited. |
| GZ.8 / `essential-case-root-number` | unverifiable | The root-number product is correct for the stated local convention. YZZ erratum and the base-change/Rankin λ-factor comparison need direct verification. |
| GZ.8 / `nonvanishing-criterion` | corrected | Removed the invalid inference from a nonzero bilinear form to its evaluation. Trace-point implication is supported by Skinner; arbitrary χ positivity needs the stated gap. |
| GZ.8 / `petersson-norm-and-parametrisation-degree` | verified | CST/Gross–Zagier norms and pullback ω=2πifdz give the degree/Manin-constant comparison. Integration and degree hypotheses must remain explicit. |
| GZ.8 / `classical-gross-zagier-formula` | verified | CST Theorem 1.1 matches the formula, conductor/unit factors and half BSD self-height. Proof closure still needs the classical coefficient inputs listed as a gap. |
| GZ.8 / `elliptic-curve-heegner-height-formula` | verified | CST Theorem 1.1 and Gross–Zagier p.311 verify the elliptic formula; field-relative height is twice the (O)-height, not Tau Ceti’s self-pairing without the factor. |
| GZ.8 / `admissible-order-test-vector` | unverifiable | Definitions 1.3–1.4 and local Proposition 3.7 were read. The Lean intersection predicate omits genuine admissibility and its unrestricted dimension/toric assertions were removed. |
| GZ.8 / `explicit-gross-zagier-formula` | unverifiable | CST Theorem 1.5 statement checked. Its Petersson comparison and explicit local constants are not realized by the listed generic prerequisites; recorded the gap. |
| GZ.8 / `explicit-formula-variation` | corrected | CST Theorem 1.6 and its X₀(36) example checked. Restored √(3p²), missing from the example; finite local β-ratio statement matches. |
| GZ.8 / `rational-shimura-curve-heegner-formula` | unverifiable | Skinner published Proposition 2.5.1 corroborates the constant for his normalized average. Its exact identification with this packet’s toric integral remains open. |
| GZ.8 / `totally-real-trace-point-nontorsion` | unverifiable | Nonvanishing follows from the explicit formula and positivity once admissible level, local factors and normalized average are established; those prerequisites are still incomplete. |
| GZ.9 / `petersson-norm-ratio` | corrected | Brooks/JSW ratio and scaling laws checked. Scoped algebraicity to the chosen coefficient realization rather than asserting Hecke-field membership from an ambiguous K. E3 confirmed in the published text. Primitive integral transfer remains open. |
| GZ.9 / `bdp-p-adic-l-function` | corrected | JSW (5.1.a) checked in both versions. Added p odd; existence proof circularity, bounded-measure construction and topology are recorded as substantive gaps. |
| GZ.9 / `bdp-square-root-comparison` | corrected | Castella–Hsieh Proposition 3.8 checked. Corrected R-scalar unit to Λ_R-unit and restricted μ/λ to a nonzero series. Exact normalization-unit calculation remains open. |
| GZ.9 / `quaternionic-bdp-construction` | corrected | Brooks Propositions 8.5–8.10 checked. Corrected the inverse in the algebraic L-value (E6) and integral-model owner; continuity alone is still not a measure. |
| GZ.9 / `quaternionic-cm-waldspurger-formula` | corrected | Brooks Proposition 8.5 CM Waldspurger formula checked; added R18.2 for integral geometry. Actual local/period comparison exports remain requested. |
| GZ.9 / `euler-factor-at-bdp-point` | corrected | Nonzero Euler factor verified. Corrected false general/p=5 valuation claim and added the explicit a₅=−4 counterexample. |
| GZ.9 / `weight-two-abel-jacobi-is-logarithm` | corrected | Brooks §6.4/BDP Remark 2.6 checked. Inserted Fil¹ and locally analytic: full f-isotypic H¹_dR has dimension two. Added integral-model owner. Corrected the BDP page locator from 1053 to 1063. |
| GZ.9 / `bdp-weight-two-heegner-formula` | corrected | BDP Theorem 5.13/Assumption 5.12 checked at r=j=0. Separated its tame branch from the Γ measure; full Γ transport still needs proof. GH.1 ownership retained. |
| GZ.9 / `quaternionic-weight-two-formula` | corrected | Brooks/JSW squared weight-two formula verified; E2 confirmed. Added integral-model owner. Measure construction/normalization still prevents proof closure. |
| GZ.9 / `p-optimal-quotient-formula` | corrected | JSW Proposition 5.1.7 and cotangent argument checked. Made standing squarefree/odd/gen-H context explicit and added R18.2; BLR input still needs an actual export. |
| GZ.9 / `logarithm-detects-heegner-point` | corrected | Elliptic argument valid; GL(2)-type argument now explicitly requires a real embedding and directly imports eigenlogarithm-nonvanishing. Removed the hidden reverse dependency. |
| GZ.9 / `bloch-kato-logarithm-of-heegner-class` | unverifiable | Castella–Hsieh §4.5 log conventions checked; identification of Tate module/dual, de Rham twists, Kummer map and log pairing with this packet’s V_f is incomplete. |
| GZ.9 / `isogeny-and-differential-compatibility` | corrected | Pullback/differential factors checked. Corrected fixed-place Galois transport and ill-typed quotient-group intersection. Fricke comparison still needs a precise source/export. |
| GZ.9 / `multiplicative-prime-formula` | unverifiable | Castella published Theorem 3.2 matches the p∥N formula. His erratum does not replace it. Semistable integration and measure/unit transport are not supplied by good-reduction L1. |
| GZ.8 / `coefficient-identity` | unverifiable | Gross–Zagier I§5–6/V§1 scanned pages verify the coefficient identity modulo oldforms; the old/new/Hecke projection needed to obtain the target is not named among suppliers. |
| GZ.8 / `derivative-corollaries` | unverifiable | Gross–Zagier V§1 confirms positivity and low-order Galois invariance. The auxiliary twist/nonvanishing and conjugate algebraicity input are not closed by the present sketch. |
| GZ.9 / `bdp-measure-integrality` | unverifiable | Published Skinner §2.6 confirms O^ur[[Γ]], and explicitly says the measure property requires additional argument. This does not close the circular construction proof. |
| GZ.9 / `imprimitive-function-dictionary` | unverifiable | Skinner §2.6 explains primitive/imprimitive character dictionary. Exact scalar/period and Euler-factor transport with JSW remains uncomputed. |
| GZ.9 / `eigenlogarithm-nonvanishing` | corrected | BSW Theorems 1.1 and 2.8(i) checked for algebraic points and real coefficient fields. Separated the pure eigenlog input from its L-function corollary; quotient-projector factorisation and DT.3 scope extension remain open. |

## Baseline audit at the pinned commits

Inspected the named declarations in source at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No name was accepted solely from a search hit. All 24 final entries exist at their pins. The replaced original name `LinearMap.BilinMap` also exists, but its two arguments share one source type; it cannot directly type the mixed A × A^∨ pairing. The replacement is curried `LinearMap` with distinct sources.

| Pinned declaration | Module | What its statement actually provides / limitation |
| --- | --- | --- |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Confirmed. Tensor products, for A(K^ab) ⊗_M L and L ⊗_Q ℝ. |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Confirmed. Curried linear maps V →ₗ[L] W →ₗ[L] N provide mixed-source bilinear maps. BilinMap requires the same source in both slots and cannot directly type A × A^∨. |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Confirmed. Linear functionals, for the toric functional ℓ ∈ Hom(π ⊗ χ, L) and for log_ω. |
| `mathlib:Module.End.eigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | Confirmed. Eigenspaces of one endomorphism; the χ-isotypic space is the intersection of the eigenspaces of the σ_t. |
| `mathlib:NumberField.classNumber` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | Confirmed. The class number of the maximal order O_K only; not the ring-class number of O_c or the relative Picard group. |
| `mathlib:NumberField.Units.torsionOrder` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean` | Confirmed. #μ(K), whose half is the unit index u. |
| `mathlib:NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean` | Confirmed. The class asserts total complexity and the quadratic condition over the maximal real subfield; identifying this with the specified F is an extra comparison. |
| `mathlib:CuspForm` | `Mathlib/NumberTheory/ModularForms/Basic.lean` | Confirmed. Cusp forms for a subgroup of GL(2, ℝ); does not supply a newform, Hecke projector or Jacquet–Langlands transfer. |
| `mathlib:CongruenceSubgroup.Gamma0` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Confirmed. Γ₀(N) as a subgroup of SL(2, ℤ); a separate map to GL(2, ℝ) is required to use CuspForm. |
| `mathlib:UpperHalfPlane.petersson` | `Mathlib/NumberTheory/ModularForms/Petersson.lean` | Confirmed. The Petersson integrand conj(f(τ))·f'(τ)·(Im τ)^k. |
| `tauceti:UpperHalfPlane.peterssonInner` | `TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean` | Confirmed. ∫_D conj(f)·g·(Im τ)^k dμ with dμ = dx dy / y²; for k = 2 and D a fundamental domain of Γ₀(N) it is CST's (φ, φ)_{Γ₀(N)} = ∫\|φ\|² dx dy. |
| `tauceti:UpperHalfPlane.peterssonInner_self_re_nonneg` | `TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean` | Confirmed. Nonnegative real part for the self-pairing, with the set-integral conventions; does not imply strict positivity for a nonzero form without integrability and a genuine fundamental domain. |
| `mathlib:DirichletCharacter.LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | Confirmed. The finite Dirichlet L-function over Q; does not supply the general Hecke L-function of K/F. |
| `mathlib:riemannZeta` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean` | Confirmed. ζ(2) = ζ_ℚ(2) in the constant of the Gross–Zagier formula over ℚ. |
| `mathlib:WeierstrassCurve.Affine.Point` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | Confirmed. The carrier contains zero and nonsingular affine points. It is not itself an abelian-variety Mordell–Weil theorem. |
| `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Confirmed. Tau Ceti's canonical height ½·lim h(x(2ⁿP))/4ⁿ, relative to the base field's admissible absolute values (the (O)-normalised height). |
| `tauceti:WeierstrassCurve.Affine.neronTatePairing` | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` | Confirmed. The halved polar form of canonicalHeight. |
| `mathlib:FormalGroup` | `Mathlib/RingTheory/FormalGroup/Basic.lean` | Confirmed. One-dimensional formal group laws; does not construct the convergent logarithm of an elliptic curve or the logarithm of a general abelian variety. |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Confirmed. Formal power series R⟦T⟧ only. The isomorphism with R⟦Γ⟧ after choosing a generator is requested from PadicMeasuresIwasawaAlgebras L1. |
| `mathlib:PowerSeries.eval₂` | `Mathlib/RingTheory/PowerSeries/Evaluation.lean` | Confirmed. Defined as a topological infinite sum. Evaluation as a ring map requires convergence, continuity and completeness/separation hypotheses; not supplied by the definition alone. |
| `mathlib:QuadraticMap.polar` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Confirmed. The polar form Q(x + y) − Q(x) − Q(y), the BSD pairing of a canonical height. |
| `mathlib:Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean` | Confirmed. Finite-dimensional separable trace can recover the scalar pairing; its nondegenerate trace form must justify the coefficient construction. |
| `mathlib:IsTopologicallyNilpotent` | `Mathlib/Topology/Algebra/TopologicallyNilpotent.lean` | Confirmed. Powers tend to zero. This alone neither supplies a complete separated adic topology nor proves convergence of evaluation. |
| `mathlib:ContinuousMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean` | Confirmed. Continuous multiplicative homomorphisms. Algebraic/p-adic avatars and Artin normalization require the requested arithmetic supplier. |

The height convention was checked directly: Tau Ceti's canonical height uses the one-half factor in the limit of naïve x-heights, and its `neronTatePairing` is the halved polar form. The BSD bilinear pairing in these nodes is the full polar form, so its self-value is twice that canonical height. Petersson weight two means integrating |f|² against dx dy, since the y² in the integrand cancels the hyperbolic measure. Tau Ceti's self-pairing nonnegativity does not prove strict positivity without analytic and fundamental-domain hypotheses.

The packet narrows the overstated baseline descriptions. In particular class numbers of nonmaximal orders, newform/Hecke structures, an analytic abelian logarithm, completed-group-ring comparison, bounded measures, evaluation convergence and strict positivity are not existing declarations supplied by these citations. They remain arithmetic nodes or explicit gaps. None is marked formalised.

The reviewed `data/library-coverage.json` audit (AUDIT-25 for this roadmap) lists GZ.8 and GZ.9 as unbuilt; it does not license constructing primitives already owned by earlier layers. GZ.1 owns the M-coefficient height pairing; this packet should import it and add only L-base change and character restrictions. The suggested `coeffPairing` remains a prototype of that input and must be replaced by the owner's actual interface. Tau Ceti's EllipticCurves and ModularForms roadmaps were read as existing supplier work and left untouched.

## Closure, granularity and suppliers

This is a target-level plan. There is no requirement to split every routine proof into lemma nodes, but every essential definition and non-routine imported comparison must still have a named supplier with the required generality. Merely naming a broad stage does not prove it exports the requested theorem. The 36 nodes name the principal advertised formulas, specializations and comparisons; the targets are not closed because the inputs below are unresolved. Both stage coverages and the packet status have therefore been corrected to `partial`.

The most significant proof cycle is mathematical, despite an acyclic declared prerequisite graph: the BDP constructor establishes existence using either the square-root comparison or the quaternionic construction, while both consumers depend on that constructor. Reorder the work into character/period data, a constructed bounded measure, its interpolation characterization, and then comparison/uniqueness. Skinner's published p.343 explicitly requires an additional measure argument; continuity of a character function and a finite squared CM sum do not give that argument.

The eigenlogarithm cycle was repaired: the pure nonvanishing theorem no longer depends on its L-function corollary, and the latter imports the pure theorem directly. Applying BSW requires actual algebraic points, the real coefficient-field condition, and factorization of the quotient through the chosen Hecke projector. Equality of scalar logarithms alone is not that factorization.

Finite characters of Pic(O_c), for prime-to-p tame conductor c, do not in general factor through Γ = Gal(K∞/K). The corrected BDP Theorem 5.13 specialization is on its appropriate completed tame branch. Transporting the c=1 trivial value to the Γ-measure requires a stated map, periods and normalization. The previous group intersection `Gal(K_c/K) ∩ Γ` was ill-typed. Galois compatibility for a fixed local logarithm must transport the place and embedding; complex conjugation exchanges v and v̄.

The square-root comparison has a character-dependent factor φ(𝔑⁻¹), hence an Iwasawa/group-like unit rather than an R-scalar unit. Its exact coefficient and unit status have not been calculated. Parity statements for μ and λ require a nonzero series.

### Cross-roadmap request inspection

All fourteen original requests were compared with their supplier stage descriptions or integrated statements. The added fifteenth request separates integral models from canonical curves. The table distinguishes plausible ownership from an established export; a requested extension is not claimed as available.

| Supplier | Inspection and required interface |
| --- | --- |
| GeneralizedHeegnerCycles GH.1 | The integrated node states BDP under three simplifying conditions. Retain ownership of Theorem 5.13 for all r, but extend its statement to Assumption 5.12 before importing the broader tame-conductor r=j=0 case. |
| AutomorphicPadicLFunctions L3h | Hsieh's Hilbert-GL2 square-root direction is the right owner. GZ.9 imports the F=Q specialization. The CH normalization, character pushforward and p-new extension need an explicit export; Hsieh's hypotheses are not erased. |
| AutomorphicPadicLFunctions L0 | Character spaces and avatars fit. Require the Artin, infinity/Hodge–Tate and Γ-factorization conventions, including tame branches. |
| AutomorphicPadicLFunctions L3 | CM periods and differential operators fit. Require their quaternionic moduli-cover adapter and trivialization conventions. |
| PadicMeasuresIwasawaAlgebras L1 | Completed group rings, pushforward and character evaluation fit. State complete separated coefficient topology and the chosen-generator identification. The separate L4 nonzero-series factorization must justify uniqueness, not a topology-free assertion. |
| PadicHodgeRegulators L1 | Bloch–Kato exponential/logarithm direction fits. Identify Tate module versus its dual, twists, de Rham pairing and Kummer normalization with the actual V_f before using CH's formula. |
| AbelianSchemesAndArithmeticModuli A4 | Current degree-one realizations and Serre–Tate deformation do not themselves state a general abelian p-adic Lie logarithm or the BLR cotangent direct-summand theorem. Request an explicit scope extension/Part II decision. Logarithm uniqueness is in the locally analytic category. |
| ColemanIntegration L1 | Good-reduction integration can supply the Jacobian-log comparison. Current L1 does not supply the semistable non-crystalline multiplicative-prime argument; the request was narrowed accordingly and the missing owner recorded. |
| HilbertModularVarietiesAndShimuraCurves R18.1 | Canonical curves and uniformization fit. Removed the integral-model claim from this request; CM reciprocity and Hodge/Jacobian data belong to HE.1 and GZ.3. |
| GL2AutomorphicRepresentationsAndTransfer R17.3 | Rational Jacquet–Langlands is the right direction. Its statement does not provide a primitive p-integral transfer lattice; specify that comparison separately. |
| AutomorphicLFunctionsAndLocalFactors AL.3 | Rankin/base-change and adjoint L-functions fit. Keep the distinction between base-change root numbers and Rankin root numbers over F, including the Langlands λ-factor. |
| AutomorphicGaloisRepresentations R19.1 | Weight-two representations and Frobenius polynomials, together with weights/point counting, support nonvanishing via Ramanujan–Petersson. They do not give a rational-integer valuation dichotomy for a general Hecke field. |
| Tau Ceti EllipticCurves Layer 3 | Hasse and finite-field point counts are explicitly in scope and support the elliptic specialization. No new plan of that existing roadmap is made. |
| DiophantineApproximationAndTranscendence DT.3 | PAPER-SKINNER-20 routes the BSW analytic-subgroup/eigenlog inputs here, but the existing Baker/logarithm-linear-forms stage does not state the abelian p-adic analytic subgroup theorem. Record this as a scope extension to be resolved before it counts as an export. |
| HilbertModularVarietiesAndShimuraCurves R18.2 (added) | Actual owner of good/bad integral models and extended Hecke maps. Smoothness/moduli-cover hypotheses and Serre–Tate descent remain to be specified; corrected five direct consumer dependencies and textual owner claims. |

Within the roadmap, GZ.4/GZ.5 must export the CST local test-vector results, explicit local factors and Petersson comparison used by the explicit formula. GZ.6/GZ.7 alone do not supply classical old/new Hecke projection, multiplicity one or the auxiliary twist nonvanishing and conjugate algebraicity used by the derivative corollaries. GZ.1 must supply the actual Mordell–Weil space and coefficient-pairing interface. These are listed in the supplier gap rather than silently inferred from unrelated stage names.

### Red-team ownership and proposed structure

RT-AREA-iwasawa-1/11's ownership direction is respected in the packet: L3h owns the GL2 square-root measure, GH.1 owns BDP Theorem 5.13 at every r, and GZ.9 owns the distinct weight-two/quaternionic comparisons. Removed the suggested file's private `hsiehSquareRoot` reconstruction. The scoped imports still need correctly typed interfaces; this is not a declaration that the red-team finding is fully discharged.

Checked reachability in `research/blueprint/atlas/stage-edges.json`: there is no path from GZ.9 back to L3h or GH.1, so their proposed supplying edges are acyclic. There is a path GZ.9 → HE.8 → GH.8; consequently GH.8 can consume GZ.9's weight-two comparisons and cannot supply them back. The unused modular-symbol edge is correctly proposed for removal. Integral geometry's proposed supplying edge now also names R18.2. These are proposals only; no atlas or upstream data were edited.

The multiplicative weight-two factor is (1−a_p/p)² and does not have the Hida-family exceptional zero (1−a_p⁻¹). The latter derivative and its L-invariant belong to GH.7. The packet's rescope proposal is correct in this distinction; the semistable construction still needs its own valid inputs.

## Mathematical corrections and API/tests

The nonvanishing sketch previously inferred a nonzero evaluation from a nonzero bilinear form. A nonzero form can vanish at a particular pair. The corrected direction uses a compatible positive height evaluation and the Gross–Zagier identity; arbitrary χ and conjugate components still need the precise coefficient/duality argument.

The Euler-factor valuation claim was false at p=5 and was inappropriately extended to general coefficient fields. For E:y²=x³+3x over F₅, the affine counts by x are 1,2,2,2,2; with infinity this is 10 points, a₅=−4 and E₅=2, a unit. For elliptic curves p≥7 Hasse gives #E(F_p)<2p, so divisibility occurs only at #E=p. At p=5, both #E=5 and #E=10 occur. General newforms retain the nonzero Euler-factor conclusion, not that valuation rule.

Corrected the full de Rham eigenspace claim to ε_f Fil¹H¹_dR = Fω_f; the full f-isotypic H¹_dR has dimension two after a suitable coefficient-field choice. Corrected the X₀(36) cubic example's missing radical to √(3p²), the Brooks inverse in the algebraic L-value, standing odd-p/squarefree/generalized-Heegner hypotheses of the p-optimal formula, and fixed-place differential/Galois compatibility.

Added four API items, with matching Lean signatures: `chiIsotypic_map` (equivariant functoriality), `heegnerFinite_coeff_smul` (coefficient linearity distinct from group action), `mem_testVectorLine_iff` (membership without unfolding), and `quaternionicBDP_congr` (finite-data extensionality). Arithmetic universal properties, interfaces with actual library objects and geometric constructors remain missing; the numerical API minimum alone does not settle section 4.

| Definition/construction | API / tests | Quality and remaining mismatch |
| --- | --- | --- |
| χ-isotypic space | 9 / 4 | Trivial/sign characters and orthogonal projectors catch the χ⁻¹ convention. Added functoriality and splitting-field qualification. Actual Mordell–Weil and coefficient-extension carrier still missing. |
| L-linear height pairing | 8 / 4 | Q and Q(√5) trace computations detect degree and factor-two errors. The Lean carrier still models M, not L-base change or actual points/dual abelian variety. |
| χ-Heegner point | 9 / 4 | Trace, sign-character, trivial-group and fixed-vector tests check the finite sum. Added coefficient linearity. Generic averaging does not test the normalized adelic integral or its carrier comparison. |
| Admissible orders/test vectors | 6 / 4 | The matrix polynomial example and eigenconditions are useful fragments. Unit intersection is only one necessary condition. A test assuming dimension one does not establish CST's theorem for an admissible representation. |
| Petersson ratio | 4 / 4 | Scaling and wrong-measure tests detect the weight factor. Actual fundamental domains, integrability, positive nonzero forms and primitive algebraic transfer are still needed. The suggested compatibility lemma restates the integral rather than importing Tau Ceti. |
| BDP function | 8 / 4 | Constant-coefficient and Euler computations are valid fragments. Uniqueness needs complete separated adic topology and an adequate interpolation set. The trivial-weight exclusion tests only a necessary condition, not the full arithmetic character space. |
| Quaternionic construction | 6 / 4 | Squaring, zero data, scalar change and finite-data congruence test algebra. They do not test geometric CM values, Serre–Tate continuity, descent, integral periods or bounded-measure construction. |

Every packet definition/construction has four proposed tests, so the packet's numeric minimum passes. The suggested file still does not provide those tests as actual arithmetic `example`s and lacks the completed objects. Four actual examples were added: constant-series evaluation at zero, E₅(−4)=2, a one-element CM sum with value 3 giving square 9, and zero CM data giving zero. These validate concrete algebraic instances only.

### Suggested file repairs and limitations

Removed universally quantified assertions of a dimension-one invariant space for arbitrary representations and nonzero toric evaluation for arbitrary bilinear maps. Removed interpolation using an arbitrary value placeholder, an unrestricted power-series uniqueness signature, arbitrary-CM-data measure interpolation and the formula equating unrelated L-values and logarithms. Taking zero CM values and a nonzero unrelated RHS would contradict those signatures; `sorry` must not hide such a contradiction.

Renamed the partial order predicate to `TorusUnitIntersection` and its trivial constructor to `torusUnitIntersection_of_eq`, so it no longer claims to be genuine admissibility. Added commuting coefficient-action hypotheses to character orthogonality. Retained only stated algebraic/evaluation fragments and documented pending arithmetic signatures. There is no fake Prop-valued replacement and no claim of implementation.

The following thirteen packet API names are intentionally not declared until their mathematical hypotheses and carriers can be stated honestly:

- `IsAdmissibleOrder`
- `finrank_testVectorLine`
- `localToric_ne_zero_of_mem_testVectorLine`
- `isAdmissibleOrder_eichler`
- `bdpLFunction`
- `bdpLFunction_interpolation`
- `bdpLFunction_eq_of_interpolation`
- `bdpLFunction_eval`
- `bdpLFunction_eval_one`
- `bdpLFunction_incomplete`
- `bdpLFunction_period_change`
- `bdpLFunction_eq_sq`
- `quaternionicBDP_measure`

The named test `bdpLFunction_unique` is also pending. Some remaining names are generic fragments of their packet statements, so 37 declared API names and 27 declared test names are upper bounds on agreement, not certification of exact correspondence. Most headline arithmetic theorems are represented only by comments or a linear-algebra core. Restoring exact signatures, individual Tau Ceti imports, arithmetic examples and the source hypotheses is revision work under PROTOCOL §13.

The ten planets are appropriate source-named definitions and major formulas: no source locators were used as planet names, and each layer respects the six-planet limit. The selection was retained. Partial coverage and `needs_changes` prevent promotion.

## Reader document and questions for the orchestrator

The reader's introductory ownership list and RT-AREA-iwasawa-1/11 paragraph choose the correct owners, but broad imported assertions remain stronger than the suppliers read in this review. Its square-root comparison still says an R-unit although φ(𝔑⁻¹) varies with the character; its original Euler valuation, de Rham, integral-model and local-Galois claims need the same corrections as the packet. Its suggested-file summary says all API/test names are declared; that was insufficient even before the unsafe signatures were removed and is now factually false. A revision must synchronize the reader with the packet, API omissions and precise gaps. This review did not edit an unauthorized reader path.

The orchestrator should arrange a revision and resolve ownership extensions rather than promoting this pass. Specific questions are:

1. Can an accessible YZZ book/erratum text supply the exact coefficient and measure comparisons, or can every such input be replaced with a public source at the same generality?
2. Which owner or Part II will supply the general abelian logarithm, BLR cotangent splitting and semistable integration? A4 and Coleman L1's current descriptions are insufficient.
3. Should GH.1's integrated BDP theorem be widened to full Assumption 5.12, and should L3h explicitly export the CH/p-new adapter with its normalization? These are prerequisites, not another construction in GZ.9.
4. Can the PAPER-SKINNER-20 routing extend DT.3 explicitly to the abelian p-adic analytic subgroup theorem, while retaining its existing linear-forms scope?
5. Which precise exports will supply the primitive p-integral transfer, classical Hecke projection, auxiliary-twist nonvanishing and the quaternionic bounded-measure argument?

No answer from the user is required to finish this review. These are durable routing questions for the next revision.

## Validation and revision order

`python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json` reports **0 errors, 0 warnings**. The source findings/versions also pass `scripts/check_errata.py` when supplied in its standalone `errata-v1` schema. That script does not accept the blueprint-packet schema; the validation projection was scratch-only, not another repository deliverable.

`lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.8.lean` exits **0**, with **65 warnings, all for `sorry`**, against the existing shared build at the exact Mathlib pin. Memory availability was checked before compiling. The file imports Mathlib only: Tau Ceti statements were inspected at their source pin, but Tau Ceti import compatibility was **not** compiled. No library build/update/cache or language server was started. The initial input also elaborated (70 `sorry` warnings), despite containing false mathematical assertions, which demonstrates the limit of this check.

The independent inventory checks cover all 36 review entries, the 24 baseline entries, the four API additions, test/example counts, planets, and graph reachability. `git diff --check` is clean. JSON validity and packet schema checks pass. All changed paths are this job's three named deliverables plus its own handoff.

Resume revision in this order:

1. Establish source access and exact carriers/normalizations for the YZZ/general height and finite toric integral.
2. Obtain or scope the missing supplier exports, including the actual abelian logarithm and p-integral transfer.
3. Define the arithmetic character/period data and tame/Γ transport, then construct a bounded measure before proving its interpolation and square comparison.
4. Finish projector factorization, p-optimal cotangent and Bloch–Kato conventions, and the semistable branch using the appropriate suppliers.
5. Restore exact arithmetic Lean signatures and examples; synchronize the reader; rerun validation and request a fresh independent review.

The seven packet gaps and both coverage `remaining` lists preserve these obligations. The review itself has no remaining unchecked node or baseline entry.
