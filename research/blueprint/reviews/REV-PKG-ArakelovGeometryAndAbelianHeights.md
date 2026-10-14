# Independent package review: Arakelov geometry and heights of abelian varieties

**Verdict: accepted with the corrections below.** Issue #9772; reviewer Codex,
session codex-m5RItY, 2026-10-14. The package author was Codex session
codex-zt51cz (#9769, PR #9813); this reviewer did not author the package or its
accepted input. The packet is unchanged.

## Scope and quality checks

Read the package README and Suggested.lean, the accepted 55-node packet, the
author's handoff, WORKERS.md, PROTOCOL.md, expansion/PROTOCOL.md,
UPSTREAM_GUIDE.md and PACKAGE_REVIEW.md. DifferentialGeometry and AdicSpaces
were read in full as the two README models; DifferentialGeometry and
ProfiniteArithmetic supplied the suggested-file models. The package has the
summary, ownership, conventions, supplier contracts, ordered layers, APIs,
discriminating Checks, examples and source locators required by those models.
There is no copied source passage or section-by-section source summary.

All input API names and named tests remain present. Of the 55 input topics,
54 remain in the numbered build and the plain Hodge-line topic is now an
imported supplier contract, retaining its full mathematical interface and
checks. The old §§2.2–2.11 are now §§2.1–2.10; internal references and the Lean
docstrings were updated without changing external source section numbers.
Every definition/construction topic has at least three discriminating checks.
The remaining theorem topics retain their statements, hypotheses, sources and
proof routes; this review added controls to several of them too.

## Corrections applied

1. **Green-current sign (§1.8).** For the convention
   dd^c=(i/2π)∂∂̄, the current of log|f|² is the divisor current. Consequently
   dd^c(−log|f|²) is its negative, and adding the divisor current gives zero.
   The previous proof had the opposite sign. The coordinate z on the complex
   line is the negative control.
2. **Rational functions on disconnected schemes (§§1.8–1.9).** A principal
   Cartier divisor requires an invertible element of the total rational
   algebra, and a rational line section must be nonvanishing on every
   irreducible component. Merely saying nonzero was insufficient. On two
   copies of Spec ℤ, (1,0) is nonzero but not a rational unit, whereas (2,1)
   is a unit. Both algebraic controls are proved Lean examples.
3. **Pairing on cycles (§1.10).** The intersection expression now uses signed
   multiplicities, so it covers negative Cartier coefficients. When a cycle
   is contained in the divisor, restrict the associated metrized line bundle
   directly and take its degree. This supplies the pairing without an
   unlisted moving lemma. The normalization and field multiplicities of the
   author's corrected point-height formula are retained.
4. **Hermitian convention (Conventions and §2.1).** Mathlib's inner product is
   conjugate-linear in its first argument. The mixed integral is therefore
   β∧ᾱ. The old α∧β̄ order had the opposite linearity, although its diagonal
   norm was correct. On the square torus the mixed values are −i and i.
   The corresponding scalar example is proved by simplification in Lean.
   The normalization dictionary now describes Faltings–Chai by its squared
   norm, avoiding an incompatible mixed pairing formula.
5. **Elliptic degree proof (§2.9).** A generic Weierstrass differential need
   not lie in the integral Néron Hodge lattice. Scale it into that lattice
   before writing a finite quotient by its generated submodule. The scaling
   is legitimate over K and its discriminant contributions still cancel.
6. **Divisible towers (§4.5).** At semistable bad reduction the full torsion
   model need not be finite flat. The local hypothesis now concerns the
   finite parts of the kernel closures, identified with truncations of a
   specified divisible group. Raynaud's Definition 4.1.1 and different
   computation on p. 219 support exactly this calculation. The supplier's
   shifted-closure theorem requires an ambient divisible group over the DVR;
   the unconditional shift claim was removed. A good-reduction corollary
   supplies that ambient group and states the shifted formula with base
   A_(n₀). A split Tate elliptic curve has generic torsion height 2 but finite
   part μ_(ℓ∞) of height 1; identifying its full closure with a height-2
   finite flat group fails. Its local dimension 1 nevertheless gives the
   correct zero height increment for multiplication.
7. **Ownership.** Moved the plain Hodge-line interface from old §2.1 into
   Exact supplier contracts, under AbelianSchemes A1/A6, NéronModels R11.1
   and ShimuraCompactifications C4. It is no longer a numbered construction
   here. The modular-line API (§5.4) explicitly constructs the *metrized*
   line and its isometric comparison; its underlying ample line and integral
   comparison are C5's imports.
8. **Additional targets and tests.** Named the three additional local targets
   already required by §4.3's proof: abelian-variety local Tate pairing, the
   Kummer exact sequence and the uniform local-cokernel asymptotic. Added
   good-reduction [p] and toric negative controls. Added Picard comparison,
   half-line, rationalization-torsion, mixed dual-pairing and empty-determinant
   checks. Replaced the vacuous sourcing check at §6.6 by multiplication,
   the elliptic non-semistable-prime threshold and the quadratic-twist distinction
   between geometric finiteness and finiteness of number-field forms.
9. **Reduction-prime scope (§§3.6, 6.6).** The bound identifies a finite set
   containing the non-semistable primes. The export no longer calls these all
   bad primes: a multiplicative fibre is allowed by the conclusion. The
   level-12 elliptic check applies the same local determinant proof to that
   extension, rather than identify it with the level-15 field in §3.6.

## Sources

The 17 public PDFs were retrieved at the packet's recorded versions and all
17 SHA-256 values agreed with its sourceVersions. Faltings–Chai was read only
in the maintainer-cleared library, in place; no book file or passage was
copied into the workspace or repository. Its printed page numbers, rather
than PDF offsets, are used below. Public Faltings pp. 350–351 were also read
as rendered page images because their extracted text is inadequate.

The random sample used `random.Random(9772).sample(citations, 15)`, with
citations flattened in packet node/source order (159 entries). Each sampled
locator was opened and read, not inferred from its bibliographic metadata.
The table uses the final package numbering.

| Topic | Locator inspected | Result |
|---|---|---|
| §5.8 theta comparison | Pazuki, arXiv:0907.1458v2, Theorem 1.1, Remark 1.2, Corollary 1.3, pp. 2–3 | Two-sided comparison, matrix bound and constants match. |
| §6.5 lower bound | Gaudron–Rémond, Polarisations, §9, p. 2101 | Supports the stated weaker Faltings bound −3g/2. |
| §4.2 isogeny formula | Raynaud, Proposition 1.4.1, pp. 204–205 | Degree and different signs match. |
| §5.2 logarithmic heights | Faltings–Chai V, Proposition 4.4 and following paragraph, pp. 167–168 | Ample logarithmic-height lower bound and Northcott comparison match. |
| §1.2 operations | Szpiro §1.2, p. 13 | Tensor and dual compactified lines match. |
| §5.6 moduli Northcott | Deligne, Lemma 1.6, p. 29; Lemma 1.20, p. 34 | Moduli-height finiteness and comparison match. |
| §5.1 logarithmic metrics | Faltings–Chai V, Definition 4.2 and Remark 4.3, p. 167 | Fixed extension, pullback and modification scope match. |
| §6.2 Zarhin height | Deligne, Remark 1.22, p. 35 | Product and dual identities give the factor 8. |
| §3.4 stable height | Deligne §1.2, Remark, p. 27 | Semistable-extension definition matches. |
| §6.2 Zarhin height | Bost, Appendix C, end, p. 155 | Product reduction to a principal polarization matches. |
| §2.4 metrized Hodge line | Faltings–Chai V §4, p. 169 | Semi-abelian lattice and integration metric match. |
| §1.3 arithmetic degree | Gillet–Soulé §3.4.3, p. 131 | Finite norm plus half the sum of Green values matches. |
| §6.5 lower bound | Pazuki, Remark 1.4, p. 3, v2 | Attributes the explicit Bost bound in Deligne normalization. |
| Imported Hodge interface | Faltings §2, Remarks a), b), pp. 350–351 | Base change and proper pushforward interface match. |
| §3.3 extension comparison | Faltings–Chai V §4, p. 169 | Lattice inclusion and decreasing relative height match. |

