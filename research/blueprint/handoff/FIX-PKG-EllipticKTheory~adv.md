# FIX-PKG-EllipticKTheory~adv

Issue: #11115. Agent: Codex, session `codex-uWmxnY`. Date: 2026-10-19.
Completed fix; no checkpoint or unresolved package finding remains.

## Finding and disposition

The remaining finding in
[`REV-PKG-EllipticKTheory~adv`](../reviews/REV-PKG-EllipticKTheory~adv.md)
was the unsupported historical identification in README §7.7: the quotient,
division by `C`, and tame orientation of `blochClass_eq_Bloch`.

Resolved by checking Bloch's publicly readable original construction and stating
the actual scaled comparison. The ICM Helsinki 1978 paper, vol. 2 (published
1980), p. 514, constructs the integral element
`A_a = C{ρ,f_a} + Σ{h_i,d_i}`. It does not divide this expression by `C`.
The package retains its normalized lift `A_a/C` and canonical quotient class
`S_a`; `blochClass_eq_Bloch` now says that the image of the integral ICM class
is `C S_a`, with the quotient/localisation map explicitly typed. Equality of
lifts requires matching choices; equality for arbitrary corrections is in the
quotient by constants and torsion.

The ICM page asserts an element of the tame kernel and correction-independent
regulator, rather than the package's canonical quotient class. The README
retains the independent tensor-exactness argument for the latter. It also
explains why inversion of the tame convention preserves the kernel, how the
chosen constants cancel the raw tame values, and why neither reversed
correction entries nor an overall negative sign occurs.

This replaces the unsupported comparison with the unconsulted book, *Higher
regulators, algebraic K-theory, and zeta functions of elliptic curves*, Lecture
10, (10.1.2), p. 76. That inherited locator is recorded here for provenance;
this fix makes no claim to have verified the book or its normalization. The
book is absent from the cleared library index, and no unofficial copy was
used. No equality to its unread formula remains a package target. The new
source comparison preserves the entire algebraic construction, quotient,
arbitrary-field generality, API and prior negative controls.

Changes are confined to the four issue deliverables. The README adds the
source comparison, four discriminating Checks and the normalized downstream
contract. Suggested.lean adds two proved examples over existing carriers and
updates the closing target list. The review verdict is `accepted`, under the
fix reviewer identity required by this issue. The original review report and
all packets remain untouched; the earlier review's other repairs are retained.

## Sources read

