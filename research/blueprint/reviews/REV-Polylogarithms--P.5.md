# Independent review of Polylogarithms P.5

Accepted with corrections on 2026-10-06 by Codex, session `codex-Opogcl`,
job `REV-Polylogarithms--P.5`, issue #6405. The author of #6390 was Codex
session `codex-s8nMxh`; this reviewer did not contribute to that work.

This is acceptance of a complete planning pass at target granularity. P.5
remains **planned**, with nine explicit gaps; all declarations remain
implementation **unchecked**. No source comparison, analytic foundation or
regulator is claimed to have been formalised. Every node has an independent
verdict in the packet's `review.checked` list.

| Item | Reviewed result |
| --- | --- |
| Nodes | 33: 4 definitions, 10 constructions, 10 theorems, 7 comparisons, 2 applications |
| Node verdicts | 21 verified, 12 corrected, 0 added, 0 unverifiable |
| Parent declarations imported | 30, retained by id |
| Pinned baseline declarations | 16 confirmed; 0 removed or replaced |
| API entries / unit tests | 63 / 42 |
| Planets | 6 |
| Coverage | 1 planned stage, 0 closed stages |
| Gaps / requests | 9 / 7; one redundant request removed |
| Source issues | 4 confirmed, 1 added and confirmed; final IDs E25–E29 |

## Corrections

1. **Analytic-cycle currents:** named El Mir's extension theorem, with
   positivity, locally complete pluripolar singular locus and finite mass,
   in the proof. Demailly III Theorem 2.7 explicitly invokes this theorem;
   local integrability alone does not establish closedness. Added its locator
   and recorded the absent P.5 local-current foundation inside the existing
   analytic gap. R09.7 still supplies algebraic characteristic-zero resolution,
   rather than resolution of arbitrary analytic spaces.
2. **Current resolution:** restored orientation to the real-manifold statement,
   as required by the preceding complementary-test-form current carrier.
   Complex manifolds have their canonical orientation.
3. **Poincaré–Lelong:** restored the exact hypothesis that the meromorphic
   function does not vanish identically on any connected component. Named
   Demailly III Theorem 2.10/Corollary 2.11 and their normal-current/order-zero
   hypotheses in the singular-locus argument; added this missing interface to
   the same analytic gap and added the source locator.
4. **Admissible Chow locus:** made the H-avoidance condition componentwise;
   the zero cycle satisfies it vacuously, consistent with the degree-zero test.
5. **Mixed Wang forms:** replaced the misplaced excerpt and expanded the
   locator to equation (6.14) and Lemma 6.16, whose proof gives both boundary
   signs. **Mixed regulator:** corrected “Proposition 6.16” to “Lemma 6.16”.
6. **Curve symbol/Chern comparison:** added Nekovář §7.5, p.24, to the source
   locator for the explicit representative. The invariant derivation uses
   π₁(dlog f)=i darg f; it agrees with the accepted ER.2 corrections rather
   than inheriting the author copy's missing-i notation.
7. **Weight-three motivic comparison:** corrected the Theorem 2.1 locator to
   printed pp.6–7 (the theorem is on p.7). Removed the Borel R.4 request:
   its actual `regulator-real-isomorphism` statement already includes K₃(F)
   through localization. A real isomorphism gives rational injectivity here.
   The proof still applies only to number fields and still records the
   inherited P.3 construction gap.
8. **Weight-three pairing:** corrected the equation range to (26)–(28).
   **r/Wang comparison:** changed “Definition 5.10” to equation (5.10) and
   included Remark 5.12, which explains the sign convention.
9. **Wang integration:** corrected the ordinary-degree formula at m=0,r=2p:
   the top Deligne cochain has ordinary degree 2p, preserved by W₀=1. The
   r+m−1 formula applies outside that exceptional case. Strengthened the
   existing degree test with p=1,r=2,m=0; synchronized the suggested manifest.
10. **Regulator chain comparison:** corrected the commuting-square proof to
    use the second (cycle) and third (base) summands in the fixed
    (support,cycle,base) order. The negative Green term is unchanged.
11. **Source bookkeeping:** changed the G05 URL to the accessible published
    PDF hostname, with the same SHA-256. Renumbered the four original P.5
    source issues from E22–E25 to E25–E28: the accepted P.2 packet already
    uses E22–E24. Added and confirmed E29, the preprint's coefficient-field
    misprint described below. No other packet was edited.

The suggested file's corresponding statement/test comments and missing
local-current explanation were updated. No new mathematical node, baseline
substitute, API entry or planet was necessary at target granularity.

## Sources and mathematical checks

All eight public PDFs were retrieved independently and their hashes agree
with the packet. Every node locator/excerpt and its hypotheses were checked.
Page images independently confirm G05 p.21, BFT pp.8 and 20, and D96 printed
p.21. The input's broader `readSections` metadata describes the author's
reading; this review's source coverage is the passages below.

