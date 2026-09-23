# PAPER-NAKAMURA-23: Zeta morphisms for rank two universal deformations

Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*, [Inventiones mathematicae 234 (2023), 171–290](https://doi.org/10.1007/s00222-023-01203-7); arXiv [2006.13647](https://arxiv.org/abs/2006.13647).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1243). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-NAKAMURA-23.result.json](PAPER-NAKAMURA-23.result.json). It has:
- 61 items: 1 library, 39 planned, 21 missing;
- 9 routes: eight sources of existing layers and one coalesced candidate;
- 20 prerequisite entries;
- 15 recorded misprints.

## Sources read

- **The published version** (open access, CC BY 4.0), read in full. Page numbers below are the journal's.
  - Springer serves the PDF only after a cookie handshake: the PDF link redirects through idp.springer.com back to a `?error=cookies_not_supported&code=…` URL.
  - Plain curl gets a JavaScript challenge; the WebFetch tool retrieved the PDF.
- **arXiv:** v1 and v2 (June–July 2020) predate the published text. v2 shares every recorded passage, so no later version corrects them.
- **Errata:** Crossref and Springer record no correction.

## What the paper proves

**The setting.** Let ρ̄ : G_ℚ → GL_2(𝔽) be odd and absolutely irreducible, with ρ^u its universal deformation unramified outside Σ. Assume:
- p ≥ 5;
- End(ρ̄_p) = 𝔽;
- ρ̄_p is not a twist of (1 ∗; 0 ε^{±1}).

**The main result (Theorem 1.1).** There are zeta morphisms z_{Σ,n}(ρ^u) : (ρ^u)^* → H¹_Iw(ℤ[1/Σ_n, ζ_n], (ρ^u)^*(1)) such that:
- they are τ-equivariant;
- they satisfy the Euler system relations;
- at every modular point they specialise to Kato's zeta morphism z(f), times the Euler factors at Σ ∖ {p} (Theorem 4.3).

Kato's generalised Iwasawa main conjecture predicts exactly such morphisms.

**How the morphisms are built.**
1. **Weight-two zeta morphisms.** Fukaya–Kato-style morphisms are built on the parabolic cohomology of the full-level curves X(N). They are characterised through Kato's zeta value formula, dual exponentials and period maps (Proposition 3.8).
2. **Integrality.** They become integral after localising at the non-Eisenstein ideal of ρ̄ (Proposition 3.15).
3. **Passage to the limit.** They pass to Emerton's completed Borel–Moore homology as a G_Σ-equivariant map (Theorem 3.16).
4. **Removing the local factors.** The paper dualises Emerton's local–global compatibility to H̃^BM_{1,ρ̄,Σ} ≅ (P̃ ⊗̂ (ρ^m)^*) ⊗ π̃^m_{Σ_0} (Corollaries 2.5 and 2.8). Then:
   - Paškūnas' projective envelope P̃ is factored out using projectivity (Corollary B.28);
   - the Σ_0-factor is removed by Emerton–Helm's Whittaker functor.

**How the comparison is proved (Theorem 4.3).**
- **The local input.** Paškūnas describes Kisin's potentially semistable rings through P̃ (Theorem 4.7), so the specialisation at a point of type τ is a classical cohomology group with coefficients in Henniart's type (Corollary 4.8, Proposition 4.9).
- **The global comparison.** New vectors identify that group, with its motivic structure, with Kato's V′_1(f).

**The application (§5).**
- **Congruences.** Kato's zeta morphisms of congruent forms are congruent (Corollary 5.6).
- **Propagation along the family**, following Kim–Lee–Ponsinet:
  - μ = 0 holds at one point of the residual family if and only if it holds at every point (Theorem 5.7);
  - the λ-defect is constant along the family (Theorem 5.14).
- **The consequence (Theorem 1.4).** Kato's main conjecture propagates along congruences. This covers even forms that are supercuspidal at p.

## What the atlas already has

**Nakamura's construction itself.** AutomorphicCongruences L3 plans exactly "Nakamura's universal zeta morphism from the compatible modular/Hecke-level classes, including the completed-cohomology and local co-Whittaker input … Prove that this morphism specializes to R12's Kato class".
- Theorems 1.1 and 4.3, Corollary 4.2, the construction of §4.1 and the steps of §§3.2–3.4 and 4.4 are therefore **planned** there.
- L3 also says that missing general supplier theorems belong to their canonical owners, and the routes below follow that rule.

**Planned suppliers.**
- **Kato's Euler system:**
  - Siegel units and K_2 symbols (KatoEulerSystems L0–L1);
  - Kato's classes and zeta morphism (L2);
  - the zeta value formula, Theorem 3.2 (L3);
  - Kato's divisibility, Theorem 5.2 (L4);
  - Kato's main conjecture (ModularIwasawaMainConjectures L0).
- **Completed cohomology and homology:**
  - CompletedCohomologyPartII CC.1–CC.3 and CC.6–CC.7;
  - CompletedCohomologyAndLocalGlobalCompatibility R31.1–R31.3;
  - Emerton's local–global compatibility, Theorem 2.2 (R31.4, which names Emerton's unpublished manuscript);
  - Böckle–Emerton R = T (R31.6).