The author's four flagged limitations were independently followed to their
available evidence:

- **G1:** Read Pazuki Remark 1.4 and Gaudron–Rémond §9, p. 2101. These are
  explicit public secondary sources for the linear numerical bound; the
  primary Bost Duke/report proof remains unread. The directly sourced
  existence/effective non-sharp route is separate. No sharpness claim is made.
- **G2:** Read Gaudron–Rémond, Périodes, Lemma 7.9 and its proof, pp. 32–33
  (arXiv v1), and Bilu–Parent–Rebolledo, Proposition 4.4, p. 971. They support
  the elliptic comparisons and identify the Silverman/Faisant–Philibert
  inputs. Their primary proofs remain unread. The package derives the
  period formula independently and labels numerical sampling as a test.
- **G3:** Read Raynaud §2.4 and Remark 2.4.1, pp. 211–212, and the cleared
  Faltings–Chai V, Lemma 3.4, p. 166. The finite-residue-field proof uses the
  abelian-variety local pairing and bounded Lie-filtration errors now named
  as targets; it does not silently import Bégueri or promise arbitrary
  perfect-residue-field generality.
- **G4:** Read Yuan–Zhang, Lemma 2.4 and Corollary 2.5, pp. 15–16 (v3).
  The cited Colmez integral freeness theorem remains unread; rank-one
  freeness and monogenicity are explicit hypotheses of §4.8, rather than
  consequences attributed to the ordinary Hodge sequence.

