# PAPER-JIANG-ZHANG-20: Arthur parameters and cuspidal automorphic modules of classical groups

Dihua Jiang and Lei Zhang, *Arthur parameters and cuspidal automorphic modules of classical groups*, [Annals of Mathematics 191 (2020), no. 3, 739–827](https://doi.org/10.4007/annals.2020.191.3.2); arXiv [1508.03205](https://arxiv.org/abs/1508.03205) (v4).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1123). Status: **complete**. Every missing item is routed exactly once. The machine-readable extraction is [PAPER-JIANG-ZHANG-20.result.json](PAPER-JIANG-ZHANG-20.result.json):

- 78 items: 8 planned, 70 missing;
- 7 routes: two new roadmaps and five source routes;
- 22 prerequisite entries;
- 5 source issues.

**Source.** The whole of arXiv v4 (19 November 2019, 92 pages, SHA-256 `d97bf304…0df7bb4`), including both appendices, was read on 2026-09-22, with formulas checked on page images.

- **The published text** is paywalled and was not read. Its abstract on the Annals page is identical to v4's, and v4 is the authors' last arXiv revision, a week before the journal's final revision date.
- **arXiv v1 and v3** were compared for the history of the source issues.

The cited inputs were not read; each item that rests on one says so. These include Gan–Gross–Prasad, Ginzburg–Rallis–Soudry, Arthur, Mok, Kaletha–Minguez–Shin–White, Mœglin–Waldspurger and Soudry.

## What the paper proves

**The question.** Arthur's classification relates cuspidal representations of classical groups to their global Arthur parameters only through character identities. Arthur and Schmid asked how to construct a concrete module for such a representation from its parameter.

**The answer, for orthogonal and unitary groups.** Let π be cuspidal on a pure inner form G_n with a generic parameter φ_τ, where τ = τ_1 ⊞ ⋯ ⊞ τ_r lives on GL_N.
1. The **first non-zero Bessel coefficient** of π (Proposition 2.2) is a cuspidal representation of a smaller group H_m.
2. The **Generic Summand Conjecture 2.3** asks that it pair non-trivially with some σ that has a generic parameter.
3. The **residue** E_{τ⊗σ} at s = ½ of the Eisenstein series induced from τ|det|^s ⊗ σ lies in the Arthur packet of (τ_1, 2) ⊞ ⋯ ⊞ (τ_r, 2) ⊞ φ_σ.
4. Its **Bessel–Fourier coefficient**, the σ-twisted automorphic descent D(τ; σ) (6.9), should be π itself (Conjecture 6.7).

Theorem 7.1 proves this, assuming the Generic Summand Conjecture 2.3 and the local Gan–Gross–Prasad conjecture: D(τ; σ) ≅ π, or π ⊕ π⋆ for even orthogonal groups. Corollaries 7.2 and 7.4 need only the local conjecture:
- for generic π on quasi-split groups, where the construction is the Ginzburg–Rallis–Soudry descent;
- when the wave-front set of π contains the subregular orbit.

**Global zeta integrals (§4).** The engine is a family of global zeta integrals of Bessel type for G × GL: Bessel periods pairing π with the Bessel–Fourier coefficient of the Eisenstein series.
- They unfold to the open double coset (Propositions 4.1–4.3).
- They factor as Euler products of local Bessel functionals (Theorems 4.5, 4.7).
- At unramified places they give L(s + ½, τ × π)/(L(s + 1, τ × σ)L(2s + 1, τ, ρ)) (Theorem 4.8).

**Reciprocal non-vanishing (§5).** Theorem 5.3: the pair (E_{τ⊗σ′}, π) has a non-zero Bessel period exactly when (π, σ) does. Its proof combines:
- the poles of the Eisenstein series (Proposition 5.2);
- the holomorphy of normalized intertwining operators (Theorem 5.1, proved in Appendix B);
- a local non-vanishing result (Proposition 5.5, proved in Appendix A).

**The global Gan–Gross–Prasad conjecture.**
- **Theorem 5.7.** A non-zero Bessel period forces L(½, π × σ) ≠ 0, for all these groups and without assuming multiplicity one.
- **Theorem 6.10.** Conversely, L(½, φ × φ′) ≠ 0 gives a pair with a non-zero Bessel period, assuming Conjecture 6.8 on the Fourier coefficients of residues.
- **Corollary 6.11.** For SO_{2n+1} × SO_2 the two conditions are equivalent unconditionally.

## What the libraries and the atlas already have

**The libraries** have nothing specific. There are:
- groups of points of orthogonal groups (Tau Ceti);
- the unitary group of the standard Hermitian form (Mathlib);
- sl₂-triples (Tau Ceti).

There are no pure inner forms, nilpotent orbits by partitions, Bessel models or automorphic descents.

**The atlas plans the inputs:**
- Arthur's, Mok's and Kaletha–Minguez–Shin–White's classification, with parameters, packets and the outer twist (ModularityAndLanglandsExtensions ML.4; five items planned there);
- Eisenstein series, constant terms and intertwining operators (AutomorphicSpectralTheory AS.1–AS.2);
- tensor product L-functions (AL.3–AL.4 with ML.4);
- the local Langlands correspondence of GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6).

**Nothing plans the paper's subject.** The Gan–Gross–Prasad conjectures, Bessel models and periods, Fourier coefficients attached to nilpotent orbits, automorphic descent and zeta integrals of this kind are absent. The only mention of Gan–Gross–Prasad is a disclaimer in GrossZagierAndArithmeticHeights.

## Routes

**Two new roadmaps.**

