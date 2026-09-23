# PAPER-BEUZARTPLESSIS-CHAUDOUARD-25: The global Gan–Gross–Prasad conjecture for unitary groups. II. From Eisenstein series to Bessel periods

Raphaël Beuzart-Plessis and Pierre-Henri Chaudouard, *The global Gan–Gross–Prasad conjecture for unitary groups. II. From Eisenstein series to Bessel periods*, [Forum of Mathematics, Pi 13 (2025), e16](https://doi.org/10.1017/fmp.2025.8); arXiv [2302.12331](https://arxiv.org/abs/2302.12331).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1348). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.result.json](PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.result.json). It has:
- 69 items: 8 planned, 61 missing;
- 7 routes: one new Part II, four coalesced candidate routes and two sources of existing layers;
- 34 prerequisite entries;
- 11 recorded source issues.

## Sources read

- **The published version** (2025, open access), read in full. Page numbers below are the journal's.
- **arXiv v1** (February 2023) is the only arXiv version. The published text corrects the statement of Proposition 8.7.2.1; the acknowledgements credit P. Boisseau for the correction.
- **Errata:** Crossref and the Cambridge page show no correction.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it. The one exception: the use of Beuzart-Plessis–Liu–Zhang–Zhu Theorem 4.14 was checked against that paper's source.

## What the paper proves

**It is the sequel to PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 (BPCZ), which settled the discrete case.**

**Eisenstein series.** Theorems 1.2.3.1 and 1.2.4.1 extend the global Gan–Gross–Prasad and Ichino–Ikeda conjectures for U(n) × U(n+1) to periods of Eisenstein series.
- **Parameters covered:** regular Hermitian Arthur parameters Ind(Π_1 ⊠ ⋯ ⊠ Π_r ⊠ Π_0 ⊠ Π*_r ⊠ ⋯ ⊠ Π*_1) that are H-regular. Π_0 is a discrete parameter and the Π_i come in conjugate-dual pairs.
- **The period** is Ichino–Yamana's regularised period of the Eisenstein series built from (P, σ).
- **The L-value** is regularised by (s − ½)^{−dim 𝔞*_Π}.
- **The constant** is |S_Π| = |S_{Π_0}|.

**Bessel periods (§8).** Theorems 1.3.3.1 and 1.3.6.1 give the Gan–Gross–Prasad conjecture and Liu's refined conjecture for Bessel periods of U(m) × U(n+1), with n = m + 2r.
- **The idea:** choose the Eisenstein data Ind(α_1 ⊠ ⋯ ⊠ α_r ⊠ Π_m ⊠ α*_1 ⊠ ⋯ ⊠ α*_r) ⊠ Π_{n+1} and unfold its period to a Bessel period.
- **How it is carried out:** a global unfolding (Proposition 8.5.1.1), a local one with a non-vanishing criterion (Proposition 8.6.1.1), and a local period identity (Proposition 8.6.2.1).
- **The unramified computation** (Proposition 8.7.2.1) combines the Khoury–Liu–Zhang formula for Bessel functions, Shintani's formula and the Cauchy identity, with the Weyl character formula for non-connected groups of Appendix A.

**The trace formulas.** The new spectral contributions are continuous.
- **Unitary side:** J^U_χ = ∫ J^U_{P,π}(λ) dλ (Theorem 3.5.7.1). The proof goes through a new characterisation of J^U_χ by the Ichino–Yamana-truncated kernel (§3.3).
- **Linear side:** I_χ = 2^{−dim 𝔞_L}∫ I_{P,π}(λ) dλ (Theorem 4.1.8.1). It uses general Jacquet–Lapid–Rogawski intertwining periods and Chaudouard's spectral expansion of the Flicker–Rallis period.
- **Whittaker form:** the linear-side contribution is rewritten in Whittaker terms (Theorem 4.2.8.1) through a new formula for the basic intertwining period (Theorem 5.5.1.1).
- **Second proof:** §6 reproves it with Flicker–Rallis zeta integrals.
- **The comparison (Theorem 7.1.6.1)** separates the spectral parameter λ with spherical Hecke operators and Ramakrishnan's theorem.

## What the atlas already has

- **Planned (8 items):**
  - Arthur's partition and F(·, T) (AS.3, AA.3);
  - automorphic forms and the L²-decomposition (AF.2–AF.3, AS.4, AA.2);
  - Eisenstein series (AS.1–AS.2);
  - Shintani's unramified Whittaker functions (AL.3);
  - the Cauchy identity (Tau Ceti SchurWeyl Layer 7, ClassicalGroups Layer 4);
  - Borel–Weil–Bott (Tau Ceti LieGroups Layer 8);
  - Mok/KMSW (ML.4);
  - the GRS descent (ML.5).
- **Pending candidates this paper extends:**
  - `JacquetRallisRelativeTraceComparison` (PAPER-ZHANG-21, PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, BPCZ);
  - `GanGrossPrasadConjecturesForClassicalGroups` (PAPER-JIANG-ZHANG-20 and successors);
  - `AutomorphicLFunctionsPartIIAsaiAndGLnPeriods` (BPCZ);
  - `AutomorphicSpectralTheoryPartIISchwartzMultipliers` (PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, BPCZ).
- **Not planned anywhere:** Weyl's character formula for Ĝ ⋊ Γ and the Atiyah–Bott fixed point formula.

## Routes

1. **Coalesced with `JacquetRallisRelativeTraceComparison` (32 items).** The route keeps the candidate's id, title, parent and area.
   - **What it carries:**
     - the unitary trace formula for Schwartz functions, with the Ichino–Yamana truncation and the regularised periods (§3);
     - the (G, H)-regular linear-side contribution and its Whittaker form (§4, §6.1);
     - the comparison (§7);
     - the reduction of Bessel periods (§8);
     - the four main theorems.
   - **Area:** it keeps the candidate's area `modular`, flagged in its reason as not being a galaxy id.
2. **Coalesced with `GanGrossPrasadConjecturesForClassicalGroups` (9 items):**
   - regular Hermitian parameters;
   - weak base change of (P, σ);
   - H-regularity;
   - the L-value and local periods for induced tempered representations;
   - Bessel data;
   - local Bessel periods and the refined conjecture (Liu; Lapid–Mao);
   - uniqueness of Bessel models;
   - unramified Bessel functions;
   - the tempered local conjecture.
3. **Coalesced with `AutomorphicLFunctionsPartIIAsaiAndGLnPeriods` (13 items):**
   - general intertwining periods and their descent;
   - Chaudouard's expansion and Lemma 4.1.9.1;
   - the Whittaker identities of §4.2;
   - all of §5 (Theorem 5.5.1.1);
   - the Flicker–Rallis period for regular data (§6.2);
   - the factorisation of Whittaker periods.
4. **Coalesced with `AutomorphicSpectralTheoryPartIISchwartzMultipliers` (2 items):** the weights d_Q(λ, g, T) from Arthur's partition, and the kernel expansion for regular data.
5. **New Part II: `LieGroupsPartIITwistedCharacterFormula` (3 items).** Title "Lie groups and the Lie algebra correspondence, Part II: Borel–Weil–Bott and the twisted Weyl character formula for non-connected groups", parent `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups`, area `representations`.
   - **What it carries:** Appendix A (Proposition A.0.2.1, Corollary A.0.2.2) and the Atiyah–Bott fixed point formula.
   - **Why a Part II:** it is a general statement about complex reductive groups. It extends Layer 8 (Borel–Weil–Bott) to non-connected groups ^LG = Ĝ ⋊ Γ, and it would be misplaced inside a trace-formula roadmap.
6. **Source of AL.3 (1 item):** the Kirillov model (Gelfand–Kazhdan; Kemarsky).
7. **Source of ET.6 (1 item):** the classification of generic unitary representations of GL_n. This coalesces with PAPER-JIANG-ZHANG-20's ET.6 route.

## Source issues (`sourceIssues` E1–E11)

**Gap (E1): assertion 2 of Lemma 7.1.7.1 (p. 67).**
- **What the paper cites.** It takes the compatibility of archimedean infinitesimal characters from Beuzart-Plessis–Liu–Zhang–Zhu Theorem 4.14(4), applied to ρ.
- **Where the gap is.** The unitary part of ρ has base change Π_0, a discrete Hermitian parameter that need not be cuspidal. That is exactly where the printed proof of BPLZZ Theorem 4.14(4) has a gap (PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/E1). The same step was recorded in BPCZ (E1).
- **The fix.** Repair BPLZZ Proposition 4.13(1) with its Theorem 3.19, or take the statement from Mok and KMSW.
- **What it affects.** Only the proof.

**Misprints.**
- E2: (s − 1)^{−dim 𝔞*_Π} should be (s − 1)^{+dim 𝔞*_Π} in §1.2.4.
- E3: G♭ = G_m × G_{2n+1} should be G_m × G_{n+1} in Theorem 1.3.3.1.
- E4: Remark 1.3.3.2 refers Theorem 1.3.3.1 to itself; the intended reference is Theorem 1.2.3.1.
- E5: P″ ⊂ U′ should be P″ ⊂ U″ in §3.1.4.
- E6: 𝔛(G) should be 𝔛(U) in Theorem 3.4.2.1 and Corollary 3.4.2.2.
- E7: ⟨·,·⟩_Pet should be ⟨·,·⟩_Whitt in (4.2.8.1).
- E8: the measure factor of the base-change map in Remark 7.1.5.1 should be 2^{−dim 𝔞^L_M}.
  - **Why:** (7.1.7.3) and (7.1.6.1) use 2^{−dim 𝔞^L_M}, and a rank-one computation confirms it.
- E9: L^{S_0} should be L^{S_0,*} in (7.3.1.1).
- E10: two citation numbers are wrong: [BLZZ21, 3.17] should be 3.19, and [BPCZ22, 2.8.41] should be 2.8.4.1.
- E11: index slips in §§4.1.5, 7.1.7, 7.3.1 and 8.2.1.

## Prerequisites not yet covered

Thirty-four entries. DOIs were confirmed on Crossref except for four:
- Khoury's thesis and Casselman–Shalika have none;
- Chaudouard 2022 and Ramakrishnan are given by their arXiv ids.

The entries by topic:
- **New to this paper:**
  - Ichino–Yamana 2019;
  - Chaudouard 2022;
  - Y. Liu 2016; Lapid–Mao 2015;
  - Khoury; L. Zhang 2018; Shintani; Casselman–Shalika;
  - Atiyah–Bott 1968; Bump;
  - Aizenbud–Gourevitch–Rallis–Schiffmann; Jiang–Sun–Zhu;
  - Cowling–Haagerup–Howe; Waldspurger 2003;
  - Flicker 1992;
  - Badulescu–Renard; Zelevinsky;
  - Jacquet–Piatetski-Shapiro–Shalika 1979;
  - Müller 1998;
  - Kemarsky.
- **Shared with BPCZ:** Zydor; Chaudouard–Zydor; Jacquet–Lapid–Rogawski; Lapid 2006; Feigon–Lapid–Offen; Beuzart-Plessis (Astérisque 418, Invent. 2021, Asai); W. Zhang (two papers); Xue; Harris; Ramakrishnan; and BPCZ itself.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.result.json` reports no errors.
