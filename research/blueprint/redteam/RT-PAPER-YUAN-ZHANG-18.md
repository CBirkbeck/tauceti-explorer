# Red team: Yuan–Zhang's averaged Colmez extraction

Codex, session `codex-rtOQ9t`, 1 October 2026. Issue #4104.
Target: `PAPER-YUAN-ZHANG-18`, accepted by `REV-PAPER-YUAN-ZHANG-18`.
This session did neither the extraction nor its review.

Four findings remain in the accepted extraction: three statement defects of
high severity and one medium-severity inconsistency in proof outlines. They
are itemized in the accompanying result JSON. Findings 1, 2 and 4 concern
corrections already recognized by the review but not carried consistently
into the current mathematical contracts. Finding 3 is a quantifier error
introduced in a review-added item. None is a claim of newly discovered
errata in Yuan–Zhang.

## Sources and scope

I reread all 106 pages of the [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf),
Annals 187 (2018), 533–638, and all 11 pages of the
[author's erratum revision](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf),
dated 18 December 2022. Both were accessed on 1 October 2026; their hashes
are in the JSON. Images of printed pages 568, 569 and 591 were additionally
checked for the rank and order hypotheses. The [journal erratum record](https://annals.math.princeton.edu/2023/198-2/p08)
has the same revision date, but its final 12-page typesetting was not obtained
or collated. The older erratum appended to arXiv v3 was not used in place
of the December 2022 correction.

The audit covers all 139 extraction items, the four prerequisites, nine
routes, reader report, review report and review JSON, and the mathematical
contents and review dispositions of E1–E55. The result records hashes of
the accepted inputs at atlas commit
`a5bc95ee65ef834a5711dee5d3f283b966e0bb90`.

I checked the six positive library claims against Mathlib `082e2d3` and
Tau Ceti `f790474`, reading their actual declarations. The product formula,
CM involution, Vandermonde identities, field-valued abelian variety,
finite locally free Cartier duality and real gamma factor have the stated
scope. Their surrounding integral and automorphic constructions are not
supplied by those declarations.

The relevant owner descriptions and reviewed audits were checked for R35,
CM, R18, GZ, MP, AL and R11. The selected R07 stages have no reviewed
coverage-table entry; their roadmap explicitly retains the dyadic
classification and covariance obligations. All 119 missing items have
exactly one route. The Tsimerman and AGHMP extractions expressly share the
same CM Part II ID, so the independent proof branches do not justify a
duplicate-roadmap finding.

## 1. Relative crystal, absolute dual differential module — high

`integral-ks.statement` changes the crystal to the relative one but still
sets

`W^t_℘ = Lie(ℋ^t_℘)^∨`, of rank two.

The source identifies `ℋ^t` as the Cartier dual. The group's Tate module
has rank `4d` over `Z_p`, where `d=[F_℘:Q_p]`, while Theorem 4.9 makes its
dimension two. Therefore the absolute dual has dimension `4d−2`.
For an unramified degree-two place the displayed left term has rank six,
so it cannot be the rank-two submodule of the rank-four relative crystal.

This is exactly the distinction recorded in E30 and in the item's own
review note. The repair must change the definition of the Hodge pieces
as well as the crystal. In the unramified case take the specified
`τ`-summand. In the ramified case specify the relative theory or image
convention and keep its integral comparison obligation. A raw quotient
cannot be declared locally free in the face of E3/E31. Retain the corrected
determinant line `det W^t ⊗ det W` and its discriminant twist.

## 2. The test function still uses E28's rejected order inference — high

`test-function.statement` introduces `U` as a maximal compact containing
`Ô_E^×` and then asserts `O_{E_v} ⊂ O_{B_v}`. Its reference to the data
`F,E,B` of Theorem 1.7 does not import that theorem's corrected condition
on `U`; the item supplies a different condition explicitly.

The E28 example verifies the problem directly. For `E=Q(√−7)` at `2`,
use the diagonal split torus and

`L={(x,y)∈Z_2² : x≡y mod 2}`.

Its automorphism group is maximal compact. In the basis `(1,1),(0,2)`,
`diag(a,d)` has matrix `[[a,0],[(d−a)/2,d]]`. Every pair of odd units
preserves `L`, including under inversion. The idempotent `diag(1,0)` has
lower-left entry `−1/2`, so it does not preserve `L`. The order generated
by the compact group therefore cannot contain the full split integer ring.

Make this item consume the chosen maximal order `Ô_B ⊇ Ô_E` from
`quaternion-datum`, with `U=Ô_B^×`. The module-generator construction and
`order-sandwich` then have their required hypotheses. This propagates an
existing correction; it does not add another source issue.

## 3. One field for all CM points — high

`rev-hodge-class-terms-vanish-and.statement` requires a finite `H/F` with
every point of `CM_U` defined over `H`. On printed p607 the assertion is
pointwise, and the next sentence permits composita of the resulting
extensions. This supports a field chosen for a finite collection of
points involved in an intersection computation.

`CM_U = E^×\\B_f^×/U` is much larger than the finite orbit
`C_U = E^×\\E_A,f^×/(E_A,f^×∩U)`. Varying the quaternionic coset varies
the CM conductor. For example, take `F=Q`, `E=Q(√−7)` and an incoherent
quaternion algebra ramified at `∞,3,5`. These finite primes are inert in
`E`; the no-common-ramification condition holds. At the split place `2`,
the lattices

`L_n={(x,y)∈Z_2² : x≡y mod 2^n}`

have multiplier order `Z_2+2^n O_{E,2}`. Their ring-class orbit degrees
grow as `2^(n−1)`: the maximal order has class number one, its only units
are `±1`, and the local unit quotient at the split prime has this order.
No single finite `H` contains the fields of definition of all these points.

Choose a finite unramified-at-`Σ(B_f)` extension for each finite set of
points/supports required in a coefficientwise intersection calculation.
Use normalized base-change independence to assemble the series. A field
for the finite orbit `C_U` can be fixed; simultaneous rationality of all
`CM_U` must be removed. This is an extraction error, not an error in p607.

## 4. Superseded arguments remain in current proof outlines — medium

Four retained outlines contradict their corrected statements or notes:

| Item | Retained step | Required replacement |
| --- | --- | --- |
| `determinant-cancellation` | Identify the `O_E`-linear and `O_B`-linear deformation Hom modules | Their ranks are two and one (E32). Cancel the determinant twists directly, retaining the ramified-base gate. |
| `local-n` | The S2 contribution is zero | E51 gives `n_φ(1,1)=−1/(1+N+N²)`. |
| `local-cancel-split` | Cancel `2n log N` against `log|q(y)|φ` at every split place | At S2 and `y=u=1` the logarithm is zero. Cancel `2n log N` against `c_φ`, as E43/E51 require. |
| `nonzero-theta` | Prove positivity of all terms | E52 retains a common, possibly negative Weil-index sign. One nonzero term with the common sign suffices. |

For example, at `N=3`, the corrected S2 values are `n=−1/13` and
`c/log 3=−2/13`; `2n−c/log 3=0`, although neither term vanishes.
Update the actual `proofOutline` fields, not only appended notes. The
request is consistency of material the extraction already supplies;
section 16 does not require completing the suppliers' proofs here.

## Checks and limits

Exact rational diagnostics checked the lattice matrices, height/dimension
rank counts, split conductor-unit quotient counts and S2 cancellation.
These are not formal proofs of the global geometry. The corrected average,
the relative/absolute height denominators, the graph condition, zero-index
Whittaker normalization and final discriminant cancellation were checked
without issuing further findings.

The known ramified-quotient gaps E3/E31 remain explicit. The final journal
erratum and the original proofs of the cited suppliers are not claimed as
read. A possible same-type-isomorphism base-field ambiguity was not promoted
to a finding: the paper first enlarges the field to define the comparison
isogeny, and that convention must be respected when interpreting its local
argument. Historical checkpoint counts are superseded by the accepted
review appendix and are not counted as new mathematical defects.

Validation commands:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-YUAN-ZHANG-18.result.json
python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-YUAN-ZHANG-18.result.json research/blueprint/redteam/RT-PAPER-YUAN-ZHANG-18.md
git diff --cached --check
```

No Lean source is requested by this job. No compiler, language server,
Lake update or cache download was run. Only the two authorized red-team
deliverables are changed.
