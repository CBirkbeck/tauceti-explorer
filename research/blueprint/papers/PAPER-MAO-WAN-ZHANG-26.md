# PAPER-MAO-WAN-ZHANG-26: Relative Langlands duality for some strongly tempered spherical varieties

Zhengyu Mao, Chen Wan and Lei Zhang, *Relative Langlands duality for some strongly tempered spherical varieties*, [Inventiones Mathematicae 243 (2026), 993–1036](https://doi.org/10.1007/s00222-025-01388-z); arXiv [2310.17837](https://arxiv.org/abs/2310.17837).

Extraction by Claude Code, session `cc-39fac3`, 23 September 2026 (issue #1201). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-MAO-WAN-ZHANG-26.result.json](PAPER-MAO-WAN-ZHANG-26.result.json). It has:
- 79 items: 2 library, 5 planned, 72 missing;
- one route, a new roadmap;
- 26 prerequisite entries;
- 14 recorded source issues.

## Sources read

- **The published version is paywalled** (Springer), so it was not read.
- **The authors' version, read in full.** Chen Wan's research page links it from the paper's Inventiones entry: [BZSV.pdf](http://sites.rutgers.edu/chen-wan/wp-content/uploads/sites/518/2025/04/BZSV.pdf), 35 pages, 9 April 2025.
  - It has the published title and abstract and thanks the referee.
  - It predates acceptance (4 November 2025) by seven months, so details of the printed text may differ.
  - Page numbers below are this version's. Its SHA-256 is recorded in `source`.
- **arXiv v3 (March 2024) was compared.** It is an earlier draft, "BZSV duality for …".
  - It proposes two families of comparisons, which the version read unifies as Conjecture 1.8.
  - It numbers its statements differently.
  - Sections 3–6 contain the same mathematics.
- **Errata:** Crossref, the Springer page and the authors' page show no correction.
- **Cited inputs were not read.** Items resting on one state it as the paper uses it. These inputs are:
  - Ben-Zvi–Sakellaridis–Venkatesh;
  - Gan–Jun;
  - Lapid–Mao;
  - Mao–Rallis;
  - Kudla's notes;
  - Ginzburg–Rallis–Soudry, and others.

## What the paper proves

**The BZSV framework (§1.1).** Ben-Zvi–Sakellaridis–Venkatesh (BZSV) attach a quadruple Δ = (G, H, ρ_H, ι) to each hyperspherical Hamiltonian space.
- **The quadruple:** H is a subgroup of G, ρ_H is a symplectic representation of H, and ι : SL_2 → G commutes with H.
- **The period** P_Δ(ϕ, φ) = ∫ P_ι(ϕ)(h) Θ^φ_ψ(h) dh combines a theta series along ρ_{H,ι} with a degenerate Whittaker coefficient P_ι.
- **BZSV's conjecture (Conjecture 1.1).** It predicts |P_Δ|²/⟨ϕ, ϕ⟩ “=” L(½, Π, ρ_{Ĥ′}) ∏ L(k/2 + 1, Π, ρ̂_k)/L(1, Π, Ad)², for the dual quadruple Δ̂ = (Ĝ, Ĥ′, ρ_{Ĥ′}, ι̂′).

**A conjecture on degenerate Whittaker periods (§1.2).** Let O_ι be the Barbasch–Vogan dual of an orbit O_ι̂ of the dual group, with P_ι its Bessel or Fourier–Jacobi coefficient.
- **Conjecture 1.5** predicts |P_ι|²/⟨ϕ, ϕ⟩ “=” L(½, Π, ρ̂_ι̂)/∏ L(k/2 + 1, Π, ρ̂_k).
- **The representation ρ̂_ι̂** is the sum of the irreducible symplectic summands of the odd part of 𝔤̂ that occur an odd number of times.
- **The regular case** is Lapid–Mao's Whittaker conjecture.

**A comparison of relative trace formulas (§1.3).**
- **The two sides.** Conjecture 1.8 compares I(f) = P_ι′(P_Δ(K_f)) on G with J(f′), a Whittaker–Δ_1 trace formula on H′.
  - H′ is the dual of Ĥ′.
  - Δ_1 is dual to (Ĥ′, Ĥ′, ρ_{Ĥ′} ⊕ ρ̂_ι̂′, 1).
- **Special case 1 (Assumption 1.10):** J is the Kuznetsov trace formula of H′.
- **Special case 2 (Assumption 1.11):** Sakellaridis's rank-one varieties, with Jacquet's Whittaker–Hecke trace formula.

**The main result (Theorem 1.13).** For the duals (Ĝ, Ĝ, ρ̂, 1) of the six strongly tempered models of Wan–Zhang whose reductive part is PGL_2, the p-adic fundamental lemma and smooth transfer hold. The six models, as (Ĝ, ρ̂), are:

| Model | Ĝ | ρ̂ |
|---|---|---|
| 1 | SL_6 | ∧³ |
| 2 | S(GSpin_8 × GL_2) | HSpin_8 ⊗ Std_2 |
| 3 | Spin_12 | HSpin_12 |
| 4 | E_7 | ω_7 |
| 5 | Spin_11 | Spin_11 |
| 6 | S(GSpin_7 × GL_2) | Spin_7 ⊗ Std_2 |

- **The SL_2 side:** the Kuznetsov trace formula of SL_2, with Kloosterman orbital integrals and their germ space C^∞_OI (§3, Proposition 3.3).
- **Models 1–4 (§4), the Bessel case.**
  - The unipotent radical N is a degree-three Jordan algebra 𝒥, and the orbital integrals are ∫_𝒥 f ∗ φ(a, A)ψ((tr A − N_𝒥 A)/a) dA.
  - Theorem 4.4 adapts Mao–Rallis's 1997 computation.
- **Models 5–6 (§5), the Fourier–Jacobi case.**
  - A Heisenberg theta series on Spin_{2n+1} enters the trace formula.
  - The unfolding (Propositions 5.1–5.7) produces orbital integrals with extra terms ⟨Y, A⟩/a and ⟨A, A⟩/2a².
  - It also produces four-dimensional singular families 𝒥^±.
  - Theorem 5.9 proves the three local statements, with a factor |4|.
- **§6: two further examples of Conjecture 1.5.**
  - GL_n with the orbit (n − 2, 1, 1).
  - A non-special orbit on Sp_4n. Here Proposition 6.4 relates P_ι to a non-generic Whittaker period through Ginzburg–Rallis–Soudry.

## What the atlas already has

- **Library (2 items):**
  - Tau Ceti's complete reducibility and classification of finite-dimensional sl₂-modules, used for the decompositions 𝔤 = ⊕ ρ_k ⊗ Sym^k (`TauCeti.exists_isCompl_of_toLieSubalgebra_eq_top`, `TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv`);
  - Mathlib's Killing form.
- **Planned (5 items):**
  - the adelic Weil representation and theta series (MetaplecticAutomorphicForms MP.4–MP.5);
  - Heisenberg Schrödinger models and explicit Weil operators (MP.0–MP.2);
  - the automorphic kernel (AutomorphicSpectralTheory AS.6);
  - automorphic representations and the discrete spectrum (AF.2, AS.4);
  - the representations ρ̂ of Table 1: spin and half-spin (Tau Ceti SpinRepresentations Layer 4) and the 56-dimensional representation of E_7 (Tau Ceti LieHighestWeight Layer 8, which also plans the split Albert algebra).
- **Nothing on the paper's subject.** No stage and no pending candidate treats BZSV quadruples, periods of spherical varieties, degenerate Whittaker coefficients of general nilpotent orbits, or the Kuznetsov trace formula.
- **The nearest pending candidates:**
  - `GanGrossPrasadConjecturesForClassicalGroups` (Bessel and Fourier–Jacobi models of classical groups);
  - `JacquetRallisRelativeTraceComparison` (a unitary relative trace formula comparison);
  - `TwistedAutomorphicDescents` (the Ginzburg–Rallis–Soudry descent).

## Route

**New roadmap `RelativeLanglandsDuality`, all 72 missing items.**
- **Title:** "Relative Langlands duality: hyperspherical quadruples, automorphic periods and relative trace formula comparisons".
- **Area:** automorphic.

The brief asks for eight layers:
1. **The BZSV framework:** quadruples, anomaly and the metaplectic splitting, the period P_Δ, Arthur parameters factoring through ι̂′, and Conjecture 1.1 with its exact form.
2. **Degenerate Whittaker coefficients:** Barbasch–Vogan duality, ρ̂_ι̂, Conjecture 1.5 and Lapid–Mao.
3. **The comparison framework:** Δ_1, Conjectures 1.7–1.8 and the two special cases.
4. **The Kuznetsov trace formula of SL_2** and Proposition 3.3.
5. **The six models:** Tables 1–3, Ξ, ι, and Conjectures 2.1 and 2.3.
6. **Models 1–4:** the Jordan algebras, Proposition 4.2, Mao–Rallis's identity and Theorem 4.4.
7. **Models 5–6:** the Fourier–Jacobi datum, the explicit Weil representations, the unfolding and Theorem 5.9.
8. **The two examples of §6.**

How the route is built:
- **Conjectures** are formalised as statements, never assumed silently.
- **Imports:** MetaplecticAutomorphicForms, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, SmoothRepresentationsOfLocalGroups (SR.4), ModularityAndLanglandsExtensions (ML.4–ML.5), and Tau Ceti's SpinRepresentations and LieHighestWeight.
- **Coordination:** it works with the three pending candidates above rather than duplicating them.

**Why a new roadmap.**
- The atlas has nothing in this direction.
- The GGP and Jacquet–Rallis owners are specific to classical and unitary groups. Their Bessel and Fourier–Jacobi periods are special cases of the degenerate Whittaker periods here.
- A single owner for relative Langlands duality can be extended later by other papers: BZSV itself, Wan–Zhang, and Sakellaridis's rank-one transfer.

**Kept inside the roadmap rather than split off.**
- **The Kuznetsov trace formula of SL_2.** It is general infrastructure, but this is its only consumer so far. It is a separate layer so that a later design job can move it.
- **The cubic-norm structure of the four Jordan algebras** (trace, norm, cross product). The design job may coordinate it with Tau Ceti's Albert algebra.

## Source issues (`sourceIssues` E1–E14)

**Error (E9): the sign of ⟨Y, A⟩/a in the unfolding for Models 5–6** (p. 21, pp. 22–23, Proposition 5.7, footnote 11).
- **What is printed.** (5.13) and Proposition 5.7 have −⟨Y, A⟩/a.
- **Why it cannot be right.** Take n = u_{e_i}(t).
  - (5.3) and (5.8) make the left side of (5.13) carry ψ(+tY_i).
  - The printed right side gives ψ(−tY_i).
- **The paper's own computation disagrees too.** The proof of Theorem 5.9(3) (p. 29) uses +Σ Y_iA_i/a.
  - Only with + does its germ constant equal I^+ as defined through Y · A of Proposition 5.5.
  - With − the germ changes by ψ(4(Y_{2,0}A_{12,0} + Y_{5,0}A_{15,0} + …)). Theorem 5.9(3) would then fail for general φ′.
- **The correction.** Use +⟨Y, A⟩/a in (5.13), in the unfolding on pp. 22–23, in Proposition 5.7 and in footnote 11.
- **What it affects.** A stated result, Proposition 5.7.
  - The fundamental lemma is unaffected, because the unit Schwartz function is even.
  - Theorem 1.13 stands with the corrected sign.
- **Already in arXiv v3.**

**Gap (E5): the proof of Theorem 5.9(1).**
- **What is printed.** The neighbourhoods 𝒦 and 𝒦′ are chosen by a condition copied from Theorem 4.4.
- **Why it falls short.** That condition does not control the ⟨Y, A⟩ and ⟨A, A⟩ terms.
- **The fix.** Choose 𝒦 and 𝒦′ small enough; the paper's own example of small neighbourhoods of 0 does this.
- **What it affects.** Only the proof.

**Misprints.**
- E1: Model 2's simple roots are called "Type B_n"; they are D_n.
- E2: in (3.1) the products are printed over "v ∈ k^×" instead of over the places of k.
- E3: Proposition 4.2 repeats I^+ where I^− is meant, and omits ∏_v and the argument a in the regular term.
- E4: the test functions in Theorems 4.4(1) and 5.9(1) should be divided by vol(𝒦), not multiplied by a volume.
- E6: a minus sign is lost in the lowest weight of the spin representation.
- E7: the printed symplectic form has ⟨X_{e_i}, X_{e_j}⟩ = 0 for all i, j.
  - **Why it is wrong.** It contradicts the isotropy of the polarisation in footnote 9, and the commutator [U_{e_i}, U_{e_{7−i}}] ⊂ U_{e_i+e_{7−i}} lies in the support of λ.
  - **The correction.** ⟨X_{e_i}, X_{e_{7−i}}⟩ = (−1)^i.
- E8: the undefined N_2 is N_0.
- E10: ⟨Y, A⟩/(2a²) should be ⟨A, A⟩/(2a²) on p. 23.
- E11: "Σ AY_iA_i" and "A ∈ 𝒪_F" on p. 27.
- E12: §6.2 has three slips: Sp_{2n} for Sp_{4n}; "not special in 𝔤" for 𝔤̂; and Ξ = ι̂(·) for ι(·).
- E13: Conjecture 6.1 and Proposition 6.4 are stated for Ĝ(𝔸) instead of G(𝔸) = Sp_{4n}(𝔸).
- E14: index and notation slips:
  - A_Ĝ(F) for A_Ĝ(k_v);
  - λ_n for λ;
  - (a, u).0 for (u, a).0;
  - Ĝ × SL_2 for Ĥ × SL_2 in §6.1;
  - 𝔸^S for 𝔸_S in Proposition 6.4.

## Prerequisites not yet covered

Twenty-six entries. DOIs were confirmed on Crossref, with these exceptions:
- the arXiv preprints (BZSV, Gan–Jun, Mao–Wan–Zhang) are given by their arXiv ids;
- Kudla's notes are given by their URL;
- Jacquet–Ye (C. R. Acad. Sci. 1990) has no DOI.

The entries by topic:
- **The framework:** BZSV; Gan–Jun; Barbasch–Vogan; Lapid–Mao; Wan–Zhang; Mao–Wan–Zhang (hyperspherical).
- **The computations:**
  - Mao–Rallis (1997, 1999, 2004, 2010);
  - Kudla's notes;
  - Jacquet; Jacquet–Ye; Jacquet–Rallis;
  - Friedberg–Jacquet (both);
  - Ginzburg–Rallis–Soudry (Annals, JAMS).
- **The context of the conjectures:**
  - Sakellaridis (Duke 2021, AJM 2013); Sakellaridis–Venkatesh; Knop–Schalke;
  - Gross; Lapid–Rallis;
  - Zinoviev; Zydor.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-MAO-WAN-ZHANG-26.result.json` reports no errors.
