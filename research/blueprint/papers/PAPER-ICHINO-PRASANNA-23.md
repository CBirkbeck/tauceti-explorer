# PAPER-ICHINO-PRASANNA-23: extraction and routing

Issue #1375. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Atsushi Ichino and Kartik Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*, Forum of Mathematics, Pi 11 (2023), e22, 1–135 (doi 10.1017/fmp.2023.20; arXiv 1806.10563).

The result has **120 items**:

- 2 library items: pure Hodge structures with their morphisms, and Tate twists, tensor products and duals (both in Tau Ceti's `TauCeti.Hodge`);
- 13 planned items, which the atlas plans in its Shimura, metaplectic, GL(2)-transfer, Arthur-classification, motives and scheme-cohomology roadmaps;
- 105 missing items, routed as follows:
  - 62 to a **new roadmap**, *Hodge classes realizing the Jacquet–Langlands correspondence* (`HodgeClassesForJacquetLanglands`, area `motives`);
  - 7 to a **Part II of ShimuraVarieties**, *cohomology of automorphic local systems and its Hodge and ℓ-adic realizations*;
  - 4 to a **Part II of HilbertModularVarietiesAndShimuraCurves**, *quaternionic Shimura varieties with arbitrary split set*;
  - 7 to **MetaplecticAutomorphicFormsPartIIShimuraWaldspurger**, the theta-correspondence Part II proposed by the Gan–Ichino extraction;
  - 19 as a **source** of MetaplecticAutomorphicForms MP.3–MP.4 (Howe duality, first occurrence, local theta lifts, and the splittings of Appendix A);
  - 2 as a **source** of AutomorphicFormsOnReductiveGroups AF.4 (Vogan–Zuckerman modules);
  - 1 as a **source** of ModularityAndLanglandsExtensions ML.4 (Adams–Johnson packets);
  - 2 as a **source** of MotivesAndAlgebraicCycles MC.2 and MC.7 (the realization category and Hodge–Tate classes);
  - 1 as a **source** of GeometryOfNumbersAndQuadraticArithmetic GN.2 (Eichler's norm theorem).

Eight mistakes are recorded under `sourceIssues`:

- a gap in the proof of Theorem 12.4(ii), which the report repairs (E8);
- a false claim that is never used (E4);
- a definitional gap (E1);
- five misprints (E2, E3, E5–E7).

## What the paper proves

1. **The main theorem (Theorems 1, 3.2, 12.4).**
   - The setting:
     - B_1 and B_2 are quaternion algebras over a totally real field F, split at the same set Σ of infinite places and both ramified at some infinite place;
     - π is a Hilbert newform of even weights k_v ≥ 2 and trivial central character that transfers to both algebras.
   - The π-isotypic middle cohomology V_{B_1,π_1} and V_{B_2,π_2} of the two quaternionic Shimura varieties are isomorphic as L-Hodge structures, L = ℚ(π). The isomorphism is induced by a Hodge class ξ_0 on the product.
   - If Kottwitz's conjecture holds for unitary similitude Shimura varieties, then ξ_0 can be taken Hodge–Tate, so its ℓ-adic realizations are Gal(ℚ̄/F_Σ)-equivariant.
   - Theorem 1 is the case of parallel weight 2 and rational eigenvalues.
   - The proof gives an independent proof of the known Galois isomorphism (1.2).
2. **Exceptional isomorphisms (§§5–6).**
   - Let 𝕍 be a four-dimensional hermitian space over a CM extension E/F. Then ∧²𝕍 carries a conjugate-linear L with L² = vol(𝕍) (Proposition 5.3), so it becomes a three-dimensional skew-hermitian space Ṽ over a quaternion algebra B.
   - ∧² gives an isogeny GSU_E(𝕍) → GU_B(Ṽ)^0 with kernel ±1 and an isomorphism PGU_E(𝕍) ≅ PGU_B(Ṽ)^0 (Propositions 5.6–5.7).
   - For 𝕍 = B_1 ⊕ B_2 these restrict to G(U_E(𝕍_1) × U_E(𝕍_2))/E^× ≅ G((B_1^× × B_2^×)/F^× × E^×)/F^× (Propositions 5.10–5.13, Example 5.14). At the real places they become the pair GU(2,2) and GSO(4,2) (Lemmas 6.1–6.2, Corollary 6.3).
3. **The class.**
   - A Kudla–Millson/Funke–Millson Schwartz form on O(4,2)^d × O(0,6)^{n−d} (§8) is theta-lifted from an auxiliary form τ on B^× (§10.4).
   - The lift is restricted to Sh_{B_1} × Sh_{B_2}, twisted by a character η, pushed forward, and contracted with the Hodge-type vectors.
   - Its non-vanishing (Proposition 10.1) comes from explicit restriction formulas (Propositions 8.1–8.2) and a seesaw (10.8). The seesaw reduces it to a triple product integral θ(f_1 ⊠ f_2) · θ(η) · φ on B^×, made non-zero one factor at a time (Lemmas 10.3–10.8).
4. **Hodge type and Galois action (§11).**
   - The Hecke eigenspace H^{2d}[Π^S] is purely of type (d, d) (Propositions 11.4, 11.6). The proof identifies the local components at Σ with the U(2,2) Adams–Johnson packet (Proposition 11.2) and computes Hodge types by Zucker's method.
   - The paper also gives a route that avoids the Kaletha–Minguez–Shin–White classification, through the near-equivalence Proposition 9.5, which is proved with the Rallis inner product formula.
   - Kottwitz's conjecture makes the semisimplified Galois action trivial (Proposition 11.9, §11.5). Since H^1_g(k, ℚ_ℓ) = 0, the action itself is trivial (Remark 11.10, Proposition 11.8).
5. **Splittings (Appendix A).**
   - A splitting of the metaplectic cover over the similitude dual pairs (GU(V)^0, B^×) of quaternionic spaces (Proposition A.1), built by doubling from Kudla's splittings.
   - Compatibility with seesaws, with the authors' Periods I and II (Proposition A.14, Lemma A.13) and with Harris–Kudla (Proposition A.25).

## Sources inspected

- **The published article** is open access (received 25 August 2020, revised 14 April 2023, accepted 29 June 2023).
  - Its 135-page PDF (SHA-256 `2c7e4896…a2fcabf3`) was read in full.
  - The publisher stamps every download, so a fresh download has another hash. A second download on 23 September 2026 had the same text layer apart from the stamp.
  - **Locators give the published numbering and pages.**
- **arXiv 1806.10563v2** (10 July 2023, "revised version following referee reports… to be published in Forum of Math, Pi") and its TeX source were used to read the statements exactly.
  - PDF SHA-256 `058fda94…f828aad5`; source SHA-256 `4a631214…baf7657f`.
  - The statement numbers were simulated from the TeX counters and matched against every numbered heading of the published PDF. The texts agree.
- **Crossref** has no correction or update relation for the DOI, and the journal page links no erratum.
- The DOIs of the prerequisites were checked on Crossref.

All sources were accessed on 23 September 2026.

## Mistakes found (`sourceIssues`)

**A gap in the proof (E8), with a repair.**

- **The claim.** The proof of Theorem 12.4 (p. 99) replaces the component class c_η by a ℚ-rational combination c of component classes and asserts that "the action of Gal(ℚ̄/F_Σ) on the components of Sh_{𝒢̃_B} is trivial".
- **Why it is false.** Through the map to the torus Shimura variety Sh(T_1, h_1), Galois acts on components by translation by the central elements ([s, s], s), s ∈ 𝔸_{ℚ,f}^×. For small level these translations are non-trivial: the closure of T_1(ℚ) in a compact open subgroup is topologically finitely generated, and an open subgroup of Ẑ^× is not.
- **The repair.** Galois does fix c_η itself, because η is trivial on 𝔸_F^×. So choose c inside the Galois-invariant ℚ-subspace spanned by combinations of component classes. The determinant argument still applies there.
- **Reach.** Only the conditional parts (ii) of Theorems 1, 3.2 and 12.4 depend on this step.

**An error with no consequence (E4).** §4.3 says that the components of Sh_{𝒢̃_B} are in bijection with Sh(T_1, h_1). The derived group (B_1^{(1)} × B_2^{(1)})/{±1} is not simply connected, so there is only a map (Deligne 1979, 2.1.3), as for PGL_2. Only the map is used.

**A definitional gap (E1).** §2.1.1 defines L-Hodge structures using complex conjugation on V ⊗_L ℂ, which exists only when L ⊂ ℝ. Every coefficient field the paper uses is totally real.

**Misprints, each with reach "nothing":**

- **E2 (§3.2, p. 19).** "Concentrated in degree 2d" should be degree d.
- **E3 (§4.1, rotated diagram, p. 22).** U_E(V^♯_0) should be U_B(V^♯_0), twice.
- **E5 (§4.3, p. 24).** The character η is declared on E^{(1)}\𝔸_E^{(1)} but evaluated on (t_1t_2)^{-1}α, which is not of norm 1. It should be a character of 𝔸_E^×/E^× trivial on 𝔸_F^×, as in §10.4.
- **E6 (Proposition A.1(i), p. 101).** s(g_2) should be s_v(g_2).
- **E7 (proof of Proposition 11.6, p. 88).** A closing parenthesis is missing.

## What the atlas and the libraries already have

- **Libraries.**
  - Tau Ceti has pure Hodge structures in exactly the paper's form: a filtration opposed to its conjugate. It also has morphisms, Tate twists, tensor products, duals, internal Hom and rational substructures (`TauCeti/Geometry/Hodge`).
  - Mathlib has quaternion algebras, the determinant pairing ∧^r(V^*) ≅ (∧^r V)^* (`exteriorPower.pairingDual`), the Schwartz space and its Fourier transform, Hilbert 90, finiteness of the class group and Morita equivalence. These are cited in notes.
  - Neither library has Shimura varieties, variations of Hodge structure, (𝔤, K)-cohomology, unitary similitude groups over a quadratic extension, the Weil representation or étale cohomology of varieties.
- **Planned in the atlas.**
  - Shimura data and reflex fields (ShimuraData D3–D4), the analytic tower (ShimuraVarieties V1), and abelian-type canonical models with Hecke correspondences (V6, V8).
  - Matsushima's formula, from ALS.5 with AutomorphicSpectralTheory AS.4–AS.5.
  - Artin's comparison theorem (SchemeAndStackFoundations SF.6).
  - The classification of hermitian spaces (GN.2).
  - Quaternion algebras and their Brauer classes (Tau Ceti roadmap Class field theory, layer 10).
  - Hilbert newforms, their Galois representations, and the Jacquet–Langlands, base-change and automorphic-induction transfers (GL2AutomorphicRepresentationsAndTransfer R16–R17, AutomorphicGaloisRepresentations R19.2).
  - Arthur's classification for unitary groups (ML.4).
  - The Schrödinger model, Rao's cocycle and Kudla's splittings (MetaplecticAutomorphicForms MP.0–MP.3).
  - Typed Hodge and Tate conjectures (MC.7).
- **Missing.**
  - The ℓ-adic cohomology of general Shimura varieties with coefficients (AG2.1a covers only compact PEL unitary ones), its comparison with Betti cohomology, and its Hodge types.
  - Quaternionic Shimura varieties beyond curves.
  - Exceptional isomorphisms of unitary and quaternionic groups.
  - Kudla–Millson forms and the Fock model.
  - The quaternionic doubling method, the Siegel–Weil formula and the Rallis inner product formula.
  - Vogan–Zuckerman modules and Adams–Johnson packets.
  - Kottwitz's conjecture.
  - The whole construction of the class.

## Routes

1. **New roadmap `HodgeClassesForJacquetLanglands`** (62 items, area `motives`).
   - It contains the paper's own line:
     - the groups of §4 and their Shimura data;
     - the exceptional isomorphisms of §§5–6;
     - harmonic polynomials, the Fock model and the Kudla–Millson forms with their restriction formulas;
     - the specific theta lifts of §9 (Lemmas 9.1–9.2, Proposition 9.5, Lemma 9.6);
     - all of §10;
     - the U(2,2) packet, Hodge types and Galois computations of §11;
     - §12 and the main theorems, each (i) and (ii) part separately.
   - Nothing in the atlas goes in this direction, so it is a new roadmap in the motives area. The brief carries Kottwitz's conjecture as an explicit hypothesis and the corrected argument of E8.
2. **Part II of ShimuraVarieties** (7 items).
   - It covers:
     - automorphic ℓ-adic local systems and the Hecke-equivariant Betti–étale comparison (2.1);
     - isotypic parts and eigenspaces;
     - Zucker's Hodge types;
     - pullback and pushforward in 𝓜_E^L, and the central-quotient comparison of §4.4;
     - Tits's rational structures;
     - Kottwitz's conjecture as a typed statement.
   - These continue ShimuraVarieties from the tower to its cohomology. The brief asks for AG2.1a to become the PEL instance, not a parallel construction.
3. **Part II of HilbertModularVarietiesAndShimuraCurves** (4 items).
   - It covers:
     - quaternionic Shimura varieties for an arbitrary split set Σ, with reflex field F_Σ;
     - their local systems and Waldspurger's rationality;
     - the isotypic realizations V_{B,π_B};
     - the tensor-induction description (1.1) of their cohomology (Langlands, Brylinski–Labesse, Carayol, Reimann, Nekovář).
   - The roadmap now stops at Shimura curves (R18.1).
4. **MetaplecticAutomorphicFormsPartIIShimuraWaldspurger** (7 items), the Part II proposed by the Gan–Ichino extraction.
   - This paper adds:
     - global theta lifts for quaternionic similitude dual pairs and their irreducibility (Lemma 9.3);
     - the doubling method for U(V)^0: the seesaw (9.1), the degenerate principal series and intertwining operators, and Lemmas 9.7–9.8;
     - the doubling zeta identity (9.3);
     - Yamana's Siegel–Weil formula;
     - the Rallis inner product formula for unitary groups.
   - Gan–Ichino's brief already puts the Rallis inner product formula there as general theta theory.
5. **Source of MetaplecticAutomorphicForms MP.3–MP.4** (19 items).
   - It covers:
     - Howe duality, including the quaternionic case of Gan–Sun, and its similitude extension;
     - the conservation relation and the stable range;
     - J.-S. Li's and Adams's archimedean lifts;
     - the unramified lift of Lemma 9.4;
     - the whole of Appendix A (Proposition A.1, its construction, and its compatibilities).
   - MP.3 owns the splittings of the cover over dual pairs and the local theta modules; MP.4 owns the adelic product formula.
6. **Source of AF.4** for the Vogan–Zuckerman modules and their Hodge-graded cohomology.
7. **Source of ML.4** for the identification of Adams–Johnson packets with Arthur packets (following PAPER-CHENEVIER-TAIBI-20).
8. **Source of MC.2 and MC.7** for the category 𝓜_k^L and Hodge–Tate classes.
9. **Source of GN.2** for Eichler's norm theorem.

## Judgement calls for the reviewer

- **The area of the new roadmap.** `motives` rather than `automorphic`: the result is about Hodge and Tate classes, and the automorphic machinery is imported.
- **Kudla–Millson forms and the Fock model** stay in the new roadmap. No other roadmap or pending proposal owns them yet. A later extraction from the Kudla programme may want to move them.
- **Appendix A** is routed as a source of MP.3–MP.4, not into the new roadmap. It is a statement about splittings of the metaplectic cover over dual pairs, which is MP.3's subject.
- **Matsushima's formula** is marked planned through ALS.5, AS.4 and AS.5 together. No single stage states it.
- **Artin's comparison theorem** is marked planned at SF.6 ("interface comparisons to … analytic and l-adic owners"). The reviewer may prefer to route it with the ShimuraVarieties Part II.
- **E4 and E8** are new findings. Both are argued in the result file.
- **Not extracted as items:**
  - the outline in §1.2;
  - the non-self-dual case sketched in §1.3.2 (not proved in the paper);
  - the remarks on absolute Hodge classes and unitary functoriality in §§1.3.3–1.3.4, which are recorded in the context item on the conjectures.

## Prerequisites not yet covered by the atlas

These are listed in the result file with verified links:

- Ichino–Prasanna, *Periods of quaternionic Shimura varieties I*: its splittings, Morita theory and seesaw spaces are used throughout;
- Yamana's Siegel–Weil and doubling papers;
- Kudla's splittings (1994) and Rao's cocycle;
- Kudla–Millson and Funke–Millson;
- Vogan–Zuckerman, Adams–Johnson and Arancibia–Mœglin–Renard;
- J.-S. Li (1990) and Zucker (1981);
- Kaletha–Minguez–Shin–White, Kottwitz (1990, 1992) and Kisin–Shin–Zhu;
- Nekovář (2018);
- Sun–Zhu with Gan–Sun, and Roberts;
- Harris–Kudla (1992);
- Gan–Qiu–Takeda with Ichino (2007);
- Waldspurger (1985) and Repka (1978).
