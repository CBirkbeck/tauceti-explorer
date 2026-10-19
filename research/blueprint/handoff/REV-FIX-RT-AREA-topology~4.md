# REV-FIX-RT-AREA-topology~4: reconcile scope before another worker run

Refs #6521. Codex, `codex-waB1gJ`, 19 October 2026;
branch `codex-waB1gJ-review-topology-fixes`, input
`02e5b6234120d209864ffe0796ba11042c07d8bd`.
Bot [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6256730699).
This session authored neither the fixes nor the plans and claimed no second job.

The [report](../reviews/REV-FIX-RT-AREA-topology~4.md) contains all 27 finding
verdicts, public-source URLs/locators and fresh validation of all seven packet
and suggested-file pairs. The three issue-listed review objects are updated,
with each complete predecessor review appended once to history. Clarified
the parent HB formal/analytic Gaussian comparison and the
precision/covariance normalization, with a negative-precision example. Added
a QSeries central-element acceptance check and two corresponding suggested
examples. Every other mathematical payload and every pre-existing Lean
declaration is unchanged. P /7 and HB /11 are accepted within the bounded ownership/export review; QSeries /13 remains
needs_changes for the inconsistent reader multiplier. Earlier whole-plan
reviews and gaps remain in force.

## Blocking scope discrepancy

The live issue, re-read after claim confirmation, names three packets and
three suggested files plus the report. `queue.json` requires **seven packets,
seven suggested files and the report, 15 outputs**. The actual unchanged
`issues.deliverables_complete` returns false because four packets still name
their separate whole-plan reviewers. A needs_changes verdict is allowed and
does not cause this blocker.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names, plus your own scratch space.” Requested authorization to include the
eight omitted queue paths and two readers below; no answer arrived. The
maintainer must update the live issue or expressly authorize those edits.
Do not repeat a metadata-only checkpoint before resolving this. Do not
remove queue outputs, alter the predicate or change labels to force completion.

All omitted paths below are relative to `research/blueprint/`:

| Packet | Suggested file |
|---|---|
| packets/Polylogarithms--P.2.json | suggested/Polylogarithms--P.2.lean |
| packets/ArithmeticQuantumTopology.json | suggested/ArithmeticQuantumTopology.lean |
| packets/HabiroNahmSeries--HB.4.json | suggested/HabiroNahmSeries--HB.4.lean |
| packets/HabiroNahmSeries--HB.10.json | suggested/HabiroNahmSeries--HB.10.lean |

Reader paths: `readmes/QSeriesPartitionsAndMockModularForms.md` and
`readmes/HabiroNahmSeries.md`. The exact unapplied patch below preserves
the concrete remaining edits; no
scratch artifact or downloaded source is needed.

## Exact work after authorization

1. Add `Polylogarithms:P.2/hyperbolic-volume` to the direct prerequisites of
   `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`. Its statement
   already imports that formula. Check for a reverse path before adding the
   edge. Retain the separate manifold-volume, extended-lift and period/sign
   comparisons and the G4/G5 gaps.
