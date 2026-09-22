# PAPER-HARPAZ-WITTENBERG-23 — complete extraction and routing

Agents: Codex, original checkpoint session codex-c83e7a; continuation session codex-a71f92. Refs #1310. Status: **complete** (paper extraction, not formalization).

The entire 33-page final author version has been read, including §§1–7 and the references. The continuation reread that entire version and all 139 inherited items. The extraction now has **156 items: 10 library, 15 planned, 131 missing**. Ten routes cover **all 131 missing and seven planned items**, each once. Both inherited gaps are resolved below, retaining the false printed assertion's explicit disposition. The two inherited length-six examples are preserved. This is a continuation of another worker's checkpoint, not its independent review.

## Source and scope

Harpaz–Wittenberg, *The Massey vanishing conjecture for number fields*, Duke Mathematical Journal 172 (2023), no.1, 1–41; DOI [10.1215/00127094-2022-0004](https://doi.org/10.1215/00127094-2022-0004). The inspected [final author PDF](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf) is dated April 2019, revised 9 December 2021, and has SHA-256 `d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f`. It was acquired on 21 September 2026. All locators use its 33-page pagination.

[arXiv:1904.06512v2](https://arxiv.org/abs/1904.06512v2), posted 5 January 2022, identifies itself as the final version. The original worker's collation found normalized text agreement on all 32 later pages; page 1 differs only by the arXiv header. The continuation reacquired the same author-file hash and reread it, without claiming a fresh arXiv/publisher collation. The earlier 27-page author manuscript was identified and excluded. The publisher download returned HTML, so no comparison with the published 41-page layout is claimed.

The main theorem concerns **number fields**, every prime p, and every n≥3. Defined means at least one defining system exists; vanishing means **zero belongs to the set of values**. It does not force the entire set, or every chosen defining system, to be zero. The twisted theorem keeps one-dimensional F_p coefficient modules and the number-field hypothesis. The final counterexample has coefficients Z/8: it does not contradict either F_p theorem.

Historical results mentioned only in the introduction, such as topological linking interpretations, all-fields triple vanishing and nonformality examples, are context rather than proof prerequisites of the extracted targets. Definitions and key proof inputs actually used in §§2–7, including both supplementary applications, are extracted. The unproved all-rank outer-exponent question of the unnumbered remark after Lemma 4.7 (p.14) is not promoted to a theorem.

## Proof structure

The source first translates defining systems into lifts to U/Z, where U=UT_(n+1)(F_p), and zero values into lifts to U. The obstruction value is the **negative** of the pulled-back extension class. The homogeneous splitting variety V=(SL_N×T_α)/U has stabilizer U¹, where N=|U|+1 comes from a determinant-corrected regular representation. Rational points correspond to weak embedding solutions; surjectivity of a solution is not required.

The crucial arithmetic input is [HW20 Théorème B](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), whose statement was independently checked on author page 3. Its stabilizer must be supersolvable **with its outer Galois action**, not merely as an abstract finite group. For these varieties a Brauer-orthogonal family of local points gives a rational point.

Proposition 3.3 computes the algebraic unramified Brauer group using a finite splitting field, cyclotomic character, conjugacy-power tests, and the Hochschild–Serre obstruction δ. The condition δβ=0 remains essential in the general characteristic-zero statement. Proposition 4.1 says the **geometric** unramified Brauer group vanishes, using Bogomolov’s comparison and Michailov’s unitriangular multiplier theorem. It does not assert Br_nr(V)=0 over the base field.

The auxiliary subgroup P_(r,s), with r+s=n−1, permits local lifting while imposing precisely the restriction needed on Brauer classes. For n≥7 choose r,s≥3, so P lies in U³. For n≤6 its image in B=(U¹)^ab lies in B_0, on which the unramified restriction vanishes. Pullback to the auxiliary homogeneous W makes all unramified classes constant. Global reciprocity then makes the projected local family orthogonal, completing the rational-point argument.

For rank-one twists, kill the diagonal characters by a prime-to-p extension and use restriction/corestriction injectivity. For Z/8, construct the endpoint characters from quadratic fields Q(√p), Q(√(2q)) with distinct p,q≡1 mod 8; the twisted dual module admits a Wang class. Its failure to lift in Sha¹ dualizes to a nonzero kernel in Sha². A middle character with that boundary produces an everywhere locally solvable embedding problem without a global solution. Vanishing of Sha²(Q,Z/8) kills the two adjacent cups, ensuring that the triple is defined.

## Ownership and pinned-library evidence

Ownership was checked against explorer commit `23d4f505864495019e17a3d2d7c721640458f152`, including current owner documents, stage descriptions, reviewed `data/library-coverage.json`, the reserved identifiers, galaxy identifiers and proposed new roadmaps. The library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The original nine library items were matched to actual declaration statements. Tau Ceti already has the internally graded unital `IsDGAlgebra` carrier; continuous low-degree cochains; the `(1,1)` cup and its twisted formula; trivial-action H¹ as continuous characters; upper-unitriangular groups and scalar change; the superdiagonal filtration; its commutator **bound**; nilpotence; and abstract factor-set extension classification/splitting. The extraction does not confuse that bound with the reverse commutator inclusions needed here, or abstract extension classification with a continuous profinite lifting theorem.

Generic defining systems, higher Massey sets and their indeterminacy are already planned in **DGAInfinity Layer 8**. The all-degree cochain comparison/product, finite local Tate duality, global reciprocity and generic profinite embedding vocabulary have their own upstream suppliers. These are imported without rewriting Tau Ceti roadmaps. In particular ClassFieldTheory explicitly excludes Grunwald–Wang, so that arithmetic extension goes to IG.4.

The original seven source routes are:

- **SchemeAndStackFoundations SF.1:** finite torsor descent.
- **SchemeAndStackFoundations SF.2:** the scheme Hochschild–Serre Brauer edge sequence and naturality.
- **SchemeAndStackFoundations SF.4:** smooth compactification in characteristic zero.
- **HeightsRationalPointsAndObstructions RP.2:** Brauer subgroups, the unramified full-product pairing, and B_ω as a subgroup of Br_1/Br_0.
- **ArithmeticGaloisDuality R02.2:** restriction/corestriction descent.
- **ArithmeticGaloisDuality R02.4:** finite-module Poitou–Tate and Sha duality, retaining real places.
- **InverseGaloisAndArithmeticFundamentalGroups IG.4:** cyclic degree-eight embedding arguments and the required Grunwald–Wang consequence.

Two Part II briefs supply the new layers. **ProfiniteCohomologyPartIIMasseyGalois** imports generic DGA Massey products and owns the Galois lifting dictionary, finite matrix/module calculations, refined local lifting and final ordinary/twisted/Z8 theorems. **HeightsRationalPointsPartIIHomogeneousMassey** adds explicit splitting varieties, outer-action supersolvability, the finite-stabilizer unramified Brauer formula and the rational-point argument. Their stage order is finite algebra → geometry/Brauer → arithmetic conclusion. Reciprocal roadmap imports must not become a cyclic stage graph. Both use `area: algebraicnt` and named existing parents.

Each definition/construction carries an API outline and three discriminating tests in its note. These are planning tests, not a claim of Lean implementation. Prerequisite references distinguish already owned Milne duality from additional HW20, Pál–Schlank, Lucchini Arteche, Bogomolov, Michailov, GMT18, Artin–Tate, CTP00 and characteristic-p inputs. Only the explicitly stated prerequisite excerpts were inspected; no claim of full prerequisite-paper reading is made. The continuation additionally read Pál–Schlank §9 pp.28–31 and Gille–Szamuely §6.3 pp.147–150 and §6.8 pp.171–176, including the proofs used below. It refreshed current owner stages and reviewed audits at explorer `27a7807aa69923eadb1470ddbf1b36fe47408d92`, and read the ArithmeticGaloisDuality and SchemeAndStackFoundations owner documents. It reread the actual nine inherited library matches and the newly separated transvection declarations at the unchanged pins.

## Corrections and completed omitted examples

**Twisted representative choices.** Proposition 7.3’s literal bijection must fix the adjacent **cochains** used to construct α, not only their cohomology classes. Over Γ=C2 and F_3, take N_0 with sign action and the other N_i trivial. All α_i can be zero while a_01(σ)=σ·1−1=1 is a nonzero coboundary. With the other cochains zero this is a defining system, but it cannot lift the α built from zero adjacent representatives. The corrected fixed-representative bijection is `PAPER-HARPAZ-WITTENBERG-23/111`; conjugation transports the class-level existence criterion.

**Cup order.** For finite C, put γ(g)=gsg^-1−s. Directly differentiating s(c) gives ∂c=γ cup c under Hom(C,A)⊗C→A. After flipping the pairing, this is (-1)^m c cup γ. The proof only uses surjectivity, but a reusable API must retain the sign.

**Real places.** Proposition 5.3 explicitly defines local field as nonarchimedean, while the main proof uses all places. For C the claim is immediate; for R and odd p the relevant maps C2→p-groups are trivial. For R,p=2, set t=σ−1 on finite F_2[C2]-modules. Since t²=0, H¹=ker(t)/im(t) has the perfect evaluation pairing with the dual quotient. The nonsplit splitting class therefore gives surjectivity onto H²(C2,F_2), and the same obstruction cancellation applies. The split-module retraction argument is unchanged. This fills the archimedean step in both main theorems.

**Matrix conventions.** In Lemma 4.13’s a_2≠0 construction, p.17 needs e_03^(a_2), as its prescribed Q_03=a_2 already shows. In §6 the indices 0,…,4 form a 5×5 subgroup. In §7, U^m/U^(m+1) uses Hom(N_(i+m+1),N_i). The two summands defining twisted P intersect in the corner Z: use an internal sum, not an external direct sum double-counting Z. Formula (4.2) is right to treat distance≥4 entries as zero in B: they lie in U³ = Ker(U¹→B). The local easy case lifts to **U**, not the printed “to Z.”

**Explicit length-six example.** Take p=2,n=6 and σ=e_01+e_12+e_56. The vector e_25 is σ-fixed in B. If Q has a σ-fixed conjugacy class, some T with adjacent entries (1,1,0,0,0,1) commutes with Q. The (0,3), (1,4), (3,6) equations force Q_13=Q_24=Q_35=0; the (1,5) equation then forces Q_25=0. Thus the conjugacy-image span misses e_25. Exact enumeration gives fixed dimension six and image-span dimension five (`PAPER-HARPAZ-WITTENBERG-23/76`).

For the arithmetic example take k=Q and χ the quadratic character of Q(√2); set α=(χ,χ,0,0,0,χ), so G=C2. The functional e_25* is σ-invariant and defines a cocycle β(σ)=e_25*. It is not a coboundary, since a coboundary evaluates to zero on the fixed vector e_25. It annihilates every fixed conjugacy image by the preceding computation. Since δ=0 over Q and the mod-2 cyclotomic character is trivial, Proposition 3.3 makes β a nonzero unramified Brauer class. But Sha¹_cyc(C2,character B)=0. This proves the omitted strict-inclusion example (`PAPER-HARPAZ-WITTENBERG-23/77`); localization is nonzero at infinitely many inert primes.

The length-four example was separately checked: on the five-dimensional dual B for α=([ab],[a],[b],[ab]), there are eight cyclically trivial cocycles and four coboundaries, giving Sha¹_cyc≅C2. [GMT18 Example A.15](https://www.math.univ-paris13.fr/~wittenberg/massey.pdf), read on p.35, identifies the exceptional Brauer evaluation at 17 for (34,2,17,34). Its Massey product is **undefined**.

## Completed Remark 3.4 example

The following explicit witness is this continuation's derivation, not a construction found in the paper. It closes former G1 (item46), with separate interfaces in items144–152.

Put k=C((x))((y))((z)) and L=k(√x, fourth-root(y), √z). Valuations and Kummer theory give Gal(L/k)=Q=C2(s)×C4(t)×C2(r). Let B be the five-dimensional F_2-space with ordered basis a,b,c,d,e. Let r act trivially and write s=1+N_s,t=1+N_t, where

| Basis vector | N_s | N_t |
| --- | --- | --- |
| a | 0 | d |
| b | d+e | d+e |
| c | e | 0 |
| d,e | 0 | 0 |

The two square-zero operators have zero products in either order. This is the length-four action of Example6.3 with α=(χ_x+χ_y,χ_x,χ_y,χ_x+χ_y), inflated to Q.

Let M=B* and write b*,d*,e* for the coordinate functionals. The functional b* is invariant, so β(q)=(q_s+q_t mod2)b* is a cocycle. It is cyclically trivial: on parity (1,0) its value is (s−1)d*; on (0,1) it is (t−1)e*; on (0,0) and (1,1) it is zero. This treats every q, including its r-coordinate and t². Equivalently β(q) annihilates B^q, precisely the conjugacy-power test for this abelian stabilizer over a field containing all roots of unity.

It is not a global coboundary. If m has d*,e* coefficients u,v, then
(s−1)m=(u+v)b*+vc* and (t−1)m=ua*+(u+v)b*. Making both equal b* forces v=0,u=1 from the first, contradicting the a* coefficient of the second.

Define γ(s)=a, γ(t)=b+c, γ(r)=0. The commutation relation holds because N_s(b+c)=d=N_t(a). The s-norm of a and the fourth t-norm of b+c vanish. Thus γ extends uniquely to a Q-cocycle, explicitly
γ(s^i t^j r^l)=ia+s^i Σ_(h<j)t^h(b+c).
In particular γ(t²)=d+e: replacing the quartic t-factor by C2 would invalidate the construction. Its b-coordinate is j mod2.

Write ζ(q)=q_r and f(q,q′)=γ(q)ζ(q′). The cocycle identity for γ makes f a normalized B-valued 2-cocycle. On E=B×Q use
(v,q)(w,q′)=(v+q w+f(q,q′),qq′).
This is a group of order512 with kernel B and quotient Q. Embed E faithfully in SL_513 by its augmented regular representation and form V=(SL_513×Spec L)/E using diagonal right actions. The general splitting-variety construction gives a smooth geometrically connected SL_513-homogeneous space, geometric stabilizer B, the specified outer action, and V(L)≠∅. It does not assert V(k)≠∅.

### Checking the actual edge obstruction

This is the load-bearing comparison; a finite cocycle calculation alone would not compute the geometric δ.

[Pál–Schlank §9](https://arxiv.org/pdf/1602.04998), Definition9.3 and Lemma9.4, identify the fundamental extension of V with Γ_k×_Q E. Definition9.7 and Lemmas9.8–9.9 give the natural map from group to étale cohomology and a map of Hochschild–Serre sequences. The needed geometric rows q=0,1 identify constants and Pic(Vbar)=Hom(B,kbar×); the finite cover SL_513→Vbar has constant units and Pic(SL_513)=0. Consequently geometric δ equals the extension differential d₂^{1,1}. An abstract Brauer-group isomorphism without this naturality would not suffice.

Here that differential can be computed directly. In additive F_2 notation, set
c((v,q),(w,q′))=β(q)(q w).
Expanding the inhomogeneous differential and using the β cocycle identity cancels every term involving v,w or the third kernel coordinate, leaving
dc=infl(β cup f).
The restriction of c to B×B is zero and its mixed term is β; this is the transgression representative. Pull back the same formula along Γ_k→Q and send ε to (−1)^ε in kbar×. Signs do not change this order-two class.

Since the action on B changes only d,e coordinates,
(β cup f)(q,q′,q″)=(q_s+q_t mod2)(q′_t mod2)q″_r.
Let h(q)=floor(q_t/2) mod2. Then dh(q,q′)=(q_t mod2)(q′_t mod2), so subtracting d(h cup ζ) leaves χ_x cup χ_y cup χ_z. Thus δ(inf β) is the image of the triple Kummer symbol.

To prove that this image is nonzero, both of the following steps are necessary.

1. The finite-coefficient residues of [Gille–Szamuely §6.8](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf), with the cup compatibility of Lemma6.8.4, give ∂_x∂_y∂_z((x)cup(y)cup(z))=1 in F_2. Hence the class in H³(k,μ_2), identifying the twists using −1, is nonzero.
2. The Witt sequence of §6.3 gives Br(F((t)))≅Br(F)⊕H¹(F,Q/Z) for perfect F. In the characteristic-zero Laurent tower, principal units are n-divisible by Hensel, and each valuation adds one Kummer coordinate. Compatible roots of unity identify H¹(C((t_1))…((t_j)),Q/Z) with (Q/Z)^j. Starting with Br(C)=0 gives Br(k)≅(Q/Z)^3. It is therefore 2-divisible. The Kummer long exact sequence now makes H³(k,μ_2)→H³(k,G_m) injective.

This proves δ(inf β)≠0 while every conjugacy test passes. In particular β is **not** a Brauer class on V; it is the H¹ candidate excluded by the edge obstruction. The example proves exactly why that extra condition in Proposition3.3 cannot be erased.

The newly inspected source hashes (acquired21 September2026) are Pál–Schlank PDF `68c6fde00be95abbcfda9da21b18df8d216dd7c1cfaacf7088b3cfed4ef02d83` and Gille–Szamuely PDF `3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63`. Only the selected proof sections, not either entire prerequisite, were read.

## Corrected unrestricted splitting lemma

Former G2/item139 remains an explicit counterexample to the **printed discrete-Hom generality**. Let Γ=∏C2, A=⊕F_2 a_i, C=⊕F_2 c_i with trivial action, and B=A⊕C with g c_i=c_i+g_i a_i. Every vector has an open stabilizer; B is a continuous discrete module and the underlying abelian-group sequence splits. Yet γ(g)(c_i)=g_i a_i has trivial, nonopen kernel as a map to discrete Hom(C,A). No such continuous discrete-Hom class exists.

The general correction (items140–143) is to give Hom_Z(C,A) the topology induced from A^C, with pointwise convergence, and retain conjugation. Call this Hom_pt. For discrete C, evaluation Hom_pt×C→A is jointly continuous: around any c the second coordinate can be held fixed. The action (g,u)↦g u(g^-1−) is jointly continuous for the same reason, together with continuity of the actions on A,C. The additive-map conditions cut out a closed subspace; no compactness of Hom_pt is asserted for infinite A.

For an abelian-group-split short exact sequence of continuous discrete modules, the sections form a continuous affine Hom_pt(C,A)-torsor. Choose an additive section s. Since C is discrete, s is continuous, and the coordinatewise formula γ(g)=gsg^-1−s is a continuous 1-cocycle. Changing s by u changes γ by d⁰u. Its class is zero exactly when an equivariant section exists.

For every continuous m-cocycle c with values in C, s∘c is a continuous lift. Such lifts give degreewise surjectivity of the short exact sequence of continuous cochains. Direct differentiation gives
d(s∘c)(g_0,…,g_m)=γ(g_0)(g_0 c(g_1,…,g_m)).
All other terms cancel by additivity of s and dc=0. Therefore ∂[c]=[γ cup c] with the jointly continuous evaluation pairing. This uses continuous-cochain cohomology for Hom_pt; it does **not** identify that group with Ext in the category of discrete Γ-modules.

If C is finitely generated as an abelian group, imposing zero on finitely many generators isolates the zero homomorphism, so Hom_pt is discrete. In particular finite C recovers all actual paper applications and the existing corrected items82–83, including the flipped (−1)^m sign there. For the infinite shear example, γ is continuous into Hom_pt precisely because each coordinate is continuous; the discrete-topology failure is retained, not hidden.

The pinned library already supplies the algebraic conjugation `TauCeti.homAction`, coordinatewise `continuous_homAction_coe`, and a topological-coefficient explicit H¹. `TauCeti.InternalHom` deliberately imposes the discrete topology and proves continuous action under a finite-source hypothesis; it must not acquire an incompatible second global instance. Use a topology wrapper and prove the finite-source comparison. Mathlib's `PointwiseConvergenceCLM` has normed-field assumptions and is not the arbitrary-abelian-group carrier.

## Additional precision repairs and ownership

A final source check found a further normalization error. Definition3.2 takes the **least divisor** e of the group exponent d through which the unit-group power action factors. For C2 this least divisor is1, not2, since both (Z/2)× and (Z/1)× are trivial. Thus the printed Lemma4.7's equality e=p must be read as the proved **factorization through (Z/p)×**. Under the literal definition, for 2≤n≤6 one has e=p for odd p and e=1 for p=2. The source's inversion-conjugacy argument proves this factorization, which is all its Brauer computations use. Items42 and65 now record the correction; no all-rank extension is asserted. Tests include outer exponents1,4,3 for C2,C4,C6 respectively.

The generic transvection constructor and its parameter/inverse/commutator identities already exist in pinned Tau Ceti. They are now a separate library item156, with actual signatures inspected; item14 adds only UT membership and ordered factorization. Item131 now spells out all invariant-tuple equations instead of referring to a printed display. Remark3.1's sufficient conditions are split into the rational-point item41, degree-one-zero-cycle item153, number-field H³ vanishing item154 and curve-function-field item155.

The refreshed ownership documents require one additional **source route**, not another Part II: ArithmeticGaloisDuality R02.1 owns the general non-discrete coefficient comparison, so it receives items139–143. The Massey Part II imports this repair. R02.2 receives the group transgression and generic Laurent-field residue/Witt inputs (items148–150), while SF.2 receives the natural étale comparison (item152) and the separately sourced curve-function-field H³ input. The explicit B,Q,β,γ finite algebra goes to the Massey Part II; E,V and the resulting Brauer counterexample go to the homogeneous-space Part II. These are ordered interfaces, not reciprocal stage dependencies.

This does not assign C((x))((y))((z)) the atlas's HL.0 “n-local field” predicate: that definition requires a **finite** final residue field. The example uses ordinary successive complete-discrete-valuation residues over C and does not require the higher-local-field reciprocity or wild duality theory. Existing upstream cochains, Kummer theory, matrix and factor-set carriers remain imported.

## Validation and implementation boundary

The original checkpoint reported exact checks of 8,400 conjugation-entry equalities, 200 p=3 and450 p=2 outer-exponent cases, 328 real-place lifting cases, the twisted representative counterexample, and the length-four and length-six computations. Those historical executions are retained as provenance; this continuation does not claim to have rerun the original worker's unavailable scripts.

Fresh exact Python checks cover all256 pairs in Q for action/cocycle/cup identities; all4,096 triples for the factor-set equation and reduction of β cup f to χ_x cup χ_y cup χ_z; all224 fixed-vector cases; 24,576 mixed-cochain differential checks; absence of any global coboundary for β; and the literal abelian outer-exponent calculation for cyclic groups of orders1 through64. The definitions above make the checks reproducible by five-bit F_2 arithmetic and Q coordinates (i mod2,j mod4,l mod2). The associativity assertion follows from the exhaustively checked factor-set equation, not a claim to have enumerated 512³ group triples.

The paper checker, exact missing-route coverage, identifier/owner checks, all definition/construction API-and-test contracts and three-file submission scope were checked before submission. A complete paper extraction still leaves its routed blueprint and prerequisite-proof work to the design jobs and independent review. No Lean file is requested by this paper issue; none was compiled, and nothing is claimed formalized.

## Corrections by the independent review

The independent review (REV-PAPER-HARPAZ-WITTENBERG-23, `research/blueprint/reviews/REV-PAPER-HARPAZ-WITTENBERG-23.md`) accepted this extraction and all its routes, and corrected the JSON in place:

- **Statuses.**
  - Item 9 (the strictly associative cochain algebra) is now missing and in the ProfiniteCohomology Part II.
  - Item 17 is planned by ProfiniteProPGroups Layer 5.
  - Items 24 and 58 are re-owned by ModularCurves 0D and ProfiniteCohomology Layers 6, 10 and 9.
  - Items 23 and 81 gain IG.4 and HL.2.
  - Item 40 is split, with the new item 157 for constant geometric units.
- **New items.** 157, and 158 (Lucchini Arteche's Théorème 4.15, used in the proof of Proposition 3.3).
- **Precision.** Item 46 states the paper's existence claim, with the explicit witness kept in the note as a completion. Items 20, 27, 43, 45, 47, 102 and 118 are tightened. Twenty-three locators are corrected.
- **Routes.**
  - The SF.1 route is removed, and the routes are renumbered.
  - The final arithmetic theorems (96, 118, 119) move to the homogeneous-Massey Part II, so the two Part IIs no longer import each other.
  - Imports are added to both briefs.
  - That Part II's roadmap id is shared with PAPER-HARPAZ-WITTENBERG-20 route 13, and its brief now says so.

Where the text above counts items or routes, the corrected JSON is authoritative. It has 158 items (10 library, 15 planned, 133 missing) in nine routes.
