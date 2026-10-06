# Independent review: Metaplectic automorphic forms, MP.8

**Job:** REV-MetaplecticAutomorphicForms--MP.8 · **Issue:** #449 · **Reviewer:** Codex — codex-4ye5ct · **Date:** 2026-10-06 · **Verdict:** `needs_changes`.

The independent review is complete. Clear errors are corrected in the [packet](../packets/MetaplecticAutomorphicForms--MP.8.json) and [suggested Lean file](../suggested/MetaplecticAutomorphicForms--MP.8.lean). The [reader](../readmes/MetaplecticAutomorphicForms--MP.8.md) still repeats contradictory gamma factors, a false chart substitution, the wrong mixed root modulus, transformed rather than original newform coefficients, and wrong supplier assignments. Issue #449 authorizes only the packet, Lean file and report; a revision must authorize and synchronize the reader before acceptance. This reviewer did none of the original plan, written by session codex-KMZtHy.

The review adds two precise proof gaps instead of asserting repaired analytic proofs: the global compact transition/uniform majorant, and a nonzero even Laplace pushforward. Existing unread special-function, JPSS, Maass and distinct Annals passages remain gaps. This is a finished target-level review, not a checkpoint or implementation. The packet remains `complete`, with MP.8 `planned` and zero closed stages.

## Scope and changes

There are 85 nodes (37 verified, 32 corrected, 16 with unverified proof/comparison leaves), 107 API items, 104 definition/construction tests, six planets, 28 checked baseline declarations, 15 supplier requests and nine gaps. Every definition/construction retains at least three tests. No node is added: the missing work is recorded at the existing target-level nodes and their gaps. The six planets are the similitude group, actual double cover, genus-two theta series, Jacobi Eisenstein series, Novodvorsky transform and two-variable polar formula; the theta definition's planet was renamed from “expansion” to “series.”

The substantive corrections are:

1. **Gamma normalization.** The evaluated integrals on p.565 determine the positive-sign pair `((s−r+n)/2,(s+r+n+1)/2)` and negative-sign pair `((s−r−n−1)/2,(s+r−n)/2)`. Both the printed p.562 normalizer and the planner's flattened sign expression disagree. The native sketch now uses a single explicit pair function, with two sign examples. Finite torus components need not retain the original SO(2) weight-k condition. Raw Jacquet agreement is restricted to `Re r>1/2, Re(s−r)>3/2`; the holomorphic continuation cone stays larger.
2. **Global compact coefficients.** The global divisor is `φ₁(q)=det(Im q)`, with divisibility on all of U(2). At `X=diag(0,−2), z=1`, its value on `κ(X)κ_z` is `−1/√10`, while the chart value at `X(z)=diag(0,3)` is `+1/√10`. An actual compact transition is required on the negative branch. The native rotated kernel now evaluates the actual product and includes the full W prefactor; it no longer hides the false chart identity inside a placeholder. The remaining uniform bound proof is a gap.
3. **Rank-zero nonvanishing.** Nonzero restriction in z does not imply a nonzero Laplace transform in `Δ_z=√(1+z²)`: odd functions cancel. The proof now explicitly requires a compatible finite K-type with a nonzero even pushforward, weighted integrability and phase-aligned localization after weight projection/divisibility.
4. **Local arithmetic.** Corrected the mixed congruence modulus to `p^min(a,d)` from the preceding matrix parametrization. The published table itself is unchanged. The new `p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1` test has six solutions. The unramified-series sketch now accepts `Sp(a,b,d)` and forms `Sp(a,a,d)−Sp(a,a−1,d)`, keeping its first exponent fixed. Restricted matrix Möbius inversion specifies N-adapted upper Hermite divisor representatives, diagonal modulo N, before transporting `D₁₂≡0 mod N`.
5. **Newform and spectral parameters.** First-cusp `a(n)` belongs to the original normalized f, as p.547 defines and the p.585 unfolding recovers; transformed cusp coefficients remain in P. Both cusp coefficient sketches now use `C(s)` instead of one fixed C on the left of an s-dependent expansion. The underlying normalized inducing exponent stays `ν=s−2` and reflection `4−s`.
6. **Suppliers and native reuse.** AF.5 supplies the classical-to-automorphic GL₂/Q dictionary; AF.1 supplies smooth globalization/compact convolution; GL₂ R16.2 supplies the finite conductor vector. GN.0 contains lattices and covolumes, so its Gaussian request was removed. The two-dimensional theta norm uses checked scalar Mathlib Gaussian theorems, Cholesky, Fubini and the determinant Jacobian. Good-prime recurrence stays in ModularForms layer 2, while coefficient growth is requested from layer 7. Arbitrary-cusp coefficients come from layer 6, not MP.7.
7. **Accuracy of suggestions and locators.** Added the native Siegel-action value equation. Recorded the omitted U(2)/GSp/Iwasawa stabilizer signatures and the root-table prototype's restriction to the fundamental `h=a=0` row. Corrected misplaced §1 slash/action citations and §3 convergence/reflection/Novodvorsky/tau pages, extended the cusp-one proof locator through p.582, and replaced nonexistent D=0 equation references by the unnumbered p.599 display. No source claim is established merely by a successful Lean elaboration.

