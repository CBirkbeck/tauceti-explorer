# REV-PAPER-KEDLAYA-LIU-15: review of the extraction of Kedlaya–Liu, *Relative p-adic Hodge theory: foundations*

**Verdict: accept.** Twenty-four of the twenty-five source routes are accepted, several of them as
corrected, and route 9 is rejected. The extraction was corrected in place:
- 30 statuses changed;
- 3 items added (410–412);
- 33 item statements, 2 locators, 2 kinds, 1 name and many notes corrected;
- items moved between routes, and route 2 retargeted.

All 90 recorded source issues are confirmed, and fourteen of them had a field corrected. Fifty-four
new mistakes, E91–E144, are added:
- 7 are errors in stated results;
- 4 are errors that do not affect a stated result (E108, E112, E118, E122);
- 10 are gaps in proofs;
- 33 are misprints.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code
sessions `cc-58621d`, `cc-fb70e5` and `cc-48533a` (issue #4546).
- It had 409 items (23 library, 171 planned, 215 missing), 25 source routes and 90 `sourceIssues`,
  with status `complete`.
- `cc-f805bf` appears nowhere in its files.

Source:
- **Preprint read.** arXiv:1301.0792v5 (https://arxiv.org/abs/1301.0792v5), "version to appear in
  Asterisque", posted 9 May 2015 and the latest arXiv version.
  - I fetched the PDF and the LaTeX source on 29 September 2026. Their SHA-256 values,
    `a6a11742…d942` and `60a23edf…7377d`, match the recorded ones.
  - Printed page = PDF page.
- **Published version.** Astérisque 371 (2015) was not obtained: the SMF text is paywalled, and the
  eScholarship copy returns HTTP 403. Every finding is scoped to v5, as the extraction's
  `sourceVersions` says.
- **Corrections in print.**
  - The authors' errata are Appendix A of *Relative p-adic Hodge theory, II: Imperfect period
    rings*, arXiv:1602.06899v3 (21 October 2019). Its SHA-256 `97383900…d42c` matches.
  - Kedlaya's papers page says the errata are recorded there.
  - I also searched his notes *Sheaves, stacks, and shtukas* (final version,
    https://kskedlaya.org/papers/aws-notes.pdf). They comment on Definition 2.8.1, on the polygon
    convention of Theorem 7.4.5 and on §9.1.
  - Scholze's erratum to *p-adic Hodge theory for rigid-analytic varieties* was checked against
    §§9.1–9.2. It touches nothing Kedlaya–Liu use.

## 1. Items

**What was read.**
- The whole paper, split into eight parallel section passes: ch. 1 with §§2.1–2.4, §§2.5–2.8,
  ch. 3, chs. 4–5, chs. 6–7, §§8.1–8.4, §§8.5–8.9 and ch. 9.
- Each pass checked every item against the text and the LaTeX source, and every formula in an item
  on the 300-dpi page images.
- Two further passes checked the statuses (items 1–172 and 173–409).
- I read myself, on the text, the LaTeX and the page images:
  - the passages of every error in a stated result;
  - Hypotheses 4.2.1 and 5.0.1;
  - Definitions 2.4.1 and 3.3.4;
  - Theorem 3.3.7, Remarks 2.3.9, 2.4.4, 2.4.7, 2.8.3 and 3.1.8, Example 2.8.7, Proposition 2.8.16
    and Lemma 4.2.10.

**Coverage.** Every numbered definition, lemma, proposition, theorem and corollary has an item. So
does every remark with mathematical content, except the three the review added:
- **Item 410.** Remark 3.6.27: a rational covering by perfectoid algebras does not force perfectoidness.
- **Item 411.** Remark 9.2.14: reduced normal affinoids are pro-sheafy. The paper defers the proof.
- **Item 412.** Remark 9.3.17: evaluation of φ^d-modules on perfectoid spaces over X. It inherits
  E85.

The uncovered remarks are motivational or bibliographical:
- 1.1.5, 2.3.11(c)–(d), 2.7.1, 3.5.12, 3.5.13, 3.6.12 and 3.6.24;
- 4.2.17, 7.4.13, 8.2.15 and 8.5.19;
- 9.1.8, 9.3.1, 9.3.16, 9.4.3 and 9.5.10.

Chapters 5–7 look thin (41 items), but items there bundle several numbered statements. Every
statement falls inside some item's locator.

**Statements corrected (33).** The main ones:
- **Items 57, 64, 66, 67 and 104.** They copied the claims that E101, E104, E103 and E143 show
  false, and item 66 lacked the uniform unit. They now carry the corrected statements.
- **Items 134, 136, 155 and 156.** They now require z̄₀ ∈ R^×. Without it, Theorem 3.3.7(c),
  Lemma 3.3.9 and Theorem 3.6.5 fail (E23, E114).
- **Item 87.** It no longer says A⁺ = A° makes A reduced (E108).
- **Item 218.** A model must satisfy M_0 ⊗ (larger ring) ≅ M, not merely generate M.
- **Items 221 and 224.** They now fix the polygon convention. KL's slope polygon is drawn convex,
  with increasing slopes, so their lower semicontinuity (Theorem 7.4.5) is Fargues–Scholze's upper
  semicontinuity; Kedlaya's notes say the same. The extraction's note had blamed a sign convention
  on slopes, but those agree with Fargues–Scholze.
- **Item 174.** The degree of a φ^d-module is minus the valuation of the determinant, divided by d
  (E130).
- **Item 193(d).** The undefined ᾱ is the spectral norm α (E132).
- **Items 1, 5, 10, 11, 15, 23 and 24 (chapter 1).**
  - Item 1 added a condition (c′) the paper does not state.
  - Item 5 stated facts the paper does not state.
  - Items 10 and 11 had their kinds swapped and attributed the root criterion to Gabber instead of
    Greco.
  - Item 15 said "étale" for "finite étale".
  - Item 23 overstated the negative claim on ℚ_p-local systems.
  - Item 24 lacked the full faithfulness of ℤ_p-ILoc → ℚ_p-Loc.
- **Items 107 and 110.**
  - Item 107: multiplication by T − f is not isometric.
  - Item 110: Lemma 2.8.15 gives a splitting into monogenic algebras.
- **Items 130, 141, 158 and 168.** Citations and wording.
  - Item 130: Lemma 3.3.3 cites [87, Theorem 4.5].
  - Item 141: "dense intersection".
  - Item 158: Davis–Kedlaya.
  - Item 168: a bijection of multiplicative monoids.
- **Items 271, 350 and 378.**
  - Item 271: it now says where it departs from the printed wording.
  - Item 350: it now includes Remark 9.1.7.
  - Item 378: C̃⁺_X is not shown acyclic, since Theorem 5.3.3 excludes ℛ̃⁺.

**Locators and kinds.**
- Items 156 and 168 are on p. 89 and p. 100.
- Items 10 and 11 exchange kinds: Remark 1.2.7 is the criterion, Definition 1.2.6 the definition.

## 2. Statuses

**Library citations.** Every cited Mathlib and Tau Ceti name exists at the pinned trees (Mathlib
082e2d3, Tau Ceti f790474) and was read at its file and line. All provide their items, with these
corrections:
- **Item 40.** `NormedAlgebra` requires a normed field as the base and a contractive action. The
  paper's "Banach algebra over a Banach ring" is `RingHom.IsBounded`, and the citation now says so.
- **Item 38.** Mathlib's smoothing seminorm assumes μ(1) ≤ 1, while the paper allows α(1) > 1. The
  note now says so.

**Now library (3):**
- **Item 47.** Henkel's open mapping theorem: `TauCeti.HasZeroSequenceOfUnits.isOpenMap` and
  `.isQuotientMap`, with `IsTateRing.isOpenMap`. A topologically nilpotent unit gives a zero sequence
  of units.
- **Item 63.** `TauCeti.ValuationSpectrum.spa`, `cont`, `mem_iff_forall_vle_one` and
  `rationalSubset`.
- **Item 65.** `spectralSpace_spa_of_pairOfDefinition`, `isTopologicalBasis_spaRationalFamily` and
  `isCompact_of_mem_spaRationalFamily`. These hold over any Huber ring.

**Now planned (22).** The extraction's first checkpoint did not consult the blueprint packets. Many
§§1–3 statements are written there as nodes, often citing Kedlaya–Liu by number:
- **§1.**
  - Item 6: R3/etale-iff-trace-pairing-perfect.
  - Item 11: ClassicalAdicEtaleCohomology:H1:henselian/henselian-pair-characterisations.
  - Item 27: SchemeAndStackFoundations SF.2, "Own ... pro-etale site comparisons".
- **§§2.2–2.5.**
  - Item 48: R0/banach-completed-tensor-field-exactness, titled "(Kedlaya–Liu Lemma 2.2.9)".
  - Item 81: A3/rational-inclusion-reduction.
  - Item 83: R0 affinoid supremum-norm nodes.
  - Item 85: R1/gerritzen-grauert.
  - Items 86 and 87: R1/classical-points-constructible-density.
- **§§2.6–2.8.**
  - Items 93, 96 and 97: A1/affinoid-system-approximation, finite-etale-approximation and
    finite-etale-rational-descent.
  - Items 98–102: the R3 glueing-square, matrix-factorisation and Kiehl-glueing nodes.
  - Item 110: A4/uniform-completion-etale-comparison. A1 itself says the uniformization comparison
    belongs to A4.
- **Chapter 3.**
  - Item 114: P3/etale-over-perfect-is-perfect.
  - Item 163: P2/perfectoid-dense-image-criterion, which cites Theorem 3.6.17(b).
- **Chapter 5.** Item 200: VB1 "compare with finite projective modules on annuli ... effective
  gluing", with RF0:annuli.
- **Chapter 9.** Item 404: PadicHodgeTheory P7, through the accepted route 6 of PAPER-DING-25, which
  routes Berger's B-pairs there.

**Now missing (5).** The extraction had counted them as planned from special cases:
- **Item 256** (Lemma 8.2.17(b)) and **item 275** (Definition 8.4.3). The paper states them for any
  preadic space, but A1/etale-open-map and H0/torsion-local-systems assume X locally strongly sheafy.
- **Item 293** (Theorem 8.5.12). VB4 plans only c = 0.
- **Items 364 and 367** (Lemmas 9.2.5 and 9.2.8). They live on the paper's pro-étale site, which is
  missing. A4 plans only the torsor tower, and D2 plans the analogue on the finer site of *Étale
  cohomology of diamonds*.

**Partly planned, still missing (11).** Items 7, 42, 43, 45, 50, 66, 91, 94, 104, 120 and 159. Each
note now records the node that plans part of the item and what is left.

**Planned citations corrected.**
- Items 9, 80 and 84 cited stages that do not plan them. Their owners are A1, R3 and R1.
- Planned citations were added to items 12, 13, 46, 64, 77–79, 90, 103, 106, 109, 116 and 177.
- The notes of items 30, 69 and 70 now say that their plans are weak.

**Generality.** Hypothesis 5.0.1 holds to the end of the paper. It makes R a perfect uniform Banach
F_p-algebra over an analytic field, that is, a perfectoid Tate ring of characteristic p. The
extraction repeatedly said the paper is more general than the layers' "affinoid perfectoid S", in
the notes of items 212, 217 and 227, the reasons of routes 17–19 and the report. That is wrong, and
it was corrected. The missing chapter 5–7 items stay missing because the layers do not state them.

**Missing items I searched for** (declaration index, pinned trees, stage texts, packets, accepted
Part IIs):
- **Tau Ceti.** It has Huber rings, Spa, rational subsets and Henkel's theorem. It has no Banach
  rings in the paper's sense, no Gel'fand spectra, no uniform or stably uniform rings, no perfectoid
  rings or tilting, no sheafiness predicate and no Kiehl glueing.
- **Mathlib.** It has no Yoneda-Ext bijection, no Prüfer domains and no φ-modules.
- **Nothing else found.** Nothing else plans the remaining 201 missing items. Partial plans (Tau
  Ceti AdicSpaces Layer 6 for the field case, JacobianChallenge Layer B for Čech cohomology, the
  accepted Scholze–Weinstein-20 route for d = 1) are recorded in the notes.

## 3. Routes

Every missing item (now 201) is routed exactly once, and no Tau Ceti roadmap is re-planned. All
routes are source routes into proposed roadmaps that already point in the item's direction, so no
Part II or new roadmap is warranted. The accepted Part IIs nearest the paper were checked for
overlap. They do not own this material: AdicSpacesPartIIRigidZariskiGeometry,
VectorBundlesAndIsocrystalsPartII (Colmez–Nizioł) and ProetaleCohomologyOfPAdicCurvesAndTowers.

1. **InverseGaloisAndArithmeticFundamentalGroups IG.0.** Accepted as corrected: de Jong's analytic
   fundamental groups (item 282) moved to route 21.
2. **SchemeAndStackFoundations SF.2, formerly EnhancedDerivedSheaves E2.** Accepted as corrected.
   - SF.2 owns the pro-étale site and the l-adic coefficients of schemes. E2 only imports
     Bhatt–Scholze's replete topoi.
   - The route also takes the Čech computation of quasicoherent cohomology and Serre's criterion
     for affineness from route 23.
3. **PhiGammaModulesAndIwasawaCohomology PG.0.** Accepted.
4. **TropicalAndBerkovichArithmetic TB.0.** Accepted. The TB packet lists the general adic
   comparison as remaining TB.0 work.
5. **AdicSpacesPartII R0/R3.** Accepted as corrected.
   - Items 48, 83 and 98–102 are planned there and stay named.
   - Items 81, 85–87 and 93 (planned at A3, R1 and A1) left the route.
   - Items 91, 94 and 95 moved to route 6.
6. **AdicEtaleGeometry A1.** Accepted as corrected.
   - Item 110 moved to route 15.
   - The route gained items 91, 94, 95, 256, 364 and 367.
   - A1 owns the pro-étale extension, with Scholze's corrected coverings.
7. **FoundationsAndLibraryIntegration LI.1.** Accepted; item 6 left.
8. **FoundationsAndLibraryIntegration LI.2.** Accepted.
9. **PerfectoidSpaces P5.** Rejected: its only item is planned at H1:henselian.
10. **PerfectoidSpaces P1.** Accepted; item 163 moved to route 11.
11. **PerfectoidSpaces P2.** Accepted. It gained items 163 (planned) and 410.
12. **PerfectoidSpaces P3.** Accepted; item 114 is planned and named.
13. **PhiGammaModulesAndIwasawaCohomology PG.1.** Accepted. Katz's correspondence and its
    continuation to perfectoid spaces are PG.1's equivalence over a perfect base.
14. **RelativeFarguesFontaine RF0.** Accepted.
15. **AdicEtaleGeometry A4.** Accepted; it names item 110.
16. **AdicSpacesPartII R5.** Accepted; it gained item 411.
17. **RelativeFarguesFontaine RF0:annuli/RF1.** Accepted, with the generality claim corrected.
18. **VectorBundlesAndIsocrystals VB2:ampleness.** Accepted, with the generality claim corrected.
19. **VectorBundlesAndIsocrystals VB4.** Accepted, with the generality claim corrected; it gained
    item 293.
20. **DiamondsAndVStacks D0.** Accepted.
21. **ClassicalAdicEtaleCohomology H0.** Accepted as corrected.
    - The reason now quotes the stage exactly ("torsion local systems"; lisse sheaves come from the
      packet node).
    - It gained items 275 and 282.
22. **RelativeFarguesFontaine RF2:untilts/RF4:vector-bundles.** Accepted.
23. **FoundationsAndLibraryIntegration LI.3.** Accepted as corrected; only Yoneda Ext remains.
24. **PadicHodgeTheory P8.** Accepted.
    - It gained item 412.
    - The reason now says P8 imports the curve side from VB1/VB4 and RF1.
25. **PhiGammaModulesAndIwasawaCohomology PG.2/PG.3.** Accepted; item 404 (planned at P7) left.

## 4. Mistakes in the paper: 90 of 90 confirmed, 54 added

**Where I looked for corrections:**
- part II, Appendix A;
- Kedlaya's papers page and his notes *Sheaves, stacks, and shtukas*;
- the arXiv listing (v5 is the latest);
- `research/errata/REGISTER.md` and the `sourceIssues` of every atlas packet.

The packets already hold eleven findings on this paper. Eight match E9, E12, E14 (twice), E16, E30,
E34 and E56. The other three were missing from the extraction and are now E128
(PerfectoidSpaces/E16), E143 (AdicSpacesPartII/E58) and E144 (AdicSpacesPartII/E39).

**E1–E90: all confirmed** at their locators on the page images. The 28 attributed to the authors'
errata are in Appendix A as stated. One erratum, the typo "spaceLet" in Definition 8.2.11, is not
in v5 and is rightly not recorded. Fields corrected:
- **E7.** The same slip recurs in the proof of Lemma 2.4.13 (now E105).
- **E11.** The correction said "(so that A is reduced)", which is false (E108); removed.
- **E12.** Now a gap: ℤ_p[p√p] is not integrally closed in ℚ_p(√p).
- **E20.** [112] is the IHÉS paper, whose numbered conjectures are 1.13 and 9.3. The survey, whose
  Conjecture 2.16 is meant, is not in v5's bibliography.
- **E21.** The determinant lies locally in F_{p^a}.
- **E23 and E44.** Locators.
- **E46.** The errata change ᾱ to α, not the reverse.
- **E48.** With E49 the matrix is [π̄^u] + X.
- **E55.** Affects nothing: under the corrected local Definition 8.1.6 the printed sentence is true.
- **E60.** One perfectoid field serves all three factors of a fibred product.
- **E63.** The torsor is nonsplit also in the isogeny category. The m-th Witt component of any
  solution would not be a polynomial.
- **E84.** The perfect characteristic-p case follows from Lemma 9.2.8.
- **E85.** Only Ã⁺_X fails; C̃⁺_X is not established either.

Among the entries I re-derived myself:
- **E39.** Hypothesis 4.2.1 assumes only that L is perfect. The completed perfection of F_p((t)),
  with a = 2, gives ℚ_p.
- **E59.** The paper's own Remark 2.4.9 pair.
- **E62.** The nodal cubic.
- **E63.** Above.
- **E78.** The paper's degrees lie in (1/a)ℤ.
- **E79.** t = f².
- **E85.** H²(Ō⁺) = o_{K♭}/Tr(o_{L♭}) ≠ 0.

**New errors in stated results, all checked on the page images:**
- **E101 (Remark 2.3.9, p. 35).** "The existence of a uniform unit z forces A to be a Banach algebra
  over F_p((z))" is false without uniformity.
  - Take A = F_p((z)) with |Σaᵢzⁱ| = max ρⁱ(1 + |i|). This norm is submultiplicative and complete,
    and |z|_sp|z⁻¹|_sp = 1.
  - A bounded K → A would force |t^{±n}|_A ≤ C|t|^{±n}_K. But the leading term gives
    |t^n|_A|t^{−n}|_A ≥ (1 + nk)², which is unbounded.
- **E103 (Remark 2.4.7, p. 40).** "For 0 < ε < c" is not enough. Take A = ℚ_p × ℚ_p,
  f = (p, p³), g = (1, p⁵), g′ = (1, p²):
  - then U is the first point alone;
  - |g′ − g| = p⁻² < ε;
  - the perturbed set contains both points.

  Take ε < min(c, d), with d the infimum over M(A) of max(α(fᵢ), α(g)).
- **E104 (Remark 2.4.4, second paragraph, p. 39).** Only "continuous ⇒ restriction to K equivalent
  to the norm" holds. The rank-2 valuation on K⟨T⟩ with T infinitesimally small is bounded by 1 on
  o_K⟨T⟩ and restricts to |·| on K, but v(T) < v(ϖⁿ) for all n.
- **E111 (Example 2.8.7, p. 61).** X is not in A, since every generator Uⁿ X^⌈log₂ n⌉ has U-degree
  ≥ 1. So {v(X) ≤ 1} is not a rational subset, and r > 1 is needed. Mihara's example includes X and
  takes r ∈ (1, ∞).
- **E114 (Theorem 3.3.7(c), Lemma 3.3.9, pp. 77–78).** The unit condition z̄₀ ∈ R^× is needed
  already here. Take R the completed perfection of F_p{T} with |T| = p⁻¹ (so o_R = R) and
  z = [T] − p:
  - z satisfies Definition 3.3.4 as printed;
  - the point with γ(T) = 0 is in M(R), but its image has γ([T]) = 0 < p⁻¹, so it is not in
    M(W(o_R)[[T]⁻¹]/(z)).

  The errata impose the condition only "starting in section 3.6".
- **E143 (Remark 2.8.3(a), p. 59; AdicSpacesPartII/E58).** "Isometric if and only if
  M(B) → M(A) is surjective" is false. K⟨T⟩ → K⟨T, T⁻¹⟩ is isometric for the Gauss norms, but the
  image of the spectrum is {|T| = 1}.
- **E144 (Remark 2.4.4, first paragraph, p. 39; AdicSpacesPartII/E39).** The norm needs z ∈ A0.
  Take ℚ_p(√p), A0 = ℤ_p + pℤ_p√p, z = √p and c = 1/2. Then α(1 + √p) = 4 > α(1) + α(√p) = 3/2.

**New errors that affect nothing downstream or only a proof:**
- **E108.** "A⁺ = A° (and hence A is reduced)" is false, for example for K[ε].
- **E112.** The constant of Proposition 2.8.16(b) fails for T(T − λ) with |λ| > 1.
- **E118 and E122.** The bound in Remarks 3.1.8 and 3.6.16 needs max{1, |fᵢ|}. With |f| < 1,
  y = T^{1/p} gives |z| = |f|^{1/p}.

**New gaps:**
- E94 (Lemma 1.4.8: R′ need not be local);
- E98 and E99 (Lemmas 2.2.3–2.2.4);
- E106 (Proposition 2.4.20);
- E109 (Proposition 2.5.14(a) uses a non-rational localization);
- E110 (Lemma 2.8.6 for infinite ℓ/k);
- E113 (Lemma 2.8.15 uses Frac A);
- E115 (Remark 3.1.6(d) shows only that the spectral seminorm is a norm);
- E138 (a minor in the proof of Lemma 7.3.3(b));
- E139 (Corollary 8.7.10 cites the φ-version for a φ^a-statement).

**New misprints (33).** All were checked against the page images and the LaTeX. The largest are:
- E95: H^i_φ is computed by Hom out of the resolution, not by tensoring.
- E96: "optimal" omits "almost optimal".
- E130: the missing minus sign in Convention 4.1.13.
- E137: the element is an invariant section of M(n).

**Not recorded** (minor or not settled):
- Remark 6.3.20 cites 6.3.16 for 6.3.15.
- The "only if" of Lemma 3.4.8(c).
- The descent step in Theorem 9.5.8 (b)⇔(f) for Spa(K, o_K).
- The proof of Corollary 9.3.15, which cites the étale-only Theorem 9.3.13 for pure modules.
- The Newton-polygon step of Lemma 8.9.3(b).

## 5. Corrections made

These are listed in full in the "Corrections by the independent review" section appended to
`PAPER-KEDLAYA-LIU-15.md`. In summary, the review made these changes in
`PAPER-KEDLAYA-LIU-15.result.json`:
- the review verdicts on E1–E90, with fourteen field corrections;
- the new issues E91–E144;
- items 410–412;
- the 30 status changes;
- the statement, locator, kind, name, note and citation corrections listed above;
- the route item lists;
- route 2's retargeting;
- the reasons of the routes that changed;
- the summary.

In the extraction report, the review updated the counts, corrected the generality sentence, and
rewrote the paragraphs of routes 2, 9, 17, 19 and 23.

**For the maintainer.** The status pass found packet proofs that use results of this paper which
no node states:
- Lemma 2.4.17(a) (item 74) and Proposition 2.6.4 (item 95);
- Theorem 1.2.8 and Proposition 1.2.5 (items 12 and 9);
- Theorem 2.3.10 (item 58), which the TB packet lists as remaining work.

Node PerfectoidSpaces:P3/etale-descent-perfectoid says Mathlib gives descent of projectivity along
faithfully flat maps; it does not (item 16, route 7).

## 6. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KEDLAYA-LIU-15.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: 0 problems.
- A local check confirms that every missing item is in exactly one route, and that no library item
  is routed.

## What I could not read

- **The published Astérisque 371 text.** It is paywalled, and the eScholarship copy returns
  HTTP 403.
- **R. Rodriguez's thesis** (eScholarship, HTTP 403), the source of Theorem 5.3.9.
- **De Jong's and Mihara's papers.** Their statements were taken as the paper reproduces them.
  Mihara's arXiv v1 was consulted by a section pass for E111.
- **The external citations of §§8.7–8.8.** Stacks 01XG, Thomason–Trobaugh B.8, Hilton–Stammbach
  IV.9.1 and EGA III 1.4.1 were not opened.
