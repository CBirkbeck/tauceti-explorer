# PAPER-HARPAZ-WITTENBERG-23 — extraction and routing checkpoint

Agent: Codex; session: codex-c83e7a. Refs #1310. Status: **partial**.

The entire 33-page final author version has been read, including §§1–7 and the references. The extraction has **139 items: 9 library, 15 planned, 115 missing**. Nine routes cover **113 missing and 7 planned items**, each once. Two missing items remain deliberately unrouted: `PAPER-HARPAZ-WITTENBERG-23/46` and `PAPER-HARPAZ-WITTENBERG-23/139`. The two length-six examples omitted from the paper have been supplied with explicit arguments below.

## Source and scope

Harpaz–Wittenberg, *The Massey vanishing conjecture for number fields*, Duke Mathematical Journal 172 (2023), no.1, 1–41; DOI [10.1215/00127094-2022-0004](https://doi.org/10.1215/00127094-2022-0004). The inspected [final author PDF](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf) is dated April 2019, revised 9 December 2021, and has SHA-256 `d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f`. It was acquired on 21 September 2026. All locators use its 33-page pagination.

[arXiv:1904.06512v2](https://arxiv.org/abs/1904.06512v2), posted 5 January 2022, identifies itself as the final version. Normalized text agrees on all 32 later pages; page 1 differs only by the arXiv header. The earlier 27-page author manuscript was identified and excluded. The publisher download returned HTML, so no comparison with the published 41-page layout is claimed.

The main theorem concerns **number fields**, every prime p, and every n≥3. Defined means at least one defining system exists; vanishing means **zero belongs to the set of values**. It does not force the entire set, or every chosen defining system, to be zero. The twisted theorem keeps one-dimensional F_p coefficient modules and the number-field hypothesis. The final counterexample has coefficients Z/8: it does not contradict either F_p theorem.

Historical results mentioned only in the introduction, such as topological linking interpretations, all-fields triple vanishing and nonformality examples, are context rather than proof prerequisites of the extracted targets. Definitions and key proof inputs actually used in §§2–7, including both supplementary applications, are extracted. The unproved all-rank outer-exponent question of Remark 4.8 is not promoted to a theorem.

## Proof structure

The source first translates defining systems into lifts to U/Z, where U=UT_(n+1)(F_p), and zero values into lifts to U. The obstruction value is the **negative** of the pulled-back extension class. The homogeneous splitting variety V=(SL_N×T_α)/U has stabilizer U¹, where N=|U|+1 comes from a determinant-corrected regular representation. Rational points correspond to weak embedding solutions; surjectivity of a solution is not required.

The crucial arithmetic input is [HW20 Théorème B](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), whose statement was independently checked on author page 3. Its stabilizer must be supersolvable **with its outer Galois action**, not merely as an abstract finite group. For these varieties a Brauer-orthogonal family of local points gives a rational point.

Proposition 3.3 computes the algebraic unramified Brauer group using a finite splitting field, cyclotomic character, conjugacy-power tests, and the Hochschild–Serre obstruction δ. The condition δβ=0 remains essential in the general characteristic-zero statement. Proposition 4.1 says the **geometric** unramified Brauer group vanishes, using Bogomolov’s comparison and Michailov’s unitriangular multiplier theorem. It does not assert Br_nr(V)=0 over the base field.

The auxiliary subgroup P_(r,s), with r+s=n−1, permits local lifting while imposing precisely the restriction needed on Brauer classes. For n≥7 choose r,s≥3, so P lies in U³. For n≤6 its image in B=(U¹)^ab lies in B_0, on which the unramified restriction vanishes. Pullback to the auxiliary homogeneous W makes all unramified classes constant. Global reciprocity then makes the projected local family orthogonal, completing the rational-point argument.

For rank-one twists, kill the diagonal characters by a prime-to-p extension and use restriction/corestriction injectivity. For Z/8, construct the endpoint characters from quadratic fields Q(√p), Q(√(2q)) with distinct p,q≡1 mod 8; the twisted dual module admits a Wang class. Its failure to lift in Sha¹ dualizes to a nonzero kernel in Sha². A middle character with that boundary produces an everywhere locally solvable embedding problem without a global solution. Vanishing of Sha²(Q,Z/8) kills the two adjacent cups, ensuring that the triple is defined.

## Ownership and pinned-library evidence

Ownership was checked against explorer commit `23d4f505864495019e17a3d2d7c721640458f152`, including current owner documents, stage descriptions, reviewed `data/library-coverage.json`, the reserved identifiers, galaxy identifiers and proposed new roadmaps. The library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The nine library items were matched to actual declaration statements. Tau Ceti already has the internally graded unital `IsDGAlgebra` carrier; continuous low-degree cochains; the `(1,1)` cup and its twisted formula; trivial-action H¹ as continuous characters; upper-unitriangular groups and scalar change; the superdiagonal filtration; its commutator **bound**; nilpotence; and abstract factor-set extension classification/splitting. The extraction does not confuse that bound with the reverse commutator inclusions needed here, or abstract extension classification with a continuous profinite lifting theorem.

Generic defining systems, higher Massey sets and their indeterminacy are already planned in **DGAInfinity Layer 8**. The all-degree cochain comparison/product, finite local Tate duality, global reciprocity and generic profinite embedding vocabulary have their own upstream suppliers. These are imported without rewriting Tau Ceti roadmaps. In particular ClassFieldTheory explicitly excludes Grunwald–Wang, so that arithmetic extension goes to IG.4.

The seven source routes are:

- **SchemeAndStackFoundations SF.1:** finite torsor descent.
- **SchemeAndStackFoundations SF.2:** the scheme Hochschild–Serre Brauer edge sequence and naturality.
- **SchemeAndStackFoundations SF.4:** smooth compactification in characteristic zero.
- **HeightsRationalPointsAndObstructions RP.2:** Brauer subgroups, the unramified full-product pairing, and B_ω as a subgroup of Br_1/Br_0.
- **ArithmeticGaloisDuality R02.2:** restriction/corestriction descent.
- **ArithmeticGaloisDuality R02.4:** finite-module Poitou–Tate and Sha duality, retaining real places.
- **InverseGaloisAndArithmeticFundamentalGroups IG.4:** cyclic degree-eight embedding arguments and the required Grunwald–Wang consequence.

Two Part II briefs supply the new layers. **ProfiniteCohomologyPartIIMasseyGalois** imports generic DGA Massey products and owns the Galois lifting dictionary, finite matrix/module calculations, refined local lifting and final ordinary/twisted/Z8 theorems. **HeightsRationalPointsPartIIHomogeneousMassey** adds explicit splitting varieties, outer-action supersolvability, the finite-stabilizer unramified Brauer formula and the rational-point argument. Their stage order is finite algebra → geometry/Brauer → arithmetic conclusion. Reciprocal roadmap imports must not become a cyclic stage graph. Both use `area: algebraicnt` and named existing parents.

Each definition/construction carries an API outline and three discriminating tests in its note. These are planning tests, not a claim of Lean implementation. Prerequisite references distinguish already owned Milne duality from additional HW20, Pál–Schlank, Lucchini Arteche, Bogomolov, Michailov, GMT18, Artin–Tate, CTP00 and characteristic-p inputs. Only the explicitly stated prerequisite excerpts were inspected; no claim of full prerequisite-paper reading is made.

## Corrections and completed omitted examples

**Twisted representative choices.** Proposition 7.3’s literal bijection must fix the adjacent **cochains** used to construct α, not only their cohomology classes. Over Γ=C2 and F_3, take N_0 with sign action and the other N_i trivial. All α_i can be zero while a_01(σ)=σ·1−1=1 is a nonzero coboundary. With the other cochains zero this is a defining system, but it cannot lift the α built from zero adjacent representatives. The corrected fixed-representative bijection is `PAPER-HARPAZ-WITTENBERG-23/111`; conjugation transports the class-level existence criterion.

**Cup order.** For finite C, put γ(g)=gsg^-1−s. Directly differentiating s(c) gives ∂c=γ cup c under Hom(C,A)⊗C→A. After flipping the pairing, this is (-1)^m c cup γ. The proof only uses surjectivity, but a reusable API must retain the sign.

**Real places.** Proposition 5.3 explicitly defines local field as nonarchimedean, while the main proof uses all places. For C the claim is immediate; for R and odd p the relevant maps C2→p-groups are trivial. For R,p=2, set t=σ−1 on finite F_2[C2]-modules. Since t²=0, H¹=ker(t)/im(t) has the perfect evaluation pairing with the dual quotient. The nonsplit splitting class therefore gives surjectivity onto H²(C2,F_2), and the same obstruction cancellation applies. The split-module retraction argument is unchanged. This fills the archimedean step in both main theorems.

**Matrix conventions.** In Lemma 4.13’s a_2≠0 construction, p.17 needs e_03^(a_2), as its prescribed Q_03=a_2 already shows. In §6 the indices 0,…,4 form a 5×5 subgroup. In §7, U^m/U^(m+1) uses Hom(N_(i+m+1),N_i). The two summands defining twisted P intersect in the corner Z: use an internal sum, not an external direct sum double-counting Z. Formula (4.2) treats distance≥4 entries as zero in B. The local easy case lifts to **U**, not the printed “to Z.”

**Explicit length-six example.** Take p=2,n=6 and σ=e_01+e_12+e_56. The vector e_25 is σ-fixed in B. If Q has a σ-fixed conjugacy class, some T with adjacent entries (1,1,0,0,0,1) commutes with Q. The (0,3), (1,4), (3,6) equations force Q_13=Q_24=Q_35=0; the (1,5) equation then forces Q_25=0. Thus the conjugacy-image span misses e_25. Exact enumeration gives fixed dimension six and image-span dimension five (`PAPER-HARPAZ-WITTENBERG-23/76`).

For the arithmetic example take k=Q and χ the quadratic character of Q(√2); set α=(χ,χ,0,0,0,χ), so G=C2. The functional e_25* is σ-invariant and defines a cocycle β(σ)=e_25*. It is not a coboundary, since a coboundary evaluates to zero on the fixed vector e_25. It annihilates every fixed conjugacy image by the preceding computation. Since δ=0 over Q and the mod-2 cyclotomic character is trivial, Proposition 3.3 makes β a nonzero unramified Brauer class. But Sha¹_cyc(C2,character B)=0. This proves the omitted strict-inclusion example (`PAPER-HARPAZ-WITTENBERG-23/77`); localization is nonzero at infinitely many inert primes.

The length-four example was separately checked: on the five-dimensional dual B for α=([ab],[a],[b],[ab]), there are eight cyclically trivial cocycles and four coboundaries, giving Sha¹_cyc≅C2. [GMT18 Example A.15](https://www.math.univ-paris13.fr/~wittenberg/massey.pdf), read on p.35, identifies the exceptional Brauer evaluation at 17 for (34,2,17,34). Its Massey product is **undefined**.

## Remaining gaps and validation

**G1 — `PAPER-HARPAZ-WITTENBERG-23/46`.** Remark 3.4 only asserts an example over C((x))((y))((z)) with abelian stabilizer and nonzero δ despite all conjugacy tests. An explicit homogeneous space, module and cocycle calculation are still needed. Its omission does not affect number fields, where δ vanishes.

**G2 — `PAPER-HARPAZ-WITTENBERG-23/139`.** The unrestricted discrete-module statement in Lemma 5.5 has a continuity problem. Let Γ=∏_i C2; let A=⊕F_2 a_i and C=⊕F_2 c_i have trivial action; put B=A⊕C with g c_i=c_i+g_i a_i. Every vector has open stabilizer, so B is a continuous discrete module, and the underlying sequence splits. Nevertheless γ(g)(c_i)=g_i a_i has trivial, nonopen kernel as a map to discrete Hom(C,A). It cannot represent a continuous H¹ class. The finite-C version used throughout the paper is separately routed and valid; a general topology-aware replacement is unresolved.

Exact finite checks cover 8,400 conjugation-entry equalities, 200 exceptional p=3 outer-exponent cases, 450 exceptional p=2 cases, 328 real-place lifting cases, the twisted representative counterexample, the length-four Sha computation and the length-six linear conjugacy systems. The matrix checks use deterministic finite arithmetic; the report provides algebraic arguments where it claims general conclusions. These checks neither prove arbitrary-rank statements nor replace Lean proofs.

The paper-schema checker, intake file checks, route uniqueness, current-owner validation, definition/API/test checks and three-file scope checks passed before submission. No Lean file is requested by this paper issue; none was compiled, and nothing is claimed formalized.