## Source edition and independently adjudicated issues

Read the full [published Inventiones scan](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), pp.543–618, including surrounding hypotheses and proof passages; rendered formulas were inspected where OCR loses signs, transposes or fractions. Its SHA256 is `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c`, independently matching the packet. [Springer's DOI metadata and references](https://link.springer.com/article/10.1007/BF01233440) confirm the published identity. The separate [Annals 131 paper](https://annals.math.princeton.edu/1990/131-1/p03), DOI 10.2307/1971508, was checked only at publisher metadata; its omitted Bessel proof remains unread. GR 3.384.9/9.237, JPSS §8.3.3 and Maass §11/p.160 have not been independently obtained, and are not treated as checked proofs.

| Finding | Independent result |
| --- | --- |
| E-MP8-2, p.548 stabilizer | Confirmed: `2I₄` fixes `iI₂` but is not orthogonal; the full positive-similitude stabilizer has the positive scalar factor. |
| E-MP8-3, p.550 completion/Fricke | Confirmed against p.543 and p.551: original conductor M, not auxiliary N. The level-one weight-12 Fricke example distinguishes the formulas. |
| E-MP8-4, p.568 strip | Confirmed: `x₃=x₄=0` makes `φ₁=(1+x₁²)^−1/2`; `−i` belongs to the printed one-sided region. Use the bounded strip. |
| E-MP8-5, pp.602–603 transform argument | Confirmed by Proposition 6.1 with `n₂=N⁻¹` and the variable substitution into (8.4). Both (8.1) and the printed left side of (8.3) omit the scale; the evaluated p.603 boundary terms carry it. The old reason claiming (8.3) already correct was repaired. |
| E-MP8-6, p.562 normalizer | Added and confirmed from the cancellation of the inverse gamma factors in (3.26)–(3.27), matching the p.565 explicit normalized expressions. Exact GR analytic identities remain a separate gap. |
| E-MP8-7, p.569 chart identity | Added and confirmed: constant coefficient refutes the blanket boundary zero; global determinant coefficient refutes the negative branch even away from the boundary. This affects the proof, with no claim to refute the main nonvanishing theorem. |
| E-MP8-8, p.592 mixed modulus | Added and confirmed: preceding matrix parametrization gives min(a,d); six-solution counterexample and 2,016 finite checks agree with the unchanged table. |
| E-MP8-9, p.582 S₀ quotient | Added and confirmed: period-one symmetric-X coordinates quotient D by C. Quotienting only by NC repeats the three-dimensional translation classes N³ times. Congruence and primitivity are preserved by the finer shifts. The packet already had D mod C. |

Correction searches on 2026-10-06 inspected the Springer metadata/reference page, [Bump's papers/correction links](https://math.stanford.edu/~bump/), [his Stanford publication entries](https://profiles.stanford.edu/daniel-bump), and [Friedberg's home/research navigation](https://sites.google.com/bc.edu/solomon-friedberg/), plus exact-title erratum/correction searches and BFH gamma/7.10 searches. The obsolete www2.bc.edu research URL failed. No relevant correction was located; this is neither an exhaustive absence nor a priority claim. Each finding records that scope and its own `confirmed` verdict.

No finding is made against Proposition 3.10's printed `y₂>C` or Proposition 6.2's `(y₁y₂)^s`: visual rechecks confirm those are already correctly printed. The published root table is also retained. These checks prevent mistaking OCR or preliminary readings for errata.

## Baseline, closure and ownership

All 26 input baseline statements and the two added Gaussian statements were read at the exact commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular `Matrix.unitaryGroup` is an abbreviation, corrected from `def`; the scalar Gaussian declarations are in the root namespace, not `Real`. Native Sp/semidirect products do not supply the similitude cover or the Heisenberg group automatically. PID Smith normal form does not impose ordered divisibility in its statement, and the packet retains the required binary content argument.

Read the AUDIT-15 MP.8 entries and the checked source-tree matches. Existing native quadratic forms, positivity, unitary matrices, Gaussian/theta primitives and Smith data are reused; no audited existing theory is re-planned. Read upstream CompactGroups and InductionRestriction for density/style, ModularForms layers 2/4/6/7 for exact contracts, and MP.0–8, AF, AL, AS, GN and GL₂ supplier descriptions and available packet boundaries. Requests describe interfaces needed from future work, not declarations already implemented.

The confirmed RT-AREA-automorphic-1/20 and its independent verification assign general Jacobi theory to MP.6 before MP.7. Both packet and reader already make that ownership proposal: MP.8 owns only the BFH genus-two/similitude specialization; QM.1 is a consumer. No MP→QM or MP→AC consumer-to-supplier edge is added. Actual campaign restructuring remains with the orchestrator. The nine gaps and 15 requests are the leaves of the planning graph; none of the continued Eisenstein/Fourier conclusions is a seed field. Slice `MeromorphicOn` claims do not substitute for joint meromorphy.

The checked baseline contracts are:

| Declaration | Module | Contract checked |
| --- | --- | --- |
| `mathlib:QuadraticMap` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Native quadratic maps with degree-two scaling and a bilinear companion. |
| `mathlib:QuadraticForm` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Native scalar-valued quadratic maps; over Z on Z² these encode integral binary quadratic polynomials, hence half-integral symmetric matrices. |
| `mathlib:QuadraticMap.ext` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Quadratic forms are equal if their values are equal on every vector. |
| `mathlib:QuadraticMap.congr_fun` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Equality of quadratic maps implies equality at every input. |
| `mathlib:QuadraticMap.map_smul` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | A quadratic map sends a·x to a² times its value at x. |
| `mathlib:QuadraticMap.linMulLin` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The product of two linear forms is a native quadratic map. |
| `mathlib:QuadraticMap.linMulLin_apply` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The product quadratic map evaluates to the product of the two linear-form values. |
| `mathlib:QuadraticMap.proj` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | The native coordinate quadratic form x↦x_i x_j, used in mixed-term tests. |
| `mathlib:QuadraticMap.proj_apply` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | Coordinate quadratic-form evaluation is x_i x_j. |
| `mathlib:QuadraticMap.sum_repr_sq_add_sum_repr_mul_polar` | `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean` | A quadratic map expands in diagonal basis values and unordered off-diagonal polar terms, without assuming that 2 is invertible. |
| `mathlib:QuadraticMap.toBilin` | `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean` | An ordered basis gives an upper-triangular bilinear representative over Z; symmetry and division by 2 are not required. |
| `mathlib:QuadraticMap.toQuadraticMap_toBilin` | `Mathlib/LinearAlgebra/QuadraticForm/Basis.lean` | The quadratic map of the ordered-basis bilinear representative is the original map. |
| `mathlib:dotProductBilin` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | The coordinate dot product packaged as a bilinear map; fixing R∈Z² gives the linear functional x↦R·x. This declaration is in the root namespace. |
| `mathlib:Int.ModEq` | `Mathlib/Data/Int/ModEq.lean` | Congruence of integers modulo an integer, including negative and zero moduli. |
| `mathlib:Int.modEq_iff_dvd` | `Mathlib/Data/Int/ModEq.lean` | R_i≡R′_i modulo 2a iff 2a divides R′_i−R_i, giving the integral shift parameter. |
| `mathlib:mul_left_cancel₀` | `Mathlib/Algebra/GroupWithZero/Defs.lean` | Cancel a nonzero left factor; applied in Z to 4a and 2a. |
| `mathlib:Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean` | Boundary only: matrices satisfying AJAᵀ=J, as a submonoid. This is neither a similitude group nor its double cover. |
| `mathlib:SemidirectProduct` | `Mathlib/GroupTheory/SemidirectProduct.lean` | Boundary only: the native group semidirect product from a specified homomorphism into automorphisms; it does not construct the Heisenberg group or its similitude action. |
| `mathlib:Matrix.PosDef` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | Hermitian matrix with strictly positive finitely supported quadratic evaluation; over finite real indices this gives positive dot-product evaluation on every nonzero vector. |
| `mathlib:Matrix.unitaryGroup` | `Mathlib/LinearAlgebra/UnitaryGroup.lean` | Native unitary matrices as a submonoid with a group structure; specializes to U(2) without re-planning compact-group structure. |
| `mathlib:jacobiTheta₂` | `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean` | The native two-variable classical theta sum Σ_n exp(2πinz+πin²τ); the genus-two diagonal test reduces to two such sums. |
| `mathlib:ArithmeticFunction.moebius` | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean` | Integer-valued scalar Möbius function: (−1)^cardFactors for squarefree n, otherwise zero; μ₂ uses it on positive Smith coefficients. |
| `mathlib:Submodule.exists_smith_normal_form_of_le` | `Mathlib/LinearAlgebra/FreeModule/PID.lean` | For submodules N≤O of a finite free module over a PID, obtains bases with each N-basis vector a_i times an O-basis vector. The statement does not itself impose a_i∣a_j; the binary content/product argument fixes the needed ordered invariants. |
| `tauceti:TauCeti.choleskyEquiv` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Equiv.lean` | Equivalence of real positive-definite matrices with lower triangular matrices of positive diagonal, with LLᵀ as Gram map and uniqueness. Reverse the two coordinate indices to obtain the BFH upper-triangular Q with Y=QQᵀ. |
| `mathlib:Matrix.toLin'` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Native linear equivalence from a finite matrix to its coordinate linear map, evaluating as multiplication of the matrix by a column vector. |
| `mathlib:MeromorphicOn` | `Mathlib/Analysis/Meromorphic/Basic.lean` | Pointwise meromorphic-at predicate on a set in a nontrivially normed field. It supplies scalar one-complex-variable slices, not a two-complex-variable meromorphic API. |
| `mathlib:integral_gaussian` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` | Root-namespace real Gaussian integral ∫ exp(−b x²)=√(π/b); positive b gives the analytic formula used after Cholesky/Fubini. |
| `mathlib:integrable_exp_neg_mul_sq` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` | Root-namespace integrability of exp(−b x²) for b>0, needed before Gaussian Fubini and change of variables. |

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/MetaplecticAutomorphicForms--MP.8.json` reports **0 errors, 0 warnings**. A scratch-only `errata-v1` wrapper with the same eight `sourceIssues` and `sourceVersions`, named for `MetaplecticAutomorphicForms`, passes `scripts/check_errata.py`; that checker expects standalone errata schema rather than a part blueprint. `git diff --check` passes. Allowed paths and all 85 checked-node ids were checked explicitly.

`lean-check research/blueprint/suggested/MetaplecticAutomorphicForms--MP.8.lean` **elaborates with exit 0, zero errors and 316 warnings, all “declaration uses sorry.”** Memory was checked before compiling and exceeded the required minimum; only one compile was run at a time. Its imports are Mathlib-only, at the exact pinned Mathlib commit. Tau Ceti baseline declarations were checked separately at their exact pinned git object; this elaboration does not verify absent supplier interfaces or Tau Ceti implementations. All 104 packet test sketches have corresponding examples; the file also contains four inherited arithmetic examples and two new gamma-sign examples. No declaration's implementation status is promoted.

Direct enumeration compared the corrected finite congruence subtypes with every applicable published table row for p=3,d≤3 and p=5,d≤2, m∈{1,2}, r∈{0,1,2}, n₀∈{−5,…,5}, D≠0. It covers N₁/N₂ with 0≤a≤d+1 and N₃ in the a=b+1 range actually used by the local factor. **2,016 checks, zero mismatches.** The printed mixed modulus instead has 119 mismatches in the same sweep. This is finite evidence alongside the matrix derivation, not a proof for all primes/exponents or a claim about N₃ outside the tested range. The following reproduction retains the complete check without private scratch dependencies:

```python
from itertools import product

def chi(p,D):
 z=D%p
 return 0 if not z else (1 if any(x*x%p==z for x in range(p)) else -1)
def valuation(p,D):
 v=0
 while D%p==0:
  D//=p;v+=1
 return v,D

def count12(p,a,b,d,m,r,n):
 return sum((m*x*x)%p**a==0 and (2*m*x*y-r*x)%p**min(a,d)==0 and (m*y*y-r*y+n)%p**d==0 for x,y in product(range(p**a),range(p**d)))
def tab12(p,a,d,h,c):
 if d<=2*h:return p**((a-a%2+d-d%2)//2)
 if c==1:return 2*p**(h+min(a//2,h)) if a<=d else 2*p**(2*h+1)
 if d==2*h+1 and c==0:return p**(h+a//2) if a<=d else p**(2*h+1)
 return 0

def count3(p,b,d,m,r,n):
 return sum((m*x*x+r*x+n)%p**b==0 and (2*m*x*y+r*y-r*p*x-2*p*n)%p**b==0 and (m*y*y-r*p*y+p*p*n)%p**(d+1)==0 for x,y in product(range(p**b),range(p**(d+1))))
def tab3(p,b,d,h,c):
 if d<=2*h+1 and b<=2*h:return p**((d+d%2+b-b%2)//2)
 if c==1 and d>=2*h+2 and b<=2*h:return 2*p**(h+1+b//2)
 if c==0 and d==2*h+2 and b<=2*h:return p**(h+1+b//2)
 if c==1 and d>=2*h+2 and b==2*h+1:return 4*p**(2*h+1)
 if c==1 and d>=2*h+2 and b>=2*h+2:return 2*p**(2*h+1)
 if c==0 and d==2*h+2 and b==2*h+1:return p**(2*h+1)
 return 0
errors=[];total=0
for p,md in [(3,3),(5,2)]:
 for m in [1,2]:
  if m%p==0:continue
  for r,n in product(range(3),range(-5,6)):
   D=r*r-4*m*n
   if not D:continue
   v,Dp=valuation(p,D);h=v//2;c=chi(p,D//p**(2*h))
   for d in range(md+1):
    for a in range(d+2):
     got=count12(p,a,a,d,m,r,n);expected=tab12(p,a,d,h,c);total+=1
     if got!=expected:errors.append(('N12',p,a,d,m,r,n,D,h,c,got,expected))
   for d in range(1,md+1):
    for b in range(d):
     got=count3(p,b,d,m,r,n);expected=tab3(p,b,d,h,c);total+=1
     if got!=expected:errors.append(('N3',p,b,d,m,r,n,D,h,c,got,expected))
print('direct congruence cardinality checks',total,'mismatches',len(errors))
for e in errors[:30]:print(e)
```

## Required reader revision

Authorize the existing reader path in a revision, then synchronize its introduction, node statements/proofs, signatures, API/tests, supplier appendix, source-issue appendix and coverage list from the corrected packet. In particular:

- Replace AF.1 dictionary/GN.0 Gaussian assignments with AF.5, AF.1 smoothing, GL₂ R16.2 and the checked Gaussian baseline; move the coefficient-growth request to ModularForms layer 7.
- Replace the Weyl gamma normalizer and torus-component condition; distinguish raw Jacquet convergence from continuation.
- Describe the signed global compact divisor and actual rotated kernel, include the negative-branch test, and expose both new analytic proof gaps. Repair the even-pushforward nonvanishing argument.
- Correct first-cusp a(n) to original f and both extracted families to C(s); retain transformed cusp data only where actually used in P.
- Correct mixed root modulus to min(a,d), add the six-solution test, and retain the table. Specify all three exponents of Sp and change only its second exponent in the beta-difference. Add N-adapted divisor representatives.
- Synchronize corrected locators, native action API, honest signature omissions, theta-series planet name, 28 baseline entries, 15 requests, nine gaps and all eight independently adjudicated sourceIssues. Correct the old (8.3) explanation too.

Acceptance requires a reader consistent with the corrected packet and an honest plan for the exposed proof repairs; it does not require implementing the entire roadmap or pretending the recorded supplier/source gaps have been discharged.

## Per-node independent ledger

“Verified” concerns the checked target/input contract, not a Lean proof. “Unverifiable” marks the explicitly unestablished proof/comparison leaf. “Corrected” includes source locators or suggestion scope as well as mathematical changes. Every source locator and excerpt was checked against the published passage; every definition/construction API and test was read, including tests beyond the three-test minimum.

| Node (MP.8/) | Verdict | Independent check / limit |
| --- | --- | --- |
| `fourier-shift` | verified | Integral shift uses native quadratic maps; no division by 2 in Z. |
| `fourier-discriminant` | verified | Discriminant is 4aT minus the residue-vector square, with the cusp scaling retained. |
| `discriminant-shift` | verified | Expanded the shifted discriminant; quadratic and mixed terms cancel. |
| `residue-shift` | verified | Residue congruence is modulo 2a; nonzero a is needed to recover a shift. |
| `recover-quadratic` | verified | Recover T by canceling 4a only under the stated nonzero hypothesis. |
| `shift-parameter-injective` | verified | Recover the shift from the residue vector by canceling 2a. |
| `orbit-classification` | verified | Orbit classification combines equal discriminant with the exact coordinatewise residue congruence. |
| `unique-residue-lift` | verified | Unique bounded residue representative uses positive modulus and preserves the discriminant. |
| `coefficient-invariants` | verified | Coefficient invariants descend through the actual shift orbit, rather than assuming invariance as input. |
| `siegel-space` | verified | Native symmetric complex matrices with positive-definite imaginary part; real/asymmetric nonexamples distinguish the domain. |
| `positive-similitudes` | corrected | Positive multiplier and transpose-symplectic equation; native Sp is only the multiplier-one boundary. |
| `siegel-action` | corrected | Block action and determinant/multiplier factor; added the native-to-raw action value equation. |
| `similitude-cover` | verified | Actual continuous square roots and multiplication law; central sign distinguishes the double cover. |
| `compact-stabilizer` | corrected | Checked scalar 2I counterexample and Cholesky route; recorded the incomplete compact-stabilizer Lean signature. |
| `arithmetic-subgroup` | verified | Three integral block congruences match Γ; the lower-unipotent counterexample tests its level. |
| `bfh-slash` | corrected | Slash exponential and inverse-transpose W action match (1.1), not the previously cited locator. |
| `bfh-translation` | corrected | Translation character and integrality condition for composition match (1.2)–(1.5). |
| `genus-two-theta` | corrected | Genus-two theta residue sum has index a and two-dimensional lattice; diagonal test uses native jacobiTheta₂. |
| `quadratic-matrix` | verified | Integral quadratic maps correctly encode half-integral symmetric matrices without inverting 2 over Z. |
| `fourier-coefficient` | verified | Fourier extraction uses the two cusp period lattices and Lebesgue normalization. |
| `theta-pairing` | corrected | Theta torus measure has det Y Jacobian; Cholesky and two existing scalar Gaussian theorems supply the norm. |
| `coefficient-shift-analytic` | verified | Coefficient shift follows Jacobi translation and changes of variables; exact N powers preserved. |
| `theta-decomposition` | verified | Unique theta components and integral discriminant support match Proposition 2.2; convergence is a separate node. |
| `theta-fourier-transform` | verified | Checked positive inverse-W transform and negative finite Fourier-kernel sign in (2.12). |
| `theta-component-fourier-law` | verified | Finite S-matrix normalization and determinant-root phase agree with (2.7)–(2.8). |
| `bfh-jacobi-specialization` | corrected | General Jacobi space is imported from MP.6; the two BFH period-lattice specializations stay here. |
| `theta-components` | verified | Theta components have reconstruction and uniqueness APIs; their construction does not assert convergence as a field. |
| `theta-coefficient` | verified | Theta coefficient has the half-integrality guard and zero extension, tested at both cusps. |
| `bfh-seed` | corrected | Seed uses actual K-representation and normalized newform; conductor M differs from auxiliary N. |
| `induced-seed-family` | verified | I_s derives its y powers and covariance from the seed, without assuming Eisenstein analytic conclusions. |
| `jacobi-eisenstein` | verified | Jacobi Eisenstein family is an actual quotient sum; convergence and genuine spectral comparison are later targets. |
| `whittaker-functions` | verified | Checked complex-root branch, sign character and (y₁y₂)^(4−s)y₂^(k/2) prefactor in W. |
| `whittaker-majorant` | verified | The three majorant inequalities match Proposition 3.1 and are not replaced by a single vague large-s assumption. |
| `whittaker-initial-convergence` | corrected | Initial convergence uses genuine finite K-coefficients and Re s>2; corrected Proposition 3.2 page. |
| `jacquet-two-parameter` | corrected | Two-parameter normalization and specialization retain the π/Gamma factor and its initial chamber. |
| `jacquet-r-reflection` | corrected | Holomorphic continuation cone differs from raw-integral convergence; reflection checks both reflected cones. Proof boundary: Confluent Whittaker integral identities. |
| `jacquet-weyl-reflection` | corrected | Explicit evaluated rank-one integrals determine the two corrected Gamma arguments; torus projections need a broader input. Proof boundary: Confluent Whittaker integral identities. |
| `whittaker-continuation` | corrected | Continuation is a continued W family, not the out-of-chamber totalized integral; GR identities remain a gap. Proof boundary: Confluent Whittaker integral identities. |
| `whittaker-rapid-decay` | corrected | Nondegenerate rapid decay differs from degenerate polynomial behavior; exact JPSS smoothing passage remains unread. Proof boundary: Compact convolution growth estimates. |
| `degenerate-whittaker-continuation` | verified | W⁰ has y₁^(4−s) scaling, so only y₂ rapid decay is asserted; omitted Bessel calculation remains a gap. |
| `test-coefficient-algebra` | corrected | Global coefficient det(Im q) and global divisibility are necessary; added a negative-chart-branch test. |
| `test-coefficient-strip` | corrected | Bounded strip excludes −i; right translates and compact-uniform bounds are retained. |
| `rotated-whittaker-bound` | corrected | The chart replacement fails on the negative branch; actual compact product is typed and uniform proof repair is a gap. Proof boundary: Compact convolution growth estimates, Global compact rotation and uniform majorant. |
| `novodvorsky-transform` | corrected | Novodvorsky uses inner z and outer positive Mellin integration; expanded-kernel absolute convergence is not asserted. |
| `novodvorsky-continuation` | corrected | Continuation depends on the repaired rotation estimate; joint analytic target keeps the precise u−s+5/2 condition. Proof boundary: Global compact rotation and uniform majorant. |
| `tau-transform` | corrected | τ is the direct rank-zero exponential compact integral; it is distinct from the W⁰ Mellin boundary. |
| `degenerate-mellin-coefficients` | unverifiable | M and M̃ retain exponent 2s−8 and the distinct compact multiplication order; exact Bessel input remains unread. Proof boundary: Degenerate Bessel formula and residue test. |
| `local-test-nonzero-f` | verified | Nonzero F tests retain φ₁φ₂ divisibility and τ vanishing; no unsupported common y₂ is demanded for both signs. Proof boundary: Global compact rotation and uniform majorant. |
| `local-test-nonzero-tau` | corrected | Nonzero z restriction alone does not ensure a nonzero Laplace transform; an even-pushforward construction is now a gap. Proof boundary: Global compact rotation and uniform majorant, Nonzero even Laplace pushforward. |
| `local-test-nonzero-m` | unverifiable | Proposition 3.15 omits its proof; the finite-K-type nonzero M test remains an honest target, not an assumed field. Proof boundary: Degenerate Bessel formula and residue test. |
| `similitude-heisenberg-comparison` | unverifiable | Coordinate Heisenberg action is typed; comparison with the MP.6 native group and index transport remains an interface gap. Proof boundary: Rank-two adelic and similitude comparison. |
| `full-real-cover` | unverifiable | The chosen reflection extension is distinguished from the positive square-root cover and does not assert an adelic splitting. |
| `arithmetic-adelic-comparison` | unverifiable | Rational/adelic splitting and dyadic finite-lattice comparison need MP.4; the paper's classical formulas do not prove them. Proof boundary: Rank-two adelic and similitude comparison. |
| `theta-levi-transform` | verified | Levi covariance keeps transposes, determinants, arithmetic congruences and residue action. |
| `theta-unipotent-transforms` | verified | Upper and lower unipotent targets are retained; suggested signature only handles the upper specialization. |
| `coefficient-levi-transform` | verified | Quadratic-form congruence matches Levi index transport; exact B_j/C_j covariance is an explicit signature omission. |
| `matrix-mobius` | verified | Matrix Möbius uses scalar μ on Smith invariants and its rank-two local p/p² values. |
| `primitive-symplectic-pairs` | unverifiable | Primitive pair has full row rank and CDᵀ=DCᵀ; Maass completion/rank-one passages remain unread. Proof boundary: Primitive pair completion and rank-one normal form. |
| `matrix-mobius-divisor-identity` | verified | Content-divisor identity includes the identity case and cancellation of nontrivial content. |
| `matrix-mobius-inversion` | corrected | Restricted inversion now chooses N-adapted upper Hermite representatives to preserve D₁₂ modulo N. |
| `finite-exponential-sums` | verified | Finite sums distinguish primitive/restricted S₁ and S₀; S₀ uses D mod C, correcting the printed NC quotient. |
| `fourier-unfolding-kernel` | verified | The H kernel has its actual elliptic seed and Fourier character; linearity tests do not assume covariance for arbitrary seeds. |
| `cusp-one-unfolding` | corrected | Cusp-one unfolding has the C₁₂ congruence and primitive-pair quotient; Maass completion is a separate gap. Proof boundary: Primitive pair completion and rank-one normal form. |
| `cusp-zero-rank-expansion` | unverifiable | Opposite cusp separates all three ranks and keeps N³; exact rank-one reduction is a recorded source gap. Proof boundary: Primitive pair completion and rank-one normal form. |
| `whittaker-coefficient-extraction` | verified | Coefficient extraction retains period N, parity guard and actual coefficient data; no L-values are substituted as fields. |
| `bfh-l-dirichlet-series` | corrected | First-cusp a(n) is the original f coefficient sequence recovered by unfolding the auxiliary Fricke seed. |
| `bfh-p-dirichlet-series` | corrected | Opposite-cusp a_γ remains genuinely transformed cusp data; its supplier is ModularForms layer 6. |
| `first-cusp-whittaker-expansion` | corrected | First-cusp extraction is a family C(s); original-f and actual-Eisenstein supplier conditions are honestly omitted in the sketch. |
| `opposite-cusp-whittaker-expansion` | corrected | Opposite-cusp extraction is also C(s); N³ and the w-rotated functional agree with Proposition 6.2. |
| `local-prime-root-counts` | corrected | Mixed modulus min(a,d) follows matrix parametrization; the six-solution example refutes the printed min(a,b). |
| `local-root-count-table` | corrected | Kept all published root-table rows; 2,016 direct finite cardinalities match after correcting the preceding definition. |
| `local-mobius-factors` | verified | Four μ₂ local terms and their p,p²,p³ weights agree with (7.16); no table-row alteration is needed. |
| `unramified-euler-factors` | corrected | β-difference changes the second exponent only; fundamental and D=0 ratios keep symmetric-square factors in the numerator. |
| `squarefactor-polynomial-bound` | verified | Squarefactor polynomial uses a fixed newform bound and finite bad factors; layer 7 owns coefficient growth. |
| `theta-normal-convergence` | verified | Gaussian lattice majorants precede termwise differentiation and theta holomorphy; the prototype explicitly omits derivative signatures. |
| `genuine-induced-comparison` | unverifiable | Genuine sign and determinant-root magnitude give ν=s−2; full finite-vector/measure induced-space comparison remains a gap. Proof boundary: Rank-two adelic and similitude comparison, Cover-specific spectral adaptation and joint meromorphy. |
| `genuine-eisenstein-initial-convergence` | unverifiable | AS.1 linear estimates need a proved genuine-cover adaptation before use; no automatic spectral applicability is claimed. Proof boundary: Cover-specific spectral adaptation and joint meromorphy. |
| `genuine-intertwining-operators` | unverifiable | Intertwiner topology, Weyl target and cocycle/dual data remain explicit refinement obligations. Proof boundary: Cover-specific spectral adaptation and joint meromorphy. |
| `genuine-constant-term` | unverifiable | Constant term is an actual unipotent quotient integral; the Euclidean prototype needs measure/arithmetic comparison. Proof boundary: Cover-specific spectral adaptation and joint meromorphy. |
| `genuine-eisenstein-continuation` | unverifiable | Continuation and residue assertions require genuine spectral adaptation and denominator-cleared estimates, recorded as gaps. Proof boundary: Ramified opposite-cusp regularity, Cover-specific spectral adaptation and joint meromorphy. |
| `opposite-cusp-zero-regularity` | unverifiable | P(s,0,r) regularity is to be proved from ramified factors first; the circular inference through E is explicitly excluded. Proof boundary: Ramified opposite-cusp regularity. |
| `fourier-residue-interchanges` | unverifiable | Fourier/residue interchange needs compact-uniform domination in the automorphic topology; one-variable slices do not suffice. Proof boundary: Cover-specific spectral adaptation and joint meromorphy. |
| `two-variable-twist-series` | corrected | Twist series has the exact signed discriminant support, raw initial chamber and original-f coefficient sequence. |
| `two-variable-polar-combination` | unverifiable | Two-variable polar identity uses scaled N⁻¹y₂ transform and separate rank-zero boundaries; joint meromorphy is not discharged. Proof boundary: Cover-specific spectral adaptation and joint meromorphy. |
| `bsd2-export` | unverifiable | BSD.2 receives ν=s−2, continued L-functions and the polar identity; no consumer-to-MP dependency is introduced. |