- **p-adic local Langlands for GL_2(ℚ_p):**
  - Colmez's functor (PadicLocalLanglandsForGL2Qp R30.3);
  - Kisin's deformation-theoretic formulation, projective envelopes and Paškūnas' theorems (R30.2, R30.5, R30.6);
  - Kisin's potentially semistable rings (LocalGaloisDeformationRings R08.3).
- **Local families away from p:** Whittaker functors, co-Whittaker modules and the family local Langlands correspondence (SmoothRepresentationsOfLocalGroups SR.5).
- **Other layers:**
  - modular curves (ModularCurvesPartII R14.3);
  - Eichler–Shimura (ModularSymbolsPadicLFunctions L0);
  - Galois representations of newforms (AutomorphicGaloisRepresentations R19.1, R19.4);
  - μ and λ (PadicMeasuresIwasawaAlgebras L4);
  - Iwasawa cohomology (SelmerIwasawaCohomology L3).

**Library (1 item).** Weierstrass preparation (`PowerSeries.exists_isWeierstrassFactorization` and `PowerSeries.IsWeierstrassFactorization.unique`), used to define μ and λ.

## Routes

1. **Source of AutomorphicCongruences [L3, L4]** (10 planned, 7 missing).
   - **Planned:** the construction and comparison above.
   - **Missing:** the §5 application.
     - Theorem 1.4;
     - Corollary 5.6;
     - the residual zeta morphism and change of Σ (79);
     - Theorems 5.7, 5.9, 5.11, 5.14 and Conjectures 5.8, 5.10, 5.12, 5.13.
   - **Why L4:** it owns the pointwise consequences of the universal zeta element.
2. **Source of KatoEulerSystems [L0–L4]** (7 planned, 4 missing).
   - **Planned:** Kato's objects and theorems.
   - **Missing:** the paper's packaging, which its comparison needs.
     - the Hecke dictionary (Lemma 3.1);
     - Fukaya–Kato's lemma on parabolic Iwasawa cohomology, generalised to X(N) and all weights (Lemma 3.4);
     - the characterisation of s_N(cz^Iw) (Corollary 3.6);
     - the twisted morphism z_n(f) with its characterisation (Lemma A.3, Definition A.4, Corollary A.5).
3. **Source of CompletedCohomologyAndLocalGlobalCompatibility [R31.1–R31.4, R31.6]** (5 planned, 3 missing).
   - **Missing:** the dual local–global compatibility for completed homology (Corollaries 2.5, 2.7, 2.8 and Lemma 2.6).
   - **Why R31.4:** it is a supplier theorem of the layer that plans Emerton's theorem.
4. **Source of CompletedCohomologyPartII [CC.3]** (3 planned, 1 missing).
   - **Planned:** completed homology and its duality (Lemma 2.4); the topological modules of Appendix B.1.
   - **Missing:** the tensor–dual lemmas B.5, B.6, B.16.
5. **Source of PadicLocalLanglandsForGL2Qp [R30.2, R30.3, R30.5, R30.6]** (3 planned, 2 missing).
   - **Missing:**
     - P̃ ≅ π^*_π̄ (Lemma B.23, Proposition B.26);
     - removing P̃ from Hom (Lemma B.27, Corollary B.28).
