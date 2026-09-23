# PAPER-GROECHENIG-WYSS-ZIEGLER-20: Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration

Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, [Inventiones mathematicae 221 (2020), 505–596](https://doi.org/10.1007/s00222-020-00957-8) (open access, CC BY 4.0); arXiv [1707.06417](https://arxiv.org/abs/1707.06417).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1292). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json](PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json). It has:
- 78 items: 3 library, 5 planned, 70 missing;
- 5 routes: 3 source routes, 1 coalesced Part II and 1 new roadmap;
- 11 prerequisite entries;
- 20 recorded source issues.

## Sources read

- **The published article** (open access) was read in full. Pages below are the journal's.
- **arXiv v3** was used through its TeX source as a reading aid.
  - The journal version differs in substance. It adds Definition 5.22 (so later §5 numbers shift by one) and Remark 6.14. It rewrites Situation 5.23, Proposition 5.25, Corollary 5.26 and the proofs of Theorem 7.15 and Lemma 7.19. It adds "even" to the degree hypotheses in §7, and it fixes slips in Remark 3.11, Proposition 3.16 and Theorem 7.21.
  - Everything recorded here was checked in the printed text.
  - A background agent read §5 line by line. I verified each finding recorded from it: the Lemma 5.1 counterexample, the Brauer–Severi example and the Bockstein direction.
- **Errata:** Crossref records no correction.

## What the paper proves

**Main theorem (Theorem 7.21, Hausel–Thaddeus's conjecture).** Take:
- X a smooth projective curve of genus g;
- D a line bundle with D ⊗ (Ω¹_X)^{−1} of strictly positive even degree, or trivial;
- d and e prime to n, and L of degree d.

Then:
- over C: E(M^L_{SL_n}(X)) = E_st(M^e_{PGL_n}(X), α^d_{PGL_n,L′});
- over F_q with p > n, the corresponding point counts agree.

It has three refinements:
- the Hodge-number equality for D = Ω¹ (Corollary 7.22);
- fibrewise Galois representations that are abstractly isomorphic (Theorem 7.23);
- the Γ-isotypic parts of H^*_c(M^L_{SL_n}), described through the Weil pairing (Theorem 7.24, a form of a conjecture of Hausel).

**The method.**
- **§2.** Stringy invariants of quotient stacks, twisted by a μ_r-gerbe through its transgressed torsor on the inertia stack. An equivariant Katz theorem with fractional Tate twists shows that stringy point counts over every F_q determine stringy E-polynomials (Theorems 2.15–2.19).
- **§§3–4.**
  - Tate duality over a local field, and |B(F)/φ(A(F))| = |ker(φ)(F)| for self-dual isogenies (Proposition 3.16).
  - p-adic integration, and Yasuda's orbifold measure on O_F-points of an admissible finite abelian quotient stack.
  - The volume formula μ_orb(e^{−1}(x)) = q^{−w(γ,x)}/|Aut(x)| over the inertia stack of the special fibre (Theorem 4.16).
- **§5.** The stacks X_{L/F} = [Spec O_L/Gal(L/F)] give a stack-theoretic Hasse invariant. The Hasse invariant of the pull-back of a gerbe to an F-point is the transgression evaluated at its specialisation (Theorem 5.20, Proposition 5.25). The twisted stringy count is therefore a p-adic integral of f_α = exp(2πi·inv) (Corollary 5.29).
- **§6.** Abstract Hitchin systems, and dual pairs of them: Pryms dual by a self-dual isogeny, with each torsor the space Split′ of splittings of the other's gerbe.
  - When a fibre has no F-point, f_α is a non-trivial Tate character on the dual fibre (Lemma 6.7), so its integral vanishes.
  - When both fibres have F-points, they have equal volume (Key Lemma 6.16).
  - Hence fibrewise p-adic mirror symmetry (Theorem 6.17), equal stringy counts (Theorem 6.12) and equal stringy E-polynomials (Theorem 6.11).
- **§7.** D-twisted SL_n and PGL_n Higgs moduli form a dual pair, via Hausel–Pauly's Prym duality and Hausel–Thaddeus's gerbes. The same volume argument proves that point counts of GL_n and SL_n Higgs moduli do not depend on the degree (Theorems 7.15–7.16), which is the coprime independence part of the Mozgovoy–Schiffmann conjecture.

## What the atlas already has

**Library (3 items).**
- Mathlib's Haar measure with its normalisation and uniqueness.
- Tau Ceti's vanishing of the Brauer group of a finite field.
- Mathlib's AddCircle.toCircle for Q/Z ↪ C^×.

**Planned (5 items).**
- Inertia, unramified and tame extensions: Local fields and ramification, Layers 0, 2, 3.
- The local reciprocity diagram: Class field theory, Layers 6–7.
- The local Brauer group, and local Tate duality with the Euler characteristic: Class field theory, Layer 5.
- The D-twisted Higgs stack, Hitchin base and map: EndoscopicTransferAndUnitaryTraceComparison ET.2b.

**Missing (70 items).** The atlas does not plan:
- p-adic integration on quotient stacks;
- stringy invariants or Katz's theorem;
- the stack-theoretic Hasse invariant;
- relative splittings of gerbes;
- abstract Hitchin systems;
- stable SL_n and PGL_n Higgs moduli with their Pryms, gerbes and mirror symmetry.

**The sibling extraction.** PAPER-GROECHENIG-WYSS-ZIEGLER-20-B (the same authors' *Geometric stabilisation via p-adic integration*) has already proposed a Part II of EndoscopicTransferAndUnitaryTraceComparison for the general version of this machinery. That version covers tame Deligne–Mumford stacks and twisted inertia.

## Routes

1. **Source → LogicAndDefinabilityInNumberTheory:LD.2** (4 items).
   - The measure of an r-gauge form, Fubini and change of variables (Proposition 4.1, Claim 4.2, Lemma 4.3).
   - Yasuda's null sets and change of variables for generically free quotients (Proposition 4.4).
   - Weil's formula.
   - GWZ20-B's route sends the same facts here.
2. **Source → ArithmeticGaloisDuality:R02.4** (3 items).
   - Tate duality for abelian varieties with its Ext description and gerbe interpretation (Lemma 3.8 to Remark 3.11).
   - The self-duality of the isogeny long exact sequence (Lemma 3.15).
   - Proposition 3.16. The abelian-variety case of local duality was routed here for GWZ20-B.
3. **Source → AlgebraicModuliForArithmeticGeometry:R09.4, R09.5** (4 items).
   - Finite quotient stacks and inertia stacks.
   - Giraud's classification of gerbes.
   - The twisting identities [N/Γ] ≃ [N_T/Γ].
4. **Part II (coalesced) → EndoscopicTransferAndUnitaryTraceComparisonPartII**, "Endoscopic transfer and unitary trace comparison, Part II: geometric stabilisation via p-adic integration" (23 items; parent EndoscopicTransferAndUnitaryTraceComparison, area `langlands`).
   - **Contents:**
     - fermionic shift and weight;
     - gerbes on [Y/Γ] as central extensions, transgression and Lemma 2.9;
     - H¹(F, Γ) and its Tate pairing;
     - the μ_r-gerbe form of Lemma 3.12;
     - twists and their Frobenius;
     - admissible stacks, the orbifold measure, the specialisation map and Theorem 4.16 with its affine and cyclic cases;
     - all of §5 except Corollary 5.29;
     - Lemmas 6.7 and 6.13.
   - **Why here:** these are the finite-abelian-quotient cases of GWZ20-B's canonical measure, stacky Weil formula, stacky Hasse invariant and Tate-duality lemma, all proposed for this candidate. A second owner would duplicate them. The route keeps the candidate's id, title and area. Its brief asks the design to derive these statements from the general layers.
5. **New → TopologicalMirrorSymmetryForHitchinSystems**, "Topological mirror symmetry for Hitchin systems" (36 items; area `geomlanglands`).
   - **Contents:**
     - stringy E-polynomials and point counts, untwisted and twisted;
     - Katz's theorem in its equivariant, fractional-twist and stringy forms;
     - arithmetic gerbes and Split′;
     - abstract Hitchin systems and dual pairs, the Key Lemma and Theorems 6.11, 6.12 and 6.17;
     - Corollary 5.29;
     - the SL_n and PGL_n Higgs moduli over a Noetherian base: smoothness, properness, twisting, norm preimages, Prym duality, the regular locus, the torsor calculus;
     - the Hausel–Thaddeus gerbes and their duality;
     - Theorems 7.15–7.16, 7.21, 7.23, 7.24 and Corollary 7.22.
   - **Why new:**
     - The atlas has no home for stringy Hodge theory or topological mirror symmetry.
     - ET.2b builds the Hitchin fibration only for the endoscopic comparison over a finite field.
     - The coalesced Part II is about geometric stabilisation and has no Hodge-theoretic layer.
   - The roadmap imports:
     - the p-adic machinery from the Part II;
     - the Hitchin fibration from ET.2b;
     - Hodge–Tate comparison from CohomologyComparisons CP.3;
     - Chebotarev recognition from ArithmeticGaloisRepresentations R01.5;
     - purity from DeligneWeightsAndPurity DWP.7;
     - dual abelian schemes from AbelianSchemesAndArithmeticModuli A2.

## Source issues (`sourceIssues` E1–E20)

All of these are in the published text. None breaks a main theorem, but E2, E3 and E13 reach stated results, and E1 and E14–E17 reach proofs.

**Errors.**
- **E13 (Lemma 5.1, p. 548).**
  - **Problem:** Gal(L/F) of a tame extension with μ_e ⊂ F need not split, and F(π_L) need not have degree e.
  - **Counterexample:** L = Q_5(y), y⁴ − 20y² + 50 = 0.
    - y² = 5(2 + √2), where 2 + √2 is a unit and √2 generates the unramified quadratic extension. So e = f = 2 and Γ ≅ Z/4.
    - Every hypothesis of §§5.1–5.4 holds.
    - Such L occur as T_φ for [A¹/μ_4] over Z_5.
  - **Where it bites:** Lemmas 5.5 and 5.7, Lemma 5.8, Proposition 5.15 and Theorem 5.20 all use the splitting.
  - **Repair:** pass to L·F_d. Its Galois group Γ ×_{Z/f} Z/d is split, and X_{L·F_d/F} ≅ X_{L/F}.
- **E3 (Lemma 3.12, second assertion, and Corollary 3.13, p. 534).**
  - **Problem:** the Brauer-group form is false. For y² = x³ − x over Q_5 with r = 2, the left side has order 4 and Ext²(E, μ_2) = H¹(F, E[2]) has order 16.
  - **Fix:** the μ_r-gerbe form H²(−, μ_r) is correct, and it is what Lemma 6.7 uses.
- **E1 (Definition 2.16(c), p. 525).** The claimed independence of the choice of roots of q fails for q = 4: take X = L^{1/2}, Y = 2·[pt], and s_2 = ±2. It holds for primes q = p prime to the values of χ, and those points have density one, which is all that Theorems 2.18–2.19 need.
- **E2 (Lemma 2.17, pp. 525–526).**
  - **Problem:** with Q_ℓ-coefficients, no ℓ^k-th root of the cyclotomic character exists for large k, because its image is open and (Z_ℓ^×)^{ℓ^k} ⊂ μ_{ℓ−1}(1 + ℓ^{k+1}Z_ℓ).
  - **Fix:** the lemma holds with Q̄_ℓ-coefficients, and Theorem 2.18 needs only finitely many r.
- **E14 (Construction 4.15, p. 543).** Local reciprocity does not send a primitive |Γ|-th root of unity to a generator of the inertia group: over Q_5(√5), (−1, 5)_2 = +1. The generator must come from the tame character σ ↦ σ(π_L)/π_L.
- **E4 ((24), p. 565).** The sequence 0 → Br(K) → Br(X)_K → H¹(K, Pic) → 0 is not exact on the left, as a conic without real points shows. The printed H¹(K^sep, …) should be H¹(K, …). Lemma 6.5 uses only exactness in the middle.
- **E18 (proof of Lemma 5.14).** Brauer–Severi schemes of rank-r² algebras are P^{r−1}-bundles. The "iff" with sections fails over P² for B = End(T_{P²}). Only the true direction is used.

**Gaps.**
- **E15 (Theorem 5.20).** The transgression is computed from a splitting over the generic fibre, but τ̃ lives on the special fibre. A comparison through an O_L^×-valued splitting fills the gap.
- **E16 (Proposition 5.25).**
  - **Problem:** Theorem 5.20 assumes μ_{e²} ⊂ k_F, which admissibility does not give. Example: Γ = Z/4, r = 2, F = Q_3(μ_8).
  - **Fix:** a μ_r-version of Theorem 5.20 is needed.
- **E17 (Proposition 5.18).** The order of Br(B_{k_F}I)[e] is not shown. It is e, by the Kummer sequence.

**Misprints.**
- **E5:** Ω^q should be Ω^p (Theorem 2.15).
- **E6:** indices and the sign of Tate twists in the proof of Theorem 2.18.
- **E7:** L^{α_i} should be L^{F(γ)} (Theorem 2.19).
- **E8:** η should be dx_1 ∧ ⋯ ∧ dx_n (Claim 4.2).
- **E9:** α_2 should be α_1 (Definition 1.2).
- **E10:** P_i^♦ should be P_{i′}^♦ (Definition 6.9(c)).
- **E11:** a vector bundle on X, not S (Definition 7.1).
- **E12:** Lemma 7.8(a) needs det(π_*O)^{−1}. With it, Lemma 7.13's statements are right and its proof, and that of Theorem 7.16, flip sign.
- **E19:** the Bockstein direction and indices in the proof of Theorem 5.20.
- **E20:** Lemma 2.7(c) is misquoted in the proof of Lemma 5.12.

The items use the corrected statements.

## Prerequisites not yet covered

1. Hausel–Thaddeus, *Mirror symmetry, Langlands duality, and the Hitchin system* (Invent. Math. 153, 2003).
2. Hausel–Rodriguez-Villegas, *Mixed Hodge polynomials of character varieties*, with Katz's appendix (Invent. Math. 174, 2008).
3. Ito, *Stringy Hodge numbers and p-adic Hodge theory* (Compos. Math. 140, 2004).
4. Bittner, *The universal Euler characteristic for varieties of characteristic zero* (Compos. Math. 140, 2004).
5. Batyrev, *Non-Archimedean integrals and stringy Euler numbers of log-terminal pairs* (JEMS 1, 1999).
6. Denef–Loeser, *Motivic integration, quotient singularities and the McKay correspondence* (Compos. Math. 131, 2002).
7. Yasuda, *The wild McKay correspondence and p-adic measures* (JEMS 19, 2017).
8. Hausel–Pauly, *Prym varieties of spectral covers* (Geom. Topol. 16, 2012).
9. Nitsure, *Moduli space of semistable pairs on a curve* (Proc. LMS 62, 1991).
10. Mozgovoy–Schiffmann, *Counting Higgs bundles and type A quiver bundles* (Compos. Math. 156, 2020).
11. Mellit, *Poincaré polynomials of moduli spaces of Higgs bundles and character varieties (no punctures)* (Invent. Math. 221, 2020).

DOIs were checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- No restructure result touches the cited stages.
- The coalesced Part II's id, title and area match PAPER-GROECHENIG-WYSS-ZIEGLER-20-B.
- **Checked by hand:**
  - the q = 4 counterexample (E1) and the ℓ-adic obstruction (E2);
  - the elliptic-curve orders in E3: Ẽ(F_5) ≅ Z/2 × Z/4, and the local Euler characteristic;
  - the cyclic quartic field of E13 and the splitting after the unramified enlargement;
  - the Hilbert symbol of E14;
  - the Chern-class computation of E18;
  - the fermionic-shift identities of Definition 2.2;
  - the Key Lemma and Theorem 6.17;
  - Lemma 7.19's published argument;
  - the degree computation in Theorem 7.16;
  - the Fourier inversion in Theorem 7.24.
- **Checked by the background agent, spot-checked by hand:** the §5 cohomology computations (Lemmas 5.8, 5.12, Proposition 5.15) and the group-theory check that the unramified enlargement splits Γ for e, f ≤ 8.
- No Lean was written or compiled; this is an extraction.

## Review (REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1293](https://github.com/CBirkbeck/tauceti-explorer/issues/1293). **Verdict: accept.** All five
routes accepted; no item, status, route, locator or quotation changed.

- **A provenance limitation, recorded honestly.** Springer's PDF endpoint returns a 3 KB JavaScript
  challenge page to every request made here — browser User-Agent, article referer and cookie jar
  alike — and Unpaywall lists no other copy of the published version, so the recorded SHA-256
  `f2231145…3e07` could **not** be re-verified in this environment. The published *text* was
  verified instead, through a rendering proxy, with the journal page map rebuilt from the running
  heads (91 marks, pp. 506–596). Crossref still records no correction.
- **All 20 mistakes confirmed at their locators.** Nine are settled by the paper contradicting
  itself: E3 (the first half of Lemma 3.12 works with gerbes in `H²_ét`, the second is stated with
  `Br(P)[r]`), E5, E6 (a sum over `i` whose summand is indexed by `j`), E8 (Claim 4.2 asks for a
  1-gauge form and the display identifies `η^{⊗r}`), E9, E10, E11, E17 and E19.
- **Seven counterexamples were rebuilt independently:** E1's two compatible root systems at `q = 4`
  giving `2` and `−2`; E2's obstruction `(Z_ℓ^×)^{ℓ^k} = μ_{ℓ−1}(1+ℓ^{k+1}Z_ℓ)`; E3's orders 4 and
  16 for `y² = x³ − x` over `Q₅`; E4's conic over `R`; **E13's cyclic quartic** `x⁴ − 20x² + 50` over
  `Q₅`, whose `q(p²−4q) = 100²` makes `Γ ≅ Z/4` a non-split extension *inside the paper's own
  hypotheses*; E14's `r(−1) = 1`; and E18's `c₂(T(−a)) = a² − 3a + 3`.
- **One distinction recorded on E20:** the dropped `H¹_ét(k_F, −)` in the application of Lemma
  2.7(c) is a real slip, but the "Γ versus I" half is a choice of presentation, the paper writing
  the same stack as `[Spec k_F/I] = [Spec k_L/Γ]`.
- **Items and routes:** 78 items (3 library, 5 planned, 70 missing), each missing item routed once.
  Route 4 is byte-identical to the Part II already accepted for GWZ-20-B, so it coalesces; and the
  new roadmap is justified by an atlas sweep in which **"Higgs bundle", "stringy" and "Hausel" occur
  nowhere at all**, while item 61 is correctly left `planned` at ET.2b, which does plan twisted
  Higgs moduli and the Hitchin map.

Full report: `research/blueprint/reviews/REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20.md`.