Additional direct checks included Gillet–Soulé §1.3.1, p. 103 and §3.3.3,
p. 127 for the Green sign; Raynaud Definition 4.1.1, p. 219 and Lemma 4.2.4,
p. 220 for finite parts; and Pazuki §§2.3–2.4, pp. 7–10 for the restricted
translated-theta basis changes. None of the 15 sampled locators required
bibliographic correction. These checks do not claim that every primary proof
behind a cited secondary source was read.

## Dependencies and duplication

Read the reviewed library audit for R35.1–R35.6 and the actual pinned Mathlib
statements consumed by the package, including their enclosing assumptions.
The Mathlib pin is 082e2d37e8b0463410cdb532e111cd43d5a66174. In particular,
`Ideal.absNorm_algebraMap` requires freeness over ℤ, not freeness of O_L over
O_K; the number-field base-change argument is valid for nonprincipal
O_K-modules. Read the infinite-place multiplicity/product formulas, fractional
ideal norm, coordinate-ideal height formula, relative projective height,
regulator convention, covolume and normalized discriminant APIs. Mathlib's
scalar inner-product convention was checked at `RCLike.inner_apply`.

Current read-only duplication baselines were TauCetiRoadmap
0d144d044dacebca17b654695b6f1ad58f159b27 and TauCeti
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The search included current roadmaps
and Completed, by objects as well as names: projective bundles/determinants,
Gram covolumes, differential forms/integration, divisor/Picard/norm/Chow
operations, invariant differentials/isogenies, metrics/Green functions,
Hodge lattices, stable heights, divisible kernels, theta constants and
modular-height comparison. Generic bundle operations remain
AlgebraicVectorBundles' imports; covolume/Gram calculations remain
IntegralLattices' imports; forms and integration remain DifferentialGeometry's
imports. The existing elliptic isogeny/differential theory supplies algebraic
inputs, not the arithmetic metric or Néron-height formula. The new arithmetic
enrichments were not found in the current library. No library theorem was
removed; the seven plain Hodge-interface API entries were moved out of the
owned build into the supplier contract. The C5 ample-line entries now specify
the additional metric rather than re-plan the underlying line.

