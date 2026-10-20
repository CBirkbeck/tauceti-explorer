# Independent package review: Arithmetic dynamics

**Verdict: accepted with the corrections below.** Reviewer: Codex,
`codex-Tubnn6`, 2026-10-20. Job `REV-PKG-ArithmeticDynamics`, issue #10890.
I did none of `PKG-ArithmeticDynamics`. This accepts the package as a roadmap
for the maintainer's draft upstream submission. It does not declare its
construction contracts discharged, its stages closed, or its admitted Lean
theorems proved.

## Scope, fidelity and form

I read the target statements, hypotheses and proof sketches throughout Layers
0–6, then the definition APIs and Checks, against the four accepted inputs:
`ArithmeticDynamics.json`, `ArithmeticDynamics--DY.2.json`,
`ArithmeticDynamics--DY.3.json` and `ArithmeticDynamics--DY.6.json`.
Their 490 distinct nodes become 489 owned subsections and one imported
Strassmann input, correctly deferred to EffectiveDiophantineMethods ED.4 §4.26.
The layer counts are 39, 29, 86, 91, 66, 65 and 113. Normalizing the
follow-up identifier prefix accounts for every target anchor. All 726 input
API names remain. Of the 412 input Check names, one is replaced by the
stronger radius-metric averaging test described below; the others remain.

The final README has 106 definition-family Check blocks and 414 Checks, with
at least three in every block. I inspected their mathematical discrimination,
including the distinction between formal and exact periods, diagonal-excluded
atomic energies and genuine positive-degree hypotheses. There are no duplicate
anchors, broken internal anchor references or remaining control characters.
The 24 explicit construction contracts, supplier requests, conjectural labels
and rank hypotheses remain visible. No accepted target was removed to shorten
the document.

The models read were the atlas's upstream EllipticCurves and ModularForms
roadmaps, and current ConformalMapping and Completed/EffectiveBounds. The
package has the required Summary, ownership boundaries, conventions, exact
supplier outputs, ordered layers, APIs, Checks, examples and dependencies.
`metadata.toml` remains the fitting single line `topic = "math.NT"`.
The bibliography and new prose state mathematics in our own words with
locators. No source passage or source-by-source narrative was added.

## Corrections applied

| Location | Defect and correction | Discriminating witness |
| --- | --- | --- |
| §0.20 | The polynomial good-reduction proof omitted the integral-coefficient condition already present in its API. State `p ∈ R[X]` explicitly. | Over ℚ₂, `z²+1/2` is monic but has bad reduction: the normalized lift `(2X₀²+X₁²,2X₁²)` has formal-degree resultant 16 and reduces to a pair with a common zero at infinity. Added a named Check. |
| §0.38 | The third quadratic fixed point was expressed by division by `1-c` without requiring `c ≠ 1`. Use `[1-b:1-c]`, a nonzero pair because `bc ≠ 1`. | At `b=0,c=1`, the fixed divisor is `[0]+2[∞]`, with multipliers `0,1,1`. Added the endpoint computation. |
| §1.1 | The common expansion and bounded-error hypotheses were stated in prose but omitted from three abbreviated API entries. Repeat them in the rescaling, iteration and positivity entries. | The existing `α=1`, translation-height divergence test prevents applying the limit API outside its hypotheses. |
| §2.9 | A form-feed byte had corrupted the set-complement expression. | The omission condition now reads `X∖forwardSaturation(f,U)`; its infinite-complement condition is preserved. |
| §2.50 | The induction referred to `b_{e-1}` before disposing of `e=0`, and described a first index both as at most `e-1` and as possibly `e`. | Handle `e=0,1` directly, then take the first `k<e` or the sentinel `e`; state the `c_k` exponential bound for `k≥1`. For `z⁴` at 1 over ℚ₃, `m=r=1,e=0` gives `1≤1` without a negative iterate index. |
| §3.14 | Two Checks tested the same sharpness failure of the proposed period bound. | Replace the redundant non-example by a primitive 15th root over ℚ̄, whose exact period under squaring is 4. It tests the rational-field restriction. |
| §4.8 | Averaging the standard metric with itself did not distinguish geometric averaging from several wrong operations. | Average the standard metric with a radius metric of radius `R>1`: the potential is half the radius potential, with values `(log R)/2` at zero and 0 at infinity. |
| §4.27, Corrections 23–24, references | The authors' missing-square-root correction and the package's own conservative weighted estimate were conflated. | Add the full public 2007 corrigendum reference. Attribute the square root to its p.1; identify `2/r_v` as the displayed derivation using this roadmap's half-energy height and place weights. The authors' corrected printed bracket still uses `h_ρ(F)`. |
| §5.11 | The proof of the root-set comparison silently used positive degree, although the self-map tree itself needs none. | State `deg f≥1` at that proof. For `f=0,α=0` over ℚ, level 1 is all of ℚ while the zero polynomial's `rootSet` is empty. Added a named Check. |
| §5.32 | A critical-orbit separation argument called a lowest nonzero Taylor term the leading term of the polynomial. | State the expansion at `μ=0` modulo `μⁿ`, with the two distinct nonzero coefficients. For `f₀=x³-3x+1,λ=0`, critical values `-1,3` give first-order difference coefficient 12; times 2 and 3 on the first orbit give coefficient 6. |
| §5.53 | The proof used an unqualified supremum of finite indices while citing Mathlib's natural-valued subgroup index. | Prove boundedness iff the coset set is finite by separation at finite levels; identify the largest finite-level index in that case. Explain the extended-natural interpretation in the infinite case. The trivial subgroup of the infinite binary-tree automorphism group has unbounded finite-level indices and natural index 0. |

