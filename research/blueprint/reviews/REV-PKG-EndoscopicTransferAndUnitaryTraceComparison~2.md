# Independent fixing review: Endoscopic transfer and unitary trace comparison

Job `REV-PKG-EndoscopicTransferAndUnitaryTraceComparison~2`, issue #9868. Reviewer: Codex, session `codex-axYnXd`, 15 October 2026. The reviewed revision is the package revision from #9867 / PR #9870, commit `b40f25593`. This session wrote neither package version and did not conduct the first package review.

## Verdict: needs_changes

The corrections described below are applied to the package. One specific proof dependency remains open: **§8.14's structured CM realization, used by §8.15, needs a polarized lift with the additional commutative endomorphism action and the prescribed embeddingwise PEL Lie multiplicities.** A rational CM lift up to isogeny does not supply those integral Lie data. The README now marks this gap explicitly instead of retaining the unexplained `G4b` boundary or asserting that ordinary PEL smoothness resolves it.

This is a completed fixing review with an unresolved mathematical input, not an acceptance and not an unfinished review checkpoint. The suggested Lean file elaborates successfully; that result does not establish the missing theorem.

## The remaining input and how to close it

The exact target is `CMIsogenyLift.pelRealization` in §8.14. In Shin's unramified simple PEL setting, take an abelian variety with B-action, an integral O_B-linear identification of its p-divisible group with the fixed Σ, and a maximal commutative semisimple F-subalgebra N of End⁰_B(A), with the real/CM factors specified in Lemma 11.1. One needs a positive (B⊗_F N,∗⊗c)-polarization and a rational paired B⊗_F N-module W₀ realizing both the prime-to-p Tate pairing and the given real paired B-module V. In the proof, the real signature is recovered from the embeddingwise Lie ranks through formula (35).

