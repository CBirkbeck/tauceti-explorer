# van Hoften (2024): mod p points on Shimura varieties of parahoric level, extraction and routing

Issue [#1360](https://github.com/CBirkbeck/tauceti-explorer/issues/1360). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** P. van Hoften, with an appendix by R. Zhou, *Mod p points on Shimura varieties of parahoric level*, Forum Math. Pi 12 (2024), e20.
  - The checkpoint's published copy (SHA-256 1f86fdc5…) remains the reference.
  - The Cambridge endpoint returned HTML to this environment, so this continuation re-read arXiv v4.
- **Items.** The result has **193 items: 16 library, 12 planned and 165 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
  - Checked against arXiv v4's statement list. Its Lemma 2.2.2 and Proposition 2.2.17 are the published Lemma 2.2.3 and the bounded level-change statement.
- **Mistakes.** Thirty-four are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Reclassified to affect nothing.** Ten slips whose intended form is fixed by the surrounding text:
- E4, the dimension formula Dim X = Dim Y + d;
- E6 and E9;
- E18, the dominance orientation;
- E21, E23, E24, E26, E28 and E30, sign and σ-conjugacy slips in Appendix A.

E4 and E28 were labelled errors and are now misprints.

**Unchanged.**
- **Affect the proof:** the §2.1 perfect-space gaps (E2, E3, E5, E7), E10, E11, E13, E14 and E16, the appendix steps E22, E25, E29 and E34, and the Hoff23 import E33.
- **Affects a stated result:** E17, a missing compatibility hypothesis that the application supplies through HZZ 5.2.6(3).

**Gaps.**
- Q-perfect, Q-hoff and Q-rootcurves are recorded as findings.
- The other seventeen are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), Published2024 §2.1 p6, definition of deperfection. *Printed:* with Y an algebraic space of finite presentation *Correction:* The finite-presentation condition is on Y0, the deperfection, not on Y.
- **E2** (error; affects the proof), Published2024 Lemma2.1.6 proof p8; also arXivv4 PDF9. *Printed:* B is isomorphic to the integral closure of A0 inside of A *Correction:* Only embed B, the normalization in Frac(A0), into normal A=A0^perf; use A0⊂B⊂A to conclude B^perf=A.
- **E3** (gap; affects the proof), Published2024 Lemma2.1.7 proof p8; arXivv4 PDF10. *Printed:* injective on k-points, and hence universally injective *Correction:* Use the same argument after every algebraically closed field extension, or establish radiciality via the perfection comparison.
- **E4** (misprint; affects nothing), Published2024 Lemma2.1.10 p9; arXivv4 PDF11. *Printed:* Dim X + d = Dim Y *Correction:* Dim X = Dim Y + d.
- **E5** (misprint; affects the proof), Published2024 Lemma2.1.10 proof p9; arXivv4 PDF11. *Printed:* going down holds for O_X,x → O_Y,y *Correction:* The ring map is O_Y,y→O_X,x. For the dimension proof use compatible smooth charts rather than unproved flatness of an arbitrary deperfection.
- **E6** (misprint; affects nothing), Published2024 Lemma2.1.12 and proof2.1.13 p9; arXivv4 PDF11. *Printed:* for some positive integer d_y *Correction:* Use nonnegative integers for algebraic-space relative dimensions.
- **E7** (gap; affects the proof), Published2024 Lemma2.1.13 proof p9; arXivv4 PDF11. *Printed:* U_y ∩ U_yprime is non-empty because Y is connected *Correction:* Use the locally constant dimension function; distinct nonempty value fibers would disconnect Y.
- **E8** (misprint; affects nothing), Published2024 §2.2.5 p12; arXivv4 PDF15. *Printed:* the standard Iwahori subgroup ... contains a very special parahoric subgroup *Correction:* The standard Iwahori is contained in a very special parahoric.
- **E9** (misprint; affects nothing), Published2024 Lemma2.3.9 proof p21, first display. *Printed:* [M_I^(1-rdt) / Ad_sigma H_m] = Sht_I,mu^(mprime,1) *Correction:* Remove the final equality; pass from the H_m quotient to the L^mprime G_I quotient by the additional kernel gerbe.
- **E10** (error; affects the proof), Published2024 §2.4 after Lemma2.4.5 p24, sigma-conjugacy diagram. *Printed:* bprime = g^(-1)b sigma(g); beta0 maps to g beta0 *Correction:* Transport beta0 to g^(-1)beta0 (and sigma*beta0 accordingly); then the new constant shtuka is bprime.
- **E11** (error; affects the proof), Published2024 Remark3.1.8 p28, citing XZ17 Proposition7.2.4 and SYZ21 Theorem4.4.3. *Printed:* the square in [XZ17, top of page 113] does not commute *Correction:* Use Hoff23 Corollary2.57 with Assumption2.28 and normalization comparison, or a separately verified corrected SYZ argument.
- **E12** (misprint; affects nothing), Published2024 §3.1.9 p29, isogeny definition. *Printed:* D_x[1/p] → D_xprime[1/p] *Correction:* For A_x→A_xprime use the contravariant arrow D_xprime[1/p]→D_x[1/p], pulling s_alpha,0,xprime to s_alpha,0,x.
- **E13** (gap; affects the proof), Published2024 Proposition3.1.12 proof p31, GL diagram. *Printed:* GL(direct_sum_i=1^r Lambda_i,p) → GL(direct_sum_i=1^s Lambda_i,p) *Correction:* Restrict the right column to automorphisms compatible with the lattice chain and retained subchain, then define restriction.
- **E14** (error; affects the proof), Published2024 Lemma4.1.6 proof footnote22 p39. *Printed:* its perfection is finite *Correction:* Its perfection is integral and affine and perfectly finite; ordinary finite is not automatic. The quasi-affineness consumer can use the affine pullback of the ample line.
- **E15** (misprint; affects nothing), Published2024 Lemma4.1.6 proof p39, paragraph after Claim4.1.7. *Printed:* It suffices to show that fprime has finite fibres *Correction:* The remaining goal is finite fibers for f; fprime is already finite.
- **E16** (error; affects the proof), Published2024 Corollary4.2.3 proof p42; arXivv4 PDF50. *Printed:* lambdaHat is weakly perfectly smooth of relative dimension 0 *Correction:* Its relative dimension is dim G_I. Use this value in Lemma2.1.20.
- **E17** (error; affects a stated result), Published2024 §4.3.12–Proposition4.3.13 p47. *Printed:* Fix an identification G tensor A_f^p ≃ H tensor A_f^p and an inner twisting *Correction:* Require compatibility of the local identifications with the global inner twisting on the abelianized center complex (up to inner automorphism suffices).
- **E18** (misprint; affects nothing), Published2024 AppendixA1 p54; arXivv4 PDF64. *Printed:* lambda − lambdaPrime can be written as a sum of positive coroots *Correction:* Use lambdaPrime−lambda for lambda≤lambdaPrime, allowing the zero sum.
- **E19** (misprint; affects nothing), Published2024 AppendixA2.1 p56. *Printed:* nu_w := t^lambda / n *Correction:* Use nu_w=lambda/n in X_*(T)_(I,Q).
- **E20** (misprint; affects nothing), Published2024 Proof PropositionA1.6 p57. *Printed:* u w sigma(u) = wsharp *Correction:* Use u w sigma(u)^(-1)=wsharp.
- **E21** (misprint; affects nothing), Published2024 Proof PropositionA1.6 p57. *Printed:* simple roots contained in M but not in G *Correction:* Use the classes of simple coroots of G outside M to generate ker(pi1(M)→pi1(G)).
- **E22** (misprint; affects the proof), Published2024 Proof PropositionA1.6 p57, Kottwitz class comparison. *Printed:* the image of [b]_M ... in pi1(M)_I *Correction:* The Kottwitz invariant of a sigma-conjugacy class belongs to pi1(M)_Gamma. Perform the torsion-kernel argument after the necessary sigma coinvariants, retaining the exactness check.
- **E23** (misprint; affects nothing), Published2024 Proof PropositionA1.6 p58, choice of g0. *Printed:* g0^(-1) wsharp g0 = w *Correction:* Use g0^(-1) wsharp sigma(g0)=w.
- **E24** (misprint; affects nothing), Published2024 Proof PropositionA1.6 p58, definition of w_i. *Printed:* w_i := u_i^(-1) wsharp sigma(u_i) *Correction:* Use w_i=u_i^(-1) w sigma(u_i) after choosing g0 with g0^(-1)wsharp sigma(g0)=w and g_i=g0 u_i.
- **E25** (error; affects the proof), Published2024 Proof PropositionA1.6 p58. *Printed:* U_(-alpha_(i+1)) is contained in I s_(i+1) I *Correction:* Use U_(-alpha)⊂I union I s_alpha I, or restrict the nonzero parameter when using the second cell.
- **E26** (misprint; affects nothing), Published2024 AppendixA3.3 p59. *Printed:* x − xprime = alphaVee − sigma^r(alphaVee) *Correction:* Use xprime−x=alphaVee−sigma^r(alphaVee), consistently with the displayed intermediate parameters and the endpoint in LemmaA3.11.
- **E27** (misprint; affects nothing), Published2024 AppendixA3.5 p60. *Printed:* If alphaBar is divisible *Correction:* For the chosen short relative root, distinguish multipliable (2alphaBar a root) from nonmultipliable.
- **E28** (misprint; affects nothing), Published2024 AppendixA3.7(3) p61; arXivv4 PDF71. *Printed:* u_1([a], [a]^2/2) *Correction:* Use u_1([a], −[a]^2/2) for the stated Hermitian form and tau fixing [a].
- **E29** (gap; affects the proof), Published2024 AppendixA3.6–A3.9 pp61–62, applied to the full generality of A1.3. *Printed:* Let pi ... be a uniformiser, such that tau(pi) = −pi *Correction:* For the p>2 tame application state these restrictions. To prove the announced all-quasi-split local theorem, supply the dyadic/wild rank-one models or an independent argument.
- **E30** (misprint; affects nothing), Published2024 Proof LemmaA3.11 p62, endpoint limit. *Printed:* product_i t^(sigma^i(alphaVee)) *Correction:* The first endpoint expression must use t^(−sigma^i(alphaVee)), consistently with the next equality g_x t^(−sum_i sigma^i(alphaVee)).
- **E31** (misprint; affects nothing), Published2024 Proof LemmaA3.11 p63, triality paragraph. *Printed:* beta with sigma^h(beta) *Correction:* Complete the condition as sigma^h(beta)=beta for the central root.
- **E32** (misprint; affects nothing), Published2024 Proof LemmaA3.11 p63, display after LemmaA3.9(2). *Printed:* u_(sigma^(r−h)(alpha))(−c2z) (t^lambda u_(sigma^r(alpha)+sigma^r(beta))(c1 z)t^(−lambda)) u_(sigma^(r−h)(alpha))(c2z) *Correction:* Append membership in L+G to this displayed expression.
- **E33** (gap; affects the proof), Published2024 §3.1.7 p28, import of Hoff23 Corollary2.57. *Printed:* is perfectly smooth by [Hof23, Corollary 2.57] *Correction:* Retain Hoff Assumption2.28 and identify the normalization of the restricted shtuka target, or cite a proof discharging both under the present hypotheses.
- **E34** (error; affects the proof), Published2024 Proof PropositionA1.6 p58, reduced word and endpoints. *Printed:* g(infinity) = g_i s_(i+1) I = g_(i+1) I *Correction:* Write v=u^(-1)=s1...sn and v_i=s1...si, and set g_i=g0 v_i. Then g_(i+1)=g_i s_(i+1), and the final sigma-conjugate is u w sigma(u)^(-1)=wsharp.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **Q-perfect** (recorded). E2, E3, E5 and E7 record the paper's own §2.1 proof gaps. BGA18, Zhu17 and BS17 are cited suppliers.
- **Q-restricted** (deferred). The restricted-shtuka inputs are cited from [55] and the checkpoint's items. E9 now affects nothing.
- **Q-newton** (deferred). Fargues–Scholze and Rapoport–Richartz are cited suppliers; E10 records the σ-conjugacy diagram.
- **Q-display** (deferred). Lau, Gabber and Zhou are cited suppliers; E11 (a failure in XZ17 that the paper itself reports, with the Shen–Yu–Zhang erratum) and E13 are recorded.
- **Q-hoff** (recorded). E33 records the import of Hoff23 Corollary 2.57 without its Assumption 2.28. The assumption itself is a cited supplier's.
- **Q-model** (deferred). Kisin–Pappas, Pappas, Pappas–Rapoport and DvHKZ are cited suppliers.
- **Q-isogeny** (deferred). Rapoport–Zink and Zhou are cited suppliers; E14 is recorded.
- **Q-local** (deferred). Kottwitz, Lang and the z-extension inputs are cited suppliers.
- **Q-adlv** (deferred). He, He–Zhou, Hamacher–Viehmann and Zhou–Zhu are cited suppliers.
- **Q-rootcurves** (recorded). E22, E25, E29 and E34 record the appendix's proof gaps; the sign slips are now misprints that affect nothing.
- **Q-nie** (deferred). Nie and CKV (with its corrigendum) are cited suppliers.
- **Q-line** (deferred). The Hodge-line and SYZ inputs are cited suppliers.
- **Q-components** (deferred). Madapusi Pera and He–Rapoport are cited suppliers; E16 is recorded.
- **Q-basic** (deferred). He–Zhou–Zhu is a cited supplier.
- **Q-cohom** (deferred). Borovoi and the Hasse principle are cited suppliers; E17 is recorded.
- **Q-approximation** (deferred). Strong approximation is a cited supplier.
- **Q-incidence** (deferred). Wedhorn–Ziegler and Andreatta are cited suppliers.
- **Q-monodromy** (deferred). van Hoften's ordinary Hecke orbit theorem is a cited supplier.
- **Q-main** (deferred). Splitting the final argument into declarations is design work.
- **Q-granularity** (deferred). Declaration-sized splitting is design work; every numbered statement is an item.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-VANHOFTEN-24 — parahoric mod-p points

Codex, session `codex-c83e7a`, issue #1360. This is a full-main-paper extraction checkpoint, with status **partial**. All 67 pages of the published paper were read, including Rong Zhou’s appendix and the bibliography. The main constructions and numbered targets have routes; recursive source closure and several declaration-sized decompositions remain unfinished. No result is claimed formalized.

