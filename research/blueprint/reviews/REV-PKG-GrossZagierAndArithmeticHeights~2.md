# Independent fixing review: Gross–Zagier formulas and arithmetic heights

Job: `REV-PKG-GrossZagierAndArithmeticHeights~2`, issue #10902. Reviewer: Codex,
session `codex-vSNenZ`, 19 October 2026. The reviewed revision was written by
Codex session `codex-ggn0g7`, not this reviewer. This is a completed package
review, with corrections applied in place.

**Verdict: needs_changes.** The principal remaining defect is the unspecified
local proof interface for the unrestricted quaternionic comparison: §§7.25 and
7.47 still refer to source hypotheses without spelling out the required good-
and bad-place equations and data. Consequently §8.1 is not a closed target.
Six source-dependent interfaces are explicitly marked as gaps. A successful
elaboration of the small algebraic Suggested.lean cannot resolve these gaps.

## Scope and method

Read WORKERS.md, PROTOCOL.md, the expansion protocol, UPSTREAM_GUIDE.md and
PACKAGE_REVIEW.md. Compared the shape with the ModularForms and EllipticCurves
roadmaps, and read the relevant portions of current ModularCurves and other
suppliers. Checked all 287 target blocks, their assumptions, definitions,
API/checks, internal prerequisites and mathematical boundary cases. Counts by
layer are 12, 5, 15, 13, 7, 6, 78, 109, 20 and 22. There are 85 target blocks
with explicit definition APIs; each has at least three Checks.

For source sampling, use Python's `random.Random(10902).sample(targets, 15)` on
the target-anchor order of the submitted README. The reproducible sample is
listed below. Source verification means reading the specified source, not
checking a link title. The comparison also revisited the author's blanket
qualification of YZZ book locators. Public counterparts support many of those
targets; the inaccessible book numbering itself has not been certified.

## Corrections applied

1. **§5.6, contragredient Whittaker model.** Defined W₁ with ψ⁻¹ in its
   integral and W₂ with ψ, giving models W(σ,ψ) and W(σ̃,ψ⁻¹). Using ψ in
   both models makes the real holomorphic/antiholomorphic pairing vanish by
   opposite support. Added this negative control, the conjugate norm integral,
   and the zero-tensor case. CST Proposition 2.1, p. 14 supplies the convention.
2. **§9.20, general local field.** Replaced the ℚ_p-only linear Frobenius
   description by q=p^f and semilinear φ, with φ^f linear and eigenvalues
   α/q of absolute value q^(-1/2). Added the unramified quadratic extension,
   torsion and dual-representation controls. The argument excluding fixed
   vectors now works over the stated K_v.
3. **§7.2, quasi-canonical lifting.** Replaced a request to compute lengths
   by the actual three-branch n_ℓ formula, its ramification indices, nonempty
   stratum restriction, canonical level-zero separation and quotient-exponent
   convention. Source: ARGOS, Wewers Chapter 8 Theorems 1.4 and 3.2,
   pp. 79, 84; Vollaard Chapter 11 Theorems 2.1 and 2.3, pp. 114–115.
   At q=3,s=1, ℓ=1 gives n_ℓ=2; ℓ=3 gives 6 unramified and 8 ramified.
   The empty unramified even strata cannot be fed into the final branch.
4. **§§6.29–6.30, 6.41, construction order.** Supplied the Eisenstein sum
   before its use, defined its N=1 specialization there, restricted to the
   convergence half-plane, excluded the zero pair from the unrestricted
   sums, and made the §6.29 prerequisite explicit. The previous reference to
   §6.41 was forward and unnecessary.
5. **Source equation numbers.** Removed accidental links from classical
   Chapter III equation numbers to unrelated p-adic targets in Layer 9
   (§§7.62, 7.75, 7.84, 7.99, 7.102 and 8.6). In §7.53 the relevant
   Yuan–Zhang reference is Lemma 9.5, p. 634; in §7.66 it is Proposition 9.2,
   p. 628. These are source locators, not this roadmap's Layer 9.
6. **Degenerate denominators and support.** §6.73 now requires positive n,l;
   n=0 makes its nN denominator meaningless and belongs to the separate
   boundary target. §7.91 divides κ by r_A(m) only when r_A(m)>0; the zero
   case uses the intrinsic κ formula. §8.6 uses disjoint local heights only
   when r_A(m)=0 and the tangent-normalized extension otherwise.
