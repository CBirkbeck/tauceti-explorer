# PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22: The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case

Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, *The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case*, [Publications mathématiques de l'IHÉS 135 (2022), 183–336](https://doi.org/10.1007/s10240-021-00129-1); arXiv [2007.05601](https://arxiv.org/abs/2007.05601).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1446). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22.result.json](PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22.result.json). It has:
- 115 items: 2 in Mathlib, 14 planned, 99 missing;
- 7 routes: one new Part II, three coalesced candidate routes and three sources of existing layers;
- 40 prerequisite entries;
- 10 recorded source issues.

## Sources read

- **The published version**, read in full. It is open access (CC BY 4.0) on Centre Mersenne. Page numbers below are the journal's.
- **arXiv v1** (July 2020) is the only arXiv version. The published text revises it substantially: it adds §3 on Schwartz test functions and the second proof of §8.
- **Beuzart-Plessis–Liu–Zhang–Zhu.** To check this paper's citations of it, its arXiv v1, v2 and v3 were compared, including the source of its Proposition 4.13 and Theorem 4.14.
- **Errata:** Crossref records no correction or update, and the Centre Mersenne article page lists none.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it: Zydor, Chaudouard–Zydor, Ichino–Yamana, Jacquet–Lapid–Rogawski, Lapid, Flicker, Feigon–Lapid–Offen, Beuzart-Plessis, Harris, Mok, KMSW and the others.

## What the paper proves

**The endoscopic cases of the conjectures.** Beuzart-Plessis–Liu–Zhang–Zhu proved the global Gan–Gross–Prasad and Ichino–Ikeda conjectures for U(n) × U(n+1) when the base change Π is cuspidal. This paper removes that restriction. Π may be any Hermitian Arthur parameter Ind(Π_1 ⊠ ⋯ ⊠ Π_r), an isobaric sum of distinct conjugate self-dual cuspidal representations with the right Asai pole.
- **Theorem 1.1.5.1:** L(½, Π) ≠ 0 if and only if some cuspidal σ on some U_h, with weak base change Π, has a non-zero unitary period.
- **Theorem 1.1.6.1:** for σ tempered everywhere, |𝒫_h(φ)|²/(φ, φ) = |S_Π|^{−1}𝓛(½, σ)∏_v P♮_v, with |S_Π| = 2^{r_n + r_{n+1}}, one factor 2 per cuspidal block.
- **Theorem 1.1.5.3:** a non-vanishing corollary.

**The new work is on the linear side** of the Jacquet–Rallis comparison, for G = GL_n(A_E) × GL_{n+1}(A_E).
- **§3** extends Zydor's coarse spectral expansion I = Σ_χ I_χ to Schwartz test functions. It gives three truncated expressions for each I_χ, with sharp asymptotics of modified kernels.
- **The main technical result.** For the ∗-regular cuspidal datum χ of Π, the contribution is purely discrete: I_χ = 2^{−dim a_P}I_Π, where I_Π is the Whittaker relative character built from the Rankin–Selberg functional λ and the Flicker functional β_η. In the Arthur–Selberg trace formula the same datum contributes purely continuously.
- **It is proved twice:**
  - *by truncation* (§§4–5): Jacquet–Lapid–Rogawski intertwining periods, their (G, M)-families and the Ichino–Yamana regularised Rankin–Selberg period;
  - *by zeta integrals* (§§6–8): the residue at s = 1 of Flicker's Asai integral, and a canonical extension of the Rankin–Selberg period to moderate-growth functions, using vector-valued Phragmén–Lindelöf principles.
- **§9** proves the local identity behind J_η = β_η, a twisted version of the Feigon–Lapid–Offen unfolding.
- **§10** assembles the comparison with the isolation multipliers of Beuzart-Plessis–Liu–Zhang–Zhu.

## What the atlas already has

- **In Mathlib (2 items):**
  - Banach–Steinhaus for barrelled spaces (`WithSeminorms.banach_steinhaus`, `PolynormableSpace.banach_steinhaus`);
  - the Phragmén–Lindelöf principle in a strip (`PhragmenLindelof.vertical_strip`).
- **Planned (14 items):**
  - Arthur's notation, Tamagawa measures, heights and reduction theory (AdelicAlgebraicGroups AA.2–AA.3, AF.0);
  - automorphic forms, cuspidal representations and Casselman–Wallach globalisation (AF.1–AF.3);
  - cuspidal data and the L²-decomposition (AS.4);
  - Eisenstein series and intertwining operators (AS.1–AS.2);
  - Arthur's F(·, T) (AS.3);
  - global Whittaker models and Jacquet–Piatetski-Shapiro–Shalika (AL.3);
  - Mok/KMSW (ML.4);
  - the Ginzburg–Rallis–Soudry descent (ML.5).
- **Pending in candidates:**
  - the Jacquet–Rallis comparison (`JacquetRallisRelativeTraceComparison`, PAPER-ZHANG-21 and PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21);
  - Schwartz multipliers and isolation (`AutomorphicSpectralTheoryPartIISchwartzMultipliers`, PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21);
  - the Gan–Gross–Prasad framework (`GanGrossPrasadConjecturesForClassicalGroups`, PAPER-JIANG-ZHANG-20);
  - the Dixmier–Malliavin lemma (PAPER-JIANG-ZHANG-20);
  - strong multiplicity one (PAPER-GAN-ICHINO-18).
- **Not planned anywhere:**
  - Asai L-functions;
  - Flicker–Rallis periods and their Jacquet–Lapid–Rogawski intertwining versions;
  - regularised Rankin–Selberg periods of Eisenstein series;
  - the Whittaker computations of these periods on non-cuspidal functions;
  - the function spaces 𝒮, 𝒞, 𝒯 on [G]_P with their decomposition along cuspidal data;
  - the topological-vector-space tools of Appendix A.

## Routes

1. **New Part II: `AutomorphicLFunctionsPartIIAsaiAndGLnPeriods` (36 items).** Title "Automorphic L-functions and local factors, Part II: Asai L-functions and Flicker–Rallis and Rankin–Selberg periods on general linear groups", parent AutomorphicLFunctionsAndLocalFactors, area `automorphic`.
   - **What it carries:** §§4, 6, 7 and 9, the Ichino–Yamana truncation and regularised period (§3.3.2, §5.1.4), and §8.1.2. That is:
     - Asai L-functions and Flicker's integral;
     - the Flicker functional β_n;
     - Jacquet–Lapid–Rogawski periods and the mixed truncation;
     - the Flicker–Rallis period of the kernel (Theorem 4.3.3.1);
     - the residue theorem (Theorems 6.2.5.1, 6.2.6.1);
     - the canonical extension of the Rankin–Selberg period (Theorem 7.1.3.1);
     - Petersson versus Whittaker norms (Theorem 8.1.2.1);
     - the local and global Flicker functional comparison (Theorems 9.1.7.1, 9.2.5.1).
   - **Why a Part II:** these are statements about general linear groups alone, the L-functions and periods of AL's subject. AL.3's contract stops at cuspidal Rankin–Selberg theory, and nothing plans the Asai function.
   - **Why not inside the Jacquet–Rallis roadmap:** it would hide them inside a trace-formula roadmap, while other queued papers (the Beuzart-Plessis–Chaudouard sequel, Flicker–Rallis distinction) need them too.
2. **Coalesced with `JacquetRallisRelativeTraceComparison` (31 items).** The route keeps the candidate's id, title, parent and area.
   - **What it carries:** the linear-side trace formula of §3, the relative characters and Theorems 5.2.1.1, 8.1.4.1 and Corollary 9.2.5.2, and the unitary side and comparison of §10 (Proposition 10.1.6.1). It also carries the proofs of Theorems 1.1.5.1, 1.1.5.3 and 1.1.6.1.
   - **Area:** the candidate's area `modular` is not a galaxy id. The route keeps it so the routes match, and its reason asks the review to correct all of them.
3. **Coalesced with `AutomorphicSpectralTheoryPartIISchwartzMultipliers` (18 items).** The function-space layer of §2:
   - weights (Franke) and Ξ;
   - 𝒮(G(A)) and SLF representations;
   - weighted L², 𝒮, 𝒞, 𝒯, 𝒮_w;
   - constant terms and pseudo-Eisenstein series on them;
   - Theorem 2.9.4.1 (decomposition along cuspidal support), regular data and Lapid's Theorem 2.9.8.1;
   - the kernel bounds;
   - relative characters of Schwartz functions.

   This is the space the candidate's isolation theorems act on.
4. **Coalesced with `GanGrossPrasadConjecturesForClassicalGroups` (5 items):**
   - the unitary pairs U′_h ⊂ U_h;
   - Hermitian Arthur parameters and S_Π;
   - weak base change to them;
   - the local normalised periods of the refined conjecture;
   - the local conjecture for tempered unitary pairs.
5. **Source of AS.0 (6 items):** Appendix A. That is LF spaces and vector-valued integrals, holomorphy and Banach–Steinhaus for LF spaces, nuclear maps, completed projective tensor products (Grothendieck), vector-valued Schwartz functions and the vector-valued Phragmén–Lindelöf principles.
6. **Source of AF.1 (1 item):** the Dixmier–Malliavin theorem, as PAPER-JIANG-ZHANG-20 routes it.
7. **Source of AL.3 (2 items):** the analytic properties of Rankin–Selberg L-functions, and strong multiplicity one with Ramakrishnan's degree-one refinement, alongside PAPER-GAN-ICHINO-18 and PAPER-CHENEVIER-TAIBI-20.

## Source issues (`sourceIssues` E1–E10)

**Gap (E1): the common infinitesimal character in the proof of Proposition 10.1.6.1 (p. 321).**
- **What the paper cites.** It takes, from "[BPLZZ21, Theorem 4.12 (4)]", that every σ in 𝔛^h_0 has infinitesimal character with base change ξ_Π.
- **Where the gap is.** That is Beuzart-Plessis–Liu–Zhang–Zhu Theorem 4.14(4), which rests on their Proposition 4.13(1). As this atlas's extraction of that paper records (PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/E1), the printed proof of 4.13(1) does not reach the archimedean component when the base change is not cuspidal. Here Π is a non-cuspidal Hermitian Arthur parameter: the endoscopic case the paper is about.
- **Why it matters.** The statement is needed to make the unitary multipliers μ^h(σ) = 1 compatible with μ(Π) = 1.
- **The fix.** Either repair BPLZZ 4.13(1) by isolating with its Theorem 3.19, or take the statement from Mok and KMSW (BPLZZ Remark 4.15).
- **What it affects.** Only the proof; Theorems 1.1.5.1 and 1.1.6.1 stand.

**Misprints.**
- E2: the Beuzart-Plessis–Liu–Zhang–Zhu theorem numbers are those of its arXiv v1, while the reference is the Annals paper.
  - Theorem 1.7 should be 1.8, and Theorem 1.8 should be 1.9.
  - Theorems 3.17 and 4.12 should be 3.19 and 4.14.
  - Lemma 4.10 should be 4.12.
- E3: Proposition 4.3.7.1 integrates over [G′] instead of [G′]_0.
- E4: η_{[G′]} for η_{G′} in (8.2.3.5).
- E5: "|S_Π| = 2^{−dim(a_P)}" should be |S_Π|^{−1} = 2^{−dim(a_P)} (§10.3.5).
- E6: 𝔛^h_π for 𝔛^h_0.
- E7: relevance is defined in "Section 4.3.2" as printed, but actually in 5.1.3.
- E8: the parameter space 𝒜_0 in §6.3 is undefined; it is ia*_{M,0}.
- E9: ia^G_{P_1} for ia^{G,*}_{P_1} in Lemma 4.3.6.2.
- E10: the GL_n volume form is printed (det h)^{−1}∧dh_{ij}. It should be (det h)^{−n}∧dh_{ij}, which is invariant and gives vol(GL_n(O_v)) = L_{H,v}(0)^{−1}.

## Prerequisites not yet covered

Forty entries, with DOIs confirmed on Crossref. Four have none: Lapid 2011 and 2013, Dixmier–Malliavin, and Finis–Lapid. Ramakrishnan's is given by its arXiv id.
- **Trace formulas and transfer:** Zydor; Chaudouard–Zydor; Beuzart-Plessis–Liu–Zhang–Zhu; W. Zhang (two papers); Xue; Yun; Beuzart-Plessis's fundamental lemma.
- **Periods:**
  - Ichino–Yamana; Jacquet–Lapid–Rogawski; Lapid–Rogawski;
  - Lapid 2006, 2008, 2011 and 2013;
  - Flicker; Feigon–Lapid–Offen;
  - Beuzart-Plessis on Asai integrals, the Plancherel formula and the local trace formula;
  - R. N. Harris.
- **Asai L-functions:** Shahidi 1990; Goldberg; Finis–Lapid.
- **Analysis:** Franke; Bernstein; Bernstein–Krötz; Casselman; Dixmier–Malliavin; Grothendieck; Arthur 1985; Müller–Speh; Keys–Shahidi.
- **Local distinction:** Baruch; Gelbart–Jacquet–Rogawski; Aizenbud–Gourevitch–Sayag; Jacquet 2010; Kemarsky.
- **Other:** Ramakrishnan; Gross.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22.result.json` reports no errors.