The tier walk has Arakelov at tier 16, with SchemeAndStackFoundations (2),
AlgebraicModuliForArithmeticGeometry (4), ComplexComparisonPartII (5),
AbelianSchemesAndArithmeticModuli (6), NéronModels (8), ordinary heights (9),
FiniteFlat (10), PELModuli (13) and ShimuraCompactifications (15) below it.
ClassFieldTheory and the general geometric roadmaps are existing suppliers.
No proof prerequisite points upward. R28 is mentioned only as a downstream
owner of global determinant, stabilization and descent arguments; §4.5's
local calculation has its own explicit hypotheses and good-reduction proof.
No `UPSTREAM:` or FoundationsAndLibraryIntegration pseudo-dependency remains.

The exact inherited contracts remain explicit: integral level-one Siegel
compactifications over all Spec ℤ; the good translated theta basis;
unrestricted-ramification/exponent Cartier-dual length identity; strict
non-unit Lie determinant at a non-semistable prime; and minimal discriminants
tied to the Néron lattice. SchemeAndStackFoundations §§3.4–3.5 and §4.17
supply the ordinary divisor/norm and normal-crossings requests. The finite-flat
shift contract was narrowed to its actual ambient-group hypothesis. Ordinary
heights are supplied by RP.0; the package does not depend on the closed,
unmerged ArithmeticHeights proposal.

## Adversarial mathematics pass

Every input topic, all its identities and its convention choices were checked.
Rows use the final numbering; the imported row accounts for the removed
numbered topic. A negative instance is a test of the hypothesis, not a claim
that the theorem applies there.

