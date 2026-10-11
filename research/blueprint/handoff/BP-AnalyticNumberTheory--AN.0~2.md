# BP-AnalyticNumberTheory--AN.0~2 — revision handoff

Issue #6511; Codex, session `codex-kd1uU9`. This is a completed blueprint revision, not a checkpoint. The claim was confirmed by the bot in [comment 6103264706](https://github.com/CBirkbeck/tauceti-explorer/issues/6511#issuecomment-6103264706).

## Deliverables and status

The packet, reader and suggested file are synchronized. All 250 pre-existing node identifiers and the top-level independent `review` object are preserved. Four target-level nodes were added: the full Green–Tao zeta strip, its weak convexity input, elementary canonical factors of arbitrary genus, and indexed Beurling zeta. No application, consumer, other packet or upstream repository was edited.

Current `detail.json` and PROTOCOL§2 require target-level planning, superseding the older lemma-level instruction embedded in this issue. The existing auxiliary lemma identifiers are retained; their mathematical statements remain available to consumers. Every stage target and all 91 routed target-ledger entries are accounted for. The packet status is `complete`, which means a complete planning pass with precise proof and supplier boundaries. It does not mean proof closure. Every node retains `implementationStatus: unchecked`.

| Metric | Count |
|---|---:|
| Definitions |24|
| Lemmas |106|
| Theorems |114|
| Comparisons |10|
| Total nodes |254|
| API items |113|
| Unit tests |90|
| Planets |26|
| Pinned baseline declarations |169|
| Recorded gaps |44|
| Supplier requests |39|
| Ownership/consumer proposals |7|

| Stage | Coverage | Mathematical boundary |
|---|---|
| AN.0 | closed | Import-only under RS-07; no duplicate nodes. |
| AN.1 | closed | Import-only under RS-07; no duplicate nodes. |
| AN.2 | planned | All targets specified; exact remaining obligations are listed below. |
| AN.3 | planned | All targets specified; exact remaining obligations are listed below. |
| AN.4 | planned | All targets specified; exact remaining obligations are listed below. |
| AN.5 | planned | All targets specified; exact remaining obligations are listed below. |
| AN.6 | closed | Import-only under RS-07; no duplicate nodes. |
| AN.7 | planned | All targets specified; exact remaining obligations are listed below. |

## What this revision changes

1. **Canonical native definitions.** Partial ideal zeta uses the actual ordinary/narrow ideal-class groups and Tau Ceti ideal weights/norm regrouping. Exceptional squareclasses use the primitive quadratic field character, including the discriminant factor 4 and Kronecker factor at 2, in the GlobalNumberFields supplier namespace. Local Artin polynomials are reversed characteristic polynomials of Frobenius restricted to actual inertia invariants. The global Euler series includes all finite primes and is compared with the multiplicative ideal coefficient series. The four formerly omitted blocks, 18 API items and 14 tests now elaborate.
2. **Named analytic interfaces.** Higher-genus factorization states the zero multiplicity, reciprocal-power summability, locally uniform finite products and polynomial degree bound. Beurling zeta/product and both all-log remainder conditions use indexed exponent-vector carriers. Lerch continuation and second-derived-subgroup descent use the pinned universal cover and subgroup quotient. Concrete upper-half-plane lasso paths and a z=0 loop supply native a/c/z monodromy; positive continuation uses the inverse cover action. Artin meromorphy/boundary and additional numerical/mean-value targets also have native forms.
3. **A mathematical correction found here.** The inherited residue f_p for LerchIII(3.24) omitted e^(2πipc). This factor is essential: advancing Log z by2πik contributes e^(−2πikc), giving the phase of f_(p−k). The corrected packet, reader and native germs include it. Zero monodromy of Φ about0 is a principal-germ statement, not invariance on every sheet. This phase omission is in the atlas specification. Separately, new source finding E29 corrects the published Theorem 3.4(3.28): Z₁^k multiplies f₀ by e^(2πiks), with the other indices fixed. The nonzero s=c=1/2,z=−1 example changes sign. Publisher and arXivv1/v2 formulas were collated; the second-commutator descent still requires a full proof using the corrected diagonal action.
4. **Colmez uniformity.** Nodes37–40 quantify over degree-2g CM fields, their actual normal closures, central complex conjugation and all nontrivial odd irreducibles. They specify factorial bounds on the finite family, bounded rational CM coefficients, integral monomial Brauer coefficients, intermediate-field degree and analytic-conductor bounds, regularized trivial Hecke factors, signed pole cancellation, odd gamma factors, duality and nonzero endpoints. Native value and L′/L estimates use genuine representations and their continuation germs. The odd-completion calculus lemma is conditional; it does not substitute an arbitrary positive scalar for the canonical conductor.
5. **Actual Green–Tao consumer.** AC.4 currently selects the2008 proof, so AN.2 retains that contract: the entire LemmaA.1 strip, removable pole/reciprocal logarithmic bounds and the (A.5) weak convexity estimate. The slow-growing W bound follows from the pinned primorial/Chebyshev identities; its progression error needs Siegel–Walfisz uniformity. A different CFZ/Zhao route is not treated as selected. AC.4 itself is outside this job’s authorized edits.
6. **Accepted mathematical corrections retained.** The Hecke nonvanishing planet name, c>0/N>1 exceptional-zero qualifications, q≥1 residue-class sum, conditional exceptional tests, unit-disc distance convention, repeated-index Beurling test and integer cutoff for the log2 divisor upper bound are retained. The three elementary divisor cutoff lemmas and their resolved upper-bound outline are synchronized into the reader; no maximal-order lower bound is claimed.
7. **Source discipline.** All 288 inherited `excerpt` properties were removed. Source-defect descriptions are paraphrases. The reader is organized by mathematical targets and dependencies, with exact hypotheses, API, tests and numbered source locators; it contains no source passages or source-by-source summary.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory--AN.0.json --index <pinned declaration index>`: exit0,0 errors,0 warnings. The dependency graph is acyclic; all scoped targets, baseline names, stage suppliers, definition APIs/tests and planet limits pass.
- `lean-check research/blueprint/suggested/AnalyticNumberTheory--AN.0.lean`: exit0,0 errors,398 warnings, all `declaration uses sorry`. The pinned shared Mathlib/Tau Ceti build was used, with no library build, cache download or language server. The final mathematical-interface notes are comments and add no declarations.
- Native-name audit: all 24 definition names and 113 API names resolve to actual declarations in the suggested file; all 90 test labels have corresponding admitted examples. All planets except the supplier-dependent Hecke nonvanishing theorem have native signatures. The non-exhaustive file explicitly lists 92 remaining auxiliary/supplier-dependent mathematical interfaces, rather than implying they are executable.
- The original 250 identifiers, scope, accepted RS-07 import-only layers and top-level review object were compared with the starting packet. Reader coverage includes all 254 targets and every definition’s API/test names. No excerpt field, private absolute path or source artifact is included in the deliverables.
- `git diff --check`: clean.

## Existing upstream material and ownership

The current read-only TauCetiRoadmap checkout is at `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are distinguished from the elaboration pins. ArithmeticDirichletSeries and GlobalNumberFields documents were read, with NumberFieldArithmetic/Chebotarev and the relevant representation/cover/class-field contracts checked. The nine newer roadmaps and current library were screened for the proposed targets. Existing ideal/norm arithmetic, lower ramification groups, cover actions and permutation-discriminant formulas are imported.

