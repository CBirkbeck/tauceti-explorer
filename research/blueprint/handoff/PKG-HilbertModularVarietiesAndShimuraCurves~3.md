# PKG-HilbertModularVarietiesAndShimuraCurves~3

Agent: Claude (Opus 5.5), session `claude-xQYQ6I`, 2026-10-14. Refs #9761. Revision round 3 of the package. It answers REV-PKG-HilbertModularVarietiesAndShimuraCurves~2, which returned the package for five mathematical defects. `review.json` is left in place for the next reviewer. No packet was edited.

## The five defects and how they are answered

1. **§H6.5 had no usable local realization contract.** H6.5 now carries Taylor's full input contract, (C1)–(C6). It states:
   - the residual data, and the Weil numbers β_v with the characters χ̃_v at l;
   - the auxiliary prime p with α_w, and the CM character ψ on L;
   - the CM coefficient field N, its real subfield M, the primes λ and ℘, and why λ_M and ℘_M split in N;
   - an ordered class condition.

   It then gives four conclusions with both torsion comparisons derived:
   - (O1) the multiplicative case χ_v²=1, through the Tate HBAV of Rapoport §2.9;
   - (O2) the ordinary case χ_v²≠1: Honda–Tate, the Serre tensor to O_N, the class adjustment, Serre–Tate lifting through H¹_f, and descent from F̃_v with H²=0;
   - (O3) the place w|p, which Taylor leaves to the reader;
   - (O4) matching of the fixed alternating forms. On a non-split λ-part this needs a rescaling of the extension class, because the only automorphisms there are scalars.

   §§H6.1–H6.2 now allow a prime-ideal level 𝔫_i above ℓ_i (Taylor's moduli use A[λ_M] and A[℘_M]), with the fineness argument. Sources read: Tay02 pp.5–13, Rap78 pp.271–275.
2. **R18.3.29 and R18.4.27 lacked their early Galois inputs.**
   - Primary locators: Carayol, Theorem A and §§0.3–0.5; Taylor 1989, Theorem 2 (existence when [F:ℚ] is even); Saito, Theorems 0 and 1; Kisin 2008, §(4.1) and Theorem (4.3), which gives the l-adic compatibility, including the even-degree case, under residual absolute irreducibility; EGS15 §6.2; KW09 §7, p.60 and §9, pp.80–81.
   - R18.3.29 now has an explicit normalization paragraph. The geometric convention of Carayol, Saito, Kisin, MS and EGS is converted to KW's arithmetic one: the arithmetic ρ is the contragredient, which keeps the characteristic polynomial and inverts the determinant, and the arithmetic and geometric reciprocity versions of ψ are related.
   - Narrowed: local compatibility at non-discrete-series places v∤p, for even degree when π has no finite discrete series, is not asserted. No target here needs it. The Steinberg places and the D-ramified places all satisfy Carayol's hypothesis. R18.6 states the narrowing.
   - R18.4.27: for a quaternion algebra split at exactly one real place, Carayol's hypothesis always holds. The v|l condition comes from Saito Theorem 1 (or Kisin 4.3) together with MS §3.6's choice of L′, and the factorization through the local quotients follows from the reducedness and O-flatness of T.
3. **R18.2.14 and R18.2.17–18 at ramified places.**
   - R18.2.14 now constructs the saturated filtration: W^t=ω_{H^t}/J·D(H) inside M=D(H)/J·D(H), with J the kernel of O_v⊗O_X→O_X. Exactness comes from strictness and local freeness from the fibrewise flatness criterion. The tangent identification with Hom_{O_B}(W^t, Lie) comes from first-order Grothendieck–Messing plus strictness, followed by YZ's determinant computation, the extension across the nodes, and algebraization by Grothendieck existence. So the ramified Kodaira–Spencer case is supplied from the absolute crystal of CR.7 alone.
   - R18.2.17–18 are restricted to F_v/ℚ_p unramified. YZ's τ-quotients (p.575) are not exact at ramified v, and H″ is not strict, so the saturated construction does not apply.
   - The node equations xy=π_v (X_v) and xy=π_{K′}^e (the bridge model) are stated, and no regularity of the bridge model is claimed.
   - R18.6 and "Points the sources leave open" record the restriction. The only downstream package citation of R18.2 Hodge material, GrossZagierAndArithmeticHeights, uses R18.2.12, which is unaffected.
4. **§H3.8 Hecke descent.** H3.8 now gives the Kisin–Lai §1.9–1.10 argument (author DVI pp.7–9), read from the author's page:
   - hypotheses: D finite étale, étale locally ⊕O/b_i, disjoint from μ_N, over ℤ[1/N];
   - the cyclic construction of λ′ via the Cartier dual of A[b]/D, with uniqueness via BHW (8.7);
   - classes [ε] modulo U_N² and the u⁻¹ isomorphism;
   - representability, and the union over narrow class representatives;
   - O-linearity in λ and descent to the arithmetic quotient.
5. **R18.4.19 Kisin's quotient.** Read from the AMS copy (free). R18.4.19 cites:
   - Theorem (2.7.6), p.534, and Corollary (2.6.2), p.532 (with the introduction's theorem, pp.513–514);
   - §(3.3.3) and Theorem (3.3.4), p.540, for the framed ring, the dimension and the dense formally smooth open subscheme;
   - MS (1), p.13, for the fixed-determinant conversion.

   It constructs the reduced O-flat quotient explicitly as the image of R^□ in the reduced Kisin quotient, instead of from a set of allowed points. Dimensions: generic fibre 4+[F_v:ℚ_l] framed, then 3+[F_v:ℚ_l] with the determinant fixed; the Krull dimension of R_v is 4+[F_v:ℚ_l]. One new API name, `local_l_dimension`.

The reviewer's general point, that the supplier extensions must stay visibly conditional, is also answered. The Summary and §R18.5.15 now say that the Čerednik–Drinfeld and Ihara end theorems rest on the AdicSpacesPartII, PELModuli and DeformationAndDerivedPatchingAlgebra extensions, and the patching targets already said so. The R18.4.32 Check that called the two l-adic inputs open points now names them as sourced inputs.

Other README edits:
- Supplier contracts: CR.7 is now described accurately (absolute crystal and Grothendieck–Messing; nothing O_v-relative required). NeronModels R11.3 (polarized rigid uniformization, §3.14) is added for the Tate HBAV.
- Layer Dependencies are updated for H3, H6 and R18.3 part 2.
- References: KL05, Kis08, Rap78, Tay89 added.
- "Points the sources leave open" no longer lists the four closed items (even-degree/weight-two inputs, Kisin's quotient, H6.5 contract, H3.8 descent). It adds Taylor's narrow-class point and the ramified bridge restriction.

## Points for the plan and the errata register

Packets not edited:
- **Plan revisions suggested.**
  - R18.2 packet: `bridge-filtered-crystal` and `bridge-determinant` should carry the unramified hypothesis, and `integral-kodaira-spencer` the saturated construction.
  - R18.3/R18.4 packets: add Kis08, Tay89 and Sai09 Theorem 1 to the early-compatibility and local-model nodes, and narrow the even-degree clause as in R18.3.29.
  - H0 packet: `hilbert-finite-local-points` still lists AbelianSchemesAndArithmeticModuliPartII:F3 (an upward prerequisite the package does not use).
  - CrystallineCohomology's open request 14 from this roadmap (strict O_v-relative crystals) can be reduced to the absolute crystal and Grothendieck–Messing, which CR.7 has.
- **Errata candidates.**
  - Tay02 p.11: the norm-surjectivity argument uses the wide Hilbert class field, but the ordered isomorphism j needs the narrow class group. This matters when N is contained in the narrow Hilbert class field of M. For example, l=5 and k=𝔽₅ give N₀=ℚ(i, √−19), the narrow Hilbert class field of ℚ(√19); if Taylor's N is N₀ the argument fails (README H6 Examples).
  - Tay02 p.12: Lemma 1.2's last line says "/K" for "/F_v", and Lemma 1.3 writes A_v for A_w.
  - YZ18 p.570: in the proof of Theorem 4.10, "exactly one of j₁, j₂ is an isomorphism" fails at the nodes.
  - YZ18 p.575: the τ-quotients are taken without a ramification hypothesis.

## Checks run

- `lean-check research/blueprint/packages/HilbertModularVarietiesAndShimuraCurves/Suggested.lean`: exit 0, exactly 40 `declaration uses 'sorry'` warnings, no errors or other warnings (Mathlib 082e2d3 / Tau Ceti f790474; more than 80 GB free). The file is unchanged (716 lines); the five defects are README targets whose carriers are not at the pins. `scripts/check_sorry_data.py` passes.
- README scripts:
  - every internal anchor resolves;
  - every internal *Needs* target is earlier in the document, so the Needs graph is acyclic;
  - every API and test name of the five packets is still present (0 missing).
- `python3 research/blueprint/intake.py check-files` on the three package files and this note: 0 problems.
- Sources read this round, with SHA-256 of the copies:
  - Tay02, KW09, MS19, YZ18, Car86a, BHW23, Sai09: the same hashes as the round-2 review table.
  - Kis08, AMS free PDF: `3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556`.
  - KL05, author DVI `hmf.dvi`, read with a small DVI text extractor: `25471ca282ba5d0bba346d1f8504ce99b1c6184f61bdf17e891a3f807ae9392c`.
  - Rap78, Numdam: `dfeb77d0770efc6e05bfea6ddefd4b84ea60892d46f0c5780ef973bcf3025841`.
  - Tay89, GDZ scan, pp.265–266 read as images: `499da39a6bc9bd3becc963b98e9dac773b18386690756ec4051a5e4ebe2cc3c5`.
  - EGS15, arXiv v3: `5bc8520f1317af40af528efc8e7c1ab810351c5397872b7e4ee9256b2e97a1e1`.
- Locator check of every new citation, done by a Sonnet agent against the downloaded texts: all confirmed except three page ranges, which were corrected before submission. Rap78 §§2.9.1–2.9.6 is pp.273–274; MS §3.6's choice of L′ is on p.18 (cited pp.17–18); Taylor's choice of M is at the top of p.10 (cited pp.6–10). Two further corrections from my own check: BHW23 Lemma 8.22 starts on p.1776 (was pp.1777–1778), and the H3.7 locator for the ideal dependence in §8.4.1 is p.1776 (was pp.1777–1778).

## What remains

Nothing in this job. The open mathematical obligations are listed in the README section "Points the sources leave open": Khare's Duke Lemma 2.2, the KW Lemma 7.2(i) sign case, Taylor's narrow-class step (now hypothesis (C6)), the algebraic-space status of the global DP model, the ramified bridge comparison, and the AdicSpacesPartII and PELModuli extensions.