The last distinction uses the actual pinned definitions
`Subgroup.index`, `Subgroup.index_eq_zero_iff_infinite` and
`Polynomial.mem_rootSet` in Mathlib. The negative controls involving projective
maps, analytic metrics and native level towers remain README targets because
their carriers are deliberately absent from the compact Lean file.

Suggested.lean now also proves the existing `ClassicalFatou.identity` Check:
the identity has the whole uniform space as Fatou set and empty Julia set.
These two light definitions previously lacked a proved Lean example. This adds
one example for each without changing their definitions or theorem statements.

## Adversarial mathematics pass

Every owned subsection, its defining conventions and its interface statements
were inspected. This table groups that pass by mathematical family and records
the boundary instances used; it is not a claim that the listed finite checks
prove the general theorems or reconstruct all the cited proofs.

| Statements inspected | Instances and conventions checked | Result |
| --- | --- | --- |
| §§0.1–0.15: iteration, binary forms, resultants and roots | Zeroth iterate, stationary orbit, genuine tail; formal degree with an affine degree drop; resultant orientation on `(X₀,X₁)` and its reversal; zero binary form versus its empty root multiset. | Composition, projective infinity and determinant signs agree. |
| §§0.16–0.27: lifts, maps, reduction and conjugation | Constant zero and nonunit constants; positive-degree integral and nonintegral polynomials; GL₂ of the valuation ring versus an arbitrary field conjugacy. | Integral-coefficient repair in §0.20; other degree and unit guards retained. |
| §§0.28–0.39: moduli, critical points and multipliers | Identity fixed-point form; characteristic-`p` Frobenius with zero Jacobian; `z³` critical multiplicities; quadratic fixed points coalescing at infinity. | Set quotients remain distinct from GIT quotients; corrected §0.38. |
| §§1.1–1.29: heights and Tate limits | `α=1`; identity; exact doubling growth; zero height without Northcott; native versus absolute heights under field extension; divisor `(O)` versus `2(O)`. | Expansion, Northcott and polarization hypotheses retained; abbreviated API guards made explicit; elliptic comparison checked at the pin. |
| §§2.1–2.86: local and analytic dynamics | Degree 1 versus degree at least 2; pure Frobenius; classical exceptional points versus analytic grand orbits; Gauss atom versus forbidden type-I atoms; weak versus strong topology; good reduction versus potential good reduction. | No general-characteristic claim inferred from tame dynamics; existing explicit analysis and entropy contracts retained. |
| §§2.40–2.51: valuation and period-growth arguments, within the preceding range | Mixed characteristic and normalized ramification index; `p=2` versus odd `p`; `e=0,1`; the sentinel first-crossing index; nilpotent coefficient rings versus valued fields. | Corrected §2.50 boundary proof; nilpotent quadratic preparation remains its exact separate input. |
| §§3.1–3.91: periodic equations, curves and arithmetic | Positive formal period, lower exact period at root-of-unity multipliers; zero period form; primitive necklaces at small lengths; bad specializations; vanishing Morton denominators; rank-conditional rational-point lists. | Formal-period and exact-period assertions stay separate; the stronger §3.14 field test added. No rank hypothesis removed. |
| §§4.1–4.66: adelic measures, metrics, energies and pairings | Empty versus nonempty finite sets; `|F|=1` versus `≥2`; classical diagonal exclusion; type-II self-energy; radius 1 versus `R>1`; half-energy height, nonzero place weights, regularization radius and square roots. | Corrected the averaging test and corrigendum attribution. Positivity is used on regularized continuous-potential measures, not on arbitrary atomic self-energies. |
| §§5.1–5.65: preimage trees, Galois actions and image criteria | Level zero; identity and constant maps; collision at a critical value; separability and characteristic-zero generic-image assumptions; finite versus infinite subgroup index. | Corrected §§5.11, 5.32 and 5.53; general self-map tree definition retained. |
| §5.13 discriminant convention, within the preceding range | Linear polynomial; `n=0`; nonmonic quadratic `2X²+1` at `α=0`; critical collision. | Linear discriminant is 1. The first discriminant is `-8`; the next is `393216`, including the necessary factor `2⁵`. Omitting that factor fails. The monic quadratic witness `X²+1` gives next discriminant 512. |
| §§6.1–6.113: families, heights, specialization and orbit intersections | `n=1` versus expanding multiplication; Lattès degree `n²`; zero and empty marked sets; parameter-ring denominators; no specialization at zero resultant; degree growth versus activity; `t=0,1`; torsion sections; exactly three versus four common branch values. | Scope, uniformity, and exact supplier outputs retained. A specialization limit remains distinct from bounded-error variation. |
| Lech–Cassels and interpolation targets in Layer 6 | Nonmonic primitive equation; zero mark; non-generating marks; arbitrarily large prime; essentially finite type field versus finite-type algebra; odd primes versus the dyadic residue-class split. | Whole-field embedding precedes evaluation of marked expressions; ramified and unramified adapters remain distinct. |
| Ritt, synchronized intersections and DML targets in Layer 6 | Positive common iterate; monomial support `s=0`; zero-step progression; finite hitting sets; infinitely many time indices with finitely many orbit values; characteristic-positive sparse hitting sets. | No zeroth-iterate trivialization, no replacement of infinitely many common values by infinitely many matching times, and no unconditional positive-characteristic DML claim. |