NumberFieldArithmetic explicitly excludes general Artin conductors; its Layer 6.5 suggested file names the future ArtinRepresentations owner. Its existing permutation formula is not cited as the general conductor theorem. The exact refinement request includes conductor integrality, independence, inflation, direct sums, one-dimensional agreement and conductor–discriminant. NumberFieldArithmetic Layer 7 supplies the normal-closure carrier/degree direction; the quantitative discriminant bound is an explicit refinement, not a claimed existing export.

The seven ownership/consumer entries remain proposals. They are not fabricated atlas endpoints:

- **Chebotarev density theorem, Part II: arithmetic schemes**: Normal integral schemes of finite type over Z, finite étale Galois covers, conjugacy-invariant Frobenius subsets of closed points, weighted natural-density normalization from Serre Lectures on N_X(p) §9 and the AV §2.14 application; recover number-field Chebotarev in relative dimension zero. Prove density of Frobenius in the profinite fundamental group and triviality of a finite cover split at a density-one set. Exact mixed-characteristic/finite-field component hypotheses and denominator must be read and stated before a quantitative density theorem.
- **RT-AREA-combinatorics/8**: The current AC.4 campaign document and reader select Green–Tao 2008. On that route, import AN.2 classical zero-free estimates with the full LemmaA.1 contract: 1−β/log(|t|+2)≤σ≤10, the simple pole at 1, bounds for ζ(s)−1/(s−1) and 1/ζ(s) of size O(log(|t|+2)), and the LemmaA.3 convexity input. If W(N) varies, prove W(N)≤(log N)^B for a chosen slow w(N), then apply a uniform progression theorem, not the fixed-q PNT. The Conlon–Fox–Zhao/Zhao smooth-cutoff route would require only local Laurent/Chebyshev input, but narrowing to it requires the AC.4 owner to select and rewrite that proof; it is not the current resolved contract. Concretely, for W(N)=primorial(floor₊w(N)), the pinned θ=log primorial and θ(w)≤(log4)w give W(N)≤(log N)^B whenever N>1 and 0≤w(N)≤B log log N/log4. This elementary bound fixes the required modulus range; the progression error still needs the uniform Siegel–Walfisz target.
- **AN.4/colmez-finite-family**: Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at 1.
- **AN.4/regulator-ratio**: For L⊇K, Rg(L)/Rg(K)≥c_[L:Q]>0, in the canonical global unit/regulator theory, with the Friedman–Skoruppa normalization.
- **AN.4/effective-chebotarev**: Zeros of L-functions Layer 8.7 supplies effective Chebotarev with field degree/discriminant, interval and exceptional-zero dependence explicit. The KP owner must derive its box count from this theorem and its excellent-box arithmetic data.
- **AN.4/quadratic-class-geometric-carriers**: Use the extraction’s proposed FuchsianOrbifolds, Part II (Nielsen cores and quadratic-class surfaces) for F_A, finite-area core surfaces, oriented geodesic boundaries, and multiplicity-preserving projection to the modular orbifold. GN.3 owns the quadratic arithmetic class/geodesic/CM dictionary; AS.1/AS.2 own Eisenstein analysis. Exact stages and theorem exports are still required.
- **AN.4/artin-conductor-arithmetic**: For actual finite-dimensional complex Galois representations define a_p(ρ)=Σ_(i≥0)(|G_i|/|G_0|)codim V^(G_i), prove nonnegative integrality and finite support, and f_ρ=∏p p^a_p(ρ). Prove independence of prime and inflation, direct-sum multiplicativity, linear-character conductor agreement, and conductor–discriminant for permutation representations. Combine current NumberFieldArithmetic Layer 6.5 permutation discriminant exponents and Layer 7 normal-closure bounds to derive log f_ρ≤C_g(1+log D_E) for the stated CM family. The current library lower filtration is imported, never re-planned.

The 39 exact supplier contracts and their consumers are in the packet `requests` array and reader S1–S39. No other roadmap’s object is planned a second time. The AN.3/SV.2 edge remains withheld until the maintainer removes the reverse edge atomically.

## Source reading and proof boundaries

There are 27 source-defect records: 26 inherited independent-review findings and one new unreviewed E29. No confirmation by this worker is presented as independent review. The following public source ranges were freshly read during this revision; hashes/versions and locators are in the packet. No private source file or passage was copied.

- Green–Tao, Annals 167(2008), AppendixA pp.541–544, LemmasA.1–A.3 and (A.5). The external Titchmarsh ChapterIII/V proofs remain an explicit source boundary.
- Tsimerman, Annals 187(2018), Theorem 3.2 and full Corollary 3.3 proof pp.383–384, with the ensuing orbit argument pp.384–388. This does not certify the original Artin/Brauer/Hecke estimates.
- Yun–Zhang, Annals 186(2017), AppendixB.1 pp.901–902. The cited original finite-order/Hadamard proof remains a gap.
- Lagarias–Li, LerchIII, arXiv1506.06161v1, Theorem 2.2 p.13, §3.1 pp.19–20, §3.2–§3.3 pp.21–28, and §3.4–§3.5 pp.28–32. The concrete generator convention and selected monodromy/descent argument were read. Fresh publisher pp.26–27,32 and arXivv2 formula collation found E29; the native residue action uses the corrected phase, and the full corrected descent proof remains an obligation. Existing published-version corrections and other LerchI/II locators were retained at their recorded evidence level.
- Debruyne–Vindas, arXiv1601.05324v2, §§1–4 pp.1–11, including the forward Fourier/Tauberian and converse Abelian proofs. The native target is discrete/indexed; measure-theoretic boundary and prime-power adapters remain explicit obligations. §5’s Cesàro extension is outside this scope.
- Koymans–Pagano, arXiv2201.13424v1, Definition 7.5 p.61: the squarefree radicand, closed exceptional interval and log(|d|+4) convention. No exceptional-zero existence/infinitude claim was added.

