# PKG-ArithmeticQuantumTopology — blocked checkpoint

Worker: Codex (GPT-6), session `codex-CApqnZ`, issue #7889, 2026-10-10.
Branch: `codex-CApqnZ-arithmetic-quantum-topology`.
Continues explorer main `a41c41658bfd2c6e2f71527d2b51f8389b547700` and merged #8316.
Claim [6095831227](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6095831227)
was confirmed by bot [6095832366](https://github.com/CBirkbeck/tauceti-explorer/issues/7889#issuecomment-6095832366).
The earlier attempt on #7893 was refused because another worker had claimed it;
no work on that job was submitted. Only #7889 was successfully claimed.

## Outcome and required action

**The package cannot be completed within this issue's permitted files.** The first
geometric target imports a framed multi-link interface and the next imports
actual integral surgery. Their current suppliers still have neither of these
exact interfaces. The accepted input explicitly preserves this as G1 and two
open GeometricTopology Part II requests. This is a dependency checkpoint, not
a time-limit checkpoint. Elaboration of the saved algebra does not close G1.

Issue #7889 says to change no packet and to describe plan mistakes here. WORKERS
requires importing another roadmap's mathematics rather than rebuilding it.
The current package therefore cannot construct the missing owner interfaces,
substitute an arbitrary carrier for them, or claim complete target/API/test
coverage from the existing algebraic matrix side.

**Maintainer action:** route the two existing GeometricTopology extension
requests to their owner and provide the resulting precise signatures or a
scope/ownership revision. Repeating this package job on unchanged suppliers
cannot discharge G1. No labels, supplier files, packets or library files were
changed. No new issue was opened and no second job was claimed.

## Fresh contract verification

Current read-only TauCetiRoadmap: `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`.
Current read-only Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read GeometricTopology and RepresentationTheory/SemisimpleAlgebras READMEs as
the two upstream examples, and GeometricTopology's Suggested.lean. The latter
contains schematic comments, with no active link/surgery declarations.

| Accepted consumer | Actual supplier checked | Contract still needed |
| --- | --- | --- |
| `QT.0/framed-link-and-linking-matrix` | `KnotTheory/SmoothLink/Basic.lean`, `SmoothLink/Isotopy.lean`, `KnotTheory/Markov.lean` | Framing data transported by a framing-preserving equivalence, pairwise oriented linking numbers and Seifert/blackboard compatibility. `SmoothLinkEmbedding` contains smooth circle components and disjointness, without framing. Its isotopy setoid transports components, without framing data. `FramedMarkovBraid` has component integers, but `MarkovEquiv` is on the unframed braid. |
| `QT.0/surgery-presentation`, `QT.0/kirby-and-fenn-rourke-moves`, `QT.0/refined-presentation-existence` | `LowDimTopology/DehnSurgery/Slope.lean`, GeometricTopology layer 5 | The link complement, actual filled oriented manifold at slope fμ+λ, its H₁/cokernel comparison and ordinary Kirby/Fenn–Rourke relation and invariance; stable form realization for admissible presentation existence. `FramedBoundaryTorus` supplies a basis of actual torus homology and primitive slopes, not a filled manifold. |

Also read `TubularNeighborhood/NormalFrame.lean`: its local normal-frame theorem
for an immersion into a real inner-product space does not provide the global
framed-link equivalence or Seifert linking-number comparison. Searches across
current `KnotTheory`, `LowDimTopology` and `Geometry/Manifold` found no matching
filled-manifold/Kirby/linking-number implementation. Re-read
`FramedMarkovBraid` and `MarkovEquiv` at pinned Tau Ceti `f790474` as well;
the same framing distinction holds. The reviewed `data/library-coverage.json`
has no dedicated ArithmeticQuantumTopology entry; it is not evidence that
these geometric targets are implemented.

## Small package clarification saved

Only the Kirby/Fenn–Rourke target in README.md changes. It now specifies that
a geometric handle slide involves a chosen band and that different choices may
give different links with the same matrix congruence. The unchanged matrix
function `handleSlide` specifies only the algebraic congruence, not a
geometric slide operation. Its `P=I+E_ji`, `PᵀAP`, symmetry hypothesis and
`A_ii+A_jj+2A_ij` convention are retained. No new mathematical target, API,
test, dependency, geometric carrier or Lean assertion is introduced.

Fresh primary source: Kazuo Habiro, *Refined Kirby calculus for integral
homology spheres*, [arXiv math/0509039v2](https://arxiv.org/pdf/math/0509039v2),
read 10 October 2026: introduction pp.1285–1287; §2.1 Definition 1 and its
following distinction between a slide and a determined permutation/reversal,
p.1289; §2.3 Lemma 2.2, pp.1290–1291; §5 Corollary 5.1 and proof,
pp.1309–1310. PDF SHA-256:
`d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
The added README locators support the relational slide interface and its matrix
shadow. Everything saved is in our own words; no source passage was copied.
The maintainer's library index was read; no restricted book was used.

## Validation in this session

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  exit 0, **0 errors and 0 warnings**. Input remains 106 nodes, 206 API items,
  159 unit tests, 36 planets, 24 baseline declarations, 8 gaps, 19 requests,
  8 planned stages and 0 closed stages.
- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  exit 0, **0 errors, 604 warnings, all `declaration uses sorry`**. Shared
  checker only, one invocation; available memory before compilation was 109 GB.
  Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin
  `f790474821cf4256814db967cb154e7af3d0c369`. No Lean process remains running.
- The unchanged input packet SHA-256 is
  `161dc9ce320280e75c2c5ebf1923d8bd0529dabbccc013ad3b9d547cc1ead951`.
  The unchanged Suggested.lean SHA-256 is
  `8f274d69cac271c1da27ddc92dd0f942c5bb791fe6c84ba8485dde0fbe2bf623`.
- README remains below 200,000 UTF-8 bytes. Its ordered 106 target headings,
  114 anchors, 75 reference destinations and all inherited API/test names are
  preserved (405 distinct single-name API/test prefixes; all 54 full API/test blocks
  unchanged). README: 199,981 bytes. Scoped intake check: **2 files, 0 problems**;
  `git diff --check`: exit 0. Only README.md and this handoff are changed.
- `metadata.toml` remains absent: the intake's file-existence completion rule
  would treat adding it as completing this still-incomplete package. Its final
  line is `topic = "math.GT"` once all layers meet PROTOCOL §20.

## Resume after the owner contracts change

Obtain the exact framed-link/linking and surgery/H₁/Kirby interfaces first,
then instantiate the saved matrix/quantum interfaces on them. Preserve the
band parameter or geometric slide relation; matrix congruence is not a
replacement. QT owns the admissible band-slide/Hoste refinement and quantum
invariants, not ordinary surgery foundations.

The other seven layers' remaining work and all prior source receipts are
preserved below. In particular the geometric NZ/strong-flattening inputs,
coefficient-field Gaussian bracket, full finite étale Habiro descent and
spectral/microlocal AK interfaces are still required. This session does not
re-certify the historical source readings or the whole inherited prototype.
No mathematics is claimed formalized by a successful elaboration.

## Inherited checkpoint receipts and eight-layer worklist

The following is the prior handoff, retained so no source receipt, convention,
check limitation or remaining item needed by a successor is lost. Its reports
refer to the sessions named there, not to fresh checks in `codex-CApqnZ`.

### Prior checkpoint: `codex-Ogf0LN`

Worker: Codex (GPT-6), session `codex-Ogf0LN`, issue #7889, 2026-10-10.
Claim comment 6095607536 was confirmed by bot comment 6095608646.
Branch: `codex-Ogf0LN-arithmetic-quantum-topology`. No second job was claimed.

This run advances **QT.7's figure-eight descendant Taylor interfaces**. The
package remains blocked on its external geometric supplier contracts. These
are mathematical interfaces owned elsewhere, not missing proof implementations
that a package may replace with `sorry`. The accepted plan explicitly imports
them, and this issue allows edits only to its package and handoff. No accepted
input, supplier roadmap or library file was changed. This is a dependency
checkpoint, not a time-limit checkpoint.

## Saved in this run

- `Suggested.lean`: **4,452 lines, 217,491 bytes**. Adds one individual import
  and a final **274-line** QT.7 section. The inherited body is retained exactly.
  The addition has **9 concrete definitions, 33 API theorems and 21 examples**.
  Its carriers are Mathlib's actual `PowerSeries ℤ`, `PowerSeries ℚ`, units
  and a native `Fin 3` row. No opaque completion or geometric carrier is added.
- `README.md`: **199,963 bytes**. Only the figure-eight descendant target
  changes. All ordered **106 target headings**, **114 anchors**, **75 reference
  destinations** and **477 distinct inherited backtick-named components in
  API/test bullet prefixes** are retained; 20 prefix names are added. The
  earlier handoff's count of 464 used a different inventory. The current
  conservation check compares the actual old and new prefix sets directly.
- `metadata.toml` remains absent. `issues.py:deliverables_complete` treats a
  package with all output files present as complete. Adding the last file now
  would falsely complete this package. Its eventual content is one line,
  `topic = "math.GT"`, after every layer meets PROTOCOL §20.

## Exact mathematical interfaces and controls

`DescendantTaylor.q` is the actual unit 1+t over a commutative ring, with its
integral inverse built using `PowerSeries.invOfUnit`. `qpow` takes integer
powers in the unit group. Negative powers are not the ring's total inverse,
which is unavailable over ℤ. Its unit, exponent-addition and constant laws
have Lean proofs. `term m n` is the product of the two finite Pochhammer
factors and q^(mn); its target valuation is at least 2n. The n=1 formula is
−t²q^(m−1).

`figureEightDescendantTaylor m` defines coefficient d by summing n≤⌊d/2⌋.
The precision theorem identifies this coefficient with any partial sum n<N
when d<2N. It is a knot-specific integral Taylor series, not a duplicate
construction of HC.1's Habiro ring or HC.2's general factorial-series map.
The recurrence retains the inhomogeneous right side 1. Its first four
coefficients are 1, 0, −1, 1−m.

`figureEightHalfRowTaylor` is exactly ½(qH₁−q⁻¹H₋₁), over ℚ[[t]], and
`figureEightFirstRowTaylor` is (1,H₀,Q₂). Doubling Q₂ gives the coefficientwise
image of an integral series. Its t coefficients start 0, 1, −½, −3/2, 5/2.
The nonintegrality theorem has a Lean proof from the quadratic-coefficient
signature: an integral preimage would imply 2a=−1 in ℤ. This does not establish
that coefficient signature's `sorry` proof obligation or the independent
Habiro/Taylor comparison.

`DescendantTaylor.expMinusOne` uses Mathlib's formal exponential rescaled
by −1. Its zero constant and admissibility for substitution have Lean proofs.
`figureEightDescendantHSeries` and `figureEightHalfRowHSeries` substitute
this actual series for t, fixing q=exp(−h). Their target cubic descendant
coefficient is m, not −m; H₀'s odd degrees vanish by reciprocal symmetry.
The half-row h coefficients start 0, −1, 0, 11/6, 0. Normalization of every
H-series has a Lean proof; the recurrence, symmetry and coefficient theorems
remain honest source-theorem obligations.

These definitions do not construct the full geometric knot matrix or its
nontrivial shape-field rows. The new Taylor interfaces do not claim integral
Habiro membership from Taylor integrality alone. To connect them with that
ring, use the actual HC.1 q-unit and HC.2 factorial-series/Taylor maps and
prove that they send each Pochhammer summand to `DescendantTaylor.term`.

## Source and library audit

Read the public fixed GZ v3 source, *Knots, Perturbative Series and Quantum
Modularity*, https://arxiv.org/pdf/2111.06645v3:
§4.3, equation (4.5), printed pp. 25–26; §7.1, equations (7.1), (7.3)–(7.5),
printed pp. 52–53, with the following discussion on p. 54. SHA-256:
`2a4826bd1c2f0823c99f8e3cccfd835c5044d70d30eb20b36fea38dcb8dd83de`.
This matches the input source receipt. The low-degree signatures are finite
expansions of those explicit formulas, not separate claims that the source
proves Habiro membership of Q₂. Only own-word results and precise locators
are saved. No restricted book was needed; no source passages or PDFs are
included in the repository.

Read the pinned statements before use: `PowerSeries.mk`, `coeff_mk`,
`coeff_map`, `coeff_zero_eq_constantCoeff_apply`, `invOfUnit`,
`mul_invOfUnit`, `invOfUnit_mul`, `coeff_rescale`, `exp`, `coeff_exp`,
`constantCoeff_exp`, `subst`, `HasSubst.of_constantCoeff_zero'` and
`constantCoeff_subst_of_constantCoeff_zero`; `Units.map` and its value and
integer-power laws. The reviewed library catalogue has no dedicated
ArithmeticQuantumTopology entry. Existing scalar-Habiro and Gaussian
supplier ownership is preserved.

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Checker Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Current read-only TauCetiRoadmap: `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`.
Current read-only Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The current GeometricTopology and SemisimpleAlgebras READMEs were read in
full as the two upstream examples.

## Validation in this run

- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 604 warnings**, all `declaration uses sorry`. Available
  memory before that run was 110 GB. Only the shared checker was used, one
  invocation at a time; no Lean process remains running.
- Packet checker: **0 errors, 0 warnings**. Accepted input still has 106
  nodes, 8 gaps, 19 open requests, 8 planned stages and 0 closed stages.
- **2,362 exact rational controls passed** through degree 14 for descendants
  m=−12,…,12. Generalized-binomial q powers were checked independently
  against polynomial multiplication and a recursively inverted 1+t. Checks
  include integral coefficients, summand valuations, every admissible finite
  cutoff, the recurrence, both first-row formulas, doubling and nonintegrality.
  Formal exponential substitution was compared against direct exponential
  Pochhammer factors, including the h recurrence and reciprocal symmetry.
  Negative controls detect omitting ½, losing the Laurent inverse, dropping
  the recurrence's boundary term and using exp(+h). These finite checks are
  not infinite-order proofs or geometric comparisons.
- README heading/anchor/reference/name conservation and exact inherited
  Lean-body conservation passed. Scoped intake `check-files`: **3 files,
  0 problems**. `git diff --check` passed. Scratch files are not deliverables.

## Blocking suppliers and where to resume

Fresh reading confirms the accepted plan's G1 blocker:

- `SmoothLink/Basic.lean` supplies a labeled oriented family of disjoint
  smooth circle embeddings and explicitly excludes normal-bundle framings.
  `SmoothLink/Isotopy.lean` supplies unframed ambient isotopy. Neither gives
  the framed multi-link quotient, linking number and Seifert-framing laws
  required by QT.0 and the framed RT/bottom-tangle carrier in QT.1.
- `DehnSurgery/Slope.lean` supplies primitive actual peripheral homology
  classes modulo sign and `FramedBoundaryTorus` slope arithmetic. It does
  not construct the filled manifold, calculate its H₁ from the linking
  matrix or prove ordinary Kirby/Fenn–Rourke equivalence. A matrix cokernel
  is not a replacement manifold. These are explicit GeometricTopology,
  Part II requests in the accepted input.

QT.5/QT.6 also still require ordered cusped face-pairing geometry,
peripheral/strong flattenings, the geometric NZ datum, the coefficient-field
Gaussian bracket and the spectral/microlocal AK contracts recorded below.
The new Taylor series close none of those geometric gaps. Resume by obtaining
these exact owner signatures, then instantiate the package's native algebraic
interfaces and state the geometric comparisons. Do not replace them with an
unspecified predicate, a free matrix pretending to be geometry or a second
supplier carrier. Keep the eight-layer remaining-work table below.

## Prior checkpoint: `codex-ydEjCj`

Worker: Codex (GPT-6), session `codex-ydEjCj`, issue #7889, 2026-10-10.
Claim confirmed after comment 6095288222. Branch:
`codex-ydEjCj-arithmetic-quantum-topology`. No second job was claimed.

This run advances the **QT.6 polynomial-to-series adapters**. The complete
package is blocked on the framed-link/surgery and geometric NZ/analytic
supplier interfaces described below. This is a dependency checkpoint.
It does not claim the geometric state integral, arithmetic descent or analytic
asymptotics is formalized. No input packet or supplier file was edited.

## Saved in this run

- `Suggested.lean` adds two concrete algebraic functions,
  `NZPerturbativeSeries` and `rootNZPerturbativeSeries`, using the existing
  finite polynomial vertices and Mathlib's actual `PowerSeries.mk`.
  The **4,177-line, 204,788-byte** file retains its inherited Lean body
  exactly, with two individual imports and a new final `NZContractions`
  section (**207 added lines** including the imports). The root adapter uses the
  existing `rootNZAverage` and an actual nonzero-denominator hypothesis.
- Eight API lemmas give coefficient extraction, conditional constant 1,
  odd-coefficient vanishing and complete recovery of the contracted t-series
  through `PowerSeries.expand 2` under h=t². Their proofs use the inherited
  constant/parity statements and the explicit imported functional laws.
  They do not establish the inherited `sorry` statements or existence of G.
- Ten examples cover normalization, odd moments, scalar flattening,
  the GSW/DG normalization correction, covariance scaling, the cubic pair
  and failure of multiplicativity. Five specialized coefficient examples
  remain honest `sorry` statements. The linear-functional nonmultiplicativity
  control has a Lean proof from the displayed covariance equation.
- README: **199,177 bytes**. All ordered **106 target headings**, **114
  anchors**, **75 reference destinations** and **464 distinct inherited
  backtick-named API/test components in bullet prefixes** are preserved.
  The two affected targets specify the exact functional laws and adapter
  boundary. Repeated source labels are shortened to author/acronym labels;
  the bibliography's titles and fixed versions are retained unchanged.
- `metadata.toml` remains absent. `issues.py:deliverables_complete` still
  decides package completeness by existence of every output. Creating the
  last file would mark this incomplete package complete. Add the one-line
  `topic = "math.GT"` only when all layers meet PROTOCOL §20.

## Exact supplier contract and mathematical controls

The adapters take a native ℂ-linear map
G:ℂ[x₁,…,x_N]→ℂ; they do not define a Gaussian operator. At a geometric
specialization HB.4 must supply G(1)=1,
G(x_i p)=Σ_j C_ij G(∂_j p), and G(p(−x))=G(p), with C=Λ⁻¹ for GSW
and C=kΛ⁻¹ for DG2 root order k. The full coefficient-field version must
commute with field embeddings/base change and specialize to HB.4's real
polynomial bracket. Normalization and parity hypotheses appear as exact
native equations, without an unspecified condition or carrier.

Each h-degree d is obtained from the finite polynomial coefficient at t-degree
2d. The expansion equality also recovers every odd degree as zero; merely
throwing away odd coefficients would not establish that equality. Root weights
are arbitrary algebraic inputs to this adapter with S≠0. Their geometric
formula, root compatibility, Kummer descent and one-loop ambiguity remain the
separate RootNZDatum and arithmetic-theorem obligations.

The discriminating one-variable controls are:

1. With zero mock vertices, GSW Q=1, μ=1, f=2 retains coefficient h equal
   1/2. Replacing the unit control by the uncorrected DG factor
   exp(tx/2−t²/12) at covariance 1 gives coefficient h equal 1/24.
2. At k=2, zero vertices and μ=4 give coefficient h equal 1 for f=0 and
   3/2 for f=2 under covariance 2. Using covariance 1 instead gives 1/2
   and 1, respectively.
3. Mock Li₀=0, Li₋₁=1 and all other inputs zero, μ=f=0, k=2 give log
   coefficients −x³/24 and x²/16. Contraction of the exponential gives
   11/48 at h. The cubic pair contributes 5/48; omitting it gives 1/8.
   In general root order k this control gives 11/(24k), with cubic-pair
   contribution 5/(24k). These mock inputs certify no geometric NZ datum.
4. Covariance 1 gives G(x)=0 and G(x²)=1. A ring homomorphism would wrongly
   force G(x²)=G(x)². The adapter therefore uses a linear map, never
   `PowerSeries.map` along a claimed multiplicative bracket.

## Source and baseline audit

Read the public GSW v2 source, *Perturbative invariants of cusped hyperbolic
3-manifolds*, https://arxiv.org/pdf/2305.14884v2:
§1 equations (1), (4)–(7), pp. 3–4; §3.1 equation (20), Lemmas 3.1–3.2,
pp. 9–10. SHA-256:
`ebc8e64d901c9e4f397ece6170c92d5d65045ef7fbb15d251a268327acf7e1fb`.
Read DG2 v1, *Quantum modularity and complex Chern–Simons theory*,
https://arxiv.org/pdf/1511.05628v1:
§§2.3–2.4, Definition 2.5, Theorem 2.6, Remark 2.7, Lemma 2.8 and
(16)–(28), pp. 7–9. SHA-256:
`3b9da2994233882bdb242798fd1a5f85e53f1d0fd66410809de751d056a07d3a`.
These match the input receipts. The already-recorded n=0 cubic correction is
retained. Only own-word statements, formulas and source locators are saved;
no restricted book was needed and no source passage is retained.

Pinned Mathlib statements read before use: `PowerSeries.mk`, `coeff_mk`,
`coeff_zero_eq_constantCoeff_apply`, `expand`, `coeff_expand_mul`,
`coeff_expand_of_not_dvd`; `MvPolynomial.pderiv`, `pderiv_one`,
`pderiv_X_self`, `pderiv_pow`; linear-map negation and scalar laws;
`Odd.neg_one_pow`, `Even.two_dvd` and `Nat.not_even_iff_odd`.
Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Checker Tau Ceti baseline: `f790474821cf4256814db967cb154e7af3d0c369`.
The full current SemisimpleAlgebras and GrothendieckEulerForms roadmaps were
read as the required upstream examples.

## Validation in this run

- Packet checker: **0 errors, 0 warnings**. The accepted input remains
  106 nodes, 8 gaps, 19 requests, 8 planned stages and 0 closed stages.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 583 warnings**, all `declaration uses sorry`. Only
  the provided shared checker was run; available memory was 110 GB. No
  checker process remains running.
- **675 exact rational controls** passed. An independent truncated-series
  computation solves E′=L′E and counts complete Gaussian pairings. It checks
  the stated values, linear/scalar controls for k=1,…,12 through t-degree 8
  against exp((c+kb²/2)h), odd parity, the root cubic coefficient and its
  removal, signed nonzero weighted averages and wrong-covariance controls.
  These finite checks are not proofs of geometric or infinite-order claims.
- The heading/anchor/reference/name conservation audit and exact inherited
  Lean-body comparison passed. Scoped intake `check-files`: **3 files,
  0 problems**. `git diff --check` passed. Scratch files are not deliverables.

## Fresh dependency evidence and where to resume

Current read-only TauCetiRoadmap:
`201bcaee1f4014c91897d50cdb7631fc6d6a6d71`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The roadmap change since the prior handoff concerns only
SmoothRepresentationsOfLocalGroups, so it does not supply these contracts.
The reviewed library catalogue has no ArithmeticQuantumTopology entry.

- `SmoothLink/Basic.lean` supplies labeled unframed circle embeddings;
  framings require separate normal-bundle data. `SmoothLink/Isotopy.lean`
  supplies the actual unframed ambient-isotopy setoid. Neither supplies
  QT.0's framed quotient, oriented linking number or surgery carrier.
- `DehnSurgery/Slope.lean` supplies actual peripheral homology and primitive
  slopes on `FramedBoundaryTorus`. It does not construct the filled manifold
  or prove the integral-surgery H₁/Kirby comparison. GeometricTopology's
  suggested file remains schematic; do not substitute its matrix-side
  cokernel for a manifold or create a duplicate geometric carrier.
- `suggested/HabiroNahmSeries.lean` HB.4 remains a real-polynomial operator,
  with no complex coefficient-field instance. The new QT adapters consume
  its required extension; they do not discharge that owner request.
- Ordered cusped triangulations, peripheral/strong flattenings, and the AK
  spectral/microlocal/gluing contracts remain required by the exact targets.

Resume from the geometric framed-link/linking/surgery supplier interfaces,
then instantiate the invariant comparisons. For QT.6 first obtain HB.4's
coefficient-field bracket and the geometric NZ datum, instantiate the new
adapters with rational Li_(−r), and only then state
`formalNZStateIntegral`/`rootNZFormalSeries` and their geometric/arithmetic
comparisons. Keep the eight-layer remaining-work table below: the new
conditional algebra does not close any of the recorded geometric gaps.

## Prior checkpoint: `codex-cSWQRq`

Worker: Codex (GPT-6), session `codex-cSWQRq`, issue #7889, 2026-10-10.
Claim confirmed after comment 6095000415. Continues the rank-one foundation
checkpoint by `codex-eGMIqk`; all earlier mathematical work is retained below.

This run advances **QT.2/completed-even-center**. It remains a partial package:
framed-link and integral-surgery supplier carriers are absent, and this issue
permits no edits to their owners or to the accepted plan. The new native center
interfaces do not discharge those independent geometric requirements. This is
a dependency checkpoint, not a time-limit checkpoint. No second job was taken.

## Saved in this run

- README: **199,995 bytes**, the same ordered **106 target headings**, all
  existing anchors, source destinations, and **404 inherited API/test names**
  retained. The center target now specifies its actual quotient product,
  finite triangular coordinates, canonical integral-image realization,
  saturation proof route and separate intrinsic sigma topology. Repeated
  labels are shortened consistently to fit the 200,000-byte ceiling;
  mathematical target headings and prerequisites are unchanged.
- Suggested.lean: **3,970 lines**, adding **272 lines** after the inherited
  file body, which is retained exactly. The addition is in
  `TauCeti.QuantumTopology.QuantumEnveloping.EvenCenter`. There are twelve
  examples, including the three prescribed tests. All source-theorem proof
  obligations remain honest `sorry`s; this is a suggested interface,
  not a formalization of the center theorem.
- `metadata.toml` remains absent. A fresh read of
  `research/blueprint/issues.py:deliverables_complete` confirms that package
  completeness is decided by output existence. Adding the last file would
  misclassify this incomplete package. When every layer meets PROTOCOL §20,
  add `topic = "math.GT"` and a newline.

## QT.2 center construction and source audit

Public source read: Habiro, *An integral form of the quantized enveloping
algebra of sl2 and its completions*, arXiv:math/0605313v1,
https://arxiv.org/pdf/math/0605313v1, accessed 2026-10-10. SHA-256:
`b466d7d47865e3a4e7ef4a7363646cd119ff640785b3ec0423365666ed069c7e`.
The receipt agrees with the input. Read the introduction's center/completion
conventions (p. 3), §§9.2–9.6 (pp. 19–23), the adjoint-action proof and
cyclotomic valuation integrality argument in §§10.3–10.4 (pp. 26–30), and
§11 (pp. 30–31). Locators: Theorems 9.2 and 9.5, Proposition 9.4,
Lemmas 9.10–9.12, Theorem 9.13, Proposition 10.6, Lemma 10.8 and
Theorem 11.2. No restricted source was used; no source passage is retained.

1. `quantumCasimir` is the concrete ambient expression
   (v−v⁻¹)²FE+vK+v⁻¹K⁻¹ in the existing noncommutative `Uh`.
   Centrality, vC∈Uq and C²∈Uqev have explicit signatures. `Center` is
   Mathlib's actual `Subalgebra.center` of QT.1's even image completion.
   `casimirSquare` uses C² membership; C itself is not falsely placed in Uq.
2. `sigmaPolynomial n` is the monic degree-n polynomial in Y=C² over
   QBase=ℤ[q±1], with factors Y−q^i−2−q⁻i for 1≤i≤n.
   `sigma` evaluates it in the actual center. Zero, one and successor
   polynomial formulas, and sigma zero/one evaluations have Lean proofs.
3. `sigmaIdeal`, `SigmaQuotient`, `sigmaTransition` and
   `completedSigmaAlgebra` use native ideals, quotient rings and compatible
   product subalgebras. `SigmaCompletion` inherits quotient multiplication;
   closure and finite-polynomial map laws have Lean proofs. The zero-precision
   quotient is the zero ring, whereas precision one is the coefficient ring.
4. `polynomialToEvenForm` evaluates Y at the native even integral C².
   `sigmaPolynomial_killed` states the actual restricted e-power comparison,
   not merely h-adic vanishing. `sigmaToIntegralQuotient` uses
   `Ideal.Quotient.liftₐ`; `sigmaToIntegralLimit` maps compatible coordinates
   into the existing even integral limit; `sigmaToCenter` then uses
   `integralToUh` and its actual image. The defining maps are concrete;
   compatibility, centrality and saturation/surjectivity remain typed proof
   obligations. `evenCenterRealization` is `AlgEquiv.ofBijective` for this
   map, not an unspecified equivalence that only fixes finite polynomials.
   No injectivity of the entire integral inverse limit is asserted.
5. Finite triangular sigma coordinates induce `sigmaCoordinates` and
   `evenCenterExpansion` as **linear**, not algebra, equivalences.
   Their API includes coordinate recovery, uniqueness, finite projections,
   arbitrary integral sequences and tail independence. The explicit inverse
   constructs partial-sum congruence classes. The intrinsic sigma topology
   uses discrete quotients/coefficient ring, with completeness, separation,
   ring continuity, coefficient homeomorphism and convergence signatures.
   It is not identified silently with the ambient h-adic subspace topology.
6. `quantumCasimir_color`, `sigma_color` and `sigma_Vn_vanish` use the
   existing finite-color representation. V_n has highest weight n and
   dimension n+1; C acts by v^(n+1)+v^(−n−1), so sigma_i vanishes for i>n.
   Tests distinguish V₀'s nonzero Casimir, nonvanishing sigma₁ on V₁,
   and sigma₁²=sigma₂+(q²+q⁻²−q−q⁻¹)sigma₁. Its coefficient sequence
   thus cannot carry pointwise multiplication.

Pinned Mathlib source statements reread before use: `Subalgebra.center`
and its commutative ring instance; `Polynomial.aeval`; `Ideal.Quotient.mkₐ`,
`factorₐ` and `liftₐ`; `AlgEquiv.ofBijective`; native quotient/subalgebra
ring structures. Mathlib commit verified as
`082e2d37e8b0463410cdb532e111cd43d5a66174`.
The existing shared checker identifies its Tau Ceti baseline as
`f790474821cf4256814db967cb154e7af3d0c369`.

## Validation in this run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**; no input edit. It reports 106 nodes, 8 gaps,
  19 requests, 8 planned stages and 0 closed stages.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 578 warnings**, all `declaration uses sorry`.
  Available memory was 110 GB. Only the provided checker was used; no
  language server, Lake build/update/cache command or read-only-tree build.
- **476 exact rational matrix/scalar checks** passed at v=2, 3/2, 3 and −2,
  for V₀,…,V₆ and sigma₀,…,sigma₈. They evaluate the existing E/F/K
  conventions, the FE Casimir, sigma products, the sharp vanishing index
  and the sigma₁² identity. Twelve controls distinguish v from q=v²,
  swapping FE to EF, and incorrectly killing sigma₁ on V₁. These finite
  checks are not proofs of the admitted infinite-dimensional results.
- Ordered heading/anchor and inherited-name comparison passed; the previous
  Lean body is retained exactly. Only the three permitted existing
  deliverables are changed. The final submission file check and whitespace
  check passed. Scratch source files, scripts and logs are not deliverables.

## Fresh owner check and where to resume

Current read-only TauCetiRoadmap:
`cd03e06852a13216ad246d0623492c4beac39af2`; current read-only Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the full GeometricTopology README and suggested file and the full
SemisimpleAlgebras and GrothendieckEulerForms READMEs. Reread actual
`TauCeti/KnotTheory/SmoothLink/Basic.lean` and `Isotopy.lean`,
`TauCeti/LowDimTopology/DehnSurgery/Slope.lean`, framed Markov and PD-code
interfaces. The reviewed library catalogue has no ArithmeticQuantumTopology
entry. None of the inspected owner boundaries has advanced since the prior
checkpoint:

- `SmoothLinkEmbedding` and its native ambient-isotopy setoid are unframed.
  Framed Markov/PD data do not provide the missing framed geometric quotient;
  `MarkovEquiv` explicitly discards framings.
- `Slope` and `FramedBoundaryTorus` give genuine peripheral homology arithmetic,
  but no filled manifold, integral-surgery H₁ theorem or Kirby comparison.
- The ordered cusped-triangulation/peripheral/strong-flattening and AK analytic
  supplier contracts identified below still require their actual owner APIs.

Resume at QT.0's native framed-link/linking matrix and surgery contracts, then
instantiate the invariant/pairing comparisons. The even center target now
has concrete signatures; build the knot expansion on these and the existing
color completion. General Lie-type core data and odd transmutation still
belong to this roadmap and remain to be prototyped. The dependency table below
is updated for the center addition. No packet, supplier or review file was
changed. Do not create duplicate geometric carriers or substitute a matrix
cokernel for a surgery manifold.

## Prior checkpoint: `codex-eGMIqk`

Worker: Codex (GPT-6), session `codex-eGMIqk`, issue #7889, 2026-10-10.
Continues `codex-jiwjSa` (PR #8267), following PRs #8259, #8245, #8235,
#8222, #8210, #8192 and #8154. Claim confirmed in issue comment 6094539329.

This is **partial**, not a completed package. This run supplies QT.1's
rank-one quantum algebra, integral forms, completed tensors, Hopf/ribbon
operators, adjoint transmutation and finite free module category as concrete
native carriers and typed signatures. The inherited additions remain intact.
Missing framed-link, surgery, cusped geometry and analytic supplier interfaces
still prevent the full package required by PROTOCOL §20. Other QT-owned
prototypes also remain, as the table below records. No packet, review verdict
or supplier file was changed. This is a dependency checkpoint, not a time-limit
checkpoint.

## What is saved

- `research/blueprint/packages/ArithmeticQuantumTopology/README.md` retains
  the same ordered 106 targets and eight QT.0–QT.7 layer anchors, every
  inherited API/test name and source destination. The first three QT.1
  targets now specify the native quotient/inverse-limit carriers, integral
  image completions, tensor filtration, continuous ribbon module category
  and transmutation maps and laws. Their tests distinguish the parameter,
  q/v factorials, tensor filtration, R order, framing and native duality.
  Repeated links use references with the same destinations; several long
  cross-reference labels are shortened to fit the **199,906-byte** document
  under the 200,000-byte ceiling. Mathematical target headings are unchanged.
- `Suggested.lean` retains every inherited declaration verbatim, modulo
  whitespace, and adds 1,277 lines of rank-one quantum interfaces in
  `TauCeti.QuantumTopology.QuantumEnveloping`, plus individual imports.
  It has 3,698 lines and elaborates with only `sorry` warnings. Definitions
  use native algebras, ideals, quotient congruences, modules and categories;
  typed proof/construction obligations remain admitted. This is a prototype,
  not a formalization of the source theorems.
- `metadata.toml` remains **absent**. The intake's
  `issues.deliverables_complete` treats a package as complete when all three
  files exist, without reading a partial handoff. Adding it now would route
  an incomplete package to review. Once all signatures are complete, write
  exactly `topic = "math.GT"` and a newline.

## Native QT.1 quantum addition in this checkpoint

Read Habiro, arXiv:math/0605314v1, §§2.1–2.6 (printed pp. 7–11),
§§3.1–3.3 (pp. 11–14), including Lemma 2.1, Proposition 2.2,
equations (3.1)–(3.12), Theorem 3.1 and Proposition 3.3; also §5.1
and the module/duality conventions in §5.2 (pp. 18–19), and the trace
formula in §5.3 (p. 20). Public PDF:
https://arxiv.org/pdf/math/0605314v1, accessed 2026-10-10, SHA-256
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
Only the own-word mathematical constructions and exact locators are retained.
No restricted source was used.

1. `Words` is `FreeAlgebra ℚ (Fin 3)` and `Presentation` is its polynomial
   algebra with central h. `Truncation p` is `RingQuot` by h^p and the three
   commutator relations. The Cartan series cancels the common h before
   inversion; its h² coefficient is (H³−H)/24. `Uh` is the actual compatible
   subalgebra of the product of these quotients. Central formal scalars,
   finite projections, precision maps, density, completeness and separation
   have concrete signatures. PBW coordinates are linear/topological
   equivalences, not a commutative replacement product. The classical
   quotient is the existing `UniversalEnvelopingAlgebra` of native sl₂.
2. Cartan units, e and q-divided powers are defined in that algebra.
   `integralForm` is `Algebra.adjoin` over `LaurentPolynomial ℤ`, with the
   Laurent variable sent to exp(h). Its two PBW bases and unique parity
   decomposition use integer Cartan exponents. The e-power ideals are native
   `TwoSidedIdeal`s and the quotients use `RingCon`. `integralToUh` is the
   coordinatewise canonical map, and `completion` is its image. No
   injectivity of the integral inverse limit is asserted; Habiro records
   this as conjectural in §2.5.
3. `CompletedTensor n` is a compatible quotient limit built from native
   `PiTensorProduct` of the free-algebra factors, with one shared h.
   The 0-fold and 1-fold equivalences, ordinary tensor comparison, density
   and leg insertions are typed. `IntegralTensor` tensors the actual integral
   forms over ℤ[q±1]. Its filtration is generated by e^p in any one factor,
   rather than total e degree; the 0-fold case is F₀=ℤ[q±1], F_p=0 for p>0.
   The integral completed tensors are images in the ambient completed
   tensor algebras, without an injectivity assumption.
4. The continuous coproduct, counit and opposite-algebra antipode have
   generator values, coassociativity, both counit and both antipode laws.
   `universalR` and `ribbonElement` are genuine unit-valued compatible
   finite sums, with the source's ordered inverses. R's first correction is
   h(H⊗H/4+F⊗E). Positive framing uses r⁻¹ and gives exp(n(n+2)h/4).
   The existing finite-color matrices extend to continuous algebra maps;
   tensor-color action is characterized by native Kronecker products.
5. `FiniteQuantumModule` is an `ObjectProperty.FullSubcategory` of native
   `ModuleCat Uh`, finite free after `ModuleCat.restrictScalars`.
   `Module.finBasis` transports the uniformity, with a theorem identifying
   the native (h)-adic module topology. Tensor objects use the ordinary
   scalar tensor with the coproduct action; braiding is flip after R.
   Dual carriers are native `Module.Dual`. Mathlib's right dual evaluates
   dual⊗V and uses S; its left dual evaluates V⊗dual and uses S⁻¹.
   Evaluation, dual-basis coevaluation and triangle identities assemble
   explicit `ExactPairing`/`HasRightDual`/`HasLeftDual` instances into the
   native rigid category. The ribbon twist is r⁻¹; finite colors identify
   the existing matrix carrier with its module object.
6. The adjoint action is the contraction axS(b) after Δ. Transmutation uses
   the source's three contractions, with continuous inverse braiding and
   inverse antipode. `braidedMultiply_pure` retains the middle crossing;
   Δ̲ is multiplicative into this braided product, with explicit leg maps,
   coassociativity, counit and antipode laws. Integral preservation and
   image-filtration theorems retain ψ±¹/S̲±¹(F_p)⊂F_p and
   Δ̲(F_p)⊂F_⌊(p+1)/2⌋. These image filtrations come from the integral
   quotient kernels; ambient h-adic continuity does not assert that an
   integral image is h-adically closed or complete. The general odd-form
   and graded refinements of Remark 3.4 remain to be prototyped.

Pinned declarations read before use include `FreeAlgebra.ι`,
`RingQuot.mkAlgHom/liftAlgHom`, `RingCon.mkₐ/factorₐ/lift`,
`TwoSidedIdeal.span/ringCon_le_iff`, `PiTensorProduct.singleAlgHom/tprod`,
`PowerSeries.invOfUnit` and its discrete-coefficient `WithPiTopology`,
`ModuleCat.restrictScalars`, `ObjectProperty.FullSubcategory`,
`Module.finBasis`, `Basis.dualBasis`, `Module.Dual`,
`Ideal.adicModuleTopology`, and native monoidal, braided, exact-pairing
and rigid category structures. The full upstream examples read this run
were SemisimpleAlgebras and OperatorTheory/OrthogonalGeometry.

Validation in this run:

- Accepted input checker: **0 errors, 0 warnings**, unchanged packet.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 544 warnings**, all `declaration uses sorry`.
  Available memory was 105 GB before the final check. Shared build:
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No build, update, cache
  download or language server was run.
- **287 exact finite checks** passed using Python `Fraction` in ℚ[h]/h⁵.
  V₀ through V₆ check the three commutators, K inversion, both ribbon
  scalars, F̃⁰/F̃¹, and F̃ᵃF̃ᵇ=q⁻ᵃᵇ Gaussian(a+b,a)_q F̃ᵃ⁺ᵇ
  for 0≤a,b≤3. All 16 color pairs V_m⊗V_n, 0≤m,n≤3, check R inversion,
  agreement of both balanced and integral R formulas, and quasitriangularity
  for H,E,F,K. Seven controls distinguish the F weight sign, q versus v,
  factorial convention, framing sign, nonidentity R, the V₁ exponent and
  the Cartan numerator coefficient. These are formula checks, not proofs
  of any remaining Lean obligation.
- The tensor-filtration test has an exact specialization witness on V₁⊗V₁:
  at v=i, q=−1, the e matrix has sole nonzero entry −2. Thus e²=0, while
  e⊗e has a nonzero entry 4. Every single-factor e² ideal generator
  vanishes, so the total-degree filtration would give the wrong result.
- README audit: identical ordered 106 target and eight layer anchors,
  all inherited API/test names and link destinations retained, and all
  reference links resolve; **199,906 bytes**. Every inherited Lean
  declaration is preserved verbatim modulo whitespace.
- Intake `check-files`: **3 files, 0 problems**; `git diff --check` and the
  exact issue-output scope pass. Metadata is absent to preserve checkpoint
  routing. Scratch source texts and checks are deleted after submission.

## Why the complete job is blocked

The accepted input passes the structural checker, but it explicitly contains
8 gaps, 19 open requests, 8 planned stages and **0 closed stages**. Its suggested
file has numerous entries labelled “signature omitted”; acceptance of its
planning pass did not supply those carriers. In particular the first target
requires a framed multi-link quotient and the next requires actual surgery.
These cannot be made into native signatures by interpreting a knot Gauss code,
a matrix cokernel or an unconstrained `Type` as the required geometric object.
PROTOCOL §13 explicitly forbids a dummy condition replacing an unstated one;
WORKERS forbids replanning another owner. This issue permits editing neither
GeometricTopology nor the other supplier plans.

The read-only current upstream was checked at TauCetiRoadmap
`cd03e06852a13216ad246d0623492c4beac39af2` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

1. `TauCetiRoadmap/GeometricTopology/Suggested.lean` contains schematic comments,
   not a native framed-link/surgery interface. Current
   `TauCeti/KnotTheory/SmoothLink/Basic.lean` supplies `SmoothLinkEmbedding`
   (smooth circle components with disjoint ranges), and `SmoothLink/Isotopy.lean`
   supplies `SmoothLinkEmbedding.SmoothAmbientIsotopic` and its native setoid.
   These unframed interfaces do not supply Seifert framings, linking numbers or
   a framed isotopy quotient. The pinned `FramedMarkovBraid`
   supplies component framing data, but `MarkovEquiv` is explicitly unframed.
2. The current `TauCeti/LowDimTopology/DehnSurgery/` contains `Slope.lean`:
   slope arithmetic on the actual first homology of `BoundaryTorus`, the
   primitive-class quotient and `FramedBoundaryTorus`. Its scope explicitly
   leaves the complement and filled manifold for further work.
   It does not supply integral surgery, the H₁ comparison, or Kirby moves.
3. GeometricTopology layer 7's closed-manifold geometry does not provide the
   ordered cusped geometric triangulation, peripheral completeness, canonical
   refinement connectivity or relative CW/homology interface required in
   QT.5–QT.6. The precise extensions are already described in the input's
   GeometricTopology Part II requests; do not replace them with bare matrices.
4. `OperatorTheory/SelfAdjointSpectralTheory` now owns the unbounded spectral
   theory that the older AS.0 request partly describes. Its native choice is
   `LinearPMap`, and its Part E constructs the spectral PVM and generated
   unitary group. This owner is cited in the package instead of planning the
   spectral theorem again. The specific Schrödinger realization/common
   Schwartz core/closure of p+q and microlocal kernel product/pushforward
   extension still require precise imported interfaces. No global AK gluing
   operation is invented here.
5. The accepted `HabiroCyclotomicCompletions` package exists and provides
   `HabiroRing`, finite factorial projections, `evalAt`, `taylorAt` and rigidity
   in its own namespace. Those must be imported, not defined again. At this
   checkout there are no packages for HabiroNahmSeries, HabiroNumberFields,
   K3BlochGroups, Polylogarithms or QSeriesPartitionsAndMockModularForms.
   Their references in the README identify mathematical owners, but must be
   reconciled with the permitted lower-tier/bundle order before upstream use.
   In particular the integral NZ/HB.9 bridge cannot erase faithful coefficient
   transfer, signed Kummer orientation or full quadratic finite étale descent.

This run's final upstream recheck saw only SmoothRepresentationsOfLocalGroups
advance from `0a56d1b` to `cd03e06`; no inspected geometric, spectral or
quantum boundary changed. No messages or new issues were sent to suppliers; the existing requests remain
unchanged. The maintainer must route these owner extensions or provide their
native signatures. This is a dependency block, not exhaustion of the run time.

## Native QT.5 regulator addition inherited from PR #8267

Neumann arXiv:math/0307092v2 was read at Definition 2.2, Lemma 2.3,
Definition 2.4 and Proposition 2.5 with its proof, §2, pp. 417–420
(PDF pp. 5–8). PDF SHA-256:
`de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`.
Polylogarithms' current `polylog`, disk-series and slit-derivative signatures
and its principal/lower-bank convention were read. That owner has no native
package or Tau Ceti implementation in the inspected checkouts.

`ExtendedBloch`’s `RogersRegulator` section builds on the existing `CutCover`,
`flatteningEquiv`, `LiftedFiveTerm`, `extendedPreBloch` and `extendedDehn`.
It introduces no ordinary Bloch group or second dilogarithm:

- `rogersPeriods` is `AddSubgroup.zmultiples π²` in ℂ. `RogersTarget`
  is the actual additive quotient; `rogersImaginary` descends imaginary part.
  The equality criterion retains an integer multiplier, not a real span.
- `cutDilog` corrects the supplier's lower-bank value by +2πi log x above
  x>1. `rawRogers` uses the existing negative-log w₁ convention.
  `rawRogers_negative` and `rawRogers_positive` have Lean proofs of the
  exact raw differences −qπ² and +pπ² for arbitrary supplied functions.
  The quotient-identification and chart comparison remain proof plans.
- `extendedRogers_transfer` and `extendedRogers_liftedFiveTerm` specify
  descent through both existing relation families. The five-term theorem
  takes disk-series, slit-derivative and lower-bank limit hypotheses; it
  does not assume its conclusion or permit unrelated independent lifts.
  `extendedRogers` is the native quotient lift with the existing universal
  API; `extendedRogersBloch` is its kernel restriction. Instantiate those
  branch-law parameters with Polylogarithms when its native import exists.
- `rogersOnFlattening_im` retains the single-symbol alternating log-area
  correction. `extendedRogers_im` requires a zero extended Dehn class before
  comparing to the signed sum of the supplied Bloch–Wigner values.
  The README and tests distinguish this from a symbolwise volume claim.
- Native tests retain −π²/6 normalization, the positive p-sheet sign,
  nonzero real classes, π² versus π²/2 periods, both cut multipliers,
  transfer, the permitted five-term class, and the odd-sheet imaginary
  correction at z=1/2. The p-sheet algebra and quotient five-term test have
  Lean proofs (the latter uses an inherited admitted relation theorem).

The remaining analytic, cover and quotient obligations use `sorry`, as a
roadmap permits. This is a conditional supplier-facing mathematical plan,
not an instantiated polylogarithm or a formalized regulator theorem.
Pinned Mathlib statements read: `AddSubgroup.zmultiples`,
`QuotientAddGroup.mk'/lift`, complex logarithm/imaginary part, and the existing
free-abelian and exterior-power APIs. The read-only upstream mathematical
examples for this run were GrothendieckEulerForms and SemisimpleAlgebras.

Validation in this run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**; the accepted input is unchanged.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 266 warnings**, all `declaration uses sorry`.
  Available memory was 108 GB before checking. The existing shared build
  uses pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- **2,066** finite numerical checks passed with mpmath 1.4.1 at 65 decimal
  digits and absolute tolerance 10⁻⁵⁵ (maximum discrepancy <4×10⁻⁶⁵).
  Cut tests use z=−3,−1,−1/5 and z=6/5,2,5, with p,q=−2,…,2 (150 cases).
  On z=1/2,−1,2,1/5±3i/10,exp(πi/3), 450 checks test p/q sheet shifts
  and the single-symbol imaginary formula; 486 test transfer with four sheet
  parameters in {−1,0,2}. Four FT⁺ configurations from rational-grid shape
  pairs test the exact lattice V for all 243 five-tuples in {−1,0,1}⁵
  (972 cases). Eight controls distinguish the half normalization, odd-sheet
  volume, half period, nonzero real class and four forbidden independent
  third-sheet changes. These checks validate formulas and conventions;
  they are not proofs of the remaining Lean obligations.
- README audit: identical ordered 106 target anchors and 8 layer anchors;
  every inherited API/test name retained. Size **199,380 bytes**, below
  the 200 KB ceiling. Six additional Markdown-reference destinations retain
  the exact original URLs and their individual source locators.
- `python3 research/blueprint/intake.py check-files` on the three deliverables:
  **3 files, 0 problems**. `git diff --check` and exact issue-output scope pass.
  No restricted source was needed; source PDFs/texts and numerical scratch
  are discarded after submission.

## Native QT.7 proof addition inherited from PR #8259

Five existing public obligations now have Lean proofs:
`rationalPoleFree_mobius`, `rationalMobius_comp`, `denominatorCocycle_comp`,
`tweakedAutomorphyEntry_comp` and `matrixTransport_comp`.
Their definitions, hypotheses and result statements are unchanged. The existing
diagonal and GL composition theorems therefore also have proved dependencies.
These algebraic results do not construct a knot representation family or assert
the conjectural invertibility/analyticity of its matrices.

The denominator proof retains reduced fractions: Mathlib's
`IsCoprime.mulVecSL` preserves the primitive integer pair, and
`Rat.num_den_mk` reduces that pair only by a unit of ℤ. Squaring the denominator
removes its sign. The determinant-one equation then proves the additive λ
identity on the declared common pole-free domain. The automorphy proof uses
the exact denominator product, `Complex.exp_add` and `Real.mul_rpow` at
nonnegative absolute-value bases. Transport cancels the middle J value in
order using group multiplication; it needs the stated factor identity.

The three named tests in the README now have proved native examples for this
conditional transport formula:

- Constant J=I and j=I give identity transport.
- With j=I, x=1, γ=S, η=T, J(−1/2)=I, J(2)=U=(1 1;0 1) and
  J(1)=V=(1 0;1 1), the two factors are U and U⁻¹V. The correct product is V;
  reversing it gives (0 −1;1 2), distinguished by entry (0,0). The test proves
  the correct composition and rejects the reversed product. These are
  invertible algebraic test matrices, not a selected knot matrix.
- (1 1;0 0) has determinant zero and cannot be the coercion of any GL₂(ℂ)
  element. A singular ordinary matrix cannot be passed as GL-valued J.

GZ arXiv:2111.06645v3 was read directly at §3.1, (3.5) and Lemma 3.1, p. 16;
§4.5, (4.14)–(4.15), p. 30; and §5 introduction, (5.1)–(5.3), pp. 30–31.
The README and Suggested.lean correct the inherited §4.2 locator for
(4.14)–(4.15) to **§4.5**. This corrects the inherited package's locator;
the accepted packet has not been changed. The existing E11 subtraction
correction is retained. PDF SHA-256:
`2a4826bd1c2f0823c99f8e3cccfd835c5044d70d30eb20b36fea38dcb8dd83de`.
Habiro arXiv:math/0509039v2, §2.3, Lemma 2.2, p. 1290 and §2.4,
pp. 1290–1291 were read for the geometry dependency boundary. PDF SHA-256:
`d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
Only own-word mathematics and locators appear here; no source passage is saved.

## Validation of session codex-URPtqo

- Read WORKERS, both protocols, UPSTREAM_GUIDE, the full issue after claim
  confirmation and the inherited handoff. No manager-list issue was available;
  this was an eligible focus package in the fallback order. Only #7889 was
  claimed, and only its three existing deliverable/handoff paths are edited.
- Read both complete current upstream examples
  `OperatorTheory/SelfAdjointSpectralTheory` and `GrothendieckEulerForms`,
  then the GeometricTopology suggested file and relevant layers. The current
  native `SmoothLinkEmbedding`/`SmoothAmbientIsotopic`,
  `BoundaryTorus`/`FramedBoundaryTorus` and pinned framed Markov statements were inspected at the commits recorded above.
  Framed multi-link linking invariants, integral surgery and H₁/Kirby
  comparisons still need the exact supplier extensions already requested.
  The reviewed library catalogue has no ArithmeticQuantumTopology row.
- Read the pinned Mathlib statements used for reduced fractions, primitive
  integer pairs, special-linear multiplication/determinant, GL units,
  exponential addition and real-power multiplication. The five proofs and
  three transport examples first elaborated in isolation without `sorry`.
- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 249 warnings**, all `declaration uses sorry`.
  Available memory was 111 GB before the final elaboration. Only `lean-check`
  was used; no language server, build/update/cache command or Lake command in
  the read-only upstream trees was run. The inherited 254 warnings decrease
  by the five proved obligations; the other admitted signatures remain plans.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, unchanged accepted input with 106 nodes,
  8 gaps, 19 open requests and no closed stage.
- The README preserves all 106 target anchors, all eight layer anchors and
  every existing API/test name. Its 199,380 bytes remain under the ceiling.
  `git diff --check` and scoped intake `check-files` pass; intake's
  completion predicate remains false with `metadata.toml` absent.

Resume at the supplier boundaries above and the dependency table below.
The QT.7 algebraic composition proofs now require no further checkpoint work;
keep them and supply the actual knot matrices/representation data, their
comparison hypotheses and analytic/asymptotic predicates next. Do not infer
those inputs or conjectures from conditional GL transport or the matrix tests.
This checkpoint is blocked on the full package's geometric supplier contracts,
not on run time, and makes no new review verdict or closure claim.

## Native QT.6 addition inherited from PR #8245

`NZVertices` at the end of `Suggested.lean` adds `NZVertexLog`, `NZVertexSeries`,
`NZFormalIntegrand`, `rootNZVertexLog`, `rootNZVertexSeries` and
`rootNZFormalIntegrand`. Their carrier is
`PowerSeries (MvPolynomial (Fin N) ℂ)`, with formal variable t=√h.
For degree d>0 the logarithmic coefficient is a finite sum with
2n+j=d+2. This retains n=0 at valence j≥3. Each coefficient is a polynomial,
so there is no infinite coefficient sum or analytic integration hidden in a
definition. The zero log constant justifies Mathlib exponential substitution.
The GSW scalar prefactor is fᵀQf/8 and its linear term is xᵀ(1−μ)/2;
the root scalar is fᵀμ/(8k) and its linear term is −xᵀμ/(2k), with
Q=B⁻¹A and μ=B⁻¹ν supplied by the future geometric adapter.

The six zero-constant/substitution/unit-constant declarations, the GSW first
log coefficient and the k=2 cubic-scaling example have Lean proofs. The
remaining new APIs/examples are planning statements using `sorry`.
The parameter `liNeg r z` must be instantiated as
`TauCeti.Polylog.polylog (-(r : ℤ)) z` from
`Polylogarithms:P.1/classical-polylogarithm`. That supplier's rational
nonpositive-index specification was read. Its suggested `polylog` definition
still has a `sorry` body and no package import exists here; no duplicate
polylogarithm is defined in QT. Algebraic mock inputs in the prefactor/cubic
tests do not assert a valid geometric NZ datum.

An additional exact supplier boundary was verified in
`suggested/HabiroNahmSeries.lean`, lines 545–585. HB.4's current
`formalGaussian` and `gaussLaplacian` take **real** matrices/polynomials.
They cannot contract these generally complex/algebraic shape coefficients.
The existing HB.4 request needs a characteristic-zero coefficient-field
interface: for symmetric invertible Λ over K, a K-linear normalized bracket
on `MvPolynomial (Fin N) K`, with second moment Λ⁻¹ᵢⱼ, odd-polynomial
vanishing, Wick moments and compatibility with field embeddings/base change.
The ℝ specialization must agree with HB.4's existing bracket. QT consumes this
interface at covariance Λ⁻¹ or kΛ⁻¹; it must not recreate Gaussian contraction.
No substitute Gaussian `Prop`, dummy carrier or unconstrained bracket was
added. `formalNZStateIntegral` and `rootNZFormalSeries` remain unstated until
this supplier and the geometric datum adapter exist.

## Validation inherited from session codex-tNXl0D

- Read both complete current TauCetiRoadmap examples
  `OperatorTheory/SelfAdjointSpectralTheory` and `GrothendieckEulerForms`,
  then the current GeometricTopology suggested file and native smooth-link
  and surgery-slope statements. The read-only upstream hashes are the ones
  recorded above; the required framed-link, filled-manifold and cusped
  triangulation suppliers remain absent. The reviewed library catalogue
  has no ArithmeticQuantumTopology row.
- Read GSW arXiv:2305.14884v2 §1, equations (4)–(7), pp. 3–4, and DG2
  arXiv:1511.05628v1 §§2.3–2.4, equations (20)–(25), pp. 7–8, directly.
  PDF SHA-256 values respectively:
  `ebc8e64d901c9e4f397ece6170c92d5d65045ef7fbb15d251a268327acf7e1fb` and
  `3b9da2994233882bdb242798fd1a5f85e53f1d0fd66410809de751d056a07d3a`.
  No restricted source was needed. Source files/texts stayed in scratch.
- Read pinned Mathlib's `PowerSeries.exp`, `PowerSeries.subst`,
  `HasSubst.of_constantCoeff_zero'`,
  `constantCoeff_subst_of_constantCoeff_zero`, `coeff_mk`,
  `Polynomial.bernoulli`, and Bernoulli-number sign conventions before use.
- `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 254 warnings**, all `declaration uses sorry`.
  Available memory was 102 GB before the final elaboration; no language
  server or build/update/cache command was run. Six definitions and eight
  new proved statements/examples are added; the other signatures remain plans.
- **239 exact rational checks passed** using independently indexed source
  double sums through t-degree 4: GSW at z=−2,−1,1/2,3/2,2,3; genuine
  k=1,2 root vertices at θ=2,3,3/2 and every m; exponential cross terms
  and polynomial parity. The mock Li₀=0, Li₋₁=1 cubic coefficient is
  −x³/(6k²) for k=1,…,7. Its paired sixth-degree term has coefficient
  1/(72k⁴), giving 5/(24k) after the sixth Wick moment at covariance k.
  Omitting n=0 removes that term. The scalar/linear prefactor controls also
  pass. These finite computations do not prove the remaining `sorry` APIs
  or source topological/analytic conjectures. The deleted scratch script
  is not a required input to resume the job.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**; the input is unchanged, with 106 nodes,
  8 gaps, 19 requests and no closed stage.
- README retains every existing target/layer anchor and original API/test
  name. Each reference link resolves to its unchanged source URL.
  `git diff --check` passes; intake `check-files` reports 3 files, 0 problems.
  Only the three permitted package/handoff paths are changed.

Resume at the supplier boundaries above. The polynomial vertices can now be
instantiated directly; do not replace them with a commented signature inventory
or infer source invariance/analytic asymptotics from their finite tests.

## Native QT.7 addition inherited from PR #8235

Garoufalidis–Zagier arXiv:2111.06645v3 was read directly at §3.1, equation
(3.5), Lemma 3.1 and (3.7), p. 16; §4.5, equations (4.14)–(4.15), p. 30 (the §4.2 locator in that handoff
was corrected in this checkpoint).
PDF SHA-256:
`2a4826bd1c2f0823c99f8e3cccfd835c5044d70d30eb20b36fea38dcb8dd83de`.
The accepted E11 correction is retained: the second fraction in the displayed
proof of Lemma 3.1 must be subtracted. Its stated additive cocycle is unchanged.

- `tweakedAutomorphyEntry` is the actual scalar expression
  exp(v λγ(x)) times the real power |cx+d|^κ, coerced to ℂ. Here v=V/(2πi)
  in the knot application. Fixed representation volumes and weights are
  parameters; this does not replace the missing knot representation family.
- `tweakedAutomorphy` is that expression's diagonal matrix. Nonvanishing on
  `rationalPoleFree` gives `tweakedAutomorphyGL`, using Mathlib's native
  `GeneralLinearGroup.mkOfDetNeZero`. The matrix coercion is definitionally
  the diagonal formula. No complex-power branch is introduced.
- The composition API requires both the intermediate and composite rational
  image to be finite. `rationalPoleFree_mobius` and `rationalMobius_comp` name
  the domain/action obligations. Scalar, diagonal and GL factors compose in
  the order used by `matrixTransport`; the source's reverse order agrees
  because these factors are diagonal.
- Sign invariance of λ and the scalar/diagonal factor, scalar nonvanishing
  and the determinant lift had proofs in PR #8235. Its action and scalar
  composition obligations used `sorry`; those obligations are proved in the
  current checkpoint. Diagonal and GL composition derive from the scalar
  obligation. Fourteen concrete examples are proved: T has factor
  one, S at one has factor exp(v), S at zero is outside the domain, and
  λ_S(2/3)=1/6 gives exp(v/6) at weight zero. The sign and both matrix carriers
  have corresponding checks.

Pinned Mathlib statements read before use: special-linear negation and the
native `ModularGroup.S/T`, matrix diagonal multiplication/determinant,
`GeneralLinearGroup.mkOfDetNeZero`, and positivity of `Real.rpow`.
The conditional knot-matrix transport is retained; the new diagonal factors
do not establish real analyticity or quantum modularity for any knot.

## Native color-completion addition inherited from PR #8222

Habiro arXiv:math/0605314v1 was read directly at §8.1, Lemma 8.1 and
(8.1), p. 28; §8.2, pp. 29–30; and §9.1, Propositions 9.1–9.2,
p. 33, with the twisting application in §9.2, p. 34. Its PDF SHA-256 is
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
The new `CyclotomicCompletion` section completes an owned algebraic boundary
without defining a surrogate framed link or importing an unspecified RT functor.

- `colorAlgebra` has exactly the carrier of the existing q-ground tilde lattice.
  `tildeColorBasis` and `colorIdeal` specify its basis and genuine tail ideals.
  `mul_P` gives the prime-basis product before rescaling. `ColorQuotient k`
  is the actual ideal quotient, and `colorTransition` is the canonical algebra
  homomorphism for nested ideals. Finite coordinates are a linear equivalence,
  never a ring equivalence with pointwise multiplication.
- `completedColorAlgebra` is the compatible subalgebra of the product of those
  quotients. Its projections, dense algebra map, finite partial sums and
  `fromCoordinates` are concrete constructions. `completionCoordinates`
  specifies the inverse linear equivalence with all sequences of q-ground
  coefficients. The topology is induced from the product of discrete finite
  quotients; completeness, Hausdorffness, ring continuity, the coordinate
  homeomorphism and partial-sum convergence have native signatures.
- `omega` is the resulting actual inverse-limit element. In the tilde basis,
  its positive coefficients are q^(n(n+1)/2), and its negative coefficients
  are (-1)^n q^(-n). The comparison with the prime-basis coefficients retains
  the v^(±n(n+3)/2) powers. Nonzero coordinates exclude finite support; the
  inverse relation uses quotient-ring multiplication.
- `evenEvaluation` is polynomial evaluation at
  v^(2p+1)+v^(-(2p+1)). Its vanishing on P_(p+1) gives an actual quotient lift,
  hence `evenCharacter` on the inverse limit. Finite evaluation, separation of
  points and the values v^(±2p(p+1)) on the twists have exact signatures.
  `evenHopfValue` restores the quantum dimension. This is the algebraic
  pairing value; comparison with the geometric Hopf-link RT invariant still
  needs that owner's native interface.
- Tests distinguish both basis normalizations and signs, P/P₀ from P/P₁,
  higher tails from lower coefficients, ordinary polynomial elements from
  the twists, and the true product from pointwise multiplication. The
  coefficient of tilde P₁ in its square is q−q⁻¹. V₀ and V₂ evaluate the
  twists separately.

These are definitions and theorem/signature plans with `sorry` obligations,
not formalized results. No scalar Habiro completion, quantum-group completion
or external owner is recreated. The README's twist coordinates now state the
same explicit tilde normalization. The algebraic completion target and twist
coordinates have native signatures; the geometric twisting theorem, universal
invariant and general link pairings remain in the dependency table.
Pinned sources read before use include `Subalgebra`, `Module.Basis`,
`Ideal.Quotient.mk/factorₐ/lift`, `Polynomial.evalRingHom`, discrete uniformity,
product uniformity and subtype topology. The older library search found no
ArithmeticQuantumTopology coverage row; the current owner interfaces were
checked again at the commits listed above.

## Native finite-color addition inherited from PR #8210

Habiro arXiv:math/0605314v1 was read directly at §2.1–2.3 (pp. 7–9),
§5.1 (pp. 18–19, equations (5.1)–(5.3)), and §§5.3–5.4 (p. 20).
The PDF SHA-256 is
`5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc`.
The new `FormalColors` section uses actual `PowerSeries ℚ`, finite function
modules and matrices, with no assumed quantum-group carrier.

- The basis is the source's F̃^(i)v₀, with explicit H/E/F/K/K⁻¹ matrices.
  Balanced Laurent integers map to exp(ah/2); a separate unbalanced Gaussian
  recurrence supplies F̃^(m). The denominator v−v⁻¹ is never inverted in
  ℚ[[h]]. Signatures check generator relations, the precise K exponential,
  highest weight, divided-power normalizations and endpoint vanishing.
- `quantumTrace` is the linear functional Tr(K⁻¹A). Its constant-term
  comparison, quantum dimension and qualified cyclicity use that matrix.
  Tests distinguish ordinary dimension, the opposite pivot, arbitrary
  cyclicity, and ordinary F² from the divided-power basis.
- The module tensor product is compared with product-index coordinates on
  pure tensors. Coproduct matrices and the Clebsch–Gordan equivalence require
  intertwining H/E/F/K, rather than only equality of ranks. Weight characters,
  the Chebyshev representation algebra and their product comparison are
  separately stated. The zero color tests all four tensor generators.

These are construction/signature plans with `sorry` obligations, not a
formalization. The continuous completed U_h-module action and ribbon operators
still need QT.1's quantum algebra and completed tensor presentation.
Do not mark the entire finite-color target closed from these matrix interfaces.
No external owner is duplicated. Mathlib's `PowerSeries.exp/rescale`, Laurent
`eval₂`, `Pi.basisFun`, matrix trace/Kronecker and module tensor product
statements were read at the supplied pinned sources before use.

## Native QT.5 addition inherited from PR #8192

Neumann arXiv:math/0307092v2 was read directly: §2, pp. 416–420;
§3, pp. 420–424; Lemma 7.1/Proposition 7.2, pp. 439–440; and
Theorem 7.5, p. 441. The new namespace
`TauCeti.QuantumTopology.ExtendedBloch` builds the owned algebraic cover and
quotient without waiting for a manifold or triangulation carrier.

- `Flattening` is a subtype of ℂ³ with exp(2w₀)=z² and
  exp(−2w₁)=(1−z)², with its subspace topology. Both logarithms recover z.
  The explicit upper/lower cut banks, limiting logarithms and two sheet
  transitions define `CutCover` as a genuine quotient with quotient topology.
  `flatteningEquiv` is a homeomorphism obligation for its concrete log map.
  Tests distinguish odd sheets, equal w₀ with unequal shapes, and even-sheet
  path connectivity. The >1 cut's upper bank has +π imaginary part in w₁;
  the principal log chart there is the lower bank.
- `LiftedFiveTermZero` uses paths in the five-shape preimage from the FT⁺
  principal lifts. `LiftedFiveTerm` then translates by the exact five-coordinate
  sheet lattice V. It never admits independent arbitrary five lifts. The
  chart criterion and rejection test retain all five sheet equations.
- `extendedPreBloch` is the native free abelian quotient by the join of two
  explicitly generated subgroups: lifted five-term and transfer relations.
  Its universal map and extensionality have concrete signatures. Tests
  include a nonempty FT⁺ locus, transfer zero, and the nonzero order-two
  transfer class in the quotient that omits transfer.
- `extendedDehn` descends the actual logarithmic wedge to the quotient;
  `extendedBloch` is its kernel. The wedge uses `exteriorPower` over ℤ,
  not over ℂ. Tests retain the sheet-change term and assert existence of a
  generator outside the kernel.
- `forget` takes the ordinary supplier's actual shape-generator map with
  its five-term equation. The comparison square uses the concrete unit-valued
  exponential linear map and ε=−2 exterior-square(exp), into the exterior
  square of the additive synonym of ℂˣ. `extendedBloch_forget` restricts to
  the supplied boundary's kernel with the exact equation ν′[z]=2z∧(1−z).
  This is a genuine universal/import-facing API, **not** an instantiated
  K3BlochGroups import. Instantiate it only when that owner's native package
  exists, and retain the distinct ordinary Bloch conventions.

This implements definition/signature plans with `sorry` proof obligations;
none of the mathematical results is claimed formalized. It does not supply
strong flattenings, Pachner geometry, geometric Bloch classes, or the ordinary
K₃ comparison. These remain in the README and the remaining-work table below.
The conditional Rogers interface was added in PR #8267, above. No supplier plan was copied or redefined.

Pinned declarations read before use: `FreeAbelianGroup.of/lift`,
`Relation.EqvGen.setoid`, quotient topology, `Joined/JoinedIn`,
`QuotientAddGroup.mk'/lift`, and `exteriorPower.ιMulti/map`.
The source PDF SHA-256 is
`de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650`.
Only own-word mathematics and exact source locators are retained.

## Native analytic addition inherited from PR #8154

AK v2, Definition 15 (p. 9) and Appendix A (pp. 34–35, (42), (44), (47)–(49)),
was read directly. `FaddeevParameter` uses Re b>0, a reciprocal-stable domain
containing the source's representatives Re b>0, Im b≥0. The extension beyond
those representatives is through the same contour prescription and reciprocal
symmetry; it is documented explicitly in the README.

`IsFaddeevPhi` specifies an actual `ℂ → ℂ` function: meromorphic normal form
on the whole plane and agreement with the prescribed above-zero strip contour.
An existence-and-uniqueness theorem supplies its choice. It is not an admitted
carrier or a field asserting an unspecified mathematical property. The strip
integrability theorem and the offset bound lie before any use of the totalized
Bochner integral. The normal form assigns zero at poles, so the divisor and
functional identities use `meromorphicOrderAt` and punctured-neighborhood
`EventuallyEq`, respectively. The finite lattice cardinalities retain colliding
zero/pole multiplicities. Tests distinguish orders +1 at −c_b and −1 at +c_b,
order k+1 at −i(k+1) for b=1, reciprocal self-duality, and the cubic singularity
and nonintegrability of the ordinary real-axis integral.

The two convergent products in (44) are written directly with Mathlib `tprod`,
with an actual `Multipliable` obligation for Im(b²)>0; no second generic
Pochhammer library is introduced. Both shifts, the inversion scalar, product
representation and unitarity have concrete signatures. `faddeevPhi_real_strip`
connects the new meromorphic object to the retained real-b strip interface.
The operator pentagon, global AK gluing and volume/comparison assertions
remain unstated where their native analytic or geometric interfaces are absent.
All proof obligations use `sorry`; nothing is claimed formalized.

## Work remaining, in dependency order

| Layer | Native pieces saved | Full signatures still required |
| --- | --- | --- |
| QT.0 | Algebraically split/admissible matrix conditions, integral matrix cokernel and handle-slide congruence, discriminating small matrices | Framed-link linking matrix and tests; actual surgery/H₁ comparison; ordinary Kirby import; admissible band-slide, Hoste and presentation-existence refinements on those carriers |
| QT.1 | Native compatible-quotient U_h, PBW/classical comparison, integral forms and image completions, completed ordinary/integral tensors; continuous Hopf/R/ribbon and color actions; native finite free ribbon module category; adjoint/transmutation maps, laws and even image-filtration interfaces | Odd/graded transmutation refinements; general Lie-type core/twist data (QT-owned work); supplier framed tangles, RT functor and universal bottom-tangle invariant |
| QT.2 | Formal finite free colors/basis and explicit actions, continuous U_h-module and ribbon comparisons; divided powers and pivotal matrix trace; tensor/Clebsch–Gordan and character comparisons; Laurent Chebyshev polynomials, cyclotomic lattice/filtration and genuine quotient inverse limit, coordinate/topology/truncation APIs; native even image center, Casimir, sigma quotient limit, canonical integral realization and coefficient/color APIs; scalar Kashaev kernel | Link invariant and normalization, divisibility and expansion, unified Kashaev construction on actual knots |
| QT.3 | Actual completed twist elements, prime/tilde coefficient comparison, nonfinite support, inverse relation and even-color characters | Geometric Hopf pairing comparison and twisting theorem, JM on an actual integral-homology-sphere/surgery carrier, independence, connected-sum and orientation comparisons |
| QT.4 | Earlier scalar conventions | Root categories, strong Kirby colors, WRT and JM evaluation, Ohtsuki series and rigidity on the exact integral coefficient ring; general Lie-type core/parity/filtration |
| QT.5 | Principal charts, actual cut quotient/homeomorphism, intrinsic four-component flattenings, exact lifted five-term lattice, two relation subgroups, extended pre-Bloch quotient/Dehn kernel, universal ordinary forget/boundary square; conditional complex-period Rogers regulator and cut/sign/imaginary comparisons | Instantiate ordinary pre-Bloch and Polylogarithms suppliers and their convention/branch laws; actual strong/geometric flattening and Pachner interface; number-field Bloch and K₃ torsion comparison |
| QT.6 | Linear NZ/Hessian formulas, finite polynomial NZ/root vertices and exact prefactors; conditional normalized linear-bracket adapters with integer-power recovery and root weighted averages; full scalar meromorphic Faddeev signatures, selected real-b integral formulas, charged kernel action under explicit integrability/continuity, scalar root-NZ weights | Geometric NZ/root datum and HB.4 coefficient-field bracket instance; formal move invariance and root arithmetic descent; qualified HB.8/HB.9 bridge; operator pentagon; leveled shape/gluing carrier, microlocal products, AK convergence/invariance and selected volume theorem |
| QT.7 | Finite figure-eight root sums/descendants, denominator cocycle and pole-free action API, explicit scalar/diagonal/GL automorphy factors with composition and sign APIs, conditional ordered matrix transport, a partial provenance ledger | Actual representation-indexed knot rows/matrices; precise scalar/matrix asymptotic and analyticity predicates, lifts/quadratic/coefficient conjectures; proved BD comparison signatures; full six-column ledger and its tests |

These are not all external tasks. General Lie-type cores/root data, odd
transmutation refinements and knot-specific series remain
this roadmap's work. The rank-one PBW/tensor/module foundations now have native
prototypes; extend them without replacing the actual quotient products or
asserting the conjectural injectivity of integral completion. Their elaboration
does not discharge the remaining geometric or quantum targets.

Resume first at `QT.0/framed-link-and-linking-matrix`: obtain the owner’s actual
carrier and invariant linking-number/framing API, then the integral surgery
carrier and H₁/Kirby comparison. In parallel mathematical planning, not through
new worker claims, identify the lower-tier/bundle package interfaces for the
Bloch, dilogarithm and Habiro bridge. Replace each outstanding specification
with genuine Lean definitions/signatures and the named API/tests in the README.
The QT.2 color inverse limit and QT.3 algebraic twist elements now have native
interfaces: retain their quotient multiplication and instantiate the geometric
pairing comparison rather than substituting pointwise coefficient products.
The QT.5 cover and relation algebra stand independently: retain this
namespace and instantiate its universal maps rather than recreating it.
The QT.5 Rogers regulator now has a native conditional interface; instantiate
its three concrete branch laws from Polylogarithms rather than substituting an
assumed five-term equation. The next QT.5 geometric step needs the ordered cusped
triangulation/peripheral/strong-flattening supplier, as the table records.
Do not restore a comment-only inventory as evidence of elaboration. Use the
accepted input for exhaustive target/name tracing; this checkpoint has changed
no mathematical verdict there. Only after all layers meet §20 should metadata
be added and the package submitted as complete.

## Sources and validation inherited from PR #8235

This run read the current GeometricTopology and
OperatorTheory/SelfAdjointSpectralTheory roadmaps and suggested files, and the
actual smooth-link, isotopy, slope and framed-Markov library statements.
TauCetiRoadmap advanced from `dea8191cc6047d6142a65872ebce6eeeb841a29b`
during this run; neither inspected owner directory changed at the final commit
above. The reviewed library catalogue has no ArithmeticQuantumTopology row.
PR #8222 records its SemisimpleAlgebras/GrothendieckEulerForms reads;
PR #8192 records its earlier geometric/spectral audit.
The inherited checkpoint records rereading the input's 24 baseline declaration
statements in the supplied pinned sources, including the total Bochner integral, ordinary Hopf structure,
rigid/braided category APIs, cyclotomic positivity, framed braid boundary,
Schwartz/Fourier and pointwise-dual tempered distributions. Source locators in
the README are retained from the accepted input; this run does not claim a
fresh full audit of all seventeen papers.

Public source reads inherited from PR #8154: Andersen–Kashaev arXiv:1109.6295v2, specifically
Definition 15 and Appendix A, with the selected-integral/steepest-descent loci
in §12; Habiro arXiv:math/0509039v2, the framed-link/Kirby loci.
PDF SHA-256: AK `cbbac2dcec624a2a541fb770f312a5bd2a6051fe79f3ae7cd02a7d19ab9ba24d`;
Kirby `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416`.
Only own-word mathematics appears in the repository. No restricted source was
needed; scratch PDFs/texts are not retained.

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticQuantumTopology.json`:
  **0 errors, 0 warnings**, unchanged input.
- Final `lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`:
  **exit 0, 0 errors, 237 warnings**, all `declaration uses sorry`. Available memory
  was 106 GB before the final check. Mathlib's build commit is the exact pinned
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Only `lean-check` was used.
- Exact rational action/domain/denominator/sign checks: **79,812 passed**,
  over all 52 determinant-one integer matrices with entries in [−2,2] and all
  31 reduced rationals r/s with −5≤r≤5 and 1≤s≤4, excluding the two poles.
  Each checks the Mobius denominator product, action composition and additive
  λ formula. **239,436** complex factor compositions passed for
  (v,κ)=(0.37+0.2i,0), (−0.4+1.1i,3/2), (0.2−0.1i,−3/4), at relative/absolute
  tolerance 5×10⁻¹². The small S/T cases and the incorrect dropped-denominator
  value 3/2 are separate controls. These are finite checks, not proofs of the
  remaining `sorry` declarations.
- PR #8222 recorded exact-rational completion/twist checks: **1,311 passed**,
  at v=2, 3/2 and 3, color pairs m,n=0,…,6, precisions 1,…,9 and even-color
  parameters p=0,…,8. They check the product formula, tail ideals, prime/tilde
  rescaling, twist inverses modulo each tail, even-character values and
  vanishing, and the nonpointwise product. These are finite specialization
  checks, not proofs or execution of the `sorry` obligations.
- PR #8210 recorded **606** finite-color generator, divided-power, tensor and
  trace checks; this run retains those declarations without rerunning its
  now-deleted scratch script.
- README assertion audit: the same 106 unique target anchors plus 8 layer
  anchors, in their original order; all original 221 API names and 169 test
  names retained; updated source locators and size checked. Only the
  procedural application paragraph and the cocycle target's explanation change.
- `python3 research/blueprint/intake.py check-files` on the three changed files:
  **3 files, 0 problems**. Exact issue-output scope and `git diff --check` pass;
  only this job's permitted outputs and handoff are submitted.