Independent exact rational/integer calculations checked the resultant 16,
discriminants and Taylor coefficients in this table, and the order of 2 modulo
15. They supplement the source reading and the proved Lean examples; they do
not supply proofs of the admitted signatures.

## Independent source sample

I selected 15 of the 490 distinct input nodes with
`random.Random(10890).sample(nodes, 15)`, with `nodes` concatenated in the input
order listed above. Each row records the source passage actually inspected.
Page numbers are those of the bibliography's cited version. Rendered pages
were inspected where OCR omitted formulas, notably Morton–Silverman p.100,
Lyubich p.358 and Call–Silverman pp.183–184.

| Sample node, following `ArithmeticDynamics:` | Checked passage and outcome |
| --- | --- |
| `DY.2/escape-rate-continuous` | Baker–Rumely Lemma 3.5 p.8 and DeMarco–Krieger–Ye §2.1 p.7: uniform convergence supplies continuity in the stated carrier. |
| `DY.6/specialization-commutes-with-evaluation` | Ghioca–Tucker–Zieve §6 p.16: coefficient evaluation and the cofinite good set support the resultant-guarded specialization target. |
| `DY.4/standard-measure-at-a-place` | Favre–Rivera-Letelier §5.1 p.32 and (2) p.4; DeMarco–Krieger–Ye §2.3 p.8: unit-circle/Gauss measures and the chosen Laplacian normalization agree. |
| `DY.3/period-form-base-change` | Morton–Silverman proof of Theorem 4.1, printed p.100: coefficient reduction of the homogeneous iterate equation, with the nonzero-lift guard retained. |
| `DY.1/weil-height-eq-log-height-div-finrank` | Silverman AWS §5.2 supplementary material p.15: absolute place sums divide by the field degree. |
| `DY.3/period-form` | Morton–Silverman (21), printed p.100; Flynn–Poonen–Schaefer §2 (1) p.3: the homogeneous equation dehomogenizes to the polynomial iterate minus the variable. |
| `DY.6/simple-root-prime-avoiding` | Cassels p.196 (6)–(9): the explicit Bézout-certificate formulation expresses the finite bad-prime exclusions; its consequence follows by evaluation. |
| `DY.2/complex-julia-blowing-up` | Lyubich §3 Propositions 1–4 pp.354–358: Julia-domain assumptions and the branch-count deficit are retained; rendered p.358 gives the stated normalized deficit. |
| `DY.0/good-reduction-of-a-rational-map` | Silverman AWS §6.1 p.18 and Rumely §0 p.2: common-zero/resultant criterion confirmed; polynomial integral-coefficient qualification repaired independently. |
| `DY.6/followup-hybrid-uniform-potential` | Favre Theorem 2.10 p.15 and §4.3 Proposition 4.4 pp.29–31: uniform hybrid potentials require the stated model-function and meromorphic-growth inputs. |
| `DY.1/canonical-height-of-multiplication-on-an-abelian-variety` | Call–Silverman §1 Example 1 p.167: symmetric line bundles have the squared multiplication factor. The general abelian height remains an imported RP.0 construction. |
| `DY.6/followup-linear-synchronized-intersection` | Ghioca–Tucker–Zieve §5 Lemma 5.1 and Proposition 5.3 pp.12–13: nonconstant affine maps and infinitely many common synchronized values, as in the Lean statement. |
| `DY.2/classical-fatou-julia` | Benedetto Definition 4.16 p.36 and Remark 4.20 p.38; Lyubich §3 pp.354–355: local uniform equicontinuity is the general definition; the complex normal-family comparison is scoped separately. |
| `DY.6/critical-height-eq-zero-iff-postcritically-finite` | DeMarco–Mavraki–Ye §1 p.3 and Ingram introduction p.1: the zero criterion and iterate scaling concern the stated algebraic-point height setting. |
| `DY.6/lech-independent-hensel-specialization` | Cassels pp.196–197 (6)–(10): parameter perturbation, a simple root and unit denominators give the assembly; field presentation and transport are separately named. |