I read [Shin, *Counting points on Igusa varieties*](https://math.berkeley.edu/~swshin/IgusaVar.pdf), Lemma 11.1 and its proof, pp. 36–37, including the factorwise splitting/Morita step and (35). The proof invokes Harris–Taylor, pp. 170–171, for the structured characteristic-zero lift. That book is not among the cleared sources available for this run; no other copy was fetched. The defect is the missing construction and its hypotheses, rather than the mere presence of a book citation.

I also read [Tate's Honda exposition](https://numdam.org/item/SB_1968-1969__11__95_0.pdf), §3, Theorem 2, p. 102, and Lemmas 3–6, pp. 101–105. These give the weaker CM reduction/isogeny route: choose the CM type with the required p-adic multiplicities, construct and algebraize the complex torus, descend it, obtain potential good reduction, and compare slopes and Frobenius powers. They do not assert a lift of the prescribed integral PEL object or preserve its embeddingwise Lie ranks. The README now gives that weaker target separately as `CMIsogenyLift`; it permits a finite extension and does not promise a principal polarization or a lift of the full endomorphism algebra.

The cancellation argument is a different assertion. [Kottwitz, *Points on some Shimura varieties over finite fields*](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf), Lemma 13.1, pp. 415–416, and Lemma 13.2, pp. 417–418, first proves independence from the rational comparison space and compatible positive polarization, then computes on a weaker CM isogeny lift. The global p and infinity contributions are −μ and μ; they cancel in the global dual-torus group, without either local term being zero. That calculation does not manufacture the stronger PEL realization. Kottwitz Lemma 9.2, p. 402, and Lemmas 17.1–17.2, pp. 434–435, supply the positive-polarization and cohomological twisting arguments used elsewhere in §8.14, but likewise do not replace this Lie-compatible lifting step.

To close the finding, supply a proof of the structured lifting lemma after the specified splitting and Morita reduction, including the compatible N-action, positive polarization, preservation of the integral O_F Lie ranks, and algebraization. It may use a cleared reading of the cited Harris–Taylor argument or an accessible proof with exactly these hypotheses. Alternatively, prove the paired realization directly with the same real and finite local conditions. A claim that rational isogeny preserves the Lie signature, or that smoothness of the O_B-PEL problem automatically lifts the extra N-action, is insufficient. The existing current roadmaps/library were searched for this stronger input; none was found. The rest of §8.15 must continue to depend on the marked gap until this is done.

## Scope, shape and ownership

I read WORKERS.md, PACKAGE_REVIEW.md, the relevant blueprint and expansion protocols, UPSTREAM_GUIDE.md, the previous fixing review, and the revision's response ledger. ReductiveGroups and RepresentationTheory.SemisimpleAlgebras were the two upstream README form comparisons. I inspected the accepted ET.0, ET.4, ET.5, ET.6 and ET.6a packets without editing them.

The package retains the mathematical topics of all 210 packet nodes in 211 numbered sections over 15 layers, including the revision's prerequisite targets. The packet API inventory has 420 entries. Four generic aliases are deliberately retired in this review in favour of existing ownership: `TauCeti.orbitalIntegral`, `TauCeti.normalizedOrbitalIntegral`, `TauCeti.pseudoCoefficient`, and `TauCeti.trace_pseudoCoefficient`. Thus 416 entries remain local or specialized interfaces, and four are supplied through the stated boundary. The orbital aliases must be checked as complete identifiers: a substring search would incorrectly count `kappaOrbitalIntegral` as retaining the generic orbital integral. All 271 named packet checks (268 distinct names) are still represented by their full name or the same leaf name in its section. Definition/construction interfaces have at least three discriminating checks; several inline interfaces needed explicit additional checks in this review.

The README carries the heavy definitions, theorem hypotheses, proof routes and source locators. Suggested.lean has 311 lines and ten light real-bodied definitions; no sorry'd carrier, data definition, construction chain or `True` placeholder was introduced. Heavy README objects are named in its closing comment. Metadata remains the fitting single line `topic = "math.NT"`.

For current ownership I used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as well as the pinned library APIs and the reviewed coverage file. I checked the nine roadmaps newer than the atlas snapshot and the four named Completed roadmaps. Searches used objects and their fields/operators, including centralizers, cohomology actions, isocrystals, moduli conditions, exact Grothendieck groups, and CM lifting, rather than only target spellings. No Lake command ran in either read-only checkout.

The following ownership corrections are applied:

- Generic group orbital integrals and pseudo-coefficient existence/trace are already AutomorphicSpectralTheory §§6.9, 6.18–6.19. They are now boundary inputs. §2.1 keeps centralizer measure transport and Lie descent; §2.10 keeps the averaged Euler–Poincaré elliptic orbital formula, stating its difference from the imported existence theorem.
- §1.12 now owns the **integral** z-extension of a reductive model over Z_(p), including induced-torus kernel, simply connected derived group and base-change compatibility. It no longer re-plans Lang's theorem or the rational Kottwitz-kernel statement.
- SmoothRepresentationsOfLocalGroups §SR.5.2 owns the classical LLC statement. Layer 10 here constructs the trace parameter and proves comparison with that input, using the explicit normalization `C_geo(π)=C_ar(π)∨`. The distinction between a fixed representation's inverse Frobenius and a dual correspondence is made explicit, including §15.3.
- Existing Satake, multisegment classification, ExactK0, and the relevant Fargues–Fontaine geometry remain imports. The packet's obsolete Zelevinsky name maps to SR.5.3; no replacement local classification is introduced.

The final local Needs graph has 211 vertices and 710 distinct section edges, with no cycle and no unresolved local section. Qualified external section numbers were excluded from this graph. The 33 backticked external roadmap names were checked against their suppliers and the tier order: they are current/upstream or lower-tier inputs, not upward references. The target is tier 14. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder is used as a supplier. The marked CM gap is a semantic missing proof, so an acyclic graph does not resolve it.

## Corrections and adversarial pass

The pass covered all layers, including the theorem hypotheses and conventions. This table records the instances that decided corrections or checked particularly fragile interfaces; it is not a claim that elaboration proves the general statements.

| Layer / locations | Instances and calculation | Result applied or confirmed |
| --- | --- | --- |
| 1, §§1.1, 1.4, 1.6–1.7 | Trivial crossed-module source; θ inversion on G_m with H=1; GL₃ eigenvalues 1,2,3 versus their reciprocals; composition of two inner twists | Require the Picard/symmetric structure for the abelian group claims; define Out through its image; separate ordinary inverse-s data from twisted ω; compose cocycles by transport, not an unsupported product in nonabelian H¹. A sufficiently large z-extension is required for the L-embedding. |
| 1, §§1.12–1.18 | GL_n identity z-extension; GL₂→PGL₂ with G_m kernel versus SL₂→PGL₂ with μ₂ kernel; U(2,1) diagonal torus; GL₂ Levi; split quadratic algebra | Integral z-extension hypotheses and three negative controls replace duplicate rational targets. The real stable-class kernel is a pointed subset, not necessarily a group. Levi-to-G preserves the regular centralizer kernel here. Add explicit global-obstruction and unitary-centralizer APIs and split-factor checks. |
| 2, §§2.5, 2.7–2.9 | κ of order three; one symmetric restricted root of type R₃; empty correction set; nonmatching characteristic polynomials with nonzero discriminants | Unprimed factors transport by positive κ, primed by its inverse. The splitting-invariant correction is the specified quadratic-sign product, not a universal −1. Global product pairing follows the same convention. Add the nonmatching-factor zero check. |
| 2, §2.10 | SL₂ with trivial coefficient/representation; compact and trivial group cases | Restore (−1)^q(G) in the Euler–Poincaré trace API; remove duplicate pseudo-coefficient ownership. |
| 3, §§3.4, 3.7–3.8 | Torus e=0; SL₄ in characteristic 5; P¹ with O(−1)↪O; split spectral roots and a zero characteristic | Use a graded complement for the Kostant slice, not e+g^f in every allowed characteristic. For SL₄, the proposed sl₂ slice gives x⁴−10tx²+9t², whose invariant differential loses a direction mod 5 although 5 does not divide the Weyl-group order. Positive generation must quantify proper subsheaves. Ordered roots form an S_n-torsor; connectedness requires full monodromy. |
| 3, §§3.9–3.13 | Unramified anisotropic torus; GL₁ Picard stack; smooth connected SL₂ spectral double cover; local discriminant t²−ε with valuation one | Rank defect uses inertia over the geometric residue field, not the F_v-split rank. Keep geometric reduced torus affine-Grassmannian language. Full GL₁ Picard stack retains degree components and scalar stabilizers. Prym has finite μ₂ stabilizer under the stated characteristic assumptions. δ=0 does not imply everywhere regular semisimple. |
| 3, §§3.14–3.17 | Trivial abelian action; elliptic translation action; disconnected E×Z/2 action; one cohomological degree versus all degrees; compactified Jacobian with the actual hypotheses | Reinstate proper flat geometrically reduced pure-dimensional fibres, smooth commutative action, finite-component control and the global Tate-module pairing. Separate δ-regularity. Support amplitude is across all common-support perverse constituents. The point-count formula includes #P′⁰(k), as the translation quotient of an abelian variety shows. |
| 4, §§4.1–4.4, 4.6 | Vary centralizer unit volume; Sp–Spin root data; anisotropic versus Levi reduction; two unitary blocks with resultant valuation one | Use the connected-fibre auxiliary J′, distinguish canonical centralizer notation, and retain the centralizer measure factor. Correct the nonstandard pair to Sp–Spin. Globalization follows central/Levi reduction. For Laumon–Ngô's self-dual basepoint the coefficient is (−q)^r; transport to the Kostant basepoint contributes (−1)^r and yields q^r. Empty block means stable, not one arbitrary ordinary orbital integral. |
| 5–6, §§5.1, 6.1, 6.3, 6.15, 6.25 | Unit-length Speh; unitary archimedean blocks; character restriction; F⁺=Q and [F⁺:Q]≥2 | Keep normalized-intertwiner and continuous unitary character hypotheses. The [F⁺:Q]≥2 exclusion of proper cuspidal subsets cannot be asserted over Q; proper Levi contributions may occur there. Conditional classification inputs retain their hypotheses. |
| 7, §7.6 | Change Dieudonné basis by g; height-one connected versus étale group; matrix/Morita factor | Add explicit checks for β↦g⁻¹βσ(g), the connected/étale distinction, and the opposite-algebra normalization. FV=ϖ stays relative to O, not uniformly p over ramified O. |
| 8, §§8.3, 8.5, 8.9, 8.14 | Centre-sensitive embedding dimension; GL₁ inverse support; GL₂ with ν=(−1,0), m=(1,p), π=1; ordinary versus supersingular CM reduction | Normalized Jacquet trace requires orbital δ_P^−1/2. Weyl contributes p and J_{P^op}(1) contributes √p; the full δ_P^−1 coefficient instead pairs with unnormalized Jacquet. At q=4 the two values are 2 and 1. Separate weak CM isogeny cancellation from the marked Lie-compatible realization gap. |
| 8, §§8.19, 8.23 | Same GL₂ ordinary specialization; normalized Newton factor | Keep φ_p⁰=φ_p δ_G^1/2 and remove the extra δ_H^−1/2 before the normalized Levi lift. The ordinary trivial-representation trace now agrees with δ_G^1/2φ_p. |
| 9–10, §§10.1, 10.12, 10.20–10.30 | Rank-one character with χ(ϖ)=z; segment length one/two; zero étale tangent; independent étale generators; ramified O | Distinguish correspondence duality from inverting Frobenius in a fixed representation. Algebraic WD dual is (r∨,−Nᵗ). Keep raw trace-parameter construction, monodromy adapter and comparison as separate targets. Add actual quasi-EL generator/dimension controls. |
| 11 | Bounded parameter versus positive-exponent induction; unitary similitude versus derived unitary group | Retain the weighted-stabilization and relevance hypotheses and the explicit induction extension. No conditional packet theorem is promoted to an unconditional one. |
| 12, §§12.7, 12.11–12.12 | (ϖ,1,Φ_geo) versus (ϖ,1,1); unipotent inverse transpose; countably many points; identity of ⊕Λ | Add the action/duality controls. Build integral coefficients from Λ₀/ℓ^r sheaves before compact supports, then rationalize; Q̄_ℓ/ℓ^r is zero. lim of global compact-support groups admits (ℓ^i), so it cannot replace the fixed-level sheaf construction. Equal compatible diagram maps induce equal colimit maps; arbitrary maps need not factor through one finite stage. |
| 12, §§12.16–12.22 | Locally constant functions; k=0 derivatives; open subgroup; nonanalytic function; height-one tower with q−1 frames | Give three discriminating locally analytic checks and the rank-one finite-level check. Preserve native Dat and basic-Hecke orientations. Remove the unsupported comparison between their actions from the coherent export. |
| 13–15 | Definite set; U(N−1,1), N=2; nongeneric/non-tempered contribution; virtual multiplicities +1 and −1; rank-one base change | Add Matsushima boundary checks. Scalar clearing and Frobenius shifting are separate character-separation operations. Virtual trace cancellation never implies degree-wise vanishing. Satake is imported, with only cyclic base-change calculation retained. |

The central Jacquet correction was checked against the calculation, not just the printed locator. Shin's [*Stable trace formula for Igusa varieties*](https://math.berkeley.edu/~swshin/StableIgusa.pdf), Lemma 3.9(i)–(ii), p. 12, combines a full orbital modulus with normalized Jacquet under its §1.2 convention; those two formulas are incompatible. The README supplies the Weyl/Casselman derivation and distinguishes the full and half-modulus variants. The no-extra-twist use agrees with [Shin's compact Shimura paper](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.6, (5.33)–(5.36), p. 41. The new q=4 numerical Lean example is a negative control for the exponent, not a formal proof of Casselman's theorem.

Other expanded proof routes were checked at their sources: Riche §2.2, pp. 3–4, and Theorem 3.2.2, pp. 8–9, for the Kostant complement; Ngô §§7.1–7.3 and §7.6, pp. 122–133, 149–153, for the weak abelian/support statements; Ngô §§8.1, 8.4–8.5, pp. 157–160, 175–182, for point counting and the auxiliary connected Picard group; and Laumon–Ngô §§1.1–1.5, pp. 4–10, for the self-dual-lattice basepoint sign. The package's statements are in my own words. No source passages or section-by-section source summaries were added.

## Recheck of the first review's supplier findings

The numbering below is the first review's A1–A49 ledger. This pass checked the revision's actual targets and cited supplier statements; it does not simply adopt its resolution labels. All numbers are accounted for. The remaining §8.14 gap is recorded separately above.

| Previous finding | Rechecked resolution and location |
| --- | --- |
| A1–A4 | ClassFieldTheory supplies the class-formation, torus duality and all-degree inputs; split/Hilbert-90 calculations are scoped specializations in §§1.1–1.2, not a new general reciprocity theory. |
| A5–A6 | §6.3 retains continuity/unitarity, the quadratic restriction and conductor freedom of the CM character. Its restriction/norm tests distinguish the chosen extension. |
| A7–A10 | §§1.3, 1.7, 6.11 use the actual reductive centralizer, pinning, simply connected and anisotropy statements. The L-embedding enlargement and ordinary/twisted exceptions are now explicit. |
| A11 | §8.3 states the centre-sensitive central-simple-algebra embedding/index criterion; a dimension count without the centre is not substituted. |
| A12–A13 | Finite Clifford/Brauer reductions are used over characteristic-zero coefficients with the finite-group hypotheses, not as an averaging assertion in modular coefficients. |
| A14 | §12.16 explicitly targets locally analytic vectors and duality, with positive, locally constant and nonanalytic checks. |
| A15 | §2.16 and corrected §8.9 own the particular character/Weyl/contracting identities beyond the imported generic distribution theory. |
| A16 | §§10.16–10.17 retain the generic newvector and Schneider–Zink compact-type separator targets; Iwahori theory alone is not claimed to supply them. |
| A17 | §2.16 states the inner-form GL_r(D) tempered/standard-data extension with its scope. |
| A18–A19 | §10.6 uses the existing ExactK0 API, with exact-structure and smallness hypotheses, and plans only the representation/trace applications; induction/Jacquet compatibility remains §10.10. |
| A20–A21 | The current SR.5.3 multisegment statements and SR.3.4 Iwahori inputs are imported. Only the WD adapter and the particular compact-type separation remain local. |
| A22 | §§12.12, 12.14 construct the coherent Weil-equivariant derived object and characteristic-zero central sectors. An action only in the triangulated homotopy category is not used. |
| A23 | §8.9 supplies normalized constant-term trace duality; its half-modulus error is corrected in this review. Additivity uses §10.6 and actual second adjointness remains an SR.2a.1 input. |
| A24 | §10.21 treats finite-inertia Weil representations using per-irreducible unramified twists; §10.22 owns the global Weil realization used here. |
| A25 | Standard quotients stay with SR.3.3/AF.1; §5.1 states the Rankin–Selberg normalization and unitary regularity of intertwiners. |
| A26–A27 | §10.27 keeps the exact Grunwald–Wang obstruction/auxiliary ramification step and pair-factor stability with a pair-dependent threshold. Jacquet–Shalika and Deligne–Henniart, rather than the compatibility corollary alone, are the stability proof inputs. |
| A28 | §10.29 specifies segment-pair products and nongeneric quotient conventions, rather than attributing them to the supplier's generic product. |
| A29 | §6.1 uses Vogan's unitary GL_n induction result over R/C, including nongeneric unitary blocks; §5.1 supplies the unitary intertwiner statement. |
| A30–A31 | §§6.3, 10.22 retain the CM half-character and archimedean unitary/algebraic normalization targets; strong multiplicity one is the actual AL.3 input. |
| A32–A33 | §§13.8–13.9 state the definite-set and U(N−1,1) Matsushima comparisons with the finite-level, real-group and tempered hypotheses; the new checks include N=2 and the excluded nontempered case. |
| A34–A36 | §§7.6, 10.2, 10.5, 12.3–12.4 own strict relative Dieudonné/deformation and full Drinfeld-level instances. General O uses ϖ and relative normalization, not a hidden Z_p-only formula. |
| A37–A38 | §10.12 retains the ramified quasi-EL datum and independent étale generators; §§9.1, 10.13 retain the raw compact division-PEL model and completed-local comparison for arbitrary local F. |
| A39 | §§3.6, 3.10, 3.12 own the Higgs-section cone, regular-centralizer Picard stack and anisotropic DM criterion; actual moduli charts replace the erroneous gerbe-chapter supplier. |
| A40–A41 | §3.16 targets the finite-stabilizer DM weighted trace extension, with the corrected connected-Picard factor. A regular finite-type curve over the perfect finite constant field is smooth; no imperfect-field implication is asserted. |
| A42 | §12.12 uses Dat's derived composite with inverse limit on sheaves before sections at fixed level, then the smooth level colimit. The revision's inverse limit of global compact supports is corrected here. |
| A43–A44 | §10.4 retains the controlled ℓ-adic nearby-cycle/algebraization target. §10.20 includes the all-local-field inertia calculation, including Scholze's footnote 8, rather than claiming a Q_p computation covers ramified F without argument. |
| A45–A46 | §12.13 states the finite-level equivariant formal/analytic comparison. §§3.15, 3.18 supply the DM-source decomposition and trace-recognition extensions rather than claiming the scheme supplier already does so. |
| A47–A49 | §12.12 states the support/site comparison and cofinal-level argument; full faithfulness is restricted to smooth, hence seminormal, rigid fibres over the fixed field. No general compact-support completion/colimit interchange is asserted. |

For the first review's B–G findings: the revision's actual supplier sections replace external node slugs, duplicate bibliography entries and duplicate unnamed check bullets have been removed, and the final process-only proof-requirements section is gone. I corrected the remaining `G4b` assertion in §§8.14–8.15 and residual acceptance prose. The native basic-Hecke orientations in §12.22 are retained; §15.6 no longer promises the unsupported Dat-to-Fargues–Scholze action dictionary. The arithmetic/geometric normalization boundary and generic orbital/pseudo-coefficient ownership received the additional corrections listed above. No first-review finding is deemed resolved merely because its old label disappeared.

## Sources opened and locator checks

There were no author-flagged unverified locators in the input revision. I nevertheless checked its old source boundaries, in particular the CM step, and opened the random sample of 15 numbered sections selected with seed 9868. The following locators use the package's specified versions; printed and PDF page numbering are distinguished where needed.

| Sampled section | Source passages opened and result |
| --- | --- |
| §10.20 | [Scholze LLC](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf), Theorem 12.1 and proof, pp. 30–31, including footnote 8: checked the all-F inertia extension. |
| §6.25 | [Caraiani–Scholze noncompact v2](https://arxiv.org/pdf/1909.01898v2), Proposition 5.5.1 and Theorem 5.6.1, pp. 72–75; [compact paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Theorem 5.3.2/Proposition 5.3.3, pp. 737–738; [Shin](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 4.7, p. 27: checked the identity and the degree-of-F⁺ restriction. |
| §2.9 | [Ngô v3](https://arxiv.org/pdf/0801.0446v3), Lemmas 1.9.1–1.9.2, pp. 19–21; Lemmas 1.10.1–1.10.2/(1.10.3), pp. 21–22; Theorem 1.11.1/§1.11.3, pp. 23–24. [Waldspurger](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §§1.6, 4.7, pp. 12, 51; [Laumon–Ngô v2](https://arxiv.org/pdf/math/0404454v2), Theorem 1.5.1, p. 10. The rebase sign was corrected. |
| §8.23 | [Shin Igusa](https://math.berkeley.edu/~swshin/IgusaVar.pdf), Definitions 6.1–6.2/Lemmas 6.3–6.4, pp. 19–21, Definitions 8.1–8.2, pp. 24–25; [Stable Igusa](https://math.berkeley.edu/~swshin/StableIgusa.pdf), Lemma 3.9, p. 12, Remark 6.4, p. 21; CS noncompact Theorem 5.6.1, p. 75. Updated the modulus witness with §§8.9, 8.19. |
| §8.11 | Shin Igusa Lemma 6.4, pp. 20–21; CS compact Lemma 5.5.1, pp. 741–743; CS noncompact Lemma 5.6.2, pp. 75–76: checked the two shift/separation operations. |
| §2.8 | [Kottwitz–Shelstad v1](https://arxiv.org/pdf/1201.5658v1), Lemma 2.2.1, p. 4, Proposition 2.2.3, p. 5, Proposition 3.5.2, pp. 7–9, §§5.3–5.6, pp. 13–16; Waldspurger §1.4, p. 11; [Labesse](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Definition 3.2.1, p. 76. Corrected the scope and sign of the splitting-invariant correction. |
| §7.2 | [Kottwitz isocrystals](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), §§3–4.2, pp. 211–213; Shin Igusa Definition 4.5/Lemmas 4.6–4.7, pp. 10–11: σ-conjugacy and ordinary conjugacy remain distinct. |
| §10.13 | Scholze LLC §8, pp. 19–22, Lemmas 9.1–9.2/Theorem 9.3/Corollary 9.4, pp. 23–25; [Deformation spaces](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf), Theorem 5.2, p. 24, Propositions 5.4–5.5, p. 25, Theorem 5.7, pp. 26–27, §§6–7, pp. 27–32: checked raw cohomology/local-model scope. |
| §1.11 | [Kottwitz elliptic terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Theorem 1.2, p. 368, Theorem 2.2, p. 374; Labesse Proposition 1.7.3/Corollary 1.7.4, pp. 38–39; [Kaletha v5](https://arxiv.org/pdf/1304.3292v5), Corollary 3.8, p. 15, Lemma 4.9, p. 25, Corollary 5.4/Lemma 5.7. Checked local/global duality scope rather than treating real H¹ as an abelian group. |
| §10.15 | Scholze LLC Theorem 11.1, Proposition 11.2, Corollary 11.3 and Remark 11.4, pp. 28–29: virtual comparison distinguished from actual graded cohomology. |
| §10.18 | Scholze LLC Theorem 1.2(a)–(b), p. 3, Lemma 3.2, pp. 9–10, Corollaries 10.3/11.5, pp. 26–30: checked the raw semisimple parameter normalization. |
| §4.8 | [Cohen](https://arxiv.org/pdf/1606.02141), Definition 8.1, Lemma 8.2 and Theorem 8.3 (published pp. 615–617); Arthur Theorem 25.1, p. 168, is the cited existence input. Retained the fixed DKV/Jacquet–Langlands sign convention; no DKV book was read. |
| §12.1 | Scholze–Weinstein, *Berkeley lectures*, Propositions 11.2.1 and 11.3.1, pp. 92–95, read in the cleared library; [Fargues–Scholze v4](https://arxiv.org/pdf/2102.13459v4), II.1.1, pp. 47–50, II.1.15–II.1.18, pp. 54–55. Checked the finite-E chart and its boundary from the Q_p input. No cleared file was copied. |
| §7.5 | Kottwitz isocrystals §4.3, pp. 213–214, §§5.2, 6.2–6.5, pp. 215–216, 219–220; [Rapoport–Richartz](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf), §§1.11–1.12, pp. 158–159; Shin Stable Igusa §3.2, p. 10: checked decency/Newton Levi/J_b conventions. |
| §1.13 | Labesse Definition 1.7.1/Lemma 1.7.2, p. 37; [Hansen–Kaletha–Weinstein v4](https://arxiv.org/pdf/1709.06651v4), Lemma A.2.1, p. 85; Kottwitz elliptic terms §5.1, p. 379: checked compact U(n) parity rather than a split-rank shortcut. |

Additional opened passages supporting corrections include Kottwitz–Shelstad's *Foundations* §2.1, pp. 18–20, and §2.2, pp. 20–21; Kisin Proposition 3.6.10, p. 58, for the integral z-extension; Riche v2 §§2.2, 3.1–3.2, pp. 3–4, 6–9; Ngô §§2.4, 3.7, 3.10, 4.10, 4.14, 7.1–7.6, 8.1, 8.4–8.6; Dat §3.3, pp. 21–24, and Theorem 4.1.2, pp. 28–29; Jacquet–Shalika Proposition 4.1/§4.2/Proposition 5.1, pp. 326–327, 331; Deligne–Henniart Theorem 4.6/Lemma 4.7, pp. 110–111; Vogan Theorems 17.4/17.6, pp. 501–502; and Scholze's *Some simple Shimura varieties*, Lemma 5.5/Corollary 5.6, pp. 13–14. Their conclusions and hypotheses, rather than source passages, are recorded in the README.

## Lean signature audit and verification

The ten kept definitions/signature groups were checked against the prose as follows.

| Interface | Signature/negative control checked |
| --- | --- |
| `kottwitzSign` | Positive dimensions and inner rank bounds are explicit; parity is (n−1)−(r−1), with the compact/quasi-split cases distinguished. |
| Characteristic-polynomial conjugacy | Separability is present; a nonsemisimple Jordan block is not classified by its characteristic polynomial alone. |
| κ rebase calculation | Inverting the class multiplier in the weighted sum yields the positive unprimed κ factor; the order-three control detects inversion. |
| `chevalley` | The constant coefficient normalization includes n=0, where the polynomial is 1. |
| `companion` | Sizes one and two pin the companion orientation, including the nilpotent case. |
| Component count | Positive d and positive block sizes are stated, excluding empty/zero blocks from a division formula. |
| Coefficient τ | The denominator hypotheses are explicit; the balanced proper endoscopic case computes one half. |
| Acceptability | The inequality quantifies all i<j; an empty index set is vacuous for the numerical predicate and not a field-size assertion. |
| Special monodromy/Frobenius | The raw matrices satisfy FN=q⁻¹NF, have N^k=0, and the nonzero-index statement requires k>0. Sizes zero, one and two and numerical q=0,1 do not create an unguarded division assertion. |
| `comparisonTrace` | The finite sum equals the diagonal trace; opposite virtual multiplicities cancel without asserting either graded piece vanishes. |

`lean-check` on the final Suggested.lean exited **0**, with **16 warnings, all `declaration uses sorry`**, and no errors or other warnings. The check used the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory before the final check was 90 GB. Only README edits followed that successful final Lean check. No language server, Lake build/update/cache command or background compilation was used.

Packet validation was rerun: ET.0 (61 nodes), ET.4 (34), ET.5 (32) and ET.6 (33) each passed with zero errors and warnings. ET.6a (50 nodes) still fails with **26 pre-existing unresolved-prerequisite errors and zero warnings**, involving 14 obsolete supplier names. These packets are outside this review's edit scope. The handoff records every name and its current supplier; this report does not claim a passing result for ET.6a. These obsolete names are distinct from the CM proof gap in the package.

`python3 research/blueprint/intake.py check-files` on the six authorized deliverables (including unchanged metadata) reported **6 files, 0 problems**, exit 0. `git diff --check` was clean, exit 0. Only the package README, Suggested.lean, review.json, this report and this job's handoff are changed. No packet or upstream/library file is changed.

## Public-source receipts

The following hashes identify the public files read in this run; locators and conclusions are given above. Cleared library material was read in place and is not reproduced. Access dates are UTC. These are retrieval receipts, not additional mathematical assumptions.

| Public PDF | Access date | SHA-256 |
| --- | --- | --- |
| [llc](https://people.mpim-bonn.mpg.de/scholze/LocalLanglands.pdf) | 2026-10-14 | `11358ca04e158f455a08d59fc31afa3dc324ad816c53eef571d5fa7dbce6f002` |
| [js](https://www.math.columbia.edu/~hj/Highly%20ramified.pdf) | 2026-10-14 | `33ce983ace36bac485ce6b20f3ae7b2ab2782dfadbf48f64f3c4cdfd8e21ebb9` |
| [dh](https://publications.ias.edu/sites/default/files/Number43.pdf) | 2026-10-14 | `54fe3348af12263a8d3774a0353fff352cb041728f446fb0cccc4b0f97803a3e` |
| [csnc](https://arxiv.org/pdf/1909.01898v2) | 2026-10-14 | `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e` |
| [csc](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | 2026-10-14 | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [ngo](https://arxiv.org/pdf/0801.0446v3) | 2026-10-14 | `4d48819f7ecf7e4e1d0fd036df2a62fa5b49f171f6fda56449b3dfbc0d43fb51` |
| [wald](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf) | 2026-10-14 | `5d4b25c8b67140aad537efaba3fe509b842ea381c4c9d428f63560ac68a3daae` |
| [shin-igusa](https://math.berkeley.edu/~swshin/IgusaVar.pdf) | 2026-10-14 | `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8` |
| [shin-stable](https://math.berkeley.edu/~swshin/StableIgusa.pdf) | 2026-10-14 | `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0` |
| [ks](https://arxiv.org/pdf/1201.5658v1) | 2026-10-14 | `eaa0a8ab1e182e0297dd9b4e46c296fa370060a5f0c2d90136b4d925700a0904` |
| [kottwitz-iso](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf) | 2026-10-14 | `51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171` |
| [deformations](https://people.mpim-bonn.mpg.de/scholze/DeformationSpaces.pdf) | 2026-10-14 | `baf2a72a43e12f48adb4f701ad89191df781c8ca4f8d56e85da93a803a355188` |
| [labesse](https://www.numdam.org/item/AST_1999__257__R1_0.pdf) | 2026-10-14 | `0a1c3bf2f209be6708acafe2a076dca9665e7064ee8d4788f2e9a3825d8a7fcb` |
| [cohen](https://arxiv.org/pdf/1606.02141) | 2026-10-14 | `66fa735f069f2d08563ce0b53e09d49a005fc147559a9e884a96ef33ade90c31` |
| [rr](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf) | 2026-10-14 | `86acb9e18422e641d85f799262e1793614f705029a9cbd70dc0b03f74bcb13d8` |
| [hkw](https://arxiv.org/pdf/1709.06651v4) | 2026-10-14 | `d37e986ef599420a8e206dc289e18965422b03ec923184737fbcead2abc0bd5c` |
| [kaletha](https://arxiv.org/pdf/1304.3292v5) | 2026-10-14 | `8f88e61e4a86c69ed2e03b760d1517c6f5da167422b5ac8d637af2203bca12a4` |
| [kottwitz-elliptic](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf) | 2026-10-14 | `25b42a3552624b8115f32ea661545842a5271635f48814fe5b07c5baa8ee32fd` |
| [simple](https://arxiv.org/pdf/1003.2451) | 2026-10-14 | `0ac9fe8c8145e3d58f2cec19d3d026c1c77d8a05530225135bedffb04fcdd877` |
| [shin-gal](https://math.berkeley.edu/~swshin/StableGal.pdf) | 2026-10-15 | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |
| [Laumon–Ngô v2](https://arxiv.org/pdf/math/0404454v2) | 2026-10-15 | `fa36d683a9436e6fe043539b391e6cf0da1e3f83a4b867f2aabaa176ae730cdc` |
| [Dat LT](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf) | 2026-10-15 | `4973a260e5af4b046652956ad63e95a412fb82873cdecc6bd585c85e1aa4a04d` |
| [Fargues–Scholze v4](https://arxiv.org/pdf/2102.13459v4) | 2026-10-15 | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| [Riche v2](https://arxiv.org/pdf/1411.3112v2) | 2026-10-15 | `f0225e1a59eb3daf0c7db46bcbd7a853e850fbacd1da709fe185894130b1e8cf` |
| [Tate Honda exposition](https://numdam.org/item/SB_1968-1969__11__95_0.pdf) | 2026-10-15 | `a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3` |
| [Kottwitz Points](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf) | 2026-10-15 | `ae2f2f148d791b6cc1d79d360868182c9abd2e0e5954d5c96df2d94b98570d2b` |
| [Vogan GL_n](https://www.math.utah.edu/~ptrapa/math-library/vogan/vogan-GLn.pdf) | 2026-10-15 | `206ce76a60c6bc7fbfcec4e0d609d879b646e8ee562b97b8bcf376819d03ea44` |
| [Kottwitz–Shelstad Foundations](https://www.numdam.org/item/AST_1999__255__R3_0.pdf) | 2026-10-15 | `1363bde68b000fe9dbd8677e6da5cc65cf28449abb4f026b34dbde8c3068d6f3` |
