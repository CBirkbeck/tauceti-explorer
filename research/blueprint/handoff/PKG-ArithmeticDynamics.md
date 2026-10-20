# PKG-ArithmeticDynamics — completed package

Codex, session `codex-oE9sRI`, 2026-10-20. Issue #10756 was claimed with
`/claim Codex — codex-oE9sRI`; github-actions confirmed the claim. This is the
package author's handoff, not an independent package-review verdict.

## Deliverables and coverage

- `research/blueprint/packages/ArithmeticDynamics/README.md`: the seven-layer
  roadmap, in upstream form, with exact hypotheses, suppliers, locators,
  definition APIs, discriminating Checks, examples and source corrections.
- `research/blueprint/packages/ArithmeticDynamics/Suggested.lean`: 502 lines of
  representative signatures, light real-bodied definitions and proved examples.
- `research/blueprint/packages/ArithmeticDynamics/metadata.toml`: `math.NT`.

The four accepted input packets contain 490 distinct targets: 415 in the parent,
31 in DY.2, 23 in DY.3 and 21 in DY.6. Their layer distribution is
39/29/86/91/66/65/114. All 490 have stable anchors in the README. One is now an
import under Exact supplier contracts rather than a second owned theorem:
Strassmann's general restricted-series bound belongs to
EffectiveDiophantineMethods, ED.4 §4.26. Consequently Layer 6 has 113 owned target
subsections. The dynamical interpolation application still uses that bound.

All 726 named API items and 412 named Checks from the input are retained. Each of
the 106 definition/construction families has at least three Checks. The README
retains the mathematical content of the 47 supplier requests, 24 construction
gaps, and 63 source corrections. These are explicit future mathematical
obligations, not claims that the underlying libraries already supply them.

The README is the complete roadmap. The Lean file states only results easily
typed on existing carriers. In particular there are no admitted analytic lines,
moduli spaces, adelic completions, dynatomic curves or preimage trees. Its closing
comment lists every definition/construction family, including those that cannot
yet be declared. All examples are proved; all 26 admissions are theorem bodies.

No packet, assembled reader, earlier suggested file, upstream checkout or library
file was modified. No source passage was placed in these deliverables.

## Existing work and ownership

Read the current ConformalMapping and Completed/EffectiveBounds READMEs in full
as models, with their suggested signatures, and inspected the relevant current
AlgebraicCurves and PolynomialGaloisGroups contracts. Checked the reviewed
library-coverage audit and the current upstream roadmap/library checkouts before
packaging the targets.

- Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
- Current TauCetiRoadmap inspected: `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Current Tau Ceti inspected: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Read the pinned statements underlying the assembled audit's 459 distinct
baseline references. A separate check file importing Mathlib and the needed
Tau Ceti modules successfully elaborated a `#check` for every one of these names.
This establishes name resolution as well as the local statement inspection;
it does not establish that stronger supplier contracts have been implemented.

The nine roadmaps newer than the atlas snapshot, and the four named Completed
roadmaps, were searched by mathematical subject and statement content. The
focused follow-up reads included OperatorTheory's Banach/Hilbert and Markov
contracts, DifferentialGeometry's Laplacian contracts, and RealAlgebraicGeometry's
resultant/subresultant contracts. None supplies spherical normality, the general
Banach almost-periodic decomposition, generic measure entropy, or the specific
dynamical constructions merely because it contains related words.

Current Tau Ceti's
`RingTheory/PowerSeries/Weierstrass/Preparation.lean`,
`TauCeti.PowerSeries.IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq`, supplies
restricted-series preparation; ED.4 §4.26 owns the general distinct-zero bound.
The current p-adic PowerSeries file alone evaluates arbitrary integral series at
p-divisible arguments and is not a replacement for that closed-unit-disc theorem.
The accepted Strassmann target is therefore represented as an import only.

The pinned elliptic canonical height is half the native limiting x-height.
Current Tau Ceti's `EllipticCurve/CanonicalHeight/Basic.lean` uses the raw limit.
The README and Lean consistently use the pinned convention. At a future port,
the absolute elliptic height is the current raw height divided by `2[K:Q]`,
whereas it is the pinned height divided by `[K:Q]`. This migration must not be
performed by simply changing the import.

## Corrections to the accepted plan

These repairs are in the package only. The accepted packets remain untouched.

