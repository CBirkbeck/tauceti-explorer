# PKG-FiniteFieldsAndCharacterSums

Worker: Codex (GPT-6), session `codex-edi9is`. Issue: #10766. Date: 2026-10-20.
The claim bot confirmed comment 6295699250 in comment 6295702477. This run took only this job.

## Delivered

The package contains the detailed six-layer README, a compact Suggested.lean and
`topic = "math.NT"` metadata. Suggested.lean has 1,001 lines. The five accepted packets and assembled reader remain
unchanged. The README accounts for their 444 distinct targets: 437 retained targets,
seven removed duplicates listed below, plus two explicit prerequisite targets. It
retains the statements, hypotheses, proof routes, APIs, checks and worked examples;
references use mathematical titles rather than packet identifiers. Each layer ends
with examples and dependencies. Supplier contracts distinguish the exact requested
extensions from existing library and roadmap interfaces.

There are 439 target subsections. The 118 retained definition/construction targets
have 434 named checks altogether, at least three apiece; the added norm-torus Lang
sheaf has five API items and four further checks. Suggested.lean names every retained
README definition, either as a light declaration or in the closing comment. Heavy
constructions remain in the README. No data definition or example is admitted. The
milestone theorems remain goals proved by `sorry`; this is a roadmap, not formalised
theory.

## Current-library and roadmap audit

The supplied read-only upstream checkout was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was inspected at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The compile pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

AlgebraicCodingTheory and Completed/EffectiveBounds README/Suggested files were read
as models. The audit searched the current roadmaps (including Completed and the
nine post-snapshot roadmaps) and current library by objects, operators and hypotheses,
then read the relevant finite-field, curve, point-count, coding, Henselian,
linearized-polynomial and character APIs. The earlier audit's absence claim for
Hasse's inequality is superseded by current Tau Ceti. Every retained backticked
prerequisite spelling was also checked against the pinned Lean sources (437 names;
no missing terminal spelling). That mechanical spelling check is not a proof that
every proposed API already exists.

Removed targets, mentioned only as prerequisites/boundaries in the package:

| Accepted target | Existing supplier |
| --- | --- |
| FF.2/artin-schreier-function-field | AlgebraicCurves Layer 10, including the elementary-abelian cover |
| FF.2/kummer-function-field | AlgebraicCurves Layer 10 |
| FF.3/frobenius-on-points | EllipticCurves Layer 3; Mathlib `WeierstrassCurve.Affine.Point.map` |
| FF.3/naive-point-count | Tau Ceti `WeierstrassCurve.pointCount`, `pointCount_def`, `pointCount_eq_card_point`, `frobeniusTrace_def` |
| FF.3/hasse-error-bound-for-point-counts | Tau Ceti `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card`, `WeierstrassCurve.hasse_bound` |
| FF.5/discrete-logarithm | Mathlib `zmodMulEquivOfGenerator`, `zmodMulEquivOfGenerator_symm_apply_zpow` |
| FF.5/diffie-hellman-correctness | Mathlib `pow_mul_comm` |

Kept variants specify their additions: certified relative coordinates rather than
finite-field classification; field-coordinate Fourier transport rather than a new
additive-dual carrier; normal-element certificates rather than normal-basis existence;
algorithm cost and certificate soundness rather than a second point-count definition;
arbitrary-parameter Dickson laws rather than only the existing parameter-one identity;
and specialized code families on the native code submodule.

## Order and closure changes

The polynomial census and elementary linearized-polynomial theory are placed in
Layer 0, before their uses in Layers 1–4. The Ore/composition comparison also moves
from the assembled Layer 4 to Layer 0. Its stable fragment remains
`FF4-frobenius-ore-polynomial-comparison`; DrinfeldModulesAndTModules should consume
that shared Layer 0 law, rather than create a second owner. No packet was edited.

Two prerequisite targets are made explicit:

- `norm-one-lang-sheaf`: the descended Lang character sheaf on the actual quadratic
  norm torus, with geometric-Frobenius trace, split Kummer comparison, tame finite
  monodromy, tensor compatibility and splitting-independence checks. Its split Lang
  map has exponent −(q+1), rather than the split multiplicative exponent q−1.
- `schoof-auxiliary-prime-cutoff`: import Mathlib's quantitative Chebyshev bound,
  remove 2 and the characteristic, and choose a logarithmic cutoff whose permitted
  prime product exceeds 4√q. The finite small-q cases are included. This does not
  replan Chebyshev's theorem.

