# REV-PAPER-KURINCZUK-SKODLERACK-STEVENS-21: review of the extraction of Kurinczuk–Skodlerack–Stevens, *Endo-parameters for p-adic classical groups*

**Verdict: accept, after corrections made in place.**

- **Routes.** All four routes are accepted. They are the `part-ii` branch of SmoothRepresentationsPartII for classical groups, and source routes to GN.2, LP0 and ML.4.
- **Version of record.** The extraction read only arXiv v3. The version of record is open access, and the review read it from the UEA repository. Every finding is collated with it.
- **Mistakes.**
  - All 37 recorded mistakes are confirmed. Print corrects six of them; one more (E37) is moved in print but still wrong.
  - Every `known` field had "new: …", which scripts/errata.py files as corrected in print; they now read "new".
  - The review adds fourteen, among them an error in the example opening §10.2 (E48) and three gaps in proofs whose results stand.
- **Items.**
  - The standing preamble of 75 items put G° = G ∩ SL_F(V), which is wrong in the unitary case.
  - Three items carried printed statements marked "as printed" and now state the corrected results, as PROTOCOL.md §18 requires.
  - Ten other items have smaller fixes.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-48533a` (PR #4622, issue #4585). It had 413 items (390 missing, 21 planned, 2 library), four routes and 37 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Sources:

- **Preprint.** arXiv:1611.02667v3 (31 August 2020, the latest version). PDF SHA-256 `1cbcbb77…9092`, matching the recorded hash. I also read the LaTeX source (the main file and its eleven section files), and every finding cites its source lines.
- **Version of record.** Invent. Math. **223** (2021) 597–723, doi:10.1007/s00222-020-00997-0.
  - Crossref lists it under CC BY 4.0 and records no update, erratum or correction.
  - The University of East Anglia repository (eprint 76674) serves the published PDF: 127 pages, SHA-256 `4098a4a1…122e`.
  - Printed page p is PDF page p − 596. Print keeps the arXiv v3 numbering of every section, statement and equation in §§1–12 and the appendix. So the item locators still refer to v3, and each finding now also gives its printed page.
  - Subscripts, primes and tildes are unreliable in its text layer, so every passage where they matter was checked on a rendered page image.

Method: three read-only checkers each took one part of the paper (§§1–6, §§7–9, and §§10–12 with Appendix A). Each checked every finding and item in its range against the TeX source and the rendered printed pages, and I rechecked every new finding and item fix at its TeX lines before accepting it.

## 1. Items

The items cover every numbered definition, theorem, lemma, proposition, corollary and remark of §§1–12 and Appendix A, and the external results the proofs invoke. Statements and locators agree with arXiv v3, with the exceptions corrected below. A mechanical check matched all 161 numbered statement headings of the v3 text against the item names and locators. Only Remark 3.22 has no item. It explains why one of two bijections W^ε(E/E_o) → W^ε(E′/E′_o) was chosen and asserts nothing new, so no item is needed. No definition or key theorem on the way to Theorem 11.9, Theorems 12.9 and 12.29 or Corollary 12.34 is missing.

**Standing hypotheses.** Seventy-five items of §§10–12 and the appendix open with a preamble that said "G° = G ∩ SL_F(V), the F_o-points of a unitary, symplectic or special orthogonal group". In the unitary case G ∩ SL_F(V) is SU(V, h), but the paper's G° (§1.6, p. 3; §4) is G itself in the unitary and symplectic cases and SO(V, h) in the orthogonal case. This changed the meaning of the §11 items (G°_β, J₋ = J ∩ G°, cuspidal types for G°, Theorems 11.8 and 11.9) for unitary groups; in §10 and §12.5, which are orthogonal only, it was harmless. The preamble now follows §1.6, and so do the route 1 brief and the setting in the report.

**Items corrected to their correct statements** (PROTOCOL.md §18):

- **308** (the example of §10.2) adds the hypothesis that makes it true for r ≥ 1 (E48).
- **309** (Theorem 10.4) concludes conjugacy by an element y ∈ G° with yΛ^i = Λ′^{ζ(i)}, the form print adopts (E32).
- **376** (the counting formula) states N(θ₋, G̃, G) = 2^{max(|I₀| − n₀, 0)} (E36).

**Other item fixes:**

- **26.** The content is the unnumbered text after Remark 3.8, not the remark itself; locator and name corrected.
- **94.** The conjugacy of self-dual regular strict lattice sequences of equal period is false without a common duality normalisation. Counterexample: in a symplectic plane, Λ(k) = p_F^k(o_F e_1 ⊕ o_F e_{−1}) has Λ^# = Λ, while Λ′(k) = p_F^k(o_F e_1 ⊕ p_F e_{−1}) has Λ′^# = Λ′ + 1. The item now states the normalised form, which is the one every use has ((Λ†)^# = Λ†, or Λ(0)^# = Λ(0)).
- **113.** It repeated the v3 claim that the self-dual †-construction always gives a standard stratum (E40); it now says standard exactly when e(Λ) is even.
- **160 and 177.** Both invoked black boxes with the wrong hypotheses. They now state the ones the paper uses: in the proof of Lemma 6.11, [Λ′, n, r, β′] simple and c ∈ a_{−(r+1)}(Λ′); in the proof of Proposition 6.2(ii), [Λ′, n′, r′, β′] simple with r ≤ r′.
- **244.** Remark 8.9 in v3 lacks e(Λ) = e(Λ′). The item keeps the hypothesis, which the matching needs, and its note now says so (E43).
- **376 and 377.** The locators move to p. 73. Item 377 is Definition 12.30 in §12.5.
- **383.** n_{−r}(β, Λ) is taken inside a₀(Λ), as in the appendix, not inside A.

## 2. Statuses

- **Library.** Both library items hold.
  - Item 22 (Hensel's lemma for square roots) is `TauCeti.henselianLocalRing_integer` (TauCeti/NumberTheory/LocalField/Henselian.lean:34) with `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` (TauCeti/RingTheory/Henselian.lean:46) at f790474.
  - Item 117 (the canonical embedding ϕ_β of F[β] in A) is `Algebra.adjoin` (Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:32) with `Subalgebra.val` (Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:381) at 082e2d3.
- **Planned.** I read the description of every cited layer, and each plans its items:
  - ClassFieldTheory layers 4, 6 and 9 (Artin map, local reciprocity, the local Weil group);
  - LocalFieldsRamification layers 0, 1, 2 and 4 (local fields, the unit filtration, unramified norm groups, wild inertia);
  - QuadraticFormInvariants layers 1 and 4 and sublayers 6A, 6C and 6D;
  - GN.2 and GN.6 for ε-hermitian spaces and Witt groups;
  - RG2.5 and LP0 for the L-group and parameters;
  - SR.2 for compact induction and Mackey theory (item 331);
  - ML.4 and ET.6 for the local Langlands correspondences (items 407 and 413).

  Two need a remark:
  - Item 12 (the norm group (3.2)) is not a stated milestone, but it follows at once from 6C's norm criterion and closed Hilbert-symbol formula, as its note says.
  - ET.6 is the characteristic-zero correspondence only. Item 413 is used only to interpret GL endo-parameters for the conjecture, and its note says so.
- **Missing.** I searched all 1,968 atlas stage titles and descriptions for "lattice sequence", "simple stratum", "semisimple stratum", "endo-class", "endo-equivalence", "endo-parameter", "Glauberman", "cuspidal type" and "wild inertial". There are no hits. "Simple character" and "semisimple character" hit only ET.6 (Scholze's semisimple character identities) and a Lie-theory layer.
  - No packet under research/blueprint/packets mentions simple or semisimple characters, lattice sequences, endo-classes or Glauberman lifts.
  - "Cuspidal type" appears in two packets, both about Kisin's Galois-side types.
  - The 390 missing items are missing.

## 3. Routes

- **Route 1 (`part-ii`, SmoothRepresentationsPartII, 369 items): accept.**
  - Nothing in the atlas owns Bushnell–Kutzko–Stevens theory: strata, simple and semisimple characters, their self-dual versions, cuspidal types, and endo-classes.
  - SmoothRepresentationsPartII is the Part II of SmoothRepresentationsOfLocalGroups on types and supercuspidal representations that PAPER-FINTZEN-21 proposed. PAPER-STEVENS-08 and PAPER-LUST-STEVENS-20 also route classical-group type theory there. `scripts/make_queue.py` groups part-ii routes by parent, and the id, parent and area here match.
  - The brief states Theorem 11.9, Theorems 9.9 and 9.16 with Corollary 9.17, Theorems 12.9 and 12.29 and Corollary 12.34 exactly as the paper does. It records the §1.21 conjecture as a conjecture and names what to import.
  - Three corrections are made in place: G° as in §1.6; the counting formula placed in §12.4, not §12.5; and the §10.2 example (E48) added to the corrections the branch must carry.
- **Route 2 (source GN.2, 18 items): accept.** GN.2 asks for the hermitian variants of Witt groups and local classification. The transfer λ_* of ε-hermitian Witt groups (Propositions 3.13–3.15) and the twisted forms of §§3.3–3.4 belong there beside the Witt groups that the extraction already marks as planned there.
- **Route 3 (source LP0, 2 items): accept.** LP0 builds Weil groups with wild inertia and parameters restricted to them. Wild inertial parameters, their centralizers and the set Wild(G°) are its definitions.
- **Route 4 (source ML.4, 1 item): accept.** ML.4 owns the Arthur, Mok and KMSW classification, and the extended parameters (ϱ, χ_ϱ) and Lang(G°) are its parametrisation.

## 4. Mistakes in the paper

Each finding was checked at its TeX lines in arXiv v3 and on the rendered printed page. All 37 are confirmed. Where the extraction's correction was incomplete, the review changed the finding, as listed in §5. The fourteen findings the review adds are all confirmed.

- **E1** (misprint; §2, p. 10 (v3); p. 611 in the version of record). Correction: We say that g intertwines ρ with ρ′ if I_g(ρ, ρ′) ≠ 0 (the second '≠ ∅', for the set I_G(ρ, ρ′), is correct). *Verdict:* confirmed. Checked in the arXiv source (Endo-notation.tex): I_g(ρ,ρ′) is a vector space, so "≠ ∅" always holds. The version of record corrects it.
- **E2** (misprint; §1.9, Theorem (Part of Theorem 9.9)(i), p. 4 (v3); p. 603 in the version of record). Correction: … the component ps-characters Θ_i and Θ′_{ζ(i)} are endo-equivalent. *Verdict:* confirmed. Checked: ζ(i) ∈ I′ indexes the components of Θ′. This finding now covers §1.9 only; Theorem 9.9(i) is E25. It is unchanged in the version of record (p. 603).
- **E3** (misprint; §1.14, p. 6 (v3); p. 605 in the version of record). Correction: … the restrictions of (β, ϕ) and (β′, ϕ′) to E_i and E′_{ζ(i)} respectively are concordant (i.e. (β_i, ϕ|_{E_i}) and (β′_{ζ(i)}, ϕ′|_{E′_{ζ(i)}}), as in Definition 9.15). *Verdict:* confirmed. Checked in the arXiv source: the second pair must be (β′, ϕ′). It is unchanged in the version of record (p. 605).
- **E4** (misprint; §1.15, Theorem (Theorem 9.16)(iii), p. 6 (v3); p. 605 in the version of record). Correction: … and ((V, h), ϕ′, Λ′, r′) ∈ Q_−(k, β′) … *Verdict:* confirmed. Checked: Θ′− is defined only on Q−(k, β′). This finding now covers §1.15 only; Theorem 9.16(iii) is E28 and Definition 9.14(iii) is E27. It is unchanged in the version of record (p. 605).
- **E5** (misprint; Proof of Lemma 5.11(ii), §5.4, p. 27 (v3); p. 638 in the version of record). Correction: Thus k_L = k_E, and L contains the maximal unramified sub-extension of E/F. *Verdict:* confirmed. Checked: L = F[β_tame] ⊆ E, and k_L = k_E shows that L contains the maximal unramified subextension, which the next step (L = F_tame) needs; the sentence about E is vacuous. It is unchanged in the version of record (p. 638).
- **E6** (misprint; §6.3 opening sentence, p. 33 (v3); p. 647 in the version of record). Correction: Let [Λ, n, r, β], [Λ′, n, r, β′] be self-dual simple strata in A, put E = F[β] and E′ = F[β′]. *Verdict:* confirmed. Checked: E′ = F[β′] needs the second stratum to carry β′. It is unchanged in the version of record (p. 647).
- **E7** (misprint; Proof of Corollary 6.9, §6.4, p. 34 (v3); p. 650 in the version of record). Correction: … that E/F and E′/F have the same ramification index and residue class degree *Verdict:* confirmed. Checked: the paper has no field F′; Proposition 6.2 gives e(E/F) = e(E′/F) and f(E/F) = f(E′/F). It is unchanged in the version of record (p. 650).
- **E8** (misprint; Proof of Lemma 6.11, last paragraph, §6.4, p. 36 (v3); p. 653 in the version of record). Correction: … Lemma 6.6(ii) implies that (β, ϕ_β) and (β_1, ϕ_{β_1}) are concordant *Verdict:* confirmed. Checked: the cited result is Lemma 6.6(ii), which print cites correctly two pages earlier. It is unchanged in the version of record (p. 653).
- **E9** (misprint; §6.2, self-dual †-construction for characters, p. 32 (v3); p. 647 in the version of record). Correction: … whose restriction to H^{r+1}(β†, Λ†) ∩ M̃† has the form θ ⊗ · · · ⊗ θ … *Verdict:* confirmed. Checked: θ ⊗ ⋯ ⊗ θ is a character of the Levi part only. The fix uses the GL Levi M̃†, not the unitary Levi M†. It is unchanged in the version of record (p. 647).
- **E10** (error; Proof of Proposition 5.19, §5.8, p. 30 (v3); p. 642 in the version of record). Correction: If r = n the strata need not be null (pure strata [Λ,n,n,β] with β ≠ 0 exist; only simple ones are null, cf. p. 24), but then β + a_{−n}(Λ) = a_{−n}(Λ) and β′ + a_{−n}(Λ′) = a_{−n}(Λ′) both contain 0, so 1 ∈ G intertwines the strata and there is nothing to prove. *Verdict:* confirmed. Checked: a pure stratum [Λ, n, n, β] with β ≠ 0 need not be null, but for r = n both cosets contain 0, so 1 intertwines the strata and the conclusion stands. It is unchanged in the version of record (p. 642).
- **E11** (gap; Proof of Proposition 6.2, case (i), §6.1, p. 31 (v3); p. 645 in the version of record). Correction: Replace [Λ′, n′, n′ − 1, β′] by an equivalent simple stratum [Λ′, n′, n′ − 1, γ′] (Proposition 5.5), which intertwines exactly the same strata and has γ′ ≠ 0 because val_{Λ′}(β′) = −n′; Lemma 5.3 then applies since r/e(Λ) < n′/e(Λ′) (r < n′, e(Λ) = e(Λ′)). *Verdict:* confirmed. Checked: Lemma 5.3 needs both strata simple, and [Λ′, n′, n′ − 1, β′] is only pure. Replacing it by an equivalent simple stratum (Proposition 5.5) repairs the step. It is unchanged in the version of record (p. 645).
- **E12** (gap; Proof of Lemma 5.15, §5.6, p. 28 (v3); p. 640 in the version of record). Correction: In case (ii) apply Lemma 3.31(ii)(b) directly (as in the proof of Proposition 3.28), with K ⊆ E from Corollary 5.14 and K′ := g^{−1}Kg ⊆ E′: conjugation by g ∈ U(V,h) is a Galois-equivariant F-isomorphism K → K′ (on E and E′ the h-adjoint equals the Galois involution and also the adjoint involutions b ↦ β^{−1}b̄β, b ↦ β′^{−1}b̄β′ of β*h, β′*h), and [E:K] ≡ dim_K V = dim_{K′} V ≡ [E′:K′] and [E:F] ≡ dim_F V ≡ [E′:F] (mod 2) because dim_E V, dim_{E′} V are odd. (The finding gives the rest.) *Verdict:* confirmed. Checked: Proposition 3.28(ii)(b) needs an isometry from (V, β*h) to (V, β′*h), but Corollary 5.14 gives only g ∈ U(V, h). The proof of Proposition 3.28 uses only what the correction lists, so the conclusion stands. It is unchanged in the version of record (p. 640).
- **E13** (gap; Proof of Lemma 5.16, §5.6, p. 29 (v3); p. 641 in the version of record). Correction: Take instead the element g ∈ P_−(Λ) of Corollary 5.14 (K ⊆ E ∩ gE′g^{−1}); only dim_K V = dim_{g^{−1}Kg} V, even because g^{−1}Kg ⊆ E′ and dim_{E′} V is even, is used here, while u is used only for the isometry (V, β*h) ≅ (V, β′*h) in the last paragraph. *Verdict:* confirmed. Checked: u ∈ P¹(Λ) comes from [39, Lemma 5.3], not from Corollary 5.14, which supplies a different element. It is unchanged in the version of record (p. 641).
- **E14** (gap; Proof of Lemma 6.6(ii), §6.3, p. 33 (v3); p. 648 in the version of record). Correction: By restriction these strata intertwine in G̃ (in G in the symplectic case, where G-intertwining of θ, θ′ is assumed); in the non-symplectic case Proposition 5.19(i) then gives intertwining in G, as needed for Lemma 5.17. *Verdict:* confirmed. Checked: the statement of Lemma 6.6 assumes intertwining in G̃, but the proof uses G-intertwining. Print still has "which intertwine in G̃". It is unchanged in the version of record (p. 648).
- **E15** (misprint; Remark 7.2(i), p. 38 (v3); p. 655 in the version of record). Correction: θ′† = τ_{Λ′†,ϕ′†,Λ′,ϕ′,β′}(θ′) *Verdict:* confirmed. Checked in the arXiv source (Endo-ps.tex): the transfer must be the one along the realization of θ′. It is unchanged in the version of record (p. 655).
- **E16** (misprint; Proof of Theorem 7.5, p. 39 (v3); p. 657 in the version of record). Correction: The quadruple (V, ϕ′, Λ′, r) is an element of Q(k, β′) by Proposition 7.3(ii) (applied with Θ and Θ′ interchanged). *Verdict:* confirmed. Checked: ϕ′ embeds E′ = F[β′], so the quadruple lies in Q(k, β′), which Proposition 7.3(ii) gives with Θ and Θ′ interchanged. It is unchanged in the version of record (p. 657).
- **E17** (gap; Proof of Lemma 8.2, pp. 42–43 (v3); p. 663 in the version of record). Correction: Suppose, for a pair {i,j}, that [Λ, n+le, 0, ϖ_F^{−l}β] fails to be semisimple for infinitely many l. (The finding gives the rest.) *Verdict:* confirmed. Checked: the argument gives one l, while the Lemma needs all sufficiently large l. Monotonicity in l holds but is not stated, so this is a minor expository gap. It is unchanged in the version of record (p. 663).
- **E18** (misprint; Remark 8.9, p. 45 (v3); p. 666 in the version of record). Correction: … a matching from (θ−, β) to (θ′−, β′). *Verdict:* confirmed. Checked: the matching is from (θ−, β) to (θ′−, β′). It is unchanged in the version of record (p. 666).
- **E19** (misprint; Remark 8.10, p. 45 (v3); p. 666 in the version of record). Correction: … such that θ− ∈ C−(Λ, r, β) … *Verdict:* confirmed. Checked: θ− is a self-dual character, so it lies in C−(Λ, r, β). It is unchanged in the version of record (p. 666).
- **E20** (misprint; Proposition 8.13(ii), p. 45 (v3); p. 667 in the version of record). Correction: … let θ− ∈ C−(Λ, r, β) and θ′− = τ_{Λ′,Λ,β}(θ−). *Verdict:* confirmed. Checked in the arXiv source (Endo-semisimple.tex). The version of record corrects it.
- **E21** (misprint; Theorem 8.15(ii), p. 46 (v3); p. 667 in the version of record). Correction: (ii) Suppose [Λ, n, r, β] and [Λ, n, r, β′] are self-dual and let θ− ∈ C−(Λ, r, β) and θ′− ∈ C−(Λ, r, β′) … *Verdict:* confirmed. Checked in the arXiv source. The version of record corrects it by changing the hypothesis to Λ = Λ′.
- **E22** (misprint; Corollary 8.16, p. 46 (v3); p. 668 in the version of record). Correction: … θ′− ∈ C−(Λ′, r, β′) … *Verdict:* confirmed. Checked: a self-dual semisimple character lies in C−(Λ′, r, β′). Print adds r = r′ to the preamble but keeps this slip. It is unchanged in the version of record (p. 668).
- **E23** (misprint; Corollary 8.19 (statement), p. 48 (v3); p. 671 in the version of record). Correction: … such that C(Λ, r, β) = C(Λ, r, β̃) and C(Λ′, r, β′) = C(Λ′, r, β̃′) *Verdict:* confirmed. Checked: the proof ends with C(Λ, r, β̃) = C(Λ, r, β) and C(Λ′, r, β̃′) = C(Λ′, r, β′). It is unchanged in the version of record (p. 671).
- **E24** (misprint; Proof of Corollary 8.19 (induction step), pp. 48–49 (v3); pp. 672–673 in the version of record). Correction: … and [Λ′, n, r+1, γ′] equivalent to [Λ′, n, r+1, β′] … *Verdict:* confirmed. Checked at Endo-semisimple.tex l.467, l.472 and l.513, including the extra slip ∏A^i for ∏A′^i in the same sentence. It is unchanged in the version of record (p. 672–673).
- **E25** (misprint; Theorem 9.9(i), p. 53 (v3); p. 680 in the version of record). Correction: … the component ps-characters Θ_i and Θ′_{ζ(i)} are endo-equivalent *Verdict:* confirmed. Checked: ζ(i) ∈ I′ indexes the components of Θ′; the proof uses Θ′_{ζ(i)}. It is unchanged in the version of record (p. 680).
- **E26** (misprint; Definition 9.11, p. 54 (v3); p. 682 in the version of record). Correction: … the bijection ζ of Theorem 9.9(i) … *Verdict:* confirmed. Checked: the reference points to an enumerate item, so the text prints "Theorem (i)" without the theorem number. It is unchanged in the version of record (p. 682).
- **E27** (misprint; Definition 9.14(iii), p. 55 (v3); p. 682 in the version of record). Correction: … ((V, h), ϕ′, Λ′, r′) ∈ Q−(k′, β′) … *Verdict:* confirmed. Checked: Θ′− is defined only on Q−(k′, β′). It is unchanged in the version of record (p. 682).
- **E28** (misprint; Theorem 9.16(iii), p. 55 (v3); p. 683 in the version of record). Correction: … ((V, h), ϕ′, Λ′, r′) ∈ Q−(k, β′) … *Verdict:* confirmed. Checked in the arXiv source. The version of record corrects Theorem 9.16(iii); the §1.15 restatement is E4.
- **E29** (misprint; Definition 9.15, p. 55 (v3); p. 683 in the version of record). Correction: … the spaces (V^i, h_i) and (V′^{ζ(i)}, h′_{ζ(i)}) are isometric and … *Verdict:* confirmed. Checked: the two spaces are required to be isometric, not equal. It is unchanged in the version of record (p. 683).
- **E30** (gap; Proof of Theorem 9.16, (ii)⇒(iii), pp. 55–56 (v3); p. 683 in the version of record). Correction: Insert: ζ commutes with σ. (The finding gives the rest.) *Verdict:* confirmed. Checked: the proof never shows that ζ commutes with σ, which (iii) needs. The equivariance argument given in the correction works. It is unchanged in the version of record (p. 683).
- **E31** (misprint; Proof of Corollary 9.19, p. 56 (v3); p. 684 in the version of record). Correction: … with matching ζ := ζ_{Θ^{(3)}_−,Θ^{(1)}_−} … *Verdict:* confirmed. Checked: by Definition 9.11, ζ_{Θ′,Θ} goes from Θ to Θ′, so the matching from Θ^{(1)} to Θ^{(3)} is ζ_{Θ^{(3)}_−,Θ^{(1)}_−}, as the same proof uses two sentences earlier. It is unchanged in the version of record (p. 684).
- **E32** (error; Theorem 10.4, p. 58 (conclusion); proof p. 58 (v3); p. 687 in the version of record). Correction: Then θ is conjugate to θ′ by an element y ∈ G° with yΛ = Λ′ (more precisely yΛ^i = Λ′^{ζ(i)} for all i); (The finding gives the rest.) *Verdict:* confirmed. Checked: the hypotheses allow Λ′ ≠ Λ, and then no element of P₋(Λ) can conjugate θ to θ′. The version of record corrects the conclusion to G° ∩ gP₋(Λ).
- **E33** (misprint; Theorem 11.9, p. 61 (v3); p. 691 in the version of record). Correction: Let (J, λ) and (J′, λ′) be cuspidal types for G° which intertwine in G°. Then they are conjugate in G°. *Verdict:* confirmed. Checked: the sentence before the theorem and its proof use (J′, λ′), with J′ = J₋(β′, Λ′). It is unchanged in the version of record (p. 691).
- **E34** (gap; Proof of Lemma 12.32, p. 74 (v3); p. 712 in the version of record). Correction: Apply Theorem 10.2(ii) instead of Lemma 10.1 (its proof splits I into blocks J on which the β_j have equal Λ-valuation, applies Lemma 10.1 blockwise and multiplies determinants); or restrict to blocks as in that proof. *Verdict:* confirmed. Checked: Lemma 10.1 assumes that β normalizes Λ, which the proof of Lemma 12.32 does not arrange. The authors changed the citation from Theorem 10.2(ii), which is commented out in the source. It is unchanged in the version of record (p. 712).
- **E35** (error; Example after Theorem 12.29, pp. 71–72 (v3); p. 708 in the version of record). Correction: Add the hypothesis that −1 ∉ N_{E/E_o}(E^×) (e.g. choose E/E_o ramified with −1 not a norm); '−1 is not a square in F' does not imply it. *Verdict:* confirmed. Checked with F = E_o = ℚ₃ and E = ℚ₃(i): −1 is not a square in ℚ₃ but is a norm from E. The version of record adds the hypothesis −1 ∉ N_{E/E_o}(E).
- **E36** (error; §12.4, counting formula after the proof of Theorem 12.29, p. 73 (v3); p. 710 in the version of record). Correction: N(θ₋, G̃, G) = 2^{max(|I₀| − n₀, 0)}; i.e. N = 1 in the two cases where |I₀| − n₀ = −1: (a) G unitary or orthogonal and I₀ = ∅; (b) G orthogonal and I₀ = {i₀} consists only of a zero component with dim_F V^{i₀} ≤ 2 and dim_an V^{i₀} ≤ 1. *Verdict:* confirmed. Recounted directly: N is a positive integer, and in the two listed cases the formula gives 2^{−1}. The formula is on p. 73 of arXiv v3. It is unchanged in the version of record (p. 710).
- **E37** (misprint; Proof of Corollary 12.34, p. 74 (v3); p. 712 in the version of record). Correction: ^gθ₋ ∈ C₋(gΛ, 0, gβg⁻¹). *Verdict:* confirmed. Checked: ^gθ₋ is a character of H¹(gβg⁻¹, gΛ). The version of record moves the g but still gets it wrong.
- **E38** (misprint, added by the review; §3.2, p. 12 (v3); p. 614 in the version of record). Correction: … then h_1 ⊕ h_2 ≅ h′_1 ⊕ h′_2. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-Witt.tex); unchanged in the version of record.
- **E39** (misprint, added by the review; §3.9, paragraph before Lemma 3.34, p. 21 (v3); p. 628 in the version of record). Correction: … we are given ε-hermitian F/F_o-spaces (V, h) and (V′, h′) … *Verdict:* confirmed. Found by the review and checked in the arXiv source; unchanged in the version of record.
- **E40** (error, added by the review; §5.3, p. 25 (v3); pp. 635–636 in the version of record). Correction: If [Λ, n, r, β] is (standard) self-dual then [Λ†, n, r, β†] is (standard) self-dual with respect to h†. In general (Λ†)^# = Λ† and e(Λ†) = e(Λ), so Λ† is standard exactly when e(Λ) is even. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-strata.tex). The version of record corrects it.
- **E41** (gap, added by the review; Proof of Proposition 5.19, p. 30, and the same step in the proof of Lemma 6.11, pp. 35–36 (v3); p. 643 in the version of record). Correction: First replace the strata by standard affine translations [2Λ + (d − 1), 2n, 2r, β] and [2Λ′ + (d′ − 1), 2n, 2r, β′], where Λ^# = Λ + d and Λ′^# = Λ′ + d′. Both new sequences are fixed by #, so their sum is self-dual for h ⊕ h. The cosets β + a_{−r}(Λ) and β′ + a_{−r}(Λ′), and with them intertwining, equivalence and simplicity, are unchanged; concordance depends only on β and β′. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-strata.tex l.489; Endo-chars.tex l.345 and l.375); unchanged in the version of record.
- **E42** (gap, added by the review; §6.2, self-dual †-construction for characters, p. 32 (v3); p. 647 in the version of record). Correction: State also the G̃-version: if g ∈ G̃ intertwines θ with θ′, then g† ∈ G̃† intertwines θ† with θ′†. It has the same proof. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-chars.tex l.120, l.192, l.300, l.368–372); unchanged in the version of record.
- **E43** (gap, added by the review; Remark 8.9, p. 44 (v3); p. 666 in the version of record). Correction: Add the hypothesis e(Λ) = e(Λ′). *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-semisimple.tex l.142 and l.199); unchanged in the version of record.
- **E44** (misprint, added by the review; Proof of Corollary 8.19, induction step, p. 48 (v3); p. 672 in the version of record). Correction: … such that γ̃_j and γ̃′_{ξ(j)} have the same characteristic polynomial. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-semisimple.tex l.472). The version of record corrects it.
- **E45** (misprint, added by the review; §9.2, paragraph before Lemma 9.3, p. 50 (v3); p. 675 in the version of record). Correction: θ_i ∈ C(Λ^i, r, ϕ(β_i)) and θ′_i = τ_{Λ′^i,Λ^i,β_i}(θ_i) *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-pss.tex l.95); unchanged in the version of record.
- **E46** (misprint, added by the review; Proof of Theorem 9.9, converse direction, p. 54 (v3); p. 681 in the version of record). Correction: the field extensions E_i/F and E′_{ζ(i)}/F have the same degree; *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-pss.tex l.399); unchanged in the version of record.
- **E47** (gap, added by the review; Proof of Theorem 9.16, (ii)⇒(iii), p. 55 (v3); p. 683 in the version of record). Correction: Normalise first, as in the proof of Theorem 7.9: translate Λ, Λ′ affinely to e(Λ) = e(Λ′) and replace r, r′ by min{r, r′} using Theorem 9.9(ii)(b); intertwining with matching ζ passes back to the original restrictions. Alternatively cite Proposition 7.10 for the block ps-characters. *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-pss.tex l.614); unchanged in the version of record.
- **E48** (error, added by the review; §10.2, first paragraph, p. 58 (v3); p. 687 in the version of record). Correction: Restrict the example to r = 0, or assume instead that the normalizer of P^{r+1}₋(Λ^{i₀}) (equivalently, of θ_{i₀}) in U(V^{i₀}, h_{i₀}) contains no element of determinant −1. The opening claim of §10.2, that such characters exist, is unaffected, since examples with r = 0 exist. *Verdict:* confirmed. Found by the review. The review checked the key step on the building: in a tree, the Moy–Prasad group at depth 2/3 of a point a third of the way along an edge from a vertex v equals the depth-1 group of v, so P²(Λ) is the depth-1 group of a vertex of the product building, which transposition normalizes, while the facet of (v₀, x) is not symmetric in the two factors. The example is unchanged in the version of record.
- **E49** (misprint, added by the review; Proof of Theorem 12.16, p. 68 (v3); p. 703 in the version of record). Correction: θ̃ ∈ C(Λ ⊕ Λ^#, 0, β̃) *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-parameters.tex l.462); unchanged in the version of record.
- **E50** (misprint, added by the review; §12.4, paragraph after the proof of Theorem 12.29, p. 73 (v3); p. 710 in the version of record). Correction: … of a self-dual semisimple character θ₋ ∈ C₋(Λ, 0, β). *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-parameters.tex l.850); unchanged in the version of record apart from the added "full".
- **E51** (misprint, added by the review; Lemma A.7, p. 76 (v3); p. 716 in the version of record). Correction: β_k = e_kβe_k *Verdict:* confirmed. Found by the review and checked in the arXiv source (Endo-one-appendix.tex l.130); unchanged in the version of record.

## 5. Changes made in place

In `PAPER-KURINCZUK-SKODLERACK-STEVENS-21.result.json`:

- **Sources.** `sourceVersions` gains the version of record: the UEA repository copy, with its SHA-256 and the page offset. `source.read` says the review read it.
- **`known`.** All 37 fields read "new: …" with a note. scripts/errata.py treats any value other than "new" as corrected in print, so it would have filed all 37 findings as corrected in print. They now read "new", and each note moved to `searched`. E1, E20, E21, E28, E32 and E35 say where the version of record corrects them.
- **Locators.** Every finding also gives its printed page. E2, E4 and E28 are narrowed so that each place is recorded once: E2 at §1.9, E25 at Theorem 9.9(i), E4 at §1.15, E27 at Definition 9.14(iii) and E28 at Theorem 9.16(iii). Print treats these places differently. E36 moves to §12.4, p. 73.
- **Findings.**
  - E17 now says that monotonicity in l holds but is not stated.
  - E24 adds the A′^i slip in the same sentence.
  - E36 cites Proposition 3.13(ii).
  - E37 records how print moves the slip.
  - Every finding carries its review verdict.
- **New findings.** E38–E51 (8 misprints, 4 gaps, 2 errors), two of them corrected in print. There are now 51 findings: 34 misprints, 11 gaps and 6 errors. Four affect a stated result and eleven affect a proof.
- **Items.**
  - The G° preamble is corrected in 75 items.
  - Items 308, 309 and 376 now state the corrected results.
  - Items 26, 94, 113, 160, 177, 244, 376, 377 and 383 are fixed as in §1.
- **Route 1 brief.** G° follows §1.6. The counting formula is placed in §12.4, and the §10.2 example is added to the corrections the branch carries.

`check_paper.py` reports ok, and scripts/errata.py files 43 findings as new and 8 as corrected in print.

In `PAPER-KURINCZUK-SKODLERACK-STEVENS-21.md`, the setting's G° is corrected, and a section "Corrections by the independent review" lists these changes.
