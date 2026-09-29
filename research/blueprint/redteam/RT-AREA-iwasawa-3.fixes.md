# RT-AREA-iwasawa-3: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3966, job FIX-RT-AREA-iwasawa-3).
- Findings: `RT-AREA-iwasawa-3.result.json`, 8 findings (5 high, 3 medium), by `codex-hjdg0j`.
- Verdicts: `RT-AREA-iwasawa-3.review.json` and `research/blueprint/reviews/REV-RT-AREA-iwasawa-3.md`, by
  `cc-38267a`. All 8 are confirmed, several with additions to the fix.
- Everything below was checked at origin/main `93ebc401`. None of the files named has changed since the
  verification (24 September) except the GeneralizedHeegnerCycles packet, which is newer (see /1).

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is therefore an
exact edit, for the maintainer or for the blueprint jobs of these roadmaps:
- **Decompositions** (`data/decompositions/KatoEulerSystems.json`, `data/decompositions/GeneralizedHeegnerCycles.json`,
  both integrated on 16 September): the node id, the field, the old text quoted, and the new text.
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence quoted and its replacement.
- **Copies.** Three kinds of file repeat these texts:
  - the pre-integration packets `research/expansion/external/EXT-15/KatoEulerSystems.json` and
    `GeneralizedHeegnerCycles.json`, which carry the same node text;
  - the generated naming files `research/expansion/naming/planets-current.json` and `PLANETS-12.json`;
  - the atlas extracts `research/blueprint/atlas/roadmaps/*.json`, and the stage descriptions in `data/atlas.json`.

  The first kind take the same edits. The rest are regenerated from the corrected sources by the maintainer's
  pipeline; where a copy needs a hand edit, the section says so.

The node texts use the decompositions' plain ASCII notation (`Sym^{k-2}`, `ell`, `zeta_{p^n}`). Replacements keep it.

**The Kato source.** Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295
(2004), 117–290, numdam scan https://www.numdam.org/item/AST_2004__295__117_0.pdf, read 29 September 2026 (SHA-256
3c6e14b1…c605d, the hash the decomposition records). Printed page = PDF page + 115. Every Kato page cited below was
rendered and read as an image: printed pp. 124, 126, 182, 184, 185, 187, 188 and 221.