I also revisited every original-source access qualification in the package
handoff:

- **FRL 2007 corrigendum:** found the public author PDF and read all three
  pages. Its p.1 confirms the missing-square-root corrections; the attribution
  and bibliography are now explicit.
- **Silverman 2012, p.103:** the maintainer's library index does not clear this
  book, so no other copy was used. Ingram Lemma 13, printed p.14, explicitly
  supplies the comparison being consumed. The bounded-representative proof
  obligation remains the exact construction contract `gap-dy6-5`; I do not
  certify a reading of the book's original proof.
- **Tate 1983:** an attempted public original-PDF fetch did not return a PDF.
  Call–Silverman's Remark after Theorem 4.1, printed pp.183–184, explicitly
  states the bounded-error divisor-height result and its degree. The original
  proof remains unverified here; `gap-dy6-8` preserves the local-height and
  divisor construction rather than deducing an `O(1)` error from a limit.
- **GIT and polynomial-classification originals:** no fresh original-proof
  certification is claimed. The precise quotient, classification and rigidity
  outputs remain construction contracts, with the cited public routes. They
  are not silently treated as consequences of set quotients or Siegel's theorem.

This is a locator and mathematical-statement review with selected proof
inspection, not a claim to have read every bibliography item or proved the
deep construction contracts.

## Closure, ownership and current upstream audit

The four packet validators report seven planned parent stages and no closed
stage. The package preserves their supplier requests and explicit missing
inputs. In particular, spherical omitted-value normality, measure entropy,
nilpotent quadratic preparation, parabolic ray landing, arithmetic rank
certificates, hybrid model functions, multiplier rigidity and elliptic-surface
bounded variation are not inferred from weaker supplier theorems.

ArithmeticDynamics is outside the 94-roadmap Caraiani–Newton tier list; it has
no assigned tier in that file. I therefore do not describe every cited atlas
supplier as lower-tier. The named contracts and ownership are explicit, and
upstream submission order remains conditional on their suppliers. There are
no `UPSTREAM:` or `FoundationsAndLibraryIntegration` placeholders in the
package. The general adelic-height output is explicitly requested before its
dynamical use; a downstream dynamics comparison is not used to construct that
general height.

