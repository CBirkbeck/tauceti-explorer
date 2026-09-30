# REV-PAPER-FARGUES-FONTAINE-18: review of the extraction of Fargues–Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*

**Verdict: accept.** All nine routes are accepted as corrected, and one of them is a replacement: the extraction's route 8 (FarguesFontaineDiamonds F1/F3) was rejected, and its slot now holds a VectorBundlesAndIsocrystals VB3 source route. The extraction was corrected in place:
- 66 statuses changed (65 planned → missing, 1 missing → planned);
- 3 items added (1107–1109);
- 44 statements and 4 locators corrected, and many notes;
- items moved between routes, and route 3 given the byte-identical title of the Part II it joins.

Of the 186 recorded source issues, 185 are confirmed (sixteen with a field corrected) and one, E64, is rejected. Thirty-four new mistakes, E187–E220, are added:
- 4 are errors in stated results (E193, E211, E218, E219);
- 4 are misprints in stated results (E187, E198, E199, E215);
- 26 are misprints that affect nothing.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code session `cc-48533a` (issue #4542).
- It had 1106 items (15 library, 244 planned, 847 missing), 9 routes and 186 `sourceIssues`, with status `complete`.
- `cc-f805bf` appears nowhere in its files.

Source:
- **Text read.** The authors' copy `courbe.pdf`, "16 avril 2017", from https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf (the link in `papers.json`), fetched 29 September 2026.
  - SHA-256 `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`, as recorded.
  - 399 PDF pages. The printed page is the PDF page minus 10: the Préface is on printed pp. 1–50 and Chapters 1–11 with the bibliography on pp. 51–389.
- **Published version.** Astérisque 406 (2018), xiii + 382 pp., doi:10.24033/ast.1056. The SMF page offers only an excerpt, so the published text was not read, and every finding is scoped to the authors' copy, as `sourceVersions` says. The published pagination (382 pp. against 389) shows that the edition was re-typeset.
- **Corrections in print.** None found:
  - Fargues's publications page lists the book with no erratum.
  - The SMF page of Astérisque 406 lists none.
  - A web search found none.
  - `research/errata/REGISTER.md` and the `sourceIssues` of every packet and errata file record nothing against this book.

## 1. Items

**What was read.**
- Nine parallel chapter passes read the whole book: the Préface; Ch. 1; Chs. 2–3; Ch. 4; Ch. 5; Chs. 6–7; Chs. 8–9; Ch. 10; Ch. 11 with the bibliography.
- Each pass checked every item against the text layer and every formula that mattered on 300-dpi page images. Every source issue was checked on the page image.
- Four passes checked the statuses (items 1–277, 278–554, 555–830, 831–1106), and one pass checked the routes.
- I read myself, on the text and the page images, the passages of every new error in a stated result, the rejected E64, and Théorèmes 2.5.1, 6.4.1, 6.4.4, Lemme 1.6.8, Propositions 10.6.17–10.6.18, 11.2.24 and Lemme 11.2.25, and Préface §2.5.2.

**Coverage.** Every numbered Définition, Proposition, Théorème, Lemme and Corollaire falls under some item. So does every key unnumbered construction on the way to the main theorems: the rings B^b, B_I, B, B^+, B^+_ρ, E^†, the Robba ring, A_cris,ρ, ramified Witt vectors, primitive elements, |Y|, divisors, P, X = Proj P, B_e, the fundamental exact sequence, O(λ), the HN formalism, the period maps, equivariant bundles, B-pairs and φ-modules. The review added three items:
- **1107 (Préface Théorème 3.16).** Y_E^ad(I) is an adic space (Fargues [19, th. 2.1]). It is the only numbered Préface theorem that was neither an item nor a restatement of a chapter result. It is planned at RF0:annuli ("Prove complete separated sheafiness").
- **1108 (§1.4.1, Remarque 1.4.4).** The Gauss norms restricted to E, and their homogeneity. This is why B_I is only an E^disc-algebra when 1 ∈ I.
- **1109 (Exemples 2.3.7, 2.3.10).** For E = Q_p, the cyclotomic parametrisation (1 + m_F ∖ {1})/Z_p^× ≅ |Y|_{deg=1}, with the corrected u_ε (E200).

The uncovered numbered statements are heuristic or historical remarks that nothing later uses: 1.3.4, 1.5.1, 1.8.4, 5.6.10, 6.2.9, 7.9.3, 8.2.4, 8.6.2, 11.2.9 and 11.3.3.

**Statements corrected (44).** The main ones:
- **Corrected forms of confirmed mistakes.** The items now state the corrected results rather than the printed ones with a caveat:
  - item 114 (Lemme 1.2.3, E25);
  - items 209, 213, 215, 216 and 219 (§1.7, E42, E43, E45, E46);
  - items 493, 500, 523 and 534 (E94, E87, E93, E95);
  - items 611 and 612 (Exemple 5.5.2.6, degree = −length, E109);
  - item 633 (Lemme 5.6.14 with the factor det(f_*O_X)^{⊗(rk E − 1)}, E114);
  - item 705 (Théorème 6.4.4: generator φ(∏Π^−(a_i)) and the orbit hypothesis, E127, E211);
  - item 675 (§6.1.3, E128);
  - item 878 (Théorème 9.4.3 with ρ_i ≠ 0 and the map written out, E153);
  - item 1062 (Lemme 11.2.10 with the tangent-map hypothesis, E180);
  - items 1087 and 1089 (Proposition 11.2.24 and Lemme 11.2.25, E218, E219);
  - item 67 (I′ = ((p−1)/p)I, E187);
  - items 333 and 377 (|Y_{I∖{0}}| ⥲ Spm(B_I), E198).
- **Wrong transcriptions.**
  - Item 332: B_{{0}} is ℰ = W_{O_E}(F)[1/π], not E.
  - Item 349: the target is W_{O_E}(k_{F̄}).
  - Items 445–449: W_O(F̄_q), not W_O(F_q).
  - Item 430: α_{i*}.
  - Item 852: the interval is half-open.
  - Item 833: the Hodge–Tate arrow.
  - Item 956: the "generic fibre" of Déf. 10.5.1 is the forgetful functor to φ-Mod_{K_0}.
  - Item 269: there is no misprint. The underlined π on the page is the book's ϖ, which the text layer lost.
- **Missing context.**
  - Item 902: Proposition 10.2.7 needs |Y_I| to meet the φ-orbit of y_∞ (E159).
  - Items 998 and 999: k_K is algebraically closed (E215).
  - Item 291: Remarque 2.2.18 added, which Corollaire 2.2.22 uses.
  - Item 577: one lattice per point.

**Locators (4).** Items 227 (p. 88), 291, 464 and 634 (the citation reads "lemme 1, A.3.112").

## 2. Statuses

**Library citations.** All 15 were opened at Mathlib 082e2d3 and Tau Ceti f790474, and each provides its item. The 15 are:
- `AnalyticOnNhd.circleAverage_log_norm` (Jensen);
- `PreTilt.val`, `PreTilt.map_eq_zero` and `PreTilt.isDomain`;
- Mathlib's Kummer theory;
- Tau Ceti's `SchemeWeilDivisor` files (integral, noetherian, DVR stalks, as Définition 5.1.1 needs);
- `LinearMap.det_restrictScalars`;
- unique factorisation;
- `Algebra.FormallyEtale.equivPiOfIsSepClosed`;
- `ContinuousLinearMap.isOpenMap` and `ContinuousLinearEquiv.ofBijective`;
- `moritaEquivalenceMatrix`;
- `HasStrictFDerivAt.map_nhds_eq_of_surj` with `AnalyticAt.hasStrictFDerivAt`.

**Planned → missing (65).** In each case the cited stage or packet node plans only a special case. PROTOCOL §16 makes an item planned only when a layer plans it. The extraction had already marked other special cases missing (items 150, 179, 261, 268), so the review applied the same rule throughout.
- **Chapter 10's field K (882, 903, 923, 924, 934, 964, 966, 979, 995, 998, 1000).** The book takes "K|Q_p de valuation discrète à corps résiduel parfait" (p. 313). The nodes open "Let K/Q_p be finite" (R06.1/tate-sen-theorem, R06.2/period-rings-are-regular, R06.2/colmez-fontaine-theorem, R06.3/p-adic-monodromy-theorem, R06.6). R01.2 assumes a finite residue field. R02.2 and Tau Ceti ProfiniteCohomology layer 5 use discrete coefficients, where FF use Banach ones.
- **Kedlaya's rings (59, 68–71, 222, 223, 225, 230, 196, 201, 1052, 1054, 1059, 1065, 1067, 1071, 1088, 1100).** RD.0–RD.2 build Γ^ℓ over a Cohen ring, so they cover E of characteristic 0 only.
  - RD.0/closed-interval-analytic-ring-pid, analytic-ring-bezout and vector-bundles-on-half-open-intervals-free assume "v_ℓ discrete", which excludes a perfectoid F.
  - RD.0/extended-robba-ring treats only the completed algebraic closure of k((t)).
  - Nothing covers intervals containing 1, or open annuli for Lazard.
- **Other special cases (78, 80, 265, 270, 312, 333, 371, 452, 498, 510).**
  - Items 78 and 80: B̃_rig,K clauses; PG.2 plans only B_rig,K.
  - Items 265 and 270: θ for general π-adic algebras; RF2 and P1 plan it for perfectoid rings.
  - Items 312 and 452: the book's homeomorphisms; FS II.2.x give only bijections or linear isomorphisms.
  - Items 333 and 371: the 0-end interval, and degree-d points over non-algebraically-closed F.
  - Items 498 and 510: spectral Banach algebras; TB.0 and AdicSpacesPartII R0 give only ingredients.
- **Chapter 5 (590, 592–595, 597, 599–603, 606, 608, 610, 619, 641, 647–652, 661).** VB1/degree-rank-slope-and-HN-formalism covers bundles on the Fargues–Fontaine curve only: "the Harder-Narasimhan axiomatics of Fargues-Fontaine 5.5.1 apply". Its proof step "Apply the general formalism" presupposes the abstract theory rather than planning it. The same holds for O(d, h) on a generalized Riemann sphere, modifications (RF4 plans only degree-one divisors of the relative curve), isocrystals over a non-algebraically-closed k (RD.1 assumes κ algebraically closed), filtered φ-modules over any K|K_0, and general Bézout rings.
- **Item 774.** The Lubin–Tate deformation space; ET.6a and the Lubin–Tate Part II take E/Q_p finite only.

**Missing → planned (1).** Item 707: X_{F,E} does not depend on π. VB2:ampleness/gaga-equivalence states "X^alg is independent of the chosen O_X(1) up to canonical isomorphism".

**Planned lists extended.** Item 392 gains RF2:untilts, item 574 KTheoryLowDegrees:Z.5, and item 607 PadicHodgeTheory:R06.2 (R06.2/slope-decomposition). Item 883 now cites RF3 rather than the B_cris^{φ=1} node.

**Missing items searched.** The status passes built keyword indexes over every stage description, packet node, decomposition node, campaign README, new roadmap and accepted Part II / new-roadmap brief, and grepped the declaration index. Besides 707, nothing plans any other missing item as stated. Partial plans are recorded in the notes:
- VectorBundlesAndIsocrystalsPartII for almost C-representations (44–46, 55, 56, 838);
- LubinTateFormalModulesAndQuasiCanonicalLifts (129);
- HodgeTateAndCanonicalSubgroups T2 (834);
- NoncommutativeAnalyticDistributions for Fréchet–Stein algebras (1106).

**Counts after the review.** 1109 items: 15 library, 181 planned, 913 missing.

## 3. Routes

Every missing item is in exactly one route, and every item a Part II route takes is missing (checked by script, and by `check_paper.py`). No Tau Ceti roadmap is re-planned. Every Part II title begins with its parent's exact atlas title, and `padic` is a galaxy id.

1. **RelativeFarguesFontaine RF0 (+RF1), source: accepted as corrected.**
   - RF0 is written for perfect R only, and nothing else owns ramified Witt vectors, so RF0 must state §1.2 for all π-adic O_E-algebras.
   - The route gained RF1 and item 94: Remarque 3.19's diamond identity for general E is RF1's "diamond formulas over Perf_Fq with the chosen coefficient-field embedding".
2. **RelativeFarguesFontaine Part II (holomorphic functions and the schematic curve): accepted as corrected.**
   - Nothing proves the zeros-of-functions theory, the Galois descent, graded factoriality or the curve over a non-algebraically-closed F. F4 says so explicitly, and VB2:ampleness covers only geometric points.
   - The routes pass proposed moving Théorème 3.5.7, Corollaire 3.5.8 and Lemme 11.2.6 to RD.0 on the ground that RD.0 plans Kedlaya's rings "for any complete perfect ℓ". I rejected this after reading the nodes: the Bézout, PID and vector-bundle nodes all assume v_ℓ discrete. The extraction's reason was right, and it now cites the node hypotheses.
   - The brief now names imports by title and id. It adds the Tau Ceti Foundations of adic spaces Layer 6 (existing work, never re-planned) and P7:annulus-foundations, and says that RD.0 imports the non-discrete case from here.
   - It fixes three hypotheses: 6.2.7 is surjective and 6.4.1 holds only for F algebraically closed, and 3.5.1 needs ρ ∉ |F|^{1/∞}.
   - The route gained Chapter 4.1 (405–415) from route 4, 21 status-corrected items and items 1108–1109. It lost item 707.
3. **VectorBundlesAndIsocrystals Part II: accepted as corrected.**
   - The extraction reused the id VectorBundlesAndIsocrystalsPartII of the accepted Colmez–Nizioł Part II with a different title. The title is now byte-identical ("…Part II: quasi-Banach-Colmez spaces, almost C-representations and the Hom-vanishing toolkit"), and the brief carries the extension. The id, parent and area already matched.
   - Colmez's Dimension and the category BC (27, 28, 837, 838) went to VB3 (route 8), because Colmez–Nizioł imports the Dimension formalism from the parent.
   - The route gained the Chapter 5 status corrections, 1019, 1100, 1085, 1086 and 1099 (from route 6), and Weinstein's π_1 computations 96 and 97 (from the rejected route 8). The last two are π_1(X_{C♭,E}^◇) = G_E, the diamond form of Théorèmes 8.6.1 and 9.5.1.
   - Théorème 9.2.2 now carries "F algébriquement clos".
4. **FiniteFlatGroupsAndIntegralPadicHodgeTheory Part II (π-divisible modules, universal covers, period maps): accepted as corrected.**
   - R07.2 stops at Dieudonné theory over perfect fields.
   - The prismatic Dieudonné Part II also plans the universal cover. The brief's "compared rather than duplicated" is replaced by a single owner: X(G) is built here and imported there.
   - ET.6a imports Théorèmes 8.1.1 and 8.1.3 from here, and VB3's Lubin–Tate calculation is imported.
   - Chapter 4.1 moved to route 2. The route gained 452, 498, 510 and 774.
5. **PadicHodgeTheory Part II (G_K-equivariant bundles): accepted as corrected.**
   - B-pairs, equivariant bundles, X_log and Théorèmes 10.1.7 and 11.5.1 appear nowhere in the atlas.
   - The route gained the eleven Chapter 10 status corrections, so the Part II states the two main theorems for K with any perfect residue field and proves they agree with R06.2/R06.3 for K/Q_p finite. It also gained item 1103 from route 9.
   - The brief now exports B-pairs to TriangulineVarietyAndItsLocalModel (which expects them from P7, where nothing plans them). It asks for one owner, shared with AdmissiblePairsAndPadicHodgeStructures, of "filtrations versus B_dR^+-lattices".
6. **PadicDifferentialEquationsAndRigidCohomology RD.0/RD.1, source: accepted as corrected.**
   - It holds Lazard (59–61, 64), 1087, 1088, 1089 and 1096.
   - Items 1087 and 1089 carry Kedlaya's correct statements, since the printed ones are false (E218, E219).
   - 1085, 1086 and 1099 moved to route 3.
7. **PadicHodgeTheory R06.1–R06.3, source: accepted.** Sen's theorem, the neighbouring representations and Berger's ∆(D) belong to the layers that own the theorems they prove.
8. **Original: FarguesFontaineDiamonds F1/F3, rejected. Now: VectorBundlesAndIsocrystals VB3 and VB3:general-BC, source, accepted.**
   - F1 is for E = Q_p only, and F3 compares sites without computing π_1.
   - The slot now carries Colmez's Dimension and BC (27, 28, 837, 838). This follows Colmez–Nizioł's accepted route 3, which routed the same statement to VB0–VB3.
9. **PhiGammaModulesAndIwasawaCohomology PG.0/PG.2, source: accepted as corrected.**
   - Item 391 (the field of norms for the Kummer tower) stays.
   - Items 78 and 80 join, as PG.2's tilde-ring clauses.
   - Item 1103 moved to route 5.

## 4. Mistakes in the book: 185 of 186 confirmed, 34 added

**Rejected: E64 (Proposition 2.3.19).** The book says "La proposition qui suit est laissée en exercice au lecteur". The statement is true and its proof is routine:
- p_y ∩ A_E is a prime containing N_{E′/E}(a) and not π, so it is (N(a)), since A_E/(N(a)) = O_C has only the primes 0 and m_C;
- A_{E′}/p_yA_{E′} = O_C[T]/(P), with P Eisenstein;
- Gal(E′|E) permutes the [E′:E] roots simply transitively.

An exercise with a routine proof is not a gap. E55 is different: the omitted case p = 2 is a non-trivial step, and the method written fails there.

**Field corrections to confirmed entries (16).**
- **E2.** The "reverse the inequality" alternative is not equivalent.
- **E5.** The quote was mistranscribed. The page has (u_0/t^d)a − (v_0/t^d)b; the mistake is real for d ≥ 2.
- **E12.** Reason.
- **E25.** Affects a stated result.
- **E46.** Correction narrowed.
- **E57.** Now an error rather than a gap: for q = 2 the choice ε′ = ε^{1/2} gives η = 0. The quote is fixed too.
- **E67.** Quote.
- **E88.** Affects a stated result. Proposition 4.6.14(3) says "right adjoint" where A ↦ A^sp is a left adjoint.
- **E96.** Affects a stated result, and "E|Q_p ramified".
- **E109.** The equality clause also needs a further hypothesis. With k imperfect, [k:k^p] = p and u = multiplication by z, both degrees are 0 but u is not an isomorphism.
- **E127.** A pointer to E211.
- **E138.** A second locator.
- **E148.** O⟨λ_i⟩^{⊗n}.
- **E164.** The page names u_0.
- **E179.** The alternative correction is removed.
- **E183.** Annotated.

**Claims in stated results, re-derived:**
- **E127 (Théorème 6.4.4).** Take y = ker θ, E = Q_p. Put T = [(1+ε)^{1/p}]. θ(T) is a primitive p-th root of unity, so T − 1 ∉ y, and the printed generator is not in the ideal. The generator is u_ε(T − 1) = [1+ε] − 1.
- **E114 (Lemme 5.6.14).** det f_*E ≅ N(det E) ⊗ det(f_*O_X)^{⊗ rk E}, so the printed statement lacks det(f_*O_X)^{⊗(rk E − 1)}. That factor has degree 0, so Proposition 5.6.15 survives.
- **E94, E87, E93 and E95 (Chapter 4).**
  - E94: at (α, β) = (1/p, 1 − 1/p), a_{α,β} = lim binom(p^k, p^{k−1}) has valuation 1 (Kummer), not 2.
  - E87: {|T| < 1} is bounded, not compact.
  - E93: the printed growth condition is vacuous.
  - E95: the printed series is −log.
- **E140, E141, E153, E156, E159, E167, E168, E171, E175, E176, E180 and E181.** All hold as stated in their entries.
  - E180's counterexample, Z = diag(T, T⁻¹) over E⟨T^{±1}⟩, was rechecked line by line.
  - E171's counterexample over Q_p(√p) was rechecked in full.

**New mistakes in stated results (8), each checked by me on the page image:**
- **E187 (Préface §2.5.2, p. 25; misprint).** Printed: E^I ≅ B^{I′}_{Q_p} with I′ = (p/(p−1))I. Since w_r([ε] − 1) = rp/(p−1) for r ≤ (p−1)/p, f(π) lies in B̃^{r} exactly when rp/(p−1) ∈ I, so I′ = ((p−1)/p)I. The side condition I ⊂ ]0,1] is then exactly r ≤ (p−1)/p.
- **E193 (Lemme 1.6.8, p. 71; error).** At ρ = 0 the lemma asserts |·|_{E′,0} = |·|_{E,0} ⊗ |·|_{E′,0}, and the proof calls this "clair". With |·|_0 = q^{−v_π} (Définition 1.4.7), x = π_E gives q^{−ef} on the left and q^{−1} on the right. The norms agree only up to the power [E′:E]. Proposition 1.6.9 is unaffected, since the topologies agree.
- **E198 (Théorèmes 2.5.1(2), 3.5.1(2); misprint).** Printed: "|Y_I| ⥲ Spm(B_{I∖{0}})". For I = [0, ρ], B_{]0,ρ]} has maximal ideals that are not points. Take y_i = ([z_i] − π) with v(z_i) → ∞. The ideal ∪_n B_{]0,ρ]}·∏_{i≥n}(1 − [z_i]/π) is proper, and it lies in no ker θ_y. The product converges because |[z_i]/π|_ρ = |z_i|/ρ → 0. What is meant is |Y_{I∖{0}}| ⥲ Spm(B_I).
- **E199 (Proposition 3.1.7; misprint).** The sum is over "σ ∈ Gal(L|F)", but L|F need not be Galois. Take p = 2, F the completed perfection of F_2((t)), and L = F(t^{1/3}). The index set is G_F/G_L, as the proof of Lemme 3.4.2 writes it.
- **E211 (Théorème 6.4.4; error).** The orbit hypothesis of 6.4.1 is omitted. The proof writes the condition "∀n ≥ 0, φ^n(x) ∈ y_1⋯y_d" as div(x) ≥ Σ_i Σ_{n≤0}[φ^n(y_i)], a sum where the condition gives only a pointwise maximum. With y_2 = φ^{−1}(y_1), the zeros required are only the φ^{−n}(y_1), each simple, so a_1Π^−(a_1) lies in the ideal. It is not a multiple of the corrected generator a_1a_2Π^−(a_1)Π^−(a_2).
- **E215 (Proposition 10.6.18(1); misprint).** The proposition is introduced as "la traduction de la proposition 10.6.17", which assumes k_K algebraically closed, but it does not restate that hypothesis. For the K of Chapter 10, the "en d'autres termes" sentence is false. Over Q_p, the Tate module of a good ordinary elliptic curve has an unramified quotient whose Frobenius eigenvalue α is a Weil number of absolute value √p, so α ≠ 1. It is therefore never an extension of Q_p by Q_p(1), and the crystalline Kummer class of 1 + p comes from no elliptic curve. The statement is right over the intended K.
- **E218 (Proposition 11.2.24; error).** Take F algebraically closed, c ∈ F with |c| > 1, and V = E^†e_1 ⊕ E^†e_2 with φ(e_1) = e_1 + [c]e_2 and φ(e_2) = πe_2. A φ-fixed vector e_1 + ye_2 needs y − πφ(y) = [c]. In ℰ the unique solution is Σ_k π^k[c^{q^k}], whose coefficients have |c|^{q^k}ρ^k → ∞ for every ρ > 0, so it is not in E^†. Thus V^{φ=1} = 0 while V̂^{φ=1} ≠ 0: completion is not fully faithful, and V is not a sum of E^†(λ).
  - The failing step is the final Ext computation. coker(Id − π^{−d}φ^h) on E^† is indeed zero, since −Σ_{k≥1}π^kφ^{−k}(b) converges. But the class of the extension above is the obstruction to solving y − πφ(y) = [c], and this has no solution in E^†.
  - Kedlaya's Proposition 5.11 and Corollary 5.12, which the book cites, give only a slope filtration and the isoclinic case.