The maintained-library index contains no cleared Ahlfors, Titchmarsh, Iwaniec–Kowalski or Hardy–Wright volume for these inputs. No unofficial copy was used. Their original proofs, and the unacquired original numerical/zero-density/Hecke uniformity proofs, remain identified by the existing source and gap records. The Hardy–Wright maximal-order upper-bound source is unnecessary for the accepted elementary cutoff argument; its lower-bound theorem is not planned by that node. Kedlaya’s public notes could not be reacquired through their recorded endpoint in this run (HTTP406), so their inherited pinned statements/locator checks are retained without a fresh-proof claim.

## Exact remaining obligations

An independent reviewer should verify the native carrier blocks, the corrected Lerch phase/action, the finite Colmez contracts and original-proof boundaries, and then replace the preserved top-level review. Formal proof work or exact foreign exports are the following44 recorded obligations. A planning status does not erase them.

### G1 — Canonical-product analytic foundations

The isolated-zero, local-factorization, compact-complement, local-log, Borel–Carathéodory, Cauchy and derivative-zero affine adapters are pinned with explicit hypotheses. The exact generic logDeriv_tprod_eq_tsum theorem was freshly read and now supplies the pointwise derivative limit, conditional on factor/limit nonvanishing, summability and local uniform multiplication. Remaining formal work is the unordered exponential-sum/product limit, finite-head/tail splitting and the local uniform summability/multiplicity reindexing adapters; do not re-plan the implemented product logarithmic-derivative theorem.

Needed by: `AnalyticNumberTheory:AN.2/canonical-product-entire`, `AnalyticNumberTheory:AN.2/canonical-product-log-derivative`.

### G2 — Canonical-product lower bound on good circles

The zero reciprocal-weight/tail estimates and three lower-bound ranges are now separate sourced lemma nodes with explicit uniform constants and a complete mathematical derivation of Exercise8.4.10. Formal closure still requires matching the unordered logarithmic sum-to-product splitting/continuity lemmas, the interval-length/outer-measure argument for good radii and the exact logarithm-vs-positive-power bound at the pin. The former vague three-factor exercise is not treated as an already implemented result.

Needed by: `AnalyticNumberTheory:AN.2/summable-excluded-radii`, `AnalyticNumberTheory:AN.2/canonical-product-outer-lower-bound`, `AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles`.

### G3 — Higher-genus factorization refinement

The native E_n definition, all API/tests, finite/empty zero enumeration, exponent−(floorρ+1) summability, local uniform product and polynomial-degree bound now agree with the mathematical Hadamard target. Yun–Zhang AppendixB.1 pp.901–902 states the genus/order theorem and cites Ahlfors §§5.2.3/5.3.2. The original finite-order good-circle argument remains unread, so proof closure is not asserted.

Needed by: `AnalyticNumberTheory:AN.2/finite-order-hadamard`.

### G4 — Xi Mellin and real gamma estimates

The gamma-size growth estimate now has an explicit integer-gamma/factorial proof using pinned integrability, Gamma(k+1)=k! and n!<=n^n; no Stirling upper bound remains needed for node137. Remaining formal closure is the precise weak-FE Mellin split/inversion to the one-sided theta integral and its locally uniform truncated-integral/complex-parameter domination APIs. Pinned f_modif, Lambda0 and the zero-parameter kernel were read, but they are not themselves that completed adapter. E16’s failed printed proof remains confirmed.

Needed by: `AnalyticNumberTheory:AN.2/xi-integral-comparison`, `AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant`.

### G5 — Quantitative zeta analytic estimates

The gamma nonvanishing, existing digamma carrier, regular-completion comparison, zeta residue and von-Mangoldt series/summability are now exact pinned citations; a new xi-zero-critical-strip lemma makes reciprocal positivity explicit. The corrected logarithmic derivative excludes s=0 and gamma poles. Still read/prove the sector-uniform first digamma remainder (DLMF5.11.2/ii gives a statement, not an original proof receipt), match the analytic pole-germ derivative/bounded-neighbourhood adapter, and track effective constants through these inputs. The final a=1/(2C0),c=a/10 selection is now explicit; effectiveness cannot be inferred from unnamed big-O constants.

Needed by: `AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`, `AnalyticNumberTheory:AN.2/digamma-right-half-plane`, `AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`, `AnalyticNumberTheory:AN.2/zero-free-region-constant-selection`.

### G6 — Explicit-formula analytic adapters

The shifted-Jensen centre/disk requirement for zeta unit counts was replaced by an explicit positive Hadamard zero-weight lemma (Exercise8.4.9); it also supplies the local-log-derivative tail estimate. Pinned logDeriv_tprod_eq_tsum and the already duplicated full zeta functional equation were read, and trivial-zero simplicity is a separate lemma. Still match the positive weighted-sum/analytic-order reindexing, tangent-away-from-poles bound, local Laurent/residue and finite-rectangle contour declarations, exact finite Perron arithmetic interchange and nearest-prime-power infDist adapters. The horizontal segment now includes c>2 at 2≤x<e using the pinned right-edge series. Full Chapters9.1–9.6 were freshly read; omitted exercises are derived mathematically where stated, not credited as implemented.

Needed by: `AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`, `AnalyticNumberTheory:AN.3/zeta-local-log-derivative`, `AnalyticNumberTheory:AN.3/zeta-left-log-derivative`, `AnalyticNumberTheory:AN.3/explicit-formula-residues`, `AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error`, `AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound`, `AnalyticNumberTheory:AN.3/explicit-formula-left-contour`.

### G7 — Argument principle and zero-count phase

Remark9.7 states the sharp zero count but cites Davenport§15 for its proof. The positive/inclusive endpoint convention and O(log(T+2)) adjustment are explicit. Original argument-principle/winding, continuous argument branches, full gamma phase and bounded zeta argument proof/API must still be read and planned separately. Neither the local O(log T) count nor a norm bound for digamma supplies this phase asymptotic.

Needed by: `AnalyticNumberTheory:AN.3/riemann-von-mangoldt-count`.

### G8 — Primitive character explicit-formula uniformity

