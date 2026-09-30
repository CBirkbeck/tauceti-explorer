# RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21: red team of the extraction of Boxer–Calegari–Gee–Pilloni, *Abelian surfaces over totally real fields are potentially modular*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4316).

**Target.** `PAPER-BOXER-CALEGARI-GEE-PILLONI-21` extracts G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, [Publ. Math. IHÉS 134 (2021), 153–501](https://doi.org/10.1007/s10240-021-00128-2). The extraction as corrected by its review has 332 items (3 library, 33 planned, 296 missing), 33 routes (4 part-ii, 1 new, 28 source), 19 prerequisites and 159 source issues (119 misprints, 25 errors, 15 gaps).

**Who did what.**
- Claude Code `cc-7b31c4` wrote the extraction (issue #2164, PR #2220).
- Claude Code `cc-72825f` wrote `REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-21` (issue #2165, PR #2490). It corrected the file in place: 448 field corrections, 172 new items, a rebuilt routing and records E4–E159.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.** This session wrote FIX-RT-AREA-automorphic-1 (PR #4648: AA.4:neat-levels, AF.4:rationality, AF.5:algebraic-forms, MP stages) and FIX-RT-AREA-iwasawa-1 (PR #4654), and red-teamed KW09-I/II and BHKT. Route 24 (AF.1/AF.3/AF.4) and route 2's citation of PadicMeasuresIwasawaAlgebras:L1 were read; **no finding touches those stages**, neat levels, the MP stages, KW09 or BHKT.

**Result: 24 findings, 2 high, 15 medium and 7 low.** The machine-readable file is [RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json](RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json).

- **Where the work is sound.**
  - Every numbered statement of §§1–10 has an item, and nearly all statements and locators are faithful.
  - All 159 recorded source issues are real; the main theorems are stated with the right hypotheses in the route-3 brief.
  - No missing item is actually in the pinned libraries, and all three library items are right.
- **Where it breaks.**
  - The review's corrections stayed in `sourceIssues` and the brief: thirteen items still state results the file's own records show false (finding 1), and several construction items keep uncorrected definitions (finding 2).
  - Two records contradict each other (finding 3), and four gaps in the paper are unrecorded (findings 4–7).
  - Route 3 produced a duplicate design job, and the Part II routes do not become the roadmaps their ids name (findings 8–9).
  - Several items have two owners or the wrong one, and one owner makes a cycle (findings 10–15).

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v3 PDF (28 Nov 2021, 'Final version (fixing minor typos found in copyediting)') | [arxiv.org/pdf/1812.09269v3](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0…f35689ed` (matches) |
| arXiv v3 TeX source (`abeliansurfacesmodular.tex`) | [arxiv.org/e-print/1812.09269v3](https://arxiv.org/e-print/1812.09269v3) | `7f31218b…4b21dabb` (matches) |
| Published version, open access (pp. 153–501) | [Centre Mersenne PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | `b4cc8b01…1e8454af` (matches) |

- All three were fetched on 30 September 2026. v3 is the latest arXiv version; the journal lists no erratum.
- **How I read it.** Six parallel readers split the TeX by chapters (§§1–2, 3, 4, 5–6, 7–8, 9–10); a seventh audited statuses and library claims, an eighth the routes. I re-checked every finding filed here myself at the TeX line and the published page. TeX line numbers refer to `abeliansurfacesmodular.tex`; page numbers are published pages. Every quoted slip is also in the published version.

## Findings

### 1. Items state results that the file's own records show false (high, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/13, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/170, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/58, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/263, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/127, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/174, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/130, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/133, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/132, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/178, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/139, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/134, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/136

**What.** PROTOCOL.md §18 says 'Items and nodes use the corrected statements', but the review recorded eleven mistakes that affect a stated result and carried the correction into the items for only two of them (E36 into item 46; E83 appears only in item 263's note). The other items still state, as the result to be built, the printed statement that the file's own confirmed record shows false or unproved: item 13 (Lemma 2.1.3) has no 'char L ≠ 2' (E6); item 170 (Lemma 2.5.1) keeps 'the unique choice which maximizes n(r,N)' (E16); item 58 keeps Lemma 4.2.20's T̃_w clause 'if k_w ≥ 2p+3' without l_w ≥ p+2 (E46); item 263 states Corollary 6.4.3's i = 1 isomorphism under 'k_v − l_v ≥ 3' although E83 shows only k_v − l_v ≥ 3N is proved; item 127 states Lemma 9.2.7 as printed, with (4) r̄_q(G_{F'F_1}) = GL_2(F_q), the first bullet of (5) and the Brauer-class square-root step (E139, E140); item 174 states Proposition 9.1.12 with 'a finite Galois extension L/K' and the impossible clause (2) (E137); item 130 keeps Theorem 9.3.4's 'More precisely' clause with a cuspidal 𝛑 for every E (E144); items 133, 132 and 178 keep 'unramified and ordinary at all v|p' (E147), so item 133 (Proposition 10.1.3) is false as stated and the chain 10.1.3 → 10.1.1 → Theorem 1.1.7 no longer matches item 6; item 139 keeps a_5 = 2^4η·3 and End_C(A)⊗Q = M_2(D) (E155, E156); item 134 keeps Theorem 10.2.1's ordinary clause with the hypothesis on points of B(ρ̄) and the sketch 'the ordinary condition being open' (E149), and item 136 does not carry E150. None of these items cites its record. The route-3 brief was corrected, so the brief and the items it routes now disagree.

**Evidence.** Item statements read in the result file against the records: E6 correction 'Add char L ≠ 2'; E16 correction 'uniqueness of the maximizer holds for 4-dimensional symplectic N'; E46 correction 'read "Similarly, if l_w ≥ p+2 and k_w ≥ 2p+3, then T̃_w = …"'; E83 correction 'Replace "k_v − l_v ≥ 3 for all v|p" by "k_v − l_v ≥ 3N"'; E137 correction 'Assert only L′/K′ Galois (no L/K)'; E139 (Lemma 9.2.7 'is false as printed'); E144; E147 '"unramified and ordinary" should read "ordinary"'; E155/E156 'D × D'; E149. Paper (arXiv v3 TeX abeliansurfacesmodular.tex; published pages): Lemma 2.1.3 p. 171; Lemma 2.5.1 p. 189; Lemma 4.2.20 p. 255; Corollary 6.4.3, TeX l. 9769, p. 338: 'It is an isomorphism for i = 1 if we further assume that k_v − l_v ≥ 3 for all v|p'; Proposition 9.1.12, TeX l. 16361–16366, pp. 458–459: 'a finite Galois extension of number fields L/K … (2) L′/E is linearly disjoint from E′F^(avoid)/E'; Lemma 9.2.7, TeX l. 16620–16678, pp. 462–463; Theorem 9.3.4, TeX l. 16872–16877, p. 466; Proposition 10.1.3, TeX l. 17270–17271, p. 474; Lemma 10.4.6, TeX l. 18087–18117, p. 490; Theorem 10.2.1, TeX l. 17473–17474, p. 477. A script over the file found that of the items sharing a statement number with a record whose affects is 'a stated result', only item 46 (E36) and item 263 (E83, in its note) mention the record.

**Fix.** Rewrite each listed item with the corrected statement of its record and cite the record id in the note: 13 add char L ≠ 2 (E6); 170 'a pure N maximises n(r,N); it is the unique maximiser when V is 4-dimensional symplectic' (E16); 58 add l_w ≥ p+2 to the T̃_w clause only (E46); 263 'isomorphism for i = 1 if k_v − l_v ≥ 3N, N = #I + 2#I^c' (E83), and the same in item 289's sketch; 127 E139's choice of q and local data λ_a ⊕ ε̄^{-1}λ_a^{-1}, λ_b ⊕ ε̄^{-1}λ_b^{-1} at w|q with det r̄_q = ε̄^{-1} fixed from the start (E139, E140), and item 176 the strengthened choice of q; 174 the E137 form as amended by finding 3 below; 130 restrict the 'More precisely' clause to End_K(E) = Z (E144); 133, 132, 178 delete 'unramified and' (E147); 139 a_5 = 2^4η^2·3 and End_C(A)⊗Q = D × D (E155, E156); 134 the clause under ordinary points of P(ρ̄)(F_v), or via BCGP 2025 Lemma 9.3.7 for F_v = Q_3 (E149), and 136 H totally real and A[3] ≅ V(ρ̄)^∨ (E150). Owners are unchanged (routes 2, 3, 7, 15, 16).

### 2. Construction items keep uncorrected text; item 109 weakened against E126 (medium, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/41, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/209, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/211, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/39, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/68, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/59, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/243, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/57, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/232, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/64, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/109

**What.** The same defect for records whose reach is a proof or nothing, but where the item is a definition or construction that will be built from its statement: items 41, 209 and 211 give the stabilizer as O_F^{×,+}(K^p) and Δ := (O_F)_(p)^{×,+}/O_F^{×,+}(K^p), with which Lemma 3.5.3 ('Δ acts freely', item 211) is false because Z_(p)^{×,+} acts trivially (E29; item 41 itself says 'the subgroup Z_(p)^{×,+} acts trivially'); item 39 defines λ as a 'Z_(p)^×-polarization in the sense of [Lan13, Defn. 1.3.2.19]' with kernel of order p² at Par(v), which is empty at paramodular level, and copies the ill-typed 'f^*λ = rλ′' (E25, E26); item 68 states Proposition 5.5.1 for a prime-to-p quasi-isogeny, which cannot feed items 70–71 (E63); item 59 keeps the sign (−1)^{i_j}, so its complex has d∘d ≠ 0 (E52); item 243's sketch uses the non-exact sequence (E59); item 57 says 'p-rank exactly one' (E42); item 232 cites Lemma 4.2.14 (E53); item 64 keeps U_{w,1} for w ∈ I (E57). Conversely, item 109 was weakened by the review to 'unique positive rational numbers d′_η' with a note saying integrality is not established, while the confirmed E126 says the integers of the paper are right and supplies the missing step (Proposition 7.4.17(1) and [Tay08, Lem. 2.7]).

**Evidence.** Records E29 (correction 'Stabilizer Z_(p)^{×,+}·O_F^{×,+}(K^p); Δ = (O_F)_(p)^{×,+}/(Z_(p)^{×,+}·O_F^{×,+}(K^p))'), E25 ('λ a Z_(p)^{×,+}-multiple of a polarization with kernel of order p² in A[v] at paramodular v'), E26 ('λ = r·f^*λ′'), E63, E52 ('sign (−1)^j'), E59, E42 ('p-rank at w at most one'), E53 ('Lemma 4.2.15'), E57, E126 ('Add that each η̄ has all coefficients 1'); none of the listed items cites its record. Paper: TeX l. 3612 'the stabilizer of x for the action of (O_F)_(p)^{×,+} is O_F^{×,+}(K^p)', l. 3680 (3.3.14), l. 3911 'The action of Δ on X_{K,Σ} is free' (pp. 209–214); l. 3405 and 3450 (pp. 205–206); l. 8050 'a prime to p quasi-isogeny φ' (p. 302); l. 6243–6244 (p. 263); l. 7527–7531 (p. 290); l. 5543–5545 (p. 249); l. 14711 'determines the integers d′_η' and l. 14729 'is an integer' (pp. 429–430).

**Fix.** Restate the listed items in the corrected form of each record and cite it; restore 'positive integers d′_η' in item 109 with E126's argument and delete the contrary sentence of its note.

### 3. E137's corrected Proposition 9.1.12 is too weak for Lemma 9.2.7 and contradicts E140 (medium, error)

**Where.** the result file: sourceIssues PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E137 and PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E140; item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/174; route 3 brief

**What.** E137's correction of Proposition 9.1.12, repeated in the route-3 brief, keeps only 'K/E linearly disjoint from E′F^(avoid)/E'. That is too weak for the only use. Lemma 9.2.7(6) gets vastness of ρ̄_q from Lemma 7.5.22 ('Ind GL2 enormous'), which needs r̄_q(G_{K′(ζ_q)}) ⊇ SL_2(F_q) with K′ = F_1F′; this fails if L′ meets K′F^(avoid) ⊇ K′(ζ_q) in more than the determinant forces. The confirmed E140 in fact argues 'By Proposition 9.1.12(2), L′ is linearly disjoint over K′ from K′F^(avoid)' and corrects (2) to 'L′ ∩ K′F^(avoid) = K′(ζ_q)'. Neither the printed (2) (impossible, E137) nor E137's corrected (2) gives this, so the two confirmed records are inconsistent and the corrected proposition does not supply Lemma 9.2.7.

**Evidence.** TeX l. 16365 (p. 459) '(2) L′/E is linearly disjoint from E′F^(avoid)/E'; l. 16687 (p. 463) 'Finally, (6) then follows from Lemma [Ind GL2 enormous]'; E137 correction 'Assert only L′/K′ Galois (no L/K), with K/E linearly disjoint from E′F^(avoid)'; E140 reason 'By Proposition 9.1.12(2), L′ is linearly disjoint over K′ from K′F^(avoid)' and correction 'Condition (2) of that proposition becomes L′ ∩ K′F^(avoid) = K′(ζ_q)'.

**Fix.** Amend E137's correction and the brief: (2) 'K/E is linearly disjoint from E′F^(avoid)/E, and L′/K′ is linearly disjoint from K′F^(avoid)/K′' (in E140's fixed-determinant form, L′ ∩ K′F^(avoid) = K′(ζ_q)). It is obtained by the same Moret-Bailly argument after adding to S auxiliary places of E split completely in E′F^(avoid), at which the prescribed unramified local extensions have Frobenii meeting every conjugacy class of G (of SL_2(F_q) in the fixed-determinant case): the Frobenii at places of K′ above them lie in Gal(L′/L′ ∩ K′F^(avoid)), which therefore meets every class and is the whole group by Jordan's lemma. State item 174 in that form.

### 4. Lemma 4.6.24 is proved only for one place above p (new gap) (medium, error)

**Where.** the result file: item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/246 (route 2); sourceIssues (no record)

**What.** Lemma 4.6.24, 'for any w|p, U_{w,2} ∈ p·End(RΓ(𝔛^I_{K,Kli}(p^∞), Kω^κ))', is proved only by 'an examination of (4.5.12)', which is a computation at the single place w. Kω^κ is the kernel of the projection of ω^κ = ⊗_v ω^{κ_v} to the highest-weight line at every place, so it contains the summands ker_v ⊗ (highest-weight line at w) ⊗ … with v ≠ w. On such a summand the isogeny underlying U_{w,2} is an isomorphism at v, and at w (4.5.12), normalised by p^{-l_w}, is the identity on the highest-weight line; so the sheaf map is not divisible by p, and the argument proves the claim only when w is the only place above p (Pilloni's F = Q case, from which the lemma is transcribed). What the proof gives, and what the one use (Lemma 4.6.25: 'By Lemma 4.6.24, the operator U^I is topologically nilpotent') needs, is ∏_{w|p}U_{w,2} ∈ p·End, which U^I contains. The extraction states the per-place lemma in item 246 and records no issue.

**Evidence.** TeX l. 7603–7610, published p. 292: 'For any w|p, we have U_{w,2} ∈ pEnd(RΓ(𝔛^I_{K,Kli}(p^∞), Kω^κ)). Proof. This follows immediately from an examination of (4.5.12).'; (4.5.12), TeX l. 6868–6882, p. 277: the local matrix diag(p,1) on R² over the identity on ω_{H_{m,w}}, 'we can and do normalize … by dividing by p^{l_w}'; Kω^κ defined at l. 7596–7599 as the kernel of the surjection of Corollary 4.3.9; use at l. 7625–7631.

**Fix.** Record a new source issue (gap, affects nothing downstream): 'the per-place statement is not proved for [F:Q] ≥ 2; the proof gives ∏_{w|p} U_{w,2} ∈ p·End, hence U^I ∈ p·End, which is all Lemma 4.6.25 uses'. Restate item 246 in that form.

### 5. Theorem 8.4.1 never assumes ρ unramified almost everywhere (new gap) (medium, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/118, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/119 (route 3); sourceIssues (no record)

**What.** Theorem 8.4.1 (and Theorem 8.5.2) assume of ρ : G_F → GSp_4(Q̄_p) only (1)–(5): similitude ε^{-1}, vast and tidy ρ̄, p-distinguished weight 2 ordinary at v|p, an ordinary π with ρ̄_π ≅ ρ̄, and purity at every finite place. None of these makes ρ unramified outside a finite set (purity is a local condition place by place), and the paper nowhere builds that into 'representation'. The proof needs it: it chooses a solvable F′ with conditions 'at every place w of F′ lying over a place v ∤ p of F for which π_v or ρ|_{G_{F_v}} is ramified', which is possible only for finitely many places, and then invokes Hypothesis 7.13.1, whose (5) requires a finite set R outside which ρ is unramified. Items 118 and 119 copy the hypotheses and no record notes the gap. All applications (§§9–10) have ρ from an abelian surface or a compatible system, so no application is affected.

**Evidence.** TeX l. 15958–15970, published pp. 452–453: 'Suppose that ρ : G_F → GSp_4(Q̄_p) satisfies: (1) ν∘ρ = ε^{-1}. … (5) For all finite places v of F, ρ|_{G_{F_v}} and ρ_{π,p}|_{G_{F_v}} are pure.'; proof, l. 15971–15977: 'At every place w of F′ lying over a place v ∤ p of F for which π_v or ρ|_{G_{F_v}} is ramified, …'. A search of the TeX for 'almost all', 'all but finitely many' and 'finitely many places' finds no standing convention.

**Fix.** Add 'ρ is unramified outside a finite set of places' to items 118 and 119, and record a source issue (gap, affects a stated result, repaired by adding the hypothesis, which holds in every application).

### 6. Proposition 6.6.2 uses Theorem 3.10.1(2) without localization (new gap) (medium, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/287, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/289, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/290, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/291 (route 2); sourceIssues (no record)

**What.** The proof of Proposition 6.6.2 identifies e(T^I)RΓ(𝒳^{G_1}_{K^pK_p}, ω^κ(−D)) with e(U^I)RΓ(𝒳^{G_1}_{K_p(I)K^p}, ω^κ(−D)) 'by Theorem 3.10.1 (2)', but Theorem 3.10.1(1)–(2) are stated for cohomology localized at a non-Eisenstein maximal ideal 𝔪, while Proposition 6.6.2 and Theorems 6.6.4–6.6.5 are stated without localization. So, as printed, they are unproved in degree 1. Item 287's note sees the dependence, but no record exists and items 289–291 state the unlocalized form. §§7–8 use only localized statements, so the main theorems stand.

**Evidence.** TeX l. 4851–4853, published p. 236: 'Let κ = (k_v,l_v)_{v|∞} … be a weight and let 𝔪 be non-Eisenstein. (1) For i = 0, 1, there is … inclusion … ⊆ H^i(X_K^{G_1}, ω^κ(−D))_𝔪'; TeX l. 10501, p. 354: 'Indeed, by Theorem 3.10.1 (2), the cohomology groups on each side can be computed in terms of automorphic representations'.

**Fix.** Record a gap (affects a stated result: Proposition 6.6.2 and Theorems 6.6.4, 6.6.5 as stated), with the repair of localizing the whole of §6.6 at a non-Eisenstein 𝔪 of the spherical Hecke algebra away from S, which commutes with U^I, M_I and the BGG spectral sequence; state items 289–291 in the localized form.

### 7. Proposition 7.10.1's hypotheses do not fit its use in §7.11 (new gap) (medium, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/150, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/324; sourceIssues (no record)

**What.** Proposition 7.10.1 (item 150, planned at DeformationAndDerivedPatchingAlgebra R03.5 and P9) is stated for a decreasing sequence of open ideals I_N of S_∞ with ∩I_N = 0. In §7.11 it is applied with S_N = 𝒯[Δ_N] for surjections Δ_∞ = Z_p^{2q} ↠ Δ_N chosen separately for each N: the kernels ker(S_∞ → S_N) are not open (𝒯 is a power series ring over Λ, so 𝒯[Δ_N] is not Artinian) and are not nested. The proof of 7.10.1 is 'left as an exercise'. The standard repair (pass to open decreasing ideals, e.g. augmentation ideal of (p^N Z_p)^{2q} + m_Λ^N + (framing variables)^N, which contain the kernels because the paper shows ker(Δ_∞ → Δ_N) ⊂ (p^N Z_p)^{2q}) is not recorded, and item 150 is planned in a form its application does not satisfy.

**Evidence.** TeX l. 14303–14313, published p. 423: 'we leave the details of the proof as an exercise … Let S_∞ ⊃ I_1 ⊃ I_2 ⊃ … be a decreasing sequence of open ideals of S_∞ with ∩_N I_N = 0'; l. 14404–14416, pp. 424–425: 'fix a surjection Δ_∞ ↠ Δ_N. The kernel of this surjection is contained in (p^N Z_p)^{2q} … We write S_N = 𝒯[Δ_N]'.

**Fix.** Record a gap (affects the proof). State item 150 in a form that covers the application (arbitrary ideals I_N ⊂ open decreasing J_N with ∩J_N = 0, the data being taken modulo J_N), or add the truncation step to item 324. Add DeformationAndDerivedPatchingAlgebra P8 to item 150's planned list: P8/ultrapatching-of-perfect-complexes plans exactly the two systems patched compatibly modulo ϖ (item 324's note already says P8).

### 8. Route 3 created a second design job for AbelianSurfacesPotentialModularity (high, duplicate)

**Where.** the result file: route 3 (new, AbelianSurfacesPotentialModularity); research/blueprint/queue.json; research/blueprint/make_queue.py

**What.** Route 3 is a 'new' route whose id is the maintainer's existing design target, and its brief says 'When the queue is next generated, the maintainer attaches this brief to the queued job DESIGN-BCGP18 as additional instructions and does not create a design job named after the roadmap id'. That did not happen: the queue now holds two pending design jobs, DESIGN-BCGP18 (order 3, the hardcoded BCGP18 brief) and DESIGN-AbelianSurfacesPotentialModularity (order 142, this route's brief), each with a review job, both writing research/blueprint/roadmaps/AbelianSurfacesPotentialModularity.json and the same packet, readme and suggested file, with no ordering between them. make_queue removes paper designs only when their job id equals a hardcoded one, not when the roadmap id does. DESIGN-BCGP18's prompt therefore never sees the reviewed ownership split, and its hardcoded brief ('A large self-contained theory that is missing, such as higher Coleman theory, is proposed as its own roadmap in restructure') invites a second higher-Coleman proposal beside HigherHidaAndColemanTheory. The same happens to DESIGN-BCGP25 and DESIGN-AbelianSurfacesModularity (from the BCGP 2025 extraction).

**Evidence.** research/blueprint/queue.json: jobs DESIGN-BCGP18 {roadmapIds: [AbelianSurfacesPotentialModularity], order 3, after: []} and DESIGN-AbelianSurfacesPotentialModularity {roadmapIds: [AbelianSurfacesPotentialModularity], order 142, after: []}, both pending with identical outputs. research/blueprint/make_queue.py: 'designs += [d for d in paper_designs(calls, roadmaps) if d[0] not in {x[0] for x in designs}]' (comparison on the job id d[0]); BCGP18_BRIEF text as quoted. Route 3 brief, second paragraph, as quoted. The review's note to the maintainer: 'DESIGN-BCGP18 should take this file's brief'.

**Fix.** Deduplicate paper designs by roadmap id: when a hardcoded design has the same roadmap id, append the route's brief (or a pointer to research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json, route 3) to that job's prompt instead of creating a second job; regenerate the queue so that only DESIGN-BCGP18 and DESIGN-BCGP25 remain, and drop BCGP18_BRIEF's invitation to propose higher Coleman theory separately (it is HigherHidaAndColemanTheory, route 2).

### 9. Part II routes are merged by parent; their ids never exist (medium, other)

**Where.** the result file: routes 1, 2, 4, 5 (part-ii); research/blueprint/make_queue.py paper_designs

**What.** make_queue groups part-ii routes by parent and emits one job DESIGN-<parent>PartII, telling the designer to 'plan the first here and record a restructure proposal for the rest' if the proposals split into independent directions. So the route ids HilbertSiegelModularVarieties, HigherHidaAndColemanTheory, GSp4LocalLanglandsAndGaloisRepresentations and IntegralCoherentHeckeComplexes never become roadmap ids, and every import naming them in this file's five briefs (e.g. route 3's 'Theorem 4.6.1 … from HigherHidaAndColemanTheory') and in the other extractions dangles. Worse, two of this paper's directions come last in mixed groups: the ModularityAndLanglandsExtensions group has ten proposals in six directions (Newton–Thorne 26, Clozel–Thorne, BCG 25, Newton–Thorne 21/21B, then BCGP 21 and BCGP 25 with GSp4LocalLanglandsAndGaloisRepresentations), and the HilbertModularVarietiesAndShimuraCurves group has three (Breuil et al., Ichino–Prasanna, then HilbertSiegelModularVarieties); under the stated rule both GSp_4 directions become restructure notes rather than planned roadmaps. All these jobs have after: [], so DESIGN-BCGP18 can also run before the Part IIs it imports.

**Evidence.** research/blueprint/make_queue.py paper_designs: 'key = ("part-ii", route["parent"]) …', 'part, rid, built = "Part II", base + "PartII", ""', 'if they split into independent directions, plan the first here and record a restructure proposal for the rest'. queue.json: DESIGN-ModularityAndLanglandsExtensionsPartII (order 15), DESIGN-PadicFamiliesPartII (93), DESIGN-AutomorphicBundlesPartII (94), DESIGN-HilbertModularVarietiesAndShimuraCurvesPartII (104), all after: []. Order of part-ii routes to each parent computed from papers.json and the extraction result files.

**Fix.** Group part-ii routes by (parent, roadmap id) so that each direction keeps its id and gets its own design job (or, if one job per parent is kept, rewrite every brief's imports to '<parent>, Part II' and tell the designer to plan every direction), and give DESIGN-BCGP18 'after' edges to the Part II jobs it imports (PadicFamilies, AutomorphicBundles, ModularityAndLanglandsExtensions, HilbertModularVarietiesAndShimuraCurves).

### 10. GSp₄ Galois representations and Hecke polynomials have two owners (medium, duplicate)

**Where.** the result file: route 4, items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/28, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/202, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/163, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/165; PAPER-CALEGARI-GERAGHTY-20, PAPER-PILLONI-20, PAPER-BOXER-CALEGARI-GEE-PILLONI-25

**What.** The GSp_4 Galois representations (Theorem 2.7.1: Mok Thm 3.5 with Taylor/Laumon/Weissauer and local–global compatibility) and the spinor Hecke polynomial Q_v(X) are routed here to the Part II GSp4LocalLanglandsAndGaloisRepresentations, but the accepted extractions of Calegari–Geraghty (2020) route the same theorem over Q to AutomorphicGaloisRepresentationsPartII AG2.2/AG2.5/AG2.6 (items ext-mok-galois-reps-for-GSp4, galois-rep-local-global-compatibility, …), and Calegari–Geraghty (2020), Pilloni (2020) and BCGP (2025) route the Hecke polynomial to IntegralHeckeAndGaloisDeterminants IHG.1/IHG.3. The re-pointing is only in route 4's and route 5's brief prose ('Re-point here the GSp_4-specific items that the Calegari–Geraghty (2020), Pilloni (2020) and 2025 extractions sent to GL_n-only or general layers'); the other files are unchanged, so the queue adds those papers as sources of AG2 and IHG.3 for the same statements. AG2.2 is GL_n/unitary only.

**Evidence.** Result files as named: PAPER-CALEGARI-GERAGHTY-20 source route to AutomorphicGaloisRepresentationsPartII (accepted in its review) with the items quoted; PAPER-PILLONI-20 item hecke-polynomial-gsp4; PAPER-CALEGARI-GERAGHTY-20 item hecke-polynomial-Q-x; PAPER-BOXER-CALEGARI-GEE-PILLONI-25 items 1.8.27-hecke, 1.8.28-Q, 1.8.28-P. This file's route 4 brief as quoted and its route-4 reason: 'AutomorphicGaloisRepresentationsPartII constructs Galois representations for GL_n only'.

**Fix.** Apply the re-pointing in the three other result files (mark those items planned at, or join, GSp4LocalLanglandsAndGaloisRepresentations and drop them from the AG2 and IHG source routes), or file one restructure note so a single fixer does it; until then record the conflict in the four reviews.

### 11. Corollary 7.9.6 has two owners (medium, duplicate)

**Where.** the result file: item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/322 (route 3); PAPER-BOXER-CALEGARI-GEE-PILLONI-25 item 1.8.17-existence

**What.** Corollary 7.9.6 (Galois representations for ordinary parallel weight 2 π over F with p split) is item 322 here, routed to AbelianSurfacesPotentialModularity, while the BCGP 2025 extraction routes the same statement (1.8.17-existence) to GSp4NonregularModularityLifting with the reason 'the mandated abelian-surface roadmap imports it'. Route 3's brief says the opposite: 'GSp4NonregularModularityLifting … is not used here, and neither roadmap imports the other'. Two owners, contradictory import directions.

**Evidence.** PAPER-BOXER-CALEGARI-GEE-PILLONI-25 item 1.8.17-existence and its route reason as quoted; this file's item 322 (Corollary 7.9.6, arXiv pp. 220–221; published p. 420) and route 3 brief as quoted; route 4 brief 'Theorem 2.7.3 and Corollary 7.9.6 … belong to … AbelianSurfacesPotentialModularity'. TeX: Corollary 7.9.6 is proved from Theorem 7.9.4 and the Hida complexes (statement on published p. 420).

**Fix.** Keep Corollary 7.9.6 in AbelianSurfacesPotentialModularity, where its proof lives, and mark BCGP 2025's 1.8.17-existence as planned there; GSp4NonregularModularityLifting and AbelianSurfacesModularity import it.

### 12. Serre's open-image theorem is routed to R28.4, which does not plan it (medium, error)

**Where.** the result file: route 26 (FaltingsFinitenessAndIsogenyTheorems:R28.4), item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/196

**What.** Serre's open-image theorem for abelian surfaces with End = Z is routed as a source of R28.4, which plans semisimplicity and the Tate isogeny theorem and does not plan it; the route's own reason concedes 'its proof goes beyond R28.4' and names Calegari–Geraghty (2020)'s Part II OpenImageTheoremsForAbelianVarieties as 'the natural owner … if it is accepted'. It is accepted (PAPER-CALEGARI-GERAGHTY-20 review, route 5 accept) and queued as DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII, and CG20 routes the same theorem there.

**Evidence.** data/atlas.json FaltingsFinitenessAndIsogenyTheorems:R28.4: 'Derive semisimplicity of V_ℓ(A) and the comparison Hom_F(A,B)⊗Q_ℓ ≅ Hom_{G_F}(V_ℓ(A),V_ℓ(B)) …'; route 26 reason as quoted; PAPER-CALEGARI-GERAGHTY-20.review.json route 5 verdict accept; queue.json DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII.

**Fix.** Replace route 26 by a part-ii join (parent FaltingsFinitenessAndIsogenyTheorems, roadmap OpenImageTheoremsForAbelianVarieties) asking for the statement over an arbitrary number field, and resolve route 3's 'if that Part II is accepted' clauses to an import from it.

### 13. The GSp₄ root datum is routed to D5, against the route's own reason (medium, error)

**Where.** the result file: route 20 (ShimuraData:D5), item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/160

**What.** Item 160 (the Weyl group, root datum and dual group GSpin_5 ≅ GSp_4 in the paper's coordinates) is routed to ShimuraData D5, which plans neatness and Shimura-data examples. Route 20's own reason says 'The GSp_4 root datum in the paper's coordinates belongs to ReductiveGroupsPartII RG2.5 … D5 imports it', route 4's brief imports 'RG2.5 (the dual group GSpin_5 ≅ GSp_4)', and PAPER-PILLONI-20 routes the same content (gsp4-self-dual-root-datum) to RG2.5. The item has two owners and sits at the wrong one.

**Evidence.** Route 20: items [160, 319] with the quoted reason; PAPER-PILLONI-20 source route to ReductiveGroupsPartII with stages [RG2.5] containing gsp4-self-dual-root-datum; RG2.5 'Construct a pinned split dual group over ℤ from the dual root datum'.

**Fix.** Move item 160 to a source route to ReductiveGroupsPartII RG2.5 beside Pilloni's item, with the coordinate conversion; keep only item 319 (Lemma 7.8.3) in route 20.

### 14. Cycle: item 192 is owned at R01.1, upstream of what it needs (medium, error)

**Where.** the result file: route 7 (ArithmeticGaloisRepresentations), item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/192

**What.** Route 7's reason gives item 192 (Patrikis: lifting a projective representation to one that is Hodge–Tate with weights (0,1), using Tate's H²(G_F, Q/Z) = 0) to R01.1. R01.1 is upstream of both inputs: the atlas stage edges give R01.1 → PadicHodgeTheory R06.1 → R06.2 (Hodge–Tate conditions) and R01.1 → ArithmeticGaloisDuality R02.1 → R02.2 (global Galois cohomology). Owning the item at R01.1 makes R01.1 depend on its own consumers: a cycle. G7, also in route 7, has no stage-edge path to R06.2 or R02.2 in either direction.

**Evidence.** data/atlas.json stageEdges (3508 edges), breadth-first search: ArithmeticGaloisRepresentations:R01.1 → PadicHodgeTheory:R06.1 → PadicHodgeTheory:R06.2; ArithmeticGaloisRepresentations:R01.1 → ArithmeticGaloisDuality:R02.1 → ArithmeticGaloisDuality:R02.2; no path between G7 and R06.2 or R02.2. Route 7 reason: 'R01.1 ("Include restriction, induction, duals, twists") gets the lifting of projective representations with Hodge–Tate conditions (Patrikis)'.

**Fix.** Give item 192 to ArithmeticGaloisRepresentations G7 (edges R06.2 → G7 and R02.2 → G7 are acyclic) and name Tate's H²(G_F, Q/Z) = 0 as an input requested from ArithmeticGaloisDuality R02.2/R02.4.

### 15. Duplicate items 144/264, 259/265, 38/159 (medium, duplicate)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/144, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/264 (route 13), PAPER-BOXER-CALEGARI-GEE-PILLONI-21/259, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/265 (route 2), PAPER-BOXER-CALEGARI-GEE-PILLONI-21/38, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/159 (planned RG2.3)

**What.** Two pairs of items state the same §6.5 material and are each routed twice: 144 and 264 (§6.5.1, Fargues' degree and δ_H, both to HodgeTateAndCanonicalSubgroups; their notes contradict each other on whether T0 plans the degree), and 259 and 265 (§6.5.2, deg_v and the neighbourhoods 𝒳(J), both to HigherHidaAndColemanTheory; 259's note says it was split from 144, yet 265 was added separately). Items 38 and 159 both plan the parahoric subgroups at RG2.3.

**Evidence.** Result file: items 144 and 264 with locators '§6.5.1 … published p. 339'; 259 and 265 with '§6.5.2 … published pp. 339–340'; route 13 reason 'items 144 and 264 state the same material'. Items 38 and 159, both planned ['ReductiveGroupsPartII:RG2.3'].

**Fix.** Merge 264 into 144 (keeping 264's itemised statement and the degree note), 265 into 259 (keeping 𝒳^mult and 𝒳((ε_v))), and 38 into 159; re-point cross-references (items 83, 271, 285) and reconcile the T0 claim.

### 16. No item for the minimal compactification or the affineness of Hasse strata (medium, missing)

**Where.** the result file: route 1 (HilbertSiegelModularVarieties) and route 2 (HigherHidaAndColemanTheory); items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/221, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/224, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/235, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/59, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/54

**What.** The integral minimal compactification X^*_K and its G_1-quotient X^{*,G_1}_K = Δ\X^*_K have no item, although §§3, 4, 6 and 8 use them: f : X → X^*, f_*O_X = O_{X^*}, π_*I_D = I_{∂X^*}, R¹π_*I_D = 0, descent of det ω, and the boundary ∂X^* = ∂_0X^* ⊔ ∂_1X^* with ∂_1 a union of Hilbert modular varieties. Item 221's note says so ('The minimal compactification X^* itself has no item'). Nor does any item state what §4 uses of it repeatedly: the partial Hasse invariants Ha(𝒢_w), Ha′(𝒢_w) extend to X^{*,G_1}_1 and the strata {Ha(𝒢_w)^n = 0, Ha′(𝒢_w) ≠ 0 (w ∈ J), Ha(𝒢_w) ≠ 0 (w ∉ J)} are affine there. This is asserted without proof and is not formal (a single partial Hasse invariant is a section of the non-ample det ω_w^{p−1}); it is what makes the Cousin complexes of §4.2 and §4.6.8 compute RΓ. ShimuraCompactifications C5 plans the integral minimal compactification only for PEL data at good primes; item 182 covers affineness only of Ekedahl–Oort strata for §8.

**Evidence.** TeX l. 4588, p. 229: 'denote by X^⋆ the minimal compactification. We have a morphism f : X → X^⋆' (first use, undefined); l. 4939–4954, pp. 237–238: '∂_0X^⋆ ∐ ∂_1X^⋆, where ∂_1X^⋆ is a union of Hilbert modular varieties' and 'π_*O_{X_K^{G_1}} = O_{X_K^{*,G_1}}, π_*I_D = I_{∂X^*}, and R¹π_*I_D = 0'; proof of Proposition 4.2.33, l. 6294–6300, p. 265: 'its support in the minimal compactification is the locally closed subscheme given by … Ha(𝒢_w)^n = 0 for w ∈ J, Ha′(𝒢_w) ≠ 0 for w ∈ J, Ha(𝒢_w) ≠ 0 for w ∈ J^c, which is affine'; §4.6.8, l. 7403, p. 287. data/atlas.json ShimuraCompactifications:C5 'Keep the good-prime assumptions on the input PEL datum'.

**Fix.** Add a construction item 'X^*_K for Y_K at hyperspecial level and X^{*,G_1}_K = Δ\X^*_K, with π_*O, π_*I_D, R¹π_*I_D = 0, descent of det ω and the boundary decomposition' (planned in part at ShimuraCompactifications C5; the G_1 quotient and boundary description to HilbertSiegelModularVarieties), and a theorem item for the extension of Ha, Ha′ to X^{*,G_1}_1 and affineness of the p-rank strata there (to HigherHidaAndColemanTheory with item 54). Items 221, 224, 235, 59, 78 import them.

### 17. Planned statuses too strong, or missing packet nodes (medium, other)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/162, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/195, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/11, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/35, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/204, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/150, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/148, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/174, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/123, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/185

**What.** Statuses and owners that disagree with the atlas. (a) Item 162 is planned, but its note says 'The existence of isobaric sums π_1 ⊞ π_2 … is named by no layer'; ET.7a and ML.5 do not name ⊞. (b) Item 195 is planned at ML.5, which registers 'selected tensor/symmetric-power transfers'; Kim's ∧²: GL_4 → GL_6 (part (b)) is neither. (c) Item 11 (GSp_4 with ν) omits the packet node ArithmeticStatistics:ST.5/symplectic-similitude-group, which plans GSp(V) over any commutative ring, and item 35's note says 'GSp_4 with its similitude character ν (item 11) is not planned', contradicting item 11's status. (d) Item 204's note says no layer formulates the functional equation, but PotentialModularityAndCompatibleSystems:R24.5/system-l-functions and ModularityAndLanglandsExtensions:ML.2/compatible-system-l-function-continuation plan L-, Γ- and ε-factors and Λ(ıℛ,s) = ε(ıℛ,s)Λ(ıℛ^∨,1−s) for regular systems; the item is missing only because H¹ of an abelian surface is not regular. (e) Moret-Bailly in BLGGT's form is the node ML.2/moret-bailly-galois-control, which items 148 and 174 do not cite (148 cites only R23.1, so Moret-Bailly has two planned owners). (f) Item 185 cites only ML.5, which only registers statements; the proof plan is ET.7a (item 162 already cites it).

**Evidence.** data/atlas.json stage texts ML.5 'Register cyclic base change, automorphic induction and selected tensor/symmetric-power transfers'; research/blueprint/packets/ArithmeticStatistics.json node ST.5/symplectic-similitude-group 'The similitude group GSp(V) consists of the R-linear automorphisms h with ω(hx, hy) = m(h)·ω(x, y) …'; packets PotentialModularityAndCompatibleSystems--R24.3.json node R24.5/system-l-functions and ModularityAndLanglandsExtensions.json nodes ML.2/compatible-system-l-function-continuation ('(2) ℛ is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s)') and ML.2/moret-bailly-galois-control ('Then there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from K^(avoid) …'); item notes as quoted.

**Fix.** (a) split ⊞ from item 162 as a missing item (owner AutomorphicSpectralTheory or ET.7a); (b) split part (b) of item 195 as missing, owner ML.5 with item 186; (c) add the ST.5 node to item 11 (points only) and reword item 35's note to 'GSp_4 is planned (item 11); G_1 and G are not'; (d) cite both nodes in item 204 and say that what is missing is the non-regular case; (e) cite ML.2/moret-bailly-galois-control in items 148 and 174 and choose one owner; (f) add ET.7a to item 185.

### 18. The GSp₄ Carayol lemma has no item (low, missing)

**Where.** the result file: item PAPER-BOXER-CALEGARI-GEE-PILLONI-21/106 (route 3); no item

**What.** Theorem 7.9.4 makes ρ take values in the Hecke algebra by the similitude-preserving GSp_4 form of Carayol's lemma, [GG12, Lem. 7.1.1], cited twice; it appears only as a phrase in item 106's note ('with Gee–Geraghty, Lem. 7.1.1'). The GL_n form is planned (GlobalGaloisDeformations:R04.2/carayol-trace-theorem), the GSp_4 form with fixed multiplier is not.

**Evidence.** TeX l. 14039–14045, published p. 418: 'it follows from [gg, Lem. 7.1.1] that for each n the representation ρ_A ⊗_A A/I_n is ker(GSp_4(A/I_n) → GSp_4(k))-conjugate to a representation …'; also l. 14101. Packet GlobalGaloisDeformations.json node R04.2/carayol-trace-theorem (GL_n).

**Fix.** Add a theorem item 'Carayol's lemma for GSp_4 with fixed similitude (Gee–Geraghty, Companion forms for unitary and symplectic groups, Duke 161 (2012), Lem. 7.1.1)', routed to GlobalGaloisDeformations G7 on top of the R04.2 node.

### 19. About fifteen unrecorded misprints and errors (low, other)

**Where.** the result file: sourceIssues; items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/43, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/222, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/314, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/144, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/264, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/262, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/77, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/268, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/287, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/288, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/20, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/29, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/207, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/60, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/243

**What.** Mistakes present in both versions that are corrected silently in item notes, or not at all, with no sourceIssues record (PROTOCOL §18 lists every mistake found): Theorem 3.5.1(3) prints π^*I_{X_{K,Σ}} = I_{X_{K,Σ′}}, false for any proper smooth refinement (only ⊂ holds; blowing up the corner of D = {xy = 0} gives π^*(xy) = a²b in the chart x = a, y = ab), and item 43's note even says it 'is recorded as a source issue' but no record is at Theorem 3.5.1; Remark 3.9.21's factors diag(1,p^{-1},p^{-1},p^{-1}) and diag(1,1,1,p^{-1}) are not in GSp_4(F_w) (for the antidiagonal J, diag(a,b,c,d) is a similitude iff ad = bc); Remark 7.5.23 says the order-128 Sylow 2-subgroup is 'not enormous', contradicting §7.5.20's list of enormous classes, which includes one of order 128 (all subgroups of order 128 = 2^7 of Sp_4(F_3), |Sp_4(F_3)| = 51840 = 2^7·3^4·5, are conjugate Sylow subgroups); §6.5.1 defines deg M = Σv(x_i mod p) (truncated) and puts δ_H in det ω_{𝒢′} ⊗ det ω_𝒢^{-1}, whereas the pull-back ω_{𝒢′} → ω_𝒢 gives a section of det ω_𝒢 ⊗ det ω_{𝒢′}^{-1} (items 144 and 264 copy the inverted bundle); (6.5.5) drops (−D); §6.2 uses 𝔗_{n,w} where only 𝔗_{n,w′} is defined; §6.6 writes e(T^I) for e(T̃^I); Lemma 2.4.15(2) prints T_{v,1} for T^{GL_2}_{v,1}; Theorem 2.7.3 prints GL_2(K) for GL_2(A_K); the proof of Lemma 2.9.1 prints μ_π for ω_π; §7.3.10 prints 'R^{P,□} and R^{P,□}' for R^{B,□} and R^{P,□}; §7.7 prints ᾱ_{v,n} for ᾱ_{v,4}; §4.3.1 lists 𝔛^{≥2} ↪ 𝔛^{≥1} as corresponding to X^{≥1}, X^{≥2} in the wrong order.

**Evidence.** TeX (and the same published pages): l. 3870–3871 (p. 213); l. 4771–4776 (p. 234); l. 13046–13050 'However, this latter subgroup is not enormous' and l. 12927–12930 'precisely 11 of them are enormous, of orders 40, 128, 160, …' (pp. 398–401); l. 9791 'deg M := Σ_{i=1}^r v(x_i mod p)' and l. 9799 'a section δ_H of the locally free sheaf of rank one det ω_{𝒢′} ⊗ det ω_𝒢^{−1}' (p. 339); l. 9888–9890 (p. 341); l. 9219 vs l. 9197 (p. 325); l. 10499–10517 (pp. 353–354); l. 1984–1985 (p. 178); l. 2775 (p. 193); l. 3074 (p. 198); l. 11449 (p. 370); l. 13391 (p. 407); l. 6415–6418 (p. 267). No record in sourceIssues has these locators.

**Fix.** Add records (misprints affecting nothing, except Theorem 3.5.1(3), Remark 7.5.23 and the δ_H direction, which are errors affecting nothing), and point items 43, 144, 264 and 314 to them; correct the δ_H bundle in items 144 and 264.

### 20. Incomplete records E2, E36, E112, E113 (low, other)

**Where.** the result file: sourceIssues PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E2, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E36, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E112, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E113

**What.** Records whose corrections are incomplete or inconsistent: E2 misses the third unminused 𝓕^{w_J•κ,w} at the end of the proof of Corollary 6.4.3 (the review's own verdict says so) and over-corrects the statement, which is defensible with 𝓕^{κ,w}; E36's list of places needing p ∤ #Δ(K^p) omits the proof of Proposition 3.9.15 ('restrict to the G_1 direct factor', i.e. Proposition 3.8.3); E112's correction 'ρ̄(σ) = ±ρ̄(σ_0)' holds only with ψ = ε^{-1}, which E113 says to drop from Lemma 7.6.1, and E113 omits that Corollary 7.6.3 also drops 'p unramified in F'.

**Evidence.** E2 review: 'The statement is defensible as printed, and the recorded correction misses one occurrence'; TeX l. 9776 (p. 339). TeX l. 4696 (p. 232) 'restrict to the "G_1" direct factor'. TeX l. 13222–13226, 13280–13284, 13293–13296 (pp. 405–406).

**Fix.** E2: 'read 𝓕^{s•κ,w^−} in the spectral sequence and 𝓕^{w_J•κ,w^−} in the last paragraph of the proof; the statement may keep 𝓕^{κ,w}'. E36: add Proposition 3.9.15, repairable by running the Cousin argument on X^{G_1} directly. E112: 'ρ̄(σ) = zρ̄(σ_0) for a scalar z (z = ±1 when ψ = ε^{-1})'. E113: add 'p unramified in F'.

### 21. Smaller statement defects in items (low, error)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/30, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/73, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/53, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/2, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/3, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/4, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/5, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/6, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/7, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/29, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/101

**What.** Smaller statement defects: item 30 requires WD_v(𝓡) 'over M' with ς : M ↪ M̄_λ, where the paper (and item 156, which owns the definition) says over M̄, a strictly weaker condition; item 73 states Theorems 5.8.4 and 5.8.6 without p ≥ 3, which the proof uses (Corollary 5.4.5 needs l_w = 3 − p ≤ 0); item 53 repeats the introduction's looser control statement without Theorem 4.6.1(4)'s hypotheses (k_v − l_v ≥ C at v ∈ I^c, k_v ≡ l_v ≡ 2 mod p−1, projector e(T̃^I)); items 2–7 and 29 do not carry the Arthur/Gee–Taïbi conditionality of §1.4.1 (item 33), although Remark 9.3.2 says the modularity lifting theorems depend on it; item 101 omits ν∘ρ̄ = ε̄^{-1}, which Hypotheses 7.7.1 and 7.8.1 use implicitly (ψ = ε^{-1} must lift ν∘ρ̄).

**Evidence.** TeX l. 2845–2848 (p. 194): 'a Weil–Deligne representation WD_v(𝓡) of W_{F_v} over M̄ such that … every M-linear embedding ς : M̄ ↪ M̄_λ'; l. 8702 and 7993 (pp. 314, 301); l. 5131–5135 vs 7015–7022 (pp. 241, 280); l. 16845–16850 (p. 466) 'our main modularity lifting theorems also depend on these results, in particular to prove that the modules that we patch are balanced'; l. 13324–13356 (pp. 406–407).

**Fix.** Correct item 30 to M̄ (or refer to item 156); add p ≥ 3 to item 73; add the exact hypotheses of 4.6.1(4) to item 53; add a note pointing to item 33 on items 2–7 and 29; add '(0) ν∘ρ̄ = ε̄^{-1}' to item 101.

### 22. Minor owner conflicts and generality of source routes (low, other)

**Where.** the result file: routes 7, 8, 9, 10, 16, 17 and 1–5 (prerequisites)

**What.** Lesser owner problems: 'tidy' (Definition 7.5.11) is at ArithmeticGaloisRepresentations G7 here but under GlobalGaloisDeformations in BCGP 2025 (6.3-tidy); pure Weil–Deligne representations are owned at AutomorphicGaloisRepresentationsPartII AG2.5 here (route 16, items 26, 170) while Gan–Harris–Sawin (2024) and Ciubotaru–Harris (2026) mark them planned at DeligneWeightsAndPurity DWP.5; Shahidi's twisted exterior-square L-functions (item 186) go to ML.4 (Arthur/Mok/KMSW classification) rather than ML.5, where item 195's exterior-square transfer is; routes 9 and 6 send GSp_4-valued problems over a totally real F to GL_n/CM stages (G7 'For a CM extension F/F⁺', R04.1–R04.3, L7, R08.2) without saying the stage must add a GSp_4 branch, while GValuedDeformationsAndPotentialAutomorphy plans Ĝ-valued deformation theory; route 17 sends solvable Artin modularity over a totally real field (item 199) to R17.5, planned 'with its weight-one interpretation over Q'; the routes' prerequisites fields omit imported roadmaps (route 5 has none; route 3 omits IntegralCoherentHeckeComplexes).

**Evidence.** Result files PAPER-BOXER-CALEGARI-GEE-PILLONI-25 (6.3-tidy), PAPER-GAN-HARRIS-SAWIN-ETAL-24 and the Ciubotaru–Harris extraction (DWP.5 pointers); data/atlas.json stage texts of ML.4 ('Classical-group classification and trace sources'), ML.5, GlobalGaloisDeformations:G7, GL2AutomorphicRepresentationsAndTransfer:R17.5; this file's routes 7, 8, 9, 16, 17 and routes[0..4].prerequisites.

**Fix.** Re-point BCGP 2025's 6.3-tidy to G7 and the DWP.5 pointers to AG2.5; move item 186 to ML.5; make routes 6 and 9 say explicitly that the stages must add a fixed-multiplier GSp_4 branch shared with GValuedDeformationsAndPotentialAutomorphy; make route 17 ask R17.5 for totally real fields; list every imported roadmap in the prerequisites.

### 23. No structured sourceVersions; collation mislabels the paper (low, other)

**Where.** the result file: source (no sourceVersions); data/collation.json

**What.** The extraction read the published version and recorded its hash only in free text (source.readSections); it has no structured sourceVersions, although eleven of its records quote a stated result (PROTOCOL §18). As a result the collation pipeline classifies PAPER-BOXER-CALEGARI-GEE-PILLONI-21 as read from the preprint.

**Evidence.** Result file: no sourceVersions key; source.readSections records the published PDF with sha256 b4cc8b01…8454af read 2026-09-23. data/collation.json: '"PAPER-BOXER-CALEGARI-GEE-PILLONI-21": "preprint"'.

**Fix.** Add sourceVersions with the published PDF (Centre Mersenne, sha256 b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af), the arXiv v3 PDF and the arXiv v3 e-print, each with its read date.

### 24. Missing published pages (low, other)

**Where.** the result file: items PAPER-BOXER-CALEGARI-GEE-PILLONI-21/113, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/114, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/116, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/117, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/118, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/119, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/78

**What.** Locators: the §8 items give no published page (items 113, 114, 116–119), and item 78's published range should start at p. 326, where §6.2.1 begins.

**Evidence.** Published pages located in the published text: Theorem 8.2.1 and Corollary 8.2.2 p. 440; Lemma 8.2.3 p. 443; Lemma 8.2.5 p. 444; Lemmas 8.2.7–8.2.8 and Corollary 8.2.9 p. 447; Lemma 8.2.10 p. 448; Lemma 8.2.11 p. 450; Lemmas 8.3.1–8.3.2 p. 451; Theorem 8.4.1 pp. 452–453; Definition 8.5.1 and Theorem 8.5.2 p. 453; §6.2.1 begins on p. 326 (TeX l. 9237).

**Fix.** Add these published pages to the listed items.

## What I checked

The full list is in the result file's `checked` field. In brief:

- **Authorship.** Checked from the four target files and their git history.
- **Sources.** All three hashes re-computed; later versions and errata looked for.
- **Items.** All 332 statements, kinds and locators compared with the TeX and the published text.
- **Source issues.** All 159 located; every error and gap, and a sample of misprints, re-argued (E139, E155 and E156 also recomputed).
- **Libraries.** The three library items and every library claim in notes read at Mathlib 082e2d3 and Tau Ceti f790474; all 296 missing items searched in the declaration index and the atlas.
- **Atlas.** Every planned stage and every source-route stage read in full, with its packet and decomposition nodes.
- **Route order.** Computed from the 3508 stage edges of `data/atlas.json`; the only reverse dependency is finding 14. Proposal-level imports are acyclic.
- **Other extractions.** Owners compared item by item with Calegari–Geraghty 2018/2020, Pilloni 2020, Boxer–Pilloni 2026, BCGP 2025, BCG 2025, BCGNT 2025, the ten-author paper, Masser–Zannier 2020 and BHKT 2019.
- **Queue.** `queue.json` and `make_queue.py` checked for how the routes become design jobs.
- **Review.** Its changes introduced one error (item 109, finding 2); its main omission is findings 1–2.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports 0 problems.