1. **`GanGrossPrasadConjecturesForClassicalGroups`** (8 items). It holds the general framework:
   - relevant pairs of pure inner forms;
   - local and global Vogan packets;
   - local Bessel models and their uniqueness;
   - the local conjecture with its known cases (Mœglin–Waldspurger, Beuzart-Plessis, Gan–Ichino, Luo, He);
   - global Bessel periods;
   - the global conjecture.

   It is its own roadmap because PROTOCOL §15 wants one owner for a general notion, and at least six papers in the queue need the same framework. Among them are Beuzart-Plessis–Liu–Zhang–Zhu, Beuzart-Plessis–Chaudouard with and without Zydor, W. Zhang's arithmetic fundamental lemma and Li–Liu. The maintainer's guide for BCGP18 proposes a missing foundational theory (higher Coleman theory) as its own roadmap in the same way.

2. **`TwistedAutomorphicDescents`** (55 items). It holds the paper's own theory, in five layers:
   1. Fourier coefficients and Bessel modules, with the Generic Summand Conjecture;
   2. global zeta integrals of Bessel type and their Euler products;
   3. residues and reciprocal non-vanishing, with Theorem 5.7;
   4. twisted descents, with Theorem 6.10 and Corollary 6.11;
   5. the main theorem and its corollaries.

   It imports the Gan–Gross–Prasad roadmap and the atlas's inputs. Its brief states the final theorems and the open inputs.

**Sources of existing layers (7 items):**
- **AutomorphicSpectralTheory AS.2:** Shahidi's normalization of the intertwining operators, and Theorem 5.1 = Theorem B.2 (normalized operators holomorphic and non-zero for Re(s) ≥ ½). AS.2 builds normalized intertwiners once their normalizing factors are supplied.
- **ModularityAndLanglandsExtensions ML.4:** Proposition B.1 (members of generic L-packets are irreducible standard modules), a property of the packets ML.4 owns.
- **EndoscopicTransferAndUnitaryTraceComparison ET.6:** Tadić's generic unitary dual of p-adic GL_n, which belongs with ET.6's segment and Langlands-quotient theory.
- **AutomorphicFormsOnReductiveGroups AF.1:** Vogan's unitary dual of GL_n(R) and GL_n(C), and the Dixmier–Malliavin lemma.
- **ModularityAndLanglandsExtensions ML.5:** the Ginzburg–Rallis–Soudry descent, as a known transfer. PAPER-BOXER-CALEGARI-GEE-25 routed the image of Cogdell–Kim–Piatetski-Shapiro–Shahidi functoriality to the same layer.

## Source issues (`sourceIssues` E1–E5)

**Two misprints**, present in v1, v3 and v4:
- **E1.** On p. 26 the Bessel partition is printed [(2ℓ+1)1^{𝔫−2ℓ+1}] for [(2ℓ+1)1^{𝔫−2ℓ−1}]. The parts must sum to 𝔫, and (2.9) has the correct form.
- **E2.** In the proof of Theorem B.2 the third type of rank-one operator is printed N(w″_j, τ(φ_i) ⊗ σ_0, s ± α_j), twice, for N(w″_j, τ_j ⊗ σ_0, s ± α_j). The argument that follows is about τ_j.

**Three gaps:**
- **E3. Theorem 4.8** (the unramified computation) and the absolute convergence of the local integrals are deferred, in the generality used, to a preprint of Jiang–Soudry–Zhang.
  - The preprint was cited as "in preparation" already in v1 (2015).
  - No version was found, and a 2025 arXiv paper still cites it as "in preparation".
  - Only the split orthogonal case is published (Soudry 2017, 2018).
  - Theorems 5.3, 5.7 and 7.1 use Theorem 4.8.
- **E4. Theorem 2.1** cites Arthur for the classification of all pure inner forms of orthogonal groups, but Arthur only outlines the non-quasi-split case. The paper's own introduction says so.
  - Ishimoto (arXiv:2301.12143) later proved the odd orthogonal case for generic parameters.
  - No complete proof for even orthogonal inner forms was found.
- **E5. Proposition 2.2** (cuspidality of the first Bessel module) is given no proof beyond "one may extend the proof of [GRS11, Theorem 7.3]", which is written for quasi-split groups.

The paper itself notes a typo in its earlier [JZ14, (3.36)] and a gap in Ginzburg–Jiang–Rallis's work on the same conjecture. Both are recorded in the item notes, since they concern other papers.

## Prerequisites not yet covered

**The basic references:**
- Gan–Gross–Prasad (Astérisque 346), for the conjectures;
- Ginzburg–Rallis–Soudry's book on descent;
- Jiang–Zhang 2014 (GAFA), for the zeta integrals that Section 4 extends;
- Ginzburg–Piatetski-Shapiro–Rallis.

**The unramified computation:** Soudry's published papers, and the unpublished Jiang–Soudry–Zhang preprint.

**The local Gan–Gross–Prasad results:** Mœglin–Waldspurger, Beuzart-Plessis, Gan–Ichino and Luo.

**Uniqueness of Bessel models:** Aizenbud–Gourevitch–Rallis–Schiffmann, Sun–Zhu and Jiang–Sun–Zhu.

**The classification of inner forms:** Kaletha–Minguez–Shin–White, and Ishimoto.

**Jiang's programme:**
- the Fourier-coefficient papers (Jiang 2014, Jiang–Liu 2016);
- Jiang–Liu–Zhang on residues;
- Jiang–Liu–Xu–Zhang on twisted descent for m = 1;
- Jiang–Soudry on irreducibility.

**Residual representations and local analysis:**
- Mœglin 2008 and 2011;
- Soudry 1993;
- Shahidi's book and Kim 2005;
- Heiermann;
- Tadić and Vogan.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Every prerequisite link was checked against Crossref, arXiv or the publisher. Several recalled DOIs turned out to be wrong and were corrected.
- The misprints were confirmed on page images of v4 and in the text of v1 and v3.