New primitive-character-unit-height-zero-count exposes the missing absolute conductor-uniform local input, including low heights and complex-character inversion. The bounded min(1,1/|rho|) weight summation is explicit and handles the primitive principal conductor1 case through the zeta-only count. The native half-interval target has constants before q,k,T, corrected even-parity cancellation and endpoint corrections. Still read the original Davenport§§16/19 or equivalent public proofs, match completed-character/Jensen relative-growth and safe-height/finite-Perron adapters, and separately handle deleted Euler factors for any imprimitive extension. The published Bennett–Siksek paragraph and Kedlaya statements were freshly read; they are not original-proof receipts. Independent final review: node232 explicitly calls for the conductor-uniform Jensen centre/relative-growth proof. The two pinned completed-L declarations do not establish it; include this lemma itself in the gap, not just its downstream target.

Needed by: `AnalyticNumberTheory:AN.3/zero-weight-sum`, `AnalyticNumberTheory:AN.3/character-half-interval-formula`, `AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count`.

### G9 — Artin local determinant and induction proofs

The existing invariants, Frobenius-mod-inertia/conjugation, characteristic-polynomial conjugation/direct-product and reversed determinant APIs were freshly read. The finite local reciprocal estimate now has a complete telescoping derivation, and the ramified local induction polynomial is separately stated with its residue norm exponents. Remaining formal/original-proof work: invariant-space normality/conjugacy transport, finite-order spectrum and coefficient-convolution convergence adapters; NFA1.4 prime/double-coset and ramified relative-Frobenius comparison; Mackey3a inertia-fixed cyclic-block determinant; CFT7/11 local-conductor/arithmetic reciprocity comparison; and the integral monomial refinement of the upstream Brauer theorem. Layer 6 currently states elementary-subgroup characters, not their induced-linear reduction. Kedlaya22 is a sketch over Q with incomplete factors; MilneVIII10 states, but does not prove, the stronger integer-power conclusion. No global Artin holomorphy follows.

Needed by: `AnalyticNumberTheory:AN.4/artin-local-polynomial`, `AnalyticNumberTheory:AN.4/artin-euler-series`, `AnalyticNumberTheory:AN.4/artin-direct-sum-factor`, `AnalyticNumberTheory:AN.4/artin-absolute-convergence`, `AnalyticNumberTheory:AN.4/artin-induction-factor`, `AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`, `AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`, `AnalyticNumberTheory:AN.4/artin-local-reciprocal-bound`, `AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial`.

### G10 — PNT boundary adapters and quantitative remainder

The rational and progression boundary adapters are separate lemma nodes, using freshly read pinned Λ summability/logarithmic derivative, character orthogonality, canonical-continuation derivatives and the principal finite-factor formula. Rational ψ−θ=O(sqrt x) is already pinned. The pole-cleared analytic-germ/continuous-boundary construction and canonical norm-to-natural interface still need exact formal adapters. The PNT remainder no longer requires the qualitative PNT as an input. Low zeros are treated as a finite multiplicity sum, not divided by ordinate0; effectivity of their compact separation and the explicit optimized-height constants remains unproved. No numerical zero check is assumed.

Needed by: `AnalyticNumberTheory:AN.2/rational-prime-number-theorem`, `AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`, `AnalyticNumberTheory:AN.2/rational-pnt-error`.

### G11 — Conductor-uniform region and Siegel–Walfisz proof

The original Davenport §14/21 proofs remain unread. Theorem 10.6 as printed has max(1,|t|)log q, not the planned log(q(|t|+2)); do not attribute the stronger region to that printed statement. Complete primitive completed-growth/log-derivative and 3–4–1 estimates uniformly in the conductor. For Siegel–Walfisz, add the quantitative L(1,χ)-to-zero separation adapter using a conductor-controlled derivative near1, then the logarithmic modulus absorption and imprimitive corrections. Siegel’s L-value bound alone is insufficient. The finite orthogonality and prime-power removal suppliers are pinned; Bombieri–Vinogradov remains owned by SV.3.

Needed by: `AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`, `AnalyticNumberTheory:AN.2/siegel-walfisz`.

### G12 — Halász proof decomposition

GHS §2 pp.7–12 (Lemmas 2.2–2.6, Proposition2.1, final Theorem 1.1 proof) was freshly read in full at the exact v1 PDF. Split the multiple-convolution identity, small/large Euler-factor split, real-κ divisor majorant and integrated Perron/Shiu errors into lemma nodes before full lemma-level closure. The separate single-Λ weighted mean-square node now names its Fourier/weighted-window gap. Shiu and the Mangoldt window are precise open SV.1 requests, not imports from Maynard SV.4. SV.1’s current packet contains no exact Shiu or Brun–Titchmarsh node. The explicit C(κ) predicate/API/tests now have native signatures, but their coefficient/analytic proofs remain planned. The classical D-based theorem still needs the original Halász/Montgomery–Tenenbaum proof, which GS only quotes. The unit-disc product extension now has an explicit elementary proof and separate lemma.

Needed by: `AnalyticNumberTheory:AN.5/halasz-coefficient-class`, `AnalyticNumberTheory:AN.5/halasz-integral-bound`, `AnalyticNumberTheory:AN.5/halasz-classical`, `AnalyticNumberTheory:AN.5/mangoldt-polynomial-mean-square`.

### G13 — Dickman construction and limiting recursion

Fresh codex-LO9Eha reading viewed formula pages414,426 and read the complete selected Lemma 2.5 proof. Consecutive-interval construction, delay, negative convention, continuity and integral identity are now explicit APIs; their formal construction/gluing and finite-prime Euler reindexing still need complete baseline consumer audits. The survey states fixed-u Dickman but does not certify its original proof. Reacquire and read Dickman/de Bruijn or a complete modern proof, then split the moving largest-prime sum into quantitative prime partial summation, terminal-range control and compact-u limit lemmas. Later §2 saddle-point results and §3 are unread; no growing-u range is inferred.

Needed by: `AnalyticNumberTheory:AN.5/dickman-function`, `AnalyticNumberTheory:AN.5/dickman-fixed-u`, `AnalyticNumberTheory:AN.5/smooth-largest-prime-decomposition`, `AnalyticNumberTheory:AN.5/smooth-finite-euler-series`.

### G14 — Divisor hyperbola finite-carrier adapter

The complete preliminary Theorems1.11/3.3 proofs and the pinned Euler-sequence inequalities were read. The mathematical proof is now explicit in two added lemmas. Check the divisor-pair finite equivalence against the exact pinned Nat.divisors and Finset summation APIs before claiming executable proof closure; the suggested signatures remain admitted.

Needed by: `AnalyticNumberTheory:AN.5/dirichlet-divisor-average`.

### G15 — Proved moments and conjectural model normalization