- **E219 (Lemme 11.2.25; error).** The same V gives a lattice Λ = O_{E^†}e_1 ⊕ O_{E^†}e_2 with φ(Λ) ⊂ Λ, where Λ^{φ=1} = 0 but Λ̂^{φ=1} ≠ 0. The lemma needs φ bijective on Λ. The proof's equation (7), φ(X) = AX, should read X = Aφ(X), and the argument then works for A^{−1} ∈ M_n(O_{E^†}). Proposition 11.2.24 applies the lemma to π^{−d}φ^h, which is not bijective.

**New misprints that affect nothing (26).**
- E188, E189 (Préface).
- E190–E192, E194–E197 (Chapter 1).
- E200–E204 (Chapters 2–3). E200 is the displayed u_ε of Exemple 2.3.7, which has an extra term [α].
- E205–E208 (Chapter 4).
- E209, E210 (Chapter 5).
- E212 (Proposition 7.2.1).
- E213, E214 (Chapter 8).
- E216, E217, E220 (Chapter 10 and Lemme 11.2.25).

Each was checked on the page image.

**Not recorded** (settled as harmless or not settled):
- the Préface's claim that the Robba ring has no closed ideals other than 0 and R (not checked for the LF topology);
- the grading of the P-module in Préface Proposition 4.3;
- a second unwritten reduction in the proof of Théorème 9.3.4, of the same kind as E154;
- a superfluous n = 1 special case in §8.4.2.

