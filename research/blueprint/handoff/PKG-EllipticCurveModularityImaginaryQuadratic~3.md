# PKG-EllipticCurveModularityImaginaryQuadratic~3

**Complete package revision, submitted for independent review.** Codex,
session `codex-2XWHM9`, 13 October 2026. Issue
[#9166](https://github.com/CBirkbeck/tauceti-explorer/issues/9166), claimed in
[comment 6154608601](https://github.com/CBirkbeck/tauceti-explorer/issues/9166#issuecomment-6154608601)
and confirmed by the bot in
[comment 6154611301](https://github.com/CBirkbeck/tauceti-explorer/issues/9166#issuecomment-6154611301).
Branch: `codex-2XWHM9-pkg-imaginary-quadratic`.

The manager's priority list had no eligible available issue. This available
package revision was taken under WORKERS' fallback order after checking the
earlier review candidates' input and ownership restrictions. One job was
claimed; this worker has not reviewed either this package or its revision.

## What changed

The README now follows the binding 12 October shape: Summary, ownership,
conventions, exact supplier contracts, build order, eight prose layers with
numbered topic subsections, Examples and Dependencies, downstream consumers
and references. Target-number tables and API/test field scaffolding were
replaced by prose statements and named lists. All **68 target names, 69 APIs
and 69 original Checks** remain, with their full mathematical contracts and
prerequisites. All original API and Check bodies were checked mechanically
against the preceding package. No result was shortened to make the document
smaller. Source statements are written in our own words.

Suggested.lean was rewritten directly to the new shape, with one import block,
one opening module note, namespace
`TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic`, and layers in README
order. Its executable inventory is **19 real-bodied definitions, 20 theorems,
five instances and 40 examples**, in **467 lines**. Three ellipticity instances
are propositions with proposed proofs; two local base-change instances reuse
Mathlib's existing instances. There is no sorry'd data definition, auxiliary
API development, fabricated carrier, axiom or embedded README catalogue.

The arithmetic statements use existing coefficient, rational-function,
tensor-product, polynomial and actual elliptic-point-group carriers. They
retain the function-field degrees, saturated rational generator, quadratic
torsion-growth distinction, exceptional discriminants and j-values, weighted
points, sextic squarefreeness, homogeneous involution identities and the
finite/small-field and infinite/√−10 arithmetic endpoints. One or two examples
per light definition and the saturation negative control remain.

The 10 October review required declarations for every heavy object and
geometric/automorphic milestone. That requirement is superseded by the
explicit 12 October rule: signatures whose carriers are unavailable at the
pins belong only in the README. Accordingly, `Modular`, `symplecticTwist`,
`cartanCurve`, `quarticTorsionClasses`, the full geometric comparisons and
modularity endpoints remain precisely specified README targets. They are not
replaced with tautologies or newly developed supplier theory. The partial
coordinate statements in Lean explicitly describe their restricted meaning;
the README retains the complete geometric contracts. Missing future supplier
implementations do not make this roadmap package a checkpoint under that rule.

The accepted packet, original reader and suggested files, supplier files and
`review.json` were not edited. Metadata remains exactly `topic = "math.NT"`.
This handoff records completion of the package job, not independent acceptance
or formalisation of its proposed results.

## Current ownership and library audit

Read the current upstream JacobianChallenge and GlobalNumberFields READMEs
in full as style and scope models, and the JacobianChallenge suggested file.
Searched the current upstream roadmaps, including the nine newer roadmaps and
Completed, by mathematical objects and hypotheses as well as declaration
names. Checked the relevant reviewed entries of `data/library-coverage.json`
and the current library declarations rather than treating the older audit as
the current implementation inventory.

Audited revisions: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither checkout was modified or
built. The scope section now expressly defers the general modular twists,
coarse compactification, Picard/Jacobian, number-field and Tate-module theory.
It cites current `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`,
`SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`,
`rigidifiedPicardFunctor` and `WeierstrassCurve.tateModuleGaloisRepresentation`,
with their module locations and relevant hypotheses. The degree-zero library
interface's finite-dimensional H¹ assumption is explicit.

No source-specific target was found already supplied by those checkouts, so
**no target was removed**. The retained fixed-pairing and Cartan objects are
number-field/source-coordinate specializations of the named suppliers; the
general notions themselves are not replanned. No ownership move or new
dependency edge was made. Current library facts in the boundaries are not
claimed to have existed at the older compilation pin.

## Sources and mathematical controls

Read the fixed CN preprint's introductory endpoint, Theorem 5.2 and §§6–7;
the AKT ordinary/dihedral lifting statements and local-selection/discriminant
inputs; FLHS Lemmas 15.3–15.4; BF's rational-divisor versus rational-class
discussion; and BOX Proposition 3.1 with its proof. The five public PDFs
CN/AKT/FLHS/BOX/BF and all five fixed-commit Magma files match the accepted
SHA-256 values. All five scripts were read, not executed. Zywina §1.1 and
Proposition 5.2 were read through the public PDF viewer after a direct download
timed out; no independent hash verification of that PDF is claimed. The LMFDB
Gaussian coefficient record was checked, without treating its status flag as
a proof certificate. No restricted book was needed.

One locator correction: **CN Theorem 5.2 is in §5.1, pp.73–74**, rather than
§5.2 as two passages of the preceding package said. The package fixes those
locators; the accepted packet remains unchanged. Its lifting hypotheses and
conventions were preserved.

The mandatory adversarial pass covered the definitions, theorem families,
normalizations and interfaces as follows. Scratch-only exact rational and
polynomial arithmetic passed **76 controls**. Those computations check
identities, not the truth of the proposed `sorry` proofs or the completeness
of future geometric certificates.

| Statements checked | Instances and failure controls | Result carried into the package |
|---|---|---|
| Layer 1 modularity, CM branch, all-prime/local comparisons and transport | CM curve y²=x³+1; covariant determinant versus dual inverse determinant; potentially multiplicative monodromy | Geometric CM is distinct from absolute irreducibility; dual and local normalizations retained. |
| Layer 2 twist, preparation, seed, selection and switching | p=3 simultaneous sign; p=5 basis diag(2,1); supersingular versus ordinary/multiplicative partitions; ζ5 avoidance | Fixed pairing and rigidification, independent AKT seed and all local-type hypotheses retained; no circular use of Layer 3. |
| Layer 3 lifting and density | CM/Galois field assumptions; generic witness and cyclotomic irreducibility; (0,0), (0,1), (0,64); height ≤0 | Singular pair excluded, scaling-related pairs counted separately; norm-lattice count is unweighted; quantitative density bound keeps its field-degree exponent. |
| Five rational j-functions and model degrees | Coprimality and numerator/denominator degrees; values at 1, −3, −5, 0, −1/2, 2, −1; poles at 0 and ns5 infinity | Extension degrees 4,6,3,10,6 distinguished from integer degree; totalized zero at a pole is not a finite geometric j-value. |
| B and the two level-fifteen curves | B sign at (1,2); discriminants −675, 207360000, 921600; three distinct two-torsion roots; double of a saturated generator | True point-group signatures retained; the two models remain distinct and the saturated-generator test rejects doubling. |
| Quadratic torsion and Gaussian exception | Quadratic degree; roots of −1 and 5; eight rational versus eight new Gaussian points; i²=−1 and conjugation | General quadratic rank zero is not asserted. Gaussian discriminant/j checked exactly; nonrational j cannot use rational-j modularity. |
| Genus-one model, points and rational Picard/divisor endpoints | All five weighted triples with s²=−3, including two infinity triples; quartic values; Fricke x≠0; two empty conics versus witness (3,2) | Weights (1,2,1), twist −3, both possible lift signs and the rational divisor/Jacobian distinction retained. |
| Genus-two model, Jacobian/divisor endpoints and √−11 exception | Sextic gcd with derivative, three roots and leading coefficient 9; a²−a+3; conjugation a↦1−a | Two infinity points and squarefreeness checked; exceptional coefficient a2=0, discriminant/j and nonrationality retained. Full residual image still requires its certificate. |
| Quartic models, involutions, exceptional points, rank/torsion/index/sieve endpoints | All homogeneous terms degree 4; both matrices squared; polynomial substitution; s²=−55; basis evaluations | First matrix squares to I; second to 25I and scales the quartic by 625. Both exceptional triples lie on C2. j-map transport remains a separate target. |
| Quartic group and sieve hypotheses | Exact orders 10 and 2 and independence; saturated pullback generator; index inclusions; real and imaginary quadratic branches | Only BOX's weaker 2J consequence is used. Each sieve retains finite reduction/certificate requirements; C2 is not claimed to have only real quadratic points. |
| Layer 8 residual and finite-X₀(15) modularity endpoints | Cyclotomic versus ordinary irreducibility; split-normalizer exception; d=1,2,3,5; d=10 with point (−1,6s) | Finite-point premise retained. Substitution verifies the √−10 point and rejects (−1,6); modular identification and infinite-order proof are separate obligations. |

## Validation and next step

- `lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean`: **exit 0, zero errors, 64 warnings, all `declaration uses sorry`**. The file imports only Mathlib. Mathlib's checkout was verified at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared wrapper identifies Tau Ceti's pin as `f790474821cf4256814db967cb154e7af3d0c369`. No independent Git HEAD verification of the extracted shared Tau Ceti build is claimed.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityImaginaryQuadratic.json --json`: **zero errors and zero warnings**. All 68 nodes, 69 APIs, 69 tests, 16 accepted planning gaps and 36 supplier requests remain unchanged. This read-only check does not claim the planned mathematics is implemented.
- `python3 research/blueprint/intake.py check-files` on the package and handoff: **zero problems**.
- `git diff --check`: **passed**. Mechanical inventory verified the original target/API/Check names and full API/Check bodies; prerequisites are preserved with the layer labels presented in upstream form.

Next is independent package review under the 12 October shape, followed by
the maintainer's upstream process. There is no unfinished edit for a subsequent
package worker. Implementation of the automorphic/moduli/Jacobian suppliers
and proofs is future Tau Ceti work, specified in the README. Keep `review.json`
for the independent reviewer to replace. Scratch sources and logs are removed
after submission; this note contains the results needed to reproduce the audit.