I read the reviewed library-coverage audit for DY.0–DY.6 and searched by
mathematical objects and hypotheses across current upstream roadmaps and the
current Tau Ceti library, then inspected the relevant matches. Read-only
upstream was revision `0d144d044dacebca17b654695b6f1ad58f159b27` and current
Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The nine newer roadmaps checked were AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory,
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry, including OperatorTheory's split Lean files. Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts
were also checked. Generic resultants, contractions, finite quotients, Galois
actions and analytic tools remain suppliers; none supplies the retained
dynamical variants in their full stated scope. Current Weierstrass preparation
over valued fields does not supply the nilpotent coefficient-ring construction
in §2.10's Zieve input. The existing Strassmann deferral remains correct.
No additional target removal or ownership transfer was necessary in this review.

One concrete port issue needs attention: pinned Tau Ceti `f790474` defines
`Point.canonicalHeight` as half the raw native doubling limit. Current
`CanonicalHeight/Basic.lean:Point.canonicalHeight` uses the raw limit. The
package's pinned factor-two comparison is correct and must not be copied
unchanged to the newer API. At the current revision the raw Tate limit equals
the current elliptic height; the absolute height for `(O)` divides that current
height by `2[K:ℚ]`. This changes the adapter, not ownership of elliptic heights.

## Lean comparison and validation

The 515-line Suggested.lean has one namespace, the required imports, light
real-bodied definitions, 26 theorem signatures and 15 proved examples. It has
no sorry'd data, auxiliary theory development, admitted examples or unused
Tau Ceti import. The closing comment lists all 106 README definition families.
The following independent signature comparisons exceed the required ten:

| Lean signature or family | README agreement checked |
| --- | --- |
| `isPreperiodicPt_iff_finite_forwardOrbit` | §§0.1–0.7: any type; orbit includes time zero and eventual positive period. |
| `isPreperiodicPt_iterate_iff` | Positive iterate hypothesis is present; the zeroth iterate would make every point preperiodic. |
| `isPreperiodicPt_map_iff_of_bijective` | Semiconjugacy and bijectivity supply both directions, rather than just preservation. |
| `tendsto_tateLimit`, `abs_tateLimit_sub_le` | §§1.1–1.12: real expansion greater than one, global bounded error and denominator `a-1`. |
| `tateLimit_eq_zero_iff` | §1.16: forward-invariant set, point membership and finiteness of every bounded-height sublevel are explicit. |
| `tateLimit_elliptic_doubling` | §1.20: ellipticity and native height; factor two agrees with the pinned declaration. |
| `backwardOrbit_conjugate` | Backward orbit includes the zeroth preimage; exceptional points mean finite backward orbit. |
| `classicalFatou_uniformConjugate` | Uniform equivalence, rather than only a homeomorphism, transports uniform equicontinuity. |
| `exceptionalSet_complexPower`, `classicalJulia_complexPower` | Sphere carrier and compact compatible uniformity; `d≥2`; the zero/infinity exceptional set and unit-circle Julia set. |
| Morton coordinate identities | The cubic and elliptic equations use the same formulas; denominators and the affine-domain exclusion are explicit. The proved excluded-denominator example distinguishes total division from a valid chart map. |
| `relativeHeightCandidateBound`, `nativeHeightCandidateBound` | Absolute bounds acquire `[K:ℚ]` inside the exponential; native bounds do not. |
| `discr_iterate_sub_succ` | §5.13: nonzero degree in the field, compositional iterate, critical-root multiplicities, sign and nonmonic coefficient exponent all match. Linear and zeroth cases checked separately. |
| `IsFiniteUnionAP`, eventual-periodicity theorem | Step zero represents a singleton; positive eventual period is explicit. |
| `primitiveRootTransport` | Entire field embedding, integrality, primitive generation and a root of the mapped minimal polynomial; uniqueness is over the stated parameter embedding. |
| `lechIntegralAssembly` | Essentially finite-type field, arbitrary finite marks and arbitrarily large prime; no false finite-type-field restriction. |
| `rittCommonIterate` | Positive common iterate; support includes `s=0`; both root-of-unity exponent conditions remain. |
| `linearSynchronizedIntersection` | Nonzero slopes; infinitely many distinct common values at the same time; positive iterate conclusion. |

Validation performed:

- `lean-check` on the package Suggested.lean: exit 0, exactly 26
  `declaration uses sorry` warnings, no other warnings or errors. The shared
  pinned build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
  and Tau Ceti `f790474`. Memory was checked before compilation. No Lean
  language server, dependency download or library build was started.