Acquire complete primary second/fourth-moment proofs and decompose the approximate functional equation, diagonal and off-diagonal estimates. Kedlaya’s selected chapters do not prove these moment targets. Match the precise PM.5 a(k),g(k) supplier before claiming its tests pass; the displayed general-k statement remains a conjecture.

Needed by: `AnalyticNumberTheory:AN.5/zeta-second-moment`, `AnalyticNumberTheory:AN.5/zeta-fourth-moment`, `AnalyticNumberTheory:AN.5/moment-model-comparison`.

### G16 — Beurling Tauberian remainder proof

Codex codex-ywaJcp read §§3–4 completely, including Theorem 2, Proposition1, Theorem 3 and Lemma 1. The source-reading boundary is removed; proof closure still needs separate general lemmas for Laplace-Stieltjes integration by parts, tempered boundary/Fourier inversion, one-sided bump smoothing and the β_n/n→0 remainder estimate; Abelian all-derivative bounds and o(log|t|); weak* boundary-extension upgrade from half-plane derivative bounds;3–4–1 nonvanishing/reciprocal bounds; smooth removable division at 1 and matched analytic logarithms. The ordinary arithmetic Wiener–Ikehara supplier does not export these all-remainder general measure results. Choose one foundational analytic owner before promoting them; never substitute only a smooth boundary without its growth hypotheses. The actual indexed vector series, unordered prime products and all-log equivalence now have elaborated native signatures; the source §§3–4 proof was freshly read in this revision. The existing named Laplace/Fourier/boundary supplier obligations remain proof boundaries.

Needed by: `AnalyticNumberTheory:AN.5/beurling-all-log-remainders`.

### G17 — Dirichlet-polynomial Hilbert inequality

Acquire the original Montgomery–Vaughan mean-value/Hilbert inequality proof and isolate its logarithmic-frequency spacing lemma. The GHS specialized Λ-supported bound is motivating evidence, not the general theorem’s proof.

Needed by: `AnalyticNumberTheory:AN.3/dirichlet-polynomial-mean-square`.

### G18 — Lerch continuation and functional-relation refinements

Codex codex-ywaJcp read complete LerchII §§3–4 and §8, and published LerchIII §3.2–§3.5/§4 Theorem 4.1/§5 Theorem 5.1 proofs. Source reading no longer stops at displayed monodromy targets. Remaining interfaces: exact complex-c gamma integral and sum-integral/parameter differentiation; analytic continuation cells from contour detours, analytic uniqueness along homotopies; complex chart pullback to canonical universal covers; exponential-cover lifts/free punctured-plane generators and branch conventions; the general monodromy cocycle and subgroup descent. UniversalCovers Stage0/Stage2 are precise suppliers for topological covers, not for holomorphic continuation. LerchI/Weil real four-term Fourier–Mellin proof remains unread and is an explicit functional-equation input. Positive integer c removability needs the lowering operator, not mere trivial monodromy. Solvable descent is now its own node. Revision2 additionally records E29: published (3.28) falsely fixes f₀ under Z₁. Use the corrected e^(2πiks) action and verify the second-commutator descent with that diagonal residue action; the displayed source assertion cannot be used as an axiom.

Needed by: `AnalyticNumberTheory:AN.7/lerch-compact-series-bound`, `AnalyticNumberTheory:AN.7/lerch-integral-representation`, `AnalyticNumberTheory:AN.7/lerch-cover-continuation`, `AnalyticNumberTheory:AN.7/lerch-c-monodromy`, `AnalyticNumberTheory:AN.7/lerch-a-monodromy`, `AnalyticNumberTheory:AN.7/lerch-even-functional-equation`, `AnalyticNumberTheory:AN.7/lerch-odd-functional-equation`.

### G19 — Hurwitz and Dirichlet endpoint adapters

Pinned Hurwitz HasSum, differentiability, residue, normalized subtraction and expZeta HasSum statements, together with ZMod.LFunction definition, freshly read. The mathematical positive-representative/c=1 and finite Dirichlet adapters are explicit; native signatures are admitted. Complete the integer-representative finite-sum reindexing and cpow conversion proofs at the pin. Radial complex-c degeneration has a summable absolute majorant; it requires the complex Hurwitz series, not a real UnitAddCircle carrier. General complex-c continuation is the separate source/analytic gap.

Needed by: `AnalyticNumberTheory:AN.7/circle-hurwitz-import`, `AnalyticNumberTheory:AN.7/exp-zeta-lerch-comparison`, `AnalyticNumberTheory:AN.7/dirichlet-hurwitz-finite-sum`, `AnalyticNumberTheory:AN.7/lerch-boundary-degeneration`.

### G20 — Complex Hurwitz Taylor-subtraction proof

The LerchII §9 statement and published LerchIII §6 introductory discussion were read, but neither supplies a complete positive-half-plane complex-c Hurwitz proof. Acquire and check the Taylor-subtracted gamma integral proof, local parameter-uniform bounds and reciprocal-gamma zeros, matching the pinned Bernoulli polynomial. Native H/R existence and negative-value contracts now distinguish the continued H and removable R from the divergent totalized series. The printed source Bernoulli generating index and ζ(0) sign have recorded corrections; do not treat the corrected statement as a proof receipt. Published Theorem 6.1 proof also has a divergent printed integral E27 and a surviving order-zero boundary term E26; neither supplies the missing Hurwitz analytic proof.

Needed by: `AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`, `AnalyticNumberTheory:AN.7/complex-hurwitz-bernoulli-values`.

### G21 — Conductor-uniform zero theory

Apply the two-real-zero inequality at the same effective c_star.; If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the common-conductor-product zero-repulsion theorem with distinct primitive quadratic characters.; Fix one effective c_star small enough for this theorem and the exceptional-zero definition simultaneously. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Apply the conductor-uniform zero-free region to the real near-one interval.; Use the multiplicity version of the logarithmic-derivative inequality to force multiplicity one. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros.; Optimize the height using the conductor-uniform region; preserve log N and the effective constants. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Apply the family zero-repulsion bound including complex zeros and multiplicities.; Conjugation forces a unique exception to be real and attached to a real primitive character. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the primitive-character counting function and the stated effective density theorem.; Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only.

Needed by: `AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion`, `AnalyticNumberTheory:AN.2/two-real-zero-separation`, `AnalyticNumberTheory:AN.2/exceptional-zero-unique`, `AnalyticNumberTheory:AN.2/character-weighted-pnt`, `AnalyticNumberTheory:AN.2/landau-page-bounded-height`, `AnalyticNumberTheory:AN.3/selberg-zero-density`.