7. **Supplier and unit-field boundaries.** §8.6 uses the owned §0.5 CM cyclic
   pair for D=-3 because HE.1's cyclic-pair target excludes extra-unit fields.
   Cited current ModularCurves Layer 7F ST-1 for the elliptic Serre–Tate
   equivalence in the boundaries and the two CM lifting targets. The owned
   targets add coordinates and lifting lengths, not a second equivalence.
   §7.4's exceptional set now contains the exceptional *nonsplit* places;
   a set of nonsplit places cannot contain every ramified split place.
8. **Definition tests and source limits.** Replaced the tautological
   one-dimensionality check in §8.5 by a wrong optimal-intersection order,
   and tested a vector moved by U. Retained the order-three character witness.
   Marked the six unresolved interfaces below; removed the assertion that all
   book inputs have public counterparts. Added public CST locators for
   §§1.2, 3.2–3.4, 3.6 and 8.12. The zero-Hom proof in §8.12 no longer
   imports the global formula it does not use.
9. **Suggested.lean and prose.** Added `bdpEulerFactor 1 2 = 0`, and extended
   the closing comment to name the newly owned geometric/analytic definitions
   omitted from Lean. Recast source-framing prose, corrected a grammatical
   error in §2.9, replaced a stale AL.0 special-function contract by the owned
   §6.2 target, and identified the D=-4 matrix example as outside the odd-D
   arithmetic range.

## Source sample: 15 targets

Page numbers below are printed/source pages, not a PDF viewer's index.

| Target | Source opened and locator | Result |
| --- | --- | --- |
| 0.6 | LMFDB 37.a1, real period and discriminant | Δ=37 and full period 5.9869172924… give Ω=2Ω⁰. |
| 3.3 | CST arXiv:1408.1733v2 §1.2, p. 4 | Rational ξ-normalized maps and Hom⁰(J_U,A) colimit agree; added this public locator. |
| 4.1 | CST §3.1, p. 21 | Inverse character and matching central character agree; README separately specifies the archimedean continuity category. |
| 5.6 | CST §2.1 Proposition 2.1 and (2.2), p. 14 | Global constant agrees; corrected opposite Whittaker characters. |
| 6.4 | Yuan–Zhang, Annals 187 (2018), §8.1, pp. 605–607 | Componentwise subtraction of ξ agrees. |
| 6.30 | Gross–Zagier IV §1, pp. 271–272 | Möbius scaling agrees; supplied the earlier definition and convergence domain. |
| 6.41 | Gross–Zagier IV Proposition (1.2), p. 272 | N^s and gamma factors agree. |
| 7.85 | Conrad Theorem 9.6, (9.16)–(9.18), pp. 129–130; Lemma 10.1, pp. 131–133 | Tensor correction, η tangent and étale-branch factor agree. |
| 7.89 | Conrad Theorem 10.5(1), pp. 134–135 | Half valuation and diagonal term agree for the modified intersection. |
| 7.98 | Conrad Appendix (A.9)–(A.10), p. 140; Theorem A.17, pp. 156–161 | Stabilizer-weighted count and strict summation endpoint agree. |
| 7.104 | Gross–Zagier II (3.17), p. 247 | Sign and 2u² coefficient agree. |
| 8.5 | CST Definitions 1.3–1.4, pp. 5–6; Proposition 3.7, p. 24 | Optimal-order and test-vector conditions agree; improved discriminating Checks. |
| 8.7 | CST §1.2, p. 6 and §2.3, p. 18 after (2.4) | Trace recovery and F/K height factor agree; extension to L is bilinear and adds [L:M] in the trace. |
| 8.12 | CST §1.2, p. 6 and §3.1, p. 21 | Public local zero-Hom plus the stated tensor-factor argument proves this interface; YZZ book p. 9 numbering not certified. |
| 9.19 | Skinner arXiv:1405.7294v1 §2.6 Corollary 2.6.2, p. 14 | Point/logarithm equivalence agrees, with the separate eigencomponent input retained. |