1. Critically marked coarse moduli is not a fine parameter space with a universal
   family. For example `z^3` retains the automorphism `z ↦ -z` even after marking
   its two critical points. Bifurcation and PCF-parameter equidistribution use a
   chosen finite branched cover `S_d → M_d` with an actual family and critical
   sections, as in DeMarco–Mavraki–Ye §2.1, rather than a falsely universal coarse
   quotient. Coarse moduli and the cover are separate targets.
2. A constant Legendre x-coordinate generally lifts only after a finite quadratic
   extension, not over the original rational function field. Nonpreperiodicity
   of a constant mark outside `0,1,∞` uses generic degree growth; the infinitude
   argument distinguishes that fact from the later height-variation theorem.
3. The finite-support adelic-measure/metric correspondence is restricted to its
   model-admissible metric class. General adelic completions are a separate
   supplier construction; Yuan's general equidistribution statement is retained.
4. Projective inversion exchanges `0` and infinity; `[2:1]` maps to `[1:2]`.
   Its affine reciprocal formula requires a nonzero coordinate.
5. Passing to an iterate in the canonical-height scaling theorem requires
   positive iterate index. The identity iterate gives no expanding Tate limit.
6. The executable enumeration adapter now takes a supplied computable exact field
   carrier, realization and certified operations. The retired CN.0 reference did
   not supply these. ED.0's finite height candidates are not silently promoted to
   an implementation of every number field.
7. General adelic intersection and variational inputs are requested from
   ArithmeticHeightsAndIntersectionTheory AH.0–AH.4 with exact outputs. AH.5 mixes
   general quasi-projective equidistribution with a dynamical extension depending
   on DY.4; citing that stage wholesale would create a cycle. The README separates
   the general theorem needed before DY.4 from the dynamical extension built here
   after the Tate limit. The neighboring packet still needs this stage split.
8. ConformalMapping Part II V.0 supplies disc characteristic/Jensen/first-main
   theory, not spherical omitted-value normality. Normality is an additional
   explicit supplier contract. Similarly ProbabilisticAndDynamicalMethods Part
   II's TO stages do not supply generic partition entropy: the additional PM.4
   contract states finite-partition entropy, Shannon–McMillan–Breiman,
   disintegration and ergodic decomposition.
9. Local energy and Laplacian statements retain the place weights, sign, factor
   one-half, and potential-domain restrictions. Uniform potential convergence
   does not imply measure-valued Laplacian convergence without the stated
   variation control. Arbitrary continuous functions are not asserted to have
   Radon Laplacians; type-I atom exclusion still permits the Gauss atom.
10. Strassmann's endpoint example is corrected at `p=2`: use `5^z-1`, with the
    exponential injective on `4Z_2`. For odd `p`, `(1+p)^z-1` works. A binomial
    Mahler expansion is not a monomial power series; `3^z` at `p=2` has a parity
    factor and needs separate analytic residue classes.
11. Uniform-boundedness degree monotonicity has the explicit direction
    `UBC(N,d,D') ⇒ UBC(N,d,D)` for `D≤D'`; the degree-zero extension is vacuous,
    and the degree-one negative control is fully parameterized.
12. Process fields, source-issue identifiers and malformed nested fragment links
    were replaced by mathematical prose and local links. Source corrections are
    individually anchored; their mathematical content, including conditional
    rank assumptions and published errata, remains present.

## Adversarial mathematics pass

Read all target statements/hypotheses, all definition/construction Checks, and
the API lists by layer. Compared the kept Lean signatures with the corresponding
README targets. The following records the principal instances; routine checks
also included zero iterates, constant/linear maps, empty finite sets, infinity,
characteristic and denominator guards throughout.

