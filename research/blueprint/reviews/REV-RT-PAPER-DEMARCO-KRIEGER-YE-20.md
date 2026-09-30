# REV-RT-PAPER-DEMARCO-KRIEGER-YE-20

Codex, session `codex-rtOQ9t`, 30 September 2026; issue #4086.
Reviewed at atlas commit `eb3c2f99035b71a8c94fcc05fc6d25ef39622a7e`.
The extraction, original review and red team were by `cc-fb70e5`,
`cc-442dc5` and `cc-c2c06b`, respectively. I did none of that work.

All eight findings are confirmed: one medium and seven low. The verdicts
qualify the fixes where a citation supplies less than the surrounding claim,
and make the missing choice in Proposition 9.2 explicit. This verifies the
findings; it does not re-review every item of the extraction or certify the
red team's other clean conclusions.

## Evidence opened

- Both red-team deliverables and the original extraction review; all eight
  findings, their evidence and proposed fixes; extraction items 3, 10–12, 26,
  27, 44 and 53, all twelve prerequisites and the thirteen source-issue
  records (with full checks of E5–E7 to distinguish the new p.990 finding).
- The complete ArithmeticDynamics nodes
  `DY.4/standard-adelic-height-is-the-weil-height` and
  `DY.6/lattes-map-canonical-height`; the sibling
  `PAPER-DEMARCO-MAVRAKI-YE-26/7` and the paper/packet source inventories.
- [Published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf),
  53 pages, SHA-256
  `7a4bd817bc7cc561363c68c3941b449af55fbf4cb1b3481bd0d601e84b9307df`.
  Read the cited passages on printed pp.951, 955, 962, 965, 990, 995, 997
  and 999. Inspected rendered page images of pp.951, 990 and 997.