| Statements checked | Instances and computed witness | Disposition |
|---|---|---|
| Conventions | Complex multiplicity 2; g=0,1,2; scalar i in the first argument | Squared norm factors retained; mixed order corrected. |
| §1.1 hermitian bundles | Zero module, unit line, Gaussian conjugate norms 1 and 4 | Rank 0/1 and conjugation distinguish valid objects. |
| §1.2 bundle operations | Unit tensor; orthogonal rank 2; quotient by ℤ(1,1) | Quotient norm of [e₁] is 1/√2, not 1. |
| §1.3 degrees and slopes | (1+i) over ℚ(i); rank 0/2; metric e^(−c) | Degree −log 2; rank-2 shift 2[K:ℚ]c; slope requires positive rank. |
| §1.4 section independence | s→2s over ℚ; unit 1+√2 | Finite and infinite changes cancel. |
| §1.5 additivity | Dual of a nontrivial fractional ideal; saturated exact sequence | Generic dual section need not be integral; determinant degree still changes sign. |
| §1.6 extension | (ℤ,2|·|) extended to ℤ[i] | Degree −log 2 becomes −2log 2; normalized degree fixed. |
| §1.7 divisor/Picard | (2) over ℚ and ℚ(i); zero; O((2)) | Degree zero needs weight 2; unit-norm generator of O((2)) is 1/2. |
| §1.8 Green divisors | z on ℂ; [0] with Green function 0; rational (1,0) | Corrected current sign; singularity and rational-unit failures exposed. |
| §1.9 Picard comparison | Metric r; FS versus sup at [0]; tensor r,s | Green −2log r; smoothness distinguished; tensor and dual signs checked. |
| §1.10 cycle pairing | Horizontal section, vertical fibre p, negative divisor, field enlargement | Signed multiplicities; restriction handles contained cycles; localization kills log p. |
| §1.11 stack degree | B(ℤ/2), constant Green 2; inert prime of residue degree 2 | Degree [E:ℚ]/2; log N𝔮 rather than log p. |
| §1.12 point height | Trivial metric; rescale e^(−c); [1:2] over ℚ(i) | Values 0, shift c, field-independent log 2. |
| §1.13 Weil comparison | Ample O(1) versus trivial line on ℙ¹ | Northcott requires ampleness; constant height on an infinite set is excluded. |
| §1.14 projective comparison | Zero tuple; (2,2); [1:1] and [1:0] | Zero excluded; scaling cancels; FS/sup gap ½log 2 and 0. |
| §1.15 norms and ℚ-lines | Gaussian prime norm; half-line; half a unit-log vector | Degree preserved; halves divide degree; rationalization kills torsion. |
| Imported Hodge interface | G_m; trivial group; proper disconnected ℤ/2 | p_*Ω^g needs properness and connected fibres; determinant at g=0 is the unit line. |
| §2.1 Faltings form | Square torus, i·dz; E×E; g=0 | Mixed values −i/i; g=2 parity yields positive norm; empty wedge norm 1. |
| §2.2 covolume | τ=i,2i; rescaling periods by 2 | Norm squares 1,2 and factor 4; general determinant has |det Ω₁|². |
| §2.3 isogeny norm | [−2], [1], excluded [0] in positive dimension | Pullback squared norm factor |n|^(2g); degree is positive. |
| §2.4 metrized lattice | Néron lattice versus ω_N/2 on 27.a3 | Incorrect lattice changes degree by +log 2. |
| §2.5 product metric | E×E with two degree-one forms; unit factor | Reordering sign cancels i-exponent; product norm and degree agree. |
| §2.6 dual line | Principal polarization; toric bad reduction | Integral semistable comparison uses V.3.4, not false duality of finite parts. |
| §2.7 normalizations | c>0; g=0,1; unscaled versus Faltings | Height shift −½log c; +½log π and −½log 2 at g=1. |
| §2.8 family metric | Constant family; τ=i,2i; weight-12 discriminant | det Im τ positive; Petersson expression is the square of |Δ|Im(τ)^6. |
| §2.9 elliptic formula | Generic differential outside lattice; SL₂ inversion; (2π)^12 conversion | Clear denominators before finite quotient; no double counting of 2π. |
| §2.10 dual pairing | Square torus in Deligne metric; dual unit frames; g=0 | Tensor norm square 1/π²; scalar linearity −i/i; empty determinant norm 1. |
| §3.1 relative height | g=0; 11.a2; incorrect 27.a3 lattice | Zero and negative heights allowed; wrong lattice shifts by log 2. |
| §3.2 invariance | Distinct polarizations; semi-abelian model | Height uses no polarization; model comparison uses normal-base extension. |
| §3.3 field extension | Semistable case; additive elliptic curve at 3 | Correction zero or positive with the stated inclusion direction. |
| §3.4 stable height | Quadratic twist; compositum of semistable extensions | Same geometric height; relative additive height can be larger. |
| §3.5 stable identities | A^0; A²; (A×A^t)^4 | Heights 0,2h,8h; semistable proof precedes arbitrary-reduction duality. |
| §3.6 bad-prime bound | 27.a3 at 3; empty set of bad primes | Non-unit determinant gives at least log 3/[K′:ℚ]; empty sum zero. |
| §4.1 different | id; [n] at rank g>1; μ_p/étale kernel; additive [p] | Different (n^g), not annihilator (n); flatness required for kernel formula. |
| §4.2 isogeny height | [n]; étale quotient; ordinary μ_p quotient | Zero increment for [n]; opposite signs for étale and multiplicative terms. |
| §4.3 dual differents | Polarization; [p] in ramified F; split multiplicative elliptic curve | Different square (d); two local cokernel coefficients sum to v_F(d); finite parts need not be dual. |
| §4.4 bounds | d=1; d=p^n; unit different versus maximal different | Zero at d=1; endpoints ±½log d and valuation interval checked. |
| §4.5 towers | G=0, full good-reduction torsion, full split Tate torsion; n=0 | Coefficient zero in these cases; finite-part hypothesis and shifted base corrected. |
| §4.6 components | E=ℚ; CM rank-zero component; ramified torsion | Deligne height recovered; remove torsion before determinant. |
| §4.7 component isogeny | E=ℚ; f=id; [n] | Dual cokernel differences cancel; rational isometry need not be integral. |
| §4.8 CM polynomial | Split quadratic case; two distinct type roots with non-unit difference | Rank-one discriminant 1; Vandermonde index detects ramified integral decomposition. |
| §5.1 logarithmic metrics | Unit, −log|q|, power pole, zero/negative norm, boundary twist | Positivity and inverse bound essential; fixed extension retained. |
| §5.2 logarithmic heights | Constant metric; cusp norm; arbitrarily large degree | Jensen averaging gives degree-independent logarithmic error. |
| §5.3 Hodge growth | One cusp; cusp times a fixed elliptic curve | Bounded abelian block keeps full Gram determinant positive. |
| §5.4 modular line | g=0,1; positive-dimensional toroidal contraction | Imported ample line is metrized; g=1 factor (2π)^12; ampleness belongs to minimal space. |
| §5.5 modular identity | Semistable elliptic curve; additive twist; finite stack-lifting extension | Equals 12h_st at g=1; relative height is insufficient before semistabilizing. |
| §5.6 moduli Northcott | g=1 j-line; bounded field of moduli | Finitely many j-values; counts geometric classes, not twists. |
| §5.7 theta height | g=1,r=2; odd zero theta constant; (3,4)/5 matrix | Correct translated basis; arbitrary unitary change alters finite sup contribution. |
| §5.8 theta comparison | r=2,g=1; h_F below 1; normalization shift | Positive-part constants defined without log of nonpositive heights. |
| §5.9 elliptic j bound | j=0, j=−1; large Im τ | U>0; numerical sampling proves no minimum; upper bound alone cannot imply Northcott. |
| §6.1 Zarhin construction | g=0; degree d²; base change | Degree d^16/(d^8)^2=1; fixed choices commute with base change. |
| §6.2 Zarhin height | E and zero variety | Height factors 8 and 0, independent of chosen principal polarization. |
| §6.3 field degrees | g=1,n=12; g=0; n=1 and level rigidity | GL₂ order 4608; cyclotomic containment requires g>0 and rigidity n≥3. |
| §6.4 finiteness | Coarse j-point versus quadratic twists; fine level | Fine triples inject into moduli points; no unsupported descent or algorithm. |
| §6.5 lower bound | Elliptic minimum at j=0; g=0 unit height | Elliptic value exceeds stated bound; constants translated consistently. |
| §6.6 exports | [n]; elliptic degree bound 4608; multiplicative 11.a2; quadratic twists | Actual height and non-semistable-prime controls; no inference of good reduction or descent. |

## Lean and validation

Suggested.lean has only real-bodied light definitions, theorem signatures and
examples over the pinned carriers. Heavy arithmetic objects remain in the
README and its closing inventory. No data definition is sorry-bodied and no
theory is developed by an auxiliary chain. The scalar and disconnected-ring
controls added here are proved; the existing target theorems remain suggestions
with sorry, as required.

The signature comparison covered all eight light definitions and, in
particular, these ten declarations: `ArakelovDivisor.principal`, `degree_add`,
`degree_principal`, `ofTuple`, `degree_ofTuple`, `ofTuple_smul`,
`covolume_periodLattice`, `EllipticCurve.faltingsArchimedeanTerm_pos`,
`EllipticCurve.faltingsArchimedeanTerm_smul`, and
`HermitianMetric.LogSingularAtZero.pow`. Number-field degrees and complex
multiplicities, tuple nonvanishing, scalar units, τ∈ℍ, SL₂ rather than an
arbitrary matrix, and natural powers with eventual positivity match the prose.
There are no conclusion-as-hypothesis or True placeholders.

Validation results are recorded in the accompanying handoff. The inherited
source limitations and exact supplier contracts above remain visible; there
is no unresolved review defect requiring another package revision.