| Statements/conventions | Instances and negative controls | Outcome |
| --- | --- | --- |
| Layer 0: iteration, homogeneous maps, moduli | Empty/identity orbit; formal degree zero; resultant of coordinate swap; characteristic-zero critical divisor; `z^3` with automorphism `-z`; inversion at zero/infinity. | Kept positive-degree/characteristic guards and resultant sign; separated coarse quotient and parameter cover; repaired inversion check. |
| Layer 1: Tate limit, heights, elliptic adapter | Expansion factor one; zero iterate; fixed degree versus unbounded algebraic degree in Northcott; doubling and divisor `2(O)`. | Positive iterate required; native-to-absolute factor `[K:Q]` and elliptic factor two explicit. |
| Layer 2: local dynamics, measures and entropy | Pure Frobenius; root-of-unity multiplier; good reduction with classical empty Julia set and Berkovich Gauss support; `(z^2+1)/(3z)` over `Q_3` versus `C_3`; `(z^p-z)/p`, including `p=2`. | Separability/field/topology hypotheses retained; Gauss atoms allowed; spherical and entropy suppliers expanded; no arbitrary continuous Radon Laplacian claim. |
| Layer 3: dynatomic geometry and rational cycles | Formal period two at `c=-3/4`; `n=0`; Morton parameter `tau=0,-1`; elliptic denominator; genus formulas for `n=1,...,10`. | Formal/exact period kept distinct; all denominator restrictions stated; period-three parametrization does not imply one-cycle uniqueness without the elliptic argument. |
| Layer 4: adelic heights and energies | Native radius `exp(qB)`; constant metric shift with unchanged curvature; unit-circle and Gauss-radius measures; repeated singleton small sets; atomic diagonal and factor one-half. | General metric class separated; weights and signs fixed; genericity/repetition conditions and regularization retained. |
| Layer 5: iterated preimages | Level zero; linear map; inseparability; critical index `n` versus `d^n`; nonmonic quadratic discriminant recursion; `x^2-x-1`. | Nonmonic coefficient powers checked; characteristic-zero generic image retained. Jones's example really has irreducible second iterate and reducible third iterate; no false stability inference. |
| Layer 6: families and orbit intersections | Multiplication `n=1` versus `n≥2`; 2-torsion translation; Legendre branch marks; empty/zero Cassels marks; ramified versus unramified Cohen rings; `p=2`; singleton progression of step zero; positive-characteristic sparse time sets. | Lattès degree `n^2` and height factor two; supplied coefficient map preserved; whole-field embedding precedes mark evaluation; dyadic interpolation repaired; DML characteristic-zero hypotheses retained. |
| Ritt and synchronized intersections | Monomial case, positive common iterate, affine synchronization, `gamma^s=1` and the geometric-sum exponent. | Checked against Ghioca–Tucker–Zieve Proposition 6.3; no cross-index intersection substituted for synchronized time. |

Exact rational/integer computations verified the two dynatomic genus formulas
for `n=1,...,10`, obtaining `(g0,g1)` equal to
`(0,0),(0,0),(0,0),(0,2),(2,14),(4,34),(16,124),(32,285),(79,745),(162,1690)`.
These are finite checks of the displayed formulas, not proofs of the formulas.
The Lean Morton identities and examples are proved over the stated carriers.

## Public source checks

Read the actual cited passages, including rendered pages when OCR omitted the
mathematics. The following additional sample was selected reproducibly with
`random.Random(10756).sample` from the 490 distinct targets. Locators refer to the
cited versions in the README bibliography; no excerpt is reproduced here.

| Sample target | Passage inspected and qualification |
| --- | --- |
| PCF-parameter equidistribution | Baker–Hsia Theorem 8.15, p.27; Favre–Rivera-Letelier Theorem 5, p.8; DeMarco–Mavraki–Ye §2.4, pp.9–10. The moduli version needs the marked parameter cover. |
| Pairing with the standard measure | Fili Corollary 8, p.8; Petsche–Szpiro–Tucker Proposition 16, equation (25), p.15. Checked normalization and weights. |
| Legendre local energy symmetries | DeMarco–Krieger–Ye Proposition 2.3, p.11. The inversion comparison uses the common map after a deck involution, as explained in Correction 52. |
| Bad reduction over a nonclosed field | Benedetto Definition 4.5, p.32, and Theorem 1.6, p.5; independent lift/resultant calculation. Retained the residue-field correction. |
| Height of an adelic metrized line bundle | DeMarco–Krieger–Ye §2.5, pp.9–10; Yuan §3.1, p.33; Petsche–Szpiro–Tucker Proposition 8, p.10. Kept the metric-class restriction. |
| Canonical measure is a probability | Baker–Rumely Proposition 3.36 and its proof, p.18. It invokes the potential-theory input; reading the proposition does not discharge that supplier. |
| Absolute-height bounds for forms | Call–Silverman Theorem 3.1, p.178, and equation (33), p.184, including rendered formulas. The section-dependent constant is explicit. |
| Rigid Lattès finiteness | Milnor Theorem 5.1, Corollary 5.2 and Lemmas 5.4–5.5, pp.15–18. Distinguished integer-derivative flexible families. |
| Period form | Morton–Silverman Theorem 4.1, equation (21), p.100 (rendered original page); Flynn–Poonen–Schaefer §2, equation (1), p.3. |
| Function-field height bound | Call–Silverman §4, p.183, and §1, pp.166–167. The specialization limit and a bounded-error theorem are separate. |
| Lech integral specialization certificate | Cassels pp.195–196, equations (2)–(5). This is a proof construction, not a separately numbered theorem. |
| Berkovich lift bounds | Baker–Rumely §3.5, p.17; DeMarco–Krieger–Ye §2.4, p.9. Converted the Laplacian sign explicitly. |
| Unicritical candidate box | Hutz §4.1 before Lemma 7, p.13; Poonen remarks following Corollary 1, p.8. Distinguished periodic and finite-orbit assertions. |
| Rational preperiodic enumeration over Q | Hutz §1, p.5, including Proposition 3 and the Nullstellensatz bound discussion. Retained the coefficient-height correction rather than extrapolating the example. |
| Reduction of periodic points | Silverman AWS Proposition 24(c), p.19. Reduction-period divisibility is not the stronger prime-power bound. |

