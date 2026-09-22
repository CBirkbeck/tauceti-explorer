# PAPER-SCHMIDT-STIX-16: Anabelian geometry with étale homotopy types

Alexander Schmidt and Jakob Stix, *Anabelian geometry with étale homotopy types*, [Annals of Mathematics 184 (2016), 817–868](https://doi.org/10.4007/annals.2016.184.3.5); arXiv [1504.01068](https://arxiv.org/abs/1504.01068).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1167). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-SCHMIDT-STIX-16.result.json](PAPER-SCHMIDT-STIX-16.result.json). It has:
- 74 items: 2 library, 10 planned, 62 missing;
- 8 routes: 6 source routes, 1 new roadmap and 1 Part II;
- 12 prerequisite entries;
- 7 recorded source issues.

## Sources read

- **The published article** was read in full from the free Annals PDF (52 pages). Statement numbers and pages below are the published ones.
- **arXiv v2** (July 2016, "refereed version") was used through its TeX source as a reading aid. A word-level diff shows that it matches the published text up to copy-editing and the reference list.
- **Errata:** the Annals page lists no erratum, and Crossref has no update relation.

## What the paper proves

The étale topological type X_et of a scheme is a pro-simplicial set. Its class in the homotopy category Ho(pro-ss) of Isaksen's model structure is the étale homotopy type. The paper asks when a variety is determined by it, relative to k_et.

**Results over a finitely generated field k/Q.**
- **Theorems 1.1 and 3.2:** Mochizuki's Hom theorem for hyperbolic curves over sub-p-adic fields, restated without base points in Ho(pro-ss)↓k_et.
- **Theorems 1.2 and 4.7:** for smooth geometrically connected varieties that embed in products of hyperbolic curves, Isom_k(X, Y) → Isom(X_et, Y_et) has a unique functorial retraction r. The proof runs in three steps:
  - Mochizuki gives a map X → W to the ambient product (Proposition 4.3).
  - A point count in closed fibres (Proposition 4.1) and Tamagawa's separation of rational points over finite fields (Proposition 4.6) show that the map lands in Y (Proposition 4.4).
  - Functoriality comes out of the construction.
- **Theorem 1.9 (§5):** automorphisms γ with r(γ) = id act on π_1 by automorphisms that are class-preserving by geometric elements. The proof has four steps:
  - normality of open normal subgroups, by Čebotarev (Proposition 5.1);
  - conjugates of powers (Lemma 5.2);
  - exponent 1 via the cyclotomic character (Proposition 5.3);
  - removal of rational factors by ℓ-geometric covers of positive genus (Lemma 5.4, Proposition 5.5).
- **Theorems 1.5 and 6.2, Corollary 1.6:** for *strongly hyperbolic Artin neighbourhoods* the kernel is trivial, so these varieties are anabelian in the classical sense. These are towers of elementary fibrations into hyperbolic curves, such as M_{0,n}.
- **Lemma 6.3 and Corollary 1.7:** every point of a smooth variety has a basis of such Zariski neighbourhoods, as Grothendieck predicted in his letter to Faltings.
- **Theorems 7.1–7.2:** absolute and non-geometrically-connected versions, using Pop's birational theorem.

**The appendix** develops the homotopy theory of pro-spaces that the paper needs:
- coverings, and base change of homotopy equivalences along them;
- topological homotopy groups of profinite pro-spaces;
- when unpointed maps lift to pointed ones, and the monodromy action;
- classifying spaces of pro-groups and K(π,1) pro-spaces.

## What the atlas already has

**Library (2 items).**
- Mathlib's simplicial sets, Kan complexes, nerves and `HomotopicalAlgebra.ModelCategory`.
- Absolute Galois groups, Krull topology, `ProfiniteGrp` and the compactness lemma.

**Planned (10 items).**
- Homotopy groups of Kan complexes (Tau Ceti AlgebraicTopology Stage 8) and nerves/BG (StableHomotopyKTheory H.1).
- The trace formula, smooth/proper base change and étale Künneth (SF.2).
- Relative purity and Poincaré duality (EDC.2).
- Characteristic-zero resolution and normal-crossings compactification (R09.7).
- Riemann–Hurwitz (Tau Ceti AlgebraicCurves Layer 7).
- Elementary abelian ℓ-covers of P¹ minus points (IG.3).
- Kummer theory (Tau Ceti ProfiniteCohomology Layer 9).

**Anabelian geometry.** NC.1 plans a Mochizuki reconstruction theorem for smooth proper hyperbolic curves over number fields. It states explicitly that the Hom version, affine curves and finite-field variants need their own sources.

**Not in the atlas.**
- Pro-categories of simplicial sets, Isaksen's model structure, the étale topological type, and the pointed/unpointed and classifying-space theory of pro-spaces.
- Any anabelian result in dimension > 1.
- Tamagawa's and Pop's theorems.
- Serre's Čebotarev for arithmetic schemes.

## Routes

1. **Source → AnabelianGeometryAndNonabelianChabauty:NC.1** (4 items). The sources NC.1 asks for:
   - Mochizuki's Theorem A (Hom version, sub-p-adic fields) with his Lemma 15.8 (strongly center-free Galois groups);
   - Tamagawa's non-conjugacy of decomposition groups of distinct rational points over finite fields;
   - Pop's birational anabelian theorem over finitely generated fields.
2. **Source → InverseGaloisAndArithmeticFundamentalGroups:IG.1** (3 items):
   - Künneth for π_1 in characteristic 0;
   - finite generation of π_1(X_k̄);
   - lifting étale covers from a closed fibre over a henselian base.
3. **Source → IG.2** (1 item). The Fried–Jarden result that Galois groups of Hilbertian fields have no nontrivial finitely generated closed normal subgroups.
4. **Source → AnalyticNumberTheory:AN.4** (1 item). Serre's Čebotarev density for schemes of finite type over Z. RS-07 keeps Chebotarev in AN.4.
5. **Source → AlgebraicModuliForArithmeticGeometry:R09.2** (1 item). Deligne–Mumford: Isom schemes of hyperbolic fibrations are finite unramified.
6. **Source → SchemeAndStackFoundations:SF.0** (2 items):
   - Jacobson property and finite residue fields of finite-type Z-schemes. Mathlib has the Jacobson-space transfer, but not `IsJacobsonRing ℤ`.
   - Spreading out over a regular base of finite type over Z.
7. **New roadmap → EtaleHomotopyTypes**, "Étale homotopy types and pro-spaces" (26 items; area `etale`).
   - **Contents:**
     - pro-categories and Isaksen's model structure;
     - the étale topological type (Friedlander) and étale homotopy groups;
     - Friedlander's long exact sequence and Artin's good neighbourhoods (SGA 4 XI 3.3);
     - §2: Lemmas 2.1–2.2, 2.7, 2.9, Propositions 2.3, 2.4, 2.8, Corollaries 2.5–2.6;
     - the whole Appendix (A.1–A.18);
     - Isaksen's A¹-factorization (Remark 1.4(2)).
   - **Why a new roadmap:** this is a self-contained foundational theory with its own sources (Artin–Mazur, Friedlander, Isaksen, Bousfield–Kan), and nothing in the atlas is in its direction.
     - The Tau Ceti AlgebraicTopology and StableHomotopyKTheory roadmaps stop at ordinary homotopy of spaces and simplicial sets, and are imported.
     - It will also serve non-anabelian consumers, such as homotopy obstructions to rational points.
8. **Part II → AnabelianGeometryAndNonabelianChabautyPartIIEtaleHomotopyTypes**, "Anabelian geometry and nonabelian Chabauty, Part II: anabelian geometry with étale homotopy types" (24 items; parent AnabelianGeometryAndNonabelianChabauty, area `arithmeticgeometry`).
   - **Contents:** the paper's own results.
     - Theorems 1.1/3.2, 1.2/4.7, 1.5/6.2, 1.8/7.1, 1.9, 7.2.
     - Corollaries 1.3, 1.6, 1.7.
     - Propositions 4.1, 4.3, 4.4, 4.6, 4.8, 5.1, 5.3, 5.5.
     - Lemmas 5.2, 5.4, 5.6, 6.3.
     - Definitions 4.2 and 6.1.
     - The carrier of possibly affine hyperbolic curves.
     - The constant-field lemmas.
   - **Why a Part II:** the existing anabelian Part II candidates (Bresciani's birational sections, Betts–Stix's period maps) are about Galois sections. This is higher-dimensional reconstruction in the direction of NC.1.

## Source issues (`sourceIssues` E1–E7)

All seven were checked in the published PDF. None is corrected by an erratum.

- **E1 (misprint, proof of Theorem 4.7, p. 837).**
  - **Printed:** "and this shows (a)", at the end of the functoriality computation.
  - **Correction:** "(b)".
- **E2 (misprint, Theorem 4.7(b), p. 835).**
  - **Problem:** the auxiliary variety Z is not required to be smooth.
  - **Correction:** Z must be smooth for r(γ_2): Y → Z to be defined, since Proposition 4.4 needs a smooth target.
- **E3 (misprint, proof of Theorem 6.2, p. 846).**
  - **Printed:** "f r(δ) = r(γ) f = f". This does not type-check, since f: X → Y and r(δ): Y → Y.
  - **Correction:** Proposition 4.8 gives r(δ) f = f r(γ) = f.
- **E4 (misprint, proof of Proposition 5.3, p. 841).**
  - **Printed:** the dense set "contains the preimage of Z".
  - **Correction:** the preimage of Z ∖ {0}. Elements mapping to 0 do not generate an open subgroup.
- **E5 (misprint, proof of Theorem A.13, p. 861).**
  - **Printed:** "τ ∈ π_1^top(Y, x)".
  - **Correction:** π_1^top(Y, y).
- **E6 (gap, proof of Proposition 5.5, p. 844).**
  - **Problem:** Proposition 5.3 is applied to the base-changed γ′ from Lemma 2.2 without checking its hypothesis r(γ′) = id_{X′}. Lemma 2.2 gives no uniqueness.
  - **Fix:** ι′_et γ′ = ι′_et. Theorem 4.7(c) and Theorem 3.2 then give ι′ r(γ′) = ι′, so r(γ′) = id.
- **E7 (misprint, proof of Lemma 6.3, p. 848).**
  - **Problem:** "S_W … the preimage of P(W) under the projection S_W → P(W)" confuses the universal open 𝒮_𝒲 ⊆ P(𝒲) with its fibre.
  - **Correction:** S_W is the fibre of 𝒮_𝒲 over W ∈ Grass_d(V).

The items use the corrected statements.

## Prerequisites not yet covered

1. Mochizuki, *The local pro-p anabelian geometry of curves* (Invent. Math. 138, 1999).
2. Tamagawa, *The Grothendieck conjecture for affine curves* (Compositio 109, 1997).
3. Pop, *On Grothendieck's conjecture of birational anabelian geometry* (Ann. of Math. 139, 1994), and *Alterations and birational anabelian geometry* (2000).
4. Isaksen, *A model structure on the category of pro-simplicial sets* (Trans. AMS 353, 2001), and *Strict model structures for pro-categories* (2004).
5. Friedlander, *Étale Homotopy of Simplicial Schemes* (Annals Studies 104).
6. Artin–Mazur, *Etale Homotopy* (LNM 100).
7. Bousfield–Kan, *Homotopy Limits, Completions and Localizations* (LNM 304).
8. SGA 4, Exposé XI (LNM 305).
9. Deligne–Mumford, *The irreducibility of the space of curves of given genus* (Publ. IHÉS 36).
10. Serre, *Zeta and L functions* (1965).
11. Fried–Jarden, *Field Arithmetic*, 3rd ed.

DOIs were checked against Crossref. Serre's article has no DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHMIDT-STIX-16.result.json` passes.
- The generator asserts that every missing item is routed exactly once.
- Cited stages were checked against data/restructure:
  - RS-29 keeps IG.1's SGA-range exact sequence and specialization, and IG.2's Hilbert irreducibility;
  - RS-07 keeps Chebotarev in AN.4.
- **Checked by hand:**
  - §2: Lemma 2.7, Proposition 2.8.
  - §4: the formula of Proposition 4.1 (on A¹ and G_m), the count in Proposition 4.6, the proof of Theorem 4.7.
  - §5: Propositions 5.1–5.5, including the Riemann–Hurwitz inequality of Lemma 5.4.
  - §§6–7: the induction of Theorem 6.2, Lemma 6.3, the Kummer argument of Theorem 7.2.
  - Appendix: Lemmas A.7, A.14–A.15 and Proposition A.16.
- No Lean was written or compiled; this is an extraction.