**Disclosure.** This session wrote neither the red team nor its verification, nor the two decompositions. It did
write checkpoints 1–2 of the GeneralizedHeegnerCycles blueprint packet (BP-GeneralizedHeegnerCycles--GH.0, #3934,
#3936). One node of that packet carries the hypothesis /1 corrects, so its edit is included here.

## Summary

| # | Finding | Fix |
|---|---|---|
| /1 | high, error | GH.0's X_r node: W_r's model over Z[1/N] (Conrad's appendix) is separated from X_r = W_r × A^r over F ⊇ H. Good reduction of A above p becomes a supplied hypothesis. BDP §3.2's assumptions (F unramified; smooth proper models over O_F) are exported to GH.1. There is a negative test (a quadratic twist of A) and a positive product-model test. The packet node has the same repair. |
| /2 | high, error | The Chern moment map: Sym^{k-2}(T_pE) ≅ Sym^{k-2}(H_p)(k−2). The excerpt is restored verbatim, and the twist check (2−r)+(k−2) = k−r gets k = 2 and k = 4 tests. |
| /3 | high, error | ℓ^{−r} (norm relation) and p^{−r} (reciprocity law) restored on the linear term. Lemma 8.8(1) corrected to n^{r′−1}, with a derivation check that Lemma 8.8 and Prop. 2.4 give exactly ℓ^{−r} and ℓ^{k−1−2r}. Thm 9.5's third case is recorded as printed, (p, N) = 1. |
| /4 | high, error | The dual exponential lands in the filtration step D^i_dR, not a graded piece, and D^i_dR = 0 for i ≥ k. Interior-degree and i = k tests. |
| /5 | high, error | Thm 12.5(1): twist by (ζ_{p^n})^{⊗(k−r)} on Iwasawa cohomology first, then specialise, localise and apply exp* with i = k − r. A target-type test at k = 2, r = 1. |
| /6 | medium, error | The Lemma 8.5 proof uses H⁰ of the unramified quotient, the Pontryagin dual and the direct limit under restriction. A μ_p regression test. |
| /7 | medium, error | Theta existence proof: pushforward a_*, not pullback a^*, fixes c²(0) − E[c]. The c = 5, a = 2 counter-check. |
| /8 | medium, missing | PS.2 owns P⁺, its Tate symbol L, P = P⁺[L⁻¹] and ev(L) = 2πi. The comparison is stated as Huber–Müller-Stach do (effective case, then localise). MC.5 exports the localised Nori diagram. |

## /1 (high, error): GH.0 separates the model of W_r over Z[1/N] from X_r, and makes good reduction of A a supplied hypothesis

### What the verifier corrected
- **The claim is the source's own wording, but it is unsupported.** BDP's introduction (p. 1035) says that X_r "admits a proper smooth model over Spec Z[1/N]". The paper's definitions do not support it:
  - §2.2 (p. 1060) defines X_r := W_r × A^r over a field F ⊃ H;
  - A is a CM curve over the Hilbert class field H (§1.4), with no reduction condition;
  - the appendix (pp. 1139–1144) constructs only the compactified Kuga–Sato factor W_r over Z[1/N] and never mentions A or X_r;
  - §3.2 (p. 1067) applies Faltings' comparison under two explicit assumptions: (1) F finite unramified over Q_p, and (2) C and X_r have smooth proper models over O_F.
- **Neither p ∤ N nor p ∤ cNd_K certifies good reduction.** A quadratic twist of A by a character of G_H ramified at a good prime keeps CM by O_K over H but has additive reduction there. H¹(A) is a Künneth summand of H¹(X_r) for r ≥ 1. The verifier's example: K = Q(i), N = 5, p = 13, y² = x³ − 169x. The 13-twist also satisfies p ∤ cNd_K.
- **Correct every occurrence:** the node's title, statement, hypotheses 2–3, proof steps 2–3, acceptance 2, the p. 1035 `match` line, the GH.0 → GH.1 link reason, the GH.0 review verdict and note, the packet summary and the GH.0 coverage record.
- **Make good reduction of A above p an explicit supplied hypothesis:** A extends to an elliptic scheme over O_F. Record p ∤ cNd_K only as BDP's application condition for their chosen A.
- **Keep the appendix attribution for W_r over Z[1/N]**, and form W_r ⊗ O_F × 𝒜^r from the supplied model.
- **Cite p. 1040's hypotheses beside §3.2's.**
- **From the red team's fix:** do not claim that unramifiedness is necessary for every possible Bloch–Kato containment theorem.

### State on main (93ebc401)
- **The decomposition is unchanged** since 16 September. Node `GeneralizedHeegnerCycles:GH.0/the-variety-X-r-and-its-smooth-proper-model` still says "As shown in the appendix of Bertolini-Darmon-Prasanna (by Brian Conrad), X_r admits a PROPER SMOOTH MODEL over Spec Z[1/N]". Its hypothesis 2 reads "p does not divide N; this is what makes the good-reduction/smooth-proper statement available and what places the Abel-Jacobi image in H^1_f". The review (`review.checked`) marks it "verified".
- **The newer packet** `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json` (29 September, this session's) does not repeat the Z[1/N] claim for X_r.
  - Its node `GH.0/generalized-kuga-sato-variety-and-its-projector` works over F ⊇ H in characteristic 0 and says "The integral model over ℤ[1/N] (Conrad's appendix) is not used here".
  - But its node `GH.1/p-adic-abel-jacobi-map` has hypothesis "F unramified over ℚ_p with good reduction of C and X_r (p ∤ cNd_K)". That makes p ∤ cNd_K read as a certificate, which is the error.
- **Read at the source** (BDP, Duke 162 (2013), published version https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf, SHA-256 223bfdad…8fbc; printed page = PDF page + 1032; all pages below rendered as images):
  - p. 1060, §2.2: "Recall that A is the elliptic curve with complex multiplication by O_K that was fixed in Section 1.4, defined over the Hilbert class field H of K. Fix a field F ⊃ H, and, for each r ≥ 0, consider the (2r+1)-dimensional variety over F given by X_r := W_r × A^r."
  - p. 1067, §3.2: "We will make the following assumptions on F, which are satisfied in our application. (1) The extension F is a finite unramified extension of Q_p. (2) The varieties C and X_r over F extend to smooth proper models 𝒞 and 𝒳_r over O_F. If φ belongs to Isog_c^𝔑(A) and p does not divide cNd_K, then the field F can be taken to be the p-adic completion of the compositum of H̃ … with H_c".
  - p. 1040: "If 𝔭 is a prime of F_φ above p and if p does not divide the level of Γ, the discriminant of K, or the degree of φ, then the natural image res_𝔭(κ_φ) … belongs to the subgroup H¹_f(F_{φ,𝔭}, V_{f,χ})".
  - p. 1140, appendix: "let X be a modular curve over Z[1/N] classifying a rigid fiberwise ample level-N structure on generalized elliptic curves … equipped with a universal generalized elliptic curve E → X". The appendix is about fibre powers of E over X; A does not occur.
  - p. 1054, §1.5, views A and A′ over O_{C_p} "by fixing a good integral model". That is a model over O_{C_p}, not over O_F for F unramified over Q_p.

### Fix

**`data/decompositions/GeneralizedHeegnerCycles.json`, node `GeneralizedHeegnerCycles:GH.0/the-variety-X-r-and-its-smooth-proper-model`.**

1. **`title`.** Old: "The variety X_r = W_r x A^r fibred over the modular curve, and its model over Z[1/N]". New: "The variety X_r = W_r x A^r over F containing H, the model of W_r over Z[1/N], and the data for H^1_f".
2. **`statement`.** Replace the whole text with:
   > Fix an imaginary quadratic field K and a CM elliptic curve A with complex multiplication by the full ring of integers O_K, defined over the Hilbert class field H of K (BDP 1.4). Replace the (2r)-dimensional Kuga-Sato variety W_{2r} by the (2r+1)-dimensional variety X_r = W_r x A^r over a field F containing H (BDP 2.2), where W_r is the r-th desingularised fibre power of the universal generalized elliptic curve over the modular curve C. Like W_{2r}, the variety X_r is fibred over C and carries an infinite collection of special cycles defined over abelian extensions of K. The appendix of Bertolini-Darmon-Prasanna (by Brian Conrad) constructs a proper smooth model of the Kuga-Sato factor W_r over Spec Z[1/N]; it does not treat A or X_r. For a prime p not dividing N and a finite unramified extension F of Q_p over which A_F extends to an elliptic scheme A' over O_F (a SUPPLIED hypothesis: good reduction of A above p), the product (W_r tensor O_F) x A'^r is a proper smooth model of X_r over O_F. Under BDP's two assumptions of Sec. 3.2 -- (1) F finite unramified over Q_p, (2) C and X_r extend to smooth proper models over O_F -- the image of the etale Abel-Jacobi map AJ^et_F lies in the Bloch-Kato subspace H^1_f, and the comparison theorems turn it into the p-adic Abel-Jacobi map. BDP state that both assumptions hold in their application, for phi in Isog_c^{frak N}(A) and p not dividing c*N*d_K, with F the p-adic completion of the compositum of H-tilde and H_c (p. 1067); p not dividing c*N*d_K is that application's condition for their A, not a certificate of good reduction for an arbitrary A.
3. **`hypotheses[1]`.** Old: "p does not divide N; this is what makes the good-reduction/smooth-proper statement available and what places the Abel-Jacobi image in H^1_f". New:
   > p does not divide N gives the model of W_r over Z_p (appendix). Good reduction of A above p -- A_F extends to an elliptic scheme over O_F -- is a separate supplied hypothesis, and so is the unramifiedness of F over Q_p (BDP Sec. 3.2 (1)-(2)). Neither p not dividing N nor p not dividing c*N*d_K certifies good reduction of A: a quadratic twist of A by a character of Gal(Hbar/H) ramified at a prime above p keeps CM by O_K over H but has additive reduction there, and H^1(A) is a Kunneth summand of H^1(X_r) for r >= 1.
4. **`hypotheses[2]`.** Old: "…the smooth proper model of the appendix is for X_r, not for a naive fibre product". New: "…the smooth proper model of the appendix is for W_r (the desingularised fibre power), not for a naive fibre product and not for X_r".
5. **`hypotheses`: append.**
   > BDP's introduction (p. 1040) states the H^1_f property of res_p(kappa_phi) for p prime to the level of Gamma, to the discriminant of K and to the degree of phi; Sec. 3.2 (p. 1067) states the assumptions (1)-(2) under which the comparison is made. Both are recorded; this node does not claim that unramifiedness is necessary for every Bloch-Kato containment theorem.
6. **`proofSteps[1]`.** Old: "The appendix constructs a proper smooth model of X_r over Spec Z[1/N]." New:
   > The appendix constructs a proper smooth model of W_r over Spec Z[1/N]. For F finite unramified over Q_p and A_F extending to an elliptic scheme A' over O_F (supplied), form (W_r tensor O_F) x A'^r, a proper smooth model of X_r over O_F.
7. **`proofSteps[2]`.** Prefix with "Under BDP's assumptions (1)-(2) of Sec. 3.2, ".
8. **`acceptance[1]`.** Old: "Check that the Bloch-Kato containment is a CONSEQUENCE of the smooth proper model over Z[1/N] and not an assumption." New:
   > Check that the Bloch-Kato containment is derived here from a smooth proper model of X_r over O_F with F unramified (BDP Sec. 3.2), which needs the supplied good reduction of A above p, and not from p not dividing N or p not dividing c*N*d_K alone.
9. **`acceptance`: append two tests.**
   > Negative test: K = Q(i), N = 5, p = 13, and A the quadratic twist y^2 = x^3 - 169x of y^2 = x^3 - x. It has CM by Z[i] over H = K, and p = 13 divides neither N nor d_K (and c can be taken prime to 13), but A has additive reduction above 13; the node must not certify a smooth proper model of X_r over O_F for r >= 1 from those divisibility conditions.

   > Positive test: with A' an elliptic scheme over O_F extending A_F (supplied) and F unramified over Q_p, (W_r tensor O_F) x A'^r is proper and smooth over O_F.
10. **`sources[1].match`.** Old: "Gives the smooth proper model, the Bloch-Kato consequence, and the passage from the etale to the p-adic Abel-Jacobi map." New:
    > Records the introduction's wording. It does not discharge the technical hypotheses: Sec. 2.2 defines X_r over a field F containing H, the appendix treats only W_r, and Sec. 3.2 states the assumptions (1)-(2) actually used (see the added sources).
11. **`sources`: append four entries** (sourceId `bertolini-darmon-prasanna-generalized-heegner`):
    - locator "Sec. 2.2, printed p. 1060", excerpt "Fix a field F ⊃ H, and, for each r ≥ 0, consider the (2r+1)-dimensional variety over F given by X_r := W_r × A^r.", match "X_r is defined over a field F containing H".
    - locator "Sec. 3.2, printed p. 1067", excerpt "(1) The extension F is a finite unramified extension of Q_p. (2) The varieties C and X_r over F extend to smooth proper models 𝒞 and 𝒳_r over O_F.", match "the assumptions under which the comparison is made".
    - locator "Sec. 0, Euler systems, printed p. 1040", excerpt "if p does not divide the level of Γ, the discriminant of K, or the degree of φ, then the natural image res_𝔭(κ_φ) … belongs to the subgroup H¹_f", match "the introduction's own H^1_f hypotheses".
    - locator "Appendix, printed p. 1140", excerpt "let X be a modular curve over Z[1/N] … equipped with a universal generalized elliptic curve E → X", match "the appendix constructs models of fibre powers of E over X, i.e. of W_r, not of X_r".

**The same file, elsewhere.**
12. **`links[0].reason`** (GH.0 → GH.1). Replace "…uses the smooth proper model over Z[1/N] and the p-adic comparison theorems, both of which belong to GH.0." with:
    > …uses, for F finite unramified over Q_p, smooth proper models of C and X_r over O_F (BDP Sec. 3.2 (1)-(2); the model of X_r needs the supplied good reduction of A above p) and the p-adic comparison theorems, both of which belong to GH.0. GH.1 carries these data, and BDP's application condition p not dividing c*N*d_K, into its statements.
13. **`summary`.** Replace "the variety X_r = W_r x A^r with its proper smooth model over Z[1/N] and the resulting Bloch-Kato containment" with "the variety X_r = W_r x A^r over F containing H, the proper smooth model over Z[1/N] of its Kuga-Sato factor W_r, and the Bloch-Kato containment under BDP's Sec. 3.2 assumptions (F unramified over Q_p, smooth proper models over O_F, which need good reduction of A above p)".
14. **`coverage`, GH.0, `remaining[2]`.** Old: "The appendix on Kuga-Sato schemes (printed pp. 1139-1143) was not read; it is the source of the smooth proper model over Z[1/N] used in this packet's statement." New: "The appendix on Kuga-Sato schemes (printed pp. 1139-1144) constructs only the Kuga-Sato factor W_r over Z[1/N] (read in REV-RT-AREA-iwasawa-3); its etale-local blowup computations were not decomposed."
15. **`review.checked`, the entry for this node.** `verdict` "verified" → "corrected". Set `note` to "Corrected after RT-AREA-iwasawa-3/1: the introduction's 'proper smooth model over Spec Z[1/N]' is quoted correctly but is not what the paper proves. The appendix builds W_r over Z[1/N]; X_r is defined over F containing H; the comparison of Sec. 3.2 assumes F unramified and smooth proper models over O_F. Good reduction of A above p is now a supplied hypothesis."

**`research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`** (this session's packet; for its next checkpoint).
16. **Node `GeneralizedHeegnerCycles:GH.1/p-adic-abel-jacobi-map`, `hypotheses[0]`.** Old: "F unramified over ℚ_p with good reduction of C and X_r (p ∤ cNd_K). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5–R06.6." New:
    > F unramified over ℚ_p, and C and X_r with smooth proper models over O_F (BDP §3.2, assumptions (1)–(2), p. 1067). For X_r this needs good reduction of A above p, supplied as an elliptic scheme over O_F; the model is then (W_r ⊗ O_F) × 𝒜^r. p ∤ cNd_K is BDP's application condition for their A; it does not certify good reduction of an arbitrary A (a quadratic twist of A ramified above p keeps CM by O_K and has additive reduction). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5–R06.6.
17. **Same node, `statement`.** Replace "(for (φ, A′) ∈ Isog_c^N(A) with p ∤ cNd_K, the completion of H̃·H_c at a place above p)" with "(BDP's application: for (φ, A′) ∈ Isog_c^N(A) with p ∤ cNd_K, the completion of H̃·H_c at a place above p, with A having good reduction there)".

**Copies.** `research/expansion/external/EXT-15/GeneralizedHeegnerCycles.json` takes edits 1–15.

### Not done, and why
- **The packet node for X_r** (`GH.0/generalized-kuga-sato-variety-and-its-projector`) needs no change: it already works over F ⊇ H in characteristic 0 and does not use the Z[1/N] model.
- **Whether X_r admits a model over O_F** when A has only potentially good reduction above p is not decided here; the fix only requires that it be supplied, not inferred.

## /2 (high, error): the Chern moment map carries Sym^{k-2}(T_pE) ≅ Sym^{k-2}(H_p)(k−2)

### What the verifier corrected
- **Kato, printed p. 182:** "(8.4.1) T_pE ≅ H¹_p(1) … induces (8.4.2) Sym^{k−2}(H¹_p) ≅ (Sym^{k−2}(T_pE))(2 − k)". The composite (8.4.3) goes from Sym^{k−2}(T_pE/pⁿ)(2 − r) to Sym^{k−2}(H¹_p)/pⁿ(k − r).
- **The node writes** Sym^{k−2}(T_pE) = Sym^{k−2}(H_p)(2 − k), which contradicts its own T = H(1) unless k = 2. Applied after step (ii) it gives twist 4 − k − r instead of k − r; at k = 4, r = 1, −1 instead of 3. A weight-two test hides the error.
- **Fix:** Sym(T) ≅ Sym(H)(k − 2), or Kato's orientation. The occurrences are:
  - the statement step (iii), `proofSteps[2]`, and the `sources[2]` excerpt, which misquotes Kato and is restored verbatim;
  - reword `hypotheses[2]`, `sources[2].match` and `review.checked[7]`;
  - the EXT-15 and generated copies.

### State on main (93ebc401)
Unchanged since 16 September. The page was read again for this fix (printed p. 182, as an image). It confirms the verifier's quotation.

### Fix (`data/decompositions/KatoEulerSystems.json`, node `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`)
1. **`statement`, step (iii).** Old: "(iii) the isomorphism Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(2-k) induced by the Poincare duality isomorphism T_pE = H_p(1);" New: "(iii) the isomorphism Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2), i.e. Kato's (8.4.2) Sym^{k-2}(H_p) = (Sym^{k-2}(T_pE))(2-k) read from right to left, induced by the Poincare duality isomorphism T_pE = H_p(1);"
2. **`hypotheses[2]`.** Old: "the identification T_pE = H_p(1) is Poincare duality for the universal curve, which is where the Tate twist (2-k) in step (iii) originates: the twists are dictated by the source degree of the regulator and are not free choices". New:
   > the identification T_pE = H_p(1) is Poincare duality for the universal curve; it gives Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2), so the class of twist (2-r) produced by step (ii) lands in Sym^{k-2}(H_p)(k-r) after step (iii). The twists are dictated by the source degree of the regulator and are not free choices
3. **`proofSteps[2]`.** Old: "Transport along Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(2-k) and push down by the trace along Y(M*p^n,N*p^n) -> Y(M,N)." New: "Transport along Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2), which moves the twist from (2-r) to (k-r), and push down by the trace along Y(M*p^n,N*p^n) -> Y(M,N)."
4. **`acceptance[0]`.** Old: "Check that steps (ii) and (iii) together produce exactly the twist (k-r) recorded in the target, and not (k-r') or (2-r)." New:
   > Check that steps (ii) and (iii) together produce exactly the twist (k-r) recorded in the target, and not (k-r'), (2-r) or (4-k-r): step (ii) gives (2-r) and step (iii) adds (k-2), so (2-r)+(k-2) = k-r. Test k = 2, r = 1 (twist 1) and k = 4, r = 1 (twist 3; the wrong orientation gives -1). A weight-two test alone does not detect the orientation.
5. **`sources[2].excerpt`.** Old: "Poincare duality gives a canonical isomorphism (8.4.1) TpE = H_p(1) where (1) means the Tate twist, and this induces (8.4.2) Sym^{k-2}(TpE) = Sym^{k-2}(H_p)(2-k)." New (verbatim): "Poincare duality gives a canonical isomorphism (8.4.1) TpE = H^1_p(1) where (1) means the Tate twist, and this induces (8.4.2) Sym^{k-2}_{Zp}(H^1_p) = (Sym^{k-2}_{Zp}(TpE))(2 - k)."
6. **`sources[2].match`.** New: "Gives the Poincare duality isomorphism and (8.4.2) in Kato's orientation; read from right to left it is Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(k-2), the form used in step (iii)."
7. **`review.checked[7]`.** `verdict` → "corrected". In `note`, replace "the Poincare duality isomorphisms (8.4.1)-(8.4.2) giving the twist (2-k)" with "the Poincare duality isomorphisms (8.4.1)-(8.4.2); corrected after RT-AREA-iwasawa-3/2, since the node had reversed (8.4.2) without reversing the twist".

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–6. The naming files are regenerated.

### Not done, and why
- Nothing else. The Hochschild–Serre and trace steps are unaffected.

## /3 (high, error): ℓ^{−r} and p^{−r} restored on the linear Euler term, and Lemma 8.8(1) is n^{r′−1}

### What the verifier corrected
- **Prop. 8.7(2)** (printed p. 184) prints (1 − T′(ℓ)(1/ℓ,1)*·ℓ^{−r} + (1/ℓ,1/ℓ)*·ℓ^{k−1−2r}), and ℓ^{−r} also appears in the two-term case. **Thm 9.5** (p. 188) prints the same with p^{−r} in both nontrivial cases.
- **The nodes omit them**, and so do their "verbatim" excerpts, review notes and `links[3]`. The sibling node L2/euler-system-datum-for-the-modular-lattice already records 1 − ā_ℓ ℓ^{−r}σ⁻¹ + …, which contradicts the norm node.
- **The declared normalization is itself misrecorded.** L1/hecke-and-diamond-equivariance-of-the-moment-map records Lemma 8.8(1) as n^{r−1}, and so do its excerpt, `links[3]` and `review.checked[8]`. Kato prints n^{r′−1}.
- **Add a derivation check** that Lemma 8.8 and Prop. 2.4 give exactly ℓ^{−r} and ℓ^{k−1−2r}.
- **Minor:** Thm 9.5's third case is printed "(p, N) = 1", not "(p, MN) = 1".
- Correct the EXT-15 and generated copies too.

### State on main (93ebc401)
Unchanged since 16 September. Read again for this fix, as images:
- **p. 126, Prop. 2.4:** the norm sends c,dz_{Mℓ,Nℓ} to (1 − T′(ℓ)(1/ℓ 0; 0 1)* + (1/ℓ 0; 0 1/ℓ)*·ℓ)·c,dz_{M,N} if ℓ ∤ N, and to (1 − T′(ℓ)(1/ℓ 0; 0 1)*)·c,dz_{M,N} if ℓ | N.
- **p. 184, Prop. 8.7(2):** (1 − T′(ℓ)(1/ℓ 0; 0 1)*·ℓ^{−r} + (1/ℓ 0; 0 1/ℓ)*·ℓ^{k−1−2r}) if ℓ ∤ N, and (1 − T′(ℓ)(1/ℓ 0; 0 1)*·ℓ^{−r}) if ℓ | N.
- **p. 185, Lemma 8.8:**
  - (1) T′(n) ∘ Ch = n^{r′−1} Ch ∘ T′(n) for n prime to Mp;
  - (2) (a 0; 0 b)* ∘ Ch = a^{r′−1} b^{k−r′−1} (ab)^{−r} Ch ∘ (a 0; 0 b)*.
- **p. 188, Thm 9.5:** the three cases are "if p divides M", "if (p, M) = 1 and p | N" and "if (p, N) = 1", with p^{−r} on the linear term of the last two.

**The derivation check, done here.** Lemma 8.8 moves each operator across Ch.
- **Linear term.** Lemma 8.8(1) gives Ch ∘ T′(ℓ) = ℓ^{−(r′−1)} T′(ℓ) ∘ Ch. Lemma 8.8(2), with a = ℓ^{−1} (in Z_p^×) and b = 1, gives Ch ∘ (1/ℓ,1)* = ℓ^{(r′−1)−r} (1/ℓ,1)* ∘ Ch. So Ch ∘ T′(ℓ)(1/ℓ,1)* = ℓ^{−r} T′(ℓ)(1/ℓ,1)* ∘ Ch.
- **Quadratic term.** Lemma 8.8(2) with a = b = ℓ^{−1} gives Ch ∘ (1/ℓ,1/ℓ)* = ℓ^{(r′−1)+(k−r′−1)−2r} (1/ℓ,1/ℓ)* ∘ Ch = ℓ^{k−2−2r} (1/ℓ,1/ℓ)* ∘ Ch. With Prop. 2.4's factor ℓ, the term is ℓ^{k−1−2r}.

This is exactly Prop. 8.7(2). With the misrecorded n^{r−1}, the linear term would be ℓ^{r′−2r}, which depends on r′.

### Fix (`data/decompositions/KatoEulerSystems.json`)

**Node `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`.**
1. **`statement`.** Replace "T'(n) o Ch_{M,N}(k,r,r') = n^{r-1} * Ch_{M,N}(k,r,r') o T'(n)" with "T'(n) o Ch_{M,N}(k,r,r') = n^{r'-1} * Ch_{M,N}(k,r,r') o T'(n)".
2. **`sources[0].excerpt`.** Replace "= n^{r-1} ChM,N(k,r,r') o T'(n)" with "= n^{r'-1} ChM,N(k,r,r') o T'(n)".
3. **`acceptance`: append.**
   > Derivation check: moving the operators of Prop. 2.4 across Ch with (1) and (2) (a = ell^{-1}, b = 1, resp. a = b = ell^{-1}) must give exactly ell^{-r} on T'(ell)<1/ell,1>^* and ell^{k-2-2r}, times Prop. 2.4's factor ell, i.e. ell^{k-1-2r}, on <1/ell,1/ell>^*. With the exponent n^{r-1} the linear factor would be ell^{r'-2r}, which is wrong.
4. **`review.checked[8]`.** `verdict` → "corrected". `note`: "Lemma 8.8(1)(2) with the scalars n^{r'-1} (corrected after RT-AREA-iwasawa-3/3: the node had n^{r-1}) and a^{r'-1} b^{k-r'-1} (ab)^{-r}, the coprimality conditions, and Kato's remark that the lemma 'is proved easily'."

**Node `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`.**
5. **`statement`, relation (2).** Replace "the three-term operator 1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* ell^{k-1-2r} when ell does not divide N, and the two-term operator 1 - T'(ell)<1/ell,1>^* when ell divides N." with "the three-term operator 1 - T'(ell)<1/ell,1>^* ell^{-r} + <1/ell,1/ell>^* ell^{k-1-2r} when ell does not divide N, and the two-term operator 1 - T'(ell)<1/ell,1>^* ell^{-r} when ell divides N."
6. **`proofSteps[3]`.** Replace "producing the explicit power ell^{k-1-2r}." with "producing ell^{-r} on the linear term and ell^{k-1-2r} on the quadratic term (see the derivation check in the Lemma 8.8 node)."
7. **`acceptance`: append.**
   > Check the linear term's scalar ell^{-r} in both the ell | N and the ell not dividing N case, and test r = 1 at k = 2, where the missing factor would be 1/ell. Compare with the sibling node L2/euler-system-datum-for-the-modular-lattice, which records 1 - abar_ell ell^{-r} sigma_ell^{-1} + ... .
8. **`sources[2].excerpt`** (restored verbatim): "Let ell be a prime number which is prime to Mpcd. Then the norm map ... sends c,d z^{(p)}_{M ell,N ell}(k,r,r') to (1 - T'(ell)( 1/ell 0 ; 0 1 )* . ell^{-r} + ( 1/ell 0 ; 0 1/ell )* . ell^{k-1-2r}) . c,d z^{(p)}_{M,N}(k, r, r') in the case ell does not divide N, and to (1 - T'(ell)( 1/ell 0 ; 0 1 )* . ell^{-r}) . c,d z^{(p)}_{M,N}(k,r,r') in the case ell divides N."
9. **`review.checked[10]`.** `verdict` → "corrected". In `note`, replace "and the exponent ell^{k-1-2r} in the quadratic term" with "the exponent ell^{k-1-2r} in the quadratic term and the scalar ell^{-r} on the linear term (restored after RT-AREA-iwasawa-3/3)".

**Node `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`.**
10. **`statement`.** Replace "(1 - T'(p)<1/p,1>^*) c,d-z_{M,N}(k,r,r') if (p,M) = 1 and p divides N; and (1 - T'(p)<1/p,1>^* + <1/p,1/p>^* p^{k-1-2r}) c,d-z_{M,N}(k,r,r') if (p,M*N) = 1." with "(1 - T'(p)<1/p,1>^* p^{-r}) c,d-z_{M,N}(k,r,r') if (p,M) = 1 and p divides N; and (1 - T'(p)<1/p,1>^* p^{-r} + <1/p,1/p>^* p^{k-1-2r}) c,d-z_{M,N}(k,r,r') if (p,N) = 1 (as printed; since prime(M) is contained in prime(N), this is the same as (p,M*N) = 1)."
11. **`hypotheses[3]`.** Append: "; the linear term carries p^{-r}, as ell^{-r} in Prop. 8.7(2)".
12. **`sources[0].excerpt`** (restored verbatim for the last two cases): "(1 - T'(p)( 1/p 0 ; 0 1 )* . p^{-r}) c,d z_{M,N}(k,r,r') if (p,M) = 1 and p | N, (1 - T'(p)( 1/p 0 ; 0 1 )* . p^{-r} + ( 1/p 0 ; 0 1/p )* . p^{k-1-2r}) c,d z_{M,N}(k,r,r') if (p,N) = 1."
13. **`review.checked[14]`.** `verdict` → "corrected". In `note`, replace "all three p-Euler-factor cases with p^{k-1-2r}" with "all three p-Euler-factor cases with p^{-r} on the linear term and p^{k-1-2r} on the quadratic term (p^{-r} and the printed condition (p,N) = 1 restored after RT-AREA-iwasawa-3/3)".

**Links.**
14. **`links[3].reason`.** Replace "its scalars n^{r-1} and a^{r'-1} b^{k-r'-1} (ab)^{-r} produce the twisted operator 1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* ell^{k-1-2r} from the untwisted operator of Prop. 2.4." with "its scalars n^{r'-1} and a^{r'-1} b^{k-r'-1} (ab)^{-r} produce the twisted operator 1 - T'(ell)<1/ell,1>^* ell^{-r} + <1/ell,1/ell>^* ell^{k-1-2r} from the operator 1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* ell of Prop. 2.4."

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–3, 5–8 and 10–12. The naming files are regenerated: `planets-current.json` and `PLANETS-12.json` each carry the n^{r−1} text once.

### Not done, and why
- The Euler-system datum node (L2/euler-system-datum-for-the-modular-lattice) is already right and is not changed.

## /4 (high, error): the dual exponential lands in the filtration step D^i_dR, and D^i_dR = 0 for i ≥ k

### What the verifier corrected
- **§9.2** (printed p. 187) defines a descending filtration D^i_dR(V) = H⁰(K, B^i_dR ⊗ V). **(9.2.2)** reads "D^i_dR(V) = D_dR(V) for i ≤ 0, D^i_dR(V) = 0 for i ≥ k, D^i_dR(V) = M_k(X) ⊗ Q_p for 1 ≤ i ≤ k−1". **§9.4** (p. 188): "D⁰_dR(V_{k,Q_p}(Y)(i)) = D^i_dR(V_{k,Q_p}(Y)) = M_k(X) ⊗ Q_p".
- **The node** calls this "the graded piece in degrees 1 ≤ i ≤ k−1" and writes "D^i = 0 for i > k". Its excerpt misquotes the endpoint.
- **This is a wrong target type, not wording.** The filtration is constant on 1 ≤ i ≤ k−1, so gr^i = 0 for 1 ≤ i ≤ k−2. For k ≥ 3 the stated target is zero at every r ≥ 2 (e.g. k = 3, r = 2).
- **The complete edit list:**
  - the statement (the phrase and the endpoint), `hypotheses[2]`, `acceptance[0]` and `[1]` (the target is the filtration step S(f) ⊗ F_λ);
  - `sources[1].excerpt` ("i ≥ k");
  - the reciprocity node's `acceptance[2]`, `review.checked[13]`, and the EXT-15 and generated copies.
- **Add** an interior-degree F^i-versus-gr^i test and an i = k test.

### State on main (93ebc401)
Unchanged. Pages 187–188 were read again as images and match the verifier's quotations.

### Fix (`data/decompositions/KatoEulerSystems.json`)

**Node `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`.**
1. **`statement`.** Replace "D^i_dR(V) = 0 for i > k, and the graded piece in degrees 1 <= i <= k-1 identified with M_k(X) tensor Q_p for X a smooth compactification of Y." with "D^i_dR(V) = 0 for i >= k, and the filtration step D^i_dR(V) = M_k(X) tensor Q_p for every 1 <= i <= k-1, for X a smooth compactification of Y (so the filtration is constant on 1 <= i <= k-1 and gr^i = 0 for 1 <= i <= k-2)."
2. **`hypotheses[2]`.** Old: "1 <= i <= k-1 is required for the target to be M_k(X) tensor Q_p; outside that range the graded piece is 0 or the whole of D_dR". New: "1 <= i <= k-1 is required for the target D^0_dR(V(i)) = D^i_dR(V) to be M_k(X) tensor Q_p; outside that range the filtration step is 0 (i >= k) or the whole of D_dR (i <= 0)".
3. **`acceptance[0]`.** Old: "Check the direction of the filtration shift under the Tate twist, so that the target really is M_k(X) tensor Q_p and not a different graded piece." New: "Check the direction of the filtration shift under the Tate twist, so that the target is the filtration step D^0_dR(V(i)) = D^i_dR(V) = M_k(X) tensor Q_p, not a graded piece gr^i."
4. **`acceptance[1]`.** Old: "Check that D^i_dR(V_{F_lambda}(f)) = S(f) tensor_F F_lambda for 1 <= i <= k-1, i.e. that the eigenform quotient has a one-dimensional relevant graded piece." New: "Check that D^i_dR(V_{F_lambda}(f)) = S(f) tensor_F F_lambda for 1 <= i <= k-1, i.e. that the relevant filtration step of the eigenform quotient is the one-dimensional S(f) tensor_F F_lambda."
5. **`acceptance`: append two tests.**
   > Interior degree: for k = 4 and i = 2, the target D^2_dR(V) = M_4(X) tensor Q_p is nonzero while gr^2 = D^2_dR/D^3_dR = 0; a formalisation that uses gr^i gets the zero target.

   > Endpoint: for i = k, D^k_dR(V) = 0 (the printed condition is i >= k, not i > k), so exp^* on H^1(Q_p, V(k)) has zero target.
6. **`sources[1].excerpt`.** Replace "D^i_dR(V) = 0 for i > k" with "D^i_dR(V) = 0 for i >= k".
7. **`review.checked[13]`.** `verdict` → "corrected". Append to `note`: "Corrected after RT-AREA-iwasawa-3/4: the node called the target a graded piece and printed the endpoint as i > k; (9.2.2) has the filtration step and i >= k."

**Node `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`.**
8. **`acceptance[2]`.** Replace "i.e. the image in the degree-(k-r) graded piece" with "i.e. the image in the filtration step D^0_dR(V(k-r)) = D^{k-r}_dR(V)".

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–6 and 8.

### Not done, and why
- Nothing else.

## /5 (high, error): Thm 12.5(1) twists by (ζ_{p^n})^{⊗(k−r)} on Iwasawa cohomology before specialising

### What the verifier corrected
- **Thm 12.5(1)** (printed p. 221) reads: "H¹(V_{F_λ}(f)) ≃ H¹(V_{F_λ}(f)(k−r)) → H¹(Q_p(ζ_{p^n}), V_{F_λ}(f)(k−r)) —exp*→ S(f) ⊗ … (the first isomorphism is the product with (ζ_{p^n})^{⊗(k−r)}_{n≥1})".
- **The node** restricts first and then multiplies by the roots of unity to the power −r. Its own excerpt is correct, so the statement contradicts it.
- **This is also a type error.** By §9.4, F⁰D_dR(V_f(−r)) = D_dR(V_f) is the whole 2-dimensional space, not S(f) ⊗ F_λ. Only i = k − r lies in the range 1 ≤ i ≤ k − 1 where exp*_f lands in S(f), consistent with Thm 9.5.
- **The twist cannot be applied after restriction** at level n, because H¹(Q_p(ζ_{p^n}), V) and H¹(Q_p(ζ_{p^n}), V(j)) differ for j ≠ 0.
- **Fix:** twist on Iwasawa cohomology by ∪(ζ_{p^n})^{⊗(k−r)} (Λ-semilinear), then specialise, localise and apply exp*_f with i = k − r.
- **The target-type test** should check that F⁰D_dR(V_f(k−r)) is 1-dimensional at k = 2, r = 1, while F⁰D_dR(V_f(−r)) is 2-dimensional.
- **Also:** update the review note, and clean up the stale L3 coverage remark that Thm 12.5(1)'s constant "was not transcribed".

### State on main (93ebc401)
Unchanged. Page 221 was read again as an image and matches.

### Fix (`data/decompositions/KatoEulerSystems.json`, node `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`)
1. **`statement`.** Replace "the image of z_gamma^{(p)} under the composite (restrict to Q(zeta_{p^n}) tensor Q_p; multiply by (zeta_{p^n})_n^{(-r)}; apply exp^*) lies in S(f) tensor_Q Q(zeta_{p^n})" with:
   > the image of z_gamma^{(p)} under the composite H^1(V_{F_lambda}(f)) = H^1(V_{F_lambda}(f)(k-r)) -> H^1(Q_p(zeta_{p^n}), V_{F_lambda}(f)(k-r)) --exp^*--> S(f) tensor_F F_lambda tensor_Q Q(zeta_{p^n}) lies in S(f) tensor_Q Q(zeta_{p^n}). Here the first isomorphism is the product with (zeta_{p^n})^{tensor(k-r)}_{n>=1} on the Iwasawa cohomology H^1 = lim_n H^1(Z[zeta_{p^n},1/p], -), which is Lambda-semilinear (it twists the Lambda-action by the (k-r)-th power of the cyclotomic character); the second is specialisation to level n followed by localisation at p; and exp^* is (9.4.1) for the eigenform quotient with i = k-r
2. **`hypotheses`: append.**
   > the twist by (zeta_{p^n})^{tensor(k-r)} is made on Iwasawa cohomology before specialisation; it cannot be made after restriction to level n, since H^1(Q_p(zeta_{p^n}), V) and H^1(Q_p(zeta_{p^n}), V(j)) differ for j != 0. Only i = k-r, in the range 1 <= i <= k-1, puts the target of exp^*_f in S(f) tensor_F F_lambda
3. **`acceptance`: append.**
   > Target type at k = 2, r = 1: F^0 D_dR(V_f(k-r)) = F^0 D_dR(V_f(1)) is one-dimensional (S(f) tensor_F F_lambda), while F^0 D_dR(V_f(-r)) = F^0 D_dR(V_f(-1)) = D_dR(V_f) is two-dimensional. A composite that multiplies by roots of unity to the power -r after restriction lands in the wrong space.
4. **`review.checked[15]`.** Append to `note`: "Corrected again after RT-AREA-iwasawa-3/5: the statement now twists by (zeta_{p^n})^{tensor(k-r)} on Iwasawa cohomology before specialisation, as the excerpt already said, instead of multiplying by (zeta_{p^n})^{(-r)} after restriction."
5. **`coverage`, KatoEulerSystems:L3, `remaining[3]`.** Delete "The exact constant in Thm. 12.5(1) (including the power of 2 pi i and the normalising periods per_f^{pm}) was not transcribed: the digitisation of printed p. 221 is incomplete at that display." The constant was transcribed in the review (`sources[0]`). The unread definition of per_f stays recorded in gap 3.

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–3.

### Not done, and why
- The constant (2πi)^{k−r−1} L_{p}(f*, χ, r) γ^± and the sign rule are already correct in the node and are not changed.

## /6 (medium, error): the Lemma 8.5 proof uses H⁰ of the unramified quotient, a Pontryagin dual and the direct limit

### What the verifier corrected
- **The source** (proof of Lemma 8.5, printed p. 184) identifies the cokernel with H⁰(Gal(K_v^ur/K_v), H¹(K_v^ur, T)) ≅ {H¹(F_v, H⁰(K_v^ur, T^∨(1)))}^∨. It factors the composite through {lim→_n H¹(F_v(ζ_{p^n}), H⁰(K_v^ur, T^∨(1)))}^∨, and reduces to lim→ = 0 by p-cohomological dimension zero.
- **The node** writes H¹(Gal, H¹(I_v,T)), which is the E₂^{1,1} term and contributes to H², not to the H¹ cokernel. It drops the dual and replaces lim→ by lim←.
- **The node's vanishing is false** under the natural maps. For T = μ_p and v ∤ p, H¹(F_v(ζ_{p^n}), Z/p) = Z/p with corestriction an isomorphism, so lim← = Z/p ≠ 0. Restriction is zero for large n (multiplication by the index p on Z/p), so lim→ = 0.
- **The theorem statement is correct.**
- **Additions:**
  - correct the source excerpt, which drops the direction (lim_n → lim→_n);
  - write T^∨(1) for the undefined T^*(1);
  - note that K_v(ζ_{p^n})/K_v is unramified since v ∤ p;
  - update the review note and add the μ_p regression test.

### State on main (93ebc401)
Unchanged. Page 184 was read again as an image and matches.

### Fix (`data/decompositions/KatoEulerSystems.json`, node `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`)
1. **`proofSteps[2]`.** Old: "The cokernel of H^1(O_v,T) -> H^1(K_v,T) is identified with H^1(Gal(K_v^{ur}/K_v), H^1(I_v,T)) and, by local duality, with a Hom into Q_p/Z_p of H^0 of the Tate dual over the residue field." New:
   > The cokernel of H^1(O_v,T) -> H^1(K_v,T) is identified with H^0(Gal(K_v^{ur}/K_v), H^1(K_v^{ur},T)), and by local duality with {H^1(F_v, H^0(K_v^{ur}, T^vee(1)))}^vee, where ( )^vee = Hom( , Q_p/Z_p) and T^vee(1) is the Tate dual of T.
2. **`proofSteps[3]`.** Old: "The composite lim_n H^1(K_v(zeta_{p^n}),T) -> H^1(K_v,T) -> cokernel factors through lim_n H^1(F_v(zeta_{p^n}), H^0(K_v^{ur}, T^*(1))), and this inverse limit vanishes because the p-cohomological dimension of the union of the F_v(zeta_{p^n}) is zero." New:
   > For v not over p, K_v(zeta_{p^n})/K_v is unramified. The composite from the inverse limit lim<-_n H^1(K_v(zeta_{p^n}),T) (under corestriction) to the cokernel factors through {lim->_n H^1(F_v(zeta_{p^n}), H^0(K_v^{ur}, T^vee(1)))}^vee, the dual of the DIRECT limit under restriction: corestriction on the original system is dual to restriction on the dual side. The direct limit vanishes because the p-cohomological dimension of the union of the F_v(zeta_{p^n}) is zero.
3. **`acceptance`: append.**
   > Regression test, T = mu_p and v not over p: H^1(F_v(zeta_{p^n}), Z/p) = Z/p, with corestriction an isomorphism, so the inverse limit under corestriction is Z/p, not 0; restriction is zero once the extensions have degree p, so the direct limit is 0. The proof must use the direct limit on the dual side and must not assert that the undualised inverse limit vanishes.
4. **`sources[1].excerpt`.** Replace "lim_n H1(F_v(zeta_{p^n}),H0(K_v^{ur},T^*(1))) = 0" with "lim->_n H1(F_v(zeta_{p^n}),H0(K_v^{ur},T^vee(1))) = 0" (Kato prints the arrow to the right under lim, and T^∨(1)).
5. **`review.checked[9]`.** `verdict` → "corrected". Append to `note`: "Corrected after RT-AREA-iwasawa-3/6: the cokernel is H^0 of the unramified quotient, not H^1 of inertia, and the vanishing is that of the direct limit of the dual side; the inverse-limit statement is false for T = mu_p."

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–4.

### Not done, and why
- The statement of Lemma 8.5 is correct and is not changed.

## /7 (medium, error): the theta existence proof uses the pushforward a_*

### What the verifier corrected
- **Kato §1.10** (printed p. 124): "the image of the divisor c²(0) − _cE under the multiplication a : E → E is c²(0) − _cE itself. Since the map a_* on Pic(E)^{deg=0} is compatible with the multiplication by a …".
- **The node's proof step 2** says "because a^* fixes the divisor", which is false. With c = 5 and a = 2, [2]^*D = 25E[2] − E[10], so a nonzero 2-torsion point has coefficient 24, not 0, while [2]_*D = D.
- **The fix is complete:** replace a^* by a_*, tie it to div(N_a f) = a_* div(f) and Abel's compatibility, and add the c = 5, a = 2 counter-check.
- **Nuance:** on Pic⁰ ≅ E, [a]^* also corresponds to multiplication by a, so only the divisor identity is wrong. Over a general base S, a_*D = D because [a] fixes the zero section and restricts to an automorphism of the finite flat group scheme E[c] when (a, c) = 1.

### State on main (93ebc401)
Unchanged. Page 124 was read again as an image and matches.

### Fix (`data/decompositions/KatoEulerSystems.json`, node `KatoEulerSystems:L0/theta-function-c-normalised`)
1. **`proofSteps[1]`.** Replace "That image is invariant under multiplication by every a prime to c, because a^* fixes the divisor; taking a = 2 forces the image to be 0." with:
   > That image is invariant under multiplication by every a prime to c, because the pushforward a_* fixes the divisor: [a] fixes the zero section and, as (a,c) = 1, restricts to an automorphism of the finite flat group scheme E[c], so a_*(c^2*(0) - E[c]) = c^2*(0) - E[c]; and a_* on Pic(E)^{deg 0} corresponds to multiplication by a on E(S) under Abel's isomorphism. Taking a = 2, the image x satisfies 2x = x, so x = 0. (The pullback a^* does NOT fix the divisor; see the acceptance test.)
2. **`proofSteps[2]`.** After "since N_a(f) has the same divisor", insert "(div(N_a f) = a_* div(f) = a_*(c^2*(0) - E[c]) = c^2*(0) - E[c])".
3. **`acceptance`: append.**
   > Pullback counter-check: over an algebraically closed field of characteristic 0 with c = 5, a = 2 and D = 25*(0) - E[5], the pullback is [2]^*D = 25*E[2] - E[10], in which a nonzero 2-torsion point has coefficient 24 (it has coefficient 0 in D), while the pushforward [2]_*D = D because [2] fixes 0 and permutes E[5]. An implementation of the existence proof that uses a^* must fail this test.
4. **`review.checked[0]`.** `verdict` → "corrected". Append to `note`: "Corrected after RT-AREA-iwasawa-3/7: the existence step read 'a^* fixes the divisor'; Kato uses the image under a, i.e. a_*."

**Copies.** `research/expansion/external/EXT-15/KatoEulerSystems.json` takes edits 1–3.

### Not done, and why
- Nothing else.

## /8 (medium, missing): PS.2 constructs the localization P = P⁺[L⁻¹] and compares as Huber–Müller-Stach do

### What the verifier corrected
- **PS.2's text** constructs formal periods from integration data with linearity, change of variables and Stokes, and proves the comparison with the Nori torsor. It is identical in `content/campaign/PeriodsAndSpecialValues/README.md`, `research/blueprint/atlas/roadmaps/PeriodsAndSpecialValues.json` and the `data/atlas.json` stage. Its acceptance is "Represent 2πi …".
- **Huber–Müller-Stach** (arXiv:1105.0865v5, p. 2, Def. 0.1 and Thm 0.2) define P⁺ by exactly those relations and products, then say: "The space of formal periods is the localization P of P⁺ with respect to the period of (G_m,{1},dX/X,S¹)". The torsor theorem concerns Spec(P), and ev maps that symbol to 2πi (p. 11).
- **Without the localization the comparison fails.** In the rank-one Tate case the effective algebra is Q[t] while the torsor ring is Q[t,t⁻¹].
- **No supplier stage names the localization.** MC.4 is Voevodsky-style Tate stabilization; MC.5–MC.6 are the Nori diagram category, tensor and duality structures, and torsors.
- **The fix, with the verifier's additions:**
  - update all three copies consistently, including the acceptance line;
  - state the comparison as HMS do: P⁺ ≅ A^eff first, then localize both sides, P ≅ A_{1,2};
  - confirm that MC.5 exports the localized Nori diagram and category (HMS Def. B.18, Prop. B.22, Thm 1.6(3)), or add that export to MC.5 rather than planning it in PS.2;
  - add a negative test: the effective Tate algebra Q[t] is not a G_m-torsor ring.
- **From the red team's fix:** reuse Mathlib's localization, and import the MC.5–MC.6 category and torsor rather than re-planning them. This finding does not assert that 1/π is not an effective numerical period.

### State on main (93ebc401)
- **PS.2 (README lines 41–53), unchanged.** "Construct the algebra of formal periods from algebraic integration data and its linearity, change-of-variables and Stokes relations. Prove the comparison with the coordinate ring of the Nori period torsor and construct evaluation in C." Its acceptance: "Represent 2πi and basic algebraic periods, verify multiplication by products of pairs, and trace a relation through both torsor and integral presentations." Its inputs: PS.0 and MC.6.
- **MC.5 (lines 83–95)** constructs "finite-diagram endomorphism coalgebras, filtered passage to Nori diagram categories, homology of algebraic pairs, boundary morphisms and the universal factorization property … tensor and duality structures". Its acceptance mentions "the pair (Gm,{1}) and its Tate period", but it states no localization of the effective diagram or category.
- **MC.6 (lines 97–109)** constructs torsors of tensor isomorphisms and "Export[s] period torsors to PeriodsAndSpecialValues".
- **Neither roadmap has a decomposition or packet.**
- **Read at the source** (HMS arXiv:1105.0865v5, https://arxiv.org/pdf/1105.0865v5, SHA-256 e55d85bf…c563):
  - Def. 0.1 = Def. 2.8 (pp. 2, 10): "The space of formal periods is the localization P of P⁺ with respect to the period of (G_m, {1}, dX/X, S¹) where S¹ is the unit circle in C*".
  - Thm 1.6(3) (p. 5): "MM_Nori is the localization of MM^eff_Nori with respect to the Lefschetz object 1(−1)".
  - Def. B.18 (p. 24) defines the localized diagram D of a graded multiplicative diagram D^eff at a vertex f₀. Prop. B.22 (p. 25): "(1) C(D, T) is the localization of C(D^eff, T) with respect to the object T̃(f₀). (2) … A = A^eff_χ (localization of algebras)."
  - Thm 2.10 (p. 11): "the space of formal periods P … agrees with the comparison algebra A_{1,2}". Its proof: "by definition P⁺ = P^eff_{1,2} … Hence by Theorem 2.6 P^eff_{1,2} = A^eff_{1,2} … By localization and the analogue of Proposition B.22, this implies P = A_{1,2}".
  - p. 11: "This induces a ring homomorphism ev : P → C which maps (G_m, {1}, dX/X, S¹) to 2πi."
- **Libraries.** Mathlib's `IsLocalization.Away` supplies the localization at one element. Neither pinned library has a Nori or formal-period algebra (verifier's search).

### Fix

**1. `content/campaign/PeriodsAndSpecialValues/README.md`, PS.2.**
- **"Construct and export".** Replace the paragraph with:
  > **Construct and export.** Construct the algebra P⁺ of effective formal periods from algebraic integration data (X, D, ω, γ) and its linearity, change-of-variables and Stokes relations, with the product of pairs (Huber–Müller-Stach, Definition 2.8). Name the Tate symbol L = (G_m, {1}, dX/X, S¹) and construct the algebra of formal periods P = P⁺[L⁻¹] with Mathlib's localization at one element. Construct evaluation ev : P⁺ → C by integration, send L to 2πi ≠ 0, and extend ev to P through the localization. Prove the comparison as Huber–Müller-Stach do (Theorem 2.10): P⁺ = P^eff_{1,2} ≅ A^eff_{1,2} for the effective diagram of pairs (their Theorem 2.6), then localize both sides, P ≅ A_{1,2}, the coordinate ring of the Nori period torsor. Import the effective and localized Nori diagram categories and their coalgebras from MotivesAndAlgebraicCycles MC.5, and the torsor from MC.6; do not plan them here. Separate identities forced by the relations from any assertion that evaluation is injective.
- **"Acceptance".** Replace the paragraph with:
  > **Acceptance.** Represent 2πi as ev(L) and basic algebraic periods; verify multiplication by products of pairs; check L·L⁻¹ = 1 in P and ev(L⁻¹) = (2πi)⁻¹; compute the rank-one Tate case, where the effective algebra is Q[t] and the localized algebra is Q[t, t⁻¹], the coordinate ring of a G_m-torsor; check that Q[t] itself is not a G_m-torsor ring (no inverse of t); and trace a relation through both torsor and integral presentations. None of this decides whether 1/π is an effective numerical period.
- **"Source route".** Replace "AE-NORI formal-period/torsor theorem; proof decomposition pending." with "Huber–Müller-Stach, On the relation between Nori motives and Kontsevich periods (arXiv:1105.0865v5): Definition 0.1 = 2.8, Theorem 2.6, Theorem 2.10 and its proof, and the evaluation map on p. 11; proof decomposition pending."

**2. `content/campaign/MotivesAndAlgebraicCycles/README.md`, MC.5, "Construct and export".** After "Build tensor and duality structures and the Betti/de Rham fiber functors in the source setting.", insert:
> Construct the localization of the effective graded multiplicative diagram at the Lefschetz vertex (G_m, {1}, 1) and export the localized diagram category and its coalgebra: MM_Nori is the localization of MM^eff_Nori with respect to 1(−1), and A = A^eff_χ is the corresponding localization of algebras (Huber–Müller-Stach, Definition B.18, Proposition B.22, Theorem 1.6(3)). PeriodsAndSpecialValues PS.2 and MC.6 import these.

**3. `data/atlas.json`.** The `description` of the PS.2 and MC.5 stages takes the same text. `research/blueprint/atlas/roadmaps/PeriodsAndSpecialValues.json` and `MotivesAndAlgebraicCycles.json` are regenerated from it. No edge changes: PS.2 already requires MC.6, which requires MC.5.

### Not done, and why
- **No decomposition exists** for either roadmap. The blueprint jobs should decompose Definition B.18, Proposition B.22 and Theorem 2.10.
- **The numerical period conjecture** is untouched.

## Sources read

All read on 29 September 2026, fetched with the worker user agent.
- **Kato**, *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295 (2004), 117–290. https://www.numdam.org/item/AST_2004__295__117_0.pdf, SHA-256 3c6e14b1…c605d. Printed pp. 124 (§1.10), 126 (Props 2.3–2.4), 182 (§8.4), 184 (Lemma 8.5 proof, 8.6, Prop. 8.7), 185 (Lemma 8.8), 187 (§9.2), 188 (§9.4, Thm 9.5) and 221 (Thms 12.4–12.5), each rendered and read as an image.
- **Bertolini, Darmon and Prasanna**, *Generalized Heegner cycles and p-adic Rankin L-series*, Duke Math. J. 162 (2013), with an appendix by B. Conrad. https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf, SHA-256 223bfdad…8fbc. Printed pp. 1040, 1053–1054, 1060, 1067 and 1140, with pp. 1040, 1060, 1067 and 1140 read as images.
- **Huber and Müller-Stach**, *On the relation between Nori motives and Kontsevich periods*, arXiv:1105.0865v5. https://arxiv.org/pdf/1105.0865v5, SHA-256 e55d85bf…c563. Pages 2, 4–5, 10–12, 24–25 (Definition 0.1, Theorem 1.6, Theorems 2.6 and 2.10, Definition 2.8, the evaluation map, Definition B.18, Proposition B.22).
