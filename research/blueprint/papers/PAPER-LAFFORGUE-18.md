# PAPER-LAFFORGUE-18: Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale

Vincent Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*, [J. Amer. Math. Soc. 31 (2018), no. 3, 719–891](https://doi.org/10.1090/jams/897); arXiv [1209.5352](https://arxiv.org/abs/1209.5352). In French.

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1432). Status: **complete**. All sixteen chapters and the bibliography were read. The machine-readable extraction is [PAPER-LAFFORGUE-18.result.json](PAPER-LAFFORGUE-18.result.json): 51 items (41 planned, 10 missing), 4 routes, 41 prerequisite entries and 12 recorded source issues.

**Source.** **arXiv v10** (10 January 2018), 184 pp., SHA-256 `b37715f9…1a64295`, fetched and read 2026-09-22; it is the last arXiv version and contemporaneous with publication. The **published version could not be consulted**: `ams.org` returns HTTP 403 to every client tried (curl and the sandbox's fetch tool alike), and no other copy was found. Locators are v10 pages together with the paper's own statement numbers. Crossref records no correction notice for the DOI. Every recorded source issue is therefore against v10 and may have been corrected in production — this is stated in each issue's `searched` field. Pages 140, 145, 152, 154, 160, 164, 169, 171 and 172 were also read as rendered images, because the text layer flattens the sub- and superscripts several items turn on.

## What the paper proves

**Theorem 11.11** (split G) and **Theorem 12.3** (general G). For X a smooth projective geometrically irreducible curve over F_q, G connected reductive over F = F_q(X), N ⊂ X finite and Ξ ⊂ Z(F)\\Z(A) a lattice, there is a **canonical** decomposition of C_c(K_N\\G(A)/K_N, Q̄_ℓ)-modules

  C^cusp_c(Bun_{G,N}(F_q)/Ξ, Q̄_ℓ) = ⊕_σ H_σ,

indexed by global Langlands parameters — Ĝ(Q̄_ℓ)-conjugacy classes of continuous semisimple σ : Gal(F̄/F) → ^LG(Q̄_ℓ) with the prescribed projection, unramified outside N — compatible with the Satake isomorphism at every place of X ∖ N̂ and with the limit over N. For non-split G the left-hand side is the ker¹(F, G)-indexed sum of cuspidal spaces of the pure inner forms. This is the "automorphic to Galois" direction of the global Langlands correspondence, **for every reductive group**, and the paper is entirely independent of the Arthur–Selberg trace formula. No multiplicity formula is obtained, and nothing is claimed about which parameters occur.

**The mechanism.** Shtuka stacks exist in far greater generality than Shimura varieties: for *every* finite set I, level N and representation W of (Ĝ)^I there is a stack Cht^{(I_1,…,I_k)}_{N,I,W} over (X ∖ N)^I — the intersection of a Hecke stack with the graph of the Frobenius of Bun_{G,N} — smooth over a Beilinson–Drinfeld affine-Grassmannian local model (Prop. 2.8). Its degree-zero compactly supported cohomology H^{0,≤µ,E}_{N,I,W} is a *functor* in W (Def. 4.7, using one direction of geometric Satake as a functor over X^I, Thm. 1.17), carries commuting partial Frobenius morphisms and Hecke operators, and is compatible with the **coalescence of legs** (Prop. 4.12). Creation and annihilation morphisms attached to Ĝ-invariant x ∈ W, ξ ∈ W^* then give:

- **Prop. 6.2**: the unramified Hecke operator T(h_{V,v}) equals *create two legs at v → partial Frobenius at one of them → annihilate*. Hence (Cor. 6.5) every Hecke operator extends to a morphism of sheaves on all of (X ∖ N)^I — for Shimura varieties such extensions had to be built by Zariski closure or nearby cycles. The proof is the hardest part of the first half: three cohomological correspondences, the Braverman–Varshavsky local trace formula (Prop. 6.6), the identification of the support with the étale Hecke correspondence (Lemma 6.10), a locality statement proved through **restricted shtukas** (Lemma 6.12, §6.4 — the germ of Genestier–Lafforgue), and a rigidity lemma (6.15). Remarks 6.16–6.19 record that no simpler proof was found and that Varshavsky later indicated one.
- **Prop. 7.1, the Eichler–Shimura relations**: Σ_i (−1)^i (F^{deg v}_{{0}})^i ∘ S_{Λ^{dim V−i}V,v} = 0, by a tensor-algebra computation modelled on a diagrammatic proof of Cayley–Hamilton.
- **§8**: those relations make the **Hecke-finite** part of the cohomology a union of constructible subsheaves stable under the partial Frobenius (Prop. 8.27), so **Drinfeld's lemma** (Lemma 8.2, reproved here from scratch in Lemmas 8.5–8.11) endows it with an action of Gal(F̄/F)^I; specialization is an isomorphism on Hecke-finite parts (Cor. 8.34); and Hecke-finite = cuspidal in the no-leg case (Prop. 8.23, via a contracting-element argument, Lemmas 8.24–8.25).
- **§§9–11**: from the three resulting properties of H_{I,W} alone (Prop. 9.7) the **excursion operators** S_{I,W,x,ξ,(γ_i)} are built, satisfy explicit relations (Lemma 10.1, Prop. 10.8), depend only on the invariant function f ∈ O(Ĝ\\(Ĝ)^I/Ĝ) (Lemma 10.6), contain the unramified Hecke operators (Lemma 10.2) and are unramified outside N (Prop. 10.10, found by Böckle–Harris–Khare–Thorne). Spectral decomposition of the commutative algebra B they generate — B is *not* known to be reduced, so only generalized eigenspaces are available — plus Prop. 11.7 (reconstruction of a semisimple parameter from a compatible system of invariant evaluations, resting on Richardson's closed-orbit theorem) give the theorem.

§12 redoes all of this for non-split G; §13 with F̄_ℓ-coefficients; §14 sketches the metaplectic case; §15 relates the excursion operators to geometric Langlands; §16 shows the theorem reproves the recursion ingredient of Laurent Lafforgue's GL_r theorem.

## What the atlas already has

- **Library.** Nothing. No Bun_G, no shtukas, no affine Grassmannian, no perverse sheaves, no dual group as a scheme, no automorphic forms over a function field.
- **Planned: almost everything, and this paper is the named source.** `GlobalShtukasAndFunctionFieldLanglands` GS.0–GS.5 and GS.7 cite "V. Lafforgue" in their own **Source route** fields — GS.5's reads "V. Lafforgue arXiv:1209.5352: general reductive automorphic-to-Galois theorem". 41 of the 51 items are therefore `planned`, at GS.0–GS.7 and, for the imported machinery, at EtaleDualityAndPerverseSheaves EDC.0/EDC.1/EDC.5/EDC.8, SchemeAndStackFoundations SF.1, ReductiveGroupsPartII RG2.0a/RG2.3/RG2.5, FunctionFieldArithmetic FA.3/FA.5/FA.6 and ExcursionOperatorsAndSpectralAction ES0/ES6:duality with LanglandsParameterStacks LP2.
- **The local/global boundary.** `LanglandsParameterStacks` (LP0–LP4) and `ExcursionOperatorsAndSpectralAction` (ES0–ES7) plan the *same formalism* — excursion operators by creation/Weil-elements/annihilation, the excursion algebra by invariant functions on tuples, and the reconstruction of semisimple parameters from excursion characters (LP2:semisimple-characters = Fargues–Scholze VIII.3.8) — but for the **Weil group of a local field** with finite wild ramification and Bun_G on the Fargues–Fontaine curve. This paper is the global function-field original. The two must cite one another rather than prove the same statements twice; the extraction says so in every affected item's note.
- **Not in the atlas at all.** No geometric-Langlands roadmap exists, although `geomlanglands` is one of the galaxy ids of `data/galaxies.json` — §15 has nowhere natural to go. No stage names the Laszlo–Olsson six operations on Artin stacks or the SGA 4 specialization homomorphism, both used here as black boxes. Nothing anywhere plans an Eichler–Shimura relation for shtukas, modular-coefficient decompositions, metaplectic geometric Satake or factorization gerbes.

## Routes

1. **Source of `GlobalShtukasAndFunctionFieldLanglands` GS.0–GS.7** (35 items, all `planned`). The route exists to pin the source: it gives each stage the exact statement, hypotheses and locator it has to reproduce, stage by stage (GS.0 Bun_G and the ker¹ description of its rational points; GS.1 the Beilinson–Drinfeld Grassmannian and Theorem 1.17 with its four properties, the modified commutativity constraint, the (−1)^⟨2ρ,ω⟩ Satake sign and the twisted variant 12.16; GS.2 Definitions 2.1/0.6, Prop. 2.8, Prop. 2.11 and Lemma 2.13; GS.3 the cohomology sheaves, the Hecke-finite sector and Prop. 8.23; GS.4 partial Frobenius, coalescence, creation/annihilation, Drinfeld's lemma, FWeil(η^I) and Cor. 8.34; GS.5 the excursion operators and Theorems 11.11 and 12.3; GS.6 §16; GS.7 [GL17] and the restricted shtukas of §6.4). Listing planned items in a `source` route follows `PAPER-FENG-24`, which routes its §§2 and 5.1 to GS.1/GS.2/GS.4/GS.5 the same way; `scripts/check_paper.py` requires `missing` only for `part-ii` and `new` routes.
2. **Source of `GlobalShtukasAndFunctionFieldLanglands` GS.3, GS.4, GS.5** (5 items, missing). Four things in the roadmap's direction that none of its stages plans: the **Eichler–Shimura relations** (Prop. 7.1), which GS.3's finiteness of the Hecke-finite sector and GS.4's use of Drinfeld's lemma both consume; the **F̄_ℓ-coefficient decomposition** (§13), which GS.1 explicitly defers ("integral and modular Satake are further coefficient branches") and which loses the honest Satake eigenvalue (Rem. 13.3); the two **conjectures** of §12.2 (elliptic Arthur parameters, and motivic/ℓ-independent parameters), recorded as a register of what is expected and unproved; and the **geometric-Langlands comparison** of §15, with Prop. 15.1's printed label "conditionnelle à un résultat non encore rédigé" attached.
3. **Source of `LanglandsParameterStacks` LP2, LP3** (4 items, missing). The invariant theory the reconstruction actually turns on and which the atlas's Fargues–Scholze stages consume without stating: Richardson's theorem that a tuple of H(Q̄_ℓ)-points has closed diagonal H⁰-conjugation orbit exactly when it is semisimple ([Ric88, thm. 3.6] = Lemma 11.9, with [Ric88, thm. 2.1] Hilbert–Mumford and 1.3.2), [Ric88, thm. 5.2], Hilbert's finite generation of O(H^n//H⁰), the maximality choices and continuity argument of Lemma 11.10 and the proof of Prop. 11.7, the GL_r pseudo-character shadow ([Tay91]; the string "pseudo-character" does not occur anywhere in the atlas), and the characteristic-ℓ complete-reducibility input of §13 ([BMR05, thm. 3.1], [Ser05, thm. 3.7], [Bor79, §I.3]) which is exactly what LP3, "Integral reductive invariant theory", would need.
4. **Source of `MetaplecticAutomorphicForms` MP.4** (1 item, missing). §14: the µ_N-gerbe on Bun_G, a factorization gerbe in the sense of [GL16] and defined over F_q because N | q − 1, with metaplectic geometric Satake replacing Theorem 1.17. MP.0–MP.8 are written for the symplectic/Heisenberg cover over a number field, and neither factorization gerbes nor metaplectic Satake appear anywhere in the atlas. The route carries the paper's own status: §14 **proves nothing** — it *assumes* the existence of ^LG̃ with an analogue of Theorem 12.16, justified in [FL10, Rei12, Lys14, GL16] only for split G, and then says the arguments of §12 apply; Rem. 14.2 says the F̄_ℓ-results cannot yet be extended.

## Source issues (`sourceIssues` E1–E12)

All twelve are misprints; **no mathematical error or gap was found**. All are recorded against arXiv v10, the published version being inaccessible.

- **E1.** §4.1, pp. 64–65: the second correspondence is introduced as `b = (b_1, b_2)` with `v : b_{2,!}(b_1^*(F_2)) → F_3`, and the properness condition as `p_1∘a_1 = p_2∘a_2 = p_3∘a_3`, although the diagram and the formula for `v∘u` on the same page use `b_2, b_3` throughout and no morphism `a_3` exists.
- **E2.** p. 116 and (8.4): `Cht^{({0})}_{N,∅,1}` should be `Cht^{(∅)}_{N,∅,1}` — the superscript is the partition of the leg set, empty here, and the equation's whole point is the distinction from `Cht^{({0})}_{N,{0},1}`.
- **E3.** Proof of Lemma 6.11, p. 86: "pr_1^*(F^{(I)}) et pr_1^*(F^{(I)}) sont tous les deux image inverse de S^{(I)}" — the second should be pr_2^*, or the parenthesis says nothing.
- **E4.** p. 103: `C_{{1,…,i}}(T, σ)` for `C_{{1,…,i}}(T, κ_i)`; p. 104: "la notation `C_{{0,1,…,n}}(U)` utilisée précédemment", whereas the operator defined on p. 102 is `C_J(T, U)` with subscript `J = {1, …, n}`.
- **E5.** Lemma 11.10, p. 145: "il existe un unique **g ∈ G**" — Prop. 11.7 involves only the abstract reductive H with H⁰ split; G is the global group and does not occur there, and the conclusion places g in D(g_1,…,g_n) ⊂ H_{Q̄_ℓ}.
- **E6.** §12.2.3, p. 154: the cross-reference "dans (12.1) la somme est indexée par ker¹(F, G)" should be (12.2) — (12.1) is an inclusion with no sum.
- **E7.** Proof of Lemma 12.19 c), p. 160: `(^Lβ^{ad}, ^Lβ^{ab}) : ^LG^{ad} × ^LG^{ad} → ^LG` should have `^LG^{ab}` as the second factor, as the same sentence says three words earlier.
- **E8.** Remark 12.4, p. 152: Q̄_ℓ on the left of the displayed equality and E on the right.
- **E9.** Theorem 13.2 and Remark 13.3, p. 169: bare `𝔥_σ` where `𝔥^{F̄_ℓ}_σ` is meant; on the same page both symbols are used with their distinct meanings. Verified on a page image.
- **E10.** §14, p. 171: "W une représentation irréductible de `(^LG)^I`" should be `(^LG̃)^I`, the metaplectic dual group of the functor assumed four lines above. Verified on a page image.
- **E11.** §14, p. 172: `H̃^{0,≤µ,Q̄_ℓ}_{N,I,V}` should be `H̃^{0,≤µ,E}_{N,I,W}` — (14.3) defines the E-coefficient sheaf and no representation V occurs in §14.
- **E12.** A group of typographical slips, each verified in the text: "éventuellemement" (p. 170), "mais mais" (p. 56), "est invertible" (p. 59), "corrrespondances" (p. 67), and in the bibliography "Compactification des champs **of** chtoucas" [NDT07], "pour les corps **of** fonctions" [NDT09], "(rédaction **of** J.-M. Drezet)" [Ses82], "over algebraic **curves curves**" [Sor00], "Work **annonced**" [KV13], and the citation key [Civ08] for P. Cvitanović.

**Also checked, and not recorded:**

- **Remark 1.3 is the author's own correction of the literature**, not a misprint of this paper: condition iii′)_ω̲ of [Var04, déf. 2.4] — which also appeared in arXiv versions 1–3 of *this* paper — "probably did not give the right definition of Hecke_{N,I,ω̲} (even up to reduction) when G^der is not simply connected". Any formalization must take Definition 1.2 from here, not from [Var04]. Recorded in the note of the corresponding item.
- Other self-corrections of earlier versions: Remark 12.8 says that lemma 11.5 of arXiv v3 "was erroneous, because the action of the partial Frobenius morphisms was missing from the hypotheses"; Remark 9.2 explains that the characterization by a bilinear form was genuinely used in v4 and is now only a remark; the Ξ-descent correction after Prop. 2.8 was forced by an anonymous referee.
- Every internal cross-reference reachable from the introduction was checked against the statement it names (théorème 11.11, propositions 2.8, 6.2, 7.1, 8.23, 8.27, 9.7, 10.8, 10.10, 11.7, corollaires 6.5, 8.34, lemmes 10.1, 10.6, théorèmes 1.17, 12.3, 12.16, conjectures 12.7, 12.12): all correct except E6.
- A dozen further notational inconsistencies were considered and judged deliberate abuse rather than error: the reuse of Ξ for the lattice and Ξ_n for the invariant evaluations in Prop. 11.7; ν for characters of B, for a coinvariants map and for a truncation bound; "U" for both a dense open and a representation; the level index in ǫ_{N,(I),ω̲,n̲} versus ǫ_{(I),ω̲,n̲}; and the identification Gr_{V,v} ≅ Gr_{V^*,v} in §6.5.
- Crossref for the article: no correction notice, no `update-to`, no `updated-by`. The DOIs and arXiv ids of the prerequisites are quoted from the paper's own bibliography where printed and otherwise verified individually.

## Prerequisites not yet covered

Varshavsky (the moduli of F-bundles, and the Lefschetz–Verdier trace formula); Drinfeld (shtukas, his lemma, descent along Frobenius); Mirković–Vilonen and Gaitsgory (geometric Satake with O_E-coefficients, and its form over X^I); Beilinson–Drinfeld and Beauville–Laszlo; Braverman–Varshavsky (**unpublished**: the coalescence isomorphism and the local trace formula, and the unwritten partial-Frobenius compatibility on which §15 depends); Richardson, Serre, Bate–Martin–Röhrle, Procesi, Vinberg, Hilbert, Mumford–Fogarty–Kirwan, Taylor (the invariant theory and pseudo-characters); Laurent Lafforgue, Cogdell–Piatetski-Shapiro and Laumon (the GL_r route); Eike Lau (Drinfeld's lemma in general, also unpublished); Cong Xue (finite dimensionality, deliberately unused); Genestier–Lafforgue (the local parametrization); Laszlo–Olsson and Laumon–Moret-Bailly; Zhu and Richarz (twisted Satake); Heinloth, Behrend, Arasteh Rad–Hartl, J. Wang, Bruhat–Tits (Bun_G and parahoric models); Borel (L-groups, linear algebraic groups); Satake, Cartier, Gross; Kottwitz and Nguyen Quoc Thang (ker¹ duality); Arthur, Kottwitz, Kostant (Arthur parameters); Ngô Bao Châu; Deligne (tannakian categories, Weil II, motives); Gaitsgory and Gaitsgory–Lysenko (geometric Langlands, factorization gerbes); Finkelberg–Lysenko, Reich, Lysenko (metaplectic Satake); Xiao–Zhu. Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAFFORGUE-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files …`: ok.
- Every missing item appears in exactly one route; the planned items listed in route 1 are deliberate (see above) and no `part-ii` or `new` route is proposed.
- The cited stages (GS.0–GS.7, LP2, LP2:excursion-presentation, LP2:semisimple-characters, LP3, ES0, ES6:duality, MP.4, RG2.0a, RG2.3, RG2.5, SF.1, EDC.0, EDC.1, EDC.5, EDC.8, FA.3, FA.5, FA.6) were checked live against `data/atlas.json`, every accepted restructure in `data/restructure/` and `data/roadmap-retirements.json`: none is retired or restructured (RS-28 and RS-31 mention these roadmaps only as prerequisites or consumers; RS-31 is the accepted restructure that created ReductiveGroupsPartII with the RG2 stages cited here). Library verdicts come from `data/library-coverage.json`.
- The existing extractions that route into the same roadmap were read first, so that this one builds on them rather than duplicating: `PAPER-FENG-24` (source of GS.1/GS.2/GS.4/GS.5, and the Part II `ShtukaTateCohomologyAndGlobalBaseChange`), `PAPER-CIUBOTARU-HARRIS-26` (the Part II `GlobalShtukasPartIIRamanujanArthur`, whose design job should cross-reference Conjecture 12.7 rather than restate it), `PAPER-YUN-ZHANG-17` and `PAPER-FENG-YUN-ZHANG-24` (the Part II `ShtukaSpecialCyclesAndHigherSiegelWeil`), `PAPER-SCHIFFMANN-16`, `PAPER-ZHU-17`, `PAPER-SHENDE-TSIMERMAN-17` and `PAPER-KISIN-ZHOU-25`.
- The four chapters' readings were produced with the help of four subagents working from the same PDF, and every misprint they proposed was re-verified here — in the text layer for letter-level claims and on rendered page images for the superscript-dependent ones — before being recorded; the ones that could not be confirmed were dropped.
- No Lean was written, as none is a deliverable of this job.

## Review (REV-PAPER-LAFFORGUE-18, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1433](https://github.com/CBirkbeck/tauceti-explorer/issues/1433). **Verdict: accept.**
No item, status, route or locator changed.

- **Correction: the published version IS available, and this review got it wrong first.** Its
  first pass agreed with the extraction that the JAMS text could not be retrieved, having tried
  the URL Unpaywall supplies. JAMS opens its back content after six years, and the PDF is served
  at `ams.org/journals/jams/2018-31-03/…` — the working URL carries a `/journals/` segment the
  Unpaywall URL omits, and only the variant without it is blocked. The published text was
  fetched (173 pages, SHA-256 `7825881a…4c07`, printed page = PDF page + 718) and every finding
  re-checked against it; `source.publishedVersionCheck` records the working URL.
- **The published text is not identical to arXiv v10:** `éventuellemement` (E12) occurs in v10
  but nowhere in print, so that element is annotated as a v10-only slip and not a mistake in
  published work. `mais mais` survives, at published p. 769.
- **All 12 mistakes confirmed**, three re-confirmed in the **published** text with page
  numbers now recorded: E3 (published p. 797 prints `pr₁*` twice where the line above names
  `pr₁` and `pr₂`); E6 (published p. 860 cites (12.1), which on p. 855 is an inclusion with no
  sum — the decomposition indexed by `ker¹(F,G)` is (12.2)); E8 (published p. 857 has `Q̄_ℓ` on
  the left, `E` on the right of one equality). For the other findings the verdict states what
  rests on the extraction.
- **Items and routes:** no library items; 41 planned resolving; 10 missing routed exactly
  once. The unusual planned/missing split is correct — this paper *is* the named source of
  `GlobalShtukasAndFunctionFieldLanglands`, stage by stage.
- **Cross-paper check:** route 3 routes the *characteristic-zero* invariant theory to
  `LanglandsParameterStacks` and asks that LP2 and GS.5 both import it, while
  PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 routes the *integral* form to the same stage and says so.
  The two are mutually consistent and cross-referencing.

Full report: `research/blueprint/reviews/REV-PAPER-LAFFORGUE-18.md`.
