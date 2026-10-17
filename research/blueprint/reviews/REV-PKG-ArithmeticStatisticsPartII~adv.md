# Independent package review: ArithmeticStatisticsPartII

**Verdict: accepted with the fixes in this review.** Job `REV-PKG-ArithmeticStatisticsPartII~adv`, issue #10274; reviewer Codex, session `codex-2dR2pb`; 17 October 2026. This is an independent review of the split package and its preceding fix, not an assertion that its target theorems have been proved in Lean.

The review covers the complete README, Suggested.lean, metadata, accepted original ST.1 material and split handoff. The upstream models read were JacobianChallenge and Completed/EffectiveBounds, with additional comparisons against IntegralLattices and GlobalQuadraticForms. The README remains the mathematical specification; the suggested file contains only light definitions and signatures available on the pinned carriers.

## Corrections

- Converted Cremona–Fisher's discriminant to the package's ordinary binary discriminant. The correct resultant identities are `Res(g,g₄)=81Δ²` and `Res(g,g₆)=Δ³`, and `disc(X³−3IX+J)=729Δ`. The former factors were wrong. Checks include a quartic with zero leading coefficient, where homogeneous degrees must be retained. Source: Cremona–Fisher [README reference 11](../packages/ArithmeticStatisticsPartII/README.md#ref-11), §2, Lemma 3, pp.2–3.
- Replaced an unsupported equivalence of Wood's and the Veronese first quadratic forms by the explicit cyclic permutation followed by first-form negation in the GL₂ factor. Their `4det` values have opposite signs, so an integral unimodular congruence of the first forms alone cannot work. The induced resolvent basis and generator marking are retained. Source: Wood [72](../packages/ArithmeticStatisticsPartII/README.md#ref-72), Theorems 2.5, 3.1 and Lemma 3.2, pp.6–8.
- Corrected the marked-Q sign test. The first-block determinant controls the sign only with the appropriate total determinant constraint; determinant-minus-one ambient completion can negate both blocks and leave Q unchanged. The two explicit diagonal completions and their absolute values now distinguish these cases. Source: Bhargava–Shankar–Wang [75](../packages/ArithmeticStatisticsPartII/README.md#ref-75), §3.4, Proposition 3.8, pp.13–14.
- Defined ternary quadratic determinant expressions as integral coefficient polynomials over arbitrary rings. Half-integral Gram notation is restricted to rings where 2 is invertible. Added a characteristic-two witness with nonzero half-discriminant and singular polar matrix. Ternary cubic invariants likewise mean universal integral polynomials, evaluated before any division by 1728. Sources: HCL III [70](../packages/ArithmeticStatisticsPartII/README.md#ref-70), §3.1, pp.1339–1340; Fisher [13](../packages/ArithmeticStatisticsPartII/README.md#ref-13), §7.2, p.27; Cremona–Fisher–Stoll [12](../packages/ArithmeticStatisticsPartII/README.md#ref-12), Lemma 3.11, pp.13–14.
- Matched the README common-isotropic predicate to its Lean generality over fields, including characteristic two, while restricting the geometric torsor theorems to symmetric generic pencils in characteristic different from two. Added mixed-pairing, zero-dimensional and excessive-rank controls.
- Made the promised degree-three, four and five descent interfaces explicit: groups, scalar kernels, coefficient lattices, invariant normalizations, Kummer images, localization and integral representatives. Corrected the degree-three and degree-four source locators. The degree-four resolvent linear-factor criterion detects order at most two, not only the identity. Sources: [77](../packages/ArithmeticStatisticsPartII/README.md#ref-77), Propositions 28–30, pp.15–16; [78](../packages/ArithmeticStatisticsPartII/README.md#ref-78), Propositions 7–9, pp.4–5; [79](../packages/ArithmeticStatisticsPartII/README.md#ref-79), Theorems 7–10, pp.5–6.
- Expanded the three-isogeny supporting target to specify the mirror algebra, normalized cubic invariant, ideal triples, actual Kummer image, integral multiplicity and local rational mass. Restricted its principal-basis global integral assertion to the source's Q/class-number-one scope, retaining the separate arbitrary-number-field rational dictionary. The choices needed at places above two and three are explicit. Source: BKLOS [3](../packages/ArithmeticStatisticsPartII/README.md#ref-3), §§3–8, particularly Theorems 3.1, 4.2, 5.3, 6.2, 7.1–7.3 and 8.1, pp.5–13.
- Supplied a named generalized-Picard comparison for the two-point modulus and its possibly nonsplit torus; replaced incorrect JacobianChallenge layer letters by SF.3 for unpointed Picard torsors and JacobianChallenge D for the pointed comparison. Source: BGW [73](../packages/ArithmeticStatisticsPartII/README.md#ref-73), §3, (4)–(5), pp.10–11, Theorems 24–25, pp.14–16.
- Distinguished full line-bundle stabilizers, central G_m quotients, the degree-two square-scaling μ₂ kernel, and differential-preserving stabilizers. Sources: Bhargava–Ho [76](../packages/ArithmeticStatisticsPartII/README.md#ref-76), Theorems 4.1, 4.5, 4.11, 4.14 and their remarks, pp.24–31.
- Repaired AnalyticNumberTheory supplier links to its actual Part II anchors. Strengthened normal-basis and conic-image tests, corrected the local-to-global integrality locator, aligned the Lean refinement namespace with the README, and listed the heavy supporting definitions in its closing comment.

## Source verification

No locator was marked unverified in the submitted package. The following 15 anchored blocks were sampled without replacement, using a pseudorandom sample with seed 10274 from the 86 original package anchors. Public PDFs were opened and the cited statements read; printed pagination is used below. The additional sources needed for corrections above were also read. No restricted book or source passage was copied into the deliverables.

| Sampled block | Source and locator checked | Disposition |
| --- | --- | --- |
| Quartic stabilizer | Bhargava–Shankar [1], Theorem 3.2, second paragraph, p.23; Bhargava–Ho [15], Remark 4.3, p.26 | Fixed-invariant PGL₂ stabilizer agrees with E[2]; distinguish the larger presentation group. |
| Ternary cubic invariants | Fisher [13], §7.2, p.27; CFS [12], Lemma 3.11, pp.13–14 | Locator correct; universal-polynomial interpretation clarified. |
| Quintic parametrization | HCL IV [10], Theorem 1, p.54; Theorem 2 and Corollary 3, p.55 | Correspondence and maximal-order uniqueness retained. |
| Alternating quadruples | HCL IV [10], Theorem 1, p.54; §4, p.66 and (18), p.67 | Carrier, Pfaffian sign and relative invariant checked. |
| Primitive SL₃ completion | CFS [12], Lemma 3.13, pp.14–15 | PID and primitive-vector hypotheses retained. |
| Ternary quadratic pairs | HCL III [70], §3.1, (11), pp.1339–1340 and (20), p.1342 | Integral coefficient convention clarified; Wood adapter corrected separately. |
| Quartic splitting types | HCL III [9], §4.1, (36)–(37), p.1353 | Zero-dimensional intersection and exceptional nonreduced types retained. |
| Auxiliary quartic root | Cremona–Fisher [11], Lemma 9, p.6 | Nonvanishing seminvariant hypotheses retained. |
| PGL₂ quartic action | Bhargava–Shankar [1], §2.6, (32), p.16 | Determinant-minus-two twist confirmed. |
| Pencil Fano torsor | BGW [73], Theorem 23, pp.12–13; Theorems 28–29, pp.18–20; Proposition 21, pp.10–11 | Generalized/smooth torsors and actual divisors remain distinct. |
| Quartic multiplication | HCL III [9], (21)–(23), pp.1342–1343; Propositions 10–11, pp.1343–1344 | Existing corrected `k≠i` summation and integral cancellation retained. |
| Index-p cubic subrings | BST [6], Proposition 15, p.7 | Projective-zero count, including zero reduction, confirmed. |
| Cubic invariant | Cremona–Fisher [11], §2, Lemma 1 and Proposition 2, pp.2–3; Fisher [17], §2, pp.2–3 | Norm-square construction checked; discriminant conversion fixed. |
| Integral quintic realization | HCL IV [71], Theorem 12 and Lemmas 13–15, §§10–11, pp.83–88 | Coefficient-preserving realization, not scalar rescaling alone. |
| Local-to-global integrality | Bhargava–Shankar [1], Proposition 3.6 proof, §3.2, pp.24–25 | Replaced imprecise §3.1/p.23 locator; retained explicit patching proof and denominator control. |

Gross–Lucianovic [7], Lemma 1.1, pp.1–2, and the proof of Proposition 2.1, pp.3–4, were additionally read in the public Harvard PDF to check scalar-quotient freeness and the two normalizing shifts. The updated supporting dictionaries cite the particular public versions in the README, rather than theorem numbers from another version.

## Adversarial pass

Each row covers the full anchored target, including its API identities, hypotheses and conventions. Instances are calculations or direct tests of the stated domain; excluded degeneracies are not claimed to satisfy a generic theorem. “Kept” means the stated restrictions survive the instances and needed no mathematical edit. Elaboration alone was not used as evidence of truth.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Scalar quotient freeness | Rank one; Z[t]/(t³−2); (Z/4)³ | Positive-rank PID/local scope supplies a basis beginning with 1. | Kept. |
| Based cubic index form | Z³; simultaneous doubling and negation of the quotient basis | Form xy²−x²y; doubling has factor 2, not 8. | Kept sign/twist adapter. |
| Normal cubic basis | Already normal basis; translated t+1,t²+2; square-zero algebra | Shifts (−1,−2) and (−1,0) restore scalar product. | Added two distinguishing checks. |
| Delone–Faddeev dictionary | Split, zero and t³ forms; finite-field factorization types | Degenerate algebras remain; twisted action is essential. | Repaired supplier link. |
| Cubic automorphisms | Split cubic; non-Galois field | Stabilizers S₃ and trivial; inverse-transpose respects composition. | Repaired supplier link. |
| Reducibility/domain criterion | y(x²+y²); x³−2y³; zero form | Product-zero witness versus domain; zero excluded where required. | Kept. |
| Étale cubic comparison | x³; x²y−xy²; characteristic three | Discriminant-zero case is excluded from étale locus. | Repaired supplier link. |
| Davenport–Heilbronn selectors | x³+2y³; x³+y³ at 3; zero | Translated divisibility distinguishes maximality from content. | Kept. |
| Small cubic overrings | x³+y³ at 3 | Translated coefficients satisfy the nonmaximality congruence. | Kept. |
| Cubic maximality criterion | Pure cubic order at 2,3; reducible nonmaximal order at 3 | The first is maximal; the second has index-three overorder. | Kept. |
| Index-p subrings | Split cubic; f≡0 mod p | Counts 3 and p+1, including p=2. | Kept. |
| Index-p overrings | x³+y³ at 3; lifting a repeated root mod 9 | Exactly one overring in the example. | Kept. |
| Ternary quadratic pairs | Identity Gram; proportional pair; xy+xz+yz over F₂ | Integral det4 differs from the polar determinant. | Removed illegal halves over general rings. |
| Quartic/resolvent data | Z⁴; square-zero quartic; Z+2Z⁴ | Contents 1, infinite, 2; discriminant alone does not define resolvent data. | Kept. |
| Quartic multiplication | Zero pair; Veronese pair; one normalized coefficient | Zero augmentation products and integral constants agree. | Kept existing corrected index. |
| Quartic orbit dictionary | Split quartic; dependent pairs | Degenerate square-zero ring remains allowed. | Kept. |
| Number of cubic resolvents | Primitive/maximal order; content 2 | Unique versus σ(2)=3. | Kept finite-content restriction. |
| Quartic p-maximality | All coefficients p-divisible; p²∤Δ | First nonmaximal; second maximal. | Kept. |
| Quartic splitting | Four distinct points; double line | Étale locus separated from exceptional nonreduced cases. | Kept. |
| Alternating quadruples/Pfaffians | One standard Pfaffian; scale 2; characteristic-two off-diagonal block | Values 1 and 4; skew symmetry alone admits a forbidden identity matrix. | Added scaling and F₂ controls. |
| Quintic correspondence | Split ring; maximal order; zero tensor | Degenerate ring permitted; uniqueness only under maximality. | Kept. |
| Quintic maximality | p²∤Δ, including p=2,3 | Falls in maximal locus; no three-shape replacement. | Kept four-index criterion. |
| PGL₂ quartic action | Scalar; diag(2,1); f and −f with J≠0 | Correct action weights; different J prevents comparison. | Distinguished abstract quotient from group-scheme points. |
| Quartic solubility | Negative definite form; linear factor; Lind quartic; reducible rootless form | Solubility, projective roots and reducibility are different predicates. | Kept. |
| Quartic covariants | x³y; x⁴−y⁴ at (1,1) | g₄=3x⁴, g₆=x⁶ in first case; g₄(1,1)=48 in second. | Kept. |
| Covariant syzygy | x³y; x⁴−y⁴ at (1,0) | Seminvariant identity, including zero terms, holds. | Kept. |
| Cubic invariant construction | x⁴−y⁴; general integral tuple; leading-zero x³y−xy³ | Resultants 81Δ² and Δ³; resolvent discriminant 729Δ. | Corrected all three scale factors; added witnesses. |
| Cubic invariant orbit covariance | Diagonal proper substitution | Representative changes by a square. | Kept. |
| Linear-factor orbit | x³y−xy³ | Neutral squareclass with I=3,J=0. | Kept. |
| Auxiliary comparison quartic | Equal forms; excluded vanishing r | Root assertion is used only after nonvanishing coordinate choice. | Kept. |
| Comparison factor gives equivalence | Equal forms | Identity transformation recovers the orbit. | Kept. |
| Completeness of cubic invariant | diag(2,1) applied to x⁴−y⁴; sign reversal with J≠0 | Equal invariants required in one specified cubic algebra. | Kept corrected non-example. |
| Quartic of a point | O; two-torsion (0,0); affine point | Linear-factor identity; monic affine representative. | Kept. |
| Point-quartic Kummer comparison | O; point (−3,12); root point (0,0) | Cofactor correction gives unit class at two-torsion. | Kept. |
| E/2E orbit dictionary | R with either discriminant sign; F_p, p≥5 | Real counts 1 or 2; finite-field count is the two-torsion order. | Kept characteristic and finite-field restrictions. |
| Bilinear-factor equivalence test | x⁴−y⁴ over Q(i) | Four proper self-equivalences. | Kept. |
| Fixed-invariant quartic stabilizer | Both real signs; x⁴−y⁴ over Q | Orders 4/2 over R, 2 in rational example. | Kept separate from full presentation stabilizer. |
| Image/conic criterion | m=1; 28+7φ; nonsquare-norm m=2 | Explicit isotropic/square-norm witness; isotropy alone insufficient. | Replaced schematic tests with computed controls. |
| Locally soluble quartics/Selmer | Neutral linear-factor form; Lind quartic; 571a1 | Identity and Sha classes remain distinct. | Kept. |
| Primitive SL₃ completion | Primitive projective doubling vector; nonprimitive vector | Unit-ideal condition necessary. | Kept. |
| Ternary cubic invariant definition | Fermat, Weierstrass, zero and xyz; characteristics 2,3 | c₄=48 for stated Weierstrass model; xyz has Δ=0 but c₄,c₆≠0 over Z. | Clarified integral polynomials; added degeneracies. |
| Ternary invariant covariance | SL₃ substitution; diagonal determinant factor | Weights 4 and 6 retained. | Kept universal polynomial identity. |
| Cubic projection | Weierstrass cubic; A=−7,B=10; base change | Quartic (0,4,0,4A,4B), invariants 336,−17280. | Kept. |
| Projected-quartic invariant | (−3,12) on y²=x³−43x+42 | Squareclasses (−1,−1,1). | Kept. |
| Local integral quartics | y²=x³−2 at 2; translated integral point | Required factors 2⁴,2⁶ remain. | Kept small-prime scope. |
| Local-to-global integrality | One bad prime; diag(1/3,1) integral at 2 | Rationality alone can introduce a denominator elsewhere. | Corrected locator; retained CRT proof. |
| Global integral quartics | Two-Selmer of y²=x³−2 | Integral representatives at invariants (0,3456). | Kept scales. |
| Integral two-Selmer dictionary | y²=x³−x; omitted scaling | Four classes; unscaled integrality not asserted. | Kept rational equivalence on integral representatives. |
| Cohomological comparison | 571a1 | Three nonzero classes map to Sha[2]. | Kept Hasse/conic and Kummer suppliers. |
| Veronese embedding | x³y; unipotent action on y⁴ | Resolvent x³; corrected representation order gives coefficient 1. | Kept earlier source erratum correction. |
| Veronese orthogonal group | −I₂; coordinate reversal | Scalar kernel and determinant-one orthogonal image agree. | Kept specialization of generic orthogonal theory. |
| Embedding orbit bijection | x³y and x³y+xy³ | Their inequivalence persists after embedding. | Kept. |
| Uniform embedding fibres | f,−f with J≠0; cyclic discriminant-49 cubic | Existing argument yields 2N, not printed N. | Kept corrected bound and source discrepancy. |
| Quartic minors | Standard rows; row swap; proportional rows | λ₀₁=1,−1,0; determinant character agrees with Lean. | Aligned namespace. |
| Integral minor fibres | Primitive minors; gcd 2; zero minors | Counts 1,3; zero fibre has no finite divisor-sum formula. | Kept. |
| Binary local densities | Quartics mod 4 and 9; quadratic/cubic exceptional formulas | Exact counts 384 and 42768; squarefree and maximal predicates differ. | Kept verified formulas. |
| Quintic multiplication | Zero; unit basis vector; nonzero structure coefficient | Square-zero augmentation, unit e₀, coefficient 1. | Kept. |
| Sextic multiplication | Zero; e₀e₅; discriminant-one quintic | Sextic discriminant is 4096, not 1. | Kept factor 16. |
| Based sextic resolvent | Zero; fixed source tensor; wrong sextic discriminant | Both multiplications and the resolvent map are required. | Kept. |
| Nondegenerate sextic comparison | Trace dual; discriminant formula; zero excluded | Target is annihilator of 1, not the quintic ring. | Kept. |
| Integral quintic realization | Prescribed coefficients; scalar multiplication of tensor | Scaling alone changes coefficients by n⁵. | Kept nonétale extension obligation and multiplier argument. |
| Quintic minimal model | Maximal/nonmaximal orders; primes 2,3 | Uniqueness remains restricted to maximal orders. | Kept. |
| Monogenized cubic resolvent | t,t+1,t² in Z[t]/t³ | First two give same marking; t² fails to generate. | Added ordinary-monogenicity supplier boundary. |
| Wood interpretation | Opposite first-form determinants; zero quartic | Full pair adapter needed; degenerate resolvent Z[t]/t³ retained. | Corrected permutation/GL₂ sign adapter. |
| Common isotropic subspace | Zero pencil; real identity; n=r=0; r>n; F₂ mixed pair | Bilinear condition, rank convention and theorem exclusions agree. | Generality matched; negative controls added. |
| Oriented ideal triples | Monic f; zero lattice; opposite orientations; n=2 | Rank, norm, sign and n≥3 requirements essential. | Kept. |
| Integral pencil dictionary | Product algebra; noninvertible ideal; central quotient | Endomorphism order and group-scheme points retained. | Kept. |
| Oriented norm pairs | f₀=1; both signs; split cubic; wrong algebra degree | Sign identification requires norm-minus-one square root. | Kept. |
| Field pencil stabilizers | Split even degree; squareclasses without orientation | Geometric order 2^(n−2); orientation can double orbit count. | Kept. |
| Pencil existence/generalized Picard | Negative definite real f; split/nonsplit infinity algebra; dimension | Norm obstruction and modulus torus cannot be discarded. | Added named comparison and three computed tests. |
| Pencil Fano torsor | g-dimensional subspace; real degree-one Picard class without divisor | Smooth and augmented torsors differ; actual divisors needed. | Corrected unpointed Picard supplier. |
| Locally soluble pencil orbits | Changed base orbit; nonlocally soluble rational orbit | Identification with Sel₂ is a torsor choice. | Kept. |
| Integral soluble pencils | Coefficients divisible by 16; unscaled form | Required divisibilities 16^i hold; existence is not uniqueness. | Kept. |
| Quartic monicization | (2,3,5,7,11); a=0,1; ± real examples | (1,3,10,28,88); scales a²,a⁶; solubility need not persist. | Kept all four tests and Lean examples. |
| Marked quartic Selmer embedding | Fixed determinant-one A; variable scaling; distinct Selmer elements | Monic invariant and rational-orbit injection retained. | Kept separate even-degree adapter. |
| Weak discriminant divisibility | x³−x²y+p²y³; x³; p=2 | Weak/strong distinguished; weak divisibility by 4 empty. | Kept. |
| Q hyperdeterminant | g=1; g=2; zero blocks | Values −1,−1,0 pin descending coefficient signs. | Kept. |
| Q² divides discriminant | g=1 arbitrary lower blocks; zero Q | Polynomial divisibility, not a division by Q. | Kept source correction on unused stronger assertion. |
| Marked Q | Two diagonal completions; rational diag(2,1,1/2) | Signed values −1/−1/+1; rational bases can change absolute value. | Corrected completion-sign claim and Lean witness. |
| Odd weak lift | m=1; tensor outside image | Absolute Q is 1; injection does not assert surjectivity. | Kept. |
| One-matrix slice | Signed antidiagonal matrix; reducible invariant | Monic for every n; orbit injection only on source's irreducible domain. | Kept arithmetic specialization. |
| Even weak lift | Different m; same-degree proposed target | Images disjoint; target degree increases to n+1. | Kept. |
| Genus-one stabilizer schemes | Degree 4/5 scalar pairs; generic j; degree-two μ₂ | Full, central-quotient and differential-preserving stabilizers differ. | Added group and order controls. |
| Quartic invariant order | Primitive order; Z+nQ′ | Quotient scales by n² and relative index is n. | Kept nonzero-discriminant/finite-content domain. |
| Integral quartic resolvent comparison | Split order; order in cyclic quartic field | Rational resolvent may be reducible; lattice discriminants agree. | Removed generic resolvent construction from target; import it. |
| Good-prime integral pencils | Odd p with p²∤Δ; failure of this restriction | Unique integral orbit and equal point stabilizers only on stated locus. | Kept Q_p/Z_p scope, not arbitrary DVR generalization. |
| Supporting degree 3/4/5 descent | E:y²=x³−x; scalar kernels; real nonidentity class of order 2 | Invariant scales and linear-factor distinction necessary. | Added exact APIs, groups, locators and four controls. |
| Supporting divided cubic discriminant | Leading-zero cubic; zero; characteristics 2,3; scalar 2 | D and ordinary fixed-degree Δ differ by −27; affine degree drop matters. | Added README definition/API and three test groups matching Lean. |
| Supporting three-isogeny mirror | Constant and twisted kernel; neutral cubic; split norm classes | Mirror squareclass is −3D; actual Kummer image required. | Expanded exact dictionary and integral restrictions. |
| Integral cubic multiplicity/mass | One/two equal-stabilizer orbits; stabilizer ratio 3 | Multiplicities 1,2,3; weighted sums give rational-orbit mass. | Defined finite local scope and separated soluble mass. |
| Shared conventions | Empty determinant; zero module; p=2; vanishing leading coefficient | Empty determinant 1; integral polynomial definitions precede generic interpretations. | Added/resultant and characteristic controls as above. |

The original 86 anchor blocks are all present. The 229 original anchored Check bullets become 247; six old bullets are corrected or specialized, rather than discarded: the two conic-image bullets, Wood's coordinate equivalence, the marked-Q sign bullet, and the two rational-resolvent bullets now tested on specified orders. New supporting-target Checks are additional to that count.

Exact independent arithmetic used rational polynomial operations and Sylvester determinants, not the sorry proofs. For `x⁴−y⁴`, the two resultants are 5,308,416 and −16,777,216. For `(2,3,5,7,11)`, `(I,J,Δ)=(226,3296,1307744)` and both resultant identities agree. For `x³y−xy³`, homogeneous resultants are 1296 and 64 despite its affine degree drop. The Simon witness has norm 9604 and invariants `(3,0,4)`. Exhaustion of all 4⁵ and 9⁵ quartic coefficient tuples gives 384 and 42,768 squarefree-discriminant residues. Direct substitutions also verify the Wood adapter and all three marked-Q signs. These computations are evidence for the convention checks, not proofs of the universal targets.

## Closure, boundaries and current-library duplication

The current upstream roadmap revision checked was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library revision was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered all current roadmap README and Suggested files, Completed roadmaps and current library Lean sources, using mathematical objects and hypotheses: binary quartics, cubic/quintic rings, sextic resolvents, monogenic orders, theta groups, norm-one kernels, Pfaffians, common isotropic subspaces and pencil stabilizers. The newer roadmap families and generic quadratic, Selmer and Picard interfaces were checked as suppliers, rather than assumed absent from the older atlas snapshot.

One existing target component was removed: the generic three-element quartic resolvent construction and polynomial discriminant equality. PolynomialGaloisGroups Layer 4 and `TauCeti.FieldTheory.GaloisGroups.Resolvent.Quartic.Basic`/`.Discriminant` already supply them. The boundary now names `quarticD4Invariant`, `quarticD4Spec`, `quarticD4Spec_specialize`, `resolventCubic`, `discr_quarticD4Spec_specialize`, `discr_resolventCubic` and `separable_resolventCubic_iff`. The retained target compares the integral resolvent map/order lattice to that algebra; generic resolvent theory is no longer assigned here. No removed-target stub remains.

The current `TauCeti.NumberField.IsMonogenic` and `isMonogenic_iff_exists_index_eq_one` were read and cited as ordinary maximal-order suppliers. The retained cubic-resolvent target includes a chosen generator modulo translation, nonmaximal orders and nonétale rings. Generic orthogonal groups, integral lattice reduction, finite quadratic modules, explicit elliptic Kummer maps and Selmer cardinal inequalities remain supplier boundaries. No other exact current-library duplicate was identified among this part's arithmetic variants.

The accepted original `ArithmeticStatistics` packet has 57 ST.1 nodes and its ST.1 refinement packet has 33. Of those 90, this part contains 83; all seven others occur in Part I and are explicitly linked here: binary-cubic action, cubic-ring carrier, ring of a cubic form, its discriminant, symmetric pencil, fixed-degree binary discriminant, and binary-form order. The three further package targets—binary densities, quartic monicization and marked quartic Selmer embedding—are preserved. The independent review therefore finds no target lost at this split boundary.

Cross-part supplier links go only to Part I and the supplying AnalyticNumberTheory Part II anchors. The cubic free-basis/sign/weight contracts explicitly specialize AnalyticNumberTheory's general projective dictionary. No later arithmetic-statistics part supplies this part; ModularityAndLanglandsExtensions is downstream only. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` supplier remains. The newly explicit generalized-Picard modulus comparison and descent adapters close promises formerly left in supporting prose; their general foundations remain with the named lower suppliers.

## Lean and local validation

`lean-check` on the final Suggested.lean exited 0 against Mathlib `082e2d3` and Tau Ceti `f790474`. There were 34 warnings, all `declaration uses sorry`, and no errors or other warning kinds. No data definition has a sorry body. There are no invented arithmetic carriers or developments of their theory in this file; the closing comment names the heavy README constructions.

The following ten signatures were compared directly with the README, including their coefficient rings, matrix sizes, quantifier domains and exceptions:

| Lean declaration | README comparison |
| --- | --- |
| `BinaryQuartic.monicize` | Five descending coefficients; real body over every commutative ring, including a=0. |
| `ArithmeticOrbitRefinement.quarticMinors` | Integer 2×6 matrix, ordered minors. |
| `quarticMinors_mul` | Any integer 2×2 row operation; determinant factor, no invertibility needed for polynomial identity. |
| `pencilPoly` | Signed determinant, original matrix size retained. |
| `pencilInvariant` | Descending coefficients indexed by Fin(n+1), including n=0. |
| `pencilInvariant_congr` | Any congruence matrix; square determinant character over a commutative ring. |
| `pencilInvariant_scalar` | Signed n-th power; no positive-rank restriction. |
| `commonIsotropic` | All fields and matrices; bilinear restriction and vector dimension, not projective dimension. |
| `Cubic.normalizedDisc` | Divided coefficients and integral polynomial, valid in small characteristic. |
| `ordinaryDisc_eq` | Field and nonzero leading coefficient for affine Polynomial.discr; fixed-degree identity separately in prose. |

All README definitions either have a light declaration or appear by construction family in the closing comment. Checks were audited for computed positive cases, excluded cases and degenerate boundaries; each definition has at least three discriminating tests. The exact finite arithmetic checks above pass. Local Markdown links and fragments resolve, all five deliverables pass `intake.py check-files` with zero problems, and `git diff --check` passes. The README is below the issue's 350 KB limit and Suggested.lean below 5,000 lines; metadata remains `math.NT`.

No unresolved package defect or upstream edit is requested. Future work is to implement the roadmap's stated mathematics; the named heavy targets are intentional roadmap deliverables, not placeholders claimed to elaborate at the pins. This report is the handoff for the independent review; it depends on no scratch files.
