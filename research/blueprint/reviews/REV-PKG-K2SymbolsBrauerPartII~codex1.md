# Independent package review: K2SymbolsBrauerPartII

**Verdict: accepted after the corrections below.** Reviewer: Codex,
`codex-XETGM3`; date: 2026-10-20; issue: #11389. This review concerns roadmap
readiness, not a claim that the planned mathematics has been formalised.
The package author was session `codex-FbTgoX` (package PR #11384, issue #11365).
This reviewer did not write that package.

## Findings and corrections

1. The base supplier reference was wrong. K2SymbolsBrauer §4.1 concerns a
   homotopy comparison, not Matsumoto's presentation. The supplier contract
   and Layer 1 dependencies now name §§5.1–5.2 for the universal
   Steinberg-pairing presentation and §§7.1–7.3 for the symbol-preserving
   comparison, its isomorphism and naturality. These sections were checked
   in both the atlas package and the supplied copy of draft upstream PR #1302.
   The Matsumoto theorem imported there is attributed to AlgebraicKTheory A5.
2. The real K₂ sign homomorphism is already a target of the base §12.5.
   Removed the instruction to construct it again. `hilbertK2_real` now
   denotes that supplied map; the retained Part II target compares its
   unit-symbol values with the new total conic sign. The ownership and
   supplier paragraphs explicitly name `realSignSymbol` and its API.
   No mathematical scope or input test was removed.
3. Weibel's real example III.6.2.1 is on printed p.232, not p.233.
   Corrected §3.4 to pp.232–233 for Examples 6.2.1–6.2.2, added the exact
   real-example locator to the real comparison, and corrected the reference
   list to pp.232–234.
4. Changed the Lean layer comment to upstream's module-section form and
   aligned its closing inventory with the supplied real map. No declaration
   or theorem statement changed.

The issue's older template calls this a Mordell/Lawrence–Venkatesh package
and refers to a rejected earlier review. Neither that report nor a package
review.json exists in the input checkout. The issue's final instruction
instead requests independent review of the newly merged K₂ package; that is
the work performed here. The input packet exists, has 23 nodes, and has a null
review field. It was used for scope conservation, not described as already
accepted, and was not edited.

## Form, conservation and definition checks

Read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE and
PACKAGE_REVIEW. Compared form with the ClassFieldTheory and
QuadraticFormInvariants upstream READMEs, and with current LocalGaloisGroups
and ProfiniteArithmetic README/Suggested files. The package has the opening
summary, boundaries, conventions, exact supplier contracts, five ordered
layers, worked examples, dependencies and source locators. It contains no job
or review narrative, source excerpt, or section-by-section source summary.
The reference list and all mathematical explanations are in the author's own
words. The README is below the issue's 200 KB limit. Metadata remains exactly
`topic = "math.NT"`.

All 23 input targets remain represented by the corresponding 23 numbered
subsections. All 62 raw input API names are present. I compared the input's
94 test statements with their subsection Checks; their mathematical content
is retained, with 100 README Check bullets in total. Each subsection has at
least four, including every definition/construction. The small-prime,
zero-input, wrong-root, wrong-order, wrong-dimension and extra-Bockstein
controls distinguish plausible incorrect definitions; they are not merely
restatements of type correctness. The real-map reuse corrects ownership while
preserving the specified comparison and values.

## Sources checked

Read the public author/primary-host copies linked below. Printed page numbers
are used. The reproducible sample selected 15 distinct target subsections
using a Python random generator seeded by `codex-XETGM3`; the table records
the actual passages checked for them. All four source cautions recorded in
the input were checked as well. No required locator remains unverified.

| Sampled subsection | Source passages read and outcome |
| --- | --- |
| 3.5 | Milne III.3 Proposition 3.6, p.109, and III.4 Steps 2–4/Remark 4.5, pp.112–114: the positive ordered cup evaluates Artin in the second variable; the package correctly inverts it. |
| 5.4 | Soulé §2.2.3.1, pp.45–46: coefficient exact sequence, integral reduction and boundary have the specified direction. |
| 4.2 | Milne V.5 Proposition 5.2, p.178, and VII.8.1, p.221: finite-support local families and the invariant law supply the stated transport. |
| 3.4 | Weibel III.6.2.1–6.2.2, pp.232–233, and 6.2.5, p.234: real and nonarchimedean cases are separate; corrected the page reference. |
| 4.3 | Milne V.5 Theorem 5.3/Example 5.4, p.179, and VII.8.1(b), p.221: all-place scalar product and Brauer sum, with no omitted archimedean term. |
| 5.5 | Soulé Proposition 2.2.2.3, pp.42–44; §2.2.3.2 and Lemma 2.2.3.2.1, pp.47–48; §2.2.4.4, p.53: integral-product coefficient −1 and factorization through finite reduction. The warning on p.49 prevents extending this to arbitrary finite-by-finite products. |
| 2.2 | Weibel III.6.9 and Lemma 6.9.1, pp.240–241: presentation and split-algebra argument. The package supplies the stronger eigenvalue condition needed for its own proof. |
| 5.2 | Tate Theorem 5.1, pp.268–269; Theorem 5.4, p.270; Diagram 3.3, pp.263–264; Theorem 3.5, p.265: global scope, actual symbol map and adic torsion. |
| 4.1 | Milne V.5 Proposition 5.2, p.178, and Example 5.4, p.179: local completion factors with common global interpretation. |
| 3.1 | Weibel III.6.2.3 and 6.2.5, pp.233–234; Milne III.3 Proposition 3.6, p.109, and III.4 Remark 4.5, p.114: local scalar symbol and arithmetic orientation. |
| 1.3 | Weibel III.6.10, pp.242–243, and Milne III.4 Step 4, pp.113–114: chosen-root tensor identification. The explicit exponent product is the package's specification, agreeing with the current library pairing. |
| 3.2 | Weibel III.6.2.3, p.233: split surjectivity. The package's exact-order/perfectness argument repairs the primitive-value step for composite m. |
| 3.3 | Weibel III.6.2.2 and 6.2.5, pp.233–234: local conic interpretation. The total zero-input extension and rational counterexample are separately justified by the package's elementary arguments. |
| 5.1 | Tate Proposition 4.5 and corollary, pp.267–268; Diagram 3.3, pp.263–264; Theorem 3.5, p.265: local prime case and coefficient mechanism. The named supplier already retains the prime-power and archimedean extensions. |
| 1.1 | Weibel III.6.10.2–6.10.3, pp.242–243; Tate Theorem 3.1/Lemma 3.2, pp.262–263: ordered tensor cup, without a primitive root hypothesis. |

Also read Tate Theorem 6.2 and its proof, pp.270–271; Weibel's paragraph
following VI.8.6's Birch–Tate formula, p.515; and Soulé §2.2.4.4,
pp.54–55. These support the S-integer/Picard checks, with the general scope
supplied by MotivicEtaleKTheory §§2.5 and 3.5. Soulé's root-containment
hypothesis is not silently removed from his particular proof. No special-value
theorem is imported from Weibel's surrounding discussion.

The four input cautions have concrete resolutions:

- Weibel III.Lemma 6.9.1 needs more than a noncentral m-torsion element for
  the splitting step. The package instead proves all m eigenvalues distinct.
  In Mat₂(D), for a nonsplit quaternion D over a field with μ₄, diag(1,−1)
  supplies the advertised counterexample to the weaker condition.
- Weibel III.6.2.3's nonidentity pairing value does not by itself imply
  primitivity for composite m. The root class has exact order m, and
  perfectness gives a character of that exact order, as §3.2 requires.
- Tate's Lemma 4.1 diagram, p.265, prints degree one at the bottom although
  the h₁ map of Diagram 3.3 has degree-two target. The package uses degree
  two throughout and does not copy that label.
- Soulé's Proposition 2.2.3.3, p.49, has a reversed factorial argument in
  the transcription. Proposition 2.2.2.3 and the explicit p.53 formula fix
  the coefficient. At i=j=1 it is −1, without dividing by a nonunit.

Primary copies: [Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
[Tate 1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf),
[Milne 4.03](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), and
[Soulé's thesis transcription](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf).
Tate 1976 here is the K₂/Galois-cohomology paper, not Tate's thesis. No theorem
of Tate's thesis is a target or supplier in this package. No uncleared book
copy was used.

## Supplier and duplication audit

Verified the named supplier sections, rather than treating a roadmap title
as an existence assertion:

- K2SymbolsBrauer §§5.1–5.2, 7.1–7.3, 8.1–8.3 and 12.5 supply the universal
  presentation, classical comparison, fixed raw sign ε=−1, product-normalized
  map and real sign map. Both available versions agree on these contracts.
- MotivicEtaleKTheory §§1.1–1.6, 2.5 and 3.1–3.5 supply all-weight finite
  coefficients, comparison maps, signed residues, Tate's actual maps,
  function-field extension targets and the ordinary degree-two ring maps
  including real places at 2. Its §12.1 explicitly owns `finiteEtaleChern`,
  the cofiber coefficients and Milnor diagonal. The low-degree universal
  characteristic-class branch is independent of its later regulator work;
  integral reduction and Soulé's integral-product formula suffice here.
- GeneralAlgebraicKTheory §§1.7–1.8 and 7.4–7.5 provide derived cofibers,
  homotopy exactness, integral products and their sign. No fictitious
  already-named finite-coefficient group is attributed to its Layer 7.
- ClassicalArithmeticCompletion §§1.14, 1.24–1.25, 1.35 and 1.52 retain
  arithmetic Frobenius, finite perfect pairing, wild mixed-characteristic
  scope and all-place reciprocity. The package correctly uses the normalized
  torsion coordinate e_m, not multiplication by m within Q/Z.
- ClassFieldTheory Layers 5–6, 10 and 14 and QuadraticFormInvariants
  §§6C, 6E and 7B supply the existing invariants, Hilbert and Brauer
  comparisons. Their role is arithmetic input already owned before this
  adapter package. KTheoryFiniteLocalFields, ArithmeticKTheory,
  RefinedTraceMethods and EllipticKTheory occur only as consumers.

Read the reviewed library-coverage entry. Independently verified current
roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched the current
roadmaps by K₂, symbol-algebra, conic, root-tensor, Chern and norm-residue
objects, including all nine roadmaps newer than the atlas snapshot and all
Completed entries. LocalGaloisGroups' norm-residue maps and IntegralLattices'
quadratic deferrals do not supply the kept classical-K₂ adapters. No further
matching target was found. No Lake command ran in the read-only checkout.

At pinned Tau Ceti f790474 and Mathlib 082e2d3, read the actual statements
for `KummerCoeff`, `kummerMap`, its cocycle and kernel theorems,
`explicitCup11`, its negative-flip theorem, `zmodEquivZPowers` and
`zpowers_eq`. Their type tags, equivariance and invertibility hypotheses
match the README. In current Tau Ceti, checked `h2MuEquivZMod` and its
invariant normalization, `kummerCupPairing_bil`,
`brauerCohomologyEquiv_crossedProductClass`, the quaternion cup theorem,
the norm-equation Hilbert definition and `hilbertSymbol_eq_cohomological`.
These remain imports; the retained variants have different classical-K₂
domains, allow zero conic inputs, or compare specified tensor/algebra models.
The one duplicate construction removed by this review is the real map
described above. There is no upward consumer dependency, phantom
`UPSTREAM:` prerequisite or FoundationsAndLibraryIntegration dependency.

## Adversarial mathematics pass

The rows cover all 23 targets, their defining formulas and named API
identities. Domain exclusions are distinguished from negative examples.

| Target | Instances and calculations | Result/change |
| --- | --- | --- |
| 1.1 ordered cup | m=1; m-th powers; Q with m=3 and no primitive root; real Hamilton class | Correct tensor target and native additive tag; no root assumption added. |
| 1.2 all-weight basis | j=0,1,2,−1; m=1; m=5,u=2 gives 1,2,4,3 in those weights | Dual evaluation and tensor coherence fix the bases, including negative weights. |
| 1.3 contraction | ζ²⊗ζ³ at m=5 gives ζ; an additive zero factor gives root 1; root change gives scalar 3 | Exponent product differs from root multiplication and from the inverse weight-two coordinate. |
| 1.4 Brauer symbol | Steinberg/power inputs; m=1; Hamilton versus split real algebra | Field Picard vanishing is used only for fields; existing quaternion convention agrees. |
| 1.5 root/field maps | m=5,u=2; cubic root inversion; Q→Q(μ₃); composed field embeddings | Scalars u^j, u⁻² and u⁻¹ have distinct roles; identity/composition preserved. |
| 1.6 residue | Q₇,m=3,{3,7}; two valuation units; Q₂,m=2; m=1 | Residue −κ(3) distinguishes sign; wild dyadic residue square is explicitly excluded. |
| 2.1 finite free algebra | m=2; a an m-th power; m=4,a=c²; multiply YX versus XY | Carries and ζ^(jk) satisfy the relation and associativity; dimension remains m². Degree one is a separate convention, m=0 excluded. |
| 2.2 splitting/CSA | a=1 with no root of b; real Hamilton before/after C; m=2 shift matrices; Mat₂(D) counterexample | Nonzero α and distinct eigenvalues justify interpolation denominators and matrix units; no unjustified splitting over F. |
| 2.3 proper-degree corner | d=1, d=m, m=4,d=2; factors T²−c and T²+c | d∣m, c=α^d∈F, ζ^s has order d; corner dimension d² and matrix factor s give m². |
| 2.4 cup/algebra class | carry cocycle and δ(γ^i); proper-degree exponents s i_d; quaternion; cubic invariant 1/3 | Negative flip turns the transposed cup into the ordered cup. The named Brauer equivalence fixes its direction. |
| 3.1 local K₂ map | Q₂{−1,−1}; Q₃{3,−1}; odd-prime quadratic tame formula; m=1 | Dyadic value −1 differs from tame value 1; finite-symbol universal property fixes uniqueness. |
| 3.2 full-root section | m=1; Q₂ section; exact order for composite m | t^m=ζ^e forces t to be a root in the full root group, hence m∣e. Perfectness gives a primitive value and section, without a kernel theorem. |
| 3.3 total conic | (0,0); (1,s); (r,1−r); weak real quadrant; rational r=3,7,21 and s=−1 | Norm bridge uses units and 2≠0; split exceptional coordinates use difference of squares. Primitive-integer descent modulo 3 or 7 proves all three rational signs −1, contradicting multiplicativity. |
| 3.4 K₂ Hilbert comparisons | Q₂; real mixed/negative signs; zero excluded from units; Steinberg pair | Local bilinearity is not generalized to every field. Reuse base real map and compare to conic. |
| 3.5 arithmetic invariant | Q₇,m=3,ζ reducing to 2; root inversion; m=1,2; m·[1/m]=0 | Frobenius ratio is ζ, giving inv β{3,7}=1/3 and N{3,7}=ζ⁻¹. e_m is essential and sign is negative. |
| 4.1 common-target factors | Q,m=1 and m=2; m>2 with no real embedding; completion root transport | All factors lie in μ_m(F); real sign only at m=2, complex factor trivial. |
| 4.2 support | Q Hamilton class has support {2,∞}; m=1; x+(−x) | Include places over m; sum support is contained in the union, with possible cancellation. |
| 4.3 reciprocity | Hamilton product (−1)(−1)=1; m=1; arbitrary finite sums of symbols | Symbol generation proves all-K₂ statement; same negative invariant coordinate converts product to sum. |
| 5.1 local Tate | Q₂ at ℓ=2; R and C separately; F₂((t)) at ℓ=3 | Mixed-characteristic wild isomorphism retained; characteristic prime excluded; no false wild tame square. |
| 5.2 global Tate | number fields with real places at 2; F_q(t),ℓ≠char; actual completion maps | Both global-field cases retained. Global K₂ has no nonzero divisible subgroup; the reduced adic formulation does not invent one. |
| 5.3 rings/Picard | Z[1/2], Hamilton generator; nonzero Pic/ℓ; two-step S enlargement; omitted ℓ-adic place | Ordinary degree-two real term retained; generic restriction can have Picard kernel after reduction; weight one not substituted for weight two. |
| 5.4 Bockstein | m=1; real μ₂ quotient; field embeddings; CRT for m=6 | Exact kernel is K₂/m, middle group has additional K₁[m]; no noncanonical splitting or finite product asserted. |
| 5.5 finite Chern | cubic 1/3→−1/3; mod 6 gives 5; change raw θ₂; nonzero Bockstein quotient; m=1 | Integer product coefficient −1 and integral reduction work at every invertible m, including powers of 2. Raw coefficient −ε=+1 differs from normalized −1; no formula claimed on extra finite classes. |

## Lean and validation

The file has one real-bodied definition, three named headline theorem
signatures and two proved examples of that definition. I checked all four
named signatures against §3.3, including arbitrary real inputs, unit norm
inputs, characteristic exclusion and the exact rational counterexample.
There are fewer than ten named Lean declarations; no filler declarations
were added to meet a sample size. Separately checked ten mathematical
contracts against their supplied carrier/map statements: Kummer coefficient,
Kummer cocycle, power kernel, cup, negative flip, primitive-root coordinate,
root subgroup, local invariant, crossed-product class and cohomological
Hilbert comparison. All other README definitions and milestones occur in
the closing inventory. Their unavailable classical-K₂, cohomology or spectrum
carriers are not replaced by weakened encodings.

Final validation:

- `lean-check research/blueprint/packages/K2SymbolsBrauerPartII/Suggested.lean`:
  exit 0; only the three expected declaration-uses-sorry warnings. Both
  examples are proved. Available memory exceeded 20 GB before compilation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauerPartII.json`:
  exit 0, zero errors and zero warnings. The input packet is unchanged.
- `python3 research/blueprint/intake.py check-files` on all five changed
  deliverable/handoff paths: zero problems.
- `git diff --check`: clean. Single `import Mathlib`; no options, algorithms,
  admitted data definitions or admitted examples. README below 200 KB;
  metadata single-line math.NT; verdict JSON valid.

No unresolved package defect or source gap remains. Existing supplier
implementation work and older owner-level retargeting after the Layer 14 move
remain their owners' responsibility; no such late readiness condition is
used as an input to this package's comparisons.
