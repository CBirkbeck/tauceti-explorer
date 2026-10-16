# Independent package review: ColemanIntegration, revision 3

Job [#9881](https://github.com/CBirkbeck/tauceti-explorer/issues/9881),
`REV-PKG-ColemanIntegration~3`. Reviewer: Codex, session `codex-JQSj4l`.
Date: 2026-10-16. Verdict: **accepted, with the corrections below applied**.

This reviews the package prepared by another session, not the reviewer's own
work. The preceding review rejected the construction-heavy suggested file at
the mandatory shape gate. The replacement passes that gate, allowing this
review to complete the source, prerequisite, duplication and mathematical
checks that the preceding review explicitly did not certify.

## Scope and fidelity

Read WORKERS, PACKAGE_REVIEW, the applicable PROTOCOL sections, UPSTREAM_GUIDE,
the preceding review, the revision handoff, the accepted packet, the library
coverage entry, and the complete package README and Suggested.lean. The two
upstream form models were ArithmeticDirichletSeries and
Completed/ContourIntegration, including their suggested files.

The accepted packet has 177 target nodes, 257 API entries, 124 baseline entries,
134 tests, 22 planets and 23 requests. Its seven historical gaps and upward
references are inputs to assess, not interfaces automatically available to the
package. The README retains its 197 target subsections, including the additional
foundations needed to replace those references. No packet, API or existing
Check was deleted during this review. The package contains 65 Checks blocks and
248 Check bullets after the additions. Every one of its 43 explicitly labelled
Definition or Construction subsections has at least three discriminating
Checks. Additional definitions embedded in theorem subsections were checked as
well. Counts are inventories, not evidence of mathematical correctness.

The README has the required opening summary, boundaries, conventions, exact
supplier contracts, ordered layers, source locators, proof routes, APIs and
worked examples. Removed the remaining internal finding identifier. Metadata
remains the fitting single line `topic = "math.NT"`. The mathematical prose is
in its authors' own words; neither sources nor source-by-source summaries are
reproduced. No public PDF or extracted passage is part of this submission.

## Corrections made

1. **Supply the missing finite-word Taylor estimate.** L1.21 previously relied
   on a uniform connection estimate not supplied by AdicSpacesPartII F1, and
   L1.22 left the general lift-independence argument as a separate obligation.
   The replacement proves the estimate for the finite word connection, rather
   than for an arbitrary integrable connection. At fixed depth its length
   filtration has trivial graded connections. Scalar diagonal-tube estimates
   come from RD.3.5 and RD.3.12; at most the depth-many integrations introduce
   polynomial denominator loss. On common closed affinoid fringes the terms
   are bounded by `C (j+1)^c (δ/R₀)^j`, with `|π| < δ < R₀ < 1`.
   Only after proving convergence does the argument apply the coordinate
   criterion and stratification theorem RD.3.17–RD.3.18. Finite étale charts,
   annular charts, restriction and coherent descent replace a nonexistent
   global basis of differentials. The API names convergence, coordinate
   independence, cocycle and realization separately. L1.22 and L1.43 now use
   this result; cohomological independence comes from RD.4. The ramified
   uniformizer and a non-unipotent exponential give negative controls.
2. **Supply the differential/dualizing-sheaf comparison.** JacobianChallenge
   Layer B supplies divisor Riemann–Roch, duality and the dualizing sheaf, but
   does not itself state the required identification with differentials.
   L1.9 now owns `goodReduction_differentialsEquivDualizing` for a smooth
   proper curve, with finite-base-change and divisor-twist compatibility.
   The proof route uses differential principal parts and the residue trace
   `Σ_x Tr_(κ(x)/K) res_x`, then the representing property of the imported
   dualizing sheaf. The precise additional source is Stacks Lemma 53.4.1(6),
   with Lemma 53.4.4(2) for base change, in §53.4, tag 0E31. Checks include
   the projective line, a genus-one invariant differential and the failure
   for the nodal ring `K[x,y]/(xy)`. No dualizing sheaf is constructed twice.
3. **Make both regulator signs use the chosen raw symbols.** L3.Fb.5 already
   used the raw de Jeu sign `(-1)^n`, while L3.Fc.3 used the adjusted
   cyclotomic convention. BBdJR Remark 4.16, p. 21, explicitly changes its
   comparison map by this sign. The package now consistently retains the
   raw-symbol convention: both regulators have factor `(-1)^n (n-1)!`.
   Updated both determinant formulas, the convention paragraph and the
   later regulator formulas. At `n=3, N=2`, the complex regulator of
   `[-1]₃` is `-2P₃(-1) = (3/2)ζ(3)`; its comparison coefficient is `2/3`.
   This detects a sign omitted from just one side. The corresponding p-adic
   value is `-2Li₃(-1)`. The construction of the cyclotomic classes, rather
   than their later independence proof, is the prerequisite of L3.Fc.3.
4. **Correct exact suppliers.** Exact K₀ is in GrothendieckEulerForms Layer 2,
   not merely its Layer 1 generator engine. Corrected the boundary contract,
   L3.Fa.1 and the layer dependencies. Added the explicitly used vector-bundle
   and Koszul suppliers to the L3 dependency list. The new Taylor contracts
   are named precisely; none is an assumed general convergence theorem.
5. **Correct the nonsplit-divisor witness.** The example over `ℚ₃` given by
   `x²-2` is a degree-two finite étale divisor with no rational point.
   A dyadic discriminant-divisible example would not demonstrate that claim.
6. **Correct the Artin parity counterexample.** A totally real base alone
   does not ensure that the kernel field is totally real. The example now
   uses base `ℚ` and character `χ₋₄`, whose kernel field is `ℚ(i)`.
7. **Correct two smaller assertions.** The differential equation in weight
   one still has an integration constant; normalization fixes it separately.
   The Teichmüller twist disappears under the given weight congruence, but
   that is not an if-and-only-if test for equality of particular numerical
   values. BBK Definition 3 is on p. 3, not p. 4; fixed both occurrences.

The suggested file changes only its closing inventory of README targets to
include the now explicit comparison and finite-chart transport. None of the
new geometric constructions is inserted into Lean as a placeholder carrier.

## Source verification

Used a fresh deterministic sample: `random.Random(9881).sample(nodes, 15)`
from the packet's ordered nodes. Opened the public primary texts and read the
indicated passages. Source abbreviations and edition URLs are those in the
package References. The sample is independent of the preceding revision's
seed. In the table, a framework citation supports a construction route; it
does not claim that the paper states the package's derived identity verbatim.

| Target | Passage checked and conclusion |
| --- | --- |
| L0.10, logarithm radius | BBK §2 p. 3 and F §2.1 p. 7: logarithm framework. The ultrametric radius estimate is proved from the coefficient bounds here. |
| L3.22, off-centre transform | RJW §3.5.2 p. 20 and Lemma 4.3 p. 27: scalar rotation framework. The exact quotient identity follows from the displayed finite polynomial identities. |
| L1.7, Frobenius datum | BH proof of Theorem 2 p. 8 and BT §5 p. 18: forms, Frobenius matrix and correction terms. |
| L1.44, four local charts | F §2.1 pp. 7–9 and Proposition 2.11 p. 10: analytic functorial framework. Independently substituted all sixteen local parameters in the rational maps. |
| L3.9, primitive fibres | RJW proof of Theorem 6.1(ii), case (1), p. 38 and Remark 5.3(ii) p. 30: fibre cancellation. |
| L0.23, annulus branch change | BBK §2 p. 3 and F §2.1 p. 8: branch logarithms; the Laurent-log substitution follows directly. |
| L1.3, residue discs | BBK Definition 3 p. 3, BT §5 p. 18, MP §5.2(1) p. 6 and BH Definition 2 p. 6. Corrected the BBK page. |
| L3.10, Euler factor | RJW proof of Theorem 6.1(ii), case (2), p. 39: p-power reindexing and its factor. |
| L3.16, Beilinson conjecture | BBdJR Definition 3.6 p. 11, Proposition 3.12 p. 12 and Conjecture 3.18 p. 14: determinant conventions, ranks and conjectural nonvanishing. |
| L2.30, complex roots | RJW Remark 6.6 and Theorem 6.7(i) p. 39, BBdJR Proposition 4.17 p. 22 and BDJ Remark 1.5 published p. 870. The package already corrected the packet's p. 40 locator. |
| L0.9, local nonuniqueness | BH §1.2 p. 2 and F §3.1 p. 15: local analytic primitives versus Coleman normalization. |
| L3.11, root choice | RJW Remark 5.3 p. 30: Gauss-sum covariance. The package uses the conductor-general supplier for its generalization. |
| L1.32, singular discs | F Proposition 2.11 p. 10 and RJW Remark 6.6 p. 39: whole removed-disc expansions; distinguish the actual germ from a separately normalized local family. |
| L3.15, syntomic symbols | BDJ preprint Theorem 1.12 and Remark 1.13 p. 6; BBdJR Remark 4.15 p. 21. Checked the regulator and Gros correction separately. |
| L2.64, infinity determination | F Proposition 2.11 p. 10 supplies the expansion framework. The parameter inversion and identity-principle deduction are the package's proof, not a named source theorem. |

Also checked the flagged or potentially misleading passages from the revision
handoff and the foundations, independently of that sample:

- RJW arXiv v2 Definition 5.18 and Remark 5.19 p. 35, Theorem 6.7(ii) p. 39,
  and the published theorem on p. 154: the twist omitted from the theorem is
  necessary in its own normalization. Retained the package's corrected formula.
- BBdJR Remark 2.5 p. 5 against Theorem 2.2: use the theorem's rank parity.
  Theorem 2.9 p. 6 and Remarks 2.12–2.13 p. 7: distinguish dyadic normalization
  and the non-abelian existence assumption. Example 4.10 p. 19: the primitive
  basis range includes `j=1`. Equations (4.2)–(4.4) pp. 17–18: weight-one
  inversion needs its separate exclusion. Remark 4.16 p. 21 and the proof of
  Proposition 4.17 pp. 22–23: raw versus adjusted comparison maps and the
  rational/dyadic case. These observations do not assert nonvanishing in the
  conjectural part (4).
- BDJ Remark 1.5 published p. 870 and BBdJR (4.12) p. 20: the factorial in
  the modified polylogarithm convention. BDJ Proposition 2.11 p. 879, §3
  pp. 879–883 and the reduced comparison p. 909: distribution, localization
  at special units, and unreduced versus antisymmetric tensor differentials.
  DJ §3 p. 7: the integral antisymmetric quotient retains diagonal 2-torsion.
- BC printed pp. 8–18, especially 2.4/2.6, 3.1 and 3.7: relative rigid
  complexes, the Laurent homotopy and the projective-line Čech calculation.
  Its later sketch is not treated as a general regulator-construction proof.
- Quillen §1–§2, published pp. 89–104, especially Theorem B p. 97, exact
  categories p. 99 and the Q-construction pp. 100–104. Feliu v2 §1.2–§1.5
  pp. 4–8, Definition 2.15/Lemma 2.16 p. 15, Proposition 3.17 p. 37 and §4
  p. 40: exact cubes, homogeneous Koszul pieces and Adams operations.
- FPZ §6 pp. 19–22: determinant cross-ratios. The package explicitly uses
  a permuted convention, witnessed by `(∞,0,1,3) ↦ -2`; it does not silently
  identify that value with the paper's differently ordered cross-ratio.
- GSWZ (54) p. 19: retain the corrected multiple-counting coefficient.
  Stacks §53.4, tag 0E31: read the smooth comparison and field-base-change
  statements directly for the new L1.9 target.

No inaccessible book was needed. The source checks establish these locators and
the cited hypotheses, not a line-by-line verification of every proof in every
paper. All nineteen downloaded PDFs were confined to disposable scratch.

## Prerequisites and current-upstream duplication

The pinned elaboration environment uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Read actual declarations, rather
than relying on names, for power-series coefficients and derivatives, inverses,
restrictedness, analytic radii, logarithm series, Teichmüller lifts, Amice
transforms, finite Fourier/Gauss conventions, Bernoulli and exponential zeta.
In particular the existing Tau Ceti logarithm radius theorem requires a
continuous `ℚ≥0` action; it does not directly supply the p-adic radius theorem.
The ℤ_p Amice equivalence does not supply arbitrary O_K-valued measures.

The read-only current-upstream audit used roadmap checkout
`0d144d044dacebca17b654695b6f1ad58f159b27` and library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched by mathematical objects
through active roadmaps, all nine newer roadmaps specified by WORKERS, all four
listed Completed roadmaps, their suggested files, and the current library.
Followed relevant matches to their statements:

| Existing owner | Boundary checked |
| --- | --- |
| GrothendieckEulerForms Layers 0–2 | Exact categories and exact K₀ imported; Quillen higher K-theory and Adams operations remain additional targets. Corrected Layer 2 locator. |
| AlgebraicVectorBundles L0A–L0C | Exact pullback, tensor, symmetric and exterior powers imported. |
| IntegralHeckeAndGaloisDeterminants §6.4 | General linear-functional Koszul complex imported. The homogeneous pieces, gluing and Adams application are the additional work here. |
| JacobianChallenge B; StableReduction 2 | Divisor duality and dualizing sheaves exist; neither supplies this explicit smooth differential comparison. No relative dualizing-sheaf construction is duplicated. |
| AdicSpacesPartII F1; rigid-cohomology RD.3–RD.6 | Fringe/descent/diagonal-tube machinery imported. General stratifications are imported with their convergence hypothesis; finite-word convergence is proved here. |
| RepresentationTheory induction/restriction 6 | Brauer and monomial induction are suppliers. Current library statements include `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` and `FDRep.exists_character_eq_indClassFun_of_isNilpotent`; neither is replanned here. |
| AdelicAlgebraicGroups §2.4 | Inertia Euler factors and induction imported; the kept Artin target adds coefficient assembly. |
| Current local-field logarithms and Teichmüller | Existing local-field APIs imported for compatibility. A branch on ℂ_p is a different carrier and remains a target. |
| Completed/ContourIntegration; unit-lattice regulators | Complex contour residues and number-field unit regulators do not supply p-adic annular residues or higher K-theory regulators. |

No additional target was found already supplied by current upstream, so there
are **no target removals** in this review. The retained variants above state
their added content. In particular searches found no existing Coleman/shuffle
system, Bloch-group construction, scheme higher K-theory/Adams package or
syntomic cohomology regulator supplying these targets. This is a mathematical
overlap audit, not a claim to have read every library file.

Checked the package's supplier references against the tier order. The geometric
and measure prerequisites are lower-tier suppliers; the two named arithmetic
companions are bundle suppliers. The higher-roadmap references in the accepted
packet are replaced by the owned foundations L3.Fa–L3.Fd. There are no
`FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisites in the package.
The construction/vanishing and class/independence distinctions in the build
order prevent a circular appeal to the regulator theorem being proved.

## Adversarial mathematical pass

Read every target and convention, following prerequisite chains and checking
the displayed identities. This table groups the full target ranges; it records
the discriminating instances used, rather than listing 197 separate rows.

| Statements covered | Instances and conclusion |
| --- | --- |
| L0.F, L0.1–L0.6 | Integer weights including 0 and negative weights; coefficient 2 of q₁; zero constant; primitive of 1; characteristic-p obstruction; open radius versus closed boundary. Characteristic zero and the ℚ-algebra hypotheses are essential. |
| L0.7–L0.10 | Positive radius, infinite radius and impossible radius zero; indicator of a proper clopen subdisc; locally constant derivative-zero counterexample. Whole-disc analyticity is essential. |
| L0.11–L0.25 | Residue of dt/t, vanishing residues of exact forms, negative Laurent powers, branch changes at p and units, regular-log versus Laurent-log constants. CT(t⁻¹)CT(t)=0 while CT(1)=1; no false multiplicativity. |
| L1.1–L1.9 | Empty and nonsplit divisor, degree rather than rational-point count, projective line and multiplicative group, q>1, rank zero, identity lift violating weights. Added the smooth-duality target and corrected the nonsplit witness. |
| L1.10–L1.16 | Trivial orbit, zero module, positive orbit lengths, eigenvalue 1, empty word, one-letter logarithm powers and shuffle multiplicities. The affine orbit equation needs finite-dimensional invertibility of 1−T^m. |
| L1.17–L1.24 | Basepoint constants, normalized integration of dt/t, equal-q lifts, nonfree differential module and finite ramification. Replaced the unprovided Taylor estimate and separated cohomology independence from realization comparison. |
| L1.25–L1.44 | Punctured lines, special units, p=2, all four argument maps and all sixteen ordinary/end parameters; no ends-to-ends assumption at an ordinary target image. Denominators have unit norm on the stated discs. |
| L2.Fa, L2.1–L2.17 | Integer series weights, zero, 1+p divergence, value at 1 only in the permitted weights, inversion/distribution exclusions, tangential normalization and branch changes. Complex weight-one boundary convergence is ordered, not unordered tsum. |
| L2.Fb, L2.18–L2.31 | Integral versus rational relations, diagonal 2-torsion, boundary signs, branch pairing, complex versus p-adic inversion, roots in singular discs and parity. At i the complex dilogarithm has the Bernoulli term while the p-adic identity has different parity behavior. |
| L2.32–L2.71 | Admissible x,y and x≠y, transformations with poles excluded, separated and coincident residue discs, whole-end determination, constant defect and geometric boundary. Homogeneous cross-ratios are total as functions, but analytic identities require distinct points. The scalar-to-projective theorem explicitly assumes both two-term laws. |
| L3.Fa.1–L3.Fa.5 | Zero exact category, K₀ split relation, cubes and d², homotopy fibres, rank-one Koszul piece, rank-two ψ² versus squaring, nontrivial normal bundle, special units versus arbitrary units, n≥2, symbol at 1 versus extended class, N=2 and primitive basis range. No unsupported pure-weight shift for general immersions. |
| L3.Fb.1–L3.Fb.6 | Cone d² and map (a,b)↦(a,−b), Laurent exponent zero, two-point boundary normalization, nonfixed endpoint, tensor rather than exterior logarithm pairing and raw regulator sign. A plus-db cone convention would fail d². |
| L3.Fc.1–L3.Fc.3 | ℚ at n=2 and n=3, one complex pair, integral lattice versus rational span, componentwise invertibility, cyclotomic parity, P₁ inversion counterexample, conjugation at i, n=3/N=2 sign witness and Gauss product N. Corrected the mismatched raw-symbol determinant sign. |
| L3.Fd.1–L3.Fd.2 | Trivial and direct-sum representations, inertia invariants, coefficient embeddings, totally real base versus kernel field, χ₋₄, dyadic conductor 4 and conditional non-abelian value existence. Corrected the kernel-field counterexample. |
| L3.1–L3.13 | w=0,1,−1; geometric denominator on/outside the disc of 1; k=0 negative moment; p roots counted with multiplicity excluded; primitive conductor N≥2; Gauss sign and Euler factor. Separate inverse expressions are not used at the centre. |
| L3.14–L3.16 | n=2 tensor correction, n=3 raw sign, modified-polylog factorial, embeddings and conjectural units separated from proven rank comparisons. |
| L3.17–L3.35 | b=1, b=2 and removable value 1/2; |b|=1, finite polynomial substitution, inverse coefficient bounds, coefficient extension, pure p-power and mixed conductors, nontrivial character for pseudomeasure division, and the retained ω^(1−k) twist. |
| L3.36–L3.37 | N=2, imprimitive characters reduced to conductor field, trivial χ at N=4, odd primes versus p=2, and the same raw-symbol sign on both regulator sides. Parts (1)–(3) are not conflated with conjectural unit part (4). |

As a supplementary arithmetic check, evaluated the sixteen parameter identities
at fifteen exact rational `(v,t)` pairs (240 equalities), and the finite
smoothing identities and removable values for `b=1,…,11`. All agreed. These
finite calculations supplement the algebraic derivations; they are not proofs
of the general analytic statements.

## Lean shape and signature check

The file has 604 lines. All definitions have real bodies over existing
carriers; proof fields in linear maps, subalgebras and continuous functions are
proof obligations, not admitted data. There is no recursive shuffle algebra,
new Bloch quotient chain, chosen global Coleman system, admitted data carrier
or auxiliary theory development. Heavy definitions remain in the README and
the closing inventory. The previous round's shape defects are resolved.

Read all declarations and cross-checked more than the required ten signatures:

| Signature family | README agreement and important hypotheses |
| --- | --- |
| `rationalPolylogSeries` and Euler derivative | Weight is an integer; constant coefficient is zero. |
| `PowerSeries.primitive`, derivative and uniqueness | CommRing and ℚ-algebra; prescribed constant, including the zero-ring case. |
| Radius and restricted primitive | Complete characteristic-zero ultrametric field; strict interior radius and boundary counterexample. |
| `discAnalytic`, unique primitive | Positive radius included in the carrier; equality only on the disc, with basepoint membership. |
| Log series radius and multiplicativity | Ultrametric characteristic-zero hypotheses; completeness for summing the logarithm. |
| `IsLogBranch`, existence and branch change | Nonzero multiplicative inputs, principal-unit series, value at p and junk value at zero; branch-change input explicitly nonzero. |
| `FrobeniusDatum.H0`, `.H1`, `.Hw` | H1 uniquely determines cohomology coordinates, not the primitive; Hw quantifies positive word length and positive powers. |
| Finite-orbit equation | Bijective F, positive finite orbit and finite-dimensional V; no nonzero fixed vector for a positive power of T. |
| `constantTerm` | Log-free coefficient followed by Laurent coefficient zero; explicit nonmultiplicative witness. |
| p-adic series | All integer weights on the open unit disc; no boundary assertion from tsum. |
| Complex polylogarithm | Principal logarithm at weight one; absolute convergence and inversion theorems require k≥2. |
| Projective cross-ratio and cyclic implication | Determinant order fixed; distinct five-tuple, complement and inversion hypotheses included. |
| Amice operator and negative moment | ∂=(1+T)d/dT, open-disc convergence, actual bounded measure and all p roots in K; arbitrary O_K Amice equivalence is not presumed. |
| Rotated smoothing | Finite sums before one inverse; centre theorem b≥1 in characteristic zero; examples b=1,2. |
| Complex L-value formula | Primitive character, conductor N≥2, k≥2 and the existing positive additive-character convention. |

The resulting roadmap is ready for the upstream draft-PR step. Acceptance is
of a fully specified plan and its representative signatures, not a claim that
the admitted Lean proofs or its substantial K-theoretic targets are completed
formalizations.

## Validation and remaining work

- Initial and final independent `lean-check` runs: **exit 0**, each with exactly
  **66 warnings, all `declaration uses sorry`**, and no other diagnostics.
  The final subsequent changes to Suggested.lean only reflow its closing
  comment. No Lean compiler or language server is left running.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- `python3 scripts/check_blueprint.py` on the unchanged packet: no errors or
  warnings; 177 nodes and 134 tests.
- `python3 research/blueprint/intake.py check-files` on the deliverables and
  handoff: zero problems.
- `git diff --check`: clean.

No unresolved acceptance defect remains. No second job was claimed. The
handoff records the new owned targets and the exact supplier corrections so
the maintainer can preserve them when porting the accepted package.