The accepted inputs already have unresolved external requests. In particular the
geometric conductor, six-operation/weight, relative compactification, Albanese,
Dwork coefficient and chosen-root splitting, executable cost-model, and Hermitian
curve-model contracts are not certified exports merely because an owner is named.
The README preserves their exact mathematical obligations. The supplied current
checkout does not contain many of these named proposed roadmaps; no outside PR's
files were imported or treated as instructions. Upstream publication must check
that the relevant supplier packages, with these extensions, have actually landed.
This package does not assert closed prerequisites or upstream readiness.

CaraianiNewton excludes this roadmap from its 88-roadmap order and moves elementary
FF.1 character services into AnalyticNumberTheory AN.1. The package consumes those
elementary services and keeps relative Fourier/character comparisons and the deeper
finite-field formulas. ComputationalNumberTheory's removal from that modularity
order does not supply its requested general cost semantics here. These inherited
cross-roadmap requests need registration/delivery by their owners; editing their
packets, the order or the atlas was outside this package job.

## Adversarial mathematics pass

Every target's statement/hypotheses and the convention paragraphs were inspected.
The following are substantive controls and corrections, in addition to the tests
already retained from the accepted reader.

| Family | Cases and witness | Result/change |
| --- | --- | --- |
| Frobenius residues and Rabin | f=1, f=X; a square and unequal-degree product over F₂; unit normalization over F₅ | Retain positive degree, monic remainders and normalized Bézout data |
| Monic, squarefree and irreducible censuses | degree 0 and 1; X³=X·X² | Include 1 in the first two degree-zero sets, exclude it from irreducibles; no coprimality condition on squarefree-times-square factors |
| Linearized laws | zero polynomial, constant 1; characteristic 2; commutative rings | Explicit prime hypothesis for the general characteristic-p composition formula; in Z/4Z, (1+1)^4=0 but 1^4+1^4=2 |
| Characters/Fourier | trivial characters, q=2, positive exponential over F₃, delta at 1 | Keep zero extension at zero, g(1,ψ)=−1, J(1,1)=q−2 and conjugate Fourier phase |
| Hasse–Davenport/Gamma | p=2, trivial-character factors, endpoint exponents | Separate the chosen-root splitting obligation from the coefficient bound; do not infer equality of p-power roots from equal residues |
| Digit/Gamma distribution | 11,038 cases, p=2,3,5,7, f=1,…,4, all divisors of q−1 and permitted exponents | Exact digit and factorial distribution checks pass |
| Odd principal units | truncated exponential at indices with p dividing k! | Reduce the p-integral coefficient p^k/k!; never invert k! directly in the finite ring |
| Walsh/bent sequences | trivial character, zero word; period-three b=(0,1,1), a=(1,1,0) | Use ψ≠1 (not ψ≠0); corrected shift witness C(0)=−1, C(2)=3; bound C+ψ(B(0)) |
| Dirichlet sequence correlation | nonzero shift, zero/−shift boundary terms | Corrected conjugation in both the formula and proof to c·conj ψ(τ)+ψ(−τ)·conj c |
| MDS and RS | zero code, top code, repetition, a binary [4,2,2] non-example | Nonzero-word formulation; minimum-distance equivalence guarded by C≠⊥ |
| Hermitian messages | l=0 and l<p−1, characteristic 2 | Retain the finite dimension sum; simplified formula needs l≥p−1 |
| Norm-torus sums | q=3,5,7,11,13; all character pairs and parameters outside the two exceptions | 19, 113, 327, 1307, 2169 numerical cases pass the 2√q and endpoint √q bounds |
| Terras graphs | every nonexcluded a over q=3,5,7,11,13 | Exact adjacency row degrees q+1; numerical spectra and character-transfer candidates checked for q=3,5,7 only, matrix orders 6,20,42 |
| Point counts/lifts | characteristic 2 separated; singular vs nonsingular gradient; CRT boundaries | Existing elliptic bounds imported; point counts retain boundary corrections; lift fibres need a nonzero gradient |
| Secret sharing | threshold 1 and 2, nonzero distinct points, evaluation at zero | Exact fibre cardinalities; F₅ secret 3/slope 1 gives (4,0,1); zero evaluation point fails privacy |