### G22 — Certified numerical analytic inputs

Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities.; Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the stated unconditional published theta upper bound, not an RH conditional table.; Supply a certified finite-range check below its analytic threshold. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Subtract the same published residue-class theta error bound at k and k/2, both within its range.; Retain a=3 or 5, q=8 and k≥2·10^10. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating.; Insert the certified constants from the source; retain the strict inequality. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the original two inequalities on the exact real range x≥59.; Certify the finite threshold region with rational enclosures for logarithms. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the original reciprocal-prime theorem and its common prime Mertens constant.; Keep x≥286; the rounded decimal is a label, not the definition of B. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Combine the effective quadratic class-number lower estimate with a uniform derivative estimate between β and 1.; Read the original theorem to retain the explicit constant 40 and q≥3. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the published two-sided estimate with a single constant E, on x≥319.; The interval corollary is a separate subtraction lemma below. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only. Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8.; Certify the finite threshold calculations required for the literal constant 2. Original proof and finite certification still require lemma-level reading; the accepted extraction supplies the exact target only.

Needed by: `AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime`, `AnalyticNumberTheory:AN.2/schoenfeld-theta-upper`, `AnalyticNumberTheory:AN.2/mod-eight-interval-mass`, `AnalyticNumberTheory:AN.2/prime-power-interval-margin`, `AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi`, `AnalyticNumberTheory:AN.2/explicit-prime-reciprocal`, `AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap`, `AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`, `AnalyticNumberTheory:AN.2/explicit-plus-euler-product`.

### G23 — Fixed-degree arithmetic analytic estimates

Use the bounded-degree Brauer–Siegel/Siegel theorem without adding normality.; Apply the real analytic class-number formula; finite adjustment handles bounded discriminants. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Combine the coefficient divisor majorant and the fixed-order divisor bound.; Sum m^ε for m≤X; no field-dependent constant is introduced. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Import the conductor-discriminant relation and bounded representation multiplicities.; Control the exponent using degree-dependent finite group bounds. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Import the completed Artin functional equation with its conductor and archimedean factors.; Take logarithmic derivatives only after regularizing zeros/poles and checking nonzero endpoint values. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use integral Brauer induction, with bounded integer coefficients in the fixed-degree family.; Remove every trivial Hecke pole, prove cancellation of orders, then bound the remaining regularized values and their reciprocals. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Differentiate the regularized Brauer product in a neighbourhood of 1.; Sum factorwise logarithmic derivatives with bounded induction coefficients; a Cauchy bound for L′ alone does not bound L′/L. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1.; Extend the identity to the canonical continuations; the residue quotient is a separate node. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use bounded-degree Brauer–Siegel and the explicit positive residue formula.; Uniformly bound roots of unity by degree and absorb the finite small-discriminant range. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3.; Use D_F≤D_E^(1/2) to keep the total exponent ≤ε. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use the primitive completed functional equation and the absolutely convergent right-edge bound.; Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r.; Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Apply the derivative estimate with ε/2.; Multiply by the reciprocal positive-value estimate with ε/2. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Differentiate the quadratic completed functional equation and evaluate at 0 and 1 after proving both endpoint values nonzero.; Use the gamma logarithmic derivatives at 1 and 2; keep the conductor Q separate from D_E until their arithmetic identification. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n.; Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation. Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0.; Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded.; Multiply the finitely many small-prime constants, independently of m. Read and decompose the original bounded-degree uniformity proof; this is not inferred from fixed-field continuation.

Needed by: `AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`, `AnalyticNumberTheory:AN.5/bounded-norm-ideal-count`, `AnalyticNumberTheory:AN.4/artin-conductor-bound`, `AnalyticNumberTheory:AN.4/artin-log-functional-equation`, `AnalyticNumberTheory:AN.4/artin-value-one-subpower`, `AnalyticNumberTheory:AN.4/artin-log-derivative-one`, `AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`, `AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`, `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`, `AnalyticNumberTheory:AN.4/primitive-hecke-convexity`, `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`, `AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`, `AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`.

### G24 — Quadratic Hecke period normalizations

codex-ws2Gd5 read published DIT §§5–7 selected passages, including all §7 statements and the Stokes argument, and checked pp.970–971 images. The displayed CM unit factor is now explicitly half the unit count; real formulas specify the full norm-one quotient. This verifies the selected source formulas, not Hecke’s cited original proof or a formal unfolding. Match the pinned genus-character finite-prime-discriminant hypotheses and coprime-ideal evaluation to arbitrary fundamental d,d′. AS.1 supplies initial Eisenstein convergence only; AS.2 continuation and differentiated cusp estimates need exact exports. GN.3 needs a precise quadratic-class geometric dictionary. Nielsen cores F_A and multiplicity-preserving projections require the proposed FuchsianOrbifolds Part II; no such resolvable atlas stage is present. The core integral is defined on the critical line after boundary continuation, never by the divergent Re s>1 area integral. Gross–Zagier’s separate normalization comparison remains unread.

Needed by: `AnalyticNumberTheory:AN.4/cm-partial-zeta-period`, `AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`, `AnalyticNumberTheory:AN.4/genus-lseries-factorization`, `AnalyticNumberTheory:AN.4/negative-genus-core-period`, `AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`, `AnalyticNumberTheory:AN.4/mixed-genus-cm-period`, `AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`, `AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`, `AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison`.

### G25 — Gamma and inverse-zeta quantitative bounds

Read a complete uniform Stirling proof and decompose the bounded-height part; do not infer a complex bound from a real gamma theorem. Read the quantitative inverse-zeta bound on the line and its compact-height argument. Pole-cleared reciprocal continuity near 1 is distinct from an estimate away from the pole.

Needed by: `AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`, `AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`.

### G26 — Ineffective Siegel estimates

The original Siegel proof and its real-character normalization need lemma-level source acquisition; the claimed constant is explicitly ineffective.

Needed by: `AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`.

### G27 — Quadratic regulator dictionary

Supply DIT item144: h⁺/h and the fundamental-unit logarithm depend on whether a norm −1 unit exists; retain that dichotomy before comparing residues.

Needed by: `AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower`.

### G28 — Mertens constant and error

The preliminary Koukoulopoulos proof pp.40–41 and Exercise5.4 p.61 were read. Supply the uniform tilted finite-product comparison, its prime-tail integral comparison, the positive-real Euler-product/pole adapter at 1+ε/log x and the Euler-constant integral identity. Correct Exercise5.4(c) to κ=∫(1_[0,1](u)−exp(−u))/u du; E19 records the sign in the author PDF. These estimates still need named lemma-level inputs before the constant calculation is closed.

