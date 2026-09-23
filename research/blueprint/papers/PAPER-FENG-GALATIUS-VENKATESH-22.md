# PAPER-FENG-GALATIUS-VENKATESH-22: The Galois action on symplectic K-theory

Tony Feng, Soren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, [Inventiones mathematicae 230 (2022), 225–319](https://doi.org/10.1007/s00222-022-01127-8) (open access, CC BY 4.0); arXiv [2007.15078](https://arxiv.org/abs/2007.15078).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1265). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-FENG-GALATIUS-VENKATESH-22.result.json](PAPER-FENG-GALATIUS-VENKATESH-22.result.json). It has:
- 57 items: 1 library, 15 planned, 41 missing;
- 5 routes: 3 source routes, 1 coalesced new roadmap and 1 Part II;
- 13 prerequisite entries;
- 17 recorded source issues.

## Sources read

- **The published article** (open access) was read in full. Pages below are the journal's.
- **arXiv v3** was used through its TeX source as a reading aid.
  - A word-level diff against the published text shows layout changes and four small corrections in the print (in §8 and Appendix A).
  - A background agent read §8 and Appendix A line by line and checked them. I verified every finding recorded here in the printed text.
- **Errata:** Crossref records no correction.

## What the paper proves

**The object.** Sp_{2g}(Z) is π_1 of the moduli stack 𝒜_g over Q, so Aut(C) acts on the p-adic homology of Sp_{2g}(Z). The action passes to symplectic K-theory, KSp_i(Z; Z_p) = lim_g π_i(BSp_{2g}(Z)^∧_p).

**Main theorem (Theorem 7.8).** For odd p:
- the Hodge map c_H : KSp_{4k−2}(Z; Z_p) → Z_p(2k − 1) is surjective and equivariant;
- its kernel ≅ K_{4k−2}(Z; Z_p) is finite with trivial action, and non-zero exactly when p divides the numerator of ζ(1 − 2k);
- the action factors through Γ = Gal(H_{p^∞}/Q);
- the extension is the *universal* extension of Z_p(2k − 1) by a trivial Γ-module.

**Variants.**
- **Theorem 7.10:** the unramified-outside-p Galois group, with splitting over a decomposition group.
- **Theorem 7.14:** Bott-inverted KSp, for all k ∈ Z.
- **§7.7:** the action on KSp_{4k−1} is trivial.

**The proof.**
- **§3:** (c_B, c_H) identifies KSp(Z; Z/q) with K(Z; Z/q)^{(+)} ⊕ π(ku; Z/q)^{(−)} (Theorem 3.5, from Karoubi).
- **§§4–5:** CM abelian varieties with O_q-multiplication, built as a functor from skew-Hermitian O_q-modules, give "CM classes" β^{2k−1}[(L, b)] that exhaust KSp_{4k−2}(Z; Z/q) (Proposition 5.1). The key inputs are:
  - a transfer computation in Galois homology (Proposition 2.17);
  - a supply of skew-Hermitian modules with any CM type (Proposition 4.7).
- **§6:** the main theorem of CM computes the Galois action on CM classes (Theorem 6.6).
- **§7.3:** the resulting cocycle equals the tautological one in H_1(Gal(H_q/Q), ⟨c⟩; μ_q^{⊗(2k−1)}).

**Consequences and construction.**
- **§8 (Theorem 8.1):** divisibility of Chern numbers of families of abelian varieties over Q.
- **Appendix A:** constructs the Galois action on the spectrum through p-completed étale homotopy types of a Γ-object in simplicial schemes over Q.

## What the atlas already has

**Library (1 item).** Mathlib's rings of integers, class groups, cyclotomic and CM fields, symplectic groups and group homology.

**Planned (15 items).**
- K-theory spectra and group completion (GeneralAlgebraicKTheory K.2:plus; StableHomotopyKTheory H.4–H.5).
- Mod-q homotopy (H.6) and Adams operations (SchemeKTheoryOperations S.6).
- Quillen localization and finite fields (K.3, ArithmeticKTheory N.2, N.8, KTheoryFiniteLocalFields L.1).
- The norm residue theorem and Quillen–Lichtenbaum (MotivicEtaleKTheory M.5, M.7).
- Topological K-theory (RefinedTraceMethods RT.4:topological).
- Symplectic K-theory as Hermitian K-theory (GN.6).
- Complex uniformization (AbelianSchemesAndArithmeticModuli A5).
- CM types and the main theorem of CM (ComplexMultiplicationAndExplicitReciprocity CM.0, CM.2; ShimuraVarieties V5).
- Class field theory and Chebotarev (Tau Ceti ClassFieldTheory Layers 11, 13; Chebotarev Layer 10).
- Poitou–Tate (ArithmeticGaloisDuality R02.2, R02.4).
- Mazur–Wiles and Vandiver (IntegralIwasawaTheory I.5, L3).
- Segal's Γ-space machine (H.4–H.5).

**Not in the atlas.** Nothing plans:
- the Bott element in the stable homotopy of BZ/q;
- Bott-inverted K-theory as a theory;
- symplectic K-theory's Betti and Hodge maps or its Galois action;
- CM classes;
- universal extensions in relative Galois homology;
- the integral indecomposables of stable homology;
- the Galois action on étale homotopy types of moduli.

## Routes

1. **Source → MotivicEtaleKTheory:M.7** (1 item). Thomason's étale descent spectral sequence for Bott-inverted K-theory, with its Adams-operation equivariance and naturality for transfers.
2. **Source → ArithmeticKTheory:N.6** (1 item). Lemmas 2.11 and 2.14: Bott-inverted K-theory of Z[1/p] and Z[ζ_q, 1/p] in all degrees, via H^0 and H^2 of twists, split by ψ^{−1}.
3. **Source → GeometryOfNumbersAndQuadraticArithmetic:GN.6** (1 item). Karoubi's splitting of KSp(Z)[1/2] and the fibre sequence K(Z)_{hC_2} → KSp(Z) → τ_{≥0}L^{−s}(Z).
4. **New (coalesced) → EtaleHomotopyTypes**, "Étale homotopy types and pro-spaces" (2 items; area `etale`).
   - **Contents:** the Betti realization of simplicial complex varieties (Lemma A.7, Definition A.8, Example A.10), and the p-completed étale homotopy type Et_p with its comparison map (A.2.2–A.2.3).
   - **Why here:** PAPER-SCHMIDT-STIX-16 proposed this roadmap as the atlas's home for étale homotopy and asked later arithmetic uses to import it. The brief adds these layers and keeps that route's id, title and area.
5. **Part II → ArithmeticKTheoryPartIISymplecticGaloisAction**, "K-theory of number fields and S-integers, Part II: symplectic K-theory of Z and its Galois action" (36 items; parent ArithmeticKTheory, area `ktheory`).
   - **Contents:** the paper's own mathematics.
     - The Bott element, Picard groupoids and Bott-inverted K-theory.
     - Corollary 2.12 and Propositions 2.15, 2.17.
     - The Betti and Hodge maps, Theorem 3.5, Proposition 3.8 and Bott-inverted KSp.
     - Skew-Hermitian Picard groupoids, the CM functor, Proposition 4.7 and Lemma 4.8.
     - CM classes (§5).
     - The Galois action and Theorem 6.6.
     - Universal extensions and Theorems 7.1, 7.8, 7.10, 7.14, §7.7.
     - Theorem 8.4, (8.2) and Theorem 8.1.
     - The Γ-space models, the Betti realization of 𝒜_g and the Γ-object in simplicial schemes of Appendix A.3–A.5.
   - **Why a Part II:** ArithmeticKTheory plans the K-theory of number rings and its étale description. Symplectic K-theory of Z and the Galois module structure of its homotopy extend that direction.

## Source issues (`sourceIssues` E1–E17)

All are in the published text. Two reach stated results or proofs.

- **E10 (gap, Theorem 8.1, p. 296).**
  - **Problem:** "divisible by each prime p ≥ max_j(n_j)". The proof's step "p ≥ n_i implies ch_{n_i} lifts to a Z_(p)-integral class" fails at n = p. ch_p = s_p/p! is not p-integral on 𝒜_g for large g: via Theorem 3.5, the Adams summand Σ²ℓ ⊂ ku^{(−)} is a retract of KSp(Z)^∧_p, giving classes y with ⟨ch_p(ω), y⟩ = 1/p!.
  - **Where it bites:** n_i = p cannot occur for the index i with p | num B_{n_i+1} (Kummer), but n_j = p for j ≠ i can.
  - **Fix:** p > max n_j. The introduction's one-part case already requires p > 2k.
- **E12 (gap, proof of Theorem 8.4, p. 299).**
  - **Problem:** τ_{≤2p−2}Ω^∞E need not split as a product of Eilenberg–MacLane *loop spaces*. The 𝒫^1 k-invariant the proof names connects π_1 to π_{2p−2}, inside the range. For E = ΣS^∧_p, α_1 is detected by 𝒫^1.
  - **Effect:** the conclusion is not contradicted in that example, but the argument needs repair.
- **Formulation errors.**
  - **E11:** Theorem 8.4 as stated (p-complete E, ordinary Z_p-homology) fails for E = ΣHZ_p (H_1 = Z_p ⊗_Z Z_p). "The latter space" names the submodule instead of the quotient, and the range in (8.2) should start at 1.
  - **E14:** property (iii) of A.2 and the A.5 comparison need finite-dimensional mod-p cohomology, and Et_p should be taken componentwise on the infinite coproducts used.
  - **E15:** Definition A.1 asks X({∗}) to be a point, which the paper's Γ-objects are not.
  - **E1:** "2g-dimensional abelian variety … at most g" and "End(A) is necessarily a CM order" are misstated; for E × E, End ⊗ Q = M_2(K).
  - **E16:** Example A.10 needs V smooth, and the fibre product is (n + 1)-fold.
- **Misprints.**
  - **E2:** "real embeddings of O_q"; "unique prime above q".
  - **E3:** Proposition 6.1's bound should be g ≥ φ(q)/2; the CM abelian varieties have dimension φ(q)/2.
  - **E4:** Gal(H/K) should be Gal(H/E).
  - **E5:** s ∘ π should be π ∘ s.
  - **E6:** β^{k−1} should be β^{2k−1}.
  - **E7:** Theorem 7.8's "G-modules" should be Γ, and its proof cites (7.23).
  - **E8:** Remark 7.9 should say ℘(q)^c. As printed, ℘(q) being a singleton is regularity, not Vandiver.
  - **E9:** χ_cyc^{2k−1} should be χ_cyc^{2k}, and "Theorem 3.3" should be Theorem 3.5.
  - **E13:** Remark 8.2's "respectively" is reversed.
  - **E17:** the Rosati involution is defined by ℒ, not φ; "the path component" should be "components".

The items use the corrected statements.

## Prerequisites not yet covered

1. Karoubi, *Théorie de Quillen et homologie du groupe orthogonal* (Ann. of Math. 112, 1980).
2. Thomason, *Algebraic K-theory and étale cohomology* (Ann. Sci. ÉNS 18, 1985).
3. Dwyer–Friedlander, *Algebraic and étale K-theory* (Trans. AMS 292, 1985).
4. Blumberg–Mandell, *K-theoretic Tate–Poitou duality and the fiber of the cyclotomic trace* (Invent. Math. 221, 2020).
5. Hebestreit–Steimle, *Stable moduli spaces of hermitian forms* (arXiv 2103.13911).
6. Calmès et al., *Hermitian K-theory for stable ∞-categories I* (arXiv 2009.07223).
7. Milne, *The fundamental theorem of complex multiplication* (arXiv 0705.3446).
8. Charney, *A generalization of a theorem of Vogtmann* (JPAA 44, 1987).
9. Quillen, *Letter to Milnor on Im(π_iO → π_i^s → K_iZ)* (LNM 551, 1976).
10. Artin–Mazur, *Étale homotopy* (LNM 100, 1969).
11. Friedlander, *Étale homotopy of simplicial schemes* (Annals of Math. Studies 104, 1982).
12. Bousfield–Friedlander, *Homotopy theory of Γ-spaces, spectra, and bisimplicial sets* (LNM 658, 1978).
13. Harris–Segal, *K_i groups of rings of algebraic integers* (Ann. of Math. 101, 1975).

DOIs and arXiv identifiers were checked against Crossref and arXiv.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-GALATIUS-VENKATESH-22.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- No accepted restructure touches the cited stages.
- The EtaleHomotopyTypes id, title and area match PAPER-SCHMIDT-STIX-16.
- **Checked by hand:**
  - §2: Lemmas 2.10–2.11, Corollary 2.12, Propositions 2.15 and 2.17 (eigenspaces, orders, coinvariants).
  - §3: the proof of Theorem 3.5 and the table of Corollary 3.6.
  - §4: Proposition 4.7, including the different and δ̄ = −δ, and Lemma 4.8.
  - §5: Proposition 5.2 and the K_0 identity in §5.3.
  - §7: Lemmas 7.4, 7.6, 7.7, the cocycle computation (7.15)–(7.19), Lemmas 7.12–7.13, and Remark 7.9.
  - §8: the ch_p non-integrality argument of E10.
- **Checked by computer (background agent):** Example 8.3; Theorem 8.4 for small Eilenberg–MacLane spaces; Lemma 8.5; the Bernoulli-numerator claim for p < 1200.
- No Lean was written or compiled; this is an extraction.

## Review (REV-PAPER-FENG-GALATIUS-VENKATESH-22, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1267](https://github.com/CBirkbeck/tauceti-explorer/issues/1267). **Verdict: accept.** All five
routes accepted; nothing needed correcting in place.

- **A provenance limitation.** Springer's PDF endpoint returns a JavaScript challenge page to every
  request made here, so the recorded SHA-256 could not be re-verified. The published *text* was read
  through a rendering proxy, with the journal page map rebuilt from the running heads (94 marks,
  pp. 226–319), and every finding checked at its recorded page. Crossref records no correction.
- **All 17 mistakes confirmed.** Several are settled by the paper against itself: **E5** is not even
  well typed (`s ∘ π` is an endomorphism of `V`, and the displayed sequence draws `s` as a section of
  `π`), **E6**'s exponent is fixed by the line above, **E9**'s "Theorem 3.3" does not exist, and
  **E11**'s "integral indecomposables" names a quotient that Example 8.3 itself computes.
- **E10 reaches a stated result**, and the introduction corroborates it: Theorem 8.1 says
  `p ≥ max_j(n_j)` where integrality of `ch_{n_j} = s_{n_j}/n_j!` fails at `n_j = p`, while the
  one-part version on p. 229 already says "in the range when p > 2k".
- **E12 is a real gap**, reported with the right qualification: the `𝒫¹` k-invariant connects
  `π₁(X)` to `π_{2p−2}(X)`, so the Postnikov splitting step fails (witness `α₁`), yet Theorem 8.4's
  conclusion is not contradicted — the argument fails, not the theorem.
- **Items and routes:** 57 items (1 library, 15 planned, 41 missing), each missing item routed once;
  seven library declarations opened at the pins; all 26 stage ids present. The Part II title is an
  exact prefix extension, and the new roadmap `EtaleHomotopyTypes` is co-proposed byte-identically by
  PAPER-SCHMIDT-STIX-16, so the two coalesce.

Full report: `research/blueprint/reviews/REV-PAPER-FENG-GALATIUS-VENKATESH-22.md`.
