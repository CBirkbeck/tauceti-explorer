# Independent review: Harpaz–Wittenberg16

**Verdict: revise. Review complete; extraction partial.** Reviewer: Codex, session `codex-7e92bd`. Input author: Claude Code `cc-39fac3`, PR1953, commit `9b0a683c1de906f88d584df01a647d51d5afeb6f`. Claim was confirmed on [issue1180](https://github.com/CBirkbeck/tauceti-explorer/issues/1180#issuecomment-5804407960). No self-review was performed.

The review read the full author paper and all 99 input items,11 routes,12 prerequisites and2 inherited findings. It checked each original library/planned citation, independently searched both pinned Lean trees and the atlas for all 83 original missing items, and searched the six new missing interfaces. The source scope and hashes are in the corrected extraction. [The published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p05-p.pdf) is fully available at the public URL; selected pages were collated, not a full second reading.

## Why this is a revision

There were no per-item APIs, tests or dependency arrays in the input, and many rows combine multiple definitions and lemmas. Quotations of external statements by HW16 do not close their original sources. These are substantive protocol gaps even though the paper checker accepts the basic JSON schema. The review corrects the clear errors, separates seven interfaces, supplies the general symmetric-power API/test outline and records central acyclic dependency edges. It does not manufacture a complete blueprint from a bibliography.

The most consequential extraction errors were a false affine-indexed Faddeev sequence, a universal moving/lifting claim stronger than its source, a wrong Smeets citation, a library theorem credited with a scheme-level adapter, and a built weak-approximation theorem treated as planned. The proposed ownership of three accepted HW20 targets and the Schinzel register were also wrong. Every field change is preserved in `independentReviewAudit.itemChanges`.

The resulting counts are106 items:2 library,15 planned,89 missing. All missing rows are routed once. Source/coalescing routes2,3,9,10,12,14 are accepted; routes1,4–8,11,13,15 are rejected for the exact reasons in the review JSON and paper report. Rejection does not invalidate the existing candidate; it refuses to activate this broader contribution before its contracts are adequate.

## Pinned-library and owner audit

Only two complete extracted items are credited to the libraries, both read with their hypotheses at the specified pins:

| Item | Declaration and scope |
|---|---|
|25|Mathlib `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`: commutative R-algebras, formal smoothness and I-adic completeness, lifting an algebra map modulo I.|
|99|TauCeti `TauCeti.GlobalNumberFields.weakApproximation_denseRange`, `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:202`: Field/NumberField, finite finite-place and infinite-place sets, density in the actual completions.|

Planned-stage checks covered RP.2; IG.2; R02.2/4; SF.2/4/5; RG2.0a; T.4; and upstream JacobianChallenge B/C, ClassFieldTheory10/13, Chebotarev10, GlobalNumberFields1/6. Routes additionally required WC.5, MC.0, SV.4/5, AC.5, AN.6, SF.1 and AA.4. The reviewed coverage rows distinguish built abstract carriers from missing arithmetic/geometric comparisons. There is no exact RG2.0a or MC.0 row in this coverage snapshot; no reviewed coverage verdict is invented for them.

Fourteen targeted search clusters cover every missing ID; patterns and match counts are recorded in JSON. The mathematical exclusions are:

| Search family | Result and boundary |
|---|---|
|Pairings and fibration endpoints|No pinned Brauer–Manin, modified Chow-complex or arithmetic-fibration theorem found. Abstract Brauer groups, cycles and unrelated topological fibrations do not supply these items. RP.2, SF.5 and the accepted HW20 candidate split the work.|
|Cycle geometry and moving|Set-level symmetric products and function-field divisors do not give scheme quotients, Chow moving or rational connectedness. Curve symmetric powers remain upstream; the general quotient adapter is101.|
|Approximation and norms|The strong-approximation lexical hits are function-field approximation, ideal representatives or matrix congruences; none gives102. The exact weak theorem is credited to99. AA.4’s almost-simple-group theorem is not G_a.|
|Pic-plus and Br-plus|No pinned exact carrier found. The fibration extension owns16–19; it imports Pic/Chow, sites and torus duality rather than re-creating them.|
|Brauer and cohomology|Abstract field Brauer groups, Kummer extensions and low-degree continuous cohomology are ingredients, not the scheme Kummer/purity/residue/evaluation targets. Faddeev104 belongs in SF.2.|
|Finite-field points|No pinned Lang–Weil/Ekedahl theorem found. WC.5’s current smooth-projective bounds need a uniform quasi-projective/constant-field adapter.|
|Hilbert subsets|No pinned Hilbert-subset or Hilbert-irreducibility theorem found. IG.2 owns42/66, with the original Smeets statement now checked.|
|Completions|Existing ordinary profinite completion does not prove power-quotient completion statements for arbitrary abelian groups whose M/nM need not be finite. Item47 needs a generic owner and exact supplier.|
|Local points and homogeneous spaces|Neither Mattuck nor Borovoi is found as an implemented theorem. Preserve the accepted local-points and homogeneous candidates; numerical Picard torsion or an abstract torsor is not the geometric theorem.|
|Diagonal decomposition|No pinned Bloch–Srinivas theorem found; unrelated diagonal matrix/knot combinatorics hits were excluded. MC.0 owns the correspondence direction.|
|Polynomial and sieve inputs|No pinned Schinzel/Matthiesen/Irving/Heath-Brown–Moroz target found. Möbius transformations and norms alone do not prove their arithmetic consequences. AN.6 is the conjecture register; SV.4 is bounded gaps.|
|Norm variety|Restriction-of-scalars operations on modules do not construct the Weil-restriction scheme or W. RG2.0a supplies the planned affine carrier;103 adds the precise boundary.|
|Rational fibration/corestriction|Low-degree transfer maps do not prove surjectivity on number-field character groups. Item87 is a generic CFT continuation, not private fibration machinery.|
|Split interfaces101–106|No stronger implementation found. Exact quotient, additive approximation, norm-boundary, Faddeev and Lemma9.19/9.20 source contracts are now separately named.|

## Independent checks of the four source findings

**E1: the place-set complement.** Published p275 and arXivv4 p39 retain the same proof slip. First handle places over S; the preceding argument excludes S-prime minus S. Only the remaining places outside S-prime have the integrality and unit conditions used. With t-prime=(alpha*t+beta)/(gamma*t+delta), a-prime defined likewise and b-prime=b*(gamma*a+delta), direct symbolic simplification verifies the printed norm identity. The theorem statement is unaffected.

**E2: integral choices for a nonproper total space.** Published p283 still uses unrestricted local points. Take X=G_m×P1 and beta=(x,a) for a nonsquare a. At good inert primes in k(sqrt(a)), an element x of odd valuation has invariant1/2. Changing only one outside-S coordinate to such a value already gives an adelic family for which the asserted arbitrary-choice orthogonality fails; infinitely many such choices may fail to be adelic at all.

For the correction choose a common model extending the finite group B0, include the nonintegral coordinates of the given adelic point in S, choose h in the Hilbert subset and the smooth geometrically integral locus, and enlarge S so the fibre model has integral points at every remaining place. Lang–Weil and Hensel supply these points. Both the old and new outside-S evaluations vanish; orthogonality is reduced to the retained finite set. Smeets Proposition6.1 gives a finite auxiliary T disjoint from S; apply9.17 with approximation on S union T. This repairs the integrality step conditional on the branch of9.17 being used. It does not repair E4.

**E3: properness in the diagonal lemma.** Published p265 uses the degree-zero Chow invariant for a merely geometrically integral variety, whereas the paper’s own notation defines it only for proper varieties. On A1, the principal divisor of t is[0]; its rational-equivalence class is zero but its degree is1. Hence a degree map on CH0 with the claimed meaning cannot exist in that generality. The source’s smooth proper fibre applications do not become false from this omission. Item65 retains the smooth-projective application range, with original Bloch/Srinivas source closure still open.

**E4: real points of a flat proper family.** Published p281 and arXivv4 p45 use flatness and properness to infer openness on real points and then surjectivity of each connected component onto a base component. Consider the projective cubic family

```text
y²z = x³ − x²z + t z³,   B = A1 minus {4/27}.
```

All fibres are geometrically integral: the affine cubic in x has odd degree and is never a square in C(x), so y² minus that cubic is irreducible, including at the singular parameters. The cubic discriminant is t*(4−27t). The family is flat (equidimensional fibres over the regular curve, or the affine monic presentation and the smooth chart at infinity) and projective, hence proper. Its total space is smooth: on z=1 the t derivative of the equation is−1, and at the only infinity point[0:1:0] the z derivative is1.

On the affine real chart, projection is h(x,y)=y²+x²−x³. The Hessian at(0,0) is diag(2,2), so h has a strict local minimum and the real map is not open there. The stronger component assertion also fails. The set

```text
D = { x < 2/3, h(x,y) < 4/27 }
  = { -1/3 < x < 2/3,
      |y| < sqrt((x-2/3)²*(x+1/3)) }
```

is an open disk; its bounded closure has boundary only in the excluded fibre t=4/27 and no point at projective infinity. Thus D is clopen and connected in the total real space over B, hence a connected component. Its image is[0,4/27): nonnegativity follows from h=y²+x²(1−x), and x=0 realizes each value in that interval. The base component is the strictly larger interval(−infinity,4/27). D contains smooth-fibre points with positive t, but no point over a negative c in that same base component. This is exactly the failure of the component inference, even after moving the chosen local point to a smooth fibre.

This family can be placed in the paper’s global geometric setup by a smooth proper compactification over P1, resolving away from B in characteristic zero; its section ensures a multiplicity-one component in every fibre. Choose the base coordinate so that its infinity is a smooth value in B. The counterexample concerns the asserted component map over U, not a main theorem: components of the full compactification may join through removed fibres. A smooth proper restriction would give the needed openness/local triviality, but shrinking U adds polynomials and real sign conditions to the restricted Conjecture9.2 assumption. The unrestricted Conjecture9.2 corollary can choose a smaller smooth U; the strong9.1 and totally imaginary branches avoid this specific error. The restricted weak-real9.17 branch remains a proof gate.

The [later HWW22 paper](https://www.math.univ-paris13.fr/~wittenberg/hww.pdf) gives a refined fibration framework in Theorem4.1 and discusses recovery of HW16 in Remarks5.4. The passages read did not explicitly resolve this weaker real-topology step. No claim is made that all later literature was searched or that the main theorem is false.

## Validation and handoff

The symbolic diagnostics check the Möbius identity, cubic discriminant, Hessian, boundary factorization, singular-fibre factorizations and total-space smoothness at infinity. Three numerical sanity checks accompany the written Faddeev, affine-degree and local-norm arguments; these are not formal proofs of Chow or Brauer theorems. The newly introduced construction101 has a planning API and four test specifications, not executed Lean tests.

The structural, paper and five-file intake results are recorded below. No Lean file is requested by issue1180; none was compiled. G1–G8 remain extraction work, while this review is complete. A subsequent worker should acquire the listed original sources and repair the rejected routes instead of redoing the checked source findings or moving already accepted ownership.

Final validation: paper checker passed; exact five-file intake passed (0 problems); structural audit passed (106 unique items, 89 missing items each routed once and searched, 105 acyclic edges, 15 route verdicts and four finding verdicts). Seven symbolic calculations and three arithmetic sanity checks passed. No Lean compilation claimed. Atlas inputs refreshed at `56a4451639a928390a1d48b04dc8e5c2ceb51654` and guarded by exact blobs at publication. Fresh changed-result/review ownership screened. Benoist–Wittenberg20 route3 retains universal CH0 support and diagonal action at MC.0; its route6/component-separators concern equivariant real-locus cohomology, not openness of a flat proper map. The diagonal-vanishing row itself retains GAP-DIAGONAL. Gleason–Lim–Xu26 routes1/8 retain RG2.0a and Tannakian MC.6; no replacement fibration/approximation owner is introduced. The other refreshed candidates do not replace these exact interfaces. Existing accepted HW20/HW23 and Bresciani ownership was read in full at the relevant routes.