Needed by: `AnalyticNumberTheory:AN.2/mertens-prime-product`.

### G29 — Inverse-totient count

Smati’s publisher scan was acquired; pp.143–145 state the stronger effective asymptotic and p.146 identifies a computer-check boundary. The later analytic/elementary proof and computational verification were not read. Acquire/decompose that proof or justify an independent O(x) proof; the stated theorem alone is not a proof-closure receipt.

Needed by: `AnalyticNumberTheory:AN.5/inverse-totient-count`.

### G30 — Möbius and multiplicative-mean uniformity

The published SS Lemma 3.2, Corollary 3.3 and Lemma 3.11/(3.6) were freshly read, but the external proofs in Davenport1937, Iwaniec–Kowalski13.10/(19.17), and Montgomery–Vaughan Exercise17 p.185 remain unread. In particular prove the two coprime Möbius estimates uniformly for q≤T^4, which (3.6) itself does not quantify. The shifted q≤√T deduction then uses U=T/q and exponent A+1. Supply the actual long-divisor/bilinear Fourier proof of positive truncation cancellation; the separate zero-term bound follows from Davenport Möbius cancellation at α=0 and Abel summation, not from a bound for the positive E_z sum. Independent final review: the reciprocal sum node has only ArithmeticFunction.moebius as a prerequisite. Its “same argument” does not supply a uniform coprimality cancellation theorem; node84 is a direct consumer of this gap, too.

Needed by: `AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`, `AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`, `AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum`, `AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`, `AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum`.

### G31 — Landau and Selberg–Delange counts

Fresh Ghosh–Sarnakv3 reading confirms the asserted union asymptotic on p.3 and only the upper bound in §4.1. Mathlib already supplies the sum-of-two-squares parity criterion. Still needed: a reusable complex-κ Selberg–Delange theorem with (13.1) weighted-prime mean, (13.2) divisor domination, branches and residual factor at 1 (Koukoulopoulos Theorem 13.2 proof not yet read); positive Landau constant/product evaluation; the Eisenstein integer-norm criterion and its positive asymptotic; and a proved o(K/√log K) intersection estimate for b_{−4}(k)b_{−3}(k−1). For the fixed M,R family, prove the finite-character expansion, maximal-exponent selection, residual positivity and outside-H zero count. The arbitrary half-class formulation is not printed in GS and is not certified merely by its applications. All four consumers are now explicitly attached to this gap. No uniform varying-modulus estimate is asserted.

Needed by: `AnalyticNumberTheory:AN.5/landau-sum-two-squares-count`, `AnalyticNumberTheory:AN.5/landau-three-square-form-count`, `AnalyticNumberTheory:AN.5/landau-exception-union`, `AnalyticNumberTheory:AN.5/half-density-prime-support-count`.

### G32 — Explicit Dedekind estimates

Read the Louboutin paper quoted by Lipnowski–Tsimerman and decompose its explicit residue bound. The accepted extraction is only the target provenance.

Needed by: `AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper`.

### G33 — Number-field density and effective prime estimates

Fresh published LOW §4 pp.19–22 reading verifies the three target statements and reads Lemma 4.3’s complete argument. Still required: original family zero-density proof (Pasten appendix Prop.A.2 / TZ21 Thm1.2); locally finite primitive-Hecke zero counts with multiplicities, the unit-height count and local logarithmic-derivative lemma (IK Prop5.7, including continuation to−3/2); quantitative smoothed ideal Perron with kernelY^s/(s(s+1)), safe-height/left-edge limits, endpoint residues, and uniform low/high-zero bounds; conductor–discriminant and quadratic-character dictionary; and the exact weighted-to-split-prime transfer including ramification/higher powers. Zaman Theorem 1.3.1 states35/19, but its full proof is not read: selected §7.2 reading finds40 in Lemma 7.2.3 versus35 in the theorem and the final weight case, which needs reconciliation before certification. No general analytic Chebotarev theorem is duplicated; this packet targets the identity-extension prime-ideal specialization.

Needed by: `AnalyticNumberTheory:AN.3/ray-class-zero-density`, `AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`, `AnalyticNumberTheory:AN.4/effective-prime-ideal-lower`.

### G34 — Mertens first theorem

The pinned convolution identity and Chebyshev upper bound have been read and listed as prerequisites. Supply the named log-summatory estimate Σ_{n≤x}log n=x log x−x+O(log x) from Abel/integral comparison and the convergent log(m)/(m(m−1)) majorant for higher prime powers. No quantitative PNT remainder is needed for the elementary source proof.

Needed by: `AnalyticNumberTheory:AN.2/mertens-first-theorem`.

### G35 — Mestre source and contour formula

Mestre’s original §§I.1–I.2 pp.210–215 and CT§2.3 pp.275–276 have now been read. E20 records the missing reflected-tail hypothesis in Mestre’s general statement; CT’s even specialization avoids it. I,J signs/subtractions were verified. Require finite nonzero gamma constants at zero slopes, defining their contribution0 after removing them. Still supply named lemma-level inputs: polynomial growth and locally finite zeros, safe-height logarithmic-derivative bounds on the whole contour strip, uniform transform decay and Fourier inversion, the Poitou pairing lemma behind Mestre1.2.2, combined gamma-integral convergence, residues and the symmetric zero-sum limit. Poitou’s original proof is unread; these are not routine steps.

Needed by: `AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`.

### G36 — Koymans–Pagano analytic suppliers

KPv1 §§1,7.1–7.2 and the complete Heilbronn1973 proof have been freshly read. The squarefree Euler factors and positive Landau constant are explicit, but the quantitative Selberg–Delange transfer remains unproved. KP(7.3) claims every fixed A>0; its CKMP p.13 supplier only prints r<log log N, so the all-A coefficient-range proof needs reconciliation or a new primary source. The conductor-aware Landau deduction uses Q_d≤4|d|, log(Q_dQ_e)≤5log(|d|+4) and c_Landau≤3c_star/5; its two-real-zero input remains unaudited. Prime-interval transfer needs exact higher-power/Abel/envelope estimates after the weighted character PNT, and the effective1/2+ε zero-separation bound needs its class-number/regulator and derivative proof. Heilbronn uses Aramata–Brauer entire quotients, integral virtual-character zero orders/subgroup averages, Möbius cyclicity and determinant-parity lemmas; neither global Artin meromorphy nor the qualitative upstream Chebotarev roadmap supplies them. These original and lemma-level inputs are still missing.

