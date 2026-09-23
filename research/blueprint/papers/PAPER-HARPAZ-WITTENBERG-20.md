# Harpaz–Wittenberg (2020): extraction and routing

Issue [#1426](https://github.com/CBirkbeck/tauceti-explorer/issues/1426). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints of Codex sessions codex-c83e7a and codex-a71f92 (#1665), whose material follows below.
- **The paper.** Yonatan Harpaz and Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*, J. Amer. Math. Soc. 33 (2020), 775–805. The version read is the author manuscript of 23 September 2019, which has the same text as arXiv v2.
- **Items.** The result has **150 items: 7 library, 12 planned and 131 missing**. Every missing item is routed exactly once. Item 75 (Remark 4.5), the checkpoint's only unrouted item, is now routed with a corrected statement.
- **Mistakes.** Two are recorded under `sourceIssues`, the first ones for this paper.

## This continuation (cc-442dc5)

**What was read.** The author manuscript was read in full, §§1–7 (same SHA-256 as the checkpoint's copy). Crossref and the author's publication page show no correction.

**Remark 4.5 (the checkpoint's gap G1), now E1.** The remark states that, for smooth proper X and a dense open V ⊂ X with k̄[V]^× = k̄^× and torsion-free Picard groups, weak approximation for the universal torsors of V implies it for those of X. It does not assume X rationally connected. The justification applies Theorem 4.2(i) to a fibration Z → P^n whose fibres are universal torsors of V. Theorem 4.2, however, is stated in the setting fixed at the start of §4, where the generic fibre is rationally connected. Its proof uses Theorem 4.1, whose hypotheses "sont ici satisfaites en vertu de [GHS03]".
- The fibres here are birational to V × (torus), so they are rationally connected exactly when X is.
- With "X rationally connected" added, every step goes through:
  - Proposition 3.3(i) gives the section over k̄;
  - Theorem 4.2(i) gives density in the Br₁-Brauer–Manin set;
  - CTS87 Théorème 2.1.2 gives Br₁ = Br₀.
- Item 75 now states this corrected version and is routed with Theorem 4.2 to the homogeneous-spaces Part II.
- The remark is not used anywhere else: Theorems A, B, 6.1 and 6.6 concern rationally connected varieties.
- Whether Skorobogatov's fibration theorem gives the printed generality remains open, because Sko90 was not obtained. It is recorded in the finding, not claimed.

**E2 (misprint), p. 4.** "Q_{2^m} … pour un entier m ≥ 1" should read m ≥ 3. The generalized quaternion group needs m ≥ 3, and the text's own comparison with the known cases m ≤ 4 (Q₈, Q₁₆) confirms the intended range.

**The rest of the paper was checked** and no other mistake was found. This covered the torus descent of §2, the comparison of universal torsors in §3, the fibration theorems of §4, the lifting of actions and the Sylow reduction in §5, the induction of §6 (including that the fibres over codimension-one points of Q are split, which the proof of Theorem 6.6 leaves implicit), and the E⁺ formalism of §7.

**Why the status is now complete.**
- Every numbered statement and every cited input is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The checkpoint's remaining work is the decomposition of cited suppliers' proofs (CTS87, CTS00/HS13, Sko90/Sko96/Har97, GHS, Wit12, PR94, Borovoi). Those theorems are items, and their sources are listed under `prerequisites`.

## Source and acquisition

The [author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf) was retrieved at 2026-09-21T19:42:25Z, SHA-256 `2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9`. It is dated 26 February 2018, revised 23 September 2019. Read: introduction and conventions pp.1–7, §2 pp.7–11, §3 pp.12–15, §4 pp.15–18, §5 pp.18–21, §6 pp.21–24, §7 pp.24–28 and all references pp.28–31. Locators refer to these pages.

[arXiv:1802.09605v2](https://arxiv.org/abs/1802.09605v2), SHA-256 `54cd8757102b7e67437486c35e26a48597a6686c117031ff57c09c433f19f1de`, has the same mathematical text. Normalized page comparison found only its first-page arXiv header and the final Email/E-mail spelling. The author's publication list and Crossref identify JAMS **33 (2020), 775–805**, [DOI 10.1090/jams/943](https://doi.org/10.1090/jams/943). The publisher PDF returned HTTP 403; no claim is made to have read that PDF.

The preceding checkpoint's prerequisite reads were targeted, not represented as full-paper reads: HW16 printed pp.259–260,266–268,284; DLA19 Definition 5.1 and Theorem 5.2 in both public versions; Har08 definitions pp.595–596 and Theorem 2 p.604; Dem10 author pp.10–12; LA19 §6 pp.14–17; DLAN17 Proposition 2.4, printed p.1018; Wit18 Remark 3.9 and its surrounding hypotheses. The JSON prerequisite list distinguishes these from originals still requiring acquisition and decomposition.

This continuation re-downloaded both HW20 versions and checked their hashes, then read every author page again. Additional targeted sources, acquired 21 September 2026:

- [Borovoi author manuscript](https://www.tau.ac.il/~borovoi/papers/manin.pdf), dated 1 February 1995, 15 author pages, SHA-256 `4fce37c24e03869e8fd444120b94db763e398fb57eab1ed12a587b856b76f928`: read introduction/conventions pp.1–4, §2 p.6, Lemmas 3.1–3.2 and Proposition 3.4 with its proof pp.7–9; bibliography entries [Bo2]/[Bo4]. The published reference is J. reine angew. Math. 473 (1996), 181–194; the author's publication list supplies this manuscript. This is not a claim to have read all its remaining arguments or the publisher PDF.
- [DLA19 arXiv v4](https://arxiv.org/pdf/1704.08646v4), SHA-256 `d74571abbcad95b544c30217e37a09a36c2dec197770aaeac37b1e1ce4fc2a31`: §2 conventions and §5 pp.22–23, including Definition 5.1, Theorem 5.2, Proposition 5.3 and its proof. Varieties are smooth geometrically integral; the predicate is tested also on varieties birational to homogeneous spaces.
- [Harari 1997](https://www.numdam.org/article/BSMF_1997__125_2_143_0.pdf), SHA-256 `b8c2deda9f39e4a1d6643674facbee096d69209c47954c27fe9fd912cedc8297`: §3.2, printed pp.154–158, including Theorem 3.2.1, Lemma 3.2.2 and the Hilbert-subset remark. This is a prerequisite interface read, not a complete paper read.

## Mathematical coverage and boundaries

Section 2 descends adelic points through **torus** torsors while controlling the full unramified Brauer group. Theorem 2.1 assumes smooth geometric integrality, not rational connectedness. Corollary 2.2 adds proper rational connectedness for descent through a torsor on a dense open. The relative Brauer group, units exact sequence, edge map, twist independence, evaluation translation, residual Sha functional, Poitou–Tate shift and its removal are individual items.

Harari's adelic theorem is used with its topology intact. His restricted product has Tate-modified infinite factors; the ordinary torus adeles map onto those factors, and the pairing factors through that map. H² of the character lattice is discrete. In the torus specialization the abelian-variety part is zero, so his finiteness assumption on its Tate–Shafarevich group is automatic. The twist convention is `[Y^σ]=[Y]+σ`; Proposition 2.6 then has its stated minus sign.

Section 3 starts with constant geometric units and the Picard boundary sequence. The pullback character module is not declared torsion-free until proved so. Proposition 3.1's three conclusions are separate. Proposition 3.3 distinguishes an actual geometric section for torsion-free characters from a rational section for cyclic torsion with a rationally connected compactification. Finite multiplicative-type torsors require the torsion character API, not just torus lattices.

Section 4 keeps distinct: split codimension-one fibres over the entire affine space; split fibres over the torus plus geometric splitting of the affine boundary; and the conditional nonsplit rational-point theorem. The norm pullback family contains all twists because the larger torus is quasitrivial. The zero-cycle fibration theorem is unconditional and tests **closed points** of a Hilbert subset. HW16's generic H¹ and A₀ hypotheses are extracted with their rational-connectedness inputs. Its Conjecture 9.1 retains the local norm and degree-one-place conditions, without adding integrality of the approximating element.

Section 5 includes the finite étale cover action, injective torsor types, stabilizer exact sequence and outer-action compatibility separately. A universal torsor replaces the finite stabilizer by its derived subgroup. Profinite Sylow existence is built, but the arbitrary surjective-image theorem remains planned in the reviewed audit. The cosets in Lemma 5.6 are **sets**, since the Sylow subgroup need not be normal. The fixed field of the pro-p Sylow image can be infinite; the finite cover and its action must be descended to a finite intermediate extension.

The Grunwald corollary needs more than Theorem B. LA19 proves constancy of unramified evaluation at real places and at finite places prime to the stabilizer order where it is unramified. DLAN17 converts quotient approximation into surjectivity on local H¹. Auxiliary unramified cyclic conditions, one for each conjugacy class, then force the global character to have full image: a proper subgroup misses a conjugacy class. This preserves the distinction between a weak cohomological solution and a proper realization. Quaternion quotients use both algebraic and geometric Brauer vanishing. The standard generalized-quaternion range is m≥3; the source's m≥1 notation is recorded rather than silently used as a definition.

Section 7 defines the modified local Chow product, its completion, E, E⁺ and the middle defect group. Complex factors vanish; real factors are norm quotients. The universal quantifier over **all finite extensions** in E⁺ is retained. No finiteness of the defect group is assumed: prime-to-p degree annihilators for every p generate the unit ideal. An ℓ-variety viewed over k through its structure morphism is not Weil restriction and may cease to be geometrically irreducible; its grouped local cycle-complex dictionary is an explicit proof obligation. The final Galois consequence has degrees with collective gcd 1, not pairwise coprimality, and does not prove inverse Galois over the original field.

## Library and atlas evidence

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements were opened and read before classifying a library item:

| Item | Pinned declaration evidence |
| --- | --- |
| `PAPER-HARPAZ-WITTENBERG-20/1` | `TauCeti.torusCommHopfAlgProperty`, `splitTorusCommHopfAlgProperty`, Torus/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/2` | `TauCeti.multiplicativeTypeCommHopfAlgProperty` and its diagonalizable-coordinate-ring equivalence, MultiplicativeType/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/3` | `TauCeti.CommHopfAlgCat.geometricCharacterGroup_fg_of_multiplicativeType`, CharacterLattice.lean |
| `PAPER-HARPAZ-WITTENBERG-20/22` | `AlgebraicGeometry.AlgebraicCycle`, AlgebraicGeometry/AlgebraicCycle/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/47` | `AddCommGrpCat.injective_of_divisible`, Algebra/Category/Grp/Injective.lean |
| `PAPER-HARPAZ-WITTENBERG-20/87` | `TauCeti.IsProPSylow`, Profinite/Sylow/Basic.lean |
| `PAPER-HARPAZ-WITTENBERG-20/88` | `TauCeti.exists_isProPSylow`, Profinite/Sylow/Existence.lean |

The ambient cycle carrier does not supply CH₀. `AlgebraicCycle.map` has residue-degree weights and `map_id`; it does not prove Chow descent or composition. Likewise, character modules and Galois descent files do not justify claiming the entire multiplicative-type antiequivalence and exactness comparison as built. Exact upstream planned owners are used for those broader statements.

Atlas inputs were read at `d76643df4405140aed1dfade7a21b9159db80017`. Reviewed coverage for RP.2/RP.3, SF.5, AA.1/AA.4 and profinite Sylow theory was checked. Relevant full roadmap descriptions, upstream Layers 3–7 of ReductiveGroups, the six new roadmap files, the existing packet and reserved identifiers were examined. All **211 atlas roadmap extracts** were searched for homogeneous spaces, universal torsors, rational connectedness, zero-cycles and supersolvability. No current layer supplies E⁺ or the homogeneous fibration induction. No reviewed audit entry was present for either reductive-groups roadmap; that absence was not treated as evidence that its library was empty.

Continuation refresh at `ab70a4827ce9461bb1055187ad8ef4656c0864f4`: reread the relevant full stage descriptions for RP, SF, arithmetic duality, inverse Galois, AA, RG2 and upstream ReductiveGroups, and the profinite Sylow stage; refreshed reviewed coverage for SF.1–SF.5, RP.2–RP.3, R02.4, AA.1/AA.4 and profinite Sylow theory, plus the new-roadmap/packet and reserved-ID lists. The preceding 211-roadmap screen is retained as such, not claimed to be a new full-catalogue read. Reopened all seven library declarations at the pins and searched both library trees for the new homogeneous-space interfaces. Existing radical and fppf group-quotient infrastructure is not re-planned: the missing quotient item 145 is the representable quotient of a possibly twisted homogeneous space, with its orbit/fibre and descent comparisons. Generic quotient and descent foundations remain upstream ReductiveGroups Layers 3–5 and SF.1. The shared homogeneous candidate owns items 139,145–148; the zero-cycle candidate owns the E⁺ specialization 115,149–150.

## Routes and shared ownership

The twelve source routes use existing owners: RG2.0a for Weil restriction; SF.2 for étale cohomology/purity; SF.3 for Picard localization; SF.4 for characteristic-zero compactification; SF.5 for Chow operations; RP.2 for Brauer evaluation and its cycle extension; RP.3 for torus descent; R02.4 for torus/lattice arithmetic duality; IG.0–IG.1 for finite étale fundamental groups; IG.2 for Hilbert subsets; IG.4 for the new proved realization prescriptions; AA.4 for simply connected weak approximation and the required torsor interfaces. These are not duplicate upstream plans.

`HeightsRationalPointsPartIIHomogeneousMassey` is deliberately the **same pending candidate** proposed by PAPER-HARPAZ-WITTENBERG-23, with the same title. Its earlier brief already requested HW20 Theorem B and finite-stabilizer Picard/Brauer inputs. The present 53-item route supplies that general foundation and its proof. The HW23 continuation was completed in PR #1664; neither completion nor merge makes its candidate an accepted roadmap. This route does not claim it is an accepted roadmap or mark its items planned. Design intake must retain one copy of the shared theorem and preserve the Massey-specific continuation.

`HeightsRationalPointsPartIIZeroCycles` receives 45 items: reusable RC geometry followed by the completed cycle complex, E/E⁺, fibration/descent reductions and Theorem A. It imports the Chow and Brauer machinery, and the homogeneous-stabilizer fibration layer. Order the stages as **RC geometry → homogeneous/torsor geometry → E⁺ arithmetic induction**. This resolves the apparent reciprocal roadmap dependency without making a stage cycle.

## Resolved G2: the exact broader ascent argument

This is a verification for the particular property E⁺, **not** a theorem that the two definitions of a good property are equivalent for arbitrary properties.

1. In Borovoi's notation, a simply connected connected affine group G has G/R_u(G) semisimple simply connected. Proposition 3.4 is explicitly stated for that class, not just semisimple G. With connected geometric stabilizer H=H^ssu, part (i) gives a rational point from points at all archimedean places; complex points are automatic. Part (ii), once a rational point exists, gives weak approximation at every finite set of places. Items 139 and 148 split these two conclusions. Together they give HW20's (⋆).
2. The proof of part (i) explicitly constructs V→V/R_u(G) by Lemma 3.1, with homogeneous unipotent fibres. It applies the semisimple real-Hasse theorem to the quotient and Lemma 3.2(i) to lift the resulting point. Lemma 3.2(ii) separately proves weak approximation for unipotent homogeneous spaces using the characteristic-zero exponential and vanishing of unipotent H¹. These are items 145–147. Borovoi's general weak-approximation statement itself cites [Bo2] Theorems 1.1 and 1.4; the full proof of that earlier work is not claimed to have been read.
3. Let f:V→W be a morphism in DLA19 Definition 5.1(iii). Compactify W smoothly to X, compactify the graph of f, and resolve while preserving the smooth open V, obtaining F:Y→X with Y smooth proper. Its generic fibre contains V_η densely. The latter is homogeneous under a connected linear group over k(W), so over an algebraic closure it is unirational; its smooth proper model Y_η is rationally connected. This uses the geometric homogeneous-space input (12), not an arithmetic theorem over k(W).
4. Shrink W to one dense open W₀ where F is smooth with geometrically integral fibres and V_w is dense in Y_w. Such a uniform open follows from generic smoothness, geometric integrality and the fibre-dimension bound for the closed boundary. The shrinking is geometric and precedes any extension k′/k. If k′/k is finite and w∈W₀(k′), it factors through a closed point with residue field inside k′. The homogeneous fibre and its group extend to k′, preserving the conditions on the unipotent radical, semisimple quotient and geometric stabilizer.
5. Apply Borovoi Proposition 3.4 over that number field k′: V_w satisfies (⋆). For every real completion, the smooth dense open V_w is dense in Y_w by the implicit function theorem; weak approximation and rational-point existence transfer between a smooth variety and its dense open as in HW20 Lemma 6.3. Thus Y_w satisfies (⋆). This proves **all** finite-extension fibre tests in Definition 7.2 on the **same** W₀, as required by item 150.
6. Consequently F is E⁺-admissible. HW20 Lemma 7.4 gives E⁺(X)⇒E⁺(Y); Lemma 7.5 makes this independent of smooth proper models. Lemmas 7.5 and 7.6 already give stable-birational invariance and descent with a section. Hence the compactification-E⁺ property satisfies DLA19's broader good-property definition (149), and its Theorem 5.2 applies.

No global group action on the entire fibration is assumed; the unipotent quotient appears only in the pointwise homogeneous-space theorem. In particular, no unproved relative quotient or affine-bundle assertion is needed. The example G=SL₂⋉G_a², H=1 lies in this broader class but is not semisimple, while G_m is excluded. Over a totally imaginary number field, the real-point antecedent is vacuous, so the conclusion requires actual rational points; it is not merely an all-place Hasse implication.

## The checkpoint's gap G1 (now E1)

**G1 — `PAPER-HARPAZ-WITTENBERG-20/75`, Remark 4.5.** Its stated hypotheses do not include rational connectedness, while the cited Theorem 4.2(i) inherits that condition from §4. Wit18 Remark 3.9 repeats the broader assertion. Acquire Sko90's more general fibration theorem and supply the hypothesis bridge, or give an independent proof. The remark is not used in the RC main-theorem induction. This is a scope check, not a demonstrated false statement.

## Prerequisite boundary (checkpoint)

G1 was the only unrouted item; cc-442dc5 routes it with a corrected statement (E1). Sko90's original Theorem 1 has not been acquired. Author-site searches supplied no copy; the apparent book OCR mirror returned a maintenance page, and the Sko96 publisher DOI did not expose readable full text. Har97 was acquired, but its Theorem 3.2.1 requires a geometric section on general lines, finite geometric Brauer group and torsion-free geometric Picard group. These additional hypotheses cannot just be omitted to close Remark 4.5. No assertion that the remark is false is made.

The deeper prerequisite proof decompositions remain for the designs: CTS87 type/universal-torsor theory, CTS00/HS13 open descent, Sko90/Sko96/Har97 fibration proofs, GHS/Kollár geometry, Wit12/CT05 cycle finiteness, PR94 arithmetic groups and Borovoi's earlier [Bo2]/[Bo4] inputs. This continuation closes a precise **scope mismatch**, not every theorem in those sources. The item/prerequisite register exposes these imports. Leave status partial until G1 has a verified proof interface and route.

## Mistakes found (`sourceIssues`)

- **E1** (gap; affects a stated result), Remarque 4.5, author manuscript p. 17 (arXiv v2 the same). *Printed:* Si X est une variété propre et lisse sur k, si V ⊂ X est un ouvert dense tel que k̄[V]∗ = k̄∗ et si les groupes Pic(X_k̄) et Pic(V_k̄) sont sans torsion, le théorème 4.2 (i) et la proposition 3.3 (i) permettent de justifier l'implication suivante, énoncée dans [Wit18, Remark 3.9] : si tout torseur universel de V vérifie l'approximation faible, alors tout torseur universel de X vérifie l'approximation faible. *Correction:* Add the hypothesis that X is rationally connected. With it, the generic fibre of π′ : Z → P^n (a universal torsor of V) has rationally connected smooth compactifications, so Theorem 4.2(i) applies and the argument goes through. Without it, a different fibration theorem would be needed (possibly Skorobogatov's Sko90, Theorem 1, which was not checked). *Reason:* Theorem 4.2 is stated in the setting fixed at the start of §4, which assumes that the generic fibre of f : X → P^n is rationally connected; its proof uses Theorem 4.1, whose hypotheses 'sont ici satisfaites en vertu de [GHS03, Theorem 1.1]', that is, through rational connectedness. In Remark 4.5 the generic fibre of π′ is birational to V × (torus), hence rationally connected only if X is. The remark is not used later: Theorems 6.1, 6.6 and A concern rationally connected X.
- **E2** (misprint; affects nothing), Introduction, author manuscript p. 4. *Printed:* si Γ = Q_{2^m} est le groupe quaternionique d'ordre 2^m pour un entier m ≥ 1 *Correction:* m ≥ 3 (for m = 2 the presentation gives the cyclic group of order 4, and for m = 1 it is not defined). *Reason:* The generalized quaternion group Q_{2^m} = ⟨x, y | x^{2^{m−1}} = 1, y² = x^{2^{m−2}}, yxy^{−1} = x^{−1}⟩ is defined for m ≥ 3; the comparison with the known cases 'm ≤ 4' (Q₈, Q₁₆) confirms that this is the intended range. For cyclic groups the weak-approximation statement is classical, so nothing is affected.

## Checkpoint validation

Every definition and construction has an API and three discriminating tests in its note. The preceding checkpoint's scratch computations checked the three order-two lines in C₂² under an order-three outer action (none invariant), all five proper S₃ subgroups (each misses a conjugacy class), a nonnormal Sylow coset example of prime-to-p size, and the collective-degree identity 6+10−15=1. This continuation independently reruns those finite checks and adds exact rational-coordinate tests for the upper-unitriangular group modulo its centre, a model for item 145. These are mathematical boundary checks, not proofs of the arithmetic theorems.

`check_paper.py`, intake file validation, and a custom audit check schema, all item/route identifiers, current stage owners, unique missing-item assignment except the one declared gap, definition APIs/tests, and the exact three allowed files. No Lean file is a deliverable for this paper job; Lean was not compiled and no formalization is claimed.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once. There are no unrouted items.
- **Findings.** Both findings were checked at their locators; E2 against the page image.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E1: that the remark needs X rationally connected as justified, and the corrected item 75.

## Review (REV-PAPER-HARPAZ-WITTENBERG-20, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1427), **accepted** this
extraction and all fourteen routes, with ten locator page numbers corrected. The full record is
[REV-PAPER-HARPAZ-WITTENBERG-20.md](../reviews/REV-PAPER-HARPAZ-WITTENBERG-20.md).

The recorded hash of the authors' PDF reproduces, and its printed pages coincide with the PDF's. 150
items, all 131 missing routed exactly once; all stage ids, planned layer ids and all nine library
declarations check out; all 39 numbered results are cited by items.

**Correction.** Ten citations named a page one away from the declaration: Proposition 2.3 is on p.9
(cited p.8 in four items), Proposition 2.6 on p.11, Corollaire 2.2 on p.8, Corollaire 3.2 on p.13,
Théorème 4.2 on p.16 (cited p.15 twice) and Définition 6.4 on p.22. The two "proof of" locators that
also differ are right as they stand, and the two external "DLA19 Definition 5.1" citations were left
untouched.

Both findings are **confirmed**. E1: the standing setting of §4 (p.15) fixes a dominant `f : X → P^n`
whose generic fibre is rationally connected, and Remarque 4.5 (p.17) invokes Théorème 4.2(i) for an
`X` assumed only proper and smooth, so the hypothesis is missing. E2: `Q_{2^m}` is defined for
`m ≥ 3`, not `m ≥ 1`.
