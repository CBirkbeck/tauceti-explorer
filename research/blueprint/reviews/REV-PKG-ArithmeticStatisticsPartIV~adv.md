# Independent package review: ArithmeticStatisticsPartIV

Verdict: **accepted with the fixes in this submission**. Reviewer: Codex,
session `codex-6zErHu`; job `REV-PKG-ArithmeticStatisticsPartIV~adv`, issue
#10276; 2026-10-17. This review concerns the mathematical roadmap, not proved
Lean implementations. No unresolved mathematical or packaging defect was found.

## Scope, preservation and ownership

I read the package, its original accepted source material, PROTOCOL,
PACKAGE_REVIEW and UPSTREAM_GUIDE. The upstream shape comparisons were
GlobalNumberFields and ProfiniteArithmetic, including their suggested files;
the current completed EffectiveBounds roadmap was also checked. The current
roadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`; current
Tau Ceti was at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

There are no `ArithmeticStatisticsPartIV*.json` packets. The split's inputs are
the original ArithmeticStatistics packet and stage packets. I compared all 52
Part IV target blocks with the unsplit README immediately before split commit
`270eb2332`, normalizing cross-part links and presentation changes. Every
mathematical target, API, hypothesis and Check survived. The one residual
boundary change replaced a forward link in the EVW consequence Check with the
same consequence stated inline. Across the eight parts, all 744 original
mathematical target anchors remain. The present review keeps all 52 Part IV
targets and all mathematical tests; it corrects the description of one test's
verification method.

The inherited introduction advertised suppliers and constructions belonging to
other parts. I replaced it with Part IV's actual contracts. Part I supplies the
family interface; Parts II–III supply no theorem needed for the abstract group
laws. AnalyticNumberTheoryPartI/PartII precede this part, but prime estimates
and cubic zeta functions are not assumptions of finite-group identities.
Mathlib's geometric-series and infinite-product APIs suffice for the products
here. ModularityAndLanglandsExtensions is explicitly downstream. References
to later parts describe consumers only.

I searched current upstream roadmaps, their completed roadmaps and current Tau
Ceti by mathematical objects as well as names: finite abelian decomposition,
class-group torsion and quotients, matrix rank, finite quadratic modules,
surjection moments, finite-field distributions, directed pairings and moment
determinacy. I read the relevant declarations, including the library's real
symmetric-matrix measurability and finite quadratic-module interfaces. Those
do not duplicate finite-field matrix counts or the FK directed good-plane
condition. Scalar exponential-moment determinacy has a different carrier and
different hypotheses from the discrete group/grid statements.

One proposed API entry was removed:
`classGroupTorsionCard_two_eq_card_elementaryTwoQuotient` merely renamed
`TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion` after
unfolding the torsion count. The existing result is now a supplier, with its
agreement test retained. No principal target was removed. Mathlib's Hermite
finiteness and finite abelian structure theorem are also prerequisites; the
new targets are their statistical adapters. EffectiveBounds owns quantitative
Hermite estimates. No upstream files or packets were changed.

The pinned declaration audit included Mathlib `082e2d3` and Tau Ceti
`f790474`: `NumberField.finite_of_discr_bdd`,
`AddCommGroup.equiv_directSum_zmod_of_finite`, `card_linearIndependent`,
`Matrix.card_GL_field`, `Submodule.smithNormalForm`, and the class-group
two-torsion comparison. Their actual statements, rather than name matches,
determined the supplier contracts.

## Source verification

The package flagged no locator as unverified. I selected 15 of its ordered 52
targets with `random.Random(10276).sample(targets, 15)` and opened the public
sources below. Page numbers refer to printed pages, except the numbered arXiv
manuscript pages. The descriptions distinguish a source theorem from a
supporting lemma proved in the roadmap.

| Sampled target | Public source and verified locator | Assessment |
| --- | --- | --- |
| Partitions with large parts | [Majumder](https://arxiv.org/pdf/1407.3066v1), Lemmas 1–2, p. 2 | Partition/finite-product input agrees, including empty partitions. |
| Distribution without moment convergence | [EVW](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf), §8.5, p. 774 | The roadmap's explicit mixture is a counterexample to the converse assertion there; it is not attributed as a printed EVW example. |
| Cohen–Lenstra moments | [Wood, random integral matrices](https://arxiv.org/pdf/1504.04391v1), Lemma 3.2, pp. 9–10 | All primes and nonnegative rectangular parameter; agrees with the stated model moment. |
| Automorphism counts | [Hillar–Rhea](https://arxiv.org/pdf/math/0605185v1), Theorem 4.1, p. 6; Majumder, Lemma 3, pp. 3–4 | Exponent and conjugate-partition versions agree. |
| Finite abelian p-group classes | Majumder, §2, pp. 3–4; EVW, §8.1, p. 771 | Positive-part convention and trivial group agree. |
| Prime-power rank | [Fouvry–Klüners](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §1, p. 1; Lemma 9, p. 11 | The source's four-rank is the p=2,k=2 specialization; the generic power-image formula is a supporting adapter. |
| Wood grid uniqueness | [Wood, sandpile groups](https://arxiv.org/pdf/1402.5149v2), Theorem 8.2, pp. 29–31 | Finite moments for every profile and the growth bound are essential and retained. |
| Symmetric border outside image | [Stanley](https://math.mit.edu/~rstan/pubs/pubfiles/114.pdf), §4, equations (4.2)–(4.3), p. 355 | Rank-count proof supplies the recurrence setting; the explicit block argument is given here. |
| MacWilliams count | Stanley, §4, equation (4.2), p. 355 | Includes characteristic two and all symmetric diagonals. |
| Symmetric border fibers | Stanley, §4, equation (4.3), p. 355 | Three coefficients agree with the explicit fiber counts. |
| Surjection moment | EVW, §8.2, p. 771 | Unmarked surjections and probability normalization agree. |
| Number-field count | [Wood survey](https://people.math.harvard.edu/~mmwood/Publications/ArithStats.pdf), Theorem 1.1, p. 1, and §1.1, Question 1.6 and following paragraph, p. 2; [BST](https://arxiv.org/pdf/1005.0672v3), Theorem 1, p. 1 | Isomorphism classes, strict signed intervals and automorphism weights were checked separately. |
| Odd-prime moment uniqueness | EVW, Lemma 8.2, p. 771 | Odd-prime restriction belongs to this contraction proof, not to the later all-prime theorem. |
| FK linking phase | Fouvry–Klüners, §§5.1–5.2, equations (20)–(27), pp. 15–17 | Ordered phase and symmetrized linkage have different meanings; explicit binary witnesses agree. |
| Finite moment control | EVW, Proposition 8.3, p. 772, proof p. 773 | Finite test set and aggregate enlargement argument are retained. |

Additional direct checks included Majumder's Hall calculation (pp. 5–6),
Wood's separator/coefficient estimates (Lemma 8.1, pp. 28–29), subgroup bound
(Lemma 7.4, pp. 27–28), and bounded-exponent moment theorem (Theorem 8.3,
pp. 31–32); Wood's general moment convergence theorem (Theorem 3.1, p. 9,
of the random-matrices paper); and FK Lemma 26 (pp. 32–34). The exact
surjection formula is now explicitly identified as a flag-count lemma proved
here, with EVW's proof of Lemma 8.4, p. 772, supplying its setting rather
than falsely supplying that formula verbatim. The finite-n Haar law similarly
identifies its cylinder/measurability argument as supporting work here.

The reference to Koymans–Pagano's Stevenhagen manuscript identifies the
specific preprint version used for pagination, without an obsolete publication
status. The README and this report use original descriptions, not source
excerpts or a sequential summary of a paper.

## Adversarial mathematics pass

Each row is a target in package order. “Retained” means the stated hypotheses,
formula and existing controls survived this review. Computation of finite
cases is evidence about conventions and formulas, not a proof of a theorem.

| Statement | Instances and negative controls | Result and change |
| --- | --- | --- |
| Number-field counting function | Degree one, discriminant 1; quadratic discriminants −3,−4; cubic discriminants −23,49; three conjugate subfields of a non-Galois cubic | Made Aut/n a rational division: each cubic subfield contributes 1/3. Matched strict `countLT`, not the inclusive family count. |
| Class-group torsion | m=1; C₃ at p=2 and 3; class number 5 with 3-torsion trivial; wide versus narrow | Retained; imported the existing elementary-two comparison instead of proposing it again. |
| Gaussian binomial | k>n, n=k=0; t=0,1; binary subspaces [3,1]=7, [4,2]=35 | Clarified the polynomial definition over a commutative ring and the restricted field quotient formula. The integer q is not reduced in F_q. |
| Cauchy q-binomial | n=0,1,2; t=0,1 | Empty product and polynomial form agree; retained. |
| Finite abelian p-group classes | Empty partition; partitions (2) and (1,1) | Distinguishes C_p² from C_p×C_p; retained. |
| Automorphism count | Trivial group; cyclic p²; elementary rank two | Agrees with directly enumerated self-surjections; denominators positive; retained. |
| Surjection count | Target trivial gives one; trivial source to nontrivial target gives zero | Unmarked surjections retained; direct image enumeration agrees. |
| Exact surjection formula | All partition types of 2-power order at most 8 and 3-power order at most 9; nonquotient targets | All 65 source/target pairs agree with the flag formula. Clarified its supporting-lemma attribution. |
| Large-part partition decomposition | Empty partition, u=0, smallest nonempty partitions | Endpoints and largest-part decomposition agree; retained. |
| Hall partition identity | u=0,1; empty term and first two partition sizes | Product and partition weights agree; strict upper-bound convention retained. |
| Weighted inverse-automorphism sum | u=0,1; trivial group; p=2 | Positive Euler factors and convergence checked; retained. |
| Cohen–Lenstra mass formula | Trivial term; p=2; u=0 and u>0 | Nonzero normalizing product, rather than only convergence, is required and retained. |
| Cohen–Lenstra measure | Trivial-group mass and total mass; real/imaginary quadratic interpretations | Explicitly identified arithmetic interpretations as conjectural models unless separately proved. |
| Surjection moment | Trivial target gives total mass; nontrivial target has unbounded count | Nonnegative sums and finiteness conventions retained. |
| Extension groupoid | G=K=C_p; trivial kernel or quotient | Contributions 1/p and 1/(p(p−1)) sum to 1/(p−1); marked mass and class weights are distinguished. |
| Surjection-weighted class count | Trivial target and C_p target | Extension reindexing retains nonnegative sums; retained. |
| Cohen–Lenstra moments | Trivial target; C_p; u=0,1; p=2 | Target |A|^(−u) and normalization agree; retained. |
| Contraction constant | p=3 versus p=2; first Euler factors and geometric tail | Odd-prime contraction works; p=2 failure does not assert failure of all-prime uniqueness. |
| Odd-prime moment uniqueness | Trivial-group moment; odd prime versus 2 | Probability and moment hypotheses retained; no use of contraction at 2. |
| Enlargement definition | Zero added order; split and nonsplit extensions; same-order nonisomorphic groups | Quotient existence, not order alone, defines enlargement; retained. |
| Aggregate enlargement inequality | 400 cases for p=2,3, partitions of log-order 1 through 6 and smaller quotient targets | Aggregate inequality passed; no false pointwise lifting assertion introduced. |
| Partition tail domination | Empty partition, first nonzero size, odd prime | Subexponential partition growth is dominated by the specified geometric factor; odd-prime scope retained. |
| Finite enlargement domination | Trivial target; zero enlargement; finite exceptional range | Finite maximum and tail domination have the stated domains; retained. |
| Finite moment control | Singleton finite test set; trivial-group mass | Finite test family and aggregate inequality retained. |
| Moment convergence implies distribution convergence | Constant law; all test moments eventually close to one | Finite moment control applies; no unproved converse or arithmetic input assumed. |
| Distribution without moment convergence | Mixture with mass p^(−n) at C_p^n | Distribution error tends to zero but the C_p moment tends to 2 rather than 1; retained. |
| All-p,u Cohen–Lenstra limits | p=2, u=0; u>0; bounded-exponent quotients | Explained why quotient by p^(e+1) isolates any finite p-group of exponent at most p^e; no unjustified full-group limit is needed. |
| Finite-n Haar cokernel law | n=0; 1×1 valuations; zero versus nonzero determinant | Trivial cokernel at n=0; finite cokernel almost surely uses Haar-zero determinant locus, not full rank mod p. Supporting measurability work explicit. |
| Haar cokernel moments | Rank target zero; target rank greater than n; n=0; u=0,1 | Rewrote factors as 1−p^i/p^n to avoid truncated natural subtraction in an exponent; i=n gives the required zero. |
| Friedman–Washington limit | n=0 initialization; matrix [p] has finite nontrivial cokernel | Replaced circular self-reference in the finite-cokernel proof with the finite-n law. |
| Translated Haar matrices | Fixed shift zero or identity; contrast conditioning on GL | Additive translation preserves full matrix Haar measure; retained. |
| Finite-prime product model | Empty prime set; singleton; two distinct primes | Empty product is point mass; independence is part of this model, not an arithmetic theorem. |
| Finite-field kernel law | 0×0 and rectangular zero maps; right kernel and transpose dimensions | Domain dimension is n and nullity n−rank; total probability one; retained. |
| General matrix rank count | 689 binary matrices with both dimensions 0 through 3 | Product formula matches every rank count, including empty products and impossible ranks. Removed obsolete ownership wording. |
| Symmetric kernel law | Binary sizes 0 through 4; ternary sizes 0 through 3 | Counts all symmetric matrices, not only alternating ones; characteristic-two distinction retained. |
| Koymans–Pagano rank identity | m=0,1,2 and exact rational products through m=11 | Passed; corrected the claim of “direct enumeration” to substitution of rank-count products. Kernel-vector weighting differs from uniform sampling of pairs. |
| Symmetric image obstruction | S=0 and nonzero vector; characteristic 2 and 3 | Orthogonality to ker S is equivalent to image membership; retained. |
| Border rank in image | v=0 and v=Sx; scalar a=xᵀSx or a different scalar | Rank r or r+1 as stated, independently of the chosen preimage x; retained. |
| Border rank outside image | 1×1 zero S and v=1; every scalar border | Rank increases by two, including characteristic two; retained. |
| Border rank fibers | Every border over symmetric matrices of size at most 2 over F₂,F₃ | All 833 extensions match the three fiber counts; full-rank case has no outside-image branch. |
| Symmetric rank recurrence | n=0; rank zero and out-of-range ranks | Initial values and three coefficients agree with the finite enumerations; retained. |
| Symmetric product recurrence | Integer q=2 through 7, n=0 through 8, including impossible ranks | 486 exact rational instances passed. Nonzero denominators and out-of-range conventions retained; q=1 excluded. |
| MacWilliams rank count | Binary rank rows (1,3,4), (1,7,28,28), (1,15,140,420,448); ternary rows | Product matches exhaustive counts; no alternating-matrix substitution. |
| Symmetric kernel limit | n>r; n=r=0; finite r and infinite products | Added explicit treatment of r=n=0 before a tail estimate using r≥1. Normalization and nonvanishing retained. |
| Prime-power rank | C₂ at k=2; C₄ at k=1,2; C₈ at k=3,4; trivial group | Ranks 0;1,1;1,0;0 detect using the entire group instead of the required power image. Added C₈ Lean control. |
| FK phase, quadratic and linkage | k=0; (1,0) against zero; (1,1) against zero; (0,1) against (1,1) | Ordered phases can differ, or both equal one while linkage is false. Added explicit carrier cardinality and linkage controls. |
| FK good planes | All subspaces at k=0 through 3; bad line (1,0); each nonempty Γ constraint | Good counts 1,2,5,16; alternating-only counts 1,3,15,135. Added missing definition API/Checks; aligned all-k bijection with Lean and restricted Γ to nonempty. |
| Wood separator | m=0, b=0,1; m=1,b=(2,0), z=(4,8) versus (4,4) | Off-diagonal zero and diagonal nonzero detect the finite interval endpoint. Added multivariable Lean control and aligned API namespace. |
| Wood coefficient bound | Constant coefficient; first coefficient; finite polynomial degree | Absolute values are indispensable because coefficients alternate; retained. |
| Wood subgroup bound | Trivial group; elementary rank one and two | Exterior-square weight and a uniform constant are retained; no bound independent of group size is presumed. |
| Wood grid uniqueness | Zero profile; empty prime product; all antitone test profiles | Made “for every λ∈M” explicit. Finite moments, growth and absolute interchange remain hypotheses. |
| Wood bounded moment limit | a=1; a=p versus p²; finitely generated source; trivial target | Conclusion remains a quotient law with total mass one. Explained its precise finite-p-group application; retained exterior-square moment domination. |

## Definition tests and Lean signatures

Every defining block was checked for at least three discriminating tests,
including the subsidiary FK carrier, phase, quadratic expression, linkage and
good-plane predicate. Examples distinguish a finite group from its p-torsion
or power image, a class count from a subfield count, a quotient from an order
condition, all symmetric matrices from alternating matrices, and directed
vanishing from symmetrized vanishing. The newly explicit good-plane definition
now has zero-dimensional, computed, failing-line and linear-constraint tests.
No old mathematical control was deleted.

I compared all eleven non-example Lean declarations with the README, exceeding
the ten-signature requirement:

| Declaration | Signature comparison |
| --- | --- |
| `FieldStatistics.powerRank` | Finite commutative group; p-torsion of the p^(k−1) power image. Meaningful prime-rank claims restrict p prime and k≥1. |
| `powerRank_prod` | Both groups finite commutative; prime p and k≥1 present. |
| `FKSpace` | Exactly k pairs of binary coordinates, including k=0. |
| `fkPhase` | Ordered asymmetric phase matches the README formula. |
| `fkQuadratic` | Sum of u₁(u₁+u₂), including diagonal contribution. |
| `fkLinked` | Sum of the two ordered phases is one, rather than either phase alone. |
| `fkGoodPlanes` | Dimension k and vanishing on every ordered pair, including equal vectors. |
| `fk_good_subspace_bijection` | Both finite carriers exist at the pins; includes k=0 as now stated in prose. |
| `Distributions.woodGridSeparator` | Positive coordinate length, infinite head and inclusive finite intervals match the formula. |
| `woodGridSeparator_upper` | Prime, both antitone profiles and the precise first differing coordinate are explicit. |
| `woodGridSeparator_diagonal` | Prime and antitone target; conclusion is nonzero at its own grid point. |

All seven definitions have real bodies; the file develops no auxiliary theory.
The closing comment now lists the README definitions that cannot be stated
lightly on the existing carriers. The namespace, layer order and module
description match the package. Five added examples pin the bad good-plane
line, C₈ power ranks, equal nonzero unlinked phases, the separator at zero and
the multivariable endpoint. The final file has 131 lines.

## Validation and remaining work

- `lean-check` on the final `Suggested.lean`: exit 0 at the pinned shared
  build; **29 warnings, all “declaration uses sorry”**. No other warning or
  error. This checks elaboration only.
- `scripts/check_sorry_data.py`: passed; no sorry-defined data.
- `scripts/check_blueprint.py` on ArithmeticStatistics, ST.3 and ST.5:
  each reported **0 errors, 0 warnings**; packets were read-only.
- `research/blueprint/intake.py check-files` on all five changed deliverables:
  **0 problems**. All **202 relative Markdown links** in the README, report
  and handoff resolve to existing files and anchors. `git diff --check` passed.
- Exact finite computations were independently performed with modular
  elimination, subspace enumeration, direct finite-group homomorphism image
  enumeration and rational product arithmetic, with the ranges and results
  recorded above.

The package remains below 350 KB and the suggested file below 5,000 lines.
Metadata remains `math.NT`. No unresolved gap, ownership move to another
roadmap, or further job is requested. The remaining work is the ordinary
upstream implementation of the accepted roadmap, including the supporting
lemmas expressly described as targets rather than existing library proofs.
