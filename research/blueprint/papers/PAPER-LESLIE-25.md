# PAPER-LESLIE-25: The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods

Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, [Annals of Mathematics (2) 201 (2025), no. 3, 551–645](https://doi.org/10.4007/annals.2025.201.3.1); arXiv [1911.07907](https://arxiv.org/abs/1911.07907).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1061). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-LESLIE-25.result.json](PAPER-LESLIE-25.result.json). It has:
- 111 items: 12 planned, 99 missing;
- 6 routes: two Part IIs of Endoscopic transfer and unitary trace comparison (one new, one coalesced) and four sources of existing layers;
- 14 prerequisite entries;
- 12 recorded misprints.

## Sources read

- **arXiv v3** (12 March 2025, "Accepted version, to appear in Annals of Mathematics"), read in full: 89 pages. Page numbers below are v3's.
  - Earlier versions: v1 (18 November 2019) and v2 (7 April 2020).
  - The Annals version is paywalled and was not read. It was received 20 November 2019, revised 3 June 2024, accepted 6 September 2024 and published online 29 April 2025.
- **Errata:** the Annals article page lists no erratum, and Crossref records no update.
- **Misprints:** all twelve recorded misprints were checked on the page images of v3.
- **One cited source was checked:** §3 of Beuzart-Plessis's arXiv:1901.02653v3. It confirms the trace pairing in the Fourier transform of E8.

## What the paper proves

**Motivation.** Unitary Friedberg–Jacquet periods are the integrals ∫_{[U(W_1)×U(W_2)]} φ of automorphic forms on U(W_1 ⊕ W_2).
- Conjecture 1.1, a case of Getz–Wambach, relates them to a pole of L(s, Π, ∧²) together with L(½, Π) ≠ 0.
- Their relative trace formula is not stable: invariant polynomials only separate geometric orbits. Using it therefore requires an endoscopic theory for the symmetric space U(2n)/U(n) × U(n).

**Main theorem (Theorem 2.12 = Theorem 1.3).** This is the first step of that theory, the relative endoscopic fundamental lemma on the infinitesimal symmetric space 𝔲(W)_1 = End(V_n). Its hypotheses:
- E/F is unramified;
- V_n = W_1 = W_2 is split, with self-dual lattice Λ_n = Λ_a ⊕ Λ_b.

The conclusion: 1_{End(Λ_n)} and 1_{End(Λ_a)} ⊗ 1_{End(Λ_b)} match for the relative endoscopic datum (a, b), and they match 0 for the other choices of Hermitian forms (α, β).

**Part 1: a chain of reductions.**
1. **Contraction to X_n.** The contraction r : End(V_n) → Herm(V_n) turns relative orbital integrals into orbital integrals on the Hermitian symmetric variety X_n (Lemma 2.5). Here r_!1_{End(Λ_n)} is an infinite sum of spherical functions whose coefficients are representation densities (Lemma 3.8).
   - The main theorem thereby follows from an endoscopic fundamental lemma for Hironaka's spherical Hecke module of X_n (Theorem 3.5 = Proposition 1.5): φ ∗ 1_0 matches ξ_(a,b)(φ) ∗ 1_0.
   - Here ξ_(a,b) is the Hecke-algebra map of a non-tempered parabolic induction.
2. **Xiao's germ expansion.** This expresses κ-orbital integrals on Herm(V) through Jacquet–Rallis nilpotent orbital integrals. It reduces Theorem 3.5 to a Jacquet–Rallis fundamental lemma for the Hecke module (Proposition 1.6).
3. **The Weil representation.** Beuzart-Plessis's Weil representation on orbital integrals removes the lattice indicators. What remains is Theorem 5.3 (= Theorem 1.7): ω(X) Orb^{GL_{n−1},η}(BC(φ), X) = Orb^{U(V_{n−1})}(φ ∗ 1_0, Y).

**Part 2: a twisted comparison of relative trace formulas.**
- **Set-up.** The comparison switches the roles of the linear and unitary groups in the Jacquet–Rallis comparison. The two sides are:
  - Res_{E/F}(GL_n × GL_{n+1}) with U(V_x) × U(V_y);
  - GL_n × GL_{n+1} with GL_n.
- **Local theory.** Transfer and the unit fundamental lemma follow from the Lie-algebra Jacquet–Rallis theory (Theorems 7.9, 7.12). The norm map on centres is not surjective, which forces the Z-regular set-up of §7.2.3.
- **Global theory.** The spectral sides factor through Feigon–Lapid–Offen's unitary periods (§8). Simple trace formulas for nice test functions then give:
  - a global transfer of relative characters (Theorem 9.11);
  - a weak local transfer (Proposition 10.7).
- **The base change fundamental lemma (Theorem 11.1).** For E/F unramified and φ spherical on G′(F), BC(φ) matches φ at the split pair (w_n, w_{n+1}), and vanishes on the orbits of the other pairs. It is proved by globalizing and isolating one orbit.
- **Closing the chain.** Theorem 5.3 follows from Theorem 11.1 (§11.2).

## What the atlas already has

**Planned (12 items).**
- Measures: AdelicAlgebraicGroups AA.2.
- Unitary Lie-algebra endoscopy:
  - endoscopic data and matching (ET.0);
  - κ-orbital integrals and the definition of transfer (ET.1);
  - existence of transfer on Herm, Theorem 2.9 (ET.3, after Laumon–Ngô and Waldspurger).
- Local harmonic analysis:
  - the Satake transform (SmoothRepresentationsOfLocalGroups SR.4);
  - supercuspidal matrix coefficients (SR.3);
  - unramified base change of Hecke algebras (EndoscopicTransferAndUnitaryTraceComparison ET.4).
- Automorphic inputs:
  - Arthur–Clozel base change (ModularityAndLanglandsExtensions ML.5);
  - the Rankin–Selberg period factorization (AutomorphicLFunctionsAndLocalFactors AL.3).
- Arithmetic inputs:
  - the Hasse norm theorem (Tau Ceti Class field theory, Layer 13);
  - Hermitian spaces and self-dual lattices (GeometryOfNumbersAndQuadraticArithmetic GN.2).

**Pending proposals.** `JacquetRallisRelativeTraceComparison` is a pending Part II of Endoscopic transfer and unitary trace comparison.
- It was proposed by W. Zhang's AFL extraction and extended by Beuzart-Plessis–Liu–Zhang–Zhu, Beuzart-Plessis–Chaudouard–Zydor and Beuzart-Plessis–Chaudouard.
- It plans:
  - Lie-algebra Jacquet–Rallis matching, transfer and the fundamental lemma;
  - the Weil representation;
  - U(n) × U(n+1) trace comparisons.

**Not in the atlas.**
- Endoscopy for symmetric spaces.
- The spherical Hecke module of X_n (Hironaka).
- Xiao's germ expansion.
- Unitary periods of GL_n(E) with their Feigon–Lapid–Offen functionals.
- The twisted comparison.

## Routes

1. **New Part II `UnitaryFriedbergJacquetRelativeEndoscopy`** (35 missing). Its title is "Endoscopic transfer and unitary trace comparison, Part II: relative endoscopy for unitary symmetric spaces and the unitary Friedberg–Jacquet fundamental lemma"; area modular.
   - **Contents:**
     - the infinitesimal symmetric pair, the contraction maps and categorical quotients (§2.1);
     - relative endoscopic data, Δ_rel, RO^κ and relative transfer (§2.3);
     - X_n and Hironaka's Hecke module, and ξ_(a,b) (§3);
     - the initial reduction (§3.3);
     - Xiao's germ expansion and endoscopic transfer through Jacquet–Rallis, and Proposition 4.8 (§4.2–4.3);
     - Proposition 5.2, Proposition 1.6 and Theorem 5.3 with its §11.2 proof;
     - the main Theorem 2.12.
   - **Why a new Part II:** nothing in the atlas goes in this direction.
     - ET.0–ET.3 stop at groups and Lie algebras.
     - The Jacquet–Rallis Part II concerns other periods.
   - **Dependencies run one way.** This Part II imports the Jacquet–Rallis Part II (for Theorem 11.1 and the Lie-algebra transfer); nothing flows back.
   - **Not `RelativeLanglandsDuality` either.** That roadmap (proposed by PAPER-MAO-WAN-ZHANG-26) plans BZSV duality and relative trace formula comparisons for strongly tempered spherical varieties. It does not cover stabilizing an unstable relative trace formula.
2. **Coalesced with `JacquetRallisRelativeTraceComparison`** (55 missing). Its id, title, parent, area and brief are kept.
   - **Contents:**
     - the Lie-algebra Jacquet–Rallis statements the paper restates (§4.1, §5.1);
     - the whole twisted comparison of Part 2:
       - set-up, orbit matching and Z-regular elements;
       - local transfer and the unit fundamental lemma;
       - Petersson, Feigon–Lapid–Offen and Jacquet inputs;
       - relative characters, the simple trace formulas and Theorem 9.11;
       - local spectral transfer (§10);
       - Theorem 11.1 with its globalization lemmas.
   - **Why coalesce:** the twisted comparison uses that Part II's Lie-algebra transfer and nice-test-function machinery.
3. **Source of EndoscopicTransferAndUnitaryTraceComparison [ET.0, ET.1]** (3 missing, 3 planned).
   - **Missing:**
     - Lemma 1.8 (centralizer cohomology on Herm(V));
     - Lemma 2.7 (the character κ);
     - the simplified unitary transfer factor (2.7).
   - **Planned:** the unitary Lie-algebra matching, κ-orbital integrals and transfer definitions, for which the paper is a source.
4. **Source of SmoothRepresentationsOfLocalGroups [SR.4]** (3 missing), all used to compute ξ_(a,b):
   - Macdonald's spherical-function formula;
   - Hall–Littlewood basis and branching;
   - parabolic descent as Levi restriction (Mínguez).
5. **Source of GeometryOfNumbersAndQuadraticArithmetic [GN.2, GN.3]** (2 missing).
   - Jacobowitz's K_{n,E}-orbits on X_n (GN.2).
   - The identification m_0 = Den(L) (GN.3). This is where PAPER-LI-ZHANG-22-B sent the lattice-counting density formula.
6. **Source of AutomorphicLFunctionsAndLocalFactors [AL.3]** (1 missing, 1 planned).
   - **Missing:** Ramakrishnan's automorphic Chebotarev theorem. PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 also routed it to AL.3.
   - **Planned:** the Rankin–Selberg period factorization.

## Source issues (`sourceIssues` E1–E12, all misprints)

None affects a stated result.

**Notation slips.**
- **E1** (p. 12, Lemma 1.8): "centralizer of δ in U(W)" should be U(V).
- **E2** (p. 19): the endoscopic datum is written (U(V_a) × U(V_b), s, η); the third entry should be ξ.
- **E4** (p. 32): the unitary invariant b_i = ⟨w, x^i w⟩_V should be ⟨w, y^i w⟩_V.
- **E5** (p. 33): the embedding Herm(V) × V ↪ Herm(V ⊕ Ee_0) sends (y, w) to a matrix with top-left entry x; it should be y.
- **E9** (p. 54): U(V_y) ≅ {(g, g^θ) : g ∈ GL_n(F)} should have g ∈ GL_{n+1}(F), as p. 74 prints it.
- **E12** (p. 84): "invariant polynomials of H′(F_v) × H′(F_v) acting on G(F_v)" should be H(F_v) × H(F_v).

**Broken reference and a name.**
- **E3** (p. 22): "Proposition Prop: initial reduction" is an unresolved LaTeX reference to Proposition 3.12.
- **E6** (p. 35): "Gordan" should be Gordon (Julia Gordon's appendix to Yun).

**Formula errors.**
- **E7** (p. 38, proof of Proposition 4.8): "F = ϕ ⊗ 1_{Λ_n} so that ev_0(F) = ϕ" should read (ϕ ∗ 1_0) ⊗ 1_{Λ_n} and ϕ ∗ 1_0. ϕ is a Hecke-algebra element, not a function on Herm(V_n).
- **E8** (p. 40): the unitary Fourier transform is printed ∫_V f(x, u) ψ(Nm_{E/F}⟨u, w⟩) du. It should be ∫_V f(y, u) ψ(Tr_{E/F}⟨u, w⟩) du:
  - the pairing must be bilinear;
  - the trace is the polarization of q(y, w) = ⟨w, w⟩;
  - Beuzart-Plessis's definition uses ψ ∘ Tr_{E/F}.
- **E10** (p. 65, Lemma 9.4): η_{i,j}(z_1, z_2) = η(z)^i η(z)^j should be η(z_1)^i η(z_2)^j.
- **E11** (p. 66, proof of Lemma 9.4): the last line keeps a sum over (i, j) that the orthogonality step has already absorbed. As printed, it is four times the lemma's (correct) conclusion.

## Prerequisites not yet covered

Fourteen entries:
- Leslie's three earlier papers ([Les19], [Les22], [Les24]);
- Xiao;
- Hironaka;
- Feigon–Lapid–Offen;
- Jacquet 2010 and 2005;
- W. Zhang 2014;
- Yun with Beuzart-Plessis;
- Ramakrishnan;
- Jacobowitz;
- Getz–Wambach;
- Sakellaridis–Venkatesh.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LESLIE-25.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`, and both Part II parents are atlas roadmaps.