2. In the QSeries reader's `QM.5/kontsevich-quantum-modular` statement and
   ambient hypotheses, replace the global inverse-eta assertion by inverse
   eta for `c != 0` or `d > 0`, and **minus** inverse eta for `c=0,d<0`.
   The negative control has been added to the packet and suggested file;
   synchronize it in the reader: `j_(3/2)(-I,x)=i`, corrected epsilon is `-i`,
   so the slash factor is 1; the naive inverse produces -1. The packet and
   Lean already carry this convention. Reassess the bounded /13 verdict after
   synchronization; preserve codex-jnfi6H's separate whole-plan objections
   in REV-QSeriesPartitionsAndMockModularForms~2 (#6469).
3. In the HB reader's `HB.8/identification-theorem`, correct GSWZ v2 Theorem
   3's introduction locator from p.13 to **printed p.14, equation (38)**.
   Also synchronize the formal-Gaussian statement, normalization proof step
   and tests with the explicit positive-definite analytic comparison now in
   the parent packet; the new test uses precision -1 to distinguish the
   purely formal bracket. Keep Theorem 8 pp.35–36, the coefficient ring
   `Q[zeta]((x))[[t]]` and
   the coprime auxiliary-order restriction inherited from equation (126).
4. Record bounded fix-review objects in all four omitted packets, reviewer
   `independent-review-REV-FIX-RT-AREA-topology~4`, actual new date/session.
   Append each entire prior review, including its checked array, once to
   `reviewHistory`. Do not replace a whole-plan audit with an alleged new one:

   | Packet | Bounded disposition and qualifications to preserve |
   |---|---|
   | Polylogarithms--P.2 | Accept /7. Preserve its accepted 14-node audit, 2 gaps/3 requests. The analytic Milnor target does not construct ideal regions, signed integration or regulator calibration. |
   | ArithmeticQuantumTopology | Needs_changes /1–/16 until its geometric/comparison obligations are addressed. Preserve the **accepted** 106-node whole-plan audit by codex-qw7qpA (REV-ArithmeticQuantumTopology~2), 8 gaps/19 requests. Add only the concrete premise above unless a further correction is established. |
   | HabiroNahmSeries--HB.4 | Accept qualified /11 export. Preserve its accepted 13-node audit, 3 gaps/1 request. Retain positive definiteness, odd coprime orders, strong cancellation-safe remainder, branch choices, coefficientwise Kummer and rational-data normalization gaps. |
   | HabiroNahmSeries--HB.10 | Accept qualified /11 export. Preserve its accepted 14-node audit, 5 gaps/3 requests. Keep finite étale scalar change, specified K3 lift, tame-kernel primes, restricted orders, HB.9 local-section/arbitrary-rank gluing inputs, global-line/completion and cohomology comparison gaps. |

The parent HB export also explicitly retains HB.8 refined-Gaussian prefactor
and uniform-t-regularity gaps, HB.9 Kummer/gluing obligations and HB.4
coefficientwise descent. Do not erase these because the signatures compile.
No further suggested-file edit is currently required. The parent HB and
QSeries files now contain their new diagnostic examples; the four omitted
suggested files elaborate unchanged. The proposed QT edge has no reverse
path in the known node-prerequisite graph (37,080 node IDs, 30 supplier-closure
references); retain the separately requested stage-level geometric inputs.

## Fresh validation and current owners

All seven canonical packets pass `scripts/check_blueprint.py`: zero errors
and warnings with the declaration index. Nodes/gaps/requests remain
P 75/19/21; HB 109/22/9; QSeries 537/24/27; P.2 14/2/3;
QT 106/8/19; HB.4 13/3/1; HB.10 14/5/3.
All seven suggested files elaborate serially through `lean-check`, exit 0,
with only sorry warnings: respectively 462, 442, 1493, 52, 65, 31 and 28.
Memory was checked before each invocation. No compiler is left running.
The exact Mathlib pin was verified in the shared build. Every file imports
only Mathlib; elaboration makes no new Tau Ceti baseline claim.

After the authorized edits, run the packet/file checks and the actual predicate:

```python
import importlib.util
import json
from pathlib import Path
spec = importlib.util.spec_from_file_location("issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
job = next(j for j in json.loads(Path("research/blueprint/queue.json").read_text())["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-topology~4")
assert len(job["outputs"]) == 15
assert issues.deliverables_complete(job)
```

Current roadmap HEAD `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti HEAD `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Audit pins stay Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read current owners before planning anything further: DG forms/orientation,
Stokes and abstract boundary already exist as plans; DG 3.3 homogeneity is
scoped to connected finite-dimensional boundaryless manifolds; AT already
states relative homotopy for arbitrary based pairs; GT 7 consumes the shared
connection and existing Riemannian measure. Stronger isotopy/collar/gluing
and ideal-region contracts remain requests. Never run Lake in the read-only
trees or edit upstream/generated atlas outputs in this job.

## Concrete continuation patch — apply only after authorization

The patch below was generated against this checkpoint and passes
`git apply --check`. It is **unapplied** because all three paths are excluded
from the live issue. It adds the direct tetrahedron-formula prerequisite,
synchronizes both readers and adds no node or gap. It does not alter the
four separate whole-plan reviews: after authorization, preserve each whole
review once in history and record the bounded disposition in the table above.
Then update this report, re-run the seven packet checks and the actual
completion predicate. The two suggested files changed by this checkpoint
already elaborate with the new diagnostics.

```diff
--- a/research/blueprint/packets/ArithmeticQuantumTopology.json
+++ b/research/blueprint/packets/ArithmeticQuantumTopology.json
@@ -2928,4 +2928,5 @@
         "ArithmeticQuantumTopology:QT.5/extended-rogers-regulator",
         "Polylogarithms:P.2/bloch-wigner-descent",
+        "Polylogarithms:P.2/hyperbolic-volume",
         "K3BlochGroups:V.4/suslin-exact-sequence",
         "K3BlochGroups:V.6/suslin-lift-fibre"
--- a/research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md
+++ b/research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md
@@ -9067,7 +9067,7 @@
 ### Kontsevich's function is a quantum modular form of weight 3/2

-**Theorem** (`QM.5/kontsevich-quantum-modular`). The function φ(x) = e^{πix/12}F(e^{2πix}) on ℚ satisfies φ(x + 1) = e^{2πi/24}φ(x) and φ(x) + (ix)^{−3/2}φ(−1/x) = g(x) (x ∈ ℚ, x ≠ 0), where (ix)^{−3/2} is the principal branch and g : ℝ → ℂ is C^∞, real-analytic on ℝ ∖ {0}, with g^{(n)}(0) = (−πi/12)ⁿc_n (c_n the Glaisher numbers). Equivalently, φ is a quantum modular form of weight 3/2 on SL₂(ℤ) (quantum-modular-form, lower boundary branch) with multiplier ε determined by ε(T) = e^{−2πi/24} and ε(S) = e^{2πi/8}, the inverse of the η-multiplier; for general γ the period function is real-analytic except at γ⁻¹∞.
-
-Ambient hypotheses: The multiplier ε on the generators T = (1 1; 0 1), S = (0 −1; 1 0); the general γ follows by quantum-modular-cocycle, ε being the multiplier system of weight 3/2 inverse to that of η for the stated lower-boundary slash convention (QM.1/dedekind-eta-multiplier)..
+**Theorem** (`QM.5/kontsevich-quantum-modular`). The function φ(x) = e^{πix/12}F(e^{2πix}) on ℚ satisfies φ(x + 1) = e^{2πi/24}φ(x) and φ(x) + (ix)^{−3/2}φ(−1/x) = g(x) (x ∈ ℚ, x ≠ 0), where (ix)^{−3/2} is the principal branch and g : ℝ → ℂ is C^∞, real-analytic on ℝ ∖ {0}, with g^{(n)}(0) = (−πi/12)ⁿc_n (c_n the Glaisher numbers). Equivalently, φ is a quantum modular form of weight 3/2 on SL₂(ℤ) (quantum-modular-form, lower boundary branch) with multiplier ε determined by ε(T) = e^{−2πi/24} and ε(S) = e^{2πi/8}, ε(γ)=v_η(γ)⁻¹ for c≠0 or d>0, and ε(γ)=−v_η(γ)⁻¹ for c=0,d<0; hence ε(−I)=−i and ε(−I)j_{3/2}(−I,x)=1. For general γ the period function is real-analytic except at γ⁻¹∞.
+
+Ambient hypotheses: Use the lower-boundary multiplier ε(γ)=v_η(γ)⁻¹ for c≠0 or d>0, and ε(γ)=−v_η(γ)⁻¹ for c=0,d<0. Its values at T and S are the stated inverse eta values, but its value at −I differs from the naive inverse. The corrected factor satisfies QuantumCocycleCondition and acts trivially at −I.

 Sources: [zagier-strange](#reference-zagier-strange), §6, Theorem, printed pp. 958–959; [zagier-qmf](#reference-zagier-qmf), Example 3, printed p. 10.
@@ -9080,4 +9080,6 @@
 - Consistency check with Kontsevich's asymptotics: φ(1/k) = e^{2πi(3−k)/24}k^{3/2} + Σ c_n(−πi/(12k))ⁿ/n! + o(1) as k → ∞.
 - Zagier's 2010 account (Quantum modular forms, eq. (26)) prints this law with |x|^{3/2} and ∓i^{1/2}; the correct form is the one here (see the source issues).
+
+- At gamma = -I the lower-boundary factor of weight 3/2 is i. The corrected multiplier epsilon(-I) = -i gives total slash factor 1. Using the unmodified inverse eta multiplier i would instead give -1, so it fails this central-element check.

 Proof or comparison obligations: Character and multiplier-system versions of the Bringmann–Rolen theorem; Zagier and Lawrence–Zagier asymptotic source comparisons.
--- a/research/blueprint/readmes/HabiroNahmSeries.md
+++ b/research/blueprint/readmes/HabiroNahmSeries.md
@@ -1034,5 +1034,5 @@
 **Construction** · `HabiroNahmSeries:HB.4/formal-gaussian-integration` · [packet](../packets/HabiroNahmSeries.json)

-For a symmetric invertible N x N matrix Lambda over a Q-algebra R, the formal Gaussian bracket <f>_Lambda of f(w,h) in R[[w, w^3 h^{-1}, h]] is exp((h/2) sum_{i,j} (Lambda^{-1})_{ij} d/dw_i d/dw_j) f evaluated at w = 0 (GSWZ (eq:bracket)). In one variable <sum_j c_j w^j>_Lambda = sum_l (2l - 1)!! c_{2l} (h/Lambda)^l. GZ's operator I_Lambda (GZ (13), (14)) is the same operator at h = 1 on functions whose x^n-coefficients have valuation tending to infinity: I_Lambda[sum_j c_j x^j] = sum_l (2l - 1)!! c_{2l} Lambda^{-l}. On polynomials both agree with the normalised Gaussian expectation (HB.4/gaussian-moments); the construction itself uses no measure theory.
+For a symmetric invertible N x N matrix Lambda over a Q-algebra R, the formal Gaussian bracket <f>_Lambda of f(w,h) in R[[w, w^3 h^{-1}, h]] is exp((h/2) sum_{i,j} (Lambda^{-1})_{ij} d/dw_i d/dw_j) f evaluated at w = 0 (GSWZ (eq:bracket)). In one variable <sum_j c_j w^j>_Lambda = sum_l (2l - 1)!! c_{2l} (h/Lambda)^l. GZ's operator I_Lambda (GZ (13), (14)) is the same operator at h = 1 on functions whose x^n-coefficients have valuation tending to infinity: I_Lambda[sum_j c_j x^j] = sum_l (2l - 1)!! c_{2l} Lambda^{-l}. On polynomials the two formal operators agree at h = 1. After specialization to real symmetric positive-definite Lambda, their value agrees with the normalised Gaussian expectation (HB.4/gaussian-moments); the formal construction itself uses no measure theory and requires no positivity.

 **Hypotheses and conventions.** Lambda is symmetric and invertible over a Q-algebra; the rationals must be present because of the factorials. The argument f lies in the completed ring R[[w, w^3 h^{-1}, h]], the exact domain in which the odd-order terms are controlled; the cube in w^3 h^{-1} is what makes the expansion converge formally. This is the formal, all-orders object; no analytic Gaussian integral is claimed, and the comparison with the analytic integral is an asymptotic statement proved separately in the Poisson-summation node.
@@ -1044,5 +1044,5 @@
 3. Prove the one-variable closed formula with the double factorials, by computing the action on a monomial.
 4. Prove linearity, the behaviour under a linear change of variables, and the translation rule used in the source's periodicity argument, namely that translating w by h changes the integrand in the way that the shift of the congruence class does.
-5. Record the normalisation against the analytic integral, so that the prefactor (2 pi)^{-N/2} det^{-1/2} of the Gaussian density never appears twice.
+5. For real positive-definite Lambda, distinguish precision Lambda from covariance Lambda^{-1}: the unnormalised Gaussian integral is (2 pi)^{N/2} det(Lambda)^{-1/2}, and the probability density has prefactor (2 pi)^{-N/2} det(Lambda)^{1/2}. The formal bracket is already normalised, so neither prefactor is inserted a second time.

 **Direct inputs.** `mathlib:PowerSeries`, `mathlib:MvPowerSeries`, `mathlib:MvPolynomial`, `mathlib:Matrix.det`.
@@ -1066,5 +1066,6 @@
 - **`odd_vanishes`** (degenerate): The bracket of w^3 is zero.
 - **`diagonal_factorises`** (characterisation): For diagonal Lambda the bracket of f(w_1) g(w_2) is <f>_{Lambda_11} <g>_{Lambda_22}.
-- **`gz_normalisation`** (compatibility): I_Lambda[f] equals <f>_Lambda at h = 1 for polynomial f, and equals the normalised Gaussian integral of f (HB.4/gaussian-moments).
+- **`gz_normalisation`** (compatibility): For polynomial f, I_Lambda[f] equals <f>_Lambda at h = 1. Comparison with a normalised real Gaussian integral additionally assumes Lambda real symmetric positive definite (HB.4/gaussian-moments).
+- **`negative_precision_is_formal_only`** (degenerate): For the one-variable precision Lambda = -1, the formal bracket at h = 1 sends x^2 to -1. The function exp(x^2/2) is not integrable on R, so this example cannot instantiate the positive-definite analytic comparison.
 - **`off_diagonal_second_moment`** (computation): For Lambda = (2 1; 1 2), <w_1 w_2>_Lambda = h (Lambda^{-1})_{12} = -h/3.

@@ -3223,5 +3224,5 @@
 - Theorem 8 uses neither Theorem 6 nor Theorem 7 nor Lemma 2.6: it is upstream of all three.

-**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 8, eq. (163), p. 35. The refined form (restricted to m' prime to m). [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 3, eq. (38), p. 13. The form in the introduction. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, eqs. (164)-(166), pp. 35-36. Only N = 1 is written out.
+**Sources.** [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 8, eq. (163), p. 35. The refined form (restricted to m' prime to m). [gswz](https://arxiv.org/pdf/2412.04241v2): Theorem 3, eq. (38), printed p. 14. The form in the introduction. [gswz](https://arxiv.org/pdf/2412.04241v2): Proof of Theorem 8, eqs. (164)-(166), pp. 35-36. Only N = 1 is written out.


```