- `python3 scripts/check_blueprint.py` on each of the four accepted input
  packets: exit 0, zero errors and zero warnings for each. Packets were not edited.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- Target/API/Check and internal-anchor inventories: the counts and single
  intentional Check replacement are recorded above.
- `python3 research/blueprint/intake.py check-files` on the changed
  deliverables and handoff: zero problems.
- `git diff --check`: passed.

## Public-source access record

All successful PDF accesses below were on **2026-10-20**. Hashes identify the
bytes inspected; source files and rendered pages are scratch material and are
not repository deliverables. No restricted book or passage was copied.

- [ingram-2018-critical-height](https://arxiv.org/pdf/1610.07904v3): SHA-256 `c16ae2acce1076ecb8ce8447aa326f3212a73fac3bff45b2983fcd3feae76827`.
- [Lyubich1983](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7326EA7C0A92B304EF4068A39C1D0910/S0143385700002030a.pdf/entropy-properties-of-rational-endomorphisms-of-the-riemann-sphere.pdf): SHA-256 `997bd7e0d35ceb81d66c8298e33ea119868a2a24ebffa98976aa3b656ef67ea0`.
- [demarco-mavraki-ye-2026](https://arxiv.org/pdf/2405.17343v3): SHA-256 `bb103ede86e058ca2a2601ce9f6a18bb3590f014ee186f6766c198c0eeeb4384`.
- [baker-rumely-2006](https://arxiv.org/pdf/math/0407426v2): SHA-256 `c3660e2634d73bd6e4a000e848b7478bce6f3cd9425b500ab1d5a7deb4282259`.
- [cassels-embedding-1976](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5D685D8FAFAC403B5CAE3170656D23B2/S000497270002503Xa.pdf/an-embedding-theorem-for-fields.pdf): SHA-256 `41ba7e0b9ae57d1712bdc5b46b8e254505640dddb1b12cf8546e413f3f5477bd`.
- [rumely-2013](https://arxiv.org/pdf/1304.1201v2): SHA-256 `ac253df0580064934274a79c897288dc8fa7dcdee780d30dfe26b45df705d3e3`.
- [favre-2017-v2](https://arxiv.org/pdf/1611.08490v2): SHA-256 `137ddb0245b4f09ff8b7a4a2880bd3846f146cd013f2ce9563d7f90f45ea1a5f`.
- [fps95](https://arxiv.org/pdf/math/9508211): SHA-256 `95d4c96eb64febc9b4fc7cb980715777e27fa4d315a8e88cd20fc8d6cfb7577d`.
- [silverman-aws-2010](https://swc-math.github.io/aws/2010/2010SilvermanNotes.pdf): SHA-256 `21c2a527d322bc0c76e7c308c0989439d5769ffd32e08205aba6e50a2051d536`.
- [ms95](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0461/LOG_0008.pdf): SHA-256 `35b2f17b54c7b9b4d408d423bf573b0105e7c52e345de92e7b19173ac50fce50`.
- [ghioca-tucker-zieve-2008](https://arxiv.org/pdf/0705.1954v2): SHA-256 `18354181a861f4749a69485af51c987cfde95564956b101f51ffe2762fa5bd99`.
- [call-silverman-1993](https://www.numdam.org/item/CM_1993__89_2_163_0.pdf): SHA-256 `01a4cd0c246182c6496dcddb1f43e4343d17db4f55a22d73f35d057190bc0586`.
- [demarco-krieger-ye-2020](https://arxiv.org/pdf/1901.09945v2): SHA-256 `8fc51ac36f9fc4b406c7bb44cdeccf31386e81e0a471176a69e80a1a0766bab8`.
- [Benedetto2010](https://swc-math.github.io/aws/2010/2010BenedettoNotes-09Mar.pdf): SHA-256 `c56bd9fffae1f928796794697596d8b247bd7206136cf3ce3571877ef572aaff`.
- [favre-rivera-letelier-2006](https://arxiv.org/pdf/math/0407471v2): SHA-256 `61bf5a3d444ce1a361db743ffde4185e1ce823681fd6e0dedae7fa73f83bc309`.
- [frl-corrigendum](https://www.cmls.polytechnique.fr/perso/favre/corrigendum.pdf): SHA-256 `dd74776159bbad2fa0368b6a2a6d19bd708773c2da2381679e53108e4d8d9a95`.
