# RT-PAPER-CARAIANI-SCHOLZE-24

Red team of the accepted extraction PAPER-CARAIANI-SCHOLZE-24: Ana Caraiani and Peter Scholze, *On the generic part of
the cohomology of non-compact unitary Shimura varieties*, Annals of Mathematics 199 (2024), 483–590 (arXiv
1909.01898v2). Issue #4048.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2115);
- its review, REV-PAPER-CARAIANI-SCHOLZE-24 (`cc-7b31c4`).

**Result: 55 findings, 1 high, 29 medium and 25 low.**

## Method

**The source.** arXiv 1909.01898v2, the accepted version (<https://arxiv.org/abs/1909.01898v2>), was re-downloaded on
2026-10-01 with its LaTeX source. Its SHA-256 is `803fc16a…6229f2e`, equal to the extraction's. The published Annals
text is behind the moving wall and was not read.

**The passes.** Five parallel passes were run by this session.
- Three read all 90 pages against the extraction: §§1–2, §§3–4, and §§5–6 with the references.
- Two checked the 68 planned statuses and the single route: one the 52 items planned at
  IgusaVarietiesAndTorsionConcentration, one the rest, against the atlas, the packets, the accepted restructures, other
  papers' accepted routes and the pinned libraries.

**The shape of this extraction.** 68 of 70 items are "planned", 52 of them at the Igusa roadmap. That roadmap was
written from this paper, and it has no packet yet, so most statuses are circular and none is backed by a node. Most
findings are about those statuses.

**Merging.** I merged findings reported by more than one pass:
- Corollary 3.2.14 with item 5, and Theorem 6.4.1 at IG.6;
- the Hasse principle (item 7) with the false step in its proof, item 2, and Scholze–Weinstein Theorem B;
- item 27 with the BG route, and items 23, 57, 68, 70 and 33;
- Theorem 5.7.1, the finite-level toroidal Igusa varieties, the hypotheses of items 31–32, and the level of Theorem 1.1.

**What I re-verified myself.** The high finding: with polarizations that are isomorphisms at p, an isogeny respecting
the G-structure and an isomorphism on the étale and multiplicative parts has a unit scalar and degree 1, so Corollary
3.2.14 covers only isomorphisms when the multiplicative part is nonzero. I also checked IG.6's text and dependencies,
IG.0's and PELModuli M3's texts for the Hasse principle, and the BunGAndNewtonStrata packet's review state.

**Severities I changed.** These are medium, not high, for the reasons given in each claim:
- Theorem 6.4.1 at IG.6, and the Hasse principle;
- item 2, and Scholze–Weinstein Theorem B;
- the BG route, and item 27.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — other

**Where.** PAPER-CARAIANI-SCHOLZE-24/41 and /42 (Corollary 3.2.14; Theorem 3.3.2); sourceIssues (nothing recorded for
§§3–4); PAPER-CARAIANI-SCHOLZE-24/5; stage IgusaVarietiesAndTorsionConcentration:IG.2; PAPER-CARAIANI-SCHOLZE-24/5;
IgusaVarietiesAndTorsionConcentration:IG.2

**Claim.** Corollary 3.2.14 as printed is vacuous, and the footnote to Theorem 3.3.2 asks for an isogeny that cannot
exist. The extraction states the corollary verbatim and records no source issue. Let φ: X → X' be an isogeny compatible
with the G-structures, i.e. φ^∨∘λ'∘φ = c·λ for some c ∈ Q_p^×. This is required for φ to induce Ig^X ≅ Ig^{X'} (§2.3;
Definition 2.3.5 compares polarizations up to one common scalar). Over perfect k the slope decomposition X = X^µ ⊕
X^(0,1) ⊕ X^et is respected by φ, and λ maps X^µ isomorphically onto (X^et)^∨. Hence (φ^et)^∨∘λ'∘φ^µ = c·λ|_{X^µ}. If
φ^µ and φ^et are isomorphisms and X^µ ≠ 0, then c ∈ Z_p^×, so |ker φ|^2 = |X[c]| = 1 and φ is an isomorphism. By
Proposition 3.1.4 the leaf meets the toroidal boundary only when X has a nonzero étale part, hence X^µ ≠ 0. So the
corollary extends only isomorphisms. Its proof treats an isogeny whose similitude is p^m on Gr_{-1} ('p^m is the degree
of φ'; B' = B/ρ^{-1}(K) is principally polarized) but 1 on the outer graded pieces, which is not a G-isogeny. The proof
of Theorem 3.3.2 then takes 'an isogeny φ: X' → X ... [that] induces isomorphisms of étale and multiplicative parts'
between different leaves. For honest G-isogenies this forces X' ≅ X, so the transfer of affineness from the Nie/Boxer
leaf to an arbitrary leaf is not established as written. Proposition 3.3.4's isogeny invariance, and through Theorem
2.8.1 and Proposition 2.8.2 the main argument, rest on this step. Also: Item 5 states the isogeny invariance of
Ig^{X,tor} under the introduction's hypothesis (an isomorphism on étale quotients), and IG.2 plans that version. The
body proves it only for maps that are isomorphisms on both the étale and the multiplicative parts (Corollary 3.2.14,
Proposition 3.3.4). The proof of Corollary 3.2.14 uses both conditions, and Remark 3.3.5 says dropping them is only
expected. Moreover, read literally for a genuine isogeny compatible with the principal polarizations up to a scalar c,
the body's hypothesis forces φ to be an isomorphism whenever X^ét ≠ 0. Restricted to X^µ, φ^∨λ'φ = cλ reads (φ^ét)^∨ ∘
λ' ∘ φ^µ = c·λ|X^µ. If φ^ét and φ^µ are isomorphisms, c is a unit, and then deg(φ)^2 = deg(c) = 1. So the body
statements have content only for quasi-isogenies, as the sentence before Corollary 3.2.14 says. The introduction's
version covers G-isogenies of similitude p^k that multiply X^µ by p^k; no body statement covers these. Also: Item 5 says
the toroidal Igusa variety is 'isogeny-invariant when the isogeny is an isomorphism on étale quotients'. This
paraphrases the introduction, not anything §3 proves. Corollary 3.2.14 (item 41) assumes an isomorphism on étale and
multiplicative parts. The two hypotheses differ for G-isogenies. Example: on X = Hom(X_0, µ_{p^∞}) ⊕ X_0 ⊗ Q_p/Z_p with
its standard principal pairing, φ = p on the multiplicative summand and the identity on the étale summand. It satisfies
φ^∨λφ = pλ and is an isomorphism on the étale quotient, but its kernel lies in the multiplicative part, which the proof
of Corollary 3.2.14 excludes ('does not meet the multiplicative part'). IG.2 plans the introduction's form ('Isogeny
invariance of the toroidal model keeps the required isomorphism on étale quotients'), which no proof in the paper
supplies. Item 5 and item 41 contradict each other.

