# PAPER-YUN-ZHANG-17: Shtukas and the Taylor expansion of L-functions

Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions*, [Ann. of Math. 186 (2017), no. 3, 767–911](https://doi.org/10.4007/annals.2017.186.3.2); arXiv [1512.02683](https://arxiv.org/abs/1512.02683).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1163). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-YUN-ZHANG-17.result.json](PAPER-YUN-ZHANG-17.result.json): 70 items (5 library, 16 planned, 49 missing), 6 routes, 31 prerequisite entries and 39 source-issue records. The 30 September repair by Codex `codex-J6LwjP` preserves the original extraction and independent-review provenance, narrows E28, and adds two harmless-misprint records awaiting review.

**Source.** The **published version** was read in full (145 pp., from the author's copy at `math.mit.edu/~zyun/Taylor_Expansion_published.pdf`, SHA-256 `b02ed5cb…c50fc111`, fetched 2026-09-22); locators are journal pages (journal page = pdf page + 766). **arXiv v3** (11 April 2017) carries the same 112 numbered statements; each recorded misprint was compared with it, and the one place where the two differ is named. Pages 902, 903, 887 and 905 were also read as rendered images, because a text layer flattens the superscripts on which items E1, E2 and E4 turn.

## What the paper proves

**Setting.** X is a smooth proper geometrically connected curve over k = F_q (p > 2), ν : X′ → X an étale double cover with X′ geometrically connected, G = PGL_2, and T = (Res_{F′/F}G_m)/G_m the resulting nonsplit torus. Sht^r_G is the moduli of PGL_2-shtukas with r legs (dimension 2r), Sht′^r_G = Sht^r_G ×_{X^r} X′^r, and Sht^μ_T the moduli of T-shtukas with r legs — a smooth proper Deligne–Mumford stack of dimension r, finite étale over X′^r. Its image θ^μ_*[Sht^μ_T] is the **Heegner–Drinfeld cycle**, of middle dimension in Sht′^r_G.

**Theorem 1.2.** For r even and π everywhere unramified cuspidal,

  (|ω_X|/(2(log q)^r))·ℒ^{(r)}(π_{F′}, 1/2) = ([Sht^μ_T]_π, [Sht^μ_T]_π)_π,

with ℒ(π_{F′}, s) = ε(π_{F′}, s)^{−1/2}L(π_{F′}, s)/L(π, Ad, 1), self-dual under s ↦ 1−s.

The theorem identifies the **even-order** Taylor coefficients with intersection numbers; r = 0 is the unramified function-field Waldspurger formula (Remark 1.3). The odd-leg Gross–Zagier comparison requires the ramified sequel and its parity/level hypotheses. Theorem 1.6 is the same identity in ℓ-adic cohomology; Theorem 1.1 and Theorem 7.16 are the underlying spectral decompositions (each π-eigenspace of W has dimension ≤ 1); Theorem 1.7 deduces that the intersection pairing is **positive definite** on the cuspidal part — evidence for the Hodge standard conjecture for a subquotient of Ch_r(Sht′^r_G); Theorem 1.8 is a Kronecker limit formula for the Eisenstein part.

**Method (§1.7).** Two relative trace formulae are compared, and the theorem follows from the key identity I_r(f) = (log q)^{−r}J_r(f) for all f ∈ H. The proof is global throughout: no local orbital integrals are matched, and in fact the orbital expansions agree term by term (Remark 1.10).

- **Analytic side (§§2–4).** J(f, s) = ∫^{reg}_{[A]×[A]}K_f(h_1,h_2)|h_1h_2|^sη(h_2) is a Laurent polynomial in q^s (Propositions 2.1, 2.3), with an orbital expansion over u = inv(γ) ∈ P¹(F) ∖ {1} computed explicitly for f = 1_K (Proposition 2.4: L(η,2s) + L(η,−2s) at u = 0 and, as corrected by the review, the constant 2L(η,0) at u = ∞), and — after the Eisenstein ideal kills the Eisenstein part of the kernel (Theorem 4.3) — the spectral expansion J(f,s) = (1/2)|ω_X|Σ_π ℒ(π_{F′}, s+1/2)λ_π(f) (Proposition 4.5, Theorem 4.7), which is Waldspurger's formula by Jacquet's relative trace formula.
- **Geometric side (§§5–7).** The Hecke action on Sht^r_G is defined by cycles on the *whole* stack rather than by étale correspondences away from bad points (Proposition 5.10), so I_r(f) is defined for every f. It is rewritten as a trace on a Hitchin-type moduli stack M_d (Theorems 6.5–6.6) — the hardest part, and where the Octahedron Lemma is used. A finiteness analysis of the Hecke action on H^{2r}_c(Sht_G) (Lemmas 7.9–7.13) makes the image H_ℓ a finitely generated algebra of Krull dimension one, giving the orthogonal spectral decomposition (Theorems 7.14, 7.16).
- **Comparison (§§3, 8–9).** Both sides become Frobenius traces on direct images over the same base A_d: Rf_{M,*}Q_ℓ ≅ ⊕_{i,j}K_i ⊠ K_j with the Hecke correspondence acting by (d−2j) (Propositions 8.2–8.3), while Rf_{N_d,*}L_d ≅ K_{d₁₁} ⊠ K_{d₁₂} as a middle extension (Proposition 8.5). Hence (log q)^{−r}J_r(u, h_D) = I_r(u, h_D) orbit by orbit for deg D large (Theorem 8.1), and then for all f ∈ H by a density argument in H_ℓ (Lemma 9.1, Theorem 9.2).

**Appendix A** builds the intersection theory this needs on Deligne–Mumford stacks locally of finite type: Chow groups of proper cycles with the 1/|Aut| degree, a *corrected* filtration on K′_0 through finite flat presentations (the naive one is wrong for stacks and can be nonzero in negative degrees), the compatibility of refined Gysin maps with derived pullback (Proposition A.5), the **Octahedron Lemma** (Theorem A.10: intersections may be taken in any order), and a Lefschetz trace formula against the graph of Frobenius (Proposition A.12). **Appendix B** proves **super-positivity**: Λ^{(r)}(π, 1/2) ≥ 0 for self-dual cuspidal π of GL_n with entire completed L-function under RH, unconditional over function fields within that scope — the input that makes Theorem 1.7 unconditional.

## What the atlas already has

Tau Ceti at `f790474` already supplies `TauCeti.Divisor`, `Divisor.degree`, `finiteDimensional_riemannRochSpace`, `degree_weilDifferentialDivisor`, `Divisor.finite_setOf_isEffective_degree_le`, `Divisor.classNumber` and `Divisor.classNumber_pos`. New items 65–69 credit the exact arithmetic statements and hypotheses: function-field assumptions, finite constants for the finiteness/class-number claims, and exact constants for canonical degree. Comparisons with scheme sections, Picard/Jacobian rational points and automorphic normalization remain separate work.

FA.2 supplies function-field harmonic analysis; FA.4–5 supply reciprocity/Chebotarev and zeta factors; FA.6 supplies automorphic functions, fixed-level cuspidal finiteness and Satake. GS.0 already has the Picard Lang isogeny, and GS.3 has the precise cuspidality/Hecke-finiteness theorem. SF.3 supplies curve/Picard foundations. EDC's reviewed contracts supply scheme sheaf theory and import the upstream PR196 point-counting and Künneth results. The inspection does not credit those foundations as the specialized stack, shtuka or spectral constructions.

The missing inputs are now explicit: function-field Eisenstein kernels, ordinary multiplicity one and cuspidal/Eisenstein disjointness; exact period normalizations; stack Chow/Gysin and sheaf operations; the Picard-local-system, symmetric-power and norm adapters; and the reusable Hadamard factorization input. Strong multiplicity one is shared with YZ19/233, and Hadamard is coordinated with the existing AN.2 analytic proof debt. GZ.5's proposed unconditional PGL₂/Q central-value nonnegativity (RT-AREA-iwasawa-1/16) is an overlap reference; it neither supplies nor depends on the conditional all-derivatives statement here.

## Routes after the verified repair

| Route | Owner | Missing items | Purpose |
|---|---|---:|---|
| 1 | `ShtukaSpecialCyclesAndHigherSiegelWeil` | 33 | Joint YZ17/YZ19/FYZ24 cycle theory and its function-field analytic comparison |
| 2 | `SchemeAndStackFoundations` SF.1/SF.3/SF.5 | 8 | Torsion-sheaf geometry, section/norm/Prym adapters, source-scoped stack Chow/Gysin theory and Appendix A |
| 3 | `EtaleDualityAndPerverseSheavesPartIIStacks` | 3 | Shared stack operations, duality/cycle maps and Frobenius trace |
| 4 | `AutomorphicLFunctionsAndLocalFactors` AL.2 | 2 | Corrected super-positivity application |
| 5 | `AnalyticNumberTheory` AN.2 | 1 | Single reusable canonical-product/Hadamard supplier shared with the existing zero-free-region proof debt |
| 6 | `RamifiedGeometricClassFieldTheory` | 2 | Unramified instances of YZ19/170 and /165 |

The six analytic items formerly assigned to number-field GZ.5 now have the same function-field owner as their ramified YZ19 counterparts. The assigned YZ19 extraction moves all 18 items from its old GZ.5 route into the joint cycle tranche and moves its generic DM trace inputs /120 and /227 to the shared stacks proposal. YZ19/116 stays at the existing SF source owner; finding /3 was rejected. The repaired YZ19 routes have counts 64, 1, 2, 2, 2, 129, 28 and 3, covering all 231 routed items, of which 224 are missing; its 240 item IDs/statuses and 71 source issues are unchanged.

These candidate ids are **proposals**. The current queue groups Part IIs by parent and has no dedicated special-cycle job. The mandatory joint cycle tranche must remain in the merged design or receive a coordinated split before its consumers can close. The [fixes report](../redteam/RT-PAPER-YUN-ZHANG-17.fixes.md) specifies the required maintainer change; no queue-generator file was edited. Draft ST.0–ST.6 keys are not claimed as existing atlas stages.

The briefs preserve the differing stack hypotheses, operation domains, coefficients and support conditions. In particular, a scheme correspondence theorem is not stack coverage; Artin-stack operations need not preserve bounded constructibility; and top compact-support cohomology has a trace map rather than a general one-dimensional identification (E34). All new source proofs and exact supplier adapters remain obligations of the owning blueprints. Extraction status `complete` means the mathematics is itemized and routed, not that those proofs have closed.

## Source issues and publication record

The original full reading of the author's published copy on 22 September is now recorded in structured `sourceVersions`. The fresh 30 September Annals download has the same SHA-256 `b02ed5cbe5e6443a59360551cd41048ebb1e589d3c4cbe89f7fcbbbec50fc111`; the v3 hash also reproduces. The current audit is selective, including rendered pp.824,878,889. No Annals fetch or whole-paper reread has been backdated.

E28 now retains only its two genuine typographical slips. The printed p.824 smoothness assertion is valid: the hatted section stack is a vector bundle over the Picard stack, the norm is smooth of relative dimension g−1, and base change gives the claimed dimension d−g+1 over the unhatted factor. Its former three-part entry and old review are preserved as history; the narrower finding needs independent fix review. E9's Weyl-substitution explanation now retains the exponent s on both absolute-value factors.

New **E38** corrects the nonexistent Lemma 7.15(3) reference to 7.15(2) (published p.878 and v3 p.77). New **E39** records the duplicated article on p.821, missing prepositions on p.828 and lemma/proposition slip on p.862. Both are harmless and await independent review. The actual search covered the Annals and author pages, Crossref metadata, arXiv's version history, targeted v3 passages and targeted web searches; v1–v2 were not read in this repair. The standard cuspidal/Eisenstein disjointness input is exposed as item 70, without accusing the published proof of a new mathematical error.

## Validation

Both paper checkers pass. Every missing item is routed exactly once. Intake validates the four assigned deliverables, and the structural checks preserve all original IDs, YZ19 statuses/source issues, rejected finding /3's owner, and historical review records. The new arithmetic citations were read at the pinned Tau Ceti commit; Mathlib's Jensen result was checked and is credited only as a starting point for Hadamard. No Lean file was assigned or compiled.

## Historical independent review corrections (REV-PAPER-YUN-ZHANG-17, 23 September 2026)

The following is the original review record, retained as history. Its five-route acceptance does not approve the six repaired routes above. Its E9 prose also omitted an exponent now restored in the current JSON, and its E28 confirmation preceded the withdrawal of the valid smoothness accusation. No earlier review verdict is silently rewritten or extended to the new items. The new independent fix review must reconcile route indices and decide E28/E38/E39.


The review read the whole published version, with the same SHA-256 as the extraction, and compared every finding with arXiv v3. arXiv v3 is dated **11 April 2017**, not 24 January 2017; 23 January 2017 is the journal's revision date.
- **Method.** Three read-only helper agents split the paper (§§1–4; §§5–7; §§8–9 and the appendices). They re-derived the explicit formulas, checked dimensions and point counts, and tested Appendix B numerically. The reviewer checked every finding at the page image or in the text.
- **Routes.** All five are accepted, and the Part II brief is amended.
- **Statuses.** Item 43 gains GlobalShtukasAndFunctionFieldLanglands GS.6 and DeligneWeightsAndPurity DWP.7 for the Riemann hypothesis over function fields.

**An extraction error, now corrected.** The main theorems have |ω_X| in the **numerator**:
- Theorems 1.2 and 1.6 read (1/(2(log q)^r))·|ω_X|·ℒ^{(r)}(π_{F′}, 1/2);
- Proposition 4.5 and Theorem 4.7 read ½|ω_X|ℒ(π_{F′}, s + ½)λ_π(f).

The extraction had 1/(2(log q)^r|ω_X|) and (1/2|ω_X|). Since |ω_X| = q^{2−2g}, that is off by a factor q^{4g−4}. Items 1, 2 and 14, the summary, the route texts and the formula above are corrected.

**Recorded issues.**
- **E1–E7 are confirmed.** E2's "affects" changes to "nothing": the proof of Remark B.4 uses only positivity of the even coefficients, and the printed coefficient is off by (2j)!/j!, not by a factor 2.
- **E8 is rejected.** "by Pólya [4]" is an ordinary citation of a result of Pólya treated in [4].

The statements above that no mathematical error was found, that Theorem 1.8's 2^{r+2} is consistent, and that every cross-reference was checked are superseded by what follows.

**New issues (E9–E37).**
- **E9 (error, a stated result).** Theorem 1.8 should read 2^{r+1}(log q)^{−r}L^{(r)}(η, 0), not 2^{r+2}.
  - The u = ∞ orbital integrals of Proposition 2.4 are 2L(η, 0), independent of s. Their proof says "analogous", but the swap γ ↦ γw turns |h₁h₂|^s into |h₁||h₂|^{−s}.
  - So Corollary 2.5 gives 2^{r+1}L^{(r)}(η, 0) for r > 0 even, and Theorem 1.8 inherits this through §9.1.1.
  - A genus-2 example over F_5 gives 184 against the printed 368. The r = 0 case and Theorems 1.1–1.7 are unaffected.
- **E15, E16, E17 (errors in Appendix B).**
  - E15: Theorem B.2 fails for n = 1 over a function field. π = (−1)^{deg} is nontrivial, cuspidal and self-dual, but L(π, s) has poles and Λ″(π, 1/2) < 0.
  - E16: the second part of Proposition B.1 fails for polynomials, e.g. φ = 1 + s².
  - E17: Remark B.5's s(s−1)Λ trick fails over function fields.
  - Theorem 1.7 uses only GL₂ cuspidal L-functions and is unaffected.
- **E11 and E29 (missing degree hypotheses).**
  - E11: Corollary 3.3 fails at D = 0.
  - E29: Lemma 6.4 fails at d = 0.
  - Every use is in large degree.
- **Proof gaps, each with a short repair:**
  - E12: the proof of Theorem 1.7 gives only "≥ 0", and it applies B.2 to a possibly non-cuspidal π_{F′};
  - E19: the last step of Theorem 9.2;
  - E32: the rank of K in Lemma 6.11(1).
- **E31 and E34 (errors that affect nothing).**
  - E31: a "vector bundle" in Lemma 6.8 is only an open part of one.
  - E34: H^{4r}_c(Sht_G) is not one-dimensional.
- **The rest are misprints, among them:**
  - E10: the derivative in the definition of ℒ^{(r)} is taken at s = 0 instead of 1/2;
  - E26: [24] cited for [23];
  - E33: a codimension i printed for 2i;
  - E22 and E37: Z^r for Z′^r;
  - E23: a published-only misprint on p. 887.

**Items corrected in place:**
- **1, 2, 14.** The |ω_X| factor. Items 1 and 2 also gain their hypotheses and the measure normalizations, and item 2 its locator.
- **5, 9.** The corrected Kronecker limit formula (E9).
- **Descriptions of statements and moduli:**
  - item 3: the residue fields E_m;
  - item 8: Lemma 2.2;
  - item 10: N_d, A_d and ȷ_d;
  - item 11: Proposition 3.2(3) with its degree hypothesis;
  - item 18: M_d, Lemma 6.3, Lemma 6.4;
  - item 19: Lemma 6.7 and I_r(u, h_D);
  - item 20: Lemma 5.9 is used by Lemma 6.14, not proved by it;
  - item 23: the target of H_ℓ;
  - item 27: the proof of Proposition 8.5 uses stalk bounds, not smallness;
  - items 32, 33: Deligne–Mumford hypotheses.
- **Other additions and fixes:**
  - item 16: H′;
  - item 17: θ^μ is proper, not proven finite;
  - item 24: finiteness of V₀ and V′₀;
  - items 25 and 28: r even;
  - item 29: Z′^r;
  - items 36 and 37: E15–E18;
  - item 43: L(η, s) and the Riemann-hypothesis stages.
- **Locators.** Items 2, 16, 17, 19, 20, 22, 23, 24, 25, 27, 38 and 42.

**Prerequisites.** V. Lafforgue's entry now names Lemme 2.13, Construction 2.20 and Lemme 8.13. Laumon's entry now names (3.1).

**Part II brief.**
- The Kronecker test now expects 2^{r+1}.
- The Riemann hypothesis is imported from GS.6 and DWP.7.
- Theorem 1.7's test applies B.2 to L(π, s) and L(π⊗η, s).
- Theorem B.2, Proposition B.1 and Remark B.5 are stated in their corrected scope.