6. **Source of SmoothRepresentationsOfLocalGroups [SR.5]** (2 planned, 1 missing).
   - **Missing:** Lemma B.10, which gives End(M ⊗ V) = End(M) for co-Whittaker V.
7. **Source of ArithmeticGaloisDuality [D7]** (1 missing): continuous cochains with pro-free and admissible coefficients (Lemmas B.29–B.31, Corollary B.32).
8. **Source of ModularSymbolsPadicLFunctions [L0]** (1 missing): the Hecke-equivariant Drinfeld–Manin splitting. No layer plans it in general weight.
9. **Coalesced with `SmoothRepresentationsPartII`** (1 item): Henniart's types σ^st(τ), σ^cr(τ) for GL_2(ℚ_p).
   - PAPER-NEWTON-THORNE-21-B routed the same types there.

No new roadmap is proposed: the atlas already planned this paper's direction.

## Source issues (`sourceIssues` E1–E15, all misprints, checked on page images)

None affects a result, but a formaliser should know them.

**Cross-references:**
- **E1** (p. 189): the citation key [Em06b] does not exist in the numbered bibliography.
- **E4** (pp. 198, 240): "Proposition 2.5" should be Corollary 2.5.
- **E10** (p. 254): "Conjecture 5.2" should be Conjecture 5.1.

**Index and symbol slips:**
- **E2** (p. 192): Σ_0 is written for Σ.
- **E3** (p. 195): K_{Σ_0} is written for K′_{Σ_0} in a diagram corner.
- **E11** (p. 256): ϖ^n is written for ϖ^m.
- **E14** (p. 268): Y(N_f) is written for Y_1(N_f).
  - The full-level f-eigenquotient is not two-dimensional.

**Formula slips:**
- **E5** (pp. 235, 252): the smoothing factor (c − c^{j−k+2}σ_c) should be (c² − …), as in Proposition 3.8.
- **E13** (p. 267): (d − d^{j+1}σ_d) should be (d² − …).
- **E9** (p. 253): H²_Iw(ℤ[1/p]) is defined as a kernel on itself. The source should be ℤ[1/Σ_f].
- **E12** (p. 264): the last display of the proof of Theorem 5.14 has λ_𝔽(H¹) for λ_𝔽(H²).
  - H¹ is free of rank one, so λ_𝔽 of it makes no sense.

**Normalisation and notation:**
- **E7** (pp. 236, 252–253): the characterisations used in Proposition 3.15 and Theorem 4.3 omit the factor (2πi)^{1−k}.
  - The factor is present in (19), (22) and Corollary A.5.
  - Its uniqueness is what the proofs invoke.
- **E8** (pp. 246, 250): Hom(σ, −) should be Hom(σ^*, −), as in (60) and (78).
- **E6** (pp. 235–236): the undefined symbol V′_p(f) stands for V′_2(f)_E.
- **E15**: the Whittaker functor is called Φ in §2.2 and Appendix B but Ψ in §1.2 and §4.

**A dependency to note.** The foundation (Theorem 2.2) rests on Emerton's local–global compatibility manuscript, which is unpublished. R31.4 records it as its source branch.

## Prerequisites not yet covered

Twenty entries, all with DOIs confirmed on Crossref, except:
- Kato 2004 (numdam);
- Emerton's manuscript, Fukaya–Kato and Kim–Lee–Ponsinet (URLs);
- Colmez 2010 and Elkik 1990 (no DOI).

**The key inputs:**
- Kato 2004;
- Emerton's manuscript and his 2006 papers;
- Emerton–Helm; Helm;
- Paškūnas 2013 and 2015;
- CEGGPS;
- Calegari–Emerton;
- Fukaya–Kato;
- Böckle;
- Kim–Lee–Ponsinet.

**Other inputs:**
- Skinner 2016;
- Pottharst;
- Gee–Newton;
- Ash–Stevens;
- Breuil–Mézard (with Henniart's appendix);
- Colmez;
- Elkik.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-NAKAMURA-23.result.json` reports no errors. Every planned stage id exists in `data/atlas.json`.