**Evidence.** §3.2.7, Corollary 3.2.14, p. 44: 'Let φ : X → X′ be an isogeny between p-divisible groups with G-structure
over k. Assume that φ induces an isomorphism on étale and multiplicative parts.' Proof, pp. 44–45: 'the isogeny φ : X →
X′ whose kernel K ⊂ X is contained in X° and does not meet the multiplicative part ... (where B′ = B/ρ^{-1}(K) ...)' and
'the composite X → B → B′ is p^m f′_0 where p^m is the degree of φ'. Sentence before the corollary, p. 44: 'only depends
on X up to quasi-isogenies inducing an isomorphism on étale and multiplicative parts.' Proof of Theorem 3.3.2, p. 45:
'we can find an isogeny φ : X′ → X ... and we may assume that φ induces isomorphisms of étale and multiplicative parts',
with footnote 15: 'one can choose the quasi-isogeny on these parts individually.' §2.3, p. 18: 'an isogeny φ : X → X′
(compatible with extra structures) induces an isomorphism Ig^X ≅ Ig^{X′}'. Also: §1, p. 7: 'we prove that an isogeny φ :
X → X′ that induces isomorphisms on étale quotients induces an isomorphism Ig^{X,tor} ≅ Ig^{X′,tor}' (footnote 5: 'The
condition on étale quotients is required to ensure that the choice of cone decomposition does not cause trouble').
§3.2.7, p. 44, Corollary 3.2.14: 'Assume that φ induces an isomorphism on étale and multiplicative parts.' Its proof:
'the isogeny φ ... whose kernel K ⊂ X is contained in X° and does not meet the multiplicative part'. Sentence before the
corollary: 'only depends on X up to quasi-isogenies inducing an isomorphism on étale and multiplicative parts'. p. 46,
Proposition 3.3.4 needs the same hypothesis, and Remark 3.3.5 reads: 'One would expect that the final statement does not
need φ to induce isomorphisms of étale and multiplicative parts.' Stage IG.2: 'Isogeny invariance of the toroidal model
keeps the required isomorphism on étale quotients and compatible cones'. Also: Introduction, p. 7: 'we prove that an
isogeny φ : X → X′ that induces isomorphisms on étale quotients induces an isomorphism Ig^{X,tor} ≅ Ig^{X′,tor}'
(footnote 5: 'The condition on étale quotients is required to ensure that the choice of cone decomposition does not
cause trouble'). Corollary 3.2.14, p. 44: 'Assume that φ induces an isomorphism on étale and multiplicative parts.'
Remark 3.3.5, p. 46: 'One would expect that the final statement does not need φ to induce isomorphisms of étale and
multiplicative parts.' IG.2 stage text: 'Isogeny invariance of the toroidal model keeps the required isomorphism on
étale quotients and compatible cones'.

**Fix.** Add a sourceIssue (kind gap; locator Corollary 3.2.14, pp. 44–45 and footnote 15 to Theorem 3.3.2, p. 45;
affects: the proof of Theorem 3.3.2 and Proposition 3.3.4; known: new), with the computation above. Restate item 41 in a
form that can be proved and used, and record which form is chosen. (a) G-quasi-isogenies inducing isomorphisms on étale
and multiplicative parts. These necessarily have similitude in Z_p^× and height 0, which matches the sentence before the
corollary. This form also needs a proof that some such quasi-isogeny exists between the Nie/Boxer leaf and any leaf of
the isogeny class, i.e. a unit-similitude G-quasi-isogeny of the biconnected parts. (b) Honest G-isogenies that are
isomorphisms on étale quotients, as in the introduction (p. 7). Their kernel contains X^µ[p^m], so T becomes T/T[p^m] ≅
T, a scalar change that preserves the cones. The proof must then be redone with that kernel. Item 42's note and IG.2
should cite the chosen form, not the printed one. Also: Restate item 5's invariance clause as Corollary 3.2.14 has it:
'a G-quasi-isogeny inducing isomorphisms on étale and multiplicative parts extends uniquely to Ig^{X,tor} ≅
Ig^{X',tor}'. Note that the introduction's étale-only version is not proved in the paper. Record a sourceIssue: kind
gap, affects 'a stated result' (the claim on p. 7), and note the isogeny/quasi-isogeny wording of Corollary 3.2.14,
Proposition 3.3.4 and footnote 15 (p. 45). Change IG.2's plan to the proved hypothesis (quasi-isogenies, isomorphism on
étale and multiplicative parts). Alternatively, have IG.2 own the extension to similitude p^k explicitly; that needs the
kernel-meets-X^µ case of the proof of Corollary 3.2.14. Also: In item 5, replace the isogeny clause with the hypothesis
that §3 actually proves, as settled above, or mark the introduction's weaker hypothesis as unproved in the body. Hand
the same correction to the IG.2 blueprint: state the isogeny-invariance target with the hypothesis that is proved, not
the introduction's paraphrase.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | other | PAPER-CARAIANI-SCHOLZE-24/41 and /42 (Corollary 3.2.14; … | Corollary 3.2.14 as printed is vacuous, and the footnote to Theorem 3.3.2 asks for an isogeny that cannot exist. The extraction states the corollary verbatim … |
| /2 | medium | error | PAPER-CARAIANI-SCHOLZE-24/21 | The item omits the standing hypothesis of Theorem 2.5.9 on N. Without it the toroidal compactification over Z[1/Δ_F] is only a Deligne–Mumford stack at primes … |
| /3 | medium | error | PAPER-CARAIANI-SCHOLZE-24/31, PAPER-CARAIANI-SCHOLZE-24/32; … | Both items list only 'F^+ ≠ Q and p split in F_0'. They drop the hypotheses of §2.8 under which Theorems 2.8.6 and 2.8.7 hold: p unramified in F; the level N ≥ … |
| /4 | medium | missing | PAPER-CARAIANI-SCHOLZE-24/33 (and /3); … | Theorem 1.1 is stated for every neat K = ∏K_p ⊂ G_0(A_f) and any S containing the ramified primes and the primes where K_p ≠ G_0(Z_p). The proof in §2.8 … |
| /5 | medium | error | PAPER-CARAIANI-SCHOLZE-24/25, PAPER-CARAIANI-SCHOLZE-24/27 | Item 25 copies the paper's description 'Fℓ the flag variety of totally isotropic F-linear subspaces of V'. That variety contains components of every isotropic … |
| /6 | medium | error | PAPER-CARAIANI-SCHOLZE-24/11 (status planned: … | Lemma 2.2.5 needs objects that no atlas stage plans. These are the truncated Rapoport–Zink space M^{0,d}_Y (isogenies with kernel in Y[p^d]) and its reduced … |
| /7 | medium | error | PAPER-CARAIANI-SCHOLZE-24/43 (also /46, /52) | Item 43 states that Ig^{b,*} → C^{b,*} is finite surjective, following Lemma 3.3.8(1). However, Definition 3.3.7 normalizes C^{b,*} in Ig^b, the pro-Igusa … |
| /8 | medium | other | PAPER-CARAIANI-SCHOLZE-24/38, /45, /46 (planned …; … | IG.2 does not plan the finite-level, non-perfect toroidal Igusa varieties, although items 38, 45 and 46 are marked planned there. IG.2 plans only the perfect … |
| /9 | medium | other | PAPER-CARAIANI-SCHOLZE-24/48 (planned … | No stage plans Theorem 4.2.1 or Corollary 4.2.2, although item 48 is marked planned at IG.3. Theorem 4.2.1 is the explicit description of π^tor_HT on the … |
| /10 | medium | missing | items for §4 (PAPER-CARAIANI-SCHOLZE-24/47, /49, /51; … | Two cited inputs of §4 have no item and no prerequisite entry: [SW13, Theorem B], in its G-structure form (x ∈ Fℓ(C) ↔ a p-divisible group 𝒳_{O_C} with … |
| /11 | medium | missing | §3.1–3.2 items (PAPER-CARAIANI-SCHOLZE-24/35, /38) | No item records the Lan–Stroh boundary-chart theorem for partial toroidal compactifications of well-positioned subsets, [LS18a, Theorem 2.3.2]. It says that … |
| /12 | medium | error | sourceIssues (missing entry); … | The proof of Corollary 5.1.3 defines the residual representation without the contragredient: it sets rho_m := rho_{m^vee}/Art_F^{-1}/^{1-2n}, but the paper's … |
| /13 | medium | missing | PAPER-CARAIANI-SCHOLZE-24/32 and /69 (planned: …; … | Theorem 6.4.1 has two parts. The first gives existence of ρ̄_m whenever H_{c−∂}(Ig^b)_m or H(Ig^b)_m is nonzero. The second is the length-≥3 obstruction. The … |
| /14 | medium | error | PAPER-CARAIANI-SCHOLZE-24/56 | Item 56 (Theorem 5.1.2, the main theorem of §5) states only the N_0 level hypothesis. It drops §5's standing assumptions: p is unramified in F, F contains an … |
| /15 | medium | missing | PAPER-CARAIANI-SCHOLZE-24/61; … | The invariant twisted trace formula (5.5.1) for 𝒢_n⃗θ, and the twisted analogues of Arthur's descent and splitting results, are cited results with no item of … |
| /16 | medium | missing | items (none for CS17 §5.4); … | The v/p clause of Theorem 5.1.2 and the ordinarity obstruction of Corollary 5.1.3 rest on three cited results from [CS17] that have no item. (i) The map … |
| /17 | medium | missing | prerequisites | The prerequisite list lists Shin 2010, Shin 2011 and Morel, although the ET stages name some of them, but it leaves out other §§5–6 inputs that are equally … |
| /18 | medium | missing | PAPER-CARAIANI-SCHOLZE-24/7 (and /8); … | Item 7 (Proposition 2.1.2, the Hasse principle H^1(Q,G) -> ∏_v H^1(Q_v,G) injective for the unitary similitude group) is marked planned at IG.0, but no stage … |
| /19 | medium | other | PAPER-CARAIANI-SCHOLZE-24 (report 'What the atlas already has', the … | The 52 IG statuses are circular, and none is backed by a packet node. IgusaVarietiesAndTorsionConcentration was written from this paper: its README sets out to … |
| /20 | medium | missing | routes[0] (source of BunGAndNewtonStrata BG2, BG3), items 27-28; … | Neither BG2 nor BG3 plans the Newton stratification of the flag variety, and the only BG blueprint ignores this route. That packet was written after this route … |
| /21 | medium | error | PAPER-CARAIANI-SCHOLZE-24/27 and the reason of routes[0]; … | Item 27 bundles results with different owners and routes all of them to BunGAndNewtonStrata. Two of them belong to IgusaVarietiesAndTorsionConcentration, not … |
| /22 | medium | error | PAPER-CARAIANI-SCHOLZE-24/57 (§5.2, endoscopy for the unitary …; … | Item 57 is planned at ET.4, ET.1 and ET.3, but ET.0 is the stage that plans exactly this content, and the item omits it. ET.1 (transfer factors and orbital … |
| /23 | medium | error | PAPER-CARAIANI-SCHOLZE-24/23 (O^+_D/p on locally spatial diamonds, …; … | Item 23 is planned only at DiamondEtaleCohomology:C0. Its key input, [Sch17, Thm 14.12(ii)], is explicitly excluded from C0 and planned at C2. Also: The … |
| /24 | medium | error | PAPER-CARAIANI-SCHOLZE-24/17 (§2.5.1, degenerations over O_C) | Item 17 is planned only at ShimuraCompactifications:C4, but RS-32 narrowed C4. Part of the item now belongs to NeronModelsAndSemistableAbelianVarieties R11.3: … |
| /25 | medium | error | PAPER-CARAIANI-SCHOLZE-24/2 (Galois representations for torsion …; … | Item 2 is planned at TC.4 and IHG.2, and neither stage plans the theorem. TC.4 excludes Galois-representation theorems, and RS-24 narrowed it further. IHG.2 is … |
| /26 | medium | error | PAPER-CARAIANI-SCHOLZE-24/68 (Lemmas 6.4.2–6.4.3, after Newton–Thorne); … | Item 68 is planned at IG.6 and IHG.2. Its content belongs to ArithmeticLocallySymmetricSpaces ALS.4: how the Hecke action behaves under parabolic induction and … |
| /27 | medium | error | PAPER-CARAIANI-SCHOLZE-24/70 and /33 (Poincaré duality with the dual …; … | Items 70 and 33 plan Hecke-equivariant Poincaré duality on X_K, the duality between H^i_c(X_K)_m and H^{2d−i}(X_K)_{m^∨}, at EDC.2:pairings, R02.2, IG.5 and … |
| /28 | medium | error | PAPER-CARAIANI-SCHOLZE-24/8 (Definitions 2.1.3–2.1.5, Proposition … | Item 8 is planned at PELModuli M1–M3 and IG.0, but none of these covers Definition 2.1.5. S_K there is the normalization of a moduli problem that is … |
| /29 | medium | error | PAPER-CARAIANI-SCHOLZE-24/63 (Theorem 5.7.1) and sourceIssues; … | Theorem 5.7.1 asserts local–global compatibility 'for any place q of F'. This is the same gap that the accepted CS17 extraction recorded as E83 for CS17 … |
| /30 | medium | error | PAPER-CARAIANI-SCHOLZE-24/62, /56 and sourceIssues (§5.6) | CSnc §5.6 inherits two errors that the accepted CS17 extraction recorded, and CSnc's sourceIssues E1–E12 record neither. First, Lemma 5.6.2 repeats CS17's … |
| /31 | low | missing | items (no item for the good-reduction locus) | No item covers the construction of the good-reduction locus or its infinite-level tower. That is S°_{K(N),Q_p} ⊂ S_{K(N),Q_p}, a Hecke-equivariant quasicompact … |
| /32 | low | missing | items (no item); … | No item records the existence, in every isogeny class b, of a completely slope divisible X with G-structure. The definition Ig^b := Ig^{X_b}_{K^p(N)} in §2.8 … |
| /33 | low | other | sourceIssues (unrecorded misprints in §§2.4–2.5) | The extraction missed several misprints in §§2.4–2.5. (1) p. 23, §2.5.1: 'Let X be the cocharacter group of T', but the same paragraph classifies the Raynaud … |
| /34 | low | other | PAPER-CARAIANI-SCHOLZE-24/9; … | Proposition 2.2.1 is printed with 'the polarization identifies Z_{−2} with X/Z_{−1}'. That is impossible as printed, since one is multiplicative and the other … |
| /35 | low | error | PAPER-CARAIANI-SCHOLZE-24/15 (and /13, /5, /26) | Item 15 swaps the paper's notation. The paper's perfect Igusa variety is the fraktur 𝔍𝔤^X (Corollary 2.3.2), and its non-perfect one is the roman Ig^X … |
| /36 | low | duplicate | PAPER-CARAIANI-SCHOLZE-24/16 (planned: IG.0 only) | Theorem 2.4.2(1), classical Serre–Tate for abelian schemes, is owned by AbelianSchemesAndArithmeticModuli:A4. Planning it only at IG.0 invites a second … |
| /37 | low | other | prerequisites | The prerequisites omit papers whose results §§1–2 quote as inputs and that the atlas does not plan: [SW13] (see the Scholze–Weinstein finding); Mantovan … |
| /38 | low | other | PAPER-CARAIANI-SCHOLZE-24/36, /40, /45, /51 (Raynaud-extension torus); … | The paper repeatedly calls X the cocharacter group of the torus T of the Raynaud extension. Its formulas require X to be the character group: T[p^m] = Hom(X, … |
| /39 | low | other | IgusaVarietiesAndTorsionConcentration:IG.2 (stage text cited by items … | IG.2 cites 'CSnc Lemma 3.3.8' for the affineness of C^(X,*) and Ig^(X,*). Lemma 3.3.8 only lists formal properties of Ig^{b,*}. The affineness of C^{X,*} is … |
| /40 | low | error | PAPER-CARAIANI-SCHOLZE-24/34–/54 (hypotheses); … | Items 34–54 omit the paper's standing hypotheses for §§3–4: p unramified in F; N ≥ 3 prime to p; Σ as in Remark 2.5.6 at level K(N). Item 49 also omits the … |
| /41 | low | other | PAPER-CARAIANI-SCHOLZE-24/51 | Item 51 says the target is the canonical compactification 'since the target is partially proper', following Theorem 4.4.1's wording. Lemma 4.4.2, which item 51 … |
| /42 | low | error | sourceIssues (missing entries); … | Four misprints in §§5.7 and 6 are not recorded. (a) The proof of Theorem 5.1.2 calls Π^n⃗ 'cuspidal'. Lemma 5.6.2 gives only a θ-stable isobaric … |
| /43 | low | error | sourceIssues PAPER-CARAIANI-SCHOLZE-24/E10 (locator) | E10's correction is right, but its locator is wrong. The sentence 'Both maps will by construction be P_b(A^p_f) × G(A^p_f)-equivariant' is in §6.2.2 ('Cup … |
| /44 | low | duplicate | PAPER-CARAIANI-SCHOLZE-24/4; … | Item 4 assigns to IG.7 the vanishing H^i(∂X_K, F_ℓ)_m = 0 for absolutely irreducible ρ_m (Remark 1.6, 'follows from the proof of [ACC+23, Theorem 2.4.2]'). … |
| /45 | low | error | PAPER-CARAIANI-SCHOLZE-24/3, /30, /31, /33 | Two accepted restructures moved content out of IG stages, and the items do not reflect the moves. RS-12 made AutomorphicGaloisRepresentationsPartII:AG2.7 the … |
| /46 | low | error | PAPER-CARAIANI-SCHOLZE-24/1 | Item 1 (the locally symmetric space X_K of U(n,n) over F, with its Borel–Serre boundary, and the Hecke algebra T^S) is planned at IG.0 alone. IG.0 plans only … |
| /47 | low | error | PAPER-CARAIANI-SCHOLZE-24/54; … | Item 54 states Theorem 4.6.1 correctly, in local form: for a cofinal system of affinoid étale neighbourhoods U = Spa(A) with formal model Spf(A°), the nearby … |
| /48 | low | other | PAPER-CARAIANI-SCHOLZE-24/31, /33, /70 and sourceIssues (citations of … | CSnc cites the published ACC+23 (Ann. of Math. 197) but uses its arXiv numbering in three places. This is the same kind of error as the recorded E8, but it is … |
| /49 | low | error | PAPER-CARAIANI-SCHOLZE-24/18 (cusp labels); … | Item 18's note names 'ShimuraCompactifications C1/C5', but its planned list omits C1. C1 is the layer that plans cusp labels and stabilizers. Also: The item's … |
| /50 | low | error | PAPER-CARAIANI-SCHOLZE-24/51 (Lemma 4.4.2) | Lemma 4.4.2 is geometry of canonical compactifications ([Sch17, Prop. 18.6, L 11.11]), and RS-05 gives that geometry to DiamondsAndVStacks D5. The item's note … |
| /51 | low | other | PAPER-CARAIANI-SCHOLZE-24/22 (Theorem 2.6.2); … | Item 22 is planned at S1, S2 and S6, but those stages plan perfectoidness only for minimal-compactification towers. The toroidal half of the item, … |
| /52 | low | error | PAPER-CARAIANI-SCHOLZE-24/55 (§5.1 setup) | Item 55 decomposes J_b(Q_p) ≅ J_{b_v}(F_v) × ∏ J_{b_w}(F_w) × Q_p^×. This is B(G) for products and restrictions of scalars, which an accepted extraction routes … |
| /53 | low | other | PAPER-CARAIANI-SCHOLZE-24/20 (Theorem 2.5.8) | Theorem 2.5.8 includes finite surjective Hecke maps [g] on the integral minimal compactification over Z[1/NΔ_F]. C5's text does not mention Hecke maps, and C3, … |
| /54 | low | library-claim | PAPER-CARAIANI-SCHOLZE-24/1 (the Hecke algebra T^S) and /33, /70 (the … | The items do not cite library carriers that exist at the pinned commits. The abstract double-coset Hecke ring Z[Δ//H] and its ring structure are in the … |
| /55 | low | other | PAPER-CARAIANI-SCHOLZE-24/66 (planned at IG.6 only; … | Item 66 cites [Hub96, Cor. 3.5.14] for RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*F_ℓ) ≅ colim RΓ(punctured neighbourhoods). That corollary is planned as its own node at … |

## Notes for the fix job

- **Corollary 3.2.14.** Record the gap. Restate items 5, 41 and 42 for quasi-isogenies with a unit scalar, or keep the
  introduction's version only as an unproved expectation (Remark 3.3.5).
- **Statuses.** Before the Igusa blueprint job runs, hand it this extraction's locators, misprints and gaps, ideally
  through a source route. Add the edges IG.4 → IG.6 and IG.5 → IG.6, and the BG3 → IG.3/IG.4 edges.
- **Source issues.** Record the unrecorded mistakes under PROTOCOL §18: Corollary 5.1.3's missing dual, Theorem 5.7.1's
  "any place", Lemma 3.3.8 at infinite level, the false step in Proposition 2.1.2's proof, and the CS17 errors §5.6
  inherits.