## 5. Corrections made

They are listed in "Corrections by the independent review" at the end of `PAPER-FARGUES-FONTAINE-18.md`. In `PAPER-FARGUES-FONTAINE-18.result.json` the review made these changes:
- review verdicts on E1–E186, with the field corrections above;
- new issues E187–E220;
- items 1107–1109;
- the 66 status changes, with notes naming the partial plans;
- the statement, locator and note corrections;
- the route item lists, route 1's stages, route 3's title, route 8's target;
- the briefs and reasons of the changed routes;
- the summary.

Every substitution was applied by one script, which asserted that each matched exactly once. In the report, the counts and the route list were updated.

**For the maintainer.**
- DING-25's TriangulineVarietyAndItsLocalModel expects B-pairs from PadicHodgeTheory P7, which does not plan them. Route 5 now owns them.
- AdmissiblePairsAndPadicHodgeStructures and route 5 must agree on one owner for "filtrations versus B_dR^+-lattices".
- RD.0's Kedlaya nodes should say that they need v_ℓ discrete. The perfectoid case comes from route 2.

## 6. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FARGUES-FONTAINE-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: 0 problems.
- A local check confirms that every missing item is in exactly one route, and that every item a Part II route takes is missing.

## What I could not read

- **The published Astérisque 406 text.** The SMF offers only an excerpt, so every finding is scoped to the authors' copy of 16 avril 2017.
- **The book's external sources.** Colmez's *Espaces de Banach de dimension finie* and *Espaces vectoriels de dimension finie et représentations de de Rham*, Weinstein's π_1 paper, Kedlaya's papers [38], [42], [45], Gross–Hopkins, Drinfeld, Laffaille, Lazard and Tate were not opened. Their statements were taken as the book reproduces them; Kedlaya's Proposition 5.11 is cited for E218 as the book cites it.
- **Fargues–Scholze.** It was consulted only where a packet node quotes it.
