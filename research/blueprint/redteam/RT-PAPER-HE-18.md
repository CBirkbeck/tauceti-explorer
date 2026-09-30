# Red team: PAPER-HE-18 (He, *Cocenters of p-adic groups, I: Newton decomposition*)

Job `RT-PAPER-HE-18` (issue #4254), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-HE-18.result.json`, in the format of PROTOCOL section 17.

**Result:** 10 findings: 6 medium and 4 low.

- **The extraction.** It is careful and heavily repaired: 123 items, 7 routes and 13 source issues.
  - The seven library items check out at the pins.
  - The twisted-commutator identities (H22, H23), the Ω-transport (C17) and the affine separation argument (N19) re-derive by hand.
  - Twelve of the thirteen source issues stand as written.
- **What breaks.**
  - The Kottwitz homomorphism on G itself has no item.
  - The proof of Theorem 23 contains an error that no source issue records.
  - E3's correction wrongly says a Noetherian ring restores Theorem 20.
  - Two definitions have more than one owner: straight elements (three owners) and the cocenter of C_c(G) (two Part IIs).
  - The library audit missed the double-coset Hecke ring at the pins.

## Independence

- **Who did the work.**
  - The extraction was built by Codex sessions `codex-a71f92`, `codex-7e92bd` and `codex-c83e7a` (checkpoints #1761, #1932 and #1991, 22 September). It was finished by Claude Code `cc-fb70e5` (PR #2072, 23 September).
  - The review, REV-PAPER-HE-18, is by Claude Code `cc-7b31c4` (issue #1407, PR #2428).
  - These are the only session ids in the result, the report, the review JSON, the review report and the handoff note. `cc-f805bf` appears in none of them.
  - There is no errata file for this paper.
- **Disclosure.**
  - This session wrote PAPER-LUST-STEVENS-20 (parahorics and types) and PAPER-FARGUES-SCHOLZE-21, which routes B(G) and the Kottwitz map to BunGAndNewtonStrata.
  - It also red-teamed PAPER-KISIN-PAPPAS-18 (PR #4721), whose finding /10 concerned the owners of π₁(G), κ_G and Lang's theorem.
  - Findings 1 and 4 touch κ and BunGAndNewtonStrata. Their evidence here is specific to this paper and to the extractions they name, and neither depends on those earlier deliverables.

## What was read

- **The version of record.** Forum Math. Pi 6 (2018) e2, the open-access PDF from Cambridge Core.
  - Downloaded 30 September; it is stamped per download, so its hash is not reproducible.
  - Read in full through pdftotext.
  - Crossref records no update and no correction.
- **arXiv 1610.04791v3** (8 March 2018).
  - Its hash `605d7e9c…` reproduces the extraction's comparison pin.
  - Read in full. It agrees with the published text at every locator used here, although its numbering is by section: Theorem 6.3 for the published Theorem 23, Remark 2.6 for Remark 8.
  - There are three arXiv versions.
- **Haines–Rapoport**, *On parahoric subgroups* (arXiv 0804.3788): its setup, Proposition 13 and Remark 9, for finding 7.
- **The repository.**
  - All 123 items, the 7 routes, the 13 source issues, the gaps, the audits, the report and the review.
  - The owner layers: RG2.0–RG2.5, SR.0–SR.6, BG0/BG1 and the BunGAndNewtonStrata packet, and the Tau Ceti RootSystems record.
  - The overlapping extractions: He 21, Kisin–Pappas–Zhou 26, Kisin–Zhou 25, van Hoften 24, Fintzen 21, Gan–Harris–Sawin–Beuzart-Plessis 24, Feng 24, Lust–Stevens 20, Hansen–Kaletha–Weinstein 22 and Hansen 26.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`: every cited declaration opened, and the index searched for everything marked missing.

## What holds up

- **E1**, the twisted finiteness failure.
  - Checked for G_m with inversion.
  - Checked independently for PGL₃ with its outer automorphism, which preserves the diagonal torus and the standard Iwahori and acts on Ω = Z/3 by −1.
  - Its repair, C17 and N20, is right: a minimal element is moved into a fixed Ω-coset by Ω-conjugation, which preserves length, and there the length bound of Theorem 7 leaves finitely many elements.
- **E2, E4–E7 and E9–E13** hold at their locators.
- **E3's counterexample** over the square-zero ring holds.
- **Routing.**
  - Every missing item is routed exactly once, and `check_paper.py` reports ok.
  - The route 6 title now reproduces the parent title exactly.
  - Lang's theorem goes to RG2.3, which agrees with Kisin–Pappas 18, Kisin–Zhou 25 and Lipnowski–Tsimerman 18.
- **Motivation only.** The paper's uses of Bernstein–Deligne–Kazhdan, Kazhdan's density theorem, Dat, Henniart–Lemaire and B(G) are all in the introduction, and no proof uses them. They correctly have no items.

## Findings

### Medium

1. **The Kottwitz homomorphism on G has no item** (N8, route 4 or 7).
   - **Where the paper uses it.**
     - Theorem 3's disjointness starts: "It is easy to see that if ν₁ and ν₂ have different Ω_θ-factor, then G(ν₁) ∩ G(ν₂) = ∅" (p. 12).
     - The proof of Theorem 23 defines G^rig_0 = {g : κ(g) ∈ Ω₀} (p. 25).
     - Both need κ_G : G → G/G₀ ≅ Ω, with κ_G(IẇI) = κ(w), and with its image in Ω_θ invariant under twisted conjugation, because κ_G(hgθ(h)⁻¹) = κ_G(g) + (1 − θ)κ_G(h).
   - **What the extraction has.**
     - C1 defines κ only on W̃.
     - A7 constructs only the Tits system.
     - N8's proof step "Distinct κ cannot intersect" therefore rests on no item.
   - **Fix.** Add the item and derive it from A5 and A7. BG1's Kottwitz map is needed only for the identification with π₁(G)_I^σ, which this paper does not use.

2. **A missed error in the proof of Theorem 23, over any coefficients** (source issues; E2's reason).
   - **The step.** After truncating to the θ-stable finite set Ω₀, the paper asserts H̄^rig = (H̄^rig)₀ ⊕ (H̄^rig)₁, and the same for distributions.
   - **Why it fails.**
     - The splitting needs G^rig_0 to be stable under twisted conjugation. That holds only if Ω₀ is a union of (1 − θ)Ω-cosets, and θ-stability does not give this.
     - Instance: PGL₃ with its outer automorphism, f = 1_I and h a length-zero generator. Then ^h f is supported where κ = 2, so [f] = [^h f] lies in both summands.
     - The class is nonzero, because ∫_G is a twisted-invariant distribution that takes the value μ(I) on it.
   - **A second gap in the same paragraph.** The finite set A of 5-tuples is asserted to exist with no argument. The argument needs a linear-compactness (Mittag-Leffler) step.
   - **What survives.** The theorem is not refuted: R16's direct proof avoids both steps. But E2's reason names exactly this truncation as where "the finiteness needed later is produced".
   - **Fix.** Add E14 and E15, and amend E2.

3. **Noetherian coefficients do not restore Theorem 20** (E3 and its review reason).
   - **The claim.** E3's correction says finite generation needs "a field (or a Noetherian coefficient ring)". The review adds that the printed statement "needs R noetherian".
   - **The printed statement is a count.** Theorem 20 says the restriction is generated by N_ν[I:I_n] elements.
   - **Counterexample.**
     - Take R = F₃[x,z]/(xz, z²), G = Q₂^× and ω(g) = (1+z)^{v₂(g)}. Then N_ν[I:I₁] = 1.
     - A twisted-invariant distribution satisfies z·j = 0, so the restriction is Ann_R(z) = (x, z).
     - (x, z) needs 2 generators.
   - **Fix.** Correct the text: over a field the count holds; over a Noetherian ring only finite generation holds. Items F2, F3 and F6 are unaffected.

4. **Straight elements have three owners.**
   - **The three routes.**
     - HE-18 C6/C7 go to the Root-systems Part II.
     - Kisin–Zhou 25 N08/N09/N15 go to BunGAndNewtonStrata BG0/BG1.
     - Van Hoften 24 A08/A09 go to the ADLV Part II of HeckeStacksAndLocalShtukas.
   - **They are the same mathematics.** The definition is the same (the σ-case is θ = σ), and the classification theorem is He–Nie's Theorem 3.3. The B(G) version of the other two is that theorem composed with Kottwitz's classification.
   - **No coalescence recorded.**
     - HE-18's owner audit screened He 21, Kisin–Pappas 18 and Kisin–Pappas–Zhou 26, not these two.
     - None of the three records mentions the others.
     - The BunGAndNewtonStrata packet has no straight-element node.
   - **Fix.** Make route 6 the single owner of the combinatorics. The B(G) step stays at BG1.

5. **The cocenter of C_c(G) is planned twice.**
   - **The two plans.**
     - The NewtonCocenters Part II (H9–H13, N17, F1) plans the twisted action, the commutator submodule, Proposition 1, the cocenter as coinvariants and invariant distributions.
     - SmoothRepresentationsCharactersPartII (Hansen–Kaletha–Weinstein 22, joined by Hansen 26) plans coinvariants of C_c, invariant and trace distributions, the trace Paley–Wiener theorem and Kazhdan's density theorem. The last includes "f is a sum of commutators h(x) − h(gxg⁻¹)".
   - **Neither names the other.** Both are Part IIs of SmoothRepresentationsOfLocalGroups.
   - **Fix.** Name the more general NewtonCocenters Part II as owner of the cocenter and of invariant distributions, with the characters Part II importing the untwisted case.

6. **The library audit missed the double-coset Hecke ring** (H6, L10, §1.2(a)).
   - **What the audit read.** Only lines 1–225 of Tau Ceti's HeckeRing/Basic.lean.
   - **What the pins have.**
     - Mathlib has `IsHeckeTriple` and `HeckeRing`.
     - Tau Ceti has Shimura's `DoubleCoset.multiplicity`, `HeckeCosetModule.mul`, `mul_assoc`, `instRingHeckeRing` and `mul_single_single_of_mulMap_eq`.
   - **How they fit the items.**
     - For compact open K, (K, G) is a Hecke pair. H_R(G,K) with its basis of double cosets (H6) is this ring, and convolution is μ(K) times its product.
     - Proposition 13 (L10) is exactly the hypothesis pattern of `mul_single_single_of_mulMap_eq`.
     - SR.1 says to compare with the library's product rather than introduce a second double-coset multiplication.
   - **Fix.** Restate H6 as that comparison, and cite the declarations.

### Low

7. **E8's diagnosis is too narrow.**
   - The printed lattice X_*(Z)_{Gal} is wrong even when Z is a torus. The right lattice is (X_*(T)_I)^σ, by Haines–Rapoport Proposition 13 and Remark 9.
   - Example: for the unramified U(1), the printed lattice gives Z/2 where the true lattice is 0.
   - The proposed corrections already handle this case. Only the reason and G1 need the sentence.
8. **No `sourceVersions`.**
   - Five source issues quote stated results, so `check_errata.py` requires the field.
   - `data/collation.json` files the paper as preprint-only, although the published version was read in full.
9. **A3 overclaims "planned".**
   - RG2.3 plans "pro-p congruence subgroups", not the barycentric Moy–Prasad filtration with its θ- and Ω-stability.
   - Fintzen 21 and Gan–Harris–Sawin–Beuzart-Plessis 24 mark the filtration missing at the same layers.
10. **Three small omissions from the source-issue record.**
    - G5's non-centrality gap is recorded only as a gap.
    - Remark 8 writes the untwisted "G ·".
    - E1's locator omits the same finiteness claim in §0.6, p. 5.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HE-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