Other direct checks included Call–Silverman Theorem 1.1/Proposition 1.2;
Morton's period-three formulas and elliptic reduction; Morton 1996 Theorems 11
and 13 (rendered pp.339,342); Zieve Theorem 50 (rendered p.38); Poonen's author
errata; Stoll's rank-conditional result; Doyle–Krumm Algorithm 4, §4.3;
Ghioca–Tucker–Zieve Proposition 6.3; Bell–Ghioca–Tucker's interpolation and
spreading-out route; Cassels and its addendum; Favre's hybrid Theorems A/B;
Lyubich Theorems 7–9 and §7 Lemma 1; and Jones's instability example, §5, p.26.
This is not a claim to have read every cited source or reconstructed every proof.

Unverified original proof access for the independent reviewer:

- Silverman's 2012 moduli book, p.103: the bounded-representative comparison is
  stated via Ingram Lemma 13 and remains the explicit construction contract
  `gap-dy6-5`. No uncleared book copy was used.
- Tate's 1983 elliptic-surface bounded-variation proof: its statement is checked
  via Call–Silverman §4, pp.183–184, and Ingram's introduction. The proof remains
  `gap-dy6-8`; specialization alone does not prove an `O(1)` error.
- The Favre–Rivera-Letelier 2007 corrigendum was not available for a full-text
  check. The package preserves the specific independently stated corrections
  from the accepted plan without claiming a fresh reading of that corrigendum.
- No claim is made to have checked all 72 input bibliography entries. In
  particular, original Silverman GIT proofs and the polynomial-classification
  originals need the explicit construction contracts and their cited routes;
  public secondary statements do not constitute proof reconstruction.

The maintainer's library index was consulted. No restricted book, source file or
passage was copied into the repository. No suspicious instruction in untrusted
source text was encountered.

## Validation and next step

The final `lean-check` exited 0 against the pins, with exactly 26
`declaration uses sorry` warnings and no other warning or error. The separate
459-name baseline check also exited 0. Lean checks establish elaboration, not
the truth of admitted theorems. No Lean server or background build was started.

Final mechanical checks:

- `python3 scripts/check_blueprint.py` on all four input packets: exit 0,
  0 errors and 0 warnings in each packet.
- `python3 scripts/check_sorry_data.py` on the package Suggested.lean: exit 0.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  exit 0, 4 files and 0 problems.
- Inventory comparison: all 490 target anchors (with the input's `followup-`
  prefix normalized away), 726 API names and 412 Check names present;
  106 definition/construction sections, minimum three Checks each.
- 643 explicit anchors, no duplicates and no unresolved local fragment links.
- 502 Lean lines, 26 theorem declarations and 14 proved examples.
- `git diff --check`: exit 0; staged path inventory restricted to this job.

Nothing remains for this package-writing job after submission. The next worker
is its independent package reviewer. Review the corrections and flagged source
access above, rerun `lean-check`, and inspect the explicit construction contracts;
do not infer that this package closes the 24 inherited gaps or implements the
heavy mathematical objects. The neighboring AH stage split and corrected CN.0,
ConformalMapping and entropy supplier assumptions need maintainer reconciliation
in their own files. Scratch source downloads and temporary checks are removed
when the pull request opens; this note is the durable record.