The paper is Pol van Hoften, *Mod p points on Shimura varieties of parahoric level*, with an appendix by Rong Zhou, **Forum of Mathematics, Pi 12 (2024), e20, 1–67**, DOI [10.1017/fmp.2024.22](https://doi.org/10.1017/fmp.2024.22). The [published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf) was acquired on 22 September 2026, SHA-256 `1f86fdc536d3f6eca1febe9d52c33f61878ff333b60ee0d72597165b288d2921`. Printed and PDF page numbers agree. The 78-page [arXiv v4](https://arxiv.org/abs/2010.10496v4), dated 3 September 2024, was used for targeted comparisons. It was not read as a second complete version. The article supplies a CC BY license; this report attributes its statements and keeps quotations confined to the source-issue record.

### What the paper proves

The introductory hypotheses are essential. The datum is Hodge type, the prime is greater than two, the local group is quasi-split and splits over a tame extension, the prime does not divide the order of the derived algebraic fundamental group, and the inertia coinvariants `pi1(G)_I` are torsion-free. The paper’s expression “connected parahoric” means that the full facet fixer equals the connected parahoric. Merely recalling that a parahoric group scheme has connected special fiber does not supply this stronger equality.

The first conclusion is that **every isogeny class at arbitrary parahoric level contains a CM reduction**. It does not require properness or an unramified group. The isogeny-class orbit formula holds first at very special level. At arbitrary parahoric level the global argument supplies it when the Shimura variety is proper or the local group is unramified. The He–Rapoport axioms follow under those additional hypotheses. The last theorem identifies connected components of appropriate EKOR strata with connected components of the Shimura variety at very special level.

For the general component theorem, “Q-nonbasic” requires nonbasicness in every Q-simple adjoint factor. A product with one nonbasic factor and one basic factor does not meet that hypothesis. The introductory Q-simple formulation is a specialization of this factorwise statement. The abstract incidence hypothesis is Conjecture 4.3.1: every irreducible component of every very-special EKOR closure meets the zero-dimensional stratum. The extraction retains it as a predicate and records the precise hyperspecial theorem needed to discharge it in the unramified application.

The local Hodge cocharacter is `mu=sigma(mu_h^(-1))`. The dual and Frobenius conventions are part of the interface. Tensor-preserving isogenies act forward on the covariant away-p realization and backward on the contravariant Dieudonné realization. The orbit formula couples the local ADLV coordinate and the away-p adelic coordinate by a single rational quasi-isogeny group. It is not a product of independent orbit sets.

### How the proof fits together

The paper constructs the perfect local shtuka attached to a point of the integral Hodge model. For an Iwahori inside a very special parahoric, it forms the two-fiber product of the very-special Shimura variety with the Iwahori local-shtuka stack over the very-special local-shtuka stack. This auxiliary space is called `ShStar` here because the distinct fonts in the printed paper can disappear in extracted PDF text. The natural map from the actual Iwahori model to `ShStar` is first proved to be a closed immersion.

A restricted-shtuka correspondence supplies a weakly perfectly smooth map from `ShStar` to the local-model quotient stack. There is no automatic forgetful map between arbitrary independent truncations of the two restricted stacks. The correspondence in Proposition 2.3.4 must instead be constructed with its congruence image, Borel reduction and common gerbe band. A surjection of gerbe bands alone is not an equivalence: the proof needs the specific identification of bands and local existence.

The quotient map gives the auxiliary KR strata. Their closures are normal and have dimension equal to the affine-Weyl length. Their open strata are quasi-affine, using a Hodge line that is both ample and torsion on the stratum. The proof needs an affine map to the Siegel model for ample pullback. The published assertion that a finite deperfection automatically has finite perfection is too strong in the ordinary sense; the affine/integral conclusion is sufficient for this consumer.

Normal KR closures and their incidence with the zero-dimensional stratum turn the geometric problem into a component problem. Under properness, a minimal stratum in a closed proper incidence locus is both proper and quasi-affine, forcing dimension zero. Under Conjecture 4.3.1, a minimal straight KR stratum maps finite étale to an EKOR stratum and the same conclusion follows from the conjectural incidence. Neither argument proves arbitrary general EKOR incidence by definition.

The basic locus has a perfect-scheme uniformization. Its rational quasi-isogeny group is a global inner form with compatible local identifications and compact real quotient modulo center. Strong approximation and the simply connected local action give Hecke transitivity on zero-stratum fibers over Shimura components. A Borovoi degree-zero abelianization calculation identifies the positive rational adelic images of the two inner forms. This is why compatibility of the local identifications with the global inner twisting matters. Arbitrary unrelated local outer automorphisms do not preserve the diagonal rational image.

The finite-level transitivity statement passes to the away-p tower using inverse limits of finite sets and compactness. Every auxiliary KR component then meets the actual Iwahori model. A closed immersion whose image is a union of components of the normal top-dimensional KR closures must therefore be an isomorphism. This proves the required Cartesian square. The very-special isogeny formula transfers through that square and then through the permitted parahoric level maps.

The EKOR component argument additionally uses the ordinary Hecke-orbit monodromy theorem. First a sigma-straight Q-nonbasic stratum is treated: the relevant Hecke action on component fibers is both trivial and transitive. A general stratum is reduced to a suitable straight one in its closure. The finite set of places must include the compact adjoint factors used in the monodromy theorem. The original monodromy hypotheses, its CM-lift input and normality requirement remain explicit verification obligations.

### What the appendix adds

Zhou proves a local component theorem for quasi-split groups at very special level. For the Newton Levi `M`, the map from **every individual** admissible Levi parameter to the global ADLV component set is surjective. This is stronger than surjectivity from the union of all parameters. It validates the use of a single chosen parameter in Proposition 3.4.5; the initially suspected union-versus-single-parameter issue is not an error.

The proof first passes to the full Iwahori inverse image, indexed by `W_K Adm(mu) W_K`. This saturated union must be distinguished from the smaller Iwahori admissible union. Straight-element degeneration produces a point in a Newton-Levi position. Explicit rank-one projective curves move it through the saturated union. The root-relation argument then shows that all admissible Levi parameters have the same image on components.

The combinatorial comparison with an unramified adjoint group transports the echelonnage root datum, Frobenius, Levi subset, cocharacter lattice and Kottwitz data. It does not transport the geometric root groups. Those require their actual SL2 or SU3 coordinates and valuation lattices. The source’s unitary formula and several word, relation and endpoint signs need correction before this calculation can be used as a formal proof.

The full local theorem is announced for general quasi-split groups, whereas the displayed rank-one argument uses division by two and an anti-invariant uniformizer in a ramified quadratic extension. A dyadic/wild replacement remains a proof obligation for that generality. The global application is already at odd primes with tame splitting. The extraction therefore does not silently apply the displayed rank-one calculation beyond that application, nor does it declare the general local theorem false.

In Appendix A4 the good isogeny-map locus is a union of components. An adapted Newton-Levi lift and rational Tate-lattice modifications make it meet every component. The individual-parameter surjectivity then proves that the good locus is the whole ADLV. This gives the tensor-preserving isogeny map and the CM-reduction statement. The exact Zhou deformation assumptions and realization comparisons are indispensable imports, not consequences of the word “adapted.”

### Ownership and the pinned baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The JSON retains statement-read module references and hashes. The library already supplies Witt vectors and their fraction-field Frobenius, reductive and torus predicates, character/cocharacter lattices and pairings, dominant-chamber ingredients, abelian varieties, divided powers and the ordinary comma-category carrier. These are imported in their exact generality. An ordinary comma category does not by itself provide a stack two-fiber product, and a Witt isocrystal carrier does not classify reductive isocrystals or ADLVs.

Searches across both pinned Lean trees found no perfect-smooth or restricted-shtuka declarations, and no Kottwitz, EKOR or Deligne–Lusztig declarations under the searched names. The reviewed audit supports the same specialized gaps. Name searches alone are not treated as proof of absence: the item statuses also use the reviewed layer scopes and the relevant roadmap documents. Planned items cite actual stage ids. Prior paper routes are listed separately as `relatedExtractionItems`, never promoted to completed stages.

The foundational perfect-space material belongs to Scheme and Stack Foundations. The Witt flag and Schubert specialization belongs to the existing GS0 Witt-geometry layer. Reductive Groups Part II owns full fixers, very special parahorics, valued root data and local component quotients. BunG and Newton Strata owns the reductive isocrystals and invariants. ET.0 owns the Borovoi abelianization and inner-form comparison. Abelian Schemes and Arithmetic Moduli owns abelian quotient realization.

The four continuations reuse existing candidate identifiers: the integral local-shtuka continuation, tensor-display continuation, ADLV continuation and integral Shimura/Honda–Tate continuation. This paper supplies new source obligations to those directions. It does not create a fifth independent “van Hoften” roadmap. The main Shimura direction imports each reusable local and cohomological theorem from its owner.

### Source corrections and proof gates

The machine-readable `sourceIssues` list is authoritative for all findings recorded here. Each entry gives a locator, the printed assertion, a correction or missing input, a reason, its reach and the correction search. Mathematical formulas are transcribed without PDF font artifacts. Findings marked new mean that no correction was found in the listed search; they still require independent review. The worker has not added a review verdict and has not contacted the authors.

Several counterexamples are particularly small. The perfected affine line over a point reverses the dimension equality in Lemma 2.1.10. The connected affine cross has two disjoint nonempty opens, so connectedness cannot justify the intersection claim in Lemma 2.1.13. With the stated anti-diagonal Hermitian form, the nonstandard unitary root coordinate at `a=1` must have second coordinate `−1/2`: the printed `+1/2` leaves residual `2` in the unitary equation. Equal dimensions of `ShStar` and the local model force the relative dimension of the map to the quotient stack to be the group dimension, not zero.

For the finite-perfection issue, take `A0=k[t]`, `B0=k[x]`, `t=x²` at an odd prime. The map before perfection is finite. After perfection, the involution `x↦−x` splits off an odd eigenspace because two is invertible. With valuation normalized by `v(t)=1`, that eigenspace contains `x^(1/p^n)` of positive valuation `1/(2p^n)`. Every finite set of odd generators has a positive minimum valuation, and multiplication by elements of `A0^perf` cannot lower it. The sequence tending to zero rules out finite generation. The perfected map is nevertheless integral and affine. This identifies the proof’s overstatement without separately claiming that its particular Shimura morphism is nonfinite.

The smoothness issue in XZ/SYZ is already documented by the paper and by the SYZ erratum. The old erratum URL now returned a not-found document; a relocated author-hosted two-page correction was obtained and its text read. The report records that transport’s certificate-chain qualification in the source archive. Hoff’s alternate proof was read at its original Assumption 2.28, normalization remark, theorem and corollary. Its module-to-group compatibility and normalization comparison are explicit gates. A later local-model tangent result may discharge the compatibility, but only after checking that its group, type and prime hypotheses cover the present use.

The bibliography is not recursively closed. In particular, the original Nie, HZ and Zhou component/deformation arguments; full basic uniformization; WZ/Andreatta incidence; and ordinary Hecke-orbit monodromy need further source work. The exact remaining inputs and their consuming item ids appear under `gaps`. Some named compound results need splitting, and any API fact used in a proof must be promoted to a lemma node before the design is closed. These limitations are why the job remains partial despite the complete main-paper reading and total routing of its current item inventory.

### Route briefs and module destinations

#### 1. SchemeAndStackFoundations

Owner `SchemeAndStackFoundations`; route `source`; 28 items.

The foundational roadmap owns general perfection, smoothness, descent, quotient stacks and ample-line criteria. GS0 consumes its perfect-space interface and specializes it to Witt flags; do not build a private foundation inside Shimura reduction.

Stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

Imports: FoundationsAndLibraryIntegration, GeometricSatakeAndFusion:GS0:Witt-geometry, existing perfect-space use, Pinned scheme, quotient-category and field-perfection carriers.

Suggested design destination: `TauCeti/AlgebraicGeometry/Perfect/WeakSmooth.lean`. No Lean file was created.

#### 2. ReductiveGroupsPartII

Owner `ReductiveGroupsPartII`; route `source`; 11 items.

Existing relative-root, parahoric and double-coset layers own very special vertices, full fixers, echelonnage data, Levi lattices and rank-one group coordinates. Import absolute root groups and tori from upstream.

Stages: `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

Imports: tauceti:TauCetiRoadmap/ReductiveGroups, BunGAndNewtonStrata:BG1, Pinned root pairing and cocharacter lattices.

Suggested design destination: `TauCeti/Algebra/AlgebraicGroup/Parahoric/VerySpecial.lean`. No Lean file was created.

#### 3. GeometricSatakeAndFusion

Owner `GeometricSatakeAndFusion`; route `source`; 7 items.

The existing Witt-geometry layer explicitly owns perfect lattice/flag spaces, relative position, projectivity and Schubert geometry. Add the exact torsor adapters used here; generic integral local-model deformation stays in the existing local-model continuation.

Stages: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Imports: SchemeAndStackFoundations:SF.0/SF.1, ReductiveGroupsPartII:RG2.3/RG2.4, RelativeFarguesFontaineCurve:RF0 coefficient owner.

Suggested design destination: `TauCeti/AlgebraicGeometry/AffineFlag/ParahoricWitt.lean`. No Lean file was created.

#### 4. BunGAndNewtonStrata

Owner `BunGAndNewtonStrata`; route `source`; 3 items.

BG0 owns B(G) and J_b and BG1 owns Newton/Kottwitz invariants. Add the rational basic-centralizer component-surjectivity input as a source, using the local quotient from RG2.

Stages: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`.

Imports: ReductiveGroupsPartII:RG2.3/RG2.4, Pinned Witt fraction-field Frobenius.

Suggested design destination: `TauCeti/Algebra/Isocrystal/KottwitzComponents.lean`. No Lean file was created.

#### 5. EndoscopicTransferAndUnitaryTraceComparison

Owner `EndoscopicTransferAndUnitaryTraceComparison`; route `source`; 4 items.

The existing rational/stable conjugacy and inner-form layer already owns Borovoi abelianization. Add the exact degree-zero positive-real criterion and compatible adelic-image comparison, shared with Kisin17 and this component argument.

Stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Imports: tauceti:TauCetiRoadmap/ProfiniteCohomology, ArithmeticGaloisDuality, ReductiveGroupsPartII, SchemeAndStackFoundations:SF.1.

Suggested design destination: `TauCeti/GroupTheory/GaloisCohomology/PositiveInnerForms.lean`. No Lean file was created.

#### 6. AbelianSchemesAndArithmeticModuli

Owner `AbelianSchemesAndArithmeticModuli`; route `source`; 2 items.

The abelian-scheme roadmap owns quotient realization and compatibility of p-divisible isogenies with abelian schemes, polarizations and levels. The global Hodge normalization and tensor-branch selection remain with the Shimura continuation.

Stages: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`.

Imports: FiniteFlatGroupsAndIntegralPadicHodgeTheory, PELModuli:M1/M2, SchemeAndStackFoundations:SF.1.

Suggested design destination: `TauCeti/AlgebraicGeometry/AbelianScheme/PerfectIsogenyQuotient.lean`. No Lean file was created.

#### 7. Hecke stacks and local shtukas, Part II: integral parahoric models and crystalline diagrams

Owner `HeckeStacksAndLocalShtukasIntegralPartII`; route `part-ii`; 23 items.

Reuse the existing extraction candidate with this identifier; add these source obligations without creating another owner. Candidate ids are not stage ids.

Reuse the KPZ26 integral continuation after Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas). Import Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations SF.0/SF.1), Witt flag geometry (GeometricSatakeAndFusion GS0:Witt-geometry), local reductive groups (ReductiveGroupsPartII), and isocrystals (BunGAndNewtonStrata BG0/BG1). Construct perfect local Hecke and shtuka stacks, their height bounds, reductive and higher restricted quotients, and the actual Iwahori truncation correspondence. Prove van Hoften2.3.4 Cartesian as a two-fiber square via equal-band gerbes,2.3.9 weak smoothness with the extra kernel gerbe, and2.4.6 Newton quotient [underline J_b(Qp)\X] on the pro-etale site. Keep the locally profinite topology; do not replace it by a discrete constant group. Prove the canonical special-fiber comparison with PR/DvHKZ, then compare Hoff and SYZ normalizations using explicit Frobenius and frame-change formulas. The crystalline global local-model diagram is a consumer of the tensor-display and tangent compatibility theorem, never its proof. Tests cover nontrivial stabilizers, zero-rank torus, cofinal truncations, the omitted kernel gerbe, and noncommutative sigma-conjugacy transport.

Imports: HeckeStacksAndLocalShtukas, SchemeAndStackFoundations, GeometricSatakeAndFusion, ReductiveGroupsPartII, BunGAndNewtonStrata, FiniteFlatGroupsWithTensorsPartII, GeometricSatakeLocalModelsPartII.

Suggested design destination: `TauCeti/ArithmeticGeometry/LocalShtuka/RestrictedParahoric.lean`. No Lean file was created.

#### 8. Finite flat groups and integral p-adic Hodge theory, Part II: tensors and adapted deformations

Owner `FiniteFlatGroupsWithTensorsPartII`; route `part-ii`; 6 items.

Reuse the existing extraction candidate with this identifier; add these source obligations without creating another owner. Candidate ids are not stage ids.

Reuse the KP18/KPZ26/Kisin17 tensor-display continuation after Finite flat groups and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory). Import crystalline comparison (CrystallineCohomology), integral Hodge theory (PadicHodgeTheory), local-model tangent geometry (GeometricSatakeLocalModelsPartII), and reductive stabilizers (ReductiveGroupsPartII). Supply perfect-ring height-one Gabber–Lau classification, tensor realization comparisons with contravariant signs, and M-adapted lifts of AppendixA4. Split Hoff23 Assumption2.28 into the module comparison and G-compatibility theorem over W(R_G/a_G); use the actual type/prime-bounded tangent result to discharge it rather than assuming every local model is tangent-spanned. Reconcile the restricted-shtuka normalization of Hoff2.40 with SYZ. Prove the precise Zhou5.12/6.11 adapted-lift input and the Tate/Dieudonne compatibility that makes rational M modifications good. Export local universality to the integral-shtuka owner and good-locus propagation to the Shimura owner. Tests include ordinary endpoint slopes, the identity adapted lift, a filtration outside M, and failure to preserve tensors on first-order thickenings.

Imports: FiniteFlatGroupsAndIntegralPadicHodgeTheory, CrystallineCohomology, PadicHodgeTheory, GeometricSatakeLocalModelsPartII, ReductiveGroupsPartII.

Suggested design destination: `TauCeti/ArithmeticGeometry/PDivisibleGroup/ParahoricAdaptedLift.lean`. No Lean file was created.

#### 9. Hecke stacks and local shtukas, Part II: affine Deligne–Lusztig geometry

Owner `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`; route `part-ii`; 28 items.

Reuse the existing extraction candidate with this identifier; add these source obligations without creating another owner. Candidate ids are not stage ids.

Reuse the HE21/Kisin17 ADLV continuation after Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas). Import its generic shtuka moduli, the perfect restricted-shtuka interface from HeckeStacksAndLocalShtukasIntegralPartII, Witt flags (GeometricSatakeAndFusion), reductive local groups (ReductiveGroupsPartII), and Newton invariants (BunGAndNewtonStrata). Add Zhou’s very-special component branch to the existing dimension/cordiality and minuscule branches. Under quasi-split G/Qp, dominant mu, [b] in B(G,mu), and very special K, the announced target A1.3 is J_b transitivity on pi0 and surjectivity from every individual lambda in I_mu,b,M. Prove it via the saturated Iwahori preimage WK Adm WK, straight-element degeneration, Newton-Levi transport, parameter-relation chains and explicit projective root curves. Correct dominance, the relation sign, reduced-word direction, unitary coordinate sign and endpoint translation. Complete the original Nie/CKV/HZ proof inputs, including the weak-dominance extension and D4 triality computations. Supply a separate dyadic/wild argument for the general announced theorem; the main Shimura application only uses p>2 and tame splitting. End with the rational M(Qp)-modification component-surjectivity input. Tests must distinguish saturated from ordinary admissible unions and show all root matrices satisfy their group equations.

Imports: HeckeStacksAndLocalShtukas, HeckeStacksAndLocalShtukasIntegralPartII, GeometricSatakeAndFusion, ReductiveGroupsPartII, BunGAndNewtonStrata, FiniteFlatGroupsWithTensorsPartII.

Suggested design destination: `TauCeti/ArithmeticGeometry/AffineDeligneLusztig/VerySpecialComponents.lean`. No Lean file was created.

#### 10. Shimura varieties, Part II: integral models, special isogenies and mod-p points

Owner `ShimuraVarietiesHondaTatePartII`; route `part-ii`; 57 items.

Reuse the existing extraction candidate with this identifier; add these source obligations without creating another owner. Candidate ids are not stage ids.

Reuse the KMPS22/Kisin–Zhou25/KP18/KPZ26/Kisin17 reduction continuation after Shimura varieties (ShimuraVarieties). Import Shimura data (ShimuraData), PEL moduli (PELModuli), Abelian schemes and arithmetic moduli (AbelianSchemesAndArithmeticModuli), tensor displays (FiniteFlatGroupsWithTensorsPartII), restricted shtukas (HeckeStacksAndLocalShtukasIntegralPartII), ADLV components (HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig), local models (GeometricSatakeLocalModelsPartII), ET.0 abelianization and AdelicAlgebraicGroups approximation. Define the Hodge integral model, realization tensors, isogeny group and orbit parameters, canonical shtuka map and auxiliary two-fiber product. Prove iota is a closed immersion, the auxiliary KR closures are normal of dimension ell(w), their strata quasi-affine, and the proper/minimal-EKOR incidence result. Prove basic uniformization with inner-compatible local identifications, Hecke transitivity of component fibers, and the global Cartesian theorem. Under Hodge type, p>2, tame quasi-split G_Qp, p prime to pi1(Gder), and torsion-free pi1(G)_I, prove CM reduction in every arbitrary-parahoric isogeny class. Prove arbitrary-parahoric isogeny uniformization and He–Rapoport axioms when the variety is proper or G_Qp unramified. At connected very-special level prove the AppendixA4 uniformization and CM statements with only that chosen full-fixer connectedness. Finally prove EKOR pi0 equality under properness or Conjecture4.3.1 for strata intersecting the Q-nonbasic locus; specialize to the introductory Q-simple theorem. Keep Conjecture4.3.1 a predicate until its exact hyperspecial input is proved. Import the ordinary Hecke-orbit monodromy theorem with its CM-lift and compact-factor hypotheses. This is a point/isogeny classification with a geometric basic-uniformization ingredient, not a new proof of full admissible-gerb Langlands–Rapoport matching. Tests cover a mixed basic/nonbasic product, the minimal stratum, corrected quotient dimensions, affine ample pullback and Frobenius-compatible level change.

Imports: ShimuraVarieties, ShimuraData, PELModuli, AbelianSchemesAndArithmeticModuli, FiniteFlatGroupsWithTensorsPartII, HeckeStacksAndLocalShtukasIntegralPartII, HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig, GeometricSatakeLocalModelsPartII, EndoscopicTransferAndUnitaryTraceComparison, AdelicAlgebraicGroups.

Suggested design destination: `TauCeti/ArithmeticGeometry/ShimuraVariety/ParahoricModPPoints.lean`. No Lean file was created.

### Item inventory

The JSON carries the complete API and test lists. Each entry below records the statement and the proof or construction boundary so that the routes can be reviewed without inferring a theorem from its name.

#### L01 — Witt-vector coefficient carrier

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

For prime p and perfect field k of characteristic p use the existing p-typical Witt vectors W(k), with coefficient sequence indexed by natural numbers; its fraction field supplies L. This item is only the coefficient carrier, not a crystalline site.

Imports: `mathlib:WittVector`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Reuse WittVector.mk on a coefficient sequence. Equality follows from equality of every coefficient. The map to L preserves the existing ring operations.

Acceptance cases: Equal coefficient sequences give equal vectors. Over F_p the fraction field specializes to Q_p after the standard comparison. Witt addition in positive coordinates is not coordinatewise addition in general.

#### L02 — Frobenius on the Witt fraction field

**construction; library**. Source: §§2–4 and Appendix A, imported foundation.

For a perfect domain k of characteristic p, the Witt Frobenius induces a ring automorphism of FractionRing(WittVector p k).

Imports: `mathlib:WittVector.FractionRing.frobenius`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: The inverse is induced by inverse Witt Frobenius over a perfect domain. The fraction-ring automorphism commutes with the inclusion of W(k). Frobenius fixes the prime-field fractions.

Acceptance cases: Over F_p Frobenius fixes p. Applying Frobenius then its inverse fixes every fraction. Semilinearity uses sigma(a), not a, on a nonfixed scalar.

#### L06 — Connected reductive group predicate

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Imports: `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `tauceti:TauCeti.reductiveCommHopfAlgProperty_iff`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Reuse the geometric normal-unipotent-subgroup characterization. Transport the predicate through permitted field extensions. Transport reductivity under Hopf-algebra isomorphisms.

Acceptance cases: G_m is reductive. GL_n is reductive in characteristic zero. The additive group is not reductive.

#### L07 — Algebraic torus predicate

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Imports: `tauceti:TauCeti.torusCommHopfAlgProperty`, `tauceti:TauCeti.torusCommHopfAlgProperty_iff`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: A geometric split-torus isomorphism proves the predicate. The geometric fiber has the specified finite rank. Transport the torus predicate along an isomorphism.

Acceptance cases: G_m is rank one. A norm-one quadratic torus need not be split. G_a is not a torus.

#### L08 — Geometric character lattice

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Imports: `tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Expose the action inherited from geometric scalar extension. Identify a character with a group-scheme map to G_m. Addition of characters corresponds to multiplication of their values.

Acceptance cases: X*(G_m) is Z. Conjugation acts by minus one on a real norm-one torus. The trivial torus has zero character group.

#### L09 — Cocharacter lattice and pairing

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Use the integral-dual linear equivalence. Evaluate a character on a cocharacter as an integer exponent. The dual action evaluates against the inverse Galois action on characters.

Acceptance cases: For G_m, exponents a and b pair to ab. The zero cocharacter pairs to zero. Simultaneous sign reversal on a norm-one torus preserves the pairing.

#### L10 — Perfect character-cocharacter pairing

**theorem; library**. Source: §§2–4 and Appendix A, imported foundation.

For a torus over a field, its integral character-cocharacter pairing is perfect.

Imports: `tauceti:TauCeti.TorusCommHopfAlgCat.instCharacterCocharacterPairingIsPerfPair`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L11 — Closed dominant chamber of a root pairing

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

For an ordered coefficient ring and a root-pairing base, the closed dominant chamber consists of vectors on which all simple coroot functionals are nonnegative. For cocharacters apply the dual root-pairing convention.

Imports: `tauceti:TauCeti.dominantChamber`, `tauceti:TauCeti.mem_dominantChamber`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Membership is nonnegativity on the simple coroot functionals. The zero vector lies in the closed chamber. Strict positivity implies membership in the closed chamber.

Acceptance cases: In type A1 the chamber is one closed half-line. The wall point zero is not interior. Swapping roots with coroots uses the flipped pairing.

#### L12 — Unique dominant representative in a Weyl orbit

**theorem; library**. Source: §§2–4 and Appendix A, imported foundation.

For a finite reduced crystallographic root system over a strictly ordered ring, with the flipped pairing reduced, each Weyl orbit meets the closed dominant chamber in exactly one vector. Rationalization and the central torus direction of a reductive group are separate adapters.

Imports: `tauceti:TauCeti.existsUnique_mem_orbit_inter_dominantChamber`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L13 — Abelian variety over a field

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

Reuse the existing proper geometrically integral group scheme over a field, with its derived smooth and commutative structure. This supplies A_x, not a universal abelian scheme.

Imports: `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Expose the existing group scheme and structure map. Base change is the existing abelian variety base change. Use properness and derived smoothness without rebuilding the carrier.

Acceptance cases: An elliptic curve gives a dimension-one example. The trivial abelian variety is allowed. A nonproper torus is not an abelian variety.

#### L15 — Divided-power structure

**definition; library**. Source: §§2–4 and Appendix A, imported foundation.

Use DividedPowers on an ideal of a commutative semiring, including its zero-outside-the-ideal convention and divided-power identities. A compatible PD enlargement still requires new geometry.

Imports: `mathlib:DividedPowers`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

API: Use the existing divided-power operations on the ideal. The product of divided powers has its binomial coefficient. An enlargement includes compatibility with the base PD operations.

Acceptance cases: On the zero ideal gamma_0(0)=1. Gamma_1(x)=x on the ideal. Division by n! is not a definition over a torsion ring.

#### L16 — Finite free cocharacter lattice

**theorem; library**. Source: §§2–4 and Appendix A, imported foundation.

For a torus over a field its integral cocharacter module is finite free.

Imports: `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_free`, `tauceti:TauCeti.TorusCommHopfAlgCat.cocharacterLattice_module_finite`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### L17 — Galois invariance of the pairing

**theorem; library**. Source: §§2–4 and Appendix A, imported foundation.

For a multiplicative-type group, simultaneously applying a Galois automorphism to character and cocharacter leaves their integral pairing unchanged.

Imports: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing_galois_invariant`.

Reuse the cited pinned declaration in its stated scope. Any application adapter beyond that statement must be proved separately and is not baseline evidence.

#### P02 — Bruhat–Tits smooth stabilizers and connected parahorics

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Construct the smooth affine integral fixer and its neutral parahoric for a building point, retaining the Kottwitz distinction between the full fixer and connected fixer.

Stage imports: `ReductiveGroupsPartII:RG2.3`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P03 — Affine Weil restriction

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

For a finite locally free base extension and affine finite-type scheme, represent the restriction-of-scalars functor; export base change and the induced group structure.

Stage imports: `ReductiveGroupsPartII:RG2.0a`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P04 — Pinned root subgroup maps

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

For a split pinned Chevalley–Demazure group scheme, use root maps x_alpha, their Chevalley relations and base change, with the differential matching the pinning.

Stage imports: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P08 — Dieudonné and nilpotent deformation theory

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Contravariant Dieudonné modules classify p-divisible groups over perfect residue fields; nilpotent divided-power thickenings admit the corresponding Hodge-filtration deformation theory.

Stage imports: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P09 — Integral p-divisible group classification

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Use the Breuil–Kisin integral comparison for p-divisible groups over the relevant mixed-characteristic complete DVR, with tensors requiring the separate display continuation.

Stage imports: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P12 — Siegel and PEL good-level moduli

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Use the moduli of polarized abelian schemes with endomorphisms, Rosati and determinant conditions and sufficiently rigid prime-to-p level. Representability and smoothness here require the good-prime and no-p-level hypotheses of M2; parahoric chain moduli are the distinct supplier S38.

Stage imports: `PELModuli:M1`, `PELModuli:M2`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P13 — Canonical generic Shimura models

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Use complex adelic Shimura varieties, reflex fields and canonical models with their away-p Hecke action and connected components.

Stage imports: `ShimuraVarieties:V1`, `ShimuraVarieties:V6`, `ShimuraVarieties:V8`.

Follow the named source proof with the listed inputs; unresolved original-source closure is recorded in the named gates.

#### P14 — Serre–Tate comparison with structures

**theorem; planned**. Source: §§2–4 and Appendix A, imported foundation.

Deformations of the polarized abelian scheme with the source’s endomorphisms and level are identified with its structured p-divisible-group deformations, preserving the Hodge tangent map.

Stage imports: `AbelianSchemesAndArithmeticModuli:A4`.

Use the source proof and listed prerequisites; the owner-level gate records recursive source and declaration closure still required.

#### L20 — Ordinary comma-category carrier

**construction; library**. Source: §§2–4 and Appendix A, imported foundation.

For functors L:A→T and R:B→T, Comma L R has objects a,b and a morphism L(a)→R(b); comparison is not required invertible.

Imports: `mathlib:CategoryTheory.Comma`.

API: Construct the left and right objects and comparison morphism. Arrow squares define its morphisms. Functorial diagrams induce the corresponding comma functors.

Acceptance cases: Over the terminal category this is the product carrier. Identity arrows give objects over equal images. For an isocomma adapter restrict comparison arrows to isomorphisms.

#### L23 — Perfect coefficient-ring predicate

**construction; library**. Source: Pinned Mathlib/FieldTheory/Perfect.lean:44.

For a commutative ring R of characteristic p, PerfectRing R p asserts that x↦x^p is bijective. The pinned predicate is more general and needs only a power operation; its characteristic-p ring use is the present specialization.

Imports: `mathlib:PerfectRing`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply injectivity and surjectivity of the p-power map. Every element has a unique pth root. Ring maps between perfect characteristic-p rings commute with inverse Frobenius.

Acceptance cases: A finite field is perfect. The zero ring has a bijective power map. Fp[t] is not perfect since t has no polynomial pth root.

#### L24 — Linear Witt isocrystal carrier

**construction; library**. Source: Pinned Mathlib/RingTheory/WittVector/Isocrystal.lean:113.

For prime p and a perfect characteristic-p commutative domain k, a WittVector.Isocrystal is a module over FractionRing(WittVector p k) with an invertible Frobenius-semilinear map. The class itself does not impose finite dimension.

Imports: `mathlib:WittVector.Isocrystal`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the fraction-ring module and its semilinear automorphism. Morphisms of isocrystals intertwine the Frobenius maps. A finite-dimensional GLn shtuka over a field supplies this carrier after choosing a frame.

Acceptance cases: A one-dimensional Frobenius module gives the rank-one carrier. The zero module has its unique semilinear automorphism. A reductive G-isocrystal classification is additional structure beyond this module class.

#### F01 — Perfection of an algebraic space

**construction; missing**. Source: §2.1 pp6–7.

For a characteristic-p algebraic space Y0, Y0^perf is the inverse limit along absolute Frobenius, with its projection to Y0; a perfect space has invertible Frobenius. Work over a perfect field k.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `L23`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the inverse Frobenius system and its compatible projections. Maps from a perfect test space to Y0 uniquely factor through Y0^perf. Perfection sends a commutative square to a commutative square and preserves fiber products.

Acceptance cases: Spec(k[t]) perfects to Spec(k[t^(1/p^infinity)]). A perfect field is unchanged. A positive-dimensional perfection need not be of finite type over k.

Open gates: `Q-granularity`.

#### F02 — Perfection preserves topology

**theorem; missing**. Source: §2.1 p6.

The projection Y0^perf→Y0 is a universal homeomorphism; its base changes induce homeomorphisms on underlying spaces.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F01`.

Use affine Frobenius integrality, radiciality and surjectivity, then étale descent.

Open gates: `Q-granularity`.

#### F03 — Perfect finite presentation and deperfections

**construction; missing**. Source: §2.1 p6.

A perfect k-algebraic space Y is pfp when Y≃Y0^perf for some finitely presented k-algebraic space Y0. A deperfection is such Y0 together with the comparison.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply a finitely presented model and an isomorphism of its perfection. Change of deperfection preserves the perfect object, not the finite-type model. Descend morphisms after a sufficiently large Frobenius stage.

Acceptance cases: The perfected affine line is pfp. Spec k is its own deperfection. An infinite-dimensional affine space is not justified as pfp by perfection alone.

Open gates: `Q-granularity`.

#### F04 — Finite-presentation continuity

**theorem; missing**. Source: Lemma2.1.1 p7.

For Y pfp and an inverse system Xi of qcqs perfect k-schemes with affine transitions, colim Hom(Xi,Y)→Hom(lim Xi,Y) is bijective.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F03`.

Apply finite-presentation continuity to a deperfection and the perfection adjunction.

Open gates: `Q-granularity`.

#### F05 — Perfect properness

**construction; missing**. Source: §2.1 p7.

A morphism of pfp perfect spaces is perfectly proper when it is the perfection of a proper finite-presentation morphism. Use the source exact equivalence with its valuative/topological formulation.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F03`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct a proper deperfection. Perfect properness is tested after compatible finite-presentation models. Base change and composition preserve it.

Acceptance cases: P1^perf→Spec k is perfectly proper. A closed immersion of pfp perfect spaces is perfectly proper. Perfectly proper does not imply ordinary finite presentation.

Open gates: `Q-granularity`.

#### F06 — Perfect smoothness with relative dimension

**construction; missing**. Source: Definition2.1.2 p7.

A map f:Y→Z of perfect k-spaces is perfectly smooth of dimension d at y if étale neighborhoods admit a factorization U→(A^d)^perf×V→V with first map étale; d is nonnegative.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F03`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the two étale charts and the factorization. The relative dimension agrees with the dimension of geometric fibers near y. Base change preserves charts and composition adds dimensions.

Acceptance cases: (A2)^perf→Spec k has dimension2. An étale map has dimension0. Do not identify this with weak perfect smoothness without a proof.

Open gates: `Q-granularity`.

#### F07 — Smooth deperfections give perfect smooth maps

**theorem; missing**. Source: Example2.1.3 p7.

The perfection of a smooth finite-presentation k-map is perfectly smooth, with the same relative dimension.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F08 — Perfect group torsors are perfectly smooth

**theorem; missing**. Source: Example2.1.4 pp7–8.

A pfp perfect k-group has a smooth finite-type deperfection; its étale torsors are perfectly smooth of relative dimension dim G.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F06`.

Use Zhu AppendixA26 for the group and étale descent of the smooth charts.

Open gates: `Q-perfect`, `Q-granularity`.

#### F09 — Connected perfect smooth dimension

**theorem; missing**. Source: Lemma2.1.5 p8.

For perfectly smooth f with nonempty connected source, relative dimension is constant.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F06`.

The dimension function is locally constant, hence constant on a connected space.

Open gates: `Q-granularity`.

#### F10 — Normal deperfection

**theorem; missing**. Source: Lemma2.1.6 p8.

A normal pfp k-algebraic space admits a normal finite-presentation deperfection.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F03`.

Reduce to integral components; normalize a reduced model A0 in Frac(A0). Embed its normalization B in the normal perfection A. The sandwich A0⊂B⊂A gives B^perf=A; do not identify B with the integral closure inside A.

Open gates: `Q-perfect`, `Q-granularity`.

#### F11 — Normality ascends perfectly smoothly

**theorem; missing**. Source: Lemma2.1.7 first assertion pp8–9.

If f:X→Y is perfectly smooth between pfp spaces and Y is normal, X is normal.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F10`, `F06`.

Use smooth/étale deperfections of local charts and normality ascent.

Open gates: `Q-granularity`.

#### F12 — Normality descends perfectly smoothly

**theorem; missing**. Source: Lemma2.1.7 second assertion pp8–9.

If f:X→Y is perfectly smooth and surjective between pfp spaces and X is normal, Y is normal.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F10`, `F06`.

Descend via normal deperfections and geometric-point/radicial comparison; k-rational-point injectivity alone is insufficient.

Open gates: `Q-perfect`, `Q-granularity`.

#### F13 — Weak perfect smoothness

**construction; missing**. Source: Definition2.1.9 p9.

f:Y→Z is weakly perfectly smooth of relative dimension d at y when an open neighborhood U of y admits a surjective perfectly smooth g:X→U of dimension e and f∘g is perfectly smooth of dimension e+d. The unqualified property admits such covers locally.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply U,g,e and the composite chart with relative dimension e+d. The value d equals geometric fiber dimension; it is independent of the cover. Compose witness covers by fiber products and add relative dimensions.

Acceptance cases: Identity has d=0. A smooth projection of dimension2 satisfies the property. Source-local descent of perfect smoothness is not proved by renaming this weaker property.

Open gates: `Q-granularity`.

#### F14 — Weak smoothness base change

**theorem; missing**. Source: After Definition2.1.9 p9.

Base change of a weakly perfectly smooth map is weakly perfectly smooth with the same dimension on each nonempty pulled-back chart.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F15 — Weak smoothness composition

**theorem; missing**. Source: After Definition2.1.9 p9.

The composite of weakly perfectly smooth maps of dimensions d1,d2 is weakly perfectly smooth of dimension d1+d2.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F13`.

Pull the two witness covers to a common perfectly smooth cover.

Open gates: `Q-granularity`.

#### F16 — Corrected dimension formula

**theorem; missing**. Source: Lemma2.1.10 p9, corrected.

If f:X→Y is weakly perfectly smooth between nonempty equidimensional pfp spaces and its nonempty fibers are equidimensional of dimension d, then Dim X=Dim Y+d.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F13`.

Use dimensions of perfect-smooth charts and subtract the cover dimension; this avoids assuming an arbitrary deperfection flat.

Open gates: `Q-granularity`.

#### F17 — Local fiber dimension

**theorem; missing**. Source: Lemma2.1.11 p9.

If f is weakly perfectly smooth of dimension d at y, there is an open U containing y for which U∩f^(-1)(f(y)) is equidimensional of dimension d.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F18 — Local characterization of weak smoothness

**theorem; missing**. Source: Lemma2.1.12 p9, corrected.

Weak perfect smoothness holds iff at each point there is a weak perfect smooth witness of some nonnegative relative dimension.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F13`, `F17`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F19 — Connected weak smooth dimension

**theorem; missing**. Source: Lemma2.1.13 p9.

A weakly perfectly smooth map with nonempty connected source has constant relative dimension.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F17`, `F18`.

The dimension function is locally constant. Its nonempty fibers are clopen; connectedness forces one value. Do not infer that arbitrary opens intersect.

Open gates: `Q-granularity`.

#### F20 — Weak smooth normality ascent

**theorem; missing**. Source: Lemma2.1.14 p10.

For weakly perfectly smooth f:X→Y of pfp spaces, normality of Y implies normality of X.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F11`, `F12`, `F13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F21 — Weak smooth normality descent

**theorem; missing**. Source: Lemma2.1.14 p10.

For weakly perfectly smooth surjective f:X→Y of pfp spaces, normality of X implies normality of Y.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F11`, `F12`, `F13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F22 — Perfect algebraic stacks

**construction; missing**. Source: Definitions2.1.15–2.1.18 pp10–11.

A pfp perfect algebraic stack is a stack in groupoids on perfect k-schemes with representable pfp diagonal and a representable surjective perfectly smooth atlas by a pfp perfect algebraic space, with the source diagonal conventions.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F03`, `F06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the diagonal representation and a perfectly smooth atlas. Equivalent atlases present the same stack and descent data. Base changes of representable morphisms are computed on the presenting groupoids.

Acceptance cases: A pfp perfect space gives a representable stack. BG for a smooth pfp perfect group has a point atlas. The atlas of BG has relative dimension dim G, even though its source has dimension0.

Open gates: `Q-granularity`.

#### F23 — Weak smooth maps of perfect stacks

**construction; missing**. Source: Definitions2.1.18–2.1.19 pp10–11.

For a map of perfect stacks, test weak perfect smoothness on smooth atlases using the source convention; a map may be nonrepresentable. Track atlas dimensions when defining the stack relative dimension.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F22`, `F13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose compatible atlases and the weak smooth witness after pullback. Changing atlases does not change relative dimension. Compose and base change the map with the induced atlas comparisons.

Acceptance cases: A smooth group gerbe has the expected negative stack-fiber dimension. An identity stack map has dimension0. Representability cannot be inferred from weak smoothness.

Open gates: `Q-granularity`.

#### F24 — Quotient dimension formula

**theorem; missing**. Source: Lemma2.1.20 p11.

If Y→[X/G] is weakly perfectly smooth of relative dimension n, X is equidimensional of dimension d, and G is a pfp perfect group, then Y is equidimensional of dimension d+n−dim G, in the pfp setting of the lemma.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F23`, `F16`.

Pull back the atlas X→[X/G], compute dimensions of the G-torsor, and subtract dim G.

Open gates: `Q-granularity`.

#### R01 — Full fixer versus connected parahoric

**construction; missing**. Source: §2.2.1 pp11–12.

For a bounded facet of the building, distinguish its smooth full pointwise-fixer group scheme from its identity-component parahoric model. In this paper a connected parahoric means these two models coincide.

Prerequisites: `P02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply a facet and its two stabilizer models. Equality means absence of the component quotient of the full fixer. Nested facets induce the prescribed inclusions of integral groups.

Acceptance cases: A hyperspecial GLn model has connected full fixer. A connected special fiber by definition does not settle full-fixer equality. Do not drop the full stabilizer condition from AppendixA4.

Open gates: `Q-granularity`.

#### R02 — Torsion-free inertia ensures connected fixer

**theorem; missing**. Source: Lemma2.2.3 p12.

If pi1(G)_I is torsion-free, the full fixer of every relevant facet is its connected parahoric.

Prerequisites: `R01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### R03 — Connectedness for a smaller parahoric

**theorem; missing**. Source: Lemma2.2.4 p12.

If J⊂K and the K-parahoric is connected in the full-fixer sense, so is the J-parahoric.

Prerequisites: `R01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### R04 — Very special parahoric

**construction; missing**. Source: §2.2.5 p12.

For quasi-split G/Qp choose a sigma-stable alcove and a sigma-stable special vertex in its closure whose parahoric K has WK≃W0; the Iwahori is contained in K.

Prerequisites: `R01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose the vertex and its sigma-stable parahoric. The projection WK→W0 is an isomorphism. Levi intersection with a very special parahoric is very special for the standard Levi.

Acceptance cases: For split GL2 take GL2(Zp) containing the standard Iwahori. A torus has no nontrivial finite Weyl group. A general parahoric need not be very special.

Open gates: `Q-granularity`.

#### R05 — Iwahori–Weyl group and length-zero part

**construction; missing**. Source: §2.2.5 pp12–13.

The extended affine Weyl group fits 1→X_*(T)_I→Wtilde→W0→1 and Wtilde=Waff⋊Omega, with Omega≃pi1(G)_I and length zero. Retain sigma and the chosen alcove.

Prerequisites: `L09`, `P02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Form the normalizer quotient by the connected torus parahoric. Affine and length-zero factors uniquely describe an element. Group homomorphisms and sigma preserve the specified root-data comparisons.

Acceptance cases: Split GL2 has translations Z² and W0=S2. For a torus Waff is trivial. Inertia coinvariants are not sigma-fixed elements.

Open gates: `Q-granularity`.

#### G01 — Witt loop groups

**construction; missing**. Source: §2.2.6 pp13–14.

For a parahoric model Gcal/Zp and a perfect Fp-algebra R, LG(R)=G(W(R)[1/p]), L+Gcal(R)=Gcal(W(R)), and LmGcal(R)=Gcal(W(R)/p^m); all maps use Witt functoriality.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `L01`, `R01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the three group-valued functors and truncation maps. Integral loops are the positive-loop subgroup of generic loops. Perfect-algebra maps and model morphisms induce compatible loop maps.

Acceptance cases: For GL1 these are the units in the three coefficient rings. The identity loop reduces to identity at every m. Positive loops depend on the parahoric model, not just generic G.

Open gates: `Q-granularity`.

#### G02 — Witt affine flags

**theorem; planned**. Source: §2.2.7 pp13–14.

The étale sheaf LG/L+Gcal is represented by the ind-perfect affine flag space Gr_K and is ind-perfectly projective for the parahoric situation used here.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Stage imports: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

#### G03 — Torsor modification description

**construction; missing**. Source: §2.2.7 p14.

Gr_K(R) classifies a Gcal-torsor E over W(R) and a trivialization beta:E[1/p]≃E0[1/p], with isomorphisms respecting beta. This is sheafified; raw cosets need not describe every R-point.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `G01`, `G02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct a modification from a torsor and rational trivialization. Two modifications agree iff there is an integral isomorphism respecting the trivializations. Pull back the torsor and beta along perfect-algebra maps.

Acceptance cases: A trivialized GLn torsor gives a Witt lattice. The standard lattice is the identity coset. A nontrivial torsor need only trivialize étale locally.

Open gates: `Q-granularity`.

#### G04 — Witt torsors and loop torsors

**theorem; missing**. Source: Lemma2.2.8 p14.

Gcal-torsors on Spec W(R) are étale locally trivial after a cover of Spec R and correspond to L+Gcal-torsors on the perfect étale site.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `G01`.

Use smooth lifting, henselian Witt pairs and étale descent; original-source closure remains open.

Open gates: `Q-granularity`.

#### G05 — Admissible Schubert union

**construction; missing**. Source: §2.2.14–2.2.15 pp15–16.

Adm({mu}) consists of w≤t^(x mu) for some x∈W0. The bounded parahoric local-model special fiber is the reduced union of Schubert varieties for the image of Adm in WK / Wtilde/WK; for Iwahori use Bruhat order.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `R05`, `G02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the finite admissible index set and reduced union. Membership is an existential Bruhat inequality against Weyl translates. Projection to a coarser parahoric respects the union.

Acceptance cases: For mu=0 only the appropriate length-zero datum survives. Split GL2 mu=(1,0) has the usual two maximal translations. Left-minimal EKOR indices are not double-coset KR indices.

Open gates: `Q-granularity`.

#### G06 — Schubert normality and dimension

**theorem; planned**. Source: §2.2.14 p15.

Iwahori Schubert varieties in the Witt flag space are normal, have cell dimension ell(w), and closure the union of cells indexed by v≤w.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Stage imports: `GeometricSatakeAndFusion:GS0:Witt-geometry`.

Prerequisites: `G05`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

#### G07 — Minuscule local-model dimension

**theorem; missing**. Source: §2.2.15 p16.

For minuscule mu the admissible local-model special fiber is equidimensional of dimension <2rho,mu>.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `G05`, `G06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S01 — Local Hecke stack

**construction; missing**. Source: §2.2.9 p14.

Hk_G,K(R) is the groupoid of two Gcal-torsors over W(R) with an isomorphism after inverting p. It is the quotient [L+Gcal / Gr_K] with the specified left action.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `G03`, `G04`, `F22`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the two torsors and rational modification. Trivializing the target gives a flag point modulo its positive-loop changes of frame. Pull back modifications and compose when source and target agree.

Acceptance cases: For GL1 the relative position is the valuation of a rational unit. The identity modification gives the diagonal object. A Hecke modification has no Frobenius until shtuka data are supplied.

Open gates: `Q-granularity`.

#### S02 — Perfect local shtuka

**construction; missing**. Source: §2.2.10 pp14–15.

A Gcal-shtuka over a perfect algebra R is a Gcal-torsor E on W(R) with beta:sigma*E[1/p]≃E[1/p]. Isomorphisms intertwine beta.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S01`, `L02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the torsor and Frobenius modification. In a frame beta is b and changing frame by h gives h^(-1)b sigma(h). Base change carries both E and beta, with the Frobenius comparison.

Acceptance cases: For GLn this gives a sigma-semilinear isomorphism on the rational module. The trivial torus shtuka has beta=1. The formula h^(-1)b sigma(h) is a right action in h; it cannot be used as a left action without inversion.

Open gates: `Q-granularity`.

#### S03 — Local shtuka quotient

**theorem; missing**. Source: §2.3.1 p16.

The stack of perfect local Gcal-shtukas is [LG/Ad_sigma L+Gcal], where the frame-change relation is b~h^(-1)b sigma(h).

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S02`, `G04`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S04 — Height-one local shtuka

**construction; missing**. Source: §2.2.10 p15.

For GLn, an integral height-one local shtuka is a finite projective W(R)-module M with Frobenius satisfying pM⊂beta(sigma*M)⊂M. Use the contravariant Dieudonné convention.

Prerequisites: `S02`, `P09`, `L24`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply M,beta and the two lattice inclusions. Height and dimension are read from the cokernel of beta. Pull back along perfect R-maps while preserving the inclusions.

Acceptance cases: Etale and multiplicative p-divisible groups give the two rank-one endpoint slopes. A zero-height group gives a rank-zero module. An arbitrary rational isocrystal need not satisfy the height-one bounds.

Open gates: `Q-granularity`.

#### S05 — Gabber–Lau classification

**theorem; missing**. Source: §2.2.10 p15, Lau18.

Over perfect rings, height-one local GLn-shtukas classify p-divisible groups through the contravariant Dieudonné equivalence in the range used by the paper.

Prerequisites: `S04`, `P09`.

Import the actual perfect-ring theorem, not the field-only Dieudonné classification.

Open gates: `Q-display`, `Q-granularity`.

#### S06 — Change of parahoric on classifying stacks

**theorem; missing**. Source: Lemma2.2.11 p15.

For J⊂K, B(L+G_J)→B(L+G_K) is represented by the perfect flag variety of the reductive quotient of G_K modulo the parabolic image of G_J.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `R01`, `G01`, `F22`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S07 — Unbounded level-change fiber

**theorem; missing**. Source: Lemma2.2.12 p15.

The unbounded shtuka level-change map Sht_J→Sht_K is the pullback of B(L+G_J)→B(L+G_K) along the underlying torsor map.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S02`, `S06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S08 — Bounded level change is perfectly proper

**theorem; missing**. Source: Lemma2.2.13 p15.

For J⊂K and a fixed conjugacy class {mu}, Sht_J,mu→Sht_K,mu is representable and perfectly proper. The bounded square with the unbounded level maps need not be Cartesian.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S07`, `G05`, `F05`.

Realize the bounded source as a closed locus in the unbounded flag fibration.

Open gates: `Q-granularity`.

#### S09 — Infinite and reductively truncated local models

**construction; missing**. Source: §2.3.1 pp16–17.

Let M_K^infinity be the inverse image of M_K^loc in LG. Let M_K^(1,rdt) be its quotient by the kernel of L+G_K→G_K^rdt on the specified side. It is a G_K^rdt-torsor over M_K^loc.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `G01`, `G05`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Take the inverse image and then the congruence-kernel quotient. The reductive quotient torsor records one frame modulo the pro-unipotent kernel. Changing the truncation respects projection to the local model.

Acceptance cases: For a torus the reductive quotient is the torus itself. At the identity modification the fiber is the reductive frame group. Quotienting by the full positive loop group would discard the frame torsor.

Open gates: `Q-granularity`.

#### S10 — Finite-level factorization of the twisted action

**theorem; missing**. Source: §2.3.1 p17.

For m sufficiently large relative to mu, the twisted L+G_K-action on M_K^(1,rdt) factors through LmG_K as an action, including its identity and associativity laws.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S09`, `F04`.

Descend the action map by pfp continuity and then descend the equalities defining a group action.

Open gates: `Q-granularity`.

#### S11 — Restricted local shtuka stack

**construction; missing**. Source: §2.3.1 and Remark2.3.2 pp17–18.

For m with the action factorization, define Sht_K,mu^(m,1)=[M_K^(1,rdt)/Ad_sigma LmG_K]. Its map to [M_K^loc/G_K] retains the reductive-frame and truncated-frame torsors.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S09`, `S10`, `F22`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose an admissible truncation m and form the action groupoid quotient. Objects are the bounded frame datum modulo truncated sigma-conjugacy. Increasing m gives transition morphisms compatible with the untruncated shtuka map.

Acceptance cases: In the torus case conjugation reduces to a Lang-type equation. Trivial modification and frame give the neutral object. A nontrivial stabilizer means the quotient is a stack, not a set.

Open gates: `Q-granularity`.

#### S12 — Restricted stack dimension

**theorem; missing**. Source: Remark2.3.2 p18.

If M_K^loc has dimension d, Sht_K,mu^(m,1) has dimension d+dim(G_K^rdt)−dim(LmG_K).

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S11`, `F24`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S13 — Iwahori truncation correspondence

**construction; missing**. Source: §2.3.3 pp18–19.

For an Iwahori I⊂K very special, let gamma:L+I→B be the reduction to the Borel image in G_K^rdt and Hm the image of L+I in LmG_K. Form the quotient correspondence using ker gamma / M_I^infinity and Hm.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S09`, `R04`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Specify the Borel reduction, Hm and both quotient maps. The kernel and image data determine the correspondence without a fictitious restricted forgetful map. Cofinal truncations induce compatible correspondences.

Acceptance cases: For I=K in rank zero the correspondence is the identity. Split GL2 reduces Iwahori matrices to a Borel. A naive map between two independently truncated restricted stacks need not exist.

Open gates: `Q-granularity`.

#### S14 — Cartesian restricted correspondence

**theorem; missing**. Source: Proposition2.3.4 pp18–20.

For m sufficiently large, the Iwahori-to-K bounded shtuka square of Proposition2.3.4 with its intermediate quotient correspondence is Cartesian as a square of groupoid stacks.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S13`, `S11`, `S15`, `S17`.

First prove the outer-parahoric quotient square, then identify the common congruence gerbe band and the ker gamma torsors. Retain the band isomorphism.

Open gates: `Q-restricted`, `Q-granularity`.

#### S15 — Outer parahoric square

**theorem; missing**. Source: Lemma2.3.5 p19.

The square of reduced bounded local-model inverse images for I⊂K occurring in Lemma2.3.5 is Cartesian.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S13`, `G05`.

Compare geometric points and reduced closed subschemes of the ambient perfect flag fibration; follow the exact ambient embeddings.

Open gates: `Q-restricted`, `Q-granularity`.

#### S16 — Correspondence dimension equality

**theorem; missing**. Source: Lemma2.3.6 pp19–20.

The two quotient stacks in Lemma2.3.6 have equal dimension, computed from the local-model dimension and the reductive/truncated group dimensions.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S12`, `S13`, `F24`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S17 — Equal-band gerbe comparison

**theorem; missing**. Source: Proof Proposition2.3.4 p20.

In the proof of Proposition2.3.4, the comparison of the two gerbes is an equivalence because it identifies their bands and is locally nonempty; a general morphism of gerbes need not be an equivalence.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F22`, `S13`.

Trivialize locally, identify the common congruence kernel, then descend the equivalence.

Open gates: `Q-restricted`, `Q-granularity`.

#### S18 — Cofinality of congruence kernels

**theorem; missing**. Source: Lemma2.3.8 p21.

For each prescribed mprime there is m sufficiently large such that ker(L+I→Hm) lies in ker(L+I→Lmprime I), yielding the required truncation comparison.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### S19 — Weak smoothness of the correspondence

**theorem; missing**. Source: Lemma2.3.9 pp21–22.

For cofinal m,mprime, [ker gamma / M_I^infinity/Hm]→Sht_I,mu^(mprime,1) is weakly perfectly smooth.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S18`, `S13`, `F23`.

Factor through the unipotent Borel-to-torus torsor and the subsequent congruence-kernel gerbe. The intermediate Hm quotient is not already the final restricted stack.

Open gates: `Q-restricted`, `Q-granularity`.

#### S20 — General restricted local shtukas

**construction; missing**. Source: §2.3.10 p22.

For n≥2 and m sufficiently large, quotient the n-truncated local-model frame space M_K^n by the factored LmG_K twisted action to obtain Sht_K,mu^(m,n),loc. Keep this separate from reductive n=1 truncation.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S09`, `S10`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the n-level frame torsor and an m factoring its action. Its quotient agrees with the indicated (m,n) local-shtuka functor. Maps from full shtukas commute with increasing m and decreasing n in the admissible range.

Acceptance cases: GLn frames reduce modulo p^n. At equal truncations the transition is identity. n=1-rdt is not literally n=1 modulo p without a reductive quotient.

Open gates: `Q-granularity`.

#### S21 — EKOR index poset

**construction; missing**. Source: §2.3.11 pp22–23.

The geometric points of the restricted shtuka stack are indexed by the left-minimal representatives ^K Adm({mu}), with the sigma-twisted partial order preceq of SYZ. Closed subsets are downward unions.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `S11`, `G05`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct minimal representatives and the twisted order using the parahoric Weyl subgroup. A union of strata is closed exactly for the source downward-closed index sets. Forgetful level maps compare indices via the source correspondence.

Acceptance cases: At Iwahori the order becomes Bruhat order on Adm. The zero-dimensional tau class is minimal. Ordinary double cosets do not parametrize all EKOR strata.

Open gates: `Q-granularity`.

#### B01 — Reductive isocrystals and sigma-centralizers

**construction; planned**. Source: §2.4.1 p23.

B(G) is the set of sigma-conjugacy classes b~g^(-1)b sigma(g). J_b is the Qp-group whose rational points are g with g^(-1)b sigma(g)=b. Translate inversion to the existing BG0 convention explicitly.

Stage imports: `BunGAndNewtonStrata:BG0`.

Prerequisites: `L02`, `L06`, `L24`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the sigma-conjugacy class and the descended automorphism group. Changing b by g^(-1)b sigma(g) identifies J_b with J_bprime by conjugation by g^(-1). Extension of structure group carries both the isocrystal and its automorphisms.

Acceptance cases: GL1 classes are valuation slopes. For b=1, J_b(Qp)=G(Qp). J_b(Qp) must retain its locally profinite topology.

#### B02 — Acceptable Newton classes

**construction; planned**. Source: §2.4.1 p23.

B(G,{mu}) consists of classes with kappa([b]) equal to the image of mu in pi1(G)_Gamma and dominant Newton point bounded by the Galois average of mu. The order fixes kappa and increases the dominant Newton point.

Stage imports: `BunGAndNewtonStrata:BG1`.

Prerequisites: `B01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply both the Kottwitz equality and Newton inequality. Basic means the Newton cocharacter is central. The two invariants are compatible with group homomorphisms in the source range.

Acceptance cases: For GLn the slopes sum to the Hodge degree. For a torus every class is basic. A Newton inequality without the Kottwitz equality is insufficient.

#### B03 — Newton semicontinuity for shtukas

**theorem; missing**. Source: §2.4.1 p23.

The locus of a bounded perfect local shtuka whose class lies below a given Newton class is closed; geometric classes are independent of the algebraically closed residue field chosen.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `B02`, `S02`.

Import RR96 and the perfect-base comparison with its exact hypotheses.

Open gates: `Q-newton`, `Q-granularity`.

#### X01 — Affine Deligne–Lusztig variety

**construction; missing**. Source: §2.4.2 pp23–24.

X(mu,b)_K is the perfect sheaf of modifications gL+G_K with g^(-1)b sigma(g) lying in the bounded admissible double-coset union. The condition is étale local on perfect test rings.

Prerequisites: `S02`, `G03`, `G05`, `B01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct a modification and a bounded Frobenius datum. In a trivialization the defining condition is the indicated sigma-conjugacy inequality. Level change and sigma-conjugacy transport act compatibly on the sheaf.

Acceptance cases: For Gm, nonemptiness forces the valuation of b to equal mu. For b=1,mu=0 the hyperspecial GLn locus is discrete. Raw R-valued cosets are not the entire sheaf when torsors are nontrivial.

Open gates: `Q-granularity`.

#### X02 — Representability of ADLV

**theorem; missing**. Source: Lemmas2.4.4–2.4.5 pp23–24.

X(mu,b)_K is a perfect scheme locally perfectly of finite type, realized as a closed bounded-condition subfunctor of the quasi-isogeny modification functor in Lemma2.4.5.

Prerequisites: `X01`, `G02`.

Use HV18/ZZ20 and the diagram functor, not a claim that the whole ADLV is finite type.

Open gates: `Q-adlv`, `Q-granularity`.

#### X03 — Framed isocrystal diagram

**construction; missing**. Source: Lemma2.4.5 pp23–24.

A framed object is an integral shtuka (E,beta1) and a rational isomorphism beta0:E[1/p]→E0[1/p] with beta1=beta0^(-1)b sigma(beta0). Forget beta1 to identify the unbounded functor with Gr_K.

Prerequisites: `X01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply E and beta0; the equation uniquely reconstructs beta1. For bprime=g^(-1)b sigma(g), transport beta0 to g^(-1)beta0. The construction commutes with base change and rational change of framing.

Acceptance cases: For sigma=id the equation is ordinary conjugation. g=1 acts identically. Using g beta0 with bprime=g^(-1)b sigma(g) generally breaks the square.

Open gates: `Q-granularity`.

#### X04 — Locally profinite automorphism sheaf

**construction; missing**. Source: Lemma2.4.6 pp24–25.

F_b(R)={g∈LG(R):g^(-1)b sigma(g)=b}. On the pro-etale site it is the locally profinite group sheaf underline(J_b(Qp)), whose sections are continuous maps from the appropriate profinite test spaces.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `B01`, `S02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Form the automorphism equalizer and its sheaf. Identify the topology-sensitive sheaf with the sigma-centralizer rational group. Conjugacy transport identifies automorphism sheaves and their actions.

Acceptance cases: For a profinite test set S, continuous maps S→J_b(Qp) give sections. At Spec Fpbar its points equal J_b(Qp). The discrete constant group sheaf is generally different.

Open gates: `Q-granularity`.

#### X05 — Pro-etale local quasi-isogeny triviality

**theorem; missing**. Source: Proof Lemma2.4.6 p25, FS21 I.2.1.

A family of local G-shtukas all of Newton class [b] admits a quasi-isogeny to the constant b-shtuka pro-etale locally; its sheaf of such quasi-isogenies is an F_b-torsor.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `X04`, `B03`.

Separate local existence from the simple transitivity of the automorphism action.

Open gates: `Q-newton`, `Q-granularity`.

#### X06 — Newton stratum quotient

**theorem; missing**. Source: Lemma2.4.6 pp24–25.

In the pro-etale topology the bounded Newton stratum Sht_K,mu,[b] is equivalent to [F_b / X(mu,b)_K]; the quotient retains stabilizers.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `X05`, `X03`, `S11`.

Use framed quasi-isogenies as a torsor atlas and descend the bounded lattice condition.

Open gates: `Q-granularity`.

#### X07 — ADLV nonemptiness

**theorem; missing**. Source: §2.4.2 and Corollary2.4.7 pp23–25.

X(mu,b)_K is nonempty iff [b]∈B(G,{mu}); for nested parahorics the bounded ADLV projection is surjective on geometric points in the source range.

Prerequisites: `X01`, `B02`.

Use He16 nonemptiness/level-change input; split the two assertions to close the design.

Open gates: `Q-adlv`, `Q-granularity`.

#### M01 — Kisin–Pappas integral Hodge model

**construction; missing**. Source: §3.1.1–3.1.4 pp25–27.

Under H, choose a good symplectic lattice realization of G_K. The integral model S_U(G,X) over O_E,(v) is the normalization of the closure of the generic Hodge Shimura variety in the associated Siegel model, with sufficiently small away-p level.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `P12`, `P13`, `R01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the Hodge embedding, integral lattice and closure-normalization. The generic fiber is the prescribed canonical Shimura model. Prime-to-p Hecke operators and allowed level changes extend to the integral models.

Acceptance cases: Hyperspecial Siegel data recover the smooth Siegel model. A torus datum gives the corresponding zero-dimensional reduction. Normalization alone does not make every Hodge embedding a closed integral immersion.

Open gates: `Q-granularity`.

#### M02 — Local-model diagram

**theorem; missing**. Source: Theorem3.1.4 pp26–27.

Under H the model M01 admits a G_K-torsor q:S_tilde→S and a G_K-equivariant smooth map to the parahoric local model of relative dimension dim G; after perfection it gives lambda:S^perf→[M_K^loc/G_K].

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M01`, `G05`, `F08`.

Import KP18 with its corrected display/deformation inputs and the same group action convention.

Open gates: `Q-model`, `Q-granularity`.

#### M03 — Hodge-embedding independence

**theorem; missing**. Source: §3.1.4 p27.

Under the integral-model hypotheses of Pap22 invoked here, M01 is independent of the chosen good Hodge embedding, compatibly with the canonical generic fiber.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M01`.

Use the characterized integral model, not normalization independence by itself.

Open gates: `Q-model`, `Q-granularity`.

#### M04 — Compatible realization tensors

**construction; missing**. Source: §3.1.5–3.1.6 p27.

The defining tensors of the integral reductive group extend as de Rham tensors and rational ell-adic tensors for ell≠p, and give integral p-adic tensors on the generic fiber; at a special point obtain Frobenius-invariant contravariant Dieudonné tensors.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `L13`, `M01`, `P08`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct Betti tensors and transfer them through the specified comparison maps. Their stabilizer is the prescribed integral group in the Dieudonné frame. Specialization and isogenies compare tensors in the correct covariant or contravariant realization.

Acceptance cases: The polarization tensor in Siegel type gives symplectic similitudes. A zero tensor imposes no stabilizer condition. Integral p-adic tensors on the generic fiber are not asserted as an etale local system on the special fiber.

Open gates: `Q-granularity`.

#### M05 — Crystalline local shtuka map

**construction; missing**. Source: §3.1.6 p27.

Under H, the p-divisible group and tensors define a canonical map Sh_K→Sht_K,{mu}, with mu=sigma(mu_h^(-1)). At the away-p tower the map is G(A_f^p)-equivariant with trivial action on the target.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M04`, `S02`, `M01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Apply tensor Dieudonné theory to the universal abelian scheme over the perfect special fiber. On a geometric point it gives the displayed tensor Frobenius module. Hodge-embedding and parahoric changes commute with the map through the canonical shtuka comparison.

Acceptance cases: The contravariant Siegel example recovers the height-one Frobenius bound. An identity level map induces the same shtuka. Replacing mu by mu_h without inverse and sigma changes the bound.

Open gates: `Q-granularity`.

#### M06 — Canonical diamond comparison

**theorem; missing**. Source: §3.1.6 footnote16 p27.

The local shtuka from Hamacher–Kim/SYZ agrees with the special-fiber shtuka obtained from the canonical Pappas–Rapoport diamond construction, yielding independence and level functoriality.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `M05`.

Import PR21 Example2.4.9 and DvHKZ24 §5.3 with their precise comparison; the v-sheaf and perfect-scheme carriers are different.

Open gates: `Q-model`, `Q-granularity`.

#### D01 — Hoff infinitesimal tensor compatibility

**theorem; missing**. Source: Hoff23 Assumption2.28 p25; consumed in vh24 §3.1.7.

For the completed local model ring R_G and a_G=m_R_G²+m_E R_G, the canonical finite-free-module comparison of Hoff Lemma1.21 on W(R_G/a_G) is compatible with G-structures. This is an explicit input (Hoff Assumption2.28), not proved merely by naming the display.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M04`, `P08`.

Prove the assumption using the permitted local-model tangent-lifting theorem, with its type and prime bounds, or retain it as a hypothesis.

Open gates: `Q-hoff`, `Q-granularity`.

#### M07 — Restricted shtuka smoothness

**theorem; missing**. Source: §3.1.7–3.1.8 p28; Hoff23 Corollary2.57 pp35–36.

Under H and the infinitesimal tensor-compatibility input D01 (or an independently proved replacement), Sh_K→Sht_K,mu^(m,1) and Sh_K→Sht_K,mu^(m,n),loc are perfectly smooth for admissible m and n≥2.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M05`, `M06`, `D01`, `S11`, `S20`.

Use locally universal displays, Artinian lifting and the perfection comparison. Reconcile Hoff’s normalization with SYZ before identifying targets.

Open gates: `Q-hoff`, `Q-model`, `Q-granularity`.

#### M08 — Commuting local-model morphism

**theorem; missing**. Source: §3.1.7 p28.

The restricted map from M07 composed with Sht_K,mu^(m,1)→[M_K^loc/G_K] equals the lambda map of M02 with the source action convention.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M07`, `M02`, `S11`.

Use the corrected comparison diagram; the original XZ/SYZ square cannot be used unchanged.

Open gates: `Q-hoff`, `Q-granularity`.

#### M09 — Global EKOR stratum

**construction; missing**. Source: §3.1.8 p28.

For w∈^K Adm({mu}), define Sh_K{w} as the inverse image of the corresponding restricted-shtuka stratum. Its closed downward union is Sh_K{preceq w}.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M07`, `S21`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Pull back the locally closed residual stratum at w. Closure is the union indexed by wprime preceq w, using openness of M07. Prime-to-p Hecke maps preserve the stratification.

Acceptance cases: At Iwahori this is the KR stratification. For very special rank-one level the minimal stratum is basic. An EKOR stratum can be a proper subset of a Newton stratum.

Open gates: `Q-granularity`.

#### M10 — Tensor-preserving isogeny class

**construction; missing**. Source: §3.1.9 p29.

Two special points x,xprime are in the same isogeny class if a quasi-isogeny A_x→A_xprime carries all ell-adic tensors in the forward direction and pulls crystalline tensors back from D_xprime[1/p] to D_x[1/p].

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M04`, `L13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply a quasi-isogeny with the two realization compatibilities. Identity, inverse and composition give an equivalence relation. Changing integral level sends a class to the class of its image.

Acceptance cases: An actual tensor-preserving isomorphism gives the same class. The identity preserves every tensor. Contravariant Dieudonné tensors are not pushed along D_x→D_xprime.

Open gates: `Q-granularity`.

#### M11 — Rational tensor quasi-isogeny group

**construction; missing**. Source: §3.1.9 p29.

I_x is the Q-group of quasi-automorphisms of A_x preserving the crystalline and all away-p realization tensors. It maps to J_b at p and to G(A_f^p) through the chosen frames.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M10`, `B01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Take the tensor stabilizer inside the quasi-endomorphism unit group. The local maps are characterized by their realization actions. Changing x within its class conjugates I_x and transports the frames.

Acceptance cases: Scalar endomorphisms must obey any polarization similitude convention. The identity is in every I_x. For nonbasic b do not identify I_x with an inner form of all G without a theorem.

Open gates: `Q-granularity`.

#### M12 — Proper parahoric transition

**theorem; missing**. Source: Proposition3.1.10 pp29–30.

For J⊂K, the canonical level-forgetting map S_J→S_K is proper and extends the generic transition map, with the chosen small away-p levels.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M01`, `R01`.

Use compatible lattice-chain embeddings and Zhou7.1, including finite comparison of Siegel realizations.

Open gates: `Q-isogeny`, `Q-granularity`.

#### M13 — Same level fiber is one isogeny class

**theorem; missing**. Source: Proposition3.1.12 first assertion pp30–31.

All geometric points in a fiber of S_J→S_K belong to the same tensor-preserving isogeny class.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M10`, `M12`.

Extend the subchain quasi-isogeny to the full chain and compare crystalline frames through chain-compatible automorphisms.

Open gates: `Q-isogeny`, `Q-granularity`.

#### M14 — Preimage of an isogeny class

**theorem; missing**. Source: Proposition3.1.12 second assertion pp30–31.

The full inverse image under S_J→S_K of an isogeny class in S_K is a single isogeny class in S_J.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M13`, `M10`.

Lift the prescribed lattice-chain isogeny and compare the rational tensor structures.

Open gates: `Q-isogeny`, `Q-granularity`.

#### M15 — Shtuka and level compatibility

**theorem; missing**. Source: §3.1.13 p31.

The square of the perfect Shimura level transition and untruncated local-shtuka level transition commutes canonically.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M06`, `M12`, `S08`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### M16 — Special point and integral reduction

**construction; missing**. Source: §3.2.1–3.2.2 pp31–32.

A special point is represented by a torus subdatum (T,h)→(G,X); choose its finite-field-of-definition integral extension and reduce it to the special fiber. A CM reduction is the image so obtained.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `P13`, `L07`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the torus datum, generic point and integral extension. The induced abelian variety has the corresponding CM tensor realization. Changing parahoric level commutes with integral extension and reduction.

Acceptance cases: A torus Shimura datum has only special points. Identity level change preserves a chosen reduction. A special-fiber point is not called special without a characteristic-zero lift.

Open gates: `Q-granularity`.

#### M17 — CM reductions at every parahoric

**theorem; missing**. Source: Theorem1 p3; Corollary3.2.3 p32.

Under H, every isogeny class at every parahoric level contains the reduction of a special point. No properness or unramifiedness assumption is added.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M14`, `M16`, `A28`, `R02`, `R03`, `R04`.

Choose an Iwahori in the given parahoric and a very special parahoric containing it. Lift through the proper transition and use AppendixA4.5(2), then M14.

Open gates: `Q-granularity`.

#### M18 — Isogeny uniformization parameters

**construction; missing**. Source: §3.3.1 pp32–33; AppendixA4.

For x, form I_x(Q) / (X(mu,b)_K(Fpbar)×G(A_f^p)/U^p), with diagonal action through the p and away-p realizations. At the tower retain the right Hecke action and Phi=(b sigma)^r for the reflex residue degree r.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `X01`, `M11`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the diagonal orbit set with specified realization maps. The stabilizer and orbit relation include both coordinates. Local level projections and away-p right translations descend to the quotient.

Acceptance cases: The identity local modification and unit adele map to x. At identity away-p level transition the class is unchanged. A product of separate orbit sets would lose the diagonal coupling.

Open gates: `Q-granularity`.

#### M19 — Cartesian square reduces uniformization

**theorem; missing**. Source: Theorem3.3.1 pp32–34.

If the perfect Shimura/local-shtuka level square for I⊂K very special is Cartesian at every small away-p level, the very-special isogeny uniformization induces Iwahori isogeny uniformization.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M18`, `M15`, `X06`, `A27`.

Base change the pro-etale Newton quotient, identify its fiber product by the diagonal I_x action, and use M14.

Open gates: `Q-main`, `Q-granularity`.

#### M20 — Uniformization respects the shtuka coordinate

**theorem; missing**. Source: Lemma3.3.3 p33.

The uniformization morphism followed by the local-shtuka map is the projection to the ADLV coordinate followed by the Newton quotient.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M18`, `X06`, `A27`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### M21 — Isogeny groupoid fiber product

**theorem; missing**. Source: Lemma3.3.4 pp33–34.

The fiber product in Lemma3.3.4 is the I_x(Q)-quotient of X(mu,b)_I×G(A_f^p)/U^p, using the common J_b-action and compatible quotient map.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `M18`, `M20`, `X06`, `L20`.

Use an isocomma groupoid with invertible comparison; trivialize and identify the diagonal orbit relation.

Open gates: `Q-main`, `Q-granularity`.

#### M22 — Profinite Shimura component group

**construction; missing**. Source: §3.4.1 pp34–35.

Let pi(G) be the inverse limit over compact open U⊂G(A_f) of G(Q)_+ / G(A_f)/U. After quotienting by rho Gsc(A_f), use the induced abelian topological quotient and closures of rational images.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `P13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the inverse system of finite component sets and its induced group where justified. The adelic quotient uses the closure of the rational image. Level maps and Hecke actions induce the profinite transition and action.

Acceptance cases: At finite level components form a finite set. The identity adelic element fixes the chosen base component. A dense rational subgroup cannot be replaced by a closed subgroup without taking closure.

Open gates: `Q-granularity`.

#### R06 — Local component quotient

**theorem; missing**. Source: Lemma3.4.2 pp34–35.

For the tamely ramified connected parahoric of Lemma3.4.2, G(Qp)/(rho Gsc(Qp)Gcal(Zp))≃(pi1(G)_I)^sigma via Kottwitz.

Prerequisites: `R01`, `R05`, `B02`.

Prove torus Lang surjectivity, the simply connected derived case, then a z-extension and its connected parahoric kernel.

Open gates: `Q-local`, `Q-granularity`.

#### M23 — Generic component torsor

**theorem; missing**. Source: §3.4.3 pp35–36.

The component set of the generic Shimura tower at fixed p-level is a torsor under the corresponding quotient of pi(G); the identification depends on a chosen connected component.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M22`, `P13`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### M24 — Very-special specialization of components

**theorem; missing**. Source: §3.4.3 pp35–36.

At very special level under H, generic and geometric special fibers have canonically matching connected components, including the nonproper case in the source.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M23`, `M01`, `R04`.

Use normality and the compactification/specialization theorem of MP19 with its exact boundary hypotheses.

Open gates: `Q-components`, `Q-granularity`.

#### M25 — Component formula for isogeny parameters

**theorem; missing**. Source: Proposition3.4.5 pp36–37.

With a base point x at very special level, the component of the uniformized point represented by (y,g^p) is (kappa(y),g^p) acting on the component of x through R06 and M22.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M24`, `M18`, `R06`, `A05`, `A26`.

Use M-adapted lifts, the rational M(Qp) component-surjectivity input, and AppendixA1.3 for any chosen lambda.

Open gates: `Q-components`, `Q-granularity`.

#### M26 — Minimal KR stratum meets every component

**theorem; missing**. Source: Corollary3.4.6 p37.

The zero-dimensional basic KR stratum tau at Iwahori level maps surjectively to connected components of the very-special Shimura variety.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M25`, `B04`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### M27 — Every KR stratum meets every component

**theorem; missing**. Source: Corollary3.4.7 p37.

Each nonempty Iwahori KR stratum indexed by Adm(mu) maps surjectively to connected components of the very-special level variety.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M26`, `G05`.

Use He–Rapoport closure relations and the source stratification input.

Open gates: `Q-components`, `Q-granularity`.

#### B04 — Sigma-centralizer Kottwitz surjectivity

**theorem; missing**. Source: Proof Corollary3.4.6 p37; Kisin17 §1.2.

For the basic class used in the zero KR stratum, the Kottwitz map J_b(Qp)→(pi1(G)_I)^sigma is surjective in the source connected-parahoric setting.

Prerequisites: `B01`, `R06`.

Use the local quotient for the inner form and the basic identification of fundamental groups.

Open gates: `Q-local`, `Q-granularity`.

#### C01 — Auxiliary perfect Shimura fiber product

**construction; missing**. Source: §4 p38.

For I⊂K very special and small U^p, define ShStar_I=Sh_K×_{Sht_K,mu}Sht_I,mu as a two-fiber product. Its natural map iota:Sh_I→ShStar_I comes from M15.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M15`, `S08`, `L20`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the fiber product with its invertible comparison and two projections. A point is a K-level point plus an I-level shtuka and an identification of their K-shtukas. Away-p Hecke and level transitions act on the fiber product.

Acceptance cases: When I=K the fiber product is Sh_K. The image of an actual I-level point has its canonical comparison. A fiber product of coarse point sets would discard the required isomorphism.

Open gates: `Q-granularity`.

#### C02 — Siegel level square

**theorem; missing**. Source: Lemma4.1.2 pp38–39.

The Siegel cube comparing integral lattice-chain models, height-one shtukas and parahoric changes is Cartesian in the setting of Lemma4.1.2.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `S05`, `P12`, `C01`, `C03`.

Use the equivalence with p-divisible groups and the quotient theorem for abelian schemes by p-divisible quasi-isogenies.

Open gates: `Q-isogeny`, `Q-granularity`.

#### C03 — Abelian quotient realization

**theorem; missing**. Source: Proof Lemma4.1.2 p38.

A p-power quasi-isogeny of the p-divisible group of an abelian scheme over a perfect base is realized by the corresponding abelian quotient with compatible polarization and prime-to-p level data, in RZ6.13’s setting.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `L13`, `P09`.

Read and split the original Rapoport–Zink quotient construction; do not infer it from field-valued Dieudonné theory.

Open gates: `Q-isogeny`, `Q-granularity`.

#### C04 — Auxiliary map to Siegel model

**theorem; missing**. Source: Corollary4.1.3 p39.

The Cartesian Siegel cube induces a morphism from ShStar_I to the chosen Siegel Iwahori model, compatible with the original Hodge embedding and the K-level maps.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C01`, `C02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### F25 — Perfect proper point injection

**theorem; missing**. Source: Lemma4.1.5 p39, BS17 Corollary6.10.

A perfectly proper pfp map of perfect spaces over Fpbar which is injective on geometric points is a closed immersion in the source setting.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Prerequisites: `F05`, `F02`.

Use a deperfection, radiciality and the perfect-space closed-immersion criterion.

Open gates: `Q-perfect`, `Q-granularity`.

#### C05 — Closed immersion into auxiliary model

**theorem; missing**. Source: Proposition4.1.4 pp39–40.

Under H, iota:Sh_I→ShStar_I is a closed immersion.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C01`, `M12`, `F25`.

Prove perfect properness; tensor branch uniqueness gives geometric-point injectivity. Apply F25.

Open gates: `Q-model`, `Q-granularity`.

#### C06 — Affine auxiliary Siegel map

**theorem; missing**. Source: Lemma4.1.6 and footnote22 p39, corrected sufficient conclusion.

The map ShStar_I→Siegel_I has a finite deperfection in the argument of Lemma4.1.6 and is therefore integral and affine, and perfectly finite. Ordinary finiteness of its perfection is not supplied by that argument.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C04`, `C07`, `F05`.

Use perfect properness and finite fibers at a finite-presentation model, then preserve affineness and integrality under perfection. This suffices for the ample-pullback consumer.

Open gates: `Q-perfect`, `Q-granularity`.

#### C07 — Injectivity in the auxiliary fiber

**theorem; missing**. Source: Lemma4.1.7 pp39–40.

The fiber map in Lemma4.1.7 is injective because the intersection of the positive loop subgroup for the Siegel chain with L+G_K is L+G_I, with full connected fixers.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C04`, `S07`, `R01`.

Reduce the shtuka fiber to the B(L+) flag fiber and use the exact integral stabilizer intersection.

Open gates: `Q-local`, `Q-granularity`.

#### C08 — Auxiliary weak smooth local-model map

**theorem; missing**. Source: Proposition4.2.1 pp41–42.

Under H and the smoothness input M07, lambdaHat:ShStar_I→[M_I^loc/G_I] is weakly perfectly smooth and ShStar_I is equidimensional of the same dimension as Sh_I.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C01`, `S14`, `S16`, `S19`, `M07`, `M08`, `F24`.

Pull back the restricted correspondence, compare quotient dimensions, then compose its weakly smooth map with the restricted Iwahori local-model map.

Open gates: `Q-restricted`, `Q-granularity`.

#### C09 — Auxiliary KR strata

**construction; missing**. Source: §4.2.2 p42.

For w∈Adm(mu), ShStar_I(w) is the inverse image of [M_I^loc(w)/G_I] under lambdaHat; ShStar_I(≤w) is the downward union.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C08`, `G05`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Pull back each Schubert stratum through lambdaHat. Openness of lambdaHat identifies the closure with the Bruhat downward union. Away-p Hecke maps preserve the strata and their closures.

Acceptance cases: The tau stratum has dimension0. A maximal translation gives a top-dimensional stratum. The auxiliary stratification is defined before proving iota an isomorphism.

Open gates: `Q-granularity`.

#### C10 — Auxiliary KR dimensions

**theorem; missing**. Source: Corollary4.2.3 p42, corrected proof.

For every w∈Adm(mu), ShStar_I(≤w) has dimension ell(w). The relative dimension of lambdaHat is dim G_I, not zero.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C08`, `C09`, `F24`, `G06`.

At maximal length compare equal dimensions of ShStar and Mloc; F24 gives n=dim G_I. Apply the same formula on each stratum.

Open gates: `Q-granularity`.

#### C11 — Normality of auxiliary KR closures

**theorem; missing**. Source: Corollary4.2.3 pp42–43.

For every w∈Adm(mu), ShStar_I(≤w) is normal.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C08`, `C09`, `F20`, `G06`.

Pull back the normal Schubert variety through a weakly perfectly smooth map and use F20.

Open gates: `Q-granularity`.

#### C12 — Quasi-affineness of auxiliary KR strata

**theorem; missing**. Source: Corollary4.2.4 p43.

Each ShStar_I(w) is quasi-affine. The Hodge line is ample after pullback along the affine map C06 and is torsion on the stratum.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C06`, `C09`, `F26`.

Use the Zarhin symplectic enlargement, Hodge-line ampleness on Siegel, its restricted-shtuka descent and the SYZ torsion result, then torsion ample implies quasi-affine.

Open gates: `Q-line`, `Q-granularity`.

#### F26 — Torsion ample line implies quasi-affineness

**theorem; missing**. Source: Proof Corollary4.2.4 p43.

For the qcqs perfect spaces in the source, an ample invertible sheaf of finite tensor order implies the space is quasi-affine; affineness of a pullback morphism preserves ampleness in the relevant ample-family criterion.

k is a perfect field of characteristic p; in the Shimura application k=Fpbar. Use pfp perfect spaces and the perfect etale or pro-etale topology explicitly indicated. Shtuka and flag constructions use a connected reductive Qp group and its specified parahoric Zp-model.

Choose a power trivializing the line; affine nonvanishing loci give the quasi-affine criterion. Verify the perfect-space ample-line conventions.

Open gates: `Q-line`, `Q-granularity`.

#### C13 — Minimal-EKOR incidence condition

**construction; missing**. Source: Conjecture4.3.1 p43.

Conjecture4.3.1 is the predicate that every irreducible component of the closure of every EKOR stratum at very special level meets the zero-dimensional EKOR stratum tau. It remains a hypothesis when invoked abstractly.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M09`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Specify the incidence condition for all strata and their irreducible components. The condition is stronger than merely having tau somewhere in the total special fiber. Pass to compatible finite away-p levels only using the incidence comparison.

Acceptance cases: The hyperspecial case follows from the stated WZ18/And21 inputs. A zero-dimensional minimal closure satisfies it. No assertion of the general conjecture is made by defining this predicate.

Open gates: `Q-granularity`.

#### C14 — Proper incidence reaches zero KR stratum

**theorem; missing**. Source: Lemma4.3.4 pp43–44.

A connected component Z of a KR closure which meets a stratum with proper closure also meets the tau stratum.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C09`, `C12`.

Choose minimal length in the intersection. The resulting closed proper union of quasi-affine components has dimension0, hence length0.

Open gates: `Q-granularity`.

#### C15 — Minimal intersection is straight

**theorem; missing**. Source: Lemma4.3.6 p44.

For a minimal-length KR index x meeting a component in the incidence argument, x is sigma-straight.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `X07`, `C09`.

Use the basic/local uniformization morphism in the source and HZ20 Theorem4.1 degeneration to a straight element.

Open gates: `Q-adlv`, `Q-granularity`.

#### C16 — Straight KR to EKOR finite-etale map

**theorem; missing**. Source: Lemma4.3.7 pp44–45.

For a sigma-straight x in the Iwahori argument there is y∈^K Adm(mu) of the same length and related by K-Weyl sigma-conjugacy such that ShStar_I(x)→Sh_K{y} is finite etale.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C15`, `X06`, `S21`.

On the pro-etale Newton cover reduce to zero-dimensional perfect straight ADLVs J_b/N→J_b/Nprime for compact open N⊂Nprime of finite index.

Open gates: `Q-adlv`, `Q-granularity`.

#### C17 — Incidence from the very-special conjecture

**theorem; missing**. Source: Proposition4.3.5 pp44–46.

Assuming C13, every irreducible component of every auxiliary KR closure meets the tau stratum.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C13`, `C14`, `C15`, `C16`.

The minimal straight stratum maps finite etale to an EKOR stratum whose closure component is proper; the incidence condition forces the minimal index to tau.

Open gates: `Q-granularity`.

#### C18 — Basic uniformization as perfect schemes

**theorem; missing**. Source: §4.3.8 p46; HZZ21 Proposition5.2.2 PDF39.

Under the Hodge, tame, p-prime-derived-fundamental-group and connected very-special assumptions, the basic special fiber is I_x(Q) / (X(mu,b)_K×G(A_f^p)/U^p) as a perfect scheme, Hecke-equivariantly.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M18`, `A27`.

Use the HZZ basic theorem and its single-isogeny-class argument, with inner-compatible realization maps.

Open gates: `Q-basic`, `Q-granularity`.

#### C19 — Basic quasi-isogeny inner form

**theorem; missing**. Source: §4.3.8 p46; HZZ21 Proposition5.2.6 PDF41.

For a basic point under C18, I_x is an inner form of G, its p realization is J_b, its away-p realization is G, and I_x(R) is compact modulo center. The local identifications agree with the global inner twisting up to inner automorphism.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M11`, `C18`.

Use a sufficiently divisible finite field, elliptic Frobenius triple and the CM-lift comparison.

Open gates: `Q-basic`, `Q-granularity`.

#### C20 — Basic auxiliary uniformization

**theorem; missing**. Source: §4.3.9 pp46–47.

The basic locus of ShStar_I is I_x(Q) / (X(mu,b)_I×G(A_f^p)/U^p) as a perfect scheme, with its projection induced by the ADLV level map.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C18`, `C01`, `M20`, `M21`, `X06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### C21 — Simply connected action on minimal local fibers

**theorem; missing**. Source: Lemma4.3.11 p47.

J_b^sc(Qp) acts transitively on the fibers of X(mu,b)_I(tau)→(pi1(G)_I)^sigma.

Prerequisites: `R06`, `B04`.

Straightness gives J_b transitivity and a parahoric stabilizer. Quotient by its product with the simply connected image.

Open gates: `Q-local`, `Q-granularity`.

#### E01 — Abelianized degree-zero reductive cohomology

**construction; missing**. Source: §4.3.12–4.3.15 pp47–49; Bor20 answer.

For a reductive Q-group G define H^0_ab(Q,G)=H^0(Q,[Z(Gsc)→Z(G)]), with centers in degrees−1 and0, and ab^0:G(Q)→H^0_ab(Q,G). Use the crossed-module comparison [Gsc→G].

Prerequisites: `L06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the center complex and its degree-zero hypercohomology. Its comparison with the reductive crossed module gives the abelianization homomorphism. Inner-compatible isomorphisms of center complexes commute with localization.

Acceptance cases: For a torus abelianization in degree0 is T(Q). For simply connected semisimple G the abelianized group is trivial. An arbitrary outer local identification need not commute with the fixed global center comparison.

Open gates: `Q-granularity`.

#### E02 — Degree-zero abelianization exactness

**theorem; missing**. Source: §4.3.13–4.3.14 pp48–49; Bor20.

The sequence Gsc(Q)→G(Q)→H^0_ab(Q,G)→H^1(Q,Gsc) is exact, with kernel of ab^0 equal to rho Gsc(Q).

Prerequisites: `E01`.

Use the crossed-module hypercohomology sequence and its pointed-set connecting map.

Open gates: `Q-cohom`, `Q-granularity`.

#### E03 — Real-positive image criterion

**theorem; missing**. Source: Lemma4.3.14 and Corollary4.3.15 pp48–49.

Assume the Hasse principle ker(H^1(Q,Gsc)→H^1(R,Gsc))=1. Then G(Q)_+/rho Gsc(Q) identifies with the inverse image of ab^0(Z(G)(R)) under H^0_ab(Q,G)→H^0_ab(R,G).

Prerequisites: `E02`.

An abelianized class with real image from the center has locally trivial H1 image at infinity; the Hasse principle kills the global obstruction.

Open gates: `Q-cohom`, `Q-granularity`.

#### E04 — Inner-form equality of positive adelic images

**theorem; missing**. Source: Proposition4.3.13 p47, compatibility made explicit.

For inner Q-forms G,H with away-p identifications compatible with the fixed global inner twisting on the center complex, their positive rational images agree in G(A_f^p)/rho Gsc(A_f^p)×(pi1(G)_I)^sigma.

Prerequisites: `E03`, `R06`.

Use the same center complex and its localization maps; arbitrary unrelated outer local identifications do not suffice.

Open gates: `Q-cohom`, `Q-granularity`.

#### C22 — Hecke transitivity on zero-stratum fibers

**theorem; missing**. Source: Proposition4.3.16 pp49–50.

For finite Sigma containing p in the source setting, Gsc(A_f^Sigma) acts transitively on the fibers of ShStar_I(tau)→pi0(Sh_K), at the compatible away-p tower.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C20`, `C21`, `E04`, `M25`.

Use strong approximation for I_x^sc, the compact-mod-center real form, local fiber transitivity, and equality of the closed rational images.

Open gates: `Q-approximation`, `Q-granularity`.

#### C23 — Hecke transitivity on KR components

**theorem; missing**. Source: Proposition4.3.17 pp50–51.

If the Shimura variety is proper or C13 holds, Gsc(A_f^Sigma) acts transitively on the fibers of pi0(ShStar_I(≤w))→pi0(Sh_K).

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C22`, `C17`, `C14`.

Zero-stratum points surject onto finite-level component fibers; pass to the countable inverse limit of finite sets by compactness.

Open gates: `Q-approximation`, `Q-granularity`.

#### C24 — Global Cartesian square theorem

**theorem; missing**. Source: Theorem4.4.1 pp51–52.

Under H, if the Shimura variety is proper or C13 holds, iota:Sh_I→ShStar_I is an isomorphism.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C05`, `C10`, `C11`, `C23`, `M27`.

Closed equidimensional image is a union of components of normal maximal KR closures. It meets every fiber by M27, and Hecke transitivity forces all components.

Open gates: `Q-main`, `Q-granularity`.

#### C25 — Hyperspecial minimal-incidence theorem

**theorem; missing**. Source: Remarks4.3.2–4.3.3 p43; proof main results p52.

When G_Qp is unramified and K hyperspecial, the incidence predicate C13 holds by the WZ18/And21 results invoked here.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C13`.

Read the exact EO-closure incidence theorem and the comparison of the two period maps.

Open gates: `Q-incidence`, `Q-granularity`.

#### C26 — General-parahoric isogeny uniformization

**theorem; missing**. Source: Theorem2(2) p3; §4.4 pp51–52.

Under H, if G_Qp is unramified or Sh is proper, the orbit set M18 bijects with the isogeny class of x at every parahoric level, compatibly with away-p Hecke and Frobenius.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C24`, `C25`, `M19`, `M14`, `A27`.

Choose an Iwahori and a very special over-parahoric, apply the Cartesian theorem, then descend through Zhou7.7.

Open gates: `Q-main`, `Q-granularity`.

#### C27 — He–Rapoport axioms

**theorem; missing**. Source: Theorem3 p3; §4.4 p52.

Under the hypotheses of C26, the integral models satisfy the He–Rapoport axioms, including the remaining level-change surjectivity axiom4(c), in the numbering used by the source.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C26`.

Use Zhou8.1(ii) and retain the exact correspondence with He–Rapoport’s original numbering.

Open gates: `Q-main`, `Q-granularity`.

#### C28 — Q-nonbasic Newton class

**construction; missing**. Source: §4.5.1 p52.

A class b∈B(G_Qp) is Q-nonbasic if its image in every Q-simple adjoint factor of G is nonbasic. An EKOR stratum intersects the Q-nonbasic locus if it has a point of such a class.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `B02`, `M09`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Project b to each Q-simple adjoint factor and require nonbasicness there. For Q-simple Gad this reduces to ordinary nonbasicness. The predicate is compatible with an isomorphism of the Q-adjoint datum.

Acceptance cases: For a product, both adjoint factors must be nonbasic. A torus has no nontrivial adjoint factor; retain the source treatment of this degenerate case. One nonbasic factor and one basic factor do not satisfy the product hypothesis.

Open gates: `Q-granularity`.

#### C29 — KR-to-EKOR surjectivity

**theorem; missing**. Source: Lemma4.5.3 p52.

For w∈^K Adm(mu), the Iwahori KR stratum Sh_I(w) maps surjectively onto the very-special EKOR stratum Sh_K{w}, under the hypotheses giving He–Rapoport axiom4(c).

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C27`, `M09`.

Apply SYZ5.4.5(3) with the verified axiom.

Open gates: `Q-granularity`.

#### C30 — Straight Q-nonbasic stratum components

**theorem; missing**. Source: Proof Theorem4.5.2 step1 pp52–53.

Under H and properness or C13, for sigma-straight w whose EKOR stratum is Q-nonbasic, pi0(Sh_K{w})→pi0(Sh_K) is bijective.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C16`, `C23`, `C28`, `M17`.

Apply the ordinary Hecke-orbit monodromy theorem with its CM-lift and normality hypotheses. Choose Sigma to include compact adjoint factors. The action on each fiber is both trivial and transitive.

Open gates: `Q-monodromy`, `Q-granularity`.

#### C31 — General Q-nonbasic EKOR components

**theorem; missing**. Source: Theorem4.5.2 pp52–53.

Under H, at very special K and assuming properness or C13, if Sh_K{w} intersects the Q-nonbasic locus then its connected components map bijectively to those of Sh_K.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C30`, `C29`, `C11`, `C23`.

Find a sigma-straight wprime≤w in a Q-nonbasic class by HZ20. Use zero-stratum incidence to make each closure component meet wprime, then normality identifies open and closure components.

Open gates: `Q-monodromy`, `Q-granularity`.

#### C32 — EKOR component theorem for Q-simple adjoint group

**theorem; missing**. Source: Theorem4 p4.

Under H, Gad Q-simple, K very special, and properness or unramified G_Qp, an EKOR stratum not contained in the smallest Newton stratum has the same connected-component set as the Shimura variety.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `C31`, `C25`, `C28`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### A01 — Saturated Iwahori preimage at very special level

**construction; missing**. Source: AppendixA1 p54.

Under V set Adm(mu)^K=WK Adm(mu) WK and X(mu,b)^K=union_{w∈Adm(mu)^K}X_w(b) inside the Iwahori flag space. This is the full inverse image of X(mu,b)_K, generally larger than X(mu,b)_I.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `V01`, `X01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Form the two-sided saturation and its Iwahori ADLV union. Its projection to Gr_K is exactly the original bounded ADLV. J_b action and level projection respect the saturation.

Acceptance cases: If WK=1 saturation does nothing. A flag fiber at a K-point contains all its Iwahori refinements. Using Adm(mu) instead of WK Adm(mu) WK can exclude the root curves of A2.

Open gates: `Q-granularity`.

#### A02 — Flag fibration preserves connected components

**theorem; missing**. Source: EquationA1.1–A1.2 p54.

Under V the projection X(mu,b)^K→X(mu,b)_K is an etale-locally trivial flag fibration with connected fibers and induces a J_b(Qp)-equivariant bijection on pi0.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A01`, `S06`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

Open gates: `Q-granularity`.

#### V01 — Echelonnage root datum and corrected dominance

**construction; missing**. Source: AppendixA1 p54, corrected order.

For a very special vertex, the reduced echelonnage root system Sigma has Waff≃W(Sigma)⋉Qvee(Sigma). On dominant inertia cocharacters lambda≤lambdaPrime means lambdaPrime−lambda is a nonnegative integral sum of positive coroots.

Prerequisites: `R04`, `R05`, `L11`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct Sigma and identify its affine Weyl group with the chosen parahoric root datum. The positive-coroot cone points from smaller to larger dominant cocharacters. Sigma, sigma, Levi subsets and cocharacter lattices are transported together.

Acceptance cases: In rank one, 0≤alphaVee for the positive coroot. The central directions are incomparable unless equal. The reversed difference would turn an admissible bounded interval into the wrong set.

Open gates: `Q-granularity`.

#### A03 — Newton Levi and admissible Levi parameters

**construction; missing**. Source: AppendixA1.1 pp54–55.

Under V choose b in M=Z_G(nu_b), basic in M. For x∈pi1(M)_I let mu_x be its unique M-dominant M-minuscule representative. Let I_mu,b,M consist of x with image kappa_M([b]) in pi1(M)_Gamma and mu_x≤mu. Explicitly project inertia coinvariants to sigma coinvariants.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `V01`, `B02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose the dominant Newton representative and form its centralizer Levi and parameter set. The length-zero element tau_x=t^(mu_x)w_x identifies x with the M-minuscule representative. Levi inclusion gives X_M(mu_x,b)_K_M→X_G(mu,b)_K.

Acceptance cases: For M=G the parameter comparison uses the same fundamental group. For sigma=id, inertia and Gamma coinvariants agree. For nontrivial sigma the equation in Gamma coinvariants can have several inertia-coinvariant lifts.

Open gates: `Q-granularity`.

#### A04 — Union of Levi images meets all components

**theorem; missing**. Source: PropositionA1.6 pp55–58.

Under V, the union over lambda∈I_mu,b,M of pi0(X_M(lambda,b)_K_M)→pi0(X_G(mu,b)_K) is surjective.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A02`, `A03`, `A10`, `A11`, `A12`, `R07`, `A30`.

Find a straight element in each saturated Iwahori component, transport it to the Newton Levi, and connect it by rank-one projective curves.

Open gates: `Q-adlv`, `Q-granularity`.

#### A05 — Every individual Levi image meets all components

**theorem; missing**. Source: TheoremA1.3 second assertion p55.

Under V, for every lambda∈I_mu,b,M, pi0(X_M(lambda,b)_K_M)→pi0(X_G(mu,b)_K) is surjective.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A04`, `A06`.

Combine union-surjectivity with independence of the chosen Levi parameter.

Open gates: `Q-granularity`.

#### A06 — Independence of Levi component image

**theorem; missing**. Source: PropositionA1.7 pp55,58–63.

Under V the image on pi0 of X_M(lambda,b)_K_M→X_G(mu,b)_K is independent of lambda∈I_mu,b,M.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A03`, `A14`, `A21`, `A15`, `A20`, `A29`, `A30`.

Join Levi parameters by irreducible root relations and construct the corrected rank-one curves for each relation.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A07 — Transitivity on ADLV connected components

**theorem; missing**. Source: TheoremA1.3 first assertion pp55–56.

Under V the group J_b(Qp) acts transitively on pi0(X(mu,b)_K).

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A05`.

Use transitivity for the basic M-minuscule ADLV from HZ20, then surject its components to G.

Open gates: `Q-adlv`, `Q-granularity`.

#### A08 — Sigma-straight affine Weyl element

**construction; missing**. Source: AppendixA2.1 p56.

An element w∈Wtilde is sigma-straight when ell(w sigma(w)…sigma^(n−1)(w))=n ell(w) for all positive n, equivalently ell(w)=<2rho,nu_w> with the dominant Newton representative and source hypotheses.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `R05`, `B02`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Define the iterated sigma product and its length growth. Compare the growth condition with the Newton pairing in the specified affine root datum. Sigma-conjugacy transport preserves the straight-class invariant in its valid form.

Acceptance cases: A dominant translation has linear length growth. The identity is straight. A positive-length finite reflection with square1 is not straight when sigma=id.

Open gates: `Q-granularity`.

#### A09 — Straight class classification

**theorem; missing**. Source: AppendixA2.1 p56.

Straight sigma-conjugacy classes in Wtilde map bijectively to B(G) through the Kottwitz and Newton invariants in the setting of AppendixA2.1.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A08`, `B02`.

Import the original straight-class classification with its representative conventions.

Open gates: `Q-adlv`, `Q-granularity`.

#### A10 — Straight element in the Newton Levi

**theorem; missing**. Source: LemmaA2.3 pp56–57.

For straight w with class [b], let u∈^J W0 be the minimal representative taking nu_w to its dominant Newton point nu_b, and set wsharp=u w sigma(u)^(-1). Then wsharp∈Omega_M for M=Z_G(nu_b).

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A08`, `A03`.

Use the nu-fundamental property, identify the conjugated Iwahori of M, and prove wsharp normalizes it.

Open gates: `Q-adlv`, `Q-granularity`.

#### R07 — Levi fundamental-group kernel

**theorem; missing**. Source: Proof PropositionA1.6 p57, corrected roots and coinvariant qualification.

For a standard Galois-stable Levi M, ker(pi1(M)→pi1(G)) is the lattice generated by the classes of simple coroots of G outside M. With the relevant finite Galois action it is a permutation lattice; verify exactness after inertia and Frobenius coinvariants before using torsion-freeness.

Prerequisites: `V01`, `R05`.

The kernel before coinvariants is Qvee(G)/Qvee(M). The Galois-stable simple-coroot complement is a permuted basis; control the preceding group-homology term.

Open gates: `Q-local`, `Q-granularity`.

#### A11 — Rank-one perfect projective curve

**construction; missing**. Source: Proof PropositionA1.6 pp57–58.

An affine-root quotient U_alpha/U_alpha+ of dimension1 and a chosen lift f_alpha give h_alpha(a)=f_alpha([a]) over perfect k-algebras. The induced affine-line map to the ind-projective flag space extends to P1^perf and has the opposite-root endpoint s_alpha I.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `G02`, `G01`, `V01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose the root-quotient lift and compose with the Teichmuller section. The rank-one Bruhat identity computes h_-alpha(infinity)=s_alpha I. Translate the curve by a loop element and compare its endpoints.

Acceptance cases: In SL2, lower-unipotent x factors through the Weyl matrix for x≠0. At a=0 the curve is the identity coset. The whole root subgroup is not contained in I s_alpha I, because it contains1.

Open gates: `Q-granularity`.

#### A12 — Root curve stays in the saturated bound

**theorem; missing**. Source: Proof PropositionA1.6 p58.

In the reduced-word construction of PropositionA1.6, each rank-one curve has relative position among wi, s wi, wi sigma(s), s wi sigma(s). These all belong to WK Adm(mu) WK.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A11`, `A01`, `A10`.

Choose g0 with g0^(-1)wsharp sigma(g0)=w. Write v=u^(-1)=s1...sn, v_i=s1...si, and g_i=g0 v_i. Then w_i=v_i^(-1)w sigma(v_i), the endpoint of the ith curve is g_i s_(i+1)=g_(i+1), and the final relative element is wsharp. Use the union I∪I s I and its four products, contained in the saturated bound.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A13 — Unramified comparison of root combinatorics

**theorem; missing**. Source: AppendixA3.2 pp58–59.

For the adjoint root data reduced to in A3, there is an unramified quasi-split comparison group whose echelonnage datum, sigma, cocharacter lattice, Levi subset, mu and Kottwitz data identify with those of G. This transports the combinatorial statements, not the geometric root groups.

Prerequisites: `V01`, `A03`.

Compare the valued affine root datum with the unramified reduced root system and keep all induced actions.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A14 — Levi root relations

**construction; missing**. Source: AppendixA3.3 p59.

For x,xprime∈I_mu,b,M, a relation indexed by alpha∈Sigma and r>0 has xprime−x=alphaVee−sigma^r(alphaVee), and mu_x, mu_x+alphaVee, mu_x−sigma^r(alphaVee), mu_xprime≤mu. It is irreducible if neither of the two displayed intermediate parameters x+alphaVee−sigma^i(alphaVee) and x+sigma^i(alphaVee)−sigma^r(alphaVee) supplies a two-step relation for any 0<i<r. The first sign is corrected from the printed A3.3.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A03`, `V01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply alpha,r, the lattice difference and each of the four stated dominance inequalities. Irreducibility excludes the two shorter intermediate relations of A3.3. Transport the relation under the root-data identification A13.

Acceptance cases: If sigma^r alphaVee=alphaVee the difference is0. A zero difference does not imply the associated orbit-norm displacement is0. Do not infer the four bounds from the lattice equality alone.

Open gates: `Q-granularity`.

#### A15 — Chains of Levi root relations

**theorem; missing**. Source: LemmaA3.4 pp59–60.

Any two parameters in I_mu,b,M are linked by relations with alpha outside M, alphaVee M-dominant and M-minuscule; if h is the number of connected components of Sigma, orbit length is h,2h or3h and r obeys the bounds of LemmaA3.4.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A14`, `A13`, `A16`.

Read Nie7.7 and its weak-dominance extension to general basic b in M. The original superbasic assumption is not silently discarded.

Open gates: `Q-nie`, `Q-granularity`.

#### A16 — Weak dominance of Levi parameters

**theorem; missing**. Source: Proof LemmaA3.4 p60; Nie18 Lemma4.1.

For each mu_x in I_mu,b,M, the inequalities <beta,mu_x>≥−1 for the relevant positive roots provide the weak-dominance input used in the extension of Nie7.7.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A03`.

Verify the actual minuscule/root hypotheses and the proof of the extension in the original source.

Open gates: `Q-nie`, `Q-granularity`.

#### R08 — Rank-one subgroup for a relative root

**construction; missing**. Source: AppendixA3.5–A3.6 pp60–61.

Choose the short relative root above an echelonnage root. Its rank-one subgroup is a restriction of scalars of SL2 in the nonmultipliable case or SU3 in the multipliable case; keep the root-field and ramified quadratic extension data.

Prerequisites: `V01`, `P03`, `P04`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Construct the root-field subgroup and its embedding into G. Identify the relevant rank-one root subgroups and valuation parameters. Transport its root elements through the chosen embedding.

Acceptance cases: Split rank one uses SL2. Ramified unitary rank one has both short and doubled relative roots. An arbitrary split SL2 matrix cannot substitute for a ramified SU3 root group.

Open gates: `Q-granularity`.

#### R09 — Unitary root coordinates

**construction; missing**. Source: AppendixA3.6 pp60–61.

For a quadratic extension Kprime/K with involution tau and anti-diagonal Hermitian form, u_i(c,d)=I+g has g_(-i,0)=−tau(c), g_(0,i)=c, g_(-i,i)=d. It lies in SU3 when tau(c)c+d+tau(d)=0.

Prerequisites: `R08`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply c,d satisfying the unitary equation and form the indicated matrix. The equation is exactly the nontrivial Hermitian-preservation entry; determinant is1. The involution and field embeddings transport the matrix and its constraint.

Acceptance cases: For tau(c)=c and p>2, d=−c²/2 satisfies the equation. c=d=0 gives identity. c=1,d=+1/2 gives residual2 and fails.

Open gates: `Q-granularity`.

#### A17 — Three root-curve models

**construction; missing**. Source: AppendixA3.7 p61, corrected unitary sign.

In the p>2 tame setting needed by A4, use SL2 f_alpha(pi^(-1)[a]); standard SU3 u_1(0,pi^(-1)[a]) with tau(pi)=−pi; and nonstandard SU3 u_1([a],−[a]²/2). Keep the two very-special parahoric choices.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `R09`, `A11`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Choose the rank-one case, lattice type and anti-invariant uniformizer. Each formula lies in the correct root group and defines the required perfect affine-line map. Embed it into LG and project to Gr_K, compatibly with perfect base change.

Acceptance cases: a=1 in the nonstandard unitary case satisfies 1−1/2−1/2=0. a=0 gives the identity in all cases. The displayed division by2 does not give a proof for wild residue characteristic2.

Open gates: `Q-granularity`.

#### A18 — Rank-two bounded double-coset estimate

**theorem; missing**. Source: LemmaA3.9(1) p61.

For roots alpha,beta generating A2, A1×A1 or A1 and cocharacters lambda,delta satisfying delta,delta+alphaVee,delta−betaVee,delta+alphaVee−betaVee≤lambda, u_alpha(z)t^delta u_beta(y) belongs to the union of L+G t^lambdaPrime L+G for lambdaPrime≤lambda, in the source rank-one coordinate setting.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A17`, `V01`.

Carry out the SL2/SU3 rank-two calculations with the corrected unitary sign and actual valuation lattice.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A19 — Integral rank-two conjugate

**theorem; missing**. Source: LemmaA3.9(2) p61.

If <alpha,betaVee>=<beta,alphaVee>=−1 and <alpha,lambda>≥2, then u_beta(z)(t^lambda u_alpha(y)t^(-lambda))u_beta(−z) lies in L+G for all y,z∈k, in the source coordinate setting.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A17`, `V01`.

Compute the commutator terms and verify every coefficient is integral.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A20 — Root curve for a short orbit segment

**theorem; missing**. Source: LemmaA3.11 pp62–63.

For an irreducible relation x→xprime as in LemmaA3.11 with 1≤r≤h and P∈X_M(mu_x,b), there is Pprime∈X_M(mu_xprime,b) in the same G-ADLV component with kappa_M(P)−kappa_M(Pprime)=sum_{i=0}^{r−1}sigma^i(alphaVee).

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A14`, `A17`, `A18`, `A19`.

Normalize b to tau_x, construct the ordered Frobenius product, use the four dominance bounds and rank-two estimate, and compute endpoint g_x t^(−sum_i sigma^i alphaVee). The r>h case is A21.

Open gates: `Q-nie`, `Q-rootcurves`, `Q-granularity`.

#### A21 — Triality curve correction

**theorem; missing**. Source: Proof LemmaA3.11 p63.

In the length-3h orbit case with r>h, use the two cases from Nie7.8. In the adjacent D4 branch reverse the root-product order as prescribed and apply A19 to the noncommuting terms to keep the curve in the bound. The result has the same connected-component and Kottwitz-displacement conclusion as A20, now for h<r≤2h−1.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A14`, `A17`, `A18`, `A19`.

Verify the central-root fixedness condition and the omitted final membership in L+G; explicitly compute the D4 case.

Open gates: `Q-rootcurves`, `Q-granularity`.

#### A22 — Good isogeny-map locus

**construction; missing**. Source: AppendixA4.1–A4.3 pp63–65.

Under the Hodge hypotheses of AppendixA4 (p>2,tame quasi-split,p-prime pi1der and connected very-special K), X(mu,b)_K^good is the locus of ADLV points whose Siegel Dieudonné image lifts to the Hodge model with the required crystalline tensors.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `M04`, `X03`, `M01`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the tensor-preserving lift of the associated Siegel point. The good locus is defined by the normalization branch and tensor condition. It is stable under the compatible tensor quasi-isogenies and reflex Frobenius.

Acceptance cases: The point1 associated with x is good. Identity quasi-isogeny preserves goodness. An unmarked Siegel point need not determine its Hodge normalization branch.

Open gates: `Q-granularity`.

#### A23 — Good locus is a union of components

**theorem; missing**. Source: Proof PropositionA4.3 p64; Zhou20 Propositions6.9–6.10.

Under AppendixA4 hypotheses, X(mu,b)_K^good is a union of connected components of X(mu,b)_K.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `A22`, `M04`.

Use the integral deformation/propagation argument and tensor-branch uniqueness; retain the original Zhou assumptions.

Open gates: `Q-isogeny`, `Q-granularity`.

#### A24 — Adapted Newton-Levi lift

**construction; missing**. Source: Proof PropositionA4.3 pp64–65; Zhou20 Definition4.6.

For a suitable point with b=tau_lambda in the Newton Levi, choose an M-valued Hodge cocharacter mu_y and an (M,mu_y)-adapted lift of its p-divisible group, over the ring of integers of a finite extension, with the prescribed tensors.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `A03`, `M04`, `P08`.

Use the located argument with the listed interfaces; the original-source and declaration-size gates remain open.

API: Supply the tensor p-divisible group, M-cocharacter filtration and adapted integral lift. Reduction returns the original Frobenius module and tensors. Rational M(Qp) modifications induce the corresponding Levi ADLV points.

Acceptance cases: An ordinary split example has its slope-preserving adapted lift. The identity modification returns the chosen lift. An arbitrary Hodge filtration need not be induced by the Newton Levi.

Open gates: `Q-granularity`.

#### A25 — Adapted-lift existence input

**theorem; missing**. Source: Proof PropositionA4.3 pp64–65.

In the setting of AppendixA4.3, Zhou6.11 and its Assumption5.12 produce the required M-valued Hodge filtration and adapted lift.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `A24`.

Verify Assumption5.12 in the precise very-special situation and use the original deformation theorem.

Open gates: `Q-display`, `Q-granularity`.

#### A26 — Rational Levi modifications meet its components

**theorem; missing**. Source: Proof PropositionA4.3 p65; Zhou20 Propositions6.5,5.19.

The map M(Qp)/Mcal(Zp)→X_M(lambda,b)_K_M obtained from an adapted lift lands in the good locus and induces a surjection on connected components.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A24`, `A25`, `A03`.

Compare Tate-lattice modification and the tensor Dieudonné lattice; apply the original component-surjectivity result.

Open gates: `Q-adlv`, `Q-granularity`.

#### A27 — Very-special isogeny map

**theorem; missing**. Source: PropositionA4.3 and TheoremA4.5(1) pp64–65; main Theorem2(1).

Under AppendixA4 hypotheses, the Siegel Dieudonné map uniquely lifts to i_x:X(mu,b)_K(Fpbar)→S_K(G,X)(Fpbar), preserving crystalline tensors and commuting with Phi=(b sigma)^r. It yields the I_x(Q)-orbit bijection M18 onto the isogeny class, equivariant for G(A_f^p).

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `A23`, `A26`, `A05`, `M18`.

The good locus is a union of components and meets every component via any Levi parameter, so it is all X. Apply Zhou Assumption6.17 and the isogeny-class theorem.

Open gates: `Q-isogeny`, `Q-granularity`.

#### A28 — Very-special CM reduction theorem

**theorem; missing**. Source: TheoremA4.5(2) p65.

Under AppendixA4 hypotheses, every isogeny class at connected very-special level contains a point which is the reduction of a special point of the generic Shimura variety.

H: (G,X) is Hodge type, p>2, G_Qp is quasi-split and splits tamely, p does not divide |pi1(Gder)|, pi1(G)_I is torsion-free; levels away from p are sufficiently small. Use connected full facet stabilizers. Set mu=sigma(mu_h^(-1)) and k=Fpbar. AppendixA4 uses its explicitly weaker chosen-connected-very-special hypothesis; a theorem with a named remaining input is conditional until that input is proved.

Prerequisites: `A27`, `M16`.

Use the now-verified isogeny-map assumption in Zhou’s special-lift theorem. Unlike H, this local-level statement only needs the chosen full fixer connected, not torsion-freeness of all pi1(G)_I.

Open gates: `Q-isogeny`, `Q-granularity`.

#### A29 — Reduction to irreducible relations

**theorem; missing**. Source: Proof LemmaA3.11 p62; Nie18 Lemmas7.5,7.15.

To prove the component-connection assertion for arbitrary relations in A14, it suffices to prove it for irreducible relations and one point per relevant Levi component, using J_b-transitivity and composition of the Kottwitz displacements.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `A14`.

Read the original refinement argument; split each of the two possible shorter relations and show termination in r.

Open gates: `Q-nie`, `Q-granularity`.

#### A30 — Adjoint-simple reduction of component propositions

**theorem; missing**. Source: AppendixA1.8 p56.

The proofs of PropositionsA1.6 and A1.7 reduce to adjoint Qp-simple G by the central-quotient and product comparisons of HZ20 §6, with all component and Kottwitz fibers compared.

V: G/Qp is connected reductive and quasi-split, K is a sigma-stable very special parahoric, mu is dominant and [b] belongs to B(G,mu); no global Shimura hypotheses unless explicitly added. The announced general AppendixA1 theorem retains the dyadic/wild root-curve proof gate; the global application is p>2 and tame.

Prerequisites: `B02`, `X01`.

Close the original HZ central-isogeny/component argument; this does not make the general component theorem a definition.

Open gates: `Q-adlv`, `Q-granularity`.

### Source-issue register awaiting independent review

#### E1 — misprint

Published2024 §2.1 p6, definition of deperfection. Affects: **nothing**.

Printed: “with Y an algebraic space of finite presentation”.

Correction: The finite-presentation condition is on Y0, the deperfection, not on Y.

Reason: The previous sentence defines pfp Y as a perfection of a finite-presentation Y0; affine-line perfection need not itself be finite type.

Existing correction: new.

#### E2 — error

Published2024 Lemma2.1.6 proof p8; also arXivv4 PDF9. Affects: **the proof**.

Printed: “B is isomorphic to the integral closure of A0 inside of A”.

Correction: Only embed B, the normalization in Frac(A0), into normal A=A0^perf; use A0⊂B⊂A to conclude B^perf=A.

Reason: For A0=k[t], B=A0 while every element of A=k[t^(1/p^infinity)] is integral over A0. Thus the integral closure inside A is A, not B.

Existing correction: new.

#### E3 — gap

Published2024 Lemma2.1.7 proof p8; arXivv4 PDF10. Affects: **the proof**.

Printed: “injective on k-points, and hence universally injective”.

Correction: Use the same argument after every algebraically closed field extension, or establish radiciality via the perfection comparison.

Reason: The field k here is merely perfect. Rational-point injectivity alone does not imply universal injectivity; Spec F_(p²)→Spec F_p has no F_p-points but is not radicial.

Existing correction: new.

#### E4 — error

Published2024 Lemma2.1.10 p9; arXivv4 PDF11. Affects: **a stated result**.

Printed: “Dim X + d = Dim Y”.

Correction: Dim X = Dim Y + d.

Reason: The perfectly smooth map (A1)^perf→Spec k has source dimension1, target dimension0 and fiber dimension1. The printed equality gives2=0.

Existing correction: new.

#### E5 — misprint

Published2024 Lemma2.1.10 proof p9; arXivv4 PDF11. Affects: **the proof**.

Printed: “going down holds for O_X,x → O_Y,y”.

Correction: The ring map is O_Y,y→O_X,x. For the dimension proof use compatible smooth charts rather than unproved flatness of an arbitrary deperfection.

Reason: A morphism X→Y induces the opposite-direction local ring map.

Existing correction: new.

#### E6 — misprint

Published2024 Lemma2.1.12 and proof2.1.13 p9; arXivv4 PDF11. Affects: **a stated result**.

Printed: “for some positive integer d_y”.

Correction: Use nonnegative integers for algebraic-space relative dimensions.

Reason: An identity map is weakly perfectly smooth of relative dimension0.

Existing correction: new.

#### E7 — gap

Published2024 Lemma2.1.13 proof p9; arXivv4 PDF11. Affects: **the proof**.

Printed: “U_y ∩ U_yprime is non-empty because Y is connected”.

Correction: Use the locally constant dimension function; distinct nonempty value fibers would disconnect Y.

Reason: For the connected reducible affine cross Spec k[x,y]/(xy), D(x) and D(y) are disjoint nonempty opens. Its perfection has the same topology.

Existing correction: new.

#### E8 — misprint

Published2024 §2.2.5 p12; arXivv4 PDF15. Affects: **nothing**.

Printed: “the standard Iwahori subgroup ... contains a very special parahoric subgroup”.

Correction: The standard Iwahori is contained in a very special parahoric.

Reason: For split GL2, the upper-triangular-mod-p subgroup is properly contained in GL2(Zp). The Weyl-index convention J⊂K used elsewhere agrees with this direction.

Existing correction: new.

#### E9 — misprint

Published2024 Lemma2.3.9 proof p21, first display. Affects: **the proof**.

Printed: “[M_I^(1-rdt) / Ad_sigma H_m] = Sht_I,mu^(mprime,1)”.

Correction: Remove the final equality; pass from the H_m quotient to the L^mprime G_I quotient by the additional kernel gerbe.

Reason: The next display of the proof explicitly constructs that nontrivial kernel gerbe. The two quotient stacks are not identified merely by having a surjective group map.

Existing correction: new.

#### E10 — error

Published2024 §2.4 after Lemma2.4.5 p24, sigma-conjugacy diagram. Affects: **the proof**.

Printed: “bprime = g^(-1)b sigma(g); beta0 maps to g beta0”.

Correction: Transport beta0 to g^(-1)beta0 (and sigma*beta0 accordingly); then the new constant shtuka is bprime.

Reason: The new Frobenius is beta0^(-1)g bprime sigma(g)^(-1)sigma(beta0), equal to the old one. Using g beta0 instead fails for b=diag(1,2), g upper-unipotent and sigma=id.

Existing correction: new.

#### E11 — error

Published2024 Remark3.1.8 p28, citing XZ17 Proposition7.2.4 and SYZ21 Theorem4.4.3. Affects: **the proof**.

Printed: “the square in [XZ17, top of page 113] does not commute”.

Correction: Use Hoff23 Corollary2.57 with Assumption2.28 and normalization comparison, or a separately verified corrected SYZ argument.

Reason: The paper explicitly reports the failed diagram. The relocated SYZ erratum §1 confirms the analogous noncommutative diagram on publishedp3191 and replaces the local argument.

Existing correction: Already recorded in van Hoften Remark3.1.8 and Shen–Yu–Zhang erratum §1, https://www.mcm.ac.cn/people/members/202507/P020251203332408071053.pdf; textual correction read in full..

#### E12 — misprint

Published2024 §3.1.9 p29, isogeny definition. Affects: **nothing**.

Printed: “D_x[1/p] → D_xprime[1/p]”.

Correction: For A_x→A_xprime use the contravariant arrow D_xprime[1/p]→D_x[1/p], pulling s_alpha,0,xprime to s_alpha,0,x.

Reason: The paragraph explicitly defines D as contravariant, and the printed tensor direction goes from xprime to x.

Existing correction: new.

#### E13 — gap

Published2024 Proposition3.1.12 proof p31, GL diagram. Affects: **the proof**.

Printed: “GL(direct_sum_i=1^r Lambda_i,p) → GL(direct_sum_i=1^s Lambda_i,p)”.

Correction: Restrict the right column to automorphisms compatible with the lattice chain and retained subchain, then define restriction.

Reason: A general automorphism of a larger direct sum need not preserve the smaller direct sum, and its principal block need not be invertible. The actual quasi-isogeny is chain-compatible, so that narrower diagram is available.

Existing correction: new.

#### E14 — error

Published2024 Lemma4.1.6 proof footnote22 p39. Affects: **the proof**.

Printed: “its perfection is finite”.

Correction: Its perfection is integral and affine and perfectly finite; ordinary finite is not automatic. The quasi-affineness consumer can use the affine pullback of the ample line.

Reason: For odd p, k[t]→k[x], t=x², is finite. On perfections, the odd eigenspace over k[t^(1/p^infinity)] contains x^(1/p^n) with positive valuations1/(2p^n) tending to0. A finite set of generators has a positive lower bound, impossible. This refutes the general implication, not independently the specific Shimura map.

Existing correction: new.

#### E15 — misprint

Published2024 Lemma4.1.6 proof p39, paragraph after Claim4.1.7. Affects: **nothing**.

Printed: “It suffices to show that fprime has finite fibres”.

Correction: The remaining goal is finite fibers for f; fprime is already finite.

Reason: The displayed union decomposes a fiber of f into fibers over the finitely many points of a fiber of fprime.

Existing correction: new.

#### E16 — error

Published2024 Corollary4.2.3 proof p42; arXivv4 PDF50. Affects: **the proof**.

Printed: “lambdaHat is weakly perfectly smooth of relative dimension 0”.

Correction: Its relative dimension is dim G_I. Use this value in Lemma2.1.20.

Reason: With dim ShStar=dim Mloc=d, the quotient formula d=d+n−dim G_I forces n=dim G_I. The final KR dimensions ell(w) remain unchanged after repair.

Existing correction: new.

#### E17 — error

Published2024 §4.3.12–Proposition4.3.13 p47. Affects: **a stated result**.

Printed: “Fix an identification G tensor A_f^p ≃ H tensor A_f^p and an inner twisting”.

Correction: Require compatibility of the local identifications with the global inner twisting on the abelianized center complex (up to inner automorphism suffices).

Reason: Take G=H=Gm and global identity twisting, but invert only the Q_3 factor of A_f^p for p=5. The diagonal rational element2 maps to1/2 at3 and2 elsewhere, which is not a diagonal rational element. HZZ5.2.6(3) supplies the needed compatibility in the actual application.

Existing correction: new.

#### E18 — misprint

Published2024 AppendixA1 p54; arXivv4 PDF64. Affects: **a stated result**.

Printed: “lambda − lambdaPrime can be written as a sum of positive coroots”.

Correction: Use lambdaPrime−lambda for lambda≤lambdaPrime, allowing the zero sum.

Reason: The following identity Adm(mu)={lambda:lambda≤mu} and the Schubert Bruhat order require the usual bounded dominance orientation. In rank one 0≤alphaVee.

Existing correction: new.

#### E19 — misprint

Published2024 AppendixA2.1 p56. Affects: **nothing**.

Printed: “nu_w := t^lambda / n”.

Correction: Use nu_w=lambda/n in X_*(T)_(I,Q).

Reason: t^lambda is an affine-Weyl translation, not an element of the rational cocharacter vector space to be divided by n.

Existing correction: new.

#### E20 — misprint

Published2024 Proof PropositionA1.6 p57. Affects: **nothing**.

Printed: “u w sigma(u) = wsharp”.

Correction: Use u w sigma(u)^(-1)=wsharp.

Reason: This is the definition in LemmaA2.3 immediately preceding the proof.

Existing correction: new.

#### E21 — misprint

Published2024 Proof PropositionA1.6 p57. Affects: **the proof**.

Printed: “simple roots contained in M but not in G”.

Correction: Use the classes of simple coroots of G outside M to generate ker(pi1(M)→pi1(G)).

Reason: M is a Levi subgroup of G, so it has no simple roots outside G; the kernel is Qvee(G)/Qvee(M).

Existing correction: new.

#### E22 — misprint

Published2024 Proof PropositionA1.6 p57, Kottwitz class comparison. Affects: **the proof**.

Printed: “the image of [b]_M ... in pi1(M)_I”.

Correction: The Kottwitz invariant of a sigma-conjugacy class belongs to pi1(M)_Gamma. Perform the torsion-kernel argument after the necessary sigma coinvariants, retaining the exactness check.

Reason: For the unramified degree2 induced torus, sigma swaps Z². Representatives1 and h^(-1)sigma(h) can have inertia Kottwitz values(0,0) and(−1,1), although they are sigma-conjugate. Their Gamma classes agree.

Existing correction: new.

#### E23 — misprint

Published2024 Proof PropositionA1.6 p58, choice of g0. Affects: **the proof**.

Printed: “g0^(-1) wsharp g0 = w”.

Correction: Use g0^(-1) wsharp sigma(g0)=w.

Reason: The point lies in the sigma-conjugacy ADLV; ordinary conjugacy is not supplied by the cited straight-element theorem.

Existing correction: new.

#### E24 — misprint

Published2024 Proof PropositionA1.6 p58, definition of w_i. Affects: **the proof**.

Printed: “w_i := u_i^(-1) wsharp sigma(u_i)”.

Correction: Use w_i=u_i^(-1) w sigma(u_i) after choosing g0 with g0^(-1)wsharp sigma(g0)=w and g_i=g0 u_i.

Reason: Substitution gives g_i^(-1)wsharp sigma(g_i)=u_i^(-1)w sigma(u_i).

Existing correction: new.

#### E25 — error

Published2024 Proof PropositionA1.6 p58. Affects: **the proof**.

Printed: “U_(-alpha_(i+1)) is contained in I s_(i+1) I”.

Correction: Use U_(-alpha)⊂I union I s_alpha I, or restrict the nonzero parameter when using the second cell.

Reason: The root subgroup contains1 and1 is not in the nonidentity Bruhat double coset. The subsequent four-coset union already accommodates the repaired inclusion.

Existing correction: new.

#### E26 — misprint

Published2024 AppendixA3.3 p59. Affects: **the proof**.

Printed: “x − xprime = alphaVee − sigma^r(alphaVee)”.

Correction: Use xprime−x=alphaVee−sigma^r(alphaVee), consistently with the displayed intermediate parameters and the endpoint in LemmaA3.11.

Reason: The first alleged shorter step is x→x+alphaVee−sigma^i(alphaVee). With the printed difference it has the opposite sign. The endpoint g_x t^(−sum sigma^i alphaVee) changes the Levi Hodge class by +alphaVee−sigma^r alphaVee.

Existing correction: new.

#### E27 — misprint

Published2024 AppendixA3.5 p60. Affects: **nothing**.

Printed: “If alphaBar is divisible”.

Correction: For the chosen short relative root, distinguish multipliable (2alphaBar a root) from nonmultipliable.

Reason: In the BC1 relative root system the short root e is not divisible, but2e is a root and the rank-one group is SU3; the printed SL2/SU3 dichotomy uses the opposite terminology.

Existing correction: new.

#### E28 — error

Published2024 AppendixA3.7(3) p61; arXivv4 PDF71. Affects: **a stated result**.

Printed: “u_1([a], [a]^2/2)”.

Correction: Use u_1([a], −[a]^2/2) for the stated Hermitian form and tau fixing [a].

Reason: At a=1 the printed unitary equation tau(c)c+d+tau(d)=0 reads1+1/2+1/2=2. The corrected negative sign makes it0.

Existing correction: new.

#### E29 — gap

Published2024 AppendixA3.6–A3.9 pp61–62, applied to the full generality of A1.3. Affects: **the proof**.

Printed: “Let pi ... be a uniformiser, such that tau(pi) = −pi”.

Correction: For the p>2 tame application state these restrictions. To prove the announced all-quasi-split local theorem, supply the dyadic/wild rank-one models or an independent argument.

Reason: The formulas divide by2 and choose an anti-invariant uniformizer in a ramified quadratic extension. Such a uniformizer need not exist for a dyadic ramified quadratic extension, e.g. the ramified unit extension Q2(sqrt(3))/Q2 where trace-zero elements have even normalized valuation.

Existing correction: new.

#### E30 — misprint

Published2024 Proof LemmaA3.11 p62, endpoint limit. Affects: **the proof**.

Printed: “product_i t^(sigma^i(alphaVee))”.

Correction: The first endpoint expression must use t^(−sigma^i(alphaVee)), consistently with the next equality g_x t^(−sum_i sigma^i(alphaVee)).

Reason: The unipotent factors tend to1, so a product of positive translations cannot tend to the negative translation displayed on the next line.

Existing correction: new.

#### E31 — misprint

Published2024 Proof LemmaA3.11 p63, triality paragraph. Affects: **nothing**.

Printed: “beta with sigma^h(beta)”.

Correction: Complete the condition as sigma^h(beta)=beta for the central root.

Reason: A condition lacks its relation and right-hand side; the central vertex of D4 is fixed by triality.

Existing correction: new.

#### E32 — misprint

Published2024 Proof LemmaA3.11 p63, display after LemmaA3.9(2). Affects: **nothing**.

Printed: “u_(sigma^(r−h)(alpha))(−c2z) (t^lambda u_(sigma^r(alpha)+sigma^r(beta))(c1 z)t^(−lambda)) u_(sigma^(r−h)(alpha))(c2z)”.

Correction: Append membership in L+G to this displayed expression.

Reason: LemmaA3.9(2) is invoked precisely to absorb this factor into the integral positive loop group; the display otherwise states no assertion.

Existing correction: new.

#### E33 — gap

Published2024 §3.1.7 p28, import of Hoff23 Corollary2.57. Affects: **the proof**.

Printed: “is perfectly smooth by [Hof23, Corollary 2.57]”.

Correction: Retain Hoff Assumption2.28 and identify the normalization of the restricted shtuka target, or cite a proof discharging both under the present hypotheses.

Reason: Hoff v1 p25 explicitly states the tensor-compatibility assumption, p35 assumes it before the theorem, and p30 Remark2.40 warns that its restricted-shtuka normalization differs from SYZ. The source excerpt does not spell out these bridges.

Existing correction: Hoff23 Assumption2.28 and Remark2.40 explicitly flag the inputs; later KPZ local-model tangent arguments are a candidate discharge that must be checked, not assumed..

#### E34 — error

Published2024 Proof PropositionA1.6 p58, reduced word and endpoints. Affects: **the proof**.

Printed: “g(infinity) = g_i s_(i+1) I = g_(i+1) I”.

Correction: Write v=u^(-1)=s1...sn and v_i=s1...si, and set g_i=g0 v_i. Then g_(i+1)=g_i s_(i+1), and the final sigma-conjugate is u w sigma(u)^(-1)=wsharp.

Reason: The printed prefixes u_i=si...s1 multiply new reflections on the left, while the curve endpoint multiplies on the right. Also g0 u transports w to u^(-1)w sigma(u), not to wsharp. Noncommuting simple reflections in S3 detect the order mismatch.

Existing correction: new.

The common correction search examined the Cambridge article and listing, the latest arXiv history and selected v4 formulas, the author publication page, and targeted erratum searches on 22 September 2026. Exact locations and any known repair are repeated in each JSON entry. No finding has an independent review verdict yet.

### Remaining closure work

- **Q-perfect**: Read the full original BGA18/Zhu17/BS17 perfect-space and descent proofs; split chart descent, radiciality, pfp closed immersions and dimension/normality arguments. Repair every source issue before use.

- **Q-restricted**: Close the equal-band gerbe construction, action truncation, outer-parahoric square and dimension computation of2.3.4; give actual maps for every quotient and compare all conventions.

- **Q-newton**: Read FS21 I.2.1 and RR96 in full with their perfect-base and topology hypotheses; prove local quasi-isogeny existence and the locally profinite automorphism sheaf.

- **Q-display**: Read original Lau18/Gabber, Zhou20 §§3–6 and integral comparison inputs; close M-adapted lifts and all required tensor-integrality assertions.

- **Q-hoff**: Discharge Hoff23 Assumption2.28 under the actual group/type/prime hypotheses and construct the normalization equivalence of Remark2.40; independently verify the SYZ erratum if that alternate proof is chosen.

- **Q-model**: Reconcile KP18/Pap22/PR21/DvHKZ integral and perfect-shtuka comparisons, normalization branch uniqueness and smooth local-model maps using their corrected original proofs.

- **Q-isogeny**: Read RZ6.13 and Zhou20 component propagation, lattice-chain extension, Assumptions5.12/6.17 and isogeny-class proofs. Split every tensor realization and finite-field descent step.

- **Q-local**: Close Kottwitz invariant/coinvariant exactness, Lang surjectivity for connected parahorics, full-fixer comparisons, z-extensions and the simply connected rational quotient.

- **Q-adlv**: Read full He14/He16/HZ20/HV18/ZZ20 nonemptiness, straight-class classification, representability and component arguments; do not treat prior paper checkpoints as proof.

- **Q-rootcurves**: Prove corrected SL2/SU3 and rank-two identities, all D4 triality cases, corrected word order and endpoint signs; provide dyadic/wild replacements for the announced general AppendixA1 theorem.

- **Q-nie**: Read original Nie18 §§4–7 and CKV15 with its corrigendum. Verify the claimed extension from superbasic M to weakly dominant Levi parameters, every relation bound and the irreducibility reduction.

- **Q-line**: Close Hodge-line ampleness after Zarhin enlargement, its descent to the restricted shtuka stack, SYZ torsion and perfect-space affine-pullback/quasi-affineness criteria.

- **Q-components**: Read MP19 generic-special pi0 comparison, the integral connectedness hypotheses and the precise He–Rapoport incidence inputs. Verify component formulas under compatible basepoints.

- **Q-basic**: HZZ21 PDF38–43 read. Read the rest of its perfect-scheme uniformization proof and its original Kisin/Zhou inputs, including the single-basic-isogeny-class torsor argument.

- **Q-cohom**: Bor20 complete answer read and Borovoi98 source statements carried from Kisin17. Close original crossed-module comparison and Kneser–Harder–Chernousov Hasse principle; enforce inner-compatible local identifications.

- **Q-approximation**: Close strong approximation for I_x^sc, closed adelic images and countable inverse-limit compactness. Keep finite-level and full-tower action statements separate.

- **Q-incidence**: Read WZ18 Proposition6.20 and Andreatta21 comparison with exact hypotheses; do not assert Conjecture4.3.1 in general.

- **Q-monodromy**: Read van Hoften24 ordinary Hecke orbit Theorem3.4.1, its Hypothesis2.3.1/Remark2.3.3 and normality assumptions; track Q-simple factors and the finite set Sigma.

- **Q-main**: Split the final Cartesian/isogeny and He–Rapoport arguments to declaration size, verify each level transition and Frobenius action, and close the dependent source gates.

- **Q-granularity**: All67 main-paper pages are read and each named main result and central construction is indexed. Some cited compound inputs and multi-page proofs are still bundled. Complete recursive declaration-sized closure, exact quotient diagrams and API lemma promotion before status complete.

### Provenance and verification

The JSON input manifest records 371 repository blobs at `4e324e26a67fb00e019d0a293160ce784680d027`, including reviewed coverage, stages, packets, reserved ids and prior paper candidates. Source archives record their URL, digest, access date and actual reading scope. Invalid or unread downloads are not evidence for a theorem.

All 193 item ids are unique; 165 missing items each have exactly one route. The internal dependency graph was checked for unresolved references and cycles. Every definition/construction has at least three API statements and three mathematical test specifications. Pinned module hashes and source/archive hashes are verified by the scratch verifier. The paper schema and deliverable-path checks are run before publication. Exact rational/integer diagnostics check the unitary sign, SL2 factorization, conjugacy transport, dimensions, coinvariants, relation direction, word order and small counterexample witnesses. These diagnostics are not Lean theorem checks.

## Independent review (cc-fb70e5, 23 September 2026)

**Accept.** All ten routes accepted, no substantive coverage gap, all 34 recorded findings confirmed, one
item locator corrected in place, one new finding added. The full review is in
[`reviews/REV-PAPER-VANHOFTEN-24.md`](../reviews/REV-PAPER-VANHOFTEN-24.md).

The recorded published-PDF hash does not reproduce, and cannot: **Cambridge Core watermarks every download**
with the downloader's IP address and a timestamp, so those bytes differ per reader. Content checks out (67
pages from the page tree's `/Count`, correct title and abstract), and the arXiv v4 e-print — which the
extraction records no hash for — is `f6b56838…`.

This paper's numbering is unusual and had to be simulated to check anything: statements share the
**`subsubsection`** counter, so a bare heading consumes a number like a theorem does, while the appendix
environments share the **`subsection`** counter. That gives **146 numbered objects = 80 statements + 66 bare
headings**, and it returns the number *and* the kind of every statement the findings cite. It is also what
produced the one defect found here: item **R02** was located at `Lemma2.2.3`, but "Lemma 2.2.3" occurs zero
times in the paper — 2.2.3 is one of those numbered paragraphs, and R02's statement is **Lemma 2.2.2**.
Corrected in place. Coverage is then 78 of 80 statements, the residue being Proposition 2.2.17 (close to item
S08) and Remark A1.4.

The reference audit is clean: **216 hand-written word+reference citations with no word/environment mismatch**,
no duplicate labels, no undefined references — this paper uses no cleveref, so the mismatch class was live
here and simply does not occur. All **23 pinned declarations verify** at the recorded commits, each
`statementRead` byte-identical to its source line range; the recorded `sha256` is the **whole-module** hash,
which matches (declarations sharing a file share a hash, so assuming the obvious per-declaration convention
reports seventeen false mismatches). All four Part II routes reuse identities already proposed by
neighbouring papers — Kisin, Kisin–Pappas, Kisin–Zhou, Zhu, He, Gleason–Lim–Xu — under recorded parents, and
Appendix A is routed to the affine Deligne–Lusztig Part II rather than the Shimura-variety one, which is
where an ADLV result belongs.

All 34 findings are confirmed. **E30 is the one worth flagging: it exists only in the published version.**
Cambridge's p. 62 adds an intermediate limit expression, absent from arXiv v4, whose product carries
$\dot t^{\sigma^i(\alpha^\vee)}$ with positive exponents while the very next equality gives
$\dot t^{-\sum_i \sigma^i(\alpha^\vee)}$ — a reviewer checking that finding against the preprint alone would
reject it wrongly. **One finding is added, E35**: in the diagram of Proposition 3.1.12's proof the vertical
arrow command sits inside the `\left(...\right)` pair of $\operatorname{GL}(\bigoplus\Lambda_{i,p})$, and the
two parentheses of that column consequently print at different sizes. Typographic only, in the same diagram
that E13 is about.