Numerical complex and spectral checks are diagnostic, not formal proofs. The exact
Lean correlation witness, zero-extension test, degree-zero tests, bentness
non-example, zero-polynomial exclusion and secret-sharing calculation are proved
examples, with no `sorry`. Source errata already explained by the accepted plan
(e.g. the unrestricted Hermitian dimension formula and Shallue's quoted criterion)
remain corrected statements, not copied false formulas.

## Source checks and remaining source limits

Public primary sources were read directly; inherited read receipts were not treated
as this worker's verification. No source passage was added to the repository.
Verified samples include more than fifteen distinct theorem/section/page locators:

| Source | Freshly inspected locators |
| --- | --- |
| Shoup, Version 2 | Theorems 5.4–5.7, pp. 106–108; Algorithm IPT/Theorem 20.1, pp. 522–523; RIP/Theorem 20.2, pp. 523–524; SFD/Theorem 20.5, pp. 528–530; EDF/Theorem 20.7, pp. 534–535 |
| Conrad, Gauss and Jacobi sums | Definition 2.1/Theorem 2.2/Corollary 2.3, pp. 1–2; Theorem 2.4, p. 3; Corollary 2.5, pp. 3–4; Theorem 2.6, p. 4; Appendix (A.5)–(A.6), p. 19 |
| Deligne, Sommes trigonométriques | §§1.2–1.8, pp. 171–174: torsors, Lang map, inverse deck character and geometric Frobenius trace |
| Katz, Estimates for Soto-Andrade sums | Theorem 1, p. 143; proof and norm-torus coordinates/Lang sheaf, pp. 145–147; Euler characteristic and split comparison, pp. 148–149 |
| Wu–Liu, v2 | Proposition 4.3, pp. 11–12: Dickson-matrix rank and determinant |
| Shallue, v1 | Theorems 1.5–1.6 and Corollary 1.8, pp. 10–11; Theorem 1.9, p. 11 |
| Schoof (1995) | §5, pp. 233–235: prime cutoff, torsion calculation and polynomial cost; corrected the new cutoff target's inherited pp. 229–231 locator |
| Guruswami–Rudra–Sudan, 19 April 2026 | Theorem 4.3.1, p. 75; Definition 5.2.1, p. 97; Claim 5.2.3, p. 98; Theorem 5.2.4/Definition 5.3.1, p. 99; Proposition 5.3.3, p. 100; Exercises 5.8–5.12, pp. 102–104; Exercise 5.23, pp. 109–110; bibliographic notes, p. 111 |

The mutable 2025 coding-book link no longer identifies the inspected edition. Its
citations were replaced by the public 2026 draft with corrected pages; the duplicate
2025 reference was removed. The Hermitian dimension caveat remains necessary in the
2026 exercise too.

The inherited Cohen II locators (§11.6–11.7, especially Theorem 11.6.14 pp. 372–375,
Lemmas 11.7.12/11.7.14 and Corollary 11.7.15 pp. 390–395) and Robert (2000), VII
§2.1–2.4 pp. 386–397, were not independently verified: these books were unavailable
in the cleared collection. No other copy was read. The Cohen scan link was replaced
by the publisher DOI, and the README explicitly marks the source gap and the Dwork
supplier obligations. The inherited Robert (2001) Appendix 2 p. 169 locator also
needs direct verification. These source and supplier limits need the independent
reviewer's attention; there is no claim to have read all 45 bibliography entries.

## Validation

- All five `python3 scripts/check_blueprint.py` invocations on the unchanged parent
  and FF.1–FF.4 packets: zero errors, zero warnings.
- Mechanical inventory: 444 accepted nodes, seven explicit deferrals, 437 retained
  nodes and two added prerequisite targets; 439 subsections; no duplicate or broken
  internal fragment; every retained target has a source and prerequisites; every
  definition/construction has an API and at least three checks.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  four files, zero problems.
- `lean-check research/blueprint/packages/FiniteFieldsAndCharacterSums/Suggested.lean`:
  exit 0; `declaration uses sorry` is the only warning. All examples are proved.
  The shared build had 79 GB available before the final run. No language server or
  new Lake project was used.
- `git diff --check`: clean. Exactly the three package files and this handoff
  are changed; packets, assembled inputs and other jobs are untouched.

No suspicious instruction-bearing text was encountered in the sources or claim
thread. No messages to third parties, label changes, issue closures, merges or
changes to another job were made. The next step after submission is independent
package review, with the source/supplier limits above carried forward explicitly.