- [arXiv v2](https://arxiv.org/pdf/1901.09945v2), 49 pages, SHA-256
  `8fc51ac36f9fc4b406c7bb44cdeccf31386e81e0a471176a69e80a1a0766bab8`.
  Compared the p.2 fiber-product sentence, pp.14/16 FRL2 references,
  p.41 height identity and end of §9 on p.47. There is no published §9.5
  counterpart in v2. These are selected readings, not an entire-paper reread.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
  `Mathlib/NumberTheory/Height/NumberField.lean` (standard admissible values,
  relative-height formulas and absolute scalar-height definitions), and
  `Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean`
  (the univariate square and coordinate-ring comparison).
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
  `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` (definition
  and torsion-zero-locus statements), `MordellWeil/NaiveHeight.lean`
  (definition and scalar-height comparison), and
  `DivisionPolynomial/ZSMul.lean:1050–1145` (annihilation, model transport
  and order-two criterion). All statements were read with `git show` at
  the pin, not inferred from declaration names.

## Findings and corrections

### 1. Absolute scalar height is already defined — confirmed

`NumberField.absMulHeight₁` at line 137 takes the height in the simple
number field Q(x) to the power 1/[Q(x):Q]; `absLogHeight₁` at line 146 takes
its logarithm. They take an element of any characteristic-zero field, so
include algebraic elements of Qbar. Item 10 and the post-review paragraph
confuse this scalar definition with the relative projective-height API.
The sibling extraction repeats the same absence claim.

Split off the existing scalar construction, with the convention h(infinity)=0
stated separately. Retain the tuple height and weighted comparison identity
as planned work. Do not mark the entire combined item library: the accepted
DY.4 comparison still has `implementationStatus: unchecked`, and explicitly
imports `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`.
Use those owners instead of planning a second comparison.

### 2. Division-polynomial citations — confirmed, with scope limits

The two Tau Ceti results at lines 1071 and 1084 identify vanishing with
annihilation of a nonsingular affine point represented in the Jacobian
model. The index must be nonzero to infer torsion: psi_0 vanishes at every
point. The model-transport lemma at line 1106 (named
`zsmul_fromAffine_eq_zero_iff`) supplies the affine/Jacobian link.
The order-two criterion at line 1128 excludes the identity because the
point is an affine `.some` point. Infinity needs separate treatment.

Mathlib's `WeierstrassCurve.ΨSq` at line 242 is the x-only polynomial;
`Affine.CoordinateRing.mk_Ψ_sq` at line 338 gives the square relation.
These are appropriate additions to the citations, with the relevant
transport/reduction to the curve understood. The order-two criterion alone
does not prove that the projection is a degree-two cover branched exactly
at the four torsion images, nor prove the j-formula in item 3. The fix must
not present it as the complete branched-cover theorem.

### 3. Relative and absolute canonical height — confirmed

With the standard number-field absolute values, the naive scalar height
in Tau Ceti is h_K=[K:Q]h_abs. Its canonical height is

    H_TC(P) = lim_n h_K(x(2^n P))/(2*4^n)
            = [K:Q] * hhat_E,abs(P)
            = [K:Q]/2 * hhat_t(x(P)).

This follows from the actual definitions, and agrees with the existing
DY.6 comparison node. The fixed-K zero locus survives multiplication by
the positive degree. Its Lean theorem requires ellipticity and Northcott;
it is not an unconditional theorem for arbitrary fields or arbitrary
admissible absolute values. Keep the valid library claims and correct the
normalization note and review; cite the planned comparison without calling
it implemented.

### 4. Omitted place weights — confirmed

The published p.990 image omits r_v in the scalar absolute-log identity;
v2 p.41 has the same omission. For K=Q(sqrt(2)), x=2, there are two real
places with weights 1/2 and one place over 2 with weight 1. Their three
absolute logarithms are all log(2). Thus the unweighted sum is 3 log(2),
whereas the weighted sum is 2 log(2)=2h(2). The correct general identity
follows from the weighted product formula and
`|a| = 2 max(a,0) - a`.

E5 concerns the coefficient in (7.5), E6 a missing maximum term and E7 the
dyadic regularization radius. None records this omission. Add E14 as a
misprint, with x nonzero and `affects: nothing`; item 10 already uses the
corrected identity. This does not supersede the distinct E5–E7 corrections.

### 5. Singularity of the fiber product — confirmed as editorial

Take branch sets {0,1,2,infinity} and {3,4,5,6} over C. Each four-element
set gives an elliptic double cover, with an origin at a ramification point,
so the disjoint example satisfies the standard-projection hypotheses.
At a value where just one map ramifies the local fiber product is
u^2=v, which is smooth. Where both ramify it is u^2=v^2, an ordinary node.
Distinct quadratic branch sets give distinct quadratic extensions, hence
a connected degree-four composite cover. If m is the overlap size, its
normalization satisfies

    2g - 2 = 4*(-2) + 2*(8-m), hence g = 5-m >= 2.

The disjoint case is smooth of genus 5; the three-overlap case used later
has normalization of genus 2. The parenthetical singularity claim is an
imprecise general description, not a failure of the stated genus bound or
main theorem. E15 should say possibly singular, or give the exact common
branch-value condition, with no mathematical-result impact.

### 6. Choose the lift on the curve — confirmed

Proposition 9.1, p.995, gives Phi(j_Q(X))=C. The selected torsion pair T
lies on C. Choose w on j_Q(X) mapping to that pair, which is possible by
this image equality. If d kills T and e kills the finite kernel of Phi,
then ed kills w. Also ord(T) divides ord(w), so ord(w)>=N. This proves
both membership and the order assertion required by Proposition 9.2.

The printed p.997 choice in the ambient Jacobian omits that membership;
item 53 supplies it silently. Record E16 as a gap in the proof, while
stating explicitly that the proposition survives. `affects: the proof`
is more precise than the proposed `nothing` for this omitted argument.
Do not use a universal count of sixteen preimages: that generic count
changes over branch values and is unnecessary for the repair.

### 7. Missing FRL10 dependency — confirmed

The primary passages identify the dependency directly: published p.962
uses FRL10 §5.1 for total invariance and the tent-map action; p.965 adapts
its calculation at dyadic places. The bibliography on p.999 distinguishes
it from FRL06. V2 uses the alias FRL2 for the same 2010 work.

All twelve listed prerequisites and the packet/paper source inventories
omit it. Add the proposed
[2010 citation](https://doi.org/10.1112/plms/pdp022), with
[public preprint arXiv:0709.0092](https://arxiv.org/abs/0709.0092), and identify
Propositions 3.2/3.5 as consumers. I verified the cited use and primary
bibliographic identity, not every theorem of the FRL paper.

### 8. Reading metadata — confirmed

`source.readSections` retains the extraction's earlier failed-access
receipt despite the review's later successful published collation.
The independently fetched files match both historical hashes exactly.
Update that chronology and add top-level `sourceVersions` as §18 requires.
The proposed September 22/23 dates belong to those earlier workers'
receipts; September 30 is the date of this verifier's selected readings.
Do not turn either receipt into a claim that this verifier read all pages.

## Correction-search scope

On September 30 I opened the [journal article page](https://annals.math.princeton.edu/2020/191-3/p05),
[arXiv version history](https://arxiv.org/abs/1901.09945), and
[DeMarco's publication list](https://people.math.harvard.edu/~demarco/), and
searched for the article title with erratum/correction. No correction of
these passages was found there; v2 remains the latest listed preprint.
I did not read v1 or every author's site. Future source-issue `searched`
fields must record these actual checks, rather than copying the broader
suggested list as though it had been executed. This verification confirms
omitted records and the stated local repairs, not an exhaustive claim of
novelty. The packet itself is unchanged in this review job.

## Validation

All checks below passed (eight verdicts, two deliverables, zero intake problems).

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DEMARCO-KRIEGER-YE-20.review.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-DEMARCO-KRIEGER-YE-20.review.json research/blueprint/reviews/REV-RT-PAPER-DEMARCO-KRIEGER-YE-20.md`
- `git diff --check`

The JSON contains exactly one verdict for each of the eight input finding
IDs. No Lean file is changed or compiled; the library checks above are
source reads at the required pins.
