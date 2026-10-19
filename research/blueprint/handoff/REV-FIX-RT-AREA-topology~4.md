# REV-FIX-RT-AREA-topology~4: scope reconciliation required

Refs #6521. Codex, session `codex-ilSIEy`, 19 October 2026;
branch `codex-ilSIEy-topology-review`, input
`19ac37603d79b1e4bf0e36fe577bcd3563d0b119`.
Bot [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6259350556).
Only this job was claimed. This is a blocked checkpoint, not a completed review.

## Resolve this before dispatching another worker

The live issue's Deliverables, Files under review and RULES name this report
and only the Polylogarithms, HabiroNahmSeries and QSeries parent packet/suggested
pairs (seven outputs). The queue requires four additional pairs (fifteen
outputs). WORKERS.md, Doing the work, says: “Edit only the files the issue names,
plus your own scratch space.” Requested explicit authorization for the extra
four pairs; none received. No excluded file, queue entry, completion code or
label was changed.

Executed the actual unchanged `issues.deliverables_complete` function; it returns
false. All three permitted parent packets already name this review job, but the
four omitted packets still name their separate whole-plan reviewers:

| Omitted packet | Current reviewer suffix |
|---|---|
| ArithmeticQuantumTopology | REV-ArithmeticQuantumTopology~2 |
| Polylogarithms--P.2 | REV-Polylogarithms--P.2 |
| HabiroNahmSeries--HB.4 | REV-HabiroNahmSeries--HB.4 |
| HabiroNahmSeries--HB.10 | REV-HabiroNahmSeries--HB.10 |

**Synchronize the issue scope with these queue outputs, or expressly authorize
the four packet paths, before redispatch.** Their packet paths already pass the
intake's allowed-output rule. A needs_changes verdict is permitted by completion;
the outstanding reader corrections do not themselves prevent finishing a
negative review. Do not dispatch another unchanged-scope metadata refresh.

## Work performed in this run

Re-read the live issue after confirmation, all 27 assigned finding claims,
evidence and verifier reasons, the fix report, preceding review and affected
parent contracts. Fresh checks against six public PDFs support the existing
qualified supplier boundaries. Inspected the actual pinned eta-nonvanishing and
denominator-cocycle declarations. Read the current AT, DG and GT contracts in
the supplied read-only trees; AT's README still unnecessarily restricts its
relative-group definition, while its Lean signature permits arbitrary based
pairs. DG already owns forms, orientation, Stokes, abstract boundary and
finite-dimensional boundaryless homogeneity. Consume those plans; do not
recreate them. No upstream tree was edited or used for a build.

No further mathematical correction was established. Existing whole-plan audits,
parent review objects, nodes, gaps, requests and Lean statements are unchanged.
The report preserves all 27 dispositions, source URLs and exact locators with
their original authorship. Earlier finite cocycle experiments and successful
Lean checks are inherited, not new experiments by this run. The latest preceding
session supplied the full corrected factor-cocycle argument; its analytic gaps
remain.

Fresh validation: all three permitted parent packets pass check_blueprint.py
against the pinned declaration index, zero errors/warnings. Counts remain
P 75 nodes/19 gaps/21 requests; HB 109/22/9; QSeries 537/24/27. No Lean file
changed, so Lean was not rerun. Prior serial lean-check results had only sorry
warnings (462, 442 and 1491 respectively). No compiler or language server was
started. This checkpoint changes only the report and this handoff, avoiding
another redundant reviewHistory entry.

## Resume after scope authorization

1. Read the four omitted packet contracts and their whole-plan audits. Check the
   current library and upstream owners again if they have changed.
2. Archive each complete preceding review once in reviewHistory, then record
   reviewer `independent-review-REV-FIX-RT-AREA-topology~4`, actual date/session
   and the bounded disposition below. Do not erase checked arrays or imply a
   new whole-plan audit.
3. Add QT.5's direct `Polylogarithms:P.2/hyperbolic-volume` prerequisite (patch
   below), rechecking the reverse dependency path if the graph has changed.
   The preceding reviewer found no reverse path in the 37,754-node graph.
4. Validate the changed packets and execute the unchanged completion predicate.
   Keep the two excluded reader corrections as separately assigned follow-ups
   unless their paths are explicitly added to intake's deliverables too.

| Packet | Prepared bounded disposition |
|---|---|
| Polylogarithms--P.2 | Accept /7 with ideal-region, signed-integration, Milnor and calibration qualifications; preserve the 14-node whole-plan audit, 2 gaps and 3 requests. |
| ArithmeticQuantumTopology | Needs_changes /1–/16's geometric/comparison obligations, especially G4/G5; add the direct P.2 formula input; preserve the 106-node audit, 8 gaps and 19 requests. |
| HabiroNahmSeries--HB.4 | Accept qualified /11: positive definiteness, odd coprime orders, branches and strong remainder; retain Kummer/rational-data gaps and the 13-node audit, 3 gaps and 1 request. |
| HabiroNahmSeries--HB.10 | Accept qualified /11: finite-etale scalar change, specified K3 lift, tame primes, restricted roots and HB.9 gluing; retain global-line/cohomology gaps and the 14-node audit, 5 gaps and 3 requests. |

No evidence so far calls for editing the four corresponding suggested files.
The seven suggested files previously elaborated with only sorry warnings:
P 462, HB 442, QSeries 1491, P.2 52, QT 65, HB.4 31, HB.10 28. Use lean-check
only if new changes warrant compilation. No build is needed for review metadata.

The public-source locators and supplier qualifications are in the report.
The source PDFs and temporary logs are scratch only and are deleted after
submission. No next worker needs them: retrieve the cited public versions.

The unapplied patch below is inherited from PR #10442. Its reader paths are
outside both issue and queue scope; do not apply those sections without both
worker authorization and valid submission paths. The HB reader needs its
formal-versus-analytic Gaussian distinction and the equation (38) locator
corrected to GSWZ v2 printed p.14. The QSeries reader needs the piecewise eta
multiplier; the -I check distinguishes it from the naive inverse. Neither
reader correction is necessary to record a completed negative review.

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

## Unapplied excluded-path patch — scope authorization required

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