Needed by: `AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count`, `AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count`, `AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion`, `AnalyticNumberTheory:AN.2/quadratic-prime-character-interval`, `AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation`, `AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero`.

### G37 — Genus character classification

Gross–Zagier’s published p.268 classification was checked as an image; the two pinned Tau Ceti constructions were read at f790474. genusCharFunNarrowClassGroupHom takes prime-discriminant/subset data, a quadratic generator and squarefree radicand; toClassGroupEquiv needs IsTotallyComplex. They do not by themselves prove the subset/complement bijection onto every quadratic ordinary-class character. Supply the owning quadratic arithmetic classification and the exact norm/prime-to-D Kronecker dictionary; reuse genus_lseries_factorization for the separate analytic product.

Needed by: `AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary`.

### G38 — Quadratic completed-factor normalization

Gross–Zagier’s published pp.282/290 functional-equation uses were read. Pinned Mathlib already gives entire completed Dirichlet functions for nontrivial characters and a primitive functional equation with conductor factor. The new work is the Q-quadratic canonical-character/odd parity/conductor adapter and the normalized root+1 comparison to the Dedekind completion, includingΓ duplication. Special values then use the pinnedΓ(1),Γ(1/2) and explicit residue formula after imaginary-quadratic regulator/embedding specialization. Do not duplicate general Dirichlet continuation or infer root sign from its norm.

Needed by: `AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`.

### G39 — Remaining canonical analytic signature exports

All 24 AN-owned definitions have native signatures, API items and tests. The concrete upper-connector a/c lasso paths and z=0 loop, cut-log residue germs, inverse-action monodromy formulas, canonical-cover continuation/descent, higher-genus Hadamard, indexed Beurling analytic targets and Artin continuation signatures also elaborate. The remaining named Hecke signatures require GlobalNumberFields ray/idele character and AL.1 canonical continuation exports at the pinned baseline; the arithmetic Artin-conductor object requires its assigned owner. The conditional odd-completion calculus lemma does not supply that conductor identification. Other auxiliary numerical/geometric targets are mathematical interface notes rather than claimed native declarations; the suggested file is explicitly non-exhaustive.

Needed by: `AnalyticNumberTheory:AN.4/artin-conductor-bound`, `AnalyticNumberTheory:AN.4/artin-log-functional-equation`, `AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`, `AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`, `AnalyticNumberTheory:AN.4/class-character-lseries-comparison`.

### G40 — CM parity and conductor adapter proof

The CM hypotheses and conductor identity are now explicit. Import global Artin reciprocity including the real-place sign, GNF finite-order primitive characters and infinity types, CFT conductor–discriminant, and AL.1 entire continuation for the nontrivial finite-order character. Match these exact carriers to the conductor-normalized AN completion; the upstream contracts are plans and do not make this adapter formalized. The Rademacher convexity proof and bounded-degree Brauer–Siegel original proof remain unread.

Needed by: `AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`, `AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one`, `AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`.

### G41 — Squarefree mean and positive Euler-tail interfaces

The published SS proofs pp.705–706 and 708–709 were read and their finite calculations retained. At lemma level supply the squarefree expansion a=1∗g, the uniformly summable |g(d)|/sqrt d majorant and the exact Euler-product identity C=Σg(d)/d; verify the pinned generic Euler-product API against these nonstandard summability bounds. For γ_n supply the local binomial bound and the HasProd/positive-log summability adapter passing the telescoping bound from all finite subproducts to every retained infinite subset. These missing declarations are not replaced by an unjustified generic Wintner request to ADS layer6.

Needed by: `AnalyticNumberTheory:AN.5/prime-divisor-product-mean`, `AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean`, `AnalyticNumberTheory:AN.5/gamma-prime-product-tail`.

### G42 — Dedekind gamma and modulus adapters

The selected Tate §4.5 equations and AL.1 global/archimedean/unramified node contracts were read. Complete the standard trace-character/self-dual measure, inverse-different/discriminant and pinned Γ_C normalization adapter; the global integral FE alone is not an uncompleted Dedekind FE. Prove meromorphic gamma orders and positive Dedekind values on Re s>1 to obtain exact negative-even zero order r₁+r₂. Import the ray-modulus/conductor dictionary, compare finite deleted Euler factors in the convergence half-plane and use meromorphic uniqueness, without equating totalized pole values. Tate’s entire source proof remains the AL owner’s work.

Needed by: `AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation`, `AnalyticNumberTheory:AN.4/dedekind-negative-even-zero`, `AnalyticNumberTheory:AN.4/imprimitive-hecke-factors`.

### G43 — Green–Tao 2008 analytic contract

The actual Green–Tao 2008 route now has explicit targets and native signatures for LemmaA.1 p.541 and the weak convexity input in(A.5) p.544. Read the original high-height log/reciprocal bounds, bounded-height completion and convexity proof before closing this source boundary; the source itself cites Titchmarsh ChaptersIII/V. For growing W(N), AC.4 must choose w(N) and prove W(N)≤(log N)^B before the uniform Siegel–Walfisz node applies. Its fixed-q PNT cannot discharge this step. Changing AC.4 to a CFZ/Zhao proof requires its owner to change the consumer route.

Needed by: `AnalyticNumberTheory:AN.2/classical-zero-free-region`, `AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`, `AnalyticNumberTheory:AN.2/siegel-walfisz`, `AnalyticNumberTheory:AN.2/green-tao-zeta-strip`, `AnalyticNumberTheory:AN.2/riemann-zeta-weak-convexity`.

### G44 — Colmez finite-family and regularized Brauer suppliers

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at 1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and 0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at 1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. The exact CM coefficient export is assigned to the extraction’s proposed quantitative CM PartII, whose stage does not yet exist. General Artin conductors belong to the proposed ArtinRepresentations supplier identified by current NFA, not NFA’s permutation-only formula. Original source proofs are needed for uniform regularized Hecke values and logarithmic derivatives; Tsimerman p.384 is motivation, not their proof. The odd completion and conjugate endpoint identity are stated exactly. Native value/derivative signatures use genuine representations and continuation germs; the native completion lemma is a conditional calculus adapter and does not claim the conductor identification.

Needed by: `AnalyticNumberTheory:AN.4/artin-conductor-bound`, `AnalyticNumberTheory:AN.4/artin-log-functional-equation`, `AnalyticNumberTheory:AN.4/artin-value-one-subpower`, `AnalyticNumberTheory:AN.4/artin-log-derivative-one`.