- S. Bloch, *Algebraic K-Theory and Zeta Functions of Elliptic Curves*, ICM
  Helsinki 1978, vol. 2 (1980), pp. 511–515,
  [official IMU PDF](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM1978.2/ICM1978.2.ocr.pdf#page=10).
  Read the construction following the localisation sequence on printed p. 514
  (one-based PDF page 10), including the exponent on the raw symbol and both
  torsion-function divisors. Checked the rendered page as well as its OCR.
  Accessed 2026-10-19; SHA-256 of the full volume:
  `dc99c9009cff631d280a09b1da07d9762e7aa3803b4502f19ff59e5e28db55d5`.
- M. A. Young, *K₂ and L-series of elliptic curves over real quadratic fields*,
  Durham thesis (1995), Lemma 3.1 and proof, printed pp. 37–38,
  [institutional PDF](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF).
  Checked the positive coefficient, function/constant order and local
  cancellation. Its totally real and subgroup-cardinality hypotheses are
  distinguished from the package's valuation proof for any field and positive
  annihilator. Accessed 2026-10-19; SHA-256:
  `8526c62b1ad944e35201a2734efee259bd0ca52144d2cf352cc2074ba3397dd3`.

All exposition is in our own words. No source passages or source files were
added to the repository. No suspicious instructions were encountered.

## Adversarial pass of the touched statements

| Statement or API | Instances and calculations tried | Result and change |
| --- | --- | --- |
| §7.7 full-torsion and coefficient hypotheses | `C=1,2,3`; characteristic two; characteristic dividing `C`; base field Q | `C≥1` and prime-to-characteristic conditions retained. Full rational `E[3]` is not asserted over Q. The historical comparison is characteristic zero; the algebraic extension keeps all permitted characteristics. |
| `blochClassLift` and `blochClass` | Empty nonzero indexing set for `C=1`; `C=2`; change of a correction by constants or torsion | Division only after entering the tame kernel. Lift remains choice-dependent; canonical class remains in the explicitly localized quotient. No origin-indexed class or division by zero. |
| `blochClass_wellDefined`, change-function and change-correction API | Trivial torsion, constant rescaling, a generator `div h=nD`, `ζ^n=1`; number fields | Existing tensor argument retained: `{h,ζ}` is killed by `n`, giving constants plus actual torsion. Constant changes of the raw symbol remain mixed symbols; their unramified differences are handled by the same kernel argument. Number-field constant K₂ is torsion. |
| `blochClass_eq_Bloch` | Same correction, different correction, `C=2,3`; source's integral coefficient versus normalized coefficient | Source gives `A_a`, so the quotient equality is `π_C(A_a)=C S_a`. Matching lifts give `A_a⊗1=C·blochClassLift a`. No equality of arbitrary lifts or unscaled identification is claimed. |
| Formal two-term normalization Check and Lean example | Distinct `s,t`, `A=3[s]+[t]`; evaluate both coordinates before the Steinberg quotient | Integral coefficients `(3,1)` and divided coefficients `(1,1/3)` computed. New Lean example proves all four values; it assumes no nonzero actual K₂ class. |
| Correction orientation and Lean example | Orders `(3,0)` and `(0,3)`; residue 2; inverse tame convention; characteristic two | Values `1/8` and `8`; with raw value 2 the corrected product is `1`, while reversed entries give `64`. New Lean example proves the inverse-cube/cube formulas over every field, including characteristic two. Kernel unchanged on inverting tame values. |
| Retained `C=2` obstruction and new integral representative | `E:y²=x³−x`, `ρ=1/y`, `f_a=x`; places `(0,0),(1,0),(−1,0),O` | Raw values `(-1,1,-1,1)`. The two corrections `{x,-1}`, `{x+1,-1}` each have tame value one everywhere; twice the raw symbol is unramified. The displayed `A_a` is an integral representative, whose divided lift is `A_a/2`. |
| Retained nondivisibility, divisor, relation and constant-change Checks | Doubling quartic at possible rational roots `±1`; full 2-torsion divisor; related three-point classes | Quartic gives `4,4`, preserving the nonzero tensor obstruction. Divisor and rank-at-most-one controls retained. No linear independence or integral correction before multiplying by `C` is inferred. |
| Downstream class convention and closing Lean target list | EllipticRegulators §§4.5, 8.2; comparison with integral ICM input | Consumer already uses `A_a/C`; supplier contract unchanged and now explicit. K₂ quotient/comparison targets stay in the README because their carriers do not exist at the pins. |

Rational arithmetic independently recomputed the four `C=2` local values and
the corrected products, the `C=3` local products and coefficients, and the
quartic values. The local residue-2 witness is not available in residue field
F₂; the general Lean identities still hold there. Rank, compactness, DVR-base
and finite-field-cardinality hypotheses are not used in these touched targets.

## Library and ownership checks

Read the reviewed library audit, the exemplar and the JacobianChallenge,
AlgebraicVectorBundles, EllipticCurves and AlgebraicCurves supplier material.
Checked current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`
and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only.
Recursive object searches included current roadmaps and Completed, the nine
post-snapshot roadmaps, and library sources, using tame-symbol, higher K-theory,
Milnor-K and certificate terminology as well as the package's names. No supplied
K₂ class/comparison or certificate carrier was found. No new duplicate target
was introduced and no additional removal was needed in this fix.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, read the principal single-torsion
function supplier and `Place.residueUnit`, `residueUnit_inv`,
`residueUnit_zpow`. The new examples use the existing residue API and Finsupp;
they do not introduce K-theory carriers or develop theory. No build was run in
the current read-only checkouts.

Downstream note for the maintainer: EllipticRegulators already uses the divided
class. This fix certifies that supplier convention and the scaled comparison
with the ICM construction, not the consumer's existing book citations or any
analytic formula in either source. Those files were outside this job's scope.

## Validation and remaining work

- `lean-check research/blueprint/packages/EllipticKTheory/Suggested.lean`:
  exit 0 at the shared pinned build; 461 lines, 14 warnings, all existing theorem
  `sorry` warnings. Both added examples are proved; no admitted data or examples.
- `scripts/check_blueprint.py` on `EllipticKTheory.json`,
  `EllipticKTheory--E.5.json`, `EllipticKTheory--E.6.json`:
  each exit 0, zero errors and warnings. These are read-only input checks; their
  pre-existing packet gap counters do not describe the revised package verdict.
- `research/blueprint/intake.py check-files` on all four deliverables:
  zero problems.
- `git diff --check`: clean.

No further work is required for the confirmed package finding. Independent
review can inspect the source comparison and the retained quotient proof.