Public copies used were the linked author, journal or institutional copies:
[CST](https://arxiv.org/abs/1408.1733v2),
[Gross–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf),
[Conrad](https://library.slmath.org/books/Book49/files/05conrad.pdf),
[Yuan–Zhang](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf),
[ARGOS](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/argos.pdf),
[Skinner](https://arxiv.org/abs/1405.7294v1).
Also read the relevant new-input statements in the 2026 YZZ author erratum,
Česnavičius–Neururer–Saha, Prasanna, BDP, Brooks, Castella, Castella–Hsieh,
Burungale, Burungale–Skinner–Wan and Yuan's modular-heights paper. For the
small-ramification abelian-scheme statement, read the cleared BLR source
in place: §7.5 Theorem 4, p. 187, with e<p−1. No restricted source file or
passage was copied into the repository.

## Remaining defects, with the required repair

**R1 — local comparison interfaces, §§7.25 and 7.47.** These are mathematical
specification gaps, independent of source availability. §7.25 says “under the
source's degeneracy assumptions” and “standard good local data” without listing
them or defining the local quantities in its equality. State the actual
Schwartz functions, level/conductor restrictions, lattice/measure normalization,
and comparison equations for each local case used by the global proof. Separate
the archimedean projection statement from finite deformation lengths.

§7.47 promises nearby Φ(v) and equality away from a finite S without constructing
those functions or specifying S and the bad-place local equations. Supply those
targets and their hypotheses. Weak approximation correctly extends an already
established equality of automorphic functions; it cannot construct that equality
at a bad place. A final Gross–Zagier theorem, or the explicit classical modular
calculation elsewhere in the package, does not supply this general quaternionic
interface. §8.1 and unrestricted consequences must remain contingent until R1
is repaired. This review did not replace the missing interfaces by another
assertion of the final theorem.

**R2 — unresolved YZZ source confirmation.** The author's qualification of the
2013 locators was pursued through the public 2011 draft link and author mirrors.
The linked draft returned HTTP 403; attempted official-host filenames did not
provide the draft. The 2013 book is not in the cleared library. The remaining
unverified interfaces are:

| Target | What still needs confirmation |
| --- | --- |
| 1.1 | Exact Poincaré-height construction/normalization locator. The stated RP.0 and biextension inputs are separate. |
| 7.4 | The displayed S¹ valuation inequalities, S² orbit-zero condition, global small-level assumptions and nonzero toric-contraction assertion in the cited YZZ reduction. These conditions are present, but not verified. |
| 7.5 | The precise nearby coherent-kernel/global projection statement; the local zero-Hom ingredient alone is sourced independently. |
| 7.25 | R1's exact good-place interface and its locator. |
| 7.47 | R1's nearby-function construction and bad-place comparison locators. |
| 8.1 | The projected kernel identity locator and the dependence on the preceding local interfaces. |

The README now marks every entry explicitly. Public CST, Zhang's survey,
Yuan–Zhang and the erratum support other book-referenced interfaces; that is not
a verification of the book's page numbering. No assertion of acceptance rests
on a search-engine snippet or inaccessible book.

## Prerequisites and current-library duplication

Read current upstream at commit `0d144d044dacebca17b654695b6f1ad58f159b27` and
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The compilation
baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474`; current-library findings were not mistaken for pinned imports.

The object search covered the 287 targets by the families in the adversarial
table, across current README/Suggested.lean files, Completed roadmaps and the
current library. It included all nine roadmaps newer than the atlas snapshot
and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. The relevant near matches were read, not counted as hits
merely because their names contained “Poincaré” or “Weierstrass”.

- Current elliptic CanonicalHeight/Basic and MordellWeil/Regulator supply
  h_x, its half-polar pairing, the Gram determinant and rank-zero value. These
  are already imports. Rational scalar extension and dual/coefficient-field
  heights have different domains.
- Current ModularCurves supplies the Cartier–Nishi isogeny pairing and Layer
  7F ST-1. The former is not a metrized arithmetic Poincaré height; ST-1 does
  not state the CM coordinate equations or quasi-canonical length formula.
  The ST-1 boundary is now explicit.
- DifferentialGeometry's Poincaré pairing is a de Rham integration pairing.
  IntegralLattices and OrthogonalSpinGroups provide general quadratic/group
  structures. Their objects do not duplicate CM Hom counts or arithmetic
  height comparisons.
- Read pinned Mathlib's Mahler, Amice and Weierstrass-preparation statements:
  the transform is coefficient-valued, its general inverse is additional work,
  and preparation already permits arbitrary residue fields. Current Tau Ceti's
  restricted-series preparation has a different domain from formal R[[T]].
  §9.3 already imports preparation and plans the missing coefficient inverse.

**Removals in this review: none.** The prior revision's removal of the duplicate
graph-measure target is not attributed to this review.

The old 99-contract defect cannot simply be carried forward as the verdict.
Read the new ArakelovGeometryAndAbelianHeights §§1.1–1.4, 1.8–1.10, 1.15:
these now supply actual arithmetic divisors, pairings and model/metric inputs.
Its squared-metric ddᶜ convention is transported by G=2g, not silently equated.
ComplexComparisonPartII C5.3 supplies the smooth elliptic/Green inverse; the
local logarithmic cutoff for a point source is separate work in this package.
The eleven new owned prerequisite targets also remove the old imaginary imports
of projectors, CM lifts, diagram Hom, cotangent saturation and CM moments.

Read HE.1's point constructions before its height consequences: GZ Layer 3
can supply the normalized Hodge class before HE.1 uses it, and later GZ targets
then use HE's geometric points. Read GH.4's BDP Theorem 5.13 interface with all
Assumption 5.12 clauses: its geometric/AJ specialization does not consume GH's
later GZ converse. Thus those specific old target-level cycles are not the
remaining rejection reason. The internal Needs graph has no cycle.

CaraianiNewton.md orders 88 units for that theorem; GZ, HE and GH are outside
that order, while AutomorphicPadicLFunctions and PadicHodgeRegulators are
explicitly excluded/moved in that programme. No fictitious GZ tier was assigned.
This review checks the actual interfaces and target order; it does not certify
an unlisted roadmap's complete lower-tier upstream scheduling. The eventual
port needs an explicit schedule for these suppliers. There are no
FoundationsAndLibraryIntegration or UPSTREAM placeholder contracts here.

## Adversarial pass over all targets

Every range below was read, including each convention and API-bearing
definition. Boundary cases outside a target's hypotheses were treated as
negative controls, not purported counterexamples. This table records the
mathematical probes, rather than equating test counts with correctness.

| Targets | Instances and convention witnesses | Result/change |
| --- | --- | --- |
| 0.1–0.12 | Rank 0 determinant 1; rank 1 factor 2; rank 2 scaling 4; torsion; degree-h field change; order-three reciprocity; u=1,2,3; central zero | Existing distinctions retained; no second library height planned. |
| 1.1–1.5 | Zero/torsion points; dual action versus ordinary action; quadratic coefficient extension with trace 2; inverse characters; descent of rational classes | Coefficient and field-relative factors retained; 1.1 source gap explicit. |
| 2.1–2.7 | Squared versus unsquared Green metric; genus 0,1,>1; bridge/infinite complementary resistance; loops; zero divisor; degree-zero principal divisor | No division by 2g−2 at g=1; graph and analytic normalizations remain separate. |
| 2.8–2.15 | Green mean shift; weak mean −1; residue sign; coordinate rescaling; common-support tangent correction; real conjugation | Preserved the additive constant and squared norm. Fixed §2.9 prose. |
| 3.1–3.13 | Degree-one/zero maps; constant normalized maps; pullback of ξ; rational versus integral differential; p=2 and wild reduction; isogeny composition | Explicit integrality/optimality hypotheses retained; public realization locators added. |
| 4.1–4.7 | Wrong central character; zero local Hom; split étale torus; archimedean continuous Hom; ramified χ with spherical vector; pairing value zero | Quotient only for nonzero pairing, bilinear integral without quotient otherwise. |
| 5.1–5.6 | Split (3,1) range; unramified tensor; scaling coefficient and norm; χ versus χ⁻¹; real holomorphic/contragredient support | Corrected §5.6 opposite ψ characters and added witnesses. |
| 6.1–6.19 | k=1 regularization versus convergent projection; n=0,1,2 polynomial; r=0/top degree; zero representation; zero CM sum; inverse genus sign | Kept growth domains, factorials and the polynomial value p₂(1)=−1/2. |
| 6.20–6.40 | Componentwise degree zero; wrong maximal-order containment at split residue F₂; two auxiliary places; 0-index Whittaker terms; original versus nearby j | Algebraic/analytic specializations remain named owned targets, not generic supplier promises. |
| 6.41–6.60 | N=1 level term; signed n versus abs n; l=0 boundary; local conductor/different; two-term auxiliary cancellation; missing Euler factors | Earlier Eisenstein definitions and source-number corrections applied. |
| 6.61–6.78 | k=1; central zero; n=0 denominator; m≥1 Fourier coefficient; logarithmic Mellin finite part; old/new orthogonality | Positive n,l added to 6.73; boundary coefficients kept separate. |
| 7.1–7.5 | Q=Q′=1; a=1,b=0 versus a=0,b=1; identical sections; q=2; s=0,1; ramified different; nonzero maps in characteristic 2; wrong local sign | Explicit lift-length branches added; YZZ-only reduction interfaces marked gaps. |
| 7.6–7.24 | Split/inert/ramified shells; split residue F₂; q−1 versus q+1; diagonal exclusion; regularized parameter 0; ± orbits; m=0 excluded | No q=1 field admitted; stabilizers, zero norms and finite-part restrictions retained. |
| 7.25–7.47 | Good versus wild places; original j versus nearby j; unipotent coordinates; r_A(m)=0; wrong Hasse invariant; continuity/automorphy before density | R1 remains: good-place equation and bad-place approximants underspecified. |
| 7.48–7.69 | Proper versus j-part height; degenerate Schwartz; resolvent residue sign; D=-4 matrix; nontrivial scalar; inert versus ramified norm lattice | Corrected source Lemma/Proposition numbers and scoped the even-D example. |
| 7.70–7.89 | Empty ideal sums; endpoint n=0; diagonal tangent; unit fields u>1; inert half odd valuation; η tangent; N=1 cusp collision | Source-number links repaired; modified and cotangent pairings remain distinct. |
| 7.90–7.109 | r_A(m)=0; noninteger average k; strict norm endpoint; ramified half-count; log Norm(v); h and u² factors; determinant sign | Removed 0/0 in κ/r; exact total finite/archimedean constants retained. |
| 8.1–8.10 | Trivial group; order-three character; characteristic dividing group order; wrong optimal order; trace versus probability average; N=1; D=-3 | Improved admissibility tests; unit-field supplier fixed; local gaps propagate to 8.1. |
| 8.11–8.20 | Zero Hom and zero evaluated α; conjugate versus bilinear character; M⊂L trace; one versus every real embedding; complex/trivial χ | No arbitrary-character Hermitian converse inferred from a bilinear height; 8.12 no longer imports 8.11. |
| 9.1–9.5 | e=p−1 excluded; p=2,e=1 excluded; torsion algebraic point; infinite residue field; zero series; Q=1; annular primitive constant | New targets have concrete data/APIs; small-ramification condition retained. |
| 9.6–9.14 | p=5,a=1 and −4; p=1,a=2; square scaling; N⁻=1; nonprimitive JL lattice; good versus multiplicative Euler factor; wrong tame branch | Added Lean zero-factor control; integral JL and branch transport are separate targets. |
| 9.15–9.22 | Trivial character outside interpolation range; character not factoring through Γ; torsion/zero localization; actual point versus tensor; q=p^f; p=23 finite factor 25/23 | No p-unit claim from nonvanishing; corrected Frobenius generality; real-embedding subgroup hypothesis retained. |

No Tate-thesis theorem or theorem-number locator was introduced. The specified
torus volume is a normalization convention from the stated formula/erratum,
not a new claim to prove the norm-one idele-class volume from Tate's thesis.

## Lean signatures and validation

Suggested.lean has 196 lines and eight light, real-bodied definitions. Its
heavy arithmetic constructions remain README targets and are named in the
closing comment. The ten signature comparisons were:

| Signature | README agreement / scope |
| --- | --- |
| unitIndex | Rational half torsion-order for any number field; CM interpretation restricted to imaginary quadratic. |
| completed_derivative_at_central_zero | N>0, differentiability at 1 and L(1)=0; full Gammaℂ convention. |
| rankinPolynomial | ℚ coefficients, finite binomial sum with j! denominator; not the entire analytic kernel. |
| chiIsotypic | Inverse-character kernels; no characteristic-zero projector assertion. |
| heegnerFinite | Character-weighted finite representation sum, not a construction of CM points. |
| heegnerAverage | Inverse group order in a field; characteristic-dividing-order value is zero. |
| heegnerAverage_isotypic | Finite group change of index, valid also when the average is zero. |
| heegnerAverage_pairing | Bilinear pairing and inverse squared cardinality; explicit nonzero-cardinality hypothesis. |
| bdpLFunction / evaluation | Supplied PowerSeries root and normalization unit; arbitrary commutative coefficient ring; no measure-existence theorem asserted. |
| bdpEulerFactor_ne_zero | Rational p,a, p>1, real Hasse bound; p=1,a=2 is the recorded failure. |

`lean-check` exited 0 at the pinned build, with 26 warnings, all “declaration
uses sorry”. Available memory was 82 GB before the final elaboration. No
language server, Lake build, update or cache download was started. Elaboration
does not certify the mathematical truth of the sorry'd signatures.

The three existing GZ packets were checked read-only with
`scripts/check_blueprint.py`: each returned 0 errors and 0 warnings. Their
recorded gaps are not resolved by those structural checks, and no packet was
edited. The final internal-anchor/Needs check found 287 targets, no unresolved
internal links and no internal dependency cycle. `intake.py check-files` and
`git diff --check` were also run on the final deliverables; results are recorded
in the handoff.