| Source | Independently checked passages |
| --- | --- |
| [Goncharov, published JAMS 2005](https://ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf) | §2.10, equation (38), Proposition 2.14, pp.21–22; §3.1 cycle spaces, face/vertex maps and incidence, pp.22–23 |
| [Burgos Gil–Feliu–Takeda, arXiv v1](https://arxiv.org/pdf/0909.5296v1) | §§2, 4, 5 and 6, pp.3–21: current twists, support simple, Wang polynomial/residues and entire comparison route through Theorem 6.18 |
| [Goncharov, Deninger paper, arXiv v2](https://arxiv.org/pdf/alg-geom/9512016v2) | §1.2 p.1; curve complex and Theorem 2.1 pp.6–7; Theorems 3.3–3.4 and §3.7 pp.20–23 |
| [Goncharov, explicit regulator maps](https://arxiv.org/pdf/math/0003086) | §2 low-weight functions and n=3 formula, pp.3–6; proof of relation descent, p.20 |
| [Demailly, author manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf) | I §2.A–D pp.13–20 and §3.E pp.28–29; III §2.A–C pp.139–144 |
| [Burgos, thesis](https://www.icmat.es/miembros/burgos/files/tesis.pdf) | II §3 pp.73–78; Definition 4.2, Theorem 4.3, Lemma 4.5 and the comparison/residue proof pp.79–83 |
| [Schneider, published chapter scan](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf) | Higher Chern product and character convention, §4 p.28 |
| [Nekovář, author copy](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf) | §§7.3–7.5 pp.23–24: cup product, unit regulator, tame kernel and curve representative |

The BFT publisher returned HTTP 403; the D96 publisher returned an HTML access
page. Both were retried independently. Findings against those papers concern
only the hashed arXiv texts, and publisher collation remains open. The arXiv
version lists and a focused search of arXiv, Springer and the MPIM archive did
not identify a correction to the newly recorded coefficient-field slip.

The decisive convention checks are:

- **Currents:** raw form evaluation is ∫α∧φ; BFT uses test-form-first order
  and the dimension-dependent (2πi)⁻ᵈ normalization. The cycle normalization
  is (2πi)⁻⁽ᵈ⁻ᵖ⁾. Degree-one d_D is −2∂bar∂, so the positive raw
  Poincaré–Lelong formula produces the negative BFT divisor boundary of
  −log|f|. Pullback of arbitrary currents is limited to submersions.
- **Green forms:** a support class is required; the complement equation alone
  allows the wrong residue. Burgos's strict r<2p and r<2p−1 bounds and
  exceptional-divisor computation give the stated integrability and Green
  equation. The quotient's principal pair has zero curvature. Constants are
  killed in GreenCH¹(Spec C), after imposing principal relations.
- **Wang forms:** T₁(u)=u and the explicit T₂ coefficient fix the unaveraged
  alternating sum and factorial. The source's r includes (−1)ᵐ relative to
  the parent. Cubical zero/infinity signs and simplex face signs match the
  residue-first convention. The mixed boundary is δ+(−1)ⁿ∂.
- **Auxiliary simple:** support degree q+1 makes both g₁a₁ and ρa₁ land
  in degree q+1. The cycle goes in the second coordinate. Substitution into
  ψ=Pc−Green+φ cancels the support and face terms with the printed top
  and lower-degree Green product signs.
- **Weight three:** G00 has Lhat₂=iD and the opposite α, giving r₃(2)=−ρ₂.
  Integration by parts yields ∫D(f)darg g∧ω=−∫log|g|α(1−f,f)∧ω,
  hence the parent factor −4/3; the same factor holds for antiholomorphic ω.
  No symbol-cycle condition is needed for this termwise calculation.
- **Elliptic Fourier scalar:** writing μ for Haar mass one,
  ∂χγ=(π/A)conjγ·χγ dz and dz∧dbarz=−2iA μ. The logarithmic
  coefficient is −A·div(f)(χ₋γ)/(2π|γ|²). Finite convolution, followed by
  negating all three indices, gives iA³/(4π²) times K₃(D,F,H).
  The parent pairing therefore gives −iA³/(3π²). Constants cancel for
  symbol cycles. This verifies the target scalar, without supplying the
  missing analytic product-regularization theorem.
- **Summability:** two large lattice vectors are comparable in size R; if
  the smallest has size s, a summand is O(R⁻³s⁻²). There are O(R²s²)
  terms per dyadic block and O(log R) small-vector blocks. The resulting
  dyadic sum of O(log R/R) converges. Scaling gives conjλ/|λ|⁶,
  distinguishing this weight-three two-index kernel from a weight-two one.

| Final source issue | Verdict and scope |
| --- | --- |
| E25, formerly E22 | Confirmed: BFT preprint equation (6.15) omits n from the mixed target degree |
| E26, formerly E23 | Confirmed: D96 preprint's ordinary ∫ω∧conjω=1 is impossible; explicit area and regularization/collation obligations retained |
| E27, formerly E24 | Confirmed: published G05 prose calls the codimension-p and codimension-(p−1) loci divisors |
| E28, formerly E25 | Confirmed: BFT preprint support grading and cycle slot are inconsistent with the displayed differential |
| E29, added | Confirmed: D96 preprint Theorem 3.4 gives C(E) functions but puts their relation in Λ³Q(E)*, without a Q-model; the general-complex theorem needs C(E) |

## Baseline and ownership

The following statements, including ambient assumptions, were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` in the existing shared build.
The packet uses no Tau Ceti declaration as a baseline citation; its Tau Ceti
pin remains `f790474821cf4256814db967cb154e7af3d0c369`.

| Baseline citation | Confirmed interface |
| --- | --- |
| `TestFunction` | Smooth compact support contained in an open chart |
| `TestFunction.ext` | Pointwise extensionality |
| `TestFunction.continuous_iff_continuous_comp` | Fixed-compact continuity criterion, with scalar towers and locally convex target |
| `Distribution` | Continuous real-linear dual of real chart tests |
| `Distribution.delta` | Evaluation, zero outside the open set |
| `Distribution.lineDerivCLM` | Negative precomposition with the test derivative, with order constraint |
| `Distribution.ofFun` | Integral embedding for locally integrable functions; zero otherwise |
| `ExteriorAlgebra` | Existing exterior algebra of a module over a commutative ring |
| `ExteriorAlgebra.ι_sq_zero` | Square-zero generator |
| `ExteriorAlgebra.ι_add_mul_swap` | Degree-one anticommutator zero |
| `CochainComplex.mappingCone` | Homotopy cofiber with the requisite biproduct hypotheses |
| `Complex.exp_add` | Character multiplication identity |
| `IsZLattice` | Spanning lattice with separate discreteness assumption |
| `Multipliable` | Generates additive `Summable` by `to_additive`; the packet records this alias explicitly |
| `ExteriorAlgebra.map` | Algebra map induced by a coefficient linear map |
| `Fin.append` | Ordered tuple concatenation |

The reviewed library audit's P.5 absent targets are accounted for by the parent
imports, new nodes and explicit requests/gaps. No existing chart distribution,
exterior algebra or mapping cone is planned again. Supplier statements were
read for P.1/P.2/P.3, S.4, T.3, Borel R.4, C0/C5, R09.2/R09.7 and M.4/M.6/M.8.
S.4's ordinary Chow formula does not supply the required CHᵖ(X,1) graph
comparison. Hilbert/Quot schemes do not provide a Chow parameter space.

Both confirmed findings RT-AREA-ktheory-2/7 and /24 are handled correctly:
P.5 owns general η and its curve comparison, ER.2 specializes them, and the
universal Deligne complex/Chern/products/norm interface is requested once
from an early M.8 prefix. The unsplit M.8 depends on late R.7/D.2 work; no
whole-M.8 edge or invented prefix id is introduced. The accepted ER.2 packet
was read to check normalization and the direction of the handoff.

All targets have a named route through new nodes, the 30 parent imports, or
precise outstanding contracts. Local node dependencies are acyclic. The
strong reciprocity statements retain their conjectural status. The six new
planets name central mathematics; assembly must reconcile them with the
parent's planets and presentation groups before publishing a combined layer.

## API, prototype and checks

Every definition/construction has a useful API and at least three tests.
Together the tests distinguish escaping supports, forbidden current products,
cycle multiplicities, inadmissible faces, absent support residue, principal
quotients, factorials, mixed degrees, auxiliary slots/signs and the elliptic
scale exponent. The Wang ordinary-degree test now includes its top exception.

The suggested file contains concrete chart, coefficient, graded-group and
lifted-lattice prototypes. Missing global signatures are explicitly named
with their absent carriers; no condition is replaced by an arbitrary
Prop-valued field. β is a graded inclusion here: its global quasi-isomorphism
is still omitted pending the support diagram. The reader document is the
roadmap, and these signatures are not an implementation.

Validation passed:

- Packet checker: zero errors and zero warnings.
- Errata checker on a scratch wrapper: all five findings and version metadata
  valid.
- `lean-check` on the final suggested file: exit 0, only 32 intentional `sorry`
  warnings, at the exact Mathlib pin; memory available exceeded 20 GiB.
- Independent name coverage, local dependency acyclicity, source-issue ID
  uniqueness and deliverable/whitespace checks.

No review work remains. The orchestrator's outstanding decisions/work are to
split the early M.8 foundation; schedule the C5/C0 and P.5 local-current
foundations; provide R09.2 Chow/singular-incidence work and M.4's top-two graph
comparison; retain the inherited transfer/P.3/integral-rigidity gaps; finish
the raw-parent model dictionary; and obtain rigorous Fourier regularization
and publisher collation. These are the nine recorded gaps, not unreported
assumptions used to accept a theorem.

The reader `research/blueprint/readmes/Polylogarithms--P.5.md` is outside this
review's deliverables and was not edited. A later authorized synchronization
must apply the twelve node corrections and corresponding locators; remove
its Borel request; include the explicit El Mir/support-theorem gap and top
ordinary-degree test; use the accessible G05 URL; rename old source issues
E22–E25 to E25–E28 and add E29. Its explanation of the early M.8/ER ownership
already matches the confirmed findings. The reviewed packet and suggested
file carry the corrected mathematical statements.
