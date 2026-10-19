# Arakelov geometry and heights of abelian varieties, Part II: adelic bigness on curve families

This roadmap is the Part II of ArakelovGeometryAndAbelianHeights (TauCetiRoadmap pull request #1000). That roadmap builds the hermitian degree over rings of integers, arithmetic divisors with smooth Green functions and ĈH¹ on regular arithmetic schemes, heights of algebraic points for metrized line bundles, the Faltings metric and the relative and stable Faltings heights; it explicitly leaves out higher arithmetic intersection products and general adelic intersection theory. This roadmap starts there. Its end points are the two theorems of Xinyi Yuan's "Arithmetic bigness and a uniform Bogomolov-type result" (Annals 203, 2026) that concern the admissible canonical bundle itself:

1. **Bigness.** For a smooth family π : X → S of curves of genus g > 1 with maximal variation over a flat quasi-projective normal integral scheme S over ℤ or a field, Yuan's canonical admissible adelic line bundle ω\_{X/S,a} is nef and big on X, and π\_\*⟨ω\_a, ω\_a⟩ is nef and big on S (Theorems 1.3, 3.1, 3.2; AH.11). Together with the theta identities it gives potential bigness of the theta pullbacks along the Abel, difference and universal-shift maps (Theorems 4.1, 4.5; AH.12).

2. **Uniform comparison.** There are c₃(g), c₄(g) > 0 with c₃·max{h\_Fal(C), 1} ≤ [ω²\_{C/K,a}] ≤ c₄·max{h\_Fal(C), 1} for every curve of genus g over every number field and (non-isotrivial) over every one-variable function field (Theorem 1.4; AH.13).

To get there the roadmap plans the theory those theorems are written in: the projective model case of arithmetic intersection theory (AH.0), Yuan–Zhang's adelic divisors and adelic line bundles on quasi-projective schemes with their analytification, intersection theory, Deligne pairing, volumes, heights, height inequality, fundamental inequality, equidistribution and invariant extensions (AH.1–AH.5), Moriwaki's heights over finitely generated fields (AH.6), Zhang's admissible metrics on curves (AH.7) and their family version (AH.8), the theta identities (AH.9) and the global ε, φ and Noether divisors (AH.10). The uniform Bogomolov theorem itself (Yuan Theorem 1.1) and the small-points bounds are the work of HeightsRationalPointsAndObstructionsPartII, which imports AH.4, AH.5, AH.8, AH.12 and AH.13.

## Reading the plan

Each layer states its targets and then its nodes, numbered §k.i. Definitions and constructions carry an API outline and unit tests that a plausible wrong definition fails; theorems carry hypotheses, a proof route, acceptance checks and prerequisites. Every node cites where its sources state or prove it, in our own words, with theorem and page numbers. The plan is at target level (PROTOCOL.md §2): smaller steps stay in the proof routes. Node identifiers are relative to this roadmap; prerequisites in other roadmaps keep their full identifiers. Every node is a plan, not a formalization.

## Conventions

- k is ℤ (the arithmetic case) or a field (the geometric case). A projective arithmetic variety is an integral scheme projective and flat over ℤ; "quasi-projective arithmetic variety" likewise. All adelic objects are over the base k, written P̂ic(X/k).
- Green functions use −log‖s‖, so d̂iv(f) = (div f, −log\|f\|) and c₁(L̄) = (1/πi)∂∂̄log‖s‖ + δ\_div(s) (Yuan–Zhang §2.1). The parent roadmap uses −log‖s‖² (Gillet–Soulé); the comparison doubles Green functions (§0.1).
- Heights over a number field K are absolute: h\_L̄(x) = deĝ(L̄\|\_x)/[K(x) : ℚ], with archimedean places weighted 1 (real) or 2 (complex). Over a one-variable function field K/k the normalization is by residue degrees over the fixed k: ‖·‖\_v = e^{−[k(v):k] ord\_v}, and h = deĝ/[K(x) : K].
- The Faltings metric is ‖α‖² = (i^{g²}/2^g)∫α∧ᾱ (Faltings' normalization, as in Yuan §4.3.1 and the parent's §2.1); Deligne's and Yuan–Zhang's is (2π)^{−g}\|∫α∧ᾱ\|, and h\_Del = h\_Fal + (g/2)log π (parent §2.7). h\_Fal always denotes the stable height.
- Curves: a smooth relative curve is smooth projective with geometrically connected fibres. The canonical curve-pair and relative admissible-bundle targets assume genus g > 1; Yuan states several results for g > 0, but the genus-one normalization is not proved (PAPER-YUAN-26/E8, E28). Maximal variation means the moduli map S → M\_{g,k} is generically finite (StableReductionPartII MC.6/maximal-variation); over a function field K/k it is taken over the constant field k (PAPER-YUAN-26/E1).
- w = ω̄\_{X/S,a}, D = Ō(Δ)\_a, P = π\_\*⟨w, w⟩, ⟨A, B⟩ = π\_\*⟨A, B⟩, and Θ̄ is the canonical [2]-invariant extension of the symmetric rigidified twice-theta bundle Θ = Δ\_J^\*P^∨ on J = Pic⁰\_{X/S}. ĥ = ½ĥ\_Θ is the Néron–Tate height of the symmetric theta class.
- Graph invariants (ε, φ, τ, δ, δᵢ) are Zhang's, for unit edge lengths on the minimal regular model and \|ϖ\| = e^{−1}; under a finite extension they scale by the ramification index (PAPER-YUAN-26/E3).

## Layer overview

| Layer | Title | Main sources |
| --- | --- | --- |
| AH.0 | Projective arithmetic intersection theory: the model case | Yuan–Zhang §2.1, §§4.2–4.4, §5.2; Yuan 2008 §2 |
| AH.1 | Adelic divisors and adelic line bundles | Yuan–Zhang §§2.2–2.7; Yuan §2.1 pp. 18–21, 23–25 |
| AH.2 | Berkovich analytification and metrized line bundles | Yuan–Zhang Chapter 3, Lemma 5.1.2; Yuan §2.1 pp. 21–22, §3.2 p. 47, §A.6 p. 119 |
| AH.3 | Intersection numbers and the adelic Deligne pairing | Yuan–Zhang §§4.1, 4.5, 4.6; Yuan Lemmas 2.1–2.2 pp. 25–27 |
| AH.4 | Effective sections, volumes and heights | Yuan–Zhang §§5.1–5.3; Yuan §2.1 pp. 22–25, §4.1.2 pp. 63–65, Remark 4.4 p. 67 |
| AH.5 | Equidistribution, invariant extensions and the adelic Hodge bundle | Yuan–Zhang §§5.4, 5.5, 6.1, 6.2; Yuan §3.1.3 pp. 43–44; DeMarco–Mavraki–Ye §4 |
| AH.6 | Moriwaki heights over finitely generated fields | Moriwaki 2000 §3; Gao–Habegger Appendix A; Yuan–Zhang §5.3 |
| AH.7 | Local admissible metrics on curves | Yuan Appendix A, pp. 101–119; Zhang 1993 as reproved there |
| AH.8 | Admissible adelic bundles on curve families | Yuan §§2.2–2.3, pp. 28–35; Yuan–Zhang Theorem 6.5.1 |
| AH.9 | Theta identities and nefness of the admissible canonical bundle | Yuan Theorems 2.9–2.10, pp. 35–38 |
| AH.10 | Graph invariants and the global ε, φ and Noether divisors | Yuan §§3.2–3.4, 4.5.2, pp. 46–55 and 89–91; Zhang 2010; Cinkir 2011; Baker–Rumely 2007; de Jong 2018; Wilms 2017 |
| AH.11 | Bigness of the admissible canonical bundle | Yuan §§3.4–3.5 and §3.1, pp. 40, 55–59 |
| AH.12 | Potential bigness | Yuan §§4.1–4.2, pp. 59–70, and p. 82 |
| AH.13 | Admissible self-intersection and the Faltings height | Yuan §4.3.1, §4.5, pp. 70–73 and 84–96; Wilms 2017, 2022; Looper–Silverman–Wilms |

## How the main proofs are assembled

- AH.0–AH.4 give the adelic language: for a nef adelic line bundle, bigness is positivity of the top self-intersection (adelic Hilbert–Samuel), Siu's inequality makes nef-and-big stable under small nef perturbations, and Deligne pairings of nef-and-big bundles are nef and big.
- AH.7–AH.8 build ω\_{X/S,a} and O(Δ)\_a by admissibility in every fibre over S^an and fix them by the adjunction and pairing isometries; Θ̄ is the Tate limit on the relative Jacobian.
- AH.9: Mumford's theta pullbacks with admissible metrics give 4g(g − 1)w = i\_ω^\*Θ̄ + π^\*P and ⟨i\_ω^\*Θ̄, i\_ω^\*Θ̄⟩ = 16g(g − 1)³P, so w and P are nef.
- AH.10–AH.11 (geometric case): P = 12λ − O(E\_S + Δ\_S) by Noether, (2g − 2)Δ\_S ≥ E\_S, P = (2/(3g − 1))O(Φ\_S) + nef by the triple pairing, Φ\_S ≥ Δ\_S/39 by Cinkir; cancelling Δ\_S gives P ≥ (3/(5(2g − 1)(3g − 1)))λ + nef + eff, and λ is nef and big under maximal variation. Arithmetic case: φ ≥ c₀(g) > 0 on all Riemann surfaces of genus g (φ → ∞ at the boundary of moduli by the geometric bound over ℂ), so P ≥ (2/(3g − 1))O(c₀) + nef + eff.
- AH.12: bigness of π\_\*⟨L^{e+1}⟩ is equivalent to potential bigness of L (Theorem 4.1), and the theta identities transport bigness of w and P to the Abel, difference and universal-shift families (Theorem 4.5).
- AH.13: over function fields ω\_a² = 12h\_Fal − δ − ε with δ + ε ≤ (A(g) − 1)ω\_a²; over number fields Wilms' φ-bound, the arithmetic Noether formula with Wilms' δ-bound and the boundary-coercive divisor give the two-sided bounds.

### Identities checked while planning

- Theorem 2.9(2): with d²w + 2dᾱ of fibre degree 2gd², the expansion of ⟨i\_α^\*Θ̄, i\_α^\*Θ̄⟩ gives d⁴⟨w,w⟩ + 4d³⟨w,ᾱ⟩ − (4g − 4)d²⟨ᾱ,ᾱ⟩, and substituting ι\_α^\*Θ̄ = −⟨M̄, M̄⟩ for M̄ = (2g − 2)ᾱ − dw into gd⁴⟨w,w⟩ + d²ι\_α^\*Θ̄ gives (g − 1) times it.
- Theorem 2.10: d = 2g − 2 gives d² + 2d = 4g(g − 1) and d²(d² + 4d − 4g + 4) = 16g(g − 1)³; for the universal shift ι\_α^\*Θ̄ = [−(2g − 2)]^\*Θ̄ = (2g − 2)²Θ̄ gives 16(g − 1)³Θ̄ + 16g(g − 1)³⟨w,w⟩.
- Theorem 2.10(1) ⇒ nefness: −1/(4g(g − 1)) + 16g(g − 1)³/(64g²(g − 1)⁴) = 0.
- Theorem 3.6: 8 − 24 + 24 + 12(g − 1) = 12g − 4.
- Theorem 3.8: 1 + (39/2)(3g − 1)(2g − 1) ≤ 20(3g − 1)(2g − 1) for g ≥ 2, and 12/20 = 3/5.
- Theorem 4.14(c): 2g log(2π⁴) + 4g log(2π) = 6g log(2π²).
- Cinkir: min over g of t(g) is t(4) = 3/88 > 1/39; A(4) = 1 + (44 + 2)·3 = 139; g = 2 hyperelliptic coefficient 1 + (40.5 + 2)·(5/2) = 107.25.
- One-loop pm-graph of genus g and length ℓ: ε = (g − 1)ℓ/(3g), τ = ℓ/12, and the de Jong identity gives φ = (g − 1)ℓ/(6g).

## Sources and editions

- **Xinyi Yuan**, Arithmetic bigness and a uniform Bogomolov-type result. Annals of Mathematics 203 (2026), no. 1, 15–119; read in the author manuscript dated 21 August 2024 (126 pp., the journal revision date), whose numbering and page numbers (printed = PDF) are used. [Public source](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). SHA-256 `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`. Read 2026-10-19: §1 (pp. 3–16, statements of Theorems 1.1–1.4 and the proof sketch of §1.4); §2.1–2.3 (pp. 18–39: adelic recollections, Lemmas 2.1–2.2, Theorem 2.3, Definition 2.5, Propositions 2.6–2.7, Theorems 2.8–2.10); §3 (pp. 40–59: Theorems 3.1–3.3, Lemma 3.4, §3.2 Lemma 3.5, §3.3 Theorems 3.6–3.7, §3.3.5, Theorem 3.8, Theorem 3.10 and proof, Remark 3.11); §4.1 (Theorem 4.1, pp. 59–63), §4.2 (Theorem 4.2 proof, Lemma 4.3, Remark 4.4, pp. 64–67), Theorem 4.5 (pp. 68–70), §4.3.1 (pp. 70–73), Lemma 4.9 (pp. 75–76), §4.4.1 (p. 78), p. 82, §4.5 (Theorems 4.11 and 4.14 with proofs, Remarks 4.12–4.13, pp. 84–96); Appendix A (pp. 101–119); Bibliography (pp. 120–126).
- **Xinyi Yuan and Shou-Wu Zhang**, Adelic line bundles on quasi-projective varieties. arXiv:2105.13587v9 (14 June 2025), 262 pp.; printed page = PDF page; to appear as cited by DeMarco–Mavraki–Ye (Forum Math. Pi 14 (2026) e4). Yuan cites v6, whose Theorem 5.3.5 is Theorem 5.3.7 here. [Public source](https://arxiv.org/pdf/2105.13587v9). SHA-256 `3de89c1736979c44592447edd3bc5a14be9202fc9a07a0ea9d158e422a25145a`. Read 2026-10-19: §2.1 (pp. 23–28); §§2.2–2.7 statements (pp. 28–62: Lemma 2.4.1, Lemma 2.4.3, Proposition 2.5.1, Definition 2.5.2, Lemma 2.6.1, §2.7); §3.1 Lemma 3.1.1, Propositions 3.3.1 and 3.4.1, §3.4.1, §3.6 statements; §4.1–4.6 statements (Propositions 4.1.1–4.1.2, Theorem 4.1.3, Theorem 4.2.3, Theorem 4.3.1, Lemmas 4.4.1–4.4.4, Lemma 4.6.1); §5.1–5.5 statements (Lemma 5.1.2, Lemma 5.1.7, Theorems 5.2.1, 5.2.2, 5.2.9, 5.3.1, 5.3.3, 5.3.7, 5.3.8, 5.4.3, 5.5.1, §5.3.5); §6.1–6.2 statements (Theorems 6.1.1–6.1.2, 6.2.2–6.2.3), Theorem 6.5.1, Theorem 6.5.4.
- **Xinyi Yuan**, Big line bundles over arithmetic varieties. Inventiones mathematicae 173 (2008), 603–649; read in arXiv:math/0612424v2 (11 January 2012). [Public source](https://arxiv.org/pdf/math/0612424v2). SHA-256 `512d295e84eb99a5905243a4c7498fb5b81dd9c3de1d00c3b163e5c54b01c4bc`. Read 2026-10-19: §2.1, Definition 2.1, Theorem 2.2, Theorem 2.3 and Corollary 2.4 (pp. 10–11).
- **Atsushi Moriwaki**, Arithmetic height functions over finitely generated fields. Inventiones mathematicae 140 (2000), 101–142; read in arXiv:math/9809016v2 (1 June 1999). [Public source](https://arxiv.org/pdf/math/9809016v2). SHA-256 `f555bf087f409fb3587b76010685cf6330d12c59152290e4b280d5a97de68de0`. Read 2026-10-19: §3.1–3.4 (pp. 10–16: polarizations, Definition 3.3.6, Proposition 3.3.7, Propositions 3.4.1–3.4.2); Theorem 4.3 statement (p. 20).
- **Ziyang Gao and Philipp Habegger**, Heights in families of abelian varieties and the Geometric Bogomolov Conjecture. Annals of Mathematics 189 (2019), no. 2, 527–604; read in arXiv:1801.05762v3 (28 January 2019). [Public source](https://arxiv.org/pdf/1801.05762v3). SHA-256 `ffe408dc6ba034b2a635488600decace1e89d61ad04860c391bef9409f2fd34e`. Read 2026-10-19: Appendix A (§§A.1–A.3, pp. 54–57).
- **Laura DeMarco, Niki Myrto Mavraki and Hexi Ye**, Bounded geometry for PCF-special subvarieties. Forum of Mathematics, Pi (2026); read in arXiv:2405.17343v3, whose page numbers are used. [Public source](https://arxiv.org/pdf/2405.17343v3). SHA-256 `bb103ede86e058ca2a2601ce9f6a18bb3590f014ee186f6766c198c0eeeb4384`. Read 2026-10-19: §1 (pp. 1–6, statements and outline); §4 (pp. 19–21: the invariant extensions, Deligne pairings along critical graphs, non-degeneracy, height inequality and equidistribution).
- **Shou-Wu Zhang**, Gross–Schoen cycles and dualising sheaves. Inventiones mathematicae 179 (2010), 1–73; read in arXiv:0812.0371v1. [Public source](https://arxiv.org/pdf/0812.0371v1). SHA-256 `e01d3c31193ff442141931a1c22371d4d4d6f24d4c641bcc5fdb5336d60c2c4c`. Read 2026-10-19: §1.1 and §1.3 (Theorem 1.3.1, Corollary 1.3.3, pp. 3–8); Proposition 2.5.3 (p. 38); Lemma 3.5.4 (p. 62); §4.1 including (4.1.4) (pp. 64–66).
- **Zubeyir Cinkir**, Zhang's conjecture and the effective Bogomolov conjecture over function fields. Inventiones mathematicae 183 (2011), no. 3, 517–562; read in arXiv:0901.3945v2 (3 June 2009), whose theorem numbers are used. [Public source](https://arxiv.org/pdf/0901.3945v2). SHA-256 `378def7b7451ab30e2b6e40aa6acc2abea39c3f04fb7294a0a7ffb88492efff2`. Read 2026-10-19: §2 (Conjectures 2.6–2.8, Theorems 2.9–2.12, pp. 4–5).
- **Matthew Baker and Robert Rumely**, Harmonic analysis on metrized graphs. Canadian Journal of Mathematics 59 (2007), 225–275; read in arXiv:math/0407427v2. [Public source](https://arxiv.org/pdf/math/0407427v2). SHA-256 `2f2f4cdeb472e0c6203644624a1f30c4b2ef7a0809322366d82b699a58dd0e4c`. Read 2026-10-19: §14 (Theorem 14.1 and Lemma 14.4, pp. 36–37).
- **Robin de Jong**, Néron–Tate heights of cycles on Jacobians. Journal of Algebraic Geometry 27 (2018), 339–381; read in arXiv:1610.01932v2. [Public source](https://arxiv.org/pdf/1610.01932v2). SHA-256 `ff03975dc6e54a86581ff584a588d2e93f92153fb10d90f1bec8095863b23cb1`. Read 2026-10-19: Theorem 8.1 (p. 28); Propositions 9.2–9.3 and Theorem 9.4 (pp. 31–33).
- **Robert Wilms**, New explicit formulas for Faltings' delta-invariant. Inventiones mathematicae 209 (2017), 481–539; read in arXiv:1605.00847v3. [Public source](https://arxiv.org/pdf/1605.00847v3). SHA-256 `ea66440d78954d939a1530e7df19a8dea8432c766aec76e5a3ba26f8989b3e09`. Read 2026-10-19: §1.1 (Theorem 1.1, Corollary 1.2, pp. 1–2); §2.1–2.2 including (2.11) (pp. 2–10).
- **Robert Wilms**, On arithmetic intersection numbers on self-products of curves. Journal of Algebraic Geometry 31 (2022), 397–424; read in arXiv:1903.12159v2. [Public source](https://arxiv.org/pdf/1903.12159v2). SHA-256 `279412548e62fb16d1caa1cc0c9d0cbe1aa95c5ddbccc144e82b21b6bd00b590`. Read 2026-10-19: §1 (Theorem 1.2, p. 3).
- **Nicole Looper, Joseph Silverman and Robert Wilms**, A uniform quantitative Manin–Mumford theorem for curves over function fields. arXiv:2101.11593v3. [Public source](https://arxiv.org/pdf/2101.11593v3). SHA-256 `d62e2a0cba65103acdd92f5a48b3db0c96aac75db1b8a71fc9b965c7a93b8629`. Read 2026-10-19: Proposition 6.1 (p. 14).
- **The Stacks Project Authors**, The Stacks Project: universally trivial structure-sheaf pushforward and Frobenius. Online version read 19 October 2026; stable tags 0E0L, 0FW2 and 0CCB; unpaginated. [Public source](https://stacks.math.columbia.edu/tag/0E0L). Read 2026-10-19: Tag 0E0L, Lemma 36.32.6; Tag 0FW2, Lemma 50.19.5 (finite flat relative Frobenius); Tag 0CCB, Lemma 33.36.6 (relative Frobenius is a universal homeomorphism).
- **Rania Wazir**, On the specialization theorem for abelian varieties. arXiv:math/0306438v2 (9 February 2004), 5 pp.; preprint of Bull. London Math. Soc. 38 (2006), 555–560; preprint numbering 0.2–0.3 differs from the published numbering cited by Gao–Habegger. [Public source](https://arxiv.org/pdf/math/0306438v2). SHA-256 `648d2b745e45f470a40be3234ce2269f9331ea923611a79ad45caefe8390ad3a`. Read 2026-10-19: Polarization and height machine, pp. 2–4; Theorems 0.2–0.3 and degree-one base height, pp. 4–5.
- **Zubeyir Cinkir**, Admissible invariants of genus 3 curves. arXiv:1405.7413v1 (28 May 2014), 19 pp.; preprint of Manuscripta Math. 148 (2015), 317–339; preprint page numbers used. [Public source](https://arxiv.org/pdf/1405.7413v1). SHA-256 `0bd5c36bab5c714500386abdcc5ce5f6bf1bef8ad99eb47ba2bc593f0d0d7816`. Read 2026-10-19: Introduction item (iii), p. 1; §6, type XIV and its formulas, pp. 13–14; Concluding summary of the sharp genus-three bounds, p. 18.
- **Éric Gaudron and Gaël Rémond**, Théorème des périodes et degrés minimaux d’isogénies. arXiv:1105.1230v1 (6 May 2011), 38 pp.; preprint of Comment. Math. Helv. 89 (2014), 343–403; preprint page numbers used. [Public source](https://arxiv.org/pdf/1105.1230v1). SHA-256 `d0eefd98c2be51e655bea147341c642b7a568b0709ae801fa9ed845ddbb91ef2`. Read 2026-10-19: §2.3, Definition 2.1, pp. 6–7; Appendix Corollary 8.4, p. 37.

Not read in the original: Faltings (1984) and Moret-Bailly (1989) on arithmetic Noether; Gross–Schoen (1995) on the regular-model height construction; Zhang (1993) on admissible pairings. Their uses are explicitly cited through the sources read here and recorded in G3–G4 where a proof input remains. Wazir and Cinkir’s genus-three paper have now been checked in the public versions listed above.

### Corrections used here

- ArakelovGeometryAndAbelianHeightsPartII/E1 (new, this packet): Yuan p. 78 quotes Bost's bound as h\_Fal ≥ −g log √(2π), which is Bost's bound in Deligne's normalization; with Yuan's Faltings metric it reads h\_Fal ≥ −(g/2)log(2π²) (§13.7). Harmless for the proof.
- ArakelovGeometryAndAbelianHeightsPartII/E2 (new, this packet): Yuan–Zhang p. 72 attaches the metric e^{−g/2} to an arithmetic divisor (D, g) on X^an; consistency with d̂iv(s) = (div s, −log‖s‖) on the same page and with §2.1.2 requires e^{−g} (§2.2).
- Yuan–Zhang §5.3 normalize heights over number fields by the degree over K; this roadmap follows Yuan's absolute normalization by the degree over ℚ (Yuan p. 64), so h\_YZ = [K : ℚ]·h (§4.7).
- ArakelovGeometryAndAbelianHeightsPartII/E3 (independent review): integral adelic Picard pullback in Yuan Lemma 2.1 requires geometrically reduced fibres as well as geometrically connected fibres. Frobenius on an explicit elliptic curve over 𝔽₅ kills a nontrivial order-five line bundle (§3.4); smooth curve families satisfy the corrected hypothesis.
- PAPER-YUAN-26/E1: the function-field branch of Theorem 4.19 needs maximal variation over the constant field (used in the convention on maximal variation).
- PAPER-YUAN-26/E2: the Green function of Φ\_S integrates over the fibre of X ×\_S X (§10.6).
- PAPER-YUAN-26/E3: finite-extension rescaling of δ and φ is by the ramification index (§7.5, §10.3).
- PAPER-YUAN-26/E4, E5: variable names in the resistance triangle inequality and the reference in Theorem 3.10's proof (§10.2, §11.1).
- PAPER-YUAN-26/E6: the arithmetic case of Theorem 3.2 needs φ\_v ≥ 0 at non-archimedean places, supplied by Cinkir (§11.3).
- PAPER-YUAN-26/E8, E28: genus one excluded from the canonical curve-pair and relative admissible-bundle targets (conventions; §7.4, §8.3).
- PAPER-YUAN-26/E9: strong nefness of adelic divisors means limits of nef arithmetic divisors on models (§1.5).
- PAPER-YUAN-26/E11, E12, E14: corrected maps and target groups in Proposition 2.6, the display defining β̄₂ and the recall of Theorem 2.10(2) (§8.2, §8.3, §9.2).
- PAPER-YUAN-26/E16, E22, E25, E30: dim T in Theorem 4.5(4), finiteness in Lemma 4.3, D̃ − c(g)Δ in the proof of Theorem 4.14, λ̄\_{O\_K} (§12.5, §12.4, §13.8, §13.9).
- Citation numbering: Yuan cites the bound φ(Γ) ≥ ℓ(Γ)/39 as Cinkir Theorem 2.11; in Cinkir's arXiv v2 it follows from Theorem 2.9 (Theorem 2.11 there concerns Zhang's ε-conjecture). The published numbering was not compared, so this is recorded here, not as an erratum.
- Yuan cites Yuan–Zhang in its v6 numbering; this roadmap uses v9, where the height inequality is Theorem 5.3.7 (v6: 5.3.5). DeMarco–Mavraki–Ye are cited by their arXiv v3 pages (§4 on pp. 19–21).

## Layer AH.0: Projective arithmetic intersection theory: the model case

Hermitian line bundles with continuous, semipositive and integrable metrics on projective arithmetic varieties, their Monge–Ampère measures, arithmetic intersection numbers by the inductive formula, the metrized Deligne pairing along projective flat morphisms, and arithmetic volumes with the Hilbert–Samuel formula and the Siu inequality. These are the model inputs that every limit construction of the later layers reduces to; the geometric analogue over a field is the ordinary intersection theory of SchemeAndStackFoundations SF.5.

Targets: §0.1 Continuous hermitian line bundles on projective arithmetic varieties; §0.2 Monge–Ampère measures of integrable metrics; §0.3 Arithmetic intersection numbers of integrable hermitian line bundles; §0.4 The metrized Deligne pairing along projective flat morphisms; §0.5 Arithmetic volume, Hilbert–Samuel formula and the Siu inequality on projective models.

Planets: Hermitian line bundle, Arithmetic intersection number, Metrized Deligne pairing, Arithmetic Siu inequality.

### 0.1 Continuous hermitian line bundles on projective arithmetic varieties

`AH.0/hermitian-line-bundles` · definition · planet: Hermitian line bundle

A projective arithmetic variety is an integral scheme X, projective and flat over Spec ℤ. A hermitian line bundle on X is a pair L̄ = (L, ‖·‖) of a line bundle L on X and a continuous metric ‖·‖ on L(ℂ) over the complex analytic space X(ℂ), invariant under complex conjugation. Its Chern current is c₁(L̄) = (1/πi)∂∂̄ log‖s‖ + δ\_div(s) for any meromorphic section s. The metric is semipositive if c₁(L̄) is a positive current, and integrable if L̄ is isometric to a quotient of two semipositive hermitian line bundles. L̄ is nef if the metric is semipositive and the arithmetic degree of L̄ restricted to every closed integral curve of X (horizontal or vertical) is ≥ 0. Isometry classes form the group P̂ic(X) (tensor product), with subgroups P̂ic(X)\_sm ⊂ P̂ic(X)\_int; an arithmetic divisor is (D, g\_D) with g\_D a continuous Green function of D(ℂ) in the normalization g\_D + log\|f\| continuous for a local equation f, and D̂iv(X) → P̂ic(X), (D, g) ↦ (O(D), ‖s\_D‖ = e^{−g}) induces an isomorphism from arithmetic divisor classes. Over a field k the geometric analogue is a projective k-variety with ordinary line bundles, nef meaning nonnegative degree on curves.

**Hypotheses.**

- X integral, projective and flat over ℤ; in the geometric case a projective integral variety over a field k.
- Metrics are continuous (not necessarily smooth) and conjugation invariant.
- Green functions use −log‖s‖, not −log‖s‖²: g\_YZ = ½ g\_GS.

**Construction.**

- Pass from smooth to continuous metrics: the regularity condition is local on X(ℂ) through local embeddings into complex manifolds (Yuan–Zhang §2.1.1).
- Smooth metrics are integrable: twist by a high power of an ample bundle with a positive (pulled back Fubini–Study) metric.
- Semipositivity on an ample bundle agrees with Zhang's notion of uniform limits of smooth semipositive metrics, by the regularization theorem of Coman–Guedj–Zeriahi cited in Yuan–Zhang §2.1.1 (1)–(3).
- For X regular with smooth generic fibre and smooth metrics, (D, g) ↦ (D, 2g) identifies the arithmetic divisors here with those of ArakelovGeometryAndAbelianHeights R35.1 §§1.8–1.9.

**API.**

- `HermitianLineBundle.mk` (constructor): A line bundle with a continuous conjugation-invariant metric on L(ℂ).
- `HermitianLineBundle.tensor` (structure): Tensor product multiplies metrics: ‖s ⊗ t‖ = ‖s‖‖t‖; duals invert them; P̂ic(X) is an abelian group.
- `HermitianLineBundle.pullback` (functoriality): Pullback along morphisms of projective arithmetic varieties, with pullback\_id and pullback\_comp.
- `HermitianLineBundle.chernCurrent` (data): c₁(L̄) = (1/πi)∂∂̄ log‖s‖ + δ\_div(s), independent of s.
- `HermitianLineBundle.IsSemipositive` (data): c₁(L̄) is a positive current; equivalently ∫\_Y f c₁(L̄\|\_Y) ≥ 0 for analytic curves Y and f ≥ 0.
- `HermitianLineBundle.IsIntegrable` (data): Isometric to L̄₁ ⊗ L̄₂^∨ with L̄₁, L̄₂ semipositive.
- `HermitianLineBundle.IsNef` (data): Semipositive with nonnegative arithmetic degree on every closed integral curve.
- `ArithmeticDivisor.toHermitian` (equivalence): D̂iv(X)/P̂r(X) ≅ P̂ic(X), (D, g) ↦ (O(D), e^{−g}).
- `ArithmeticDivisor.compat_R35` (compatibility): On regular X with smooth generic fibre and smooth Green functions, (D, g) ↦ (D, 2g) is the inclusion into R35.1 §1.8 arithmetic divisors.
- `HermitianLineBundle.isometry_iff` (extensionality): An algebraic isomorphism is an isometry exactly when it preserves the norm of local frames at every complex point; two isometries with the same underlying map agree.

**Unit tests.**

- `HermitianLineBundle.smooth_integrable` (characterisation): Every smooth metric on a line bundle over a projective arithmetic variety is integrable.
- `HermitianLineBundle.trivial_degree` (computation): On Spec ℤ, (O, e^{−c}\|·\|) has arithmetic degree c; with Green function convention −log‖1‖ = c.
- `ArithmeticDivisor.green_factor_two` (compatibility): For the principal divisor of f, the Green function here is −log\|f\| while R35.1 §1.8 uses −log\|f\|²: the comparison map doubles Green functions.
- `HermitianLineBundle.not_nef_negative_constant` (non-example): On Spec ℤ the trivial bundle with metric ‖1‖ = e^{c}, c > 0, is semipositive but not nef: its degree is −c < 0.

**Checks.**

- On Spec O\_K a hermitian line bundle is the hermitian line bundle of R35.1 §1.1 and the arithmetic divisor class group is the compactified Picard group of §1.7 (with g\_v halved).
- The trivial bundle with constant metric ‖1‖ = e^{−c} on Spec ℤ has arithmetic degree c.

**Uses.** Yuan–Zhang §2.4, p. 36: model adelic divisors are arithmetic divisors on projective models; Yuan–Zhang §2.5, p. 40: adelic line bundles are limits of rational hermitian line bundles on models; Yuan §2.1, p. 18: the starting objects of the adelic theory over ℤ.

*Needs:* `ArakelovGeometryAndAbelianHeights:R35.1`; `SchemeAndStackFoundations:SF.5/nef-big`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

*Sources:* Yuan–Zhang, §2.1.1–2.1.4, pp. 23–27: Defines continuous, semipositive and integrable metrics, the Chern current, hermitian line bundles on projective arithmetic varieties, arithmetic divisors with the −log‖s‖ convention and the isomorphism from arithmetic divisor classes to isometry classes.

### 0.2 Monge–Ampère measures of integrable metrics

`AH.0/monge-ampere-measures` · construction

Let X be a complex projective variety of dimension n and L̄₁, …, L̄ₙ line bundles with integrable continuous metrics. There is a signed Radon measure c₁(L̄₁)···c₁(L̄ₙ) on X, multilinear and symmetric in the L̄ᵢ, positive when every metric is semipositive, of total mass the degree L₁···Lₙ, and continuous under uniform convergence of semipositive metrics. For a complete non-archimedean field the corresponding Chambert-Loir measures on X^an are those of TropicalAndBerkovichArithmetic TB.6.

**Hypotheses.**

- Complex projective variety, possibly singular; integrable continuous metrics.

**Construction.**

- Reduce to semipositive metrics by multilinearity.
- Define the product of currents inductively by c₁(L̄₁)∧T = dd^c(log‖s‖ T) + δ\_div(s)∧T on locally bounded psh potentials (Bedford–Taylor); continuity under uniform limits is their monotone convergence theorem, as cited in Yuan–Zhang §2.1.1.
- Total mass is computed for smooth metrics by Chern–Weil and passes to limits.

**API.**

- `mongeAmpere` (constructor): c₁(L̄₁)···c₁(L̄ₙ) as a signed Radon measure.
- `mongeAmpere_symm` (simp): Symmetric and multilinear in the L̄ᵢ.
- `mongeAmpere_nonneg` (other): Positive when every metric is semipositive.
- `mongeAmpere_mass` (characterisation): Total mass equals the degree L₁···Lₙ.
- `mongeAmpere_tendsto` (other): Weak convergence under uniform convergence of semipositive metrics.
- `mongeAmpere_model_limit` (characterisation): On smooth metrics recover the wedge of Chern forms; for semipositive metrics recover the weak limit under uniform semipositive approximation, and extend by multilinearity to integrable metrics.

**Unit tests.**

- `mongeAmpere_fubiniStudy` (computation): On ℙ¹(ℂ) with Fubini–Study O(1), c₁ is the normalized area measure (mass 1).
- `mongeAmpere_point` (degenerate): For n = 0 the measure is the counting measure of the point.
- `mongeAmpere_constant_rescale` (characterisation): Rescaling a metric by a positive constant does not change the measure.
- `mongeAmpere_not_positive` (non-example): The difference of two semipositive metrics can give a measure with negative part: integrable is not semipositive.

**Checks.**

- For the Fubini–Study metric on O(1) over ℙⁿ(ℂ), c₁ⁿ is the Fubini–Study probability measure.
- On a curve, c₁(L̄) for an admissible metric is deg(L)·μ\_Ar (GrossZagierAndArithmeticHeights GZ.2).

**Uses.** Yuan–Zhang §2.1.5, p. 27: the archimedean integral in the inductive intersection formula; Yuan–Zhang §3.4 and Theorem 5.4.3, p. 168: canonical measures dμ\_{L,v} of adelic line bundles, the limit of these measures.

*Needs:* `ComplexComparisonPartII:C5`; `TropicalAndBerkovichArithmetic:TB.6/model-measures`; `TropicalAndBerkovichArithmetic:TB.6/semipositive-integrable-metrics`; §0.1 (`AH.0/hermitian-line-bundles`).

*Sources:* Yuan–Zhang, §2.1.1, last paragraph, p. 25: States the existence of the Monge–Ampère measure for integrable metrics on a complex projective variety, by linearity and the Bedford–Taylor approximation.

### 0.3 Arithmetic intersection numbers of integrable hermitian line bundles

`AH.0/arithmetic-intersection-numbers` · construction · planet: Arithmetic intersection number

Let X be a projective arithmetic variety and Z ⊂ X a closed integral subscheme of dimension d. For integrable hermitian line bundles L̄₁, …, L̄\_d define L̄₁···L̄\_d·[Z] ∈ ℝ inductively: for d = 0, [Z] = log #Γ(Z, O\_Z); for d > 0 choose a nonzero rational section s\_d of L\_d on Z with div(s\_d) = Σ aᵢZᵢ and put L̄₁···L̄\_d·[Z] = Σ aᵢ L̄₁···L̄\_{d−1}·[Zᵢ] − ∫\_{Z(ℂ)} log‖s\_d‖ c₁(L̄₁)···c₁(L̄\_{d−1}). The value is independent of s\_d and of the ordering, symmetric and multilinear; it satisfies the projection formula f^*L̄₁···f^*L̄\_d·[Z′] = deg(Z′/Z)·L̄₁···L̄\_d·[Z]; for Z vertical over p it is (L₁\|\_Z···L\_d\|\_Z)·log p; for Z = Spec O\_K it is the arithmetic degree. If every L̄ᵢ is nef the number is ≥ 0. For Z = X write L̄₁···L̄\_d, a symmetric multilinear map P̂ic(X)\_int^{dim X} → ℝ.

**Hypotheses.**

- X a projective arithmetic variety; metrics integrable when Z is horizontal of dimension ≥ 2.

**Construction.**

- Independence of s\_d and symmetry: Stokes/Poincaré–Lelong for the archimedean integral and the algebraic moving lemma for the finite part (the smooth case is Gillet–Soulé; continuous integrable metrics by Zhang's limit argument).
- Projection formula and vertical case by induction on d.
- Nonnegativity for nef bundles: perturb each bundle by a positive rational multiple of an arithmetically ample bundle. Arithmetic Nakai–Moishezon gives strictly small sections of sufficiently high powers of the perturbed bundles; induction gives nonnegative mixed intersections. Pass to zero perturbation by multilinearity and continuity of integrable metrics. No effective section of the original nef bundle is assumed (Yuan–Zhang §4.4.2 and Theorem A.4.1).

**API.**

- `arithIntersection` (constructor): L̄₁···L̄\_d·[Z] ∈ ℝ for integrable hermitian line bundles.
- `arithIntersection_symm` (simp): Symmetric and multilinear.
- `arithIntersection_induction` (characterisation): The inductive formula with any nonzero rational section s\_d.
- `arithIntersection_projection` (functoriality): f^*L̄₁···f^*L̄\_d·[Z′] = deg(Z′/Z)·L̄₁···L̄\_d·[Z].
- `arithIntersection_vertical` (compatibility): For Z over p the value is the geometric intersection number on Z times log p.
- `arithIntersection_nef_nonneg` (other): Nonnegative when all L̄ᵢ are nef.
- `arithIntersection_unique` (extensionality): The symmetric multilinear model pairing is determined by its vertical intersection normalization and its inductive section/integral formula, with continuity under uniform semipositive approximation.

**Unit tests.**

- `arithIntersection_specZ` (computation): On Spec ℤ, (O, ‖1‖ = e^{−c}) has intersection number c.
- `arithIntersection_point` (degenerate): For a closed point Z with residue field 𝔽\_q, [Z] = log q.
- `arithIntersection_constant_shift` (characterisation): Replacing the metric of L̄\_d by e^{−c}‖·‖ adds c·deg(L₁,ℚ···L\_{d−1},ℚ) to the number on X.
- `arithIntersection_not_metric_free` (non-example): For horizontal Z of dimension ≥ 1 the number depends on the metrics: it is not the geometric intersection number of the generic fibre.

**Checks.**

- For X = Spec O\_K the number is deĝ(L̄₁) = log #(L₁/s O\_K) − Σ\_σ log‖s‖\_σ (R35.1 §1.3).
- For O(1) with Fubini–Study metric on ℙ¹\_ℤ the self-intersection is 1/2 in the −log‖s‖ normalization (Gillet–Soulé value for ℙ¹).

**Uses.** Yuan–Zhang Proposition 4.1.1, p. 103: the adelic intersection pairing is the boundary limit of these numbers; Yuan §2.1, p. 22: absolute intersection numbers of adelic line bundles.

*Needs:* §0.1 (`AH.0/hermitian-line-bundles`); §0.2 (`AH.0/monge-ampere-measures`); `ArakelovGeometryAndAbelianHeights:R35.1`; `SchemeAndStackFoundations:SF.5/first-chern`; `SchemeAndStackFoundations:SF.5/degree`.

*Sources:* Yuan–Zhang, §2.1.5, pp. 27–28; §4.4.2, pp. 123–124; Theorem A.4.1, p. 233; Corollary A.4.3, p. 234: Gives the inductive definition, independence of choices, the projection formula, the vertical and arithmetic-curve cases, and the multilinear symmetric pairing on P̂ic(X). The positivity argument uses the arithmetic Nakai–Moishezon theorem recalled in §4.4.2, after ample perturbation.

### 0.4 The metrized Deligne pairing along projective flat morphisms

`AH.0/projective-deligne-pairing` · construction · planet: Metrized Deligne pairing

Let f : X → Y be a projective flat morphism of relative dimension n between integral schemes (projective arithmetic varieties, or projective varieties over a field), and L₁, …, L\_{n+1} line bundles on X. The Deligne pairing ⟨L₁, …, L\_{n+1}⟩\_{X/Y} is a line bundle on Y, symmetric and multilinear, compatible with base change, with ⟨…, f^*M⟩ ≅ M^{deg} (degree of L₁···Lₙ on fibres) and with deg⟨L₁, …, L\_{n+1}⟩ = L₁···L\_{n+1} when dim Y = 1. If the Lᵢ carry integrable continuous metrics then ⟨L₁, …, L\_{n+1}⟩ carries a continuous integrable metric, equal to the fibrewise integral metric over the flat locus, with Chern current f\_*(c₁(L̄₁)···c₁(L̄\_{n+1})), semipositive when all metrics are; the pairing of nef (resp. ample) bundles is nef (resp. ample) in the geometric case, and of nef hermitian line bundles is nef. Over a non-archimedean place the analogous model metric is defined.

**Hypotheses.**

- f projective and flat of pure relative dimension n. For the additional complex metric extension: f has finite Tor-dimension and pure relative dimension, and Y is normal; this extension agrees with the fibrewise metric only over the flat locus V.
- Metrics continuous integrable.

**Construction.**

- Algebraic pairing: Deligne's construction via norms of rational sections, as recalled in Yuan–Zhang §4.2 following Muñoz García.
- Metric: Yuan–Zhang Theorem 4.2.3, with continuity of fibre integrals from Theorem 4.3.1 (flat case, or normal base with unique continuous extension).
- Positivity: Yuan–Zhang Lemmas 4.4.1–4.4.4 (degree on a curve base, nef and ample in the geometric case, arithmetic nefness).

**API.**

- `delignePairing` (constructor): ⟨L₁, …, L\_{n+1}⟩\_{X/Y} ∈ Pic(Y), symmetric multilinear.
- `delignePairing_baseChange` (functoriality): In the flat case, the algebraic pairing and its metric commute with base change. For the additional normal-base finite-Tor metric extension, require the image of Y′ to meet the flat locus V and X ×\_Y Y′ → Y′ to have finite Tor-dimension (Theorem 4.2.3(2)).
- `delignePairing_pullback` (simp): ⟨L₁, …, Lₙ, f^*M⟩ ≅ M^{⊗(L₁···Lₙ)\_fibre}.
- `delignePairing_metric` (data): The continuous integrable metric of Yuan–Zhang Theorem 4.2.3.
- `delignePairing_chern` (characterisation): c₁ of the metrized pairing is f\_*(c₁(L̄₁)···c₁(L̄\_{n+1})).
- `delignePairing_nef` (other): Pairing of nef bundles is nef; of ample bundles is ample (geometric case).
- `delignePairing_symbol` (characterisation): Local rational frames with properly intersecting divisors give Deligne symbols; changing one frame by a rational function multiplies the symbol by its norm on the intersection of the remaining divisors. The inductive integral formula determines its metric.

**Unit tests.**

- `delignePairing_relDimZero` (computation): For a finite flat f of degree r and L = O\_X, ⟨L⟩ = O\_Y; for L = f^*M, ⟨L⟩ = M^r.
- `delignePairing_curveBase_degree` (compatibility): Over a smooth projective curve Y, deg⟨L₁, L₂⟩\_{X/Y} = L₁·L₂ on the surface X.
- `delignePairing_constant_metric` (characterisation): Scaling the metric of L₁ by e^{−c} scales the pairing metric by e^{−c·(L₂···L\_{n+1})\_fibre}.
- `delignePairing_nonflat_nonexample` (non-example): For a nonflat finite-Tor morphism with normal base, the continuous metric is the extension from the flat locus, and need not equal the fibrewise integral at exceptional fibres. The flat case has no such qualification.

**Checks.**

- For n = 0 and f finite flat, ⟨L⟩ is the norm N\_{X/Y}(L).
- When dim Y = 1 over a field, the degree of ⟨L₁, …, L\_{n+1}⟩ is L₁···L\_{n+1} (Yuan–Zhang Lemma 4.4.1(1)).

**Uses.** Yuan–Zhang Theorem 4.1.3, p. 106: the adelic Deligne pairing is the limit of these model pairings; Yuan Lemma 2.2, pp. 26–27: positivity of Deligne pairings of nef and big bundles.

*Needs:* §0.1 (`AH.0/hermitian-line-bundles`); §0.3 (`AH.0/arithmetic-intersection-numbers`); `SchemeAndStackFoundations:SF.5/first-chern`.

*Sources:* Yuan–Zhang, Theorem 4.2.3, pp. 112–113; Theorem 4.3.1, p. 113; Lemmas 4.4.1–4.4.4, pp. 121–125: Constructs the continuous integrable metric on the Deligne pairing with fibral, base-change, symmetry, Chern-current and semipositivity properties; proves continuity of fibre integrals; proves the degree formula and nefness/ampleness of the pairing in the projective case.

### 0.5 Arithmetic volume, Hilbert–Samuel formula and the Siu inequality on projective models

`AH.0/projective-volume-siu` · theorem · planet: Arithmetic Siu inequality

Let X be a projective arithmetic variety of dimension d and L̄ a hermitian line bundle. The set Ĥ⁰(X, L̄) of sections with sup-norm ≤ 1 is finite; put ĥ⁰ = log #Ĥ⁰. The limit vol^(L̄) = lim d!·ĥ⁰(mL̄)/m^d exists; L̄ is big if vol^(L̄) > 0. (1) If L̄ is nef then vol^(L̄) = L̄^d (arithmetic Hilbert–Samuel). (2) If L̄, M̄ are nef then vol^(L̄ − M̄) ≥ L̄^d − d·L̄^{d−1}·M̄ (arithmetic Siu inequality). (3) vol^ is continuous and homogeneous of degree d. The geometric analogues over a field hold with h⁰ = dim H⁰.

**Hypotheses.**

- X projective arithmetic variety of dimension d (or projective variety over k).
- Nefness as in AH.0/hermitian-line-bundles.

**Proof route.**

- Finiteness of Ĥ⁰: a lattice intersected with a compact ball.
- Existence of the limit and continuity: Chen and Yuan for smooth metrics, extended to continuous metrics by uniform approximation; recalled in Yuan–Zhang §5.2 (Theorem 5.2.1 proof).
- Hilbert–Samuel: Gillet–Soulé arithmetic Riemann–Roch and Zhang's extension to nef, recalled in Yuan–Zhang Theorem 5.2.2 discussion.
- Siu inequality: Yuan 2008 Theorem 2.2 proves, for ample L̄, M̄ and any Ē, χ\_sup(Ē + N(L̄ − M̄)) ≥ (L̄^d − d L̄^{d−1}M̄)N^d/d! + o(N^d); since ĥ⁰ ≥ χ\_sup asymptotically (Yuan 2008 §2, with h⁰ counting ‖s‖\_sup < 1, which has the same volume), vol^(L̄ − M̄) ≥ L̄^d − d L̄^{d−1}M̄ for ample L̄, M̄, and for nef ones by approximation and continuity of the volume (Moriwaki, cited in Yuan 2008 p. 8; Yuan–Zhang Theorems 5.2.2 and 5.2.9).

**Checks.**

- For L̄ = (O, e^{−c}) on Spec ℤ (d = 1), ĥ⁰(mL̄) = log(2⌊e^{mc}⌋ + 1), so vol^ = c = L̄ when c > 0.
- Siu numerics: A nef big, B nef ⇒ vol^(A − εB) > 0 for 0 < ε < A^d/(d A^{d−1}B).

**Uses.** Yuan–Zhang Theorems 5.2.1–5.2.2, p. 141: limit to adelic volumes.

*Needs:* §0.3 (`AH.0/arithmetic-intersection-numbers`); §0.1 (`AH.0/hermitian-line-bundles`); `SchemeAndStackFoundations:SF.5/big-line`.

*Sources:* Yuan 2008, Definition 2.1, p. 10; Theorem 2.2, p. 10; Theorem 2.3 and Corollary 2.4, p. 11: Defines big hermitian line bundles by growth of h⁰ and χ\_sup, proves the lower bound χ\_sup(E + N(L − M)) ≥ (L^n − nL^{n−1}M)N^n/n! + o(N^n) for ample L, M, and characterises bigness.; Yuan–Zhang, Theorem 5.2.2 and the paragraph after it, p. 141; homogeneity and continuity, pp. 139–140 and Theorem 5.2.9, p. 148: States Hilbert–Samuel and Siu for nef adelic line bundles, noting that the strongly nef case is the limit of the projective counterpart, and proves continuity of the volume.

**Refinements left for the lemma-level pass.**

- Lemma-level decomposition of the inductive intersection formula (independence of the section and symmetry) for continuous integrable metrics on singular projective arithmetic varieties.
- Bedford–Taylor products on singular complex projective varieties: owner to be confirmed (gap G2).

## Layer AH.1: Adelic divisors and adelic line bundles

Yuan–Zhang adelic divisors and adelic line bundles on flat quasi-projective integral schemes over k = ℤ or a field: model adelic divisors of mixed coefficients, the boundary norm and its completion, the groupoid P̂ic(U/k) of adelic line bundles, the divisor presentation, effectivity, strong nefness, nefness and integrability, pullbacks, limits to essentially quasi-projective schemes (global fields, finitely generated fields), the archimedean base (ℂ, \|·\|), and the comparison with the compactified Picard group of an arithmetic curve.

Targets: §1.1 Model adelic divisors of mixed coefficients; §1.2 The boundary norm and adelic divisors; §1.3 The groupoid of adelic line bundles; §1.4 Divisor presentation of the adelic Picard group; §1.5 Effective, strongly nef, nef and integrable adelic line bundles; §1.6 Adelic line bundles over global fields and finitely generated fields; §1.7 Adelic divisors over the archimedean base (ℂ, |·|); §1.8 Adelic line bundles on an arithmetic curve.

Planets: Adelic divisor, Adelic line bundle, Nef and integrable adelic line bundles.

### 1.1 Model adelic divisors of mixed coefficients

`AH.1/model-adelic-divisors` · construction

Let k be ℤ or a field and U a flat quasi-projective integral k-scheme. A projective model of U is a projective integral k-scheme X (flat over k when k = ℤ) with an open immersion U → X. Put D̂iv(X, U) = D̂iv(X)\_ℚ ×\_{Div(U)\_ℚ} Div(U): pairs of an arithmetic ℚ-divisor on X (arithmetic divisors with continuous Green functions when k = ℤ; Cartier ℚ-divisors when k is a field) and an integral Cartier divisor on U with the same restriction. The group of model adelic divisors is D̂iv(U/k)\_mod = colim\_X D̂iv(X, U) over projective models, along pullback. It is partially ordered by effectivity (D ≥ 0 if on some model both the rational arithmetic divisor and the integral Cartier divisor on U are effective). The principal model divisors d̂iv(f), f ∈ k(U)^×, form a subgroup P̂r(U/k)\_mod.

**Hypotheses.**

- U flat, quasi-projective and integral over k.
- Mixed coefficients: rational on the model, integral on U.

**Construction.**

- Pullback along a morphism of models dominating each other is injective on D̂iv(X, U) for models integrally closed in U (Yuan–Zhang Lemma 2.3.6–2.3.7).
- The colimit is filtered because any two projective models are dominated by a third (closure of the diagonal).

**API.**

- `ModelAdelicDivisor.ofModel` (constructor): The image of D̂iv(X, U) for a projective model X.
- `ModelAdelicDivisor.pullback_eq` (extensionality): Two representatives agree iff they agree after pullback to a common dominating model.
- `ModelAdelicDivisor.le` (instance): D ≤ D′ iff on a common model the rational arithmetic part of D′ − D and its integral restriction to U are both effective.
- `ModelAdelicDivisor.toDiv` (projection): The underlying integral Cartier divisor on U.
- `ModelAdelicDivisor.principal` (constructor): d̂iv(f) for f ∈ k(U)^×.

**Unit tests.**

- `ModelAdelicDivisor.projective_case` (compatibility): If U is projective over k, D̂iv(U/k)\_mod is the group of arithmetic divisors of U with integral underlying divisor.
- `ModelAdelicDivisor.zero_underlying` (degenerate): For U = Spec ℤ every model divisor with zero underlying divisor is (0, c) with c ∈ ℝ (constant Green function).
- `ModelAdelicDivisor.mixed_coeff_nonexample` (non-example): A ℚ-divisor on U with non-integral coefficient (e.g. ½[p] on Spec ℤ) is not in D̂iv(U/k)\_mod.

**Checks.**

- For U projective, D̂iv(U/k)\_mod = D̂iv(U)\_ℚ ×\_{Div(U)\_ℚ} Div(U) = D̂iv(U) when Div(U) is torsion free.
- Effectivity is checked on one model dominating both representatives.

**Uses.** Yuan–Zhang §2.4.2, p. 36: completion in the boundary topology; Yuan §2.1, p. 18: item PAPER-YUAN-26/4.

*Needs:* §0.1 (`AH.0/hermitian-line-bundles`).

*Sources:* Yuan–Zhang, §2.2 and §2.4.1, pp. 28–37: Introduces objects of mixed coefficients and the model adelic divisor group as a colimit over projective models.; Yuan, §2.1, p. 18: Recalls D̂iv(X, U), D̂iv(U/k)\_mod and effectivity in the paper's notation.

### 1.2 The boundary norm and adelic divisors

`AH.1/boundary-topology` · definition · planet: Adelic divisor

A boundary divisor of U is a pair (X₀, E₀) of a projective model X₀ and an effective Cartier divisor E₀ supported exactly on X₀ ∖ U when k is a field, or a strictly effective arithmetic divisor E₀ whose finite part has that support when k = ℤ. For D ∈ D̂iv(U/k)\_mod put ‖D‖\_{E₀} = inf{ε ∈ ℚ\_{>0} : −εE₀ ≤ D ≤ εE₀} (∞ if no such ε). This is a norm in the sense ‖D‖ = 0 iff D = 0, ‖D₁ + D₂‖ ≤ ‖D₁‖ + ‖D₂‖, ‖aD‖ ≤ \|a\|‖D‖ for nonzero integers a, and two boundary divisors give equivalent norms. The group D̂iv(U/k) of adelic divisors is the completion of D̂iv(U/k)\_mod for the boundary topology; a representative Cauchy sequence (Dᵢ) satisfies −εᵢE₀ ≤ D\_j − Dᵢ ≤ εᵢE₀ for j ≥ i with εᵢ → 0, and its underlying divisor on U is eventually constant (and constant after discarding an initial segment).

**Hypotheses.**

- A boundary divisor exists after blowing up; strict effectivity includes a strictly positive Green function in the arithmetic case.

**Construction.**

- Norm axioms and equivalence of norms: Yuan–Zhang Lemma 2.4.1, comparing E₀ and E′₀ on a common model.
- Underlying divisors of a Cauchy sequence are eventually constant since ‖D‖ < 1 forces the integral part on U to vanish.

**API.**

- `boundaryNorm` (constructor): ‖D‖\_{E₀} ∈ [0, ∞].
- `boundaryNorm_eq_zero` (characterisation): ‖D‖ = 0 iff D = 0.
- `boundaryNorm_add_le` (other): Triangle inequality.
- `boundaryNorm_equiv` (equivalence): For two boundary divisors there is r > 1 with r⁻¹‖·‖\_{E₀} ≤ ‖·‖\_{E′₀} ≤ r‖·‖\_{E₀}.
- `AdelicDivisor` (constructor): The completion D̂iv(U/k), with its partial order (closure of the effective cone).
- `AdelicDivisor.underlying` (projection): The underlying integral Cartier divisor on U.
- `AdelicDivisor.completion_lift` (universal-property): The model map has dense image; every uniformly continuous homomorphism from the model group to a complete Hausdorff uniform abelian group extends uniquely to its completion. Equality in the completion means that the difference of representative Cauchy sequences tends to zero.

**Unit tests.**

- `boundaryNorm_self` (computation): For a nonzero boundary E₀, ‖E₀‖\_{E₀} = 1; the zero boundary has ‖0‖₀ = 0.
- `boundaryNorm_projective` (degenerate): If U is projective over a field, E₀ = 0 and the boundary norm is ∞ off 0. For arithmetic U this discreteness assertion fails.
- `boundaryNorm_scalar` (characterisation): ‖2D‖ = 2‖D‖ when 2D ≠ 0 in Div(U) or D has zero underlying divisor.
- `boundaryNorm_strict_nonexample` (non-example): The scaling inequality ‖aD‖ ≤ \|a\|‖D‖ is strict only when the underlying divisor D̄ is nonzero (so ‖D‖ = ∞) but aD̄ = 0 in Div(U); for normal U, Div(U) is torsion free and ‖aD‖ = \|a\|‖D‖ for every nonzero integer a.
- `boundaryNorm_arithmetic_constant` (computation): On Spec ℤ with E₀ = (0, 1), ‖(0, c)‖\_{E₀} = \|c\| for every real c; constants tending to zero give a nonconstant convergent sequence.

**Checks.**

- For a nonzero boundary E₀, ‖E₀‖ = ‖−E₀‖ = 1; a divisor with nonzero integral restriction to U has norm ∞. For E₀ = 0 the norm at 0 is 0.
- If U is projective over a field, take E₀ = 0: the topology is discrete. For projective arithmetic U, take E₀ = (0, 1): the norm of (0, g) is sup\|g\|, while nonzero underlying divisors have infinite norm. The model divisor group is complete in both cases, for different reasons.

**Uses.** Yuan–Zhang §2.5, p. 40: adelic line bundles are boundary-Cauchy sequences of model hermitian bundles; Yuan–Zhang Theorem 6.1.1, p. 180: convergence of the Tate limit of a polarized dynamical system.

*Needs:* §1.1 (`AH.1/model-adelic-divisors`).

*Sources:* Yuan–Zhang, §2.4.1 and Lemma 2.4.1, pp. 36–38; Remark 2.4.2, p. 38: Defines boundary divisors, the boundary norm, proves the norm properties and equivalence for different boundaries, and defines adelic divisors as the completion.; Yuan, §2.1, pp. 18–19: Recalls the boundary norm and completion; items PAPER-YUAN-26/5–6.

### 1.3 The groupoid of adelic line bundles

`AH.1/adelic-line-bundles` · construction · planet: Adelic line bundle

A rational hermitian line bundle on a projective model X is a pair (a, L̄) with a ∈ ℚ and L̄ hermitian (ordinary when k is a field); morphisms aL̄ → a′L̄′ are colim\_m Isom(amL̄, a′mL̄′). An adelic line bundle on U/k is an integral line bundle L on U together with projective models Xᵢ, rational hermitian bundles L̄ᵢ on Xᵢ and isomorphisms ℓᵢ : L → L̄ᵢ\|\_U in Pic(U)\_ℚ such that the model adelic divisors d̂iv(ℓᵢℓ₁⁻¹) form a boundary-Cauchy sequence. A morphism is an isomorphism ι : L → L′ with d̂iv(ℓ′ᵢ ι ℓᵢ⁻¹) → 0. This gives a groupoid P̂ic(U/k) with a forgetful functor to line bundles on U; isomorphism classes form the group P̂ic(U/k). Pullback along morphisms U′ → U of flat quasi-projective integral k-schemes and tensor products are defined termwise.

**Hypotheses.**

- U flat quasi-projective integral over k.

**Construction.**

- Convergence and well-definedness: Yuan–Zhang §2.5.1 and Proposition 2.5.1.
- Pullback: choose models of U′ over models of U; boundary divisors pull back to effective divisors bounded by a boundary divisor of U′.

**API.**

- `AdelicLineBundle.mk` (constructor): From (L, (Xᵢ, L̄ᵢ, ℓᵢ)) with boundary-Cauchy divisors.
- `AdelicLineBundle.toLineBundle` (projection): The underlying line bundle on U.
- `AdelicLineBundle.tensor` (structure): Tensor product; P̂ic(U/k) is an abelian group.
- `AdelicLineBundle.pullback` (functoriality): Pullback along morphisms of flat quasi-projective integral k-schemes; pullback\_id, pullback\_comp.
- `AdelicLineBundle.ofModel` (coercion): A hermitian line bundle on a projective model gives an adelic line bundle.
- `AdelicLineBundle.iso_iff` (extensionality): Two objects are isomorphic iff some ι makes d̂iv(ℓ′ᵢιℓᵢ⁻¹) → 0.

**Unit tests.**

- `AdelicLineBundle.projective_eq` (compatibility): For U projective over k, P̂ic(U/k) ≅ P̂ic(U) of AH.0.
- `AdelicLineBundle.trivial_specZ` (computation): On Spec ℤ, P̂ic(ℤ/ℤ) ≅ ℝ by arithmetic degree.
- `AdelicLineBundle.underlying_trivial` (degenerate): The kernel of P̂ic(U/k) → Pic(U) contains O(c) for every constant c (k = ℤ).
- `AdelicLineBundle.not_model` (non-example): On U = Spec ℤ[1/p], choose an irrational real a. Rational multiples aᵢ[p] on Spec ℤ with aᵢ → a define a boundary-Cauchy adelic divisor with zero restriction to U. Its adelic line bundle cannot be represented by a rational model divisor: its p-coordinate is irrational modulo integral principal divisors. This follows from the arithmetic-curve calculation in AH.1/arithmetic-curve-comparison.

**Checks.**

- For U projective, P̂ic(U/k) is the groupoid of hermitian line bundles of AH.0 (integral coefficients).
- The forgetful functor is surjective on objects when U has a projective model on which L extends.

**Uses.** Yuan §2.2, p. 28: the canonical admissible bundles are adelic line bundles on X and X²\_{/S}; DeMarco–Mavraki–Ye §4, p. 19: P̂ic(X)\_{ℚ,nef} on quasi-projective varieties over number fields.

*Needs:* §1.2 (`AH.1/boundary-topology`); §0.1 (`AH.0/hermitian-line-bundles`).

*Sources:* Yuan–Zhang, §2.5.1–2.5.2, pp. 40–43: Defines rational hermitian line bundles, adelic line bundles as boundary-Cauchy systems with identifications, morphisms, and the categories of strongly nef, nef and integrable ones.; Yuan, §2.1, pp. 19–20: Recalls the adelic line bundle groupoid; items PAPER-YUAN-26/7–8.

### 1.4 Divisor presentation of the adelic Picard group

`AH.1/divisor-presentation` · theorem

The map D̂iv(U/k) → P̂ic(U/k), D ↦ O(D), is surjective, and its kernel is the image of the principal model divisors P̂r(U/k)\_mod; thus D̂iv(U/k)/P̂r(U/k)\_mod ≅ P̂ic(U/k).

**Hypotheses.**

- U flat quasi-projective integral over k.

**Proof route.**

- Send a Cauchy sequence (Dᵢ) to (O(D₁\|\_U), (Xᵢ, O(Dᵢ), ℓᵢ)).
- Surjectivity: choose a rational section of L and its divisors on the models.
- Kernel: an isomorphism O(D) ≅ O is given by a rational function f; the limit of d̂iv is then d̂iv(f) (P̂r is discrete in D̂iv: Yuan–Zhang Lemma 2.4.3).

**Checks.**

- On Spec O\_K the presentation is the arithmetic-curve sequence of AH.1/arithmetic-curve-comparison.

*Needs:* §1.3 (`AH.1/adelic-line-bundles`).

*Sources:* Yuan–Zhang, Proposition 2.5.1, pp. 41–42; Lemma 2.4.3, p. 39: Proves the canonical isomorphism from adelic divisor classes to adelic Picard classes; principal model divisors are discrete.; Yuan, §2.1, p. 20: Recalls the presentation; item PAPER-YUAN-26/9.

### 1.5 Effective, strongly nef, nef and integrable adelic line bundles

`AH.1/positivity-notions` · definition · planet: Nef and integrable adelic line bundles

An adelic divisor is effective if it is a boundary limit of effective model divisors; an adelic line bundle class is effective if it is O(D) for an effective D. An adelic line bundle is strongly nef if it is isomorphic to an object (L, (Xᵢ, L̄ᵢ, ℓᵢ)) with every L̄ᵢ nef; nef if there is a strongly nef M̄ with aL̄ + M̄ strongly nef for all integers a ≥ 1; integrable if it is a difference of two strongly nef ones. P̂ic(U/k)\_snef ⊂ P̂ic(U/k)\_nef are semigroups and P̂ic(U/k)\_int is a group; the same words apply to adelic divisors through O(·). For divisors, strongly nef means a limit of nef arithmetic divisors on projective models (source issue PAPER-YUAN-26/E9).

**Hypotheses.**

- U flat quasi-projective integral over k.

**Construction.**

- Semigroup properties from the model case.
- Strongly nef ⇒ nef ⇒ integrable: take M̄ = L̄, resp. aL̄ + M̄ − M̄.

**API.**

- `AdelicDivisor.IsEffective` (data): Limit of effective model divisors.
- `AdelicLineBundle.IsStronglyNef` (data): Represented by nef model bundles.
- `AdelicLineBundle.IsNef` (data): ∃ strongly nef M̄, ∀ a ≥ 1, aL̄ + M̄ strongly nef.
- `AdelicLineBundle.IsIntegrable` (data): Difference of two strongly nef bundles.
- `AdelicLineBundle.nef_add` (other): Sums and positive rational multiples of nef bundles are nef.
- `AdelicLineBundle.snef_nef_int` (other): Strongly nef ⇒ nef ⇒ integrable.

**Unit tests.**

- `AdelicLineBundle.nef_projective` (compatibility): For U projective, nef in this sense equals nef in AH.0.
- `AdelicLineBundle.constant_nef` (computation): On Spec ℤ, O(c) is nef iff c ≥ 0.
- `AdelicLineBundle.zero_nef` (degenerate): The trivial adelic line bundle is strongly nef.
- `AdelicLineBundle.integrable_not_nef` (non-example): O(−1) on Spec ℤ (c = −1) is integrable but not nef.

**Checks.**

- On a projective U, nef adelic = nef hermitian (AH.0).

**Uses.** Yuan Theorem 2.10, p. 37: ω\_a is a positive combination of nef bundles hence nef; Yuan–Zhang Proposition 4.1.1, p. 103: intersection numbers are defined on integrable bundles and are ≥ 0 on nef ones.

*Needs:* §1.3 (`AH.1/adelic-line-bundles`); §0.1 (`AH.0/hermitian-line-bundles`).

*Sources:* Yuan–Zhang, Definition 2.5.2, pp. 42–43; Definition 5.1.1, p. 133: Defines strongly nef, nef and integrable adelic line bundles; defines effective adelic divisors as limits of Cauchy sequences of effective model divisors.; Yuan, §2.1, pp. 20–21: Recalls effectivity, strong nefness, nefness and integrability; items PAPER-YUAN-26/10–13.

### 1.6 Adelic line bundles over global fields and finitely generated fields

`AH.1/essentially-quasi-projective` · construction

For a flat essentially quasi-projective integral k-scheme X (a filtered limit of open subschemes of quasi-projective models), put P̂ic(X/k) = colim\_U P̂ic(U/k) over quasi-projective models U of X, and likewise for divisors and for the strongly nef, nef, integrable and effective parts. In particular, for K a number field (k = ℤ, B = Spec O\_K) or the function field of a regular projective k-curve B, and X a quasi-projective K-variety, P̂ic(X/k) is the limit over flat quasi-projective integral B-models U with X open in U\_K; an isomorphism over X represents an adelic isomorphism if it extends with its metric on a common open model. For a finitely generated field F over k the same applies to Spec F and to F-varieties.

**Hypotheses.**

- X flat essentially quasi-projective integral over k.

**Construction.**

- Transition maps are pullbacks along open immersions of models (Yuan–Zhang §2.3, Lemmas 2.3.2–2.3.7).
- Positivity notions are preserved by the transition maps, so they pass to the colimit.

**API.**

- `AdelicLineBundle.ofField` (constructor): P̂ic(F/k) for a finitely generated field F.
- `AdelicLineBundle.restrictGeneric` (projection): P̂ic(U/k) → P̂ic(X/k) for a model U of X.
- `AdelicLineBundle.toRelative` (projection): P̂ic(X/k) → P̂ic(X/K) (forget the vertical/archimedean data over the base), written L ↦ L̃.
- `AdelicLineBundle.colim_positivity` (other): Nef, integrable and effective classes form the colimits of the corresponding model classes.
- `AdelicLineBundle.colim_iso_iff` (extensionality): Two presentations give the same adelic isomorphism class precisely when their restrictions are isometrically isomorphic on a common quasi-projective model; transition maps commute with tensor product and pullback.

**Unit tests.**

- `AdelicLineBundle.numberField_point` (computation): For X = Spec K, P̂ic(K/ℤ) ⊗ ℝ has the arithmetic degree map onto ℝ.
- `AdelicLineBundle.identity_model` (degenerate): If X is itself quasi-projective over k, P̂ic(X/k) is the group of AH.1/adelic-line-bundles.
- `AdelicLineBundle.relative_forgets` (non-example): P̂ic(X/k) → P̂ic(X/K) is not injective: O(c) pulled back from Spec ℤ maps to 0.

**Checks.**

- P̂ic(K/ℤ) for a number field K is the limit of P̂ic(U/ℤ) for open U ⊂ Spec O\_K (AH.1/arithmetic-curve-comparison).

**Uses.** Yuan §4.1.2, p. 63: heights of points over global fields; Gao–Habegger Appendix A, p. 54: Moriwaki polarizations of a finitely generated field (AH.6).

*Needs:* §1.3 (`AH.1/adelic-line-bundles`); §1.5 (`AH.1/positivity-notions`).

*Sources:* Yuan–Zhang, §2.3 and §2.5.3, pp. 32–36 and 43: Introduces essentially quasi-projective schemes and defines adelic line bundles on them as colimits over quasi-projective models.; Yuan, §2.1, pp. 23–25: Recalls the global-field setting X/K/k and the descent of effectivity, nefness, integrability, analytification and intersection; item PAPER-YUAN-26/27.

### 1.7 Adelic divisors over the archimedean base (ℂ, |·|)

`AH.1/complex-base` · construction

For the base (ℂ, \|·\|) and a quasi-projective complex variety M with projective models X, take B = (Spec ℂ, {id}) and form colim\_X D̂iv(X, M), where D̂iv(X, M) = D̂iv(X)\_ℚ ×\_{Div(M)\_ℚ} Div(M); a representative consists of a rational model divisor with continuous Green function and a compatible integral Cartier divisor on M and complete it in the topology of a strictly positive metrized boundary (E₀, g₀). Arithmetic adelic divisors on a flat quasi-projective ℤ-scheme specialize to this group by restricting to the complex fibre, retaining both the geometric divisor and the archimedean Green function.

**Hypotheses.**

- M quasi-projective over ℂ.

**Construction.**

- Use the valued base scheme B = (Spec ℂ, {id}) of Yuan–Zhang §2.7.2, with mixed coefficients and boundary completion as in §§2.7.3–2.7.4.
- Specialization: pull back models along Spec ℂ → Spec ℤ; boundary divisors restrict to boundary divisors.

**API.**

- `AdelicDivisor.complex` (constructor): D̂iv(M/(ℂ,\|·\|)).
- `AdelicDivisor.specializeComplex` (functoriality): D̂iv(U/ℤ) → D̂iv(U\_ℂ/(ℂ,\|·\|)).
- `AdelicDivisor.complex_green` (projection): The Green function on M(ℂ).
- `AdelicDivisor.complex_eq_iff` (extensionality): Representatives define the same complex-base adelic divisor exactly when their difference tends to zero in a common boundary topology; specialization preserves principal divisors and tensor products.

**Unit tests.**

- `AdelicDivisor.complex_projective` (compatibility): For M projective, this is the group of arithmetic divisors on M with integral Cartier divisor and continuous Green function. Its tensor product with ℚ is the rational version.
- `AdelicDivisor.complex_zero` (degenerate): For M a point, the group is ℝ (constant Green functions).
- `AdelicDivisor.complex_unbounded_nonexample` (non-example): A continuous function on ℂ^× growing like \|log\|z\|\|² at 0 is not the Green function of a zero-underlying adelic divisor on ℂ^× ⊂ ℙ¹: the boundary norm bounds growth by a multiple of log\|z\|.

**Checks.**

- A zero-underlying adelic divisor has a continuous Green function on M(ℂ), obtained by boundary-norm limits; its growth is bounded by a multiple of the boundary Green function. The growth bound alone is not asserted to characterize the image. Rationalizing the entire group is a separate operation.

**Uses.** Yuan Theorem 3.10 proof, p. 58: growth of φ at the boundary of complex moduli.

*Needs:* §1.2 (`AH.1/boundary-topology`).

*Sources:* Yuan–Zhang, §2.7, pp. 54–62: §2.7 defines valued base schemes (including (Spec ℂ, {id})), mixed coefficients on models and integral coefficients on the open variety, and the boundary completion. It does not require a general Banach-ring construction for this specialization.; Yuan, Proof of Theorem 3.10, p. 58: Uses adelic divisors over (ℂ, \|·\|) on the fine moduli space; item PAPER-YUAN-26/111.

### 1.8 Adelic line bundles on an arithmetic curve

`AH.1/arithmetic-curve-comparison` · comparison

Let K be a number field, X = Spec O\_K and U ⊂ X open. With P̂ic⁰ the kernel of the arithmetic degree, there is a canonical exact sequence 0 → (O(U)^×/μ\_K) ⊗\_ℤ (ℝ/ℤ) → P̂ic⁰(U) → Pic(U) → 0 and a canonical isomorphism (K^×/μ\_K) ⊗\_ℤ (ℝ/ℤ) ≅ P̂ic⁰(K) for P̂ic(K) = P̂ic(Spec K/ℤ). In particular P̂ic(Spec O\_K/ℤ) is the compactified Picard group of ArakelovGeometryAndAbelianHeights R35.1 §1.7.

**Hypotheses.**

- K a number field.

**Proof route.**

- Write adelic divisors on U as limits of Arakelov divisors whose finite parts at primes outside U have real coefficients obtained as limits; compute the kernel of degree (Yuan–Zhang Lemma 2.6.1).

**Checks.**

- For K = ℚ: P̂ic⁰(ℚ) ≅ ⊕\_p ℝ/ℤ (one copy for each prime), since ℚ^×/{±1} is free on the primes.
- For U = Spec O\_K, the sequence reduces to the unit-lattice description of the compactified class group.

*Needs:* §1.6 (`AH.1/essentially-quasi-projective`); `ArakelovGeometryAndAbelianHeights:R35.1`.

*Sources:* Yuan–Zhang, Lemma 2.6.1, p. 49: Proves the exact sequence for open subschemes of Spec O\_K and the isomorphism (K^×/μ\_K) ⊗ ℝ/ℤ ≅ P̂ic⁰(K).

**Refinements left for the lemma-level pass.**

- Lemma-level steps of Yuan–Zhang §2.3 (pro-open immersions, Lemmas 2.3.2–2.3.7) behind the colimits.

## Layer AH.2: Berkovich analytification and metrized line bundles

The global Berkovich analytification (U/k)^an over the Banach ring ℤ (or a trivially valued field), analytic arithmetic divisors and continuous metrized line bundles on it, injectivity and full faithfulness of analytification of adelic objects, density of divisorial points, effectivity tested on Green functions, canonical measures on fibres, and canonical metrics over trivially valued fields.

Targets: §2.1 Global Berkovich analytification; §2.2 Analytic arithmetic divisors and continuous metrized line bundles; §2.3 Analytification of adelic divisors and line bundles is injective and fully faithful; §2.4 Density of divisorial points; §2.5 Effectivity is detected by Green functions; §2.6 Canonical measures of integrable adelic line bundles; §2.7 Canonical metrics over a trivially valued field.

Planets: Global Berkovich analytification, Analytification of adelic line bundles.

### 2.1 Global Berkovich analytification

`AH.2/global-analytification` · construction · planet: Global Berkovich analytification

Let k be ℤ (with the archimedean absolute value, a Banach ring) or a field with the trivial absolute value, and U a flat quasi-projective integral k-scheme. U^an = (U/k)^an is obtained by gluing the Berkovich spectra M(A) of multiplicative seminorms on coordinate rings A of affine opens (bounded on k, i.e. trivial on k when k is a field), with the coarsest topology making charts open and v ↦ \|f\|\_v continuous. Each v has a completed residue field H\_v; there is a structure map U^an → M(k). U^an is Hausdorff, path-connected and locally compact, and the fibre over a point of M(ℤ) (a place, or a power of one) is the Berkovich analytification over that complete field.

**Hypotheses.**

- U flat quasi-projective integral over k; for k a field the absolute value on k is trivial.

**Construction.**

- Glue the affine spectra of TropicalAndBerkovichArithmetic TB.0 (Berkovich spectrum of a Banach ring, analytification, hybrid spaces).
- Topological properties: Yuan–Zhang §3.1, recalled in Yuan p. 21.

**API.**

- `globalAnalytification` (constructor): U ↦ (U/k)^an with its map to M(k).
- `globalAnalytification.residueField` (data): H\_v for v ∈ U^an.
- `globalAnalytification.fibre` (compatibility): The fibre over v ∈ M(k) is the analytification of U ⊗ H\_v.
- `globalAnalytification.functor` (functoriality): Morphisms of k-schemes induce continuous maps.
- `globalAnalytification.locallyCompact` (instance): Hausdorff, locally compact, path-connected.
- `globalAnalytification.point_ext` (extensionality): On an affine chart, points are equal precisely when their multiplicative seminorms agree on every regular function; pullback of an analytic point composes its seminorm with the map of coordinate rings.

**Unit tests.**

- `globalAnalytification_specZ` (computation): (Spec ℤ/ℤ)^an is M(ℤ): the trivial norm, \|·\|\_∞^t (0 < t ≤ 1) and \|·\|\_p^t (0 < t ≤ ∞).
- `globalAnalytification_point` (degenerate): For k a field, (Spec k/k)^an is one point.
- `globalAnalytification_fibre_C` (compatibility): The fibre of (U/ℤ)^an over \|·\|\_∞ is U(ℂ)/complex conjugation.
- `globalAnalytification_not_classical` (non-example): U^an is not the set of closed points: for U = 𝔸¹\_ℤ it contains Gauss points over every \|·\|\_p.

**Checks.**

- (Spec ℤ)^an = M(ℤ) is Berkovich's tree of absolute values \|·\|\_∞^t, \|·\|\_p^t and the trivial norm.
- For k a field and U = Spec k, U^an is a point.

**Uses.** Yuan–Zhang Proposition 3.3.1, p. 73: target of the analytification of adelic divisors; Yuan §3.2, p. 47: Green functions of E\_S evaluated at divisorial points v ∈ S^an.

*Needs:* `TropicalAndBerkovichArithmetic:TB.0/spectrum`; `TropicalAndBerkovichArithmetic:TB.0/analytification`; `TropicalAndBerkovichArithmetic:TB.0/hybrid-analytic-space`; `TropicalAndBerkovichArithmetic:TB.0/completed-residue-fields`.

*Sources:* Yuan–Zhang, §3.1, pp. 63–70: Defines the Berkovich analytification over ℤ and over trivially valued fields, with residue fields and the structure map, and proves the topological properties.; Yuan, §2.1, p. 21: Recalls U^an and states Hausdorff, path-connected and locally compact; items PAPER-YUAN-26/14–15.

### 2.2 Analytic arithmetic divisors and continuous metrized line bundles

`AH.2/analytic-divisors-metrics` · definition

An arithmetic divisor on U^an is (D, g\_D) with D a Cartier divisor on U and g\_D continuous on U^an ∖ \|D\|^an such that g\_D + log\|f\| extends continuously over V^an whenever D\|\_V = div(f) (the log\|f\| convention, not 2log\|f\|). A metrized line bundle on U^an is a line bundle L on U with a continuously varying norm on the one-dimensional H\_v-space L ⊗ H\_v at every v ∈ U^an; morphisms are isomorphisms of line bundles preserving all norms. Write D̂iv(U^an) and P̂ic(U^an). A Green function (or metric) is norm-equivariant if g(x) = t·g(x₁) whenever \|·\|\_x = \|·\|\_{x₁}^t locally (0 ≤ t < ∞); Yuan–Zhang mark these with the subscript eqv. Principal arithmetic divisors are norm-equivariant, and analytifications of adelic divisors land in the norm-equivariant groups. The metric of O(D) attached to (D, g) is ‖s\_D‖ = e^{−g} (Yuan–Zhang p. 72 prints e^{−g/2}, source issue ArakelovGeometryAndAbelianHeightsPartII/E2).

**Hypotheses.**

- U flat quasi-projective integral over k.

**Construction.**

- Definitions as in Yuan–Zhang §3.2 for metrized line bundles on Berkovich spaces.

**API.**

- `AnalyticArithmeticDivisor` (constructor): (D, g\_D) with continuous Green function.
- `MetrizedLineBundle` (constructor): L with continuous norms on L ⊗ H\_v.
- `MetrizedLineBundle.tensor` (structure): Tensor product multiplies norms; inverse inverts.
- `MetrizedLineBundle.ofDivisor` (equivalence): (D, g) ↦ (O(D), ‖s\_D‖ = e^{−g}).
- `MetrizedLineBundle.restrictFibre` (functoriality): Restriction to the fibre over v ∈ M(k) gives a continuous metric on U\_{H\_v}^an.
- `AnalyticArithmeticDivisor.IsNormEquivariant` (data): g(x) = t·g(x₁) whenever \|·\|\_x = \|·\|\_{x₁}^t.
- `MetrizedLineBundle.isometry_iff` (extensionality): A line-bundle isomorphism is an isometry precisely when the norm of every local frame agrees at every analytic point; tensor and pullback preserve these comparisons.

**Unit tests.**

- `MetrizedLineBundle.trivial_specZ` (computation): For U = Spec ℤ and L = O, a metric is a continuous positive function on M(ℤ).
- `AnalyticArithmeticDivisor.zero` (degenerate): The zero divisor with a Green function g is a continuous function on U^an.
- `AnalyticArithmeticDivisor.log_convention` (characterisation): d̂iv(f) = (div f, −log\|f\|): with −log\|f\|² the extension condition fails at the archimedean fibre.

**Checks.**

- On (Spec ℤ)^an a metrized trivial bundle is a continuous function on M(ℤ).

**Uses.** Yuan–Zhang Propositions 3.3.1 and 3.4.1, pp. 73 and 78: targets of analytification; Yuan Definition 2.5, p. 30: admissibility is a condition on the metric at every v ∈ S^an.

*Needs:* §2.1 (`AH.2/global-analytification`).

*Sources:* Yuan–Zhang, §3.2, pp. 71–73: Defines arithmetic divisors with Green functions and metrized line bundles on Berkovich spaces, norm-equivariance (the eqv subscript), and the correspondence between divisor classes and metrized line bundles.; Yuan, §2.1, p. 21: Recalls analytic arithmetic divisors with the log\|f\| convention and continuous metrized line bundles; items PAPER-YUAN-26/16–17.

### 2.3 Analytification of adelic divisors and line bundles is injective and fully faithful

`AH.2/analytification-injective` · theorem · planet: Analytification of adelic line bundles

For k = ℤ or a field and X flat essentially quasi-projective integral over k, there are canonical injective maps D̂iv(X/k) → D̂iv(X^an), D ↦ (D, g̃\_D) (g̃\_D the total Green function), and from adelic divisor classes to analytic divisor classes; the functor P̂ic(X/k) → P̂ic(X^an) is fully faithful and injective on isomorphism classes.

**Hypotheses.**

- X flat essentially quasi-projective integral over k.

**Proof route.**

- Projective case: model metrics are determined by their values at divisorial points (Yuan–Zhang Lemma 3.3.4).
- Quasi-projective case: limits of Green functions converge uniformly on compact subsets because of the boundary norm.
- Full faithfulness: an isomorphism of underlying bundles preserving all norms is a morphism of adelic bundles.

**Checks.**

- On Spec ℤ the Green function of O(c) equals tc at \|·\|\_∞^t and zero on the non-archimedean rays; it is not the constant function c on all of M(ℤ).

*Needs:* §2.2 (`AH.2/analytic-divisors-metrics`); §1.4 (`AH.1/divisor-presentation`); §1.6 (`AH.1/essentially-quasi-projective`).

*Sources:* Yuan–Zhang, Proposition 3.3.1, p. 73; Proposition 3.4.1, p. 78: Proves injectivity of analytification of adelic divisors and divisor classes and full faithfulness of analytification of adelic line bundles.; Yuan, §2.1, pp. 21–22: Recalls both statements; items PAPER-YUAN-26/18–19.

### 2.4 Density of divisorial points

`AH.2/divisorial-density` · theorem

Let X be flat essentially quasi-projective integral over k and U a quasi-projective model. The map X^an → U^an is continuous and injective with dense image, and the points v ∈ X^an whose valuation on the function field is discrete or archimedean (with arbitrary positive rescaling) are dense in U^an. For S a positive-dimensional quasi-projective variety over a trivially valued field, points given by nontrivial discrete divisorial valuations of k(S)/k are dense in S^an; in dimension zero only the trivial valuation occurs.

**Hypotheses.**

- k = ℤ or a field; dimension ≥ 1 for the divisorial statement over a field.

**Proof route.**

- Reduce to the generic point (Spec F)^an ⊂ U^an and prove density fibrewise over M(k) (Yuan–Zhang Lemma 3.1.1(1)).

**Checks.**

- For S = 𝔸¹ over a trivially valued field, valuations ord\_{(f)} and ord\_∞ rescaled are dense in the Berkovich line.

*Needs:* §2.1 (`AH.2/global-analytification`).

*Sources:* Yuan–Zhang, Lemma 3.1.1(1), pp. 67–68: Proves continuity, injectivity and density of X^an in U^an and density of discrete or archimedean valuations.; Yuan, §3.2, p. 47: Uses density of divisorial points to check inequalities of Green functions; item PAPER-YUAN-26/88.

### 2.5 Effectivity is detected by Green functions

`AH.2/effectivity-from-green` · theorem

An adelic divisor D ∈ D̂iv(X/k) is effective iff its analytification is effective. If X is normal, D is effective iff its total Green function g̃\_D is ≥ 0 on X^an ∖ \|D\|^an. In particular, for an adelic divisor with zero underlying divisor, effectivity can be checked at the dense set of discrete or archimedean points of AH.2/divisorial-density.

**Hypotheses.**

- X flat essentially quasi-projective integral over k; normal for the Green-function criterion.

**Proof route.**

- Projective case: an arithmetic divisor on a normal model with nonnegative Green function is effective.
- Pass to limits using the boundary norm; for zero underlying divisor apply continuity of g̃\_D and density (Yuan–Zhang Lemma 5.1.2).

**Checks.**

- For S = Spec ℤ, O(c) has total Green function tc at \|·\|\_∞^t and zero on the non-archimedean rays; it is effective iff c ≥ 0.

*Needs:* §2.3 (`AH.2/analytification-injective`); §2.4 (`AH.2/divisorial-density`); §1.5 (`AH.1/positivity-notions`).

*Sources:* Yuan–Zhang, Lemma 5.1.2, p. 134: Proves effectivity iff analytic effectivity, and for normal X iff the total Green function is nonnegative.; Yuan, Proof of Lemma 3.5, p. 47: Uses the criterion on the divisorial locus; item PAPER-YUAN-26/89.

### 2.6 Canonical measures of integrable adelic line bundles

`AH.2/canonical-measures` · construction

Let K be a number field or a one-variable function field over k, X a quasi-projective K-variety of dimension n, v a place of K and L̄₁, …, L̄ₙ integrable adelic line bundles on X/k. There is a signed Radon measure dμ\_{L̄₁,…,L̄ₙ, v} = c₁(L̄₁)···c₁(L̄ₙ) on X\_v^an, the limit of the Monge–Ampère (archimedean) or Chambert-Loir (non-archimedean) measures of the model metrics, positive for nef bundles. If X is projective, its total mass is the ordinary intersection number L₁···Lₙ; for projective X and nef L̄ of positive degree put dμ\_{L̄,v} = c₁(L̄)ⁿ/(Lⁿ). On nonproper X, the degree and total-mass identity use geometric adelic intersections, as specified in AH.5/non-degenerate, rather than an ordinary degree of the uncompactified algebraic bundle.

**Hypotheses.**

- X quasi-projective over a global field; bundles integrable.

**Construction.**

- Projective models: AH.0/monge-ampere-measures and TropicalAndBerkovichArithmetic TB.6 model measures.
- Boundary convergence gives convergence of measures on compact subsets of X\_v^an (Yuan–Zhang §3.6 local theory and §5.4).

**API.**

- `canonicalMeasure` (constructor): c₁(L̄₁)···c₁(L̄ₙ) on X\_v^an.
- `canonicalMeasure_symm` (simp): Symmetric and multilinear.
- `canonicalMeasure_mass` (characterisation): For projective X, total mass equals the ordinary degree L₁···Lₙ. For quasi-projective X, use the geometric adelic intersection of AH.5/non-degenerate.
- `canonicalMeasure_nonneg` (other): Positive for nef bundles.
- `canonicalMeasure_model` (compatibility): For model bundles it is the Monge–Ampère or Chambert-Loir measure.
- `canonicalMeasure_model_limit` (characterisation): For nef bundles the measure is the weak limit of the model measures in the boundary approximation construction; mixed integrable measures are determined by multilinearity. Retain the tightness/no-mass-loss argument for nonproper varieties of Yuan–Zhang §3.6.

**Unit tests.**

- `canonicalMeasure_goodReduction` (computation): For a model bundle on a smooth projective model with irreducible special fibre at a finite place v, the measure c₁(L̄)ⁿ at v is (Lⁿ)·δ\_ζ, ζ the point of X\_v^an given by the generic point of the special fibre.
- `canonicalMeasure_dimZero` (degenerate): For X = Spec K (n = 0), the measure at each place is the Dirac measure of mass one on its unique analytic point.
- `canonicalMeasure_constant_shift` (characterisation): Adding O(c) pulled back from the base does not change the measure.
- `canonicalMeasure_signed` (non-example): For integrable but not nef bundles the measure need not be positive.

**Checks.**

- For the canonical metric of a polarized dynamical system on ℙ¹ the measure is the canonical (equilibrium) measure of ArithmeticDynamics DY.4.

**Uses.** Yuan–Zhang Theorem 5.4.3, p. 168: limit measure in equidistribution; Yuan Proposition A.2, p. 108: admissible metrics have curvature deg(L)·μ\_a.

*Needs:* §0.2 (`AH.0/monge-ampere-measures`); `TropicalAndBerkovichArithmetic:TB.6/model-measures`; `TropicalAndBerkovichArithmetic:TB.6/measure-limits-and-local-heights`; §1.6 (`AH.1/essentially-quasi-projective`).

*Sources:* Yuan–Zhang, §3.4 (end) and §3.6, pp. 78–102; Theorem 5.4.3, p. 168: Constructs canonical measures on Berkovich spaces from adelic line bundles (local theory) and uses dμ\_{L,v} in the equidistribution theorem.

### 2.7 Canonical metrics over a trivially valued field

`AH.2/trivially-valued-canonical-metric` · construction

For a projective variety X over a field K with the trivial absolute value, every line bundle L has a canonical metric on X^an, the model metric of L on X itself regarded as its own model over K. This prescribed model metric is called admissible in Yuan §A.6; for the curve bundles in AH.7 it is the specified trivial-valuation case (uniqueness refers to this model normalization, not to all continuous metrics with equal curvature), and it is used for ω\_C and O(Δ) of a curve C over a trivially valued field.

**Hypotheses.**

- K trivially valued; X projective over K.

**Construction.**

- For a point x ∈ X^an, properness gives Spec O\_{H\_x} → X. A generator of L near its reduction has norm one; this is independent of the generator, since transition units have absolute value one there (Yuan–Zhang §3.4.1). Tensor product and pullback preserve this prescription. A constant rescaling violates the normalization; no general curvature uniqueness assertion is needed.

**API.**

- `trivialCanonicalMetric` (constructor): The model metric of L on X over trivially valued K.
- `trivialCanonicalMetric_tensor` (simp): Multiplicative in L.
- `trivialCanonicalMetric_pullback` (functoriality): Compatible with pullback.
- `trivialCanonicalMetric_frame` (characterisation): A frame extending as a unit over a model open has norm one at analytic points whose centre lies in that open; this determines the prescribed proper-model metric and gives its tensor and pullback comparisons.

**Unit tests.**

- `trivialCanonicalMetric_trivial` (computation): For L = O\_X, ‖1‖ ≡ 1.
- `trivialCanonicalMetric_point` (degenerate): On X = Spec K the metric is the trivial absolute value on the fibre.
- `trivialCanonicalMetric_no_rescale` (non-example): Multiplying by a constant c ≠ 1 does not give the canonical metric: the normalization is fixed.

**Checks.**

- For L = O\_X the canonical metric is the trivial metric ‖1‖ = 1.

**Uses.** Yuan §2.2.3, p. 32: canonical admissible metrics at trivially valued points of S^an.

*Needs:* §2.2 (`AH.2/analytic-divisors-metrics`).

*Sources:* Yuan, §A.6, p. 119: Defines the canonical metrics over trivially valued fields via the trivial model and says they are the admissible ones; item PAPER-YUAN-26/232.; Yuan–Zhang, §3.4.1, pp. 78–80: Treats metrics on analytifications over trivially valued bases induced by the projective model itself.

**Refinements left for the lemma-level pass.**

- Song's surjectivity of analytification (Yuan–Zhang Remark 3.3.2) is not needed and not planned.

## Layer AH.3: Intersection numbers and the adelic Deligne pairing

The absolute intersection pairing of integrable adelic line bundles, the relative Deligne pairing along projective flat morphisms with normal base, its composition and projection formulas, and injectivity of pullback along fibrations with geometrically reduced and geometrically connected fibres with descent of fibrewise constant metrics.

Targets: §3.1 The absolute intersection pairing of adelic line bundles; §3.2 The adelic Deligne pairing; §3.3 Composition and projection formulas for the Deligne pairing; §3.4 Injective pullback and descent of fibrewise constant metrics.

Planets: Adelic intersection number, Adelic Deligne pairing.

### 3.1 The absolute intersection pairing of adelic line bundles

`AH.3/intersection-pairing` · construction · planet: Adelic intersection number

Let X be flat essentially quasi-projective integral over k and d the absolute dimension of a quasi-projective model of X over k. The intersection numbers of AH.0/arithmetic-intersection-numbers (resp. geometric ones over a field) on projective models extend by boundary limits to a canonical multilinear map P̂ic(X/k) × P̂ic(X/k)\_int^{d−1} → ℝ, symmetric in the last d − 1 variables and in all d variables when the first is integrable. If L̄₁, …, L̄\_d are nef then L̄₁···L̄\_d ≥ 0. For integrable L̄₁, …, L̄\_d and a morphism f : X′ → X with the same absolute dimension, f^*L̄₁···f^*L̄\_d = deg(f)·L̄₁···L̄\_d (deg f = 0 if f is not dominant).

**Hypotheses.**

- X flat essentially quasi-projective integral over k; d its absolute dimension.

**Construction.**

- For strongly nef L̄ᵢ represented by nef model sequences, the model intersection numbers form a Cauchy sequence: bound the change by the boundary norm times intersection numbers with E₀ (Yuan–Zhang Proposition 4.1.1).
- Extend by multilinearity to integrable bundles, and to one non-integrable entry by the effective-boundary estimate.
- Projection formula is the limit of the model projection formula (Proposition 4.1.2).

**API.**

- `adelicIntersection` (constructor): L̄₁···L̄\_d ∈ ℝ.
- `adelicIntersection_symm` (simp): Symmetric and multilinear on integrable bundles.
- `adelicIntersection_nef_nonneg` (other): Nonnegative on nef bundles.
- `adelicIntersection_projection` (functoriality): For integrable entries and a morphism of the same absolute dimension, f^*L̄₁···f^*L̄\_d = deg(f)·L̄₁···L̄\_d.
- `adelicIntersection_model` (compatibility): Equals the model intersection number for model bundles.
- `adelicIntersection_continuous` (characterisation): Recover the projective model intersection on model bundles; along boundary-convergent nef approximations the intersection numbers converge, and extend by multilinearity in integrable entries.

**Unit tests.**

- `adelicIntersection_specZ` (computation): For X = Spec ℤ, O(c) has intersection number c.
- `adelicIntersection_nondominant` (degenerate): For f not dominant, f^*L̄₁···f^*L̄\_d = 0.
- `adelicIntersection_constant_shift` (characterisation): Adding O(c) from Spec ℤ to an entry adds c times the geometric adelic intersection of the other entries over ℚ. When the generic fibre is projective this is its ordinary degree.
- `adelicIntersection_not_continuous_unbounded` (non-example): The pairing is not defined for arbitrary continuous metrics on U^an without boundary control: the limit uses boundary-Cauchy representatives.

**Checks.**

- For X = Spec O\_K (d = 1) the pairing is the arithmetic degree on P̂ic(K/ℤ).
- In the geometric case with X projective over k the pairing is the classical intersection number.

**Uses.** Yuan Theorem 4.1, p. 60: top intersections on relative powers; Yuan–Zhang Theorem 5.2.2, p. 141: volume of a nef bundle equals its top self-intersection.

*Needs:* §0.3 (`AH.0/arithmetic-intersection-numbers`); §1.5 (`AH.1/positivity-notions`); §1.6 (`AH.1/essentially-quasi-projective`).

*Sources:* Yuan–Zhang, Proposition 4.1.1, pp. 103–104; Proposition 4.1.2, p. 105: Extends intersection pairings to integrable adelic line bundles with symmetry and nonnegativity on nef ones, and proves the projection formula.; Yuan, §2.1, p. 22: Recalls the absolute pairing; item PAPER-YUAN-26/20.

### 3.2 The adelic Deligne pairing

`AH.3/deligne-pairing` · construction · planet: Adelic Deligne pairing

Let Y be flat essentially quasi-projective integral over k and f : X → Y projective and flat of relative dimension n with X integral and Y normal. The metrized Deligne pairing of AH.0/projective-deligne-pairing extends to a symmetric multilinear functor f\_*⟨·, …, ·⟩ : P̂ic(X/k)\_int^{n+1} → P̂ic(Y/k)\_int, sending strongly nef (resp. nef) bundles to strongly nef (resp. nef) bundles, and compatible with base change Y′ → Y by normal integral flat essentially quasi-projective Y′ with X ×\_Y Y′ integral. For n = 0 and f finite flat it is the norm.

**Hypotheses.**

- f projective flat of relative dimension n; X integral; Y normal.

**Construction.**

- Choose models f\_i : Xᵢ → Yᵢ extending f; the model pairings of a Cauchy sequence form a Cauchy sequence for the boundary topology on Y because the pairing of a boundary-bounded divisor is boundary-bounded (Yuan–Zhang §4.5).
- Nefness: limit of the model statement (Lemmas 4.4.x).
- Base change: model base change plus Theorem 4.2.3(2).

**API.**

- `delignePairingAdelic` (constructor): f\_*⟨L̄₁, …, L̄\_{n+1}⟩ ∈ P̂ic(Y/k)\_int.
- `delignePairingAdelic_symm` (simp): Symmetric and multilinear.
- `delignePairingAdelic_nef` (other): Preserves strong nefness and nefness.
- `delignePairingAdelic_baseChange` (functoriality): Compatible with normal base change.
- `delignePairingAdelic_underlying` (projection): The underlying line bundle is the algebraic Deligne pairing.
- `delignePairingAdelic_section` (compatibility): For n = 0 along a section x : Y → X (graph), ⟨L̄\|\_{Γ}⟩ = x^*L̄.
- `delignePairingAdelic_model_limit` (compatibility): On model bundles recover the model Deligne pairing and its symbol norm; boundary limits of nef models determine the adelic pairing independently of approximations, and multilinearity gives the integrable case.

**Unit tests.**

- `delignePairingAdelic_finite` (computation): For f finite flat of degree r and L̄ = f^*M̄, ⟨L̄⟩ = rM̄.
- `delignePairingAdelic_point_base` (degenerate): For Y = Spec ℤ and X projective arithmetic of dimension n + 1, deĝ f\_*⟨L̄₁, …, L̄\_{n+1}⟩ = L̄₁···L̄\_{n+1}.
- `delignePairingAdelic_constant` (characterisation): f\_*⟨L̄₁ + f^*O(c), L̄₂, …⟩ = f\_*⟨L̄₁, …⟩ + (L₂···L\_{n+1})\_fibre·O(c).

**Checks.**

- For Y = Spec F a finitely generated field, f\_*⟨L̄₁, …, L̄\_{n+1}⟩ ∈ P̂ic(F/k) is the vector-valued height of the generic fibre (Yuan–Zhang §5.3).
- For dim Y = 1 projective over a field, the degree of the pairing is the intersection number on X.

**Uses.** Yuan Theorem 2.3(2), p. 28: p₁*⟨D, p₂*w⟩ ≅ w; Yuan Theorem 4.1, p. 60: M = π*⟨L^{e+1}⟩ and its bigness; DeMarco–Mavraki–Ye §4, p. 19: the relative-dimension-zero pairing along the graph of a section.

*Needs:* §0.4 (`AH.0/projective-deligne-pairing`); §3.1 (`AH.3/intersection-pairing`).

*Sources:* Yuan–Zhang, Theorem 4.1.3, p. 106; §4.5, pp. 125–128: States and proves that the Deligne pairing induces a symmetric multilinear functor on integrable adelic line bundles preserving strong nefness and nefness, compatible with base change.; Yuan, §2.1, p. 22: Recalls the relative Deligne pairing and nefness preservation; items PAPER-YUAN-26/21–22.

### 3.3 Composition and projection formulas for the Deligne pairing

`AH.3/projection-formulas` · theorem

Let ψ : X → Y and π : Y → S be projective of relative dimensions r and m between flat quasi-projective integral k-schemes, with π and π∘ψ flat and S normal; let L̄₁, …, L̄\_{r+1} on X, M̄₁, …, M̄\_{m+1} on Y and N̄ on S be integrable. (1) If ψ is flat and Y normal, (π∘ψ)\_*⟨L̄₁, …, L̄\_{r+1}, ψ^*M̄₁, …, ψ^*M̄\_m⟩ ≅ π\_*⟨ψ\_*⟨L̄₁, …, L̄\_{r+1}⟩, M̄₁, …, M̄\_m⟩. (2) π\_*⟨M̄₁, …, M̄\_m, π^*N̄⟩ ≅ e·N̄ with e the degree of M₁···M\_m on the generic fibre. (3) For d = deg\_{X\_η}(L₁···L\_r) when ψ is dominant (and d = 0 otherwise): if ψ is flat and Y normal then ψ\_*⟨L̄₁, …, L̄\_r, ψ^*M̄₁⟩ ≅ d·M̄₁; without those extra conditions the always-defined composite pairing satisfies (π∘ψ)\_*⟨L̄₁, …, L̄\_r, ψ^*M̄₁, …, ψ^*M̄\_{m+1}⟩ ≅ d·π\_*⟨M̄₁, …, M̄\_{m+1}⟩.

**Hypotheses.**

- As stated; flatness of π∘ψ and normality of S throughout.

**Proof route.**

- (1)–(3) are the limits of the model identities of Deligne pairings (Yuan–Zhang Lemma 4.6.1).

**Checks.**

- With r = 0 and ψ finite of degree d, (3) says ψ\_*⟨ψ^*M̄₁⟩ = dM̄₁.

*Needs:* §3.2 (`AH.3/deligne-pairing`); §3.1 (`AH.3/intersection-pairing`).

*Sources:* Yuan–Zhang, Lemma 4.6.1, pp. 128–129: Proves the composition isomorphism, the pullback-from-base formula and the fibre-degree projection formulas.; Yuan, Lemma 2.1–2.2 proofs, pp. 26–27: Uses the three identities; items PAPER-YUAN-26/34, 239, 240.

### 3.4 Injective pullback and descent of fibrewise constant metrics

`AH.3/pullback-injective-descent` · theorem

Let π : X → S be projective flat with geometrically reduced and geometrically connected fibres between flat quasi-projective integral k-schemes. (1) π^* : P̂ic(S/k) → P̂ic(X/k) is injective. (2) Assume S normal or π has a section. If L̄ is integrable on X with L ≅ π^*M and on each fibre X\_{H\_v}, v ∈ S^an, the metric of L̄ is a constant multiple of the trivial metric induced by M, then M has an integrable adelic extension M̄ with π^*M̄ ≅ L̄.

**Hypotheses.**

- π projective flat with geometrically reduced and geometrically connected fibres; for (2) S normal or π with a section.

**Proof route.**

- (1) Proper flat finite presentation with geometrically reduced connected fibres gives π\_*O\_X = O\_S universally (Stacks Tag 0E0L). The algebraic projection formula then makes Pic(S) → Pic(X) injective. Surjectivity of π^an detects equality of metrics, and full faithfulness of analytification gives the adelic assertion. Geometric connectedness alone is insufficient (source issue E3).
- (2) Define the metric of M at v by the constant; continuity and adelic convergence from the Deligne pairing ψ\_*⟨A, …, A, L̄⟩ with A relatively ample, using (3) of AH.3/projection-formulas (Yuan Lemma 2.1).

**Checks.**

- If L̄ = π^*M̄ then the hypothesis of (2) holds with constant 1.
- Connectedness alone fails: on E : y² = x³ + 3x + 2 over 𝔽₅, Frobenius is finite flat with geometrically connected nonreduced fibres, and kills the nontrivial order-five line bundle O((1,1) − O).

*Needs:* §3.3 (`AH.3/projection-formulas`); §2.3 (`AH.2/analytification-injective`).

*Sources:* Yuan, Lemma 2.1, pp. 25–26: States the injectivity and metric descent in Lemma 2.1. The injectivity assertion needs geometric reducedness in addition to its printed geometric connectedness; the corrected hypothesis holds for every smooth curve family used here (source issue E3).; Stacks Project, Tag 0E0L, Lemma 36.32.6 (unpaginated): Proper flat finite presentation with geometrically reduced connected fibres has universally trivial structure-sheaf pushforward; projection formula yields injective Picard pullback.

**Refinements left for the lemma-level pass.**

- Lemma-level proof of Yuan–Zhang Theorem 4.1.3 (§4.5) and of the metric continuity Theorem 4.3.1.

## Layer AH.4: Effective sections, volumes and heights

Effective sections and ĥ⁰ of adelic line bundles, the adelic volume and bigness, the adelic Hilbert–Samuel formula and Siu inequality, positivity of Deligne pairings of nef and big bundles, invariance of nef bigness under finite covers, volumes over global fields, domination by nef effective model divisors, heights of algebraic points and vector-valued heights over finitely generated fields, the height inequality and the fundamental inequality.

Targets: §4.1 Effective sections of adelic line bundles; §4.2 Adelic volume and bigness; §4.3 Adelic Hilbert–Samuel formula and Siu inequality; §4.4 Positivity of Deligne pairings; §4.5 Bigness of nef bundles under finite covers; §4.6 Domination by nef effective model divisors; §4.7 Heights of algebraic points for adelic line bundles; §4.8 The Yuan–Zhang height inequality; §4.9 The fundamental inequality over global fields.

Planets: Adelic volume, Adelic Hilbert–Samuel formula, Height of an adelic line bundle, Yuan–Zhang height inequality.

### 4.1 Effective sections of adelic line bundles

`AH.4/effective-sections` · construction

For an adelic line bundle L̄ on a flat quasi-projective integral k-scheme U, Ĥ⁰(U, L̄) = {s ∈ H⁰(U, L) : ‖s(x)‖ ≤ 1 for all x ∈ U^an}. If k = ℤ this set is finite and ĥ⁰(U, L̄) = log #Ĥ⁰; if k is a field it is a finite-dimensional k-vector space and ĥ⁰ = dim\_k. Effective sections correspond to effective adelic divisors: s ∈ Ĥ⁰ ∖ {0} iff d̂iv(s) ≥ 0.

**Hypotheses.**

- U flat quasi-projective integral over k.

**Construction.**

- Finiteness: normalize a projective model first. By AH.4/nef-domination choose an upper model divisor D̄′ on that normal model; bounded sections on U extend across the omitted prime divisors by their valuation inequalities. Hence Ĥ⁰(U,L̄) injects into the finite set (or finite-dimensional space) Ĥ⁰(X,O(D̄′)) (Yuan–Zhang Lemma 5.1.5). Normality is needed for this extension argument.
- Identification with effective divisors by AH.2/effectivity-from-green.

**API.**

- `effectiveSections` (constructor): Ĥ⁰(U, L̄) ⊂ H⁰(U, L).
- `effectiveSections_finite` (other): Finite for k = ℤ; finite-dimensional over k a field.
- `hHat0` (data): ĥ⁰ = log # (k = ℤ) or dim\_k.
- `effectiveSections_mul` (structure): Ĥ⁰(L̄)·Ĥ⁰(M̄) ⊂ Ĥ⁰(L̄ + M̄).
- `effectiveSections_mono` (other): If M̄ − L̄ is effective then ĥ⁰(L̄) ≤ ĥ⁰(M̄).
- `effectiveSections_mem` (characterisation): A section belongs exactly when its norm is at most one at every analytic point; zero belongs, and for a nonzero section membership is equivalent to effectivity of its adelic divisor.

**Unit tests.**

- `effectiveSections_specZ` (computation): For O(c) on Spec ℤ, ĥ⁰ = log(2⌊e^c⌋ + 1).
- `effectiveSections_negative` (degenerate): For O(c) with c < 0 on Spec ℤ, Ĥ⁰ = {0} and ĥ⁰ = 0.
- `effectiveSections_field` (compatibility): For k a field and a model bundle with trivial metrics on projective U, ĥ⁰ = dim H⁰(U, L).
- `effectiveSections_not_all` (non-example): A section s of L with ‖s‖ > 1 at one archimedean point is not effective.

**Checks.**

- For U = Spec ℤ and L̄ = O(c), Ĥ⁰ = {n ∈ ℤ : \|n\| ≤ e^c}, ĥ⁰ = log(2⌊e^c⌋ + 1).

**Uses.** Yuan–Zhang Theorem 5.2.1, p. 141: definition of the volume; Yuan–Zhang Lemma 5.3.4, p. 159: essential minimum bound from ĥ⁰.

*Needs:* §1.3 (`AH.1/adelic-line-bundles`); §2.5 (`AH.2/effectivity-from-green`); §4.6 (`AH.4/nef-domination`); §0.5 (`AH.0/projective-volume-siu`).

*Sources:* Yuan–Zhang, Definition 5.1.1 and §5.1, pp. 133–138: Defines effective sections of adelic line bundles and proves finiteness/finite dimensionality.; Yuan, §2.1, pp. 22–23: Recalls Ĥ⁰ and ĥ⁰; item PAPER-YUAN-26/23.

### 4.2 Adelic volume and bigness

`AH.4/adelic-volume` · definition · planet: Adelic volume

For an adelic line bundle L̄ on X (flat essentially quasi-projective integral over k, absolute dimension d of a quasi-projective model) put vol^(X, L̄) = lim\_{m→∞} d!·ĥ⁰(X, mL̄)/m^d; the limit exists and is finite, equals the limit of the model volumes for any representing sequence, and L̄ is big if vol^ > 0. Over a global field K and a quasi-projective K-variety X (with d = dim X + 1) the same holds with effective sections defined on (X/k)^an.

**Hypotheses.**

- X flat essentially quasi-projective integral over k.

**Construction.**

- Existence: model volumes of a boundary-Cauchy representing sequence converge, using ĥ⁰(L̄ ± εE₀) estimates and continuity of the projective volume (Yuan–Zhang Theorem 5.2.1).
- Global-field version: limit over models (Yuan §2.1, p. 25).

**API.**

- `adelicVolume` (constructor): vol^(X, L̄) ∈ ℝ\_{≥0}.
- `adelicVolume_homogeneous` (simp): vol^(mL̄) = m^d vol^(L̄) for m ≥ 1.
- `adelicVolume_mono` (other): Monotone under adding effective bundles.
- `adelicVolume_model` (compatibility): Limit of model volumes.
- `IsBig` (data): vol^ > 0.
- `IsBig_pullback_finite` (functoriality): For nef L̄ and finite surjective S′ → S, big iff the pullback is big (AH.4/finite-cover-bigness).

**Unit tests.**

- `adelicVolume_specZ` (computation): vol^(Spec ℤ, O(c)) = max(c, 0).
- `adelicVolume_trivial` (degenerate): vol^(O) = 0 for the trivial adelic line bundle on a positive-dimensional X.
- `adelicVolume_projective` (compatibility): For X projective, vol^ is the arithmetic volume of AH.0/projective-volume-siu.
- `IsBig_generic_not_enough` (non-example): On Spec ℤ, O(c) with c < 0 has an algebraically big generic fibre (a point), but arithmetic volume zero. Algebraic generic bigness does not imply adelic bigness.

**Checks.**

- vol^(Spec ℤ, O(c)) = c for c ≥ 0 (d = 1).

**Uses.** Yuan Theorems 3.1–3.2, p. 40: bigness of ω\_a and ⟨ω\_a, ω\_a⟩; Yuan–Zhang Theorem 5.3.7, p. 163: big L̄ dominates heights.

*Needs:* §4.1 (`AH.4/effective-sections`); §0.5 (`AH.0/projective-volume-siu`); §1.6 (`AH.1/essentially-quasi-projective`).

*Sources:* Yuan–Zhang, Theorem 5.2.1, p. 141: Proves existence of the volume limit for adelic line bundles and its equality with the limit of model volumes.; Yuan, §2.1, pp. 23 and 25: Defines adelic volume and bigness and the global-field version; items PAPER-YUAN-26/24, 25, 28.

### 4.3 Adelic Hilbert–Samuel formula and Siu inequality

`AH.4/hilbert-samuel-siu` · theorem · planet: Adelic Hilbert–Samuel formula

Let X be flat essentially quasi-projective integral over k with absolute dimension d. (1) If L̄ is nef then vol^(X, L̄) = L̄^d; hence a nef L̄ is big iff L̄^d > 0. (2) If L̄, M̄ are nef then vol^(X, L̄ − M̄) ≥ L̄^d − d·L̄^{d−1}·M̄; in particular if A is nef and big and B nef then A − εB is big for all sufficiently small rational ε > 0. The same holds over a global field with d = dim X + 1.

**Hypotheses.**

- L̄, M̄ nef adelic line bundles.

**Proof route.**

- Strongly nef case: limit of AH.0/projective-volume-siu along representing sequences, by AH.4/adelic-volume.
- Nef case: continuity of the volume function (Yuan–Zhang Theorem 5.2.9) applied to aL̄ + M̄₀ with M̄₀ strongly nef, a → ∞.

**Checks.**

- On Spec ℤ, vol^(O(c)) = c = O(c)^1 for c ≥ 0.
- If A^d > 0 and A^{d−1}B > 0, then A − εB is big for 0 < ε < A^d/(d A^{d−1}B). If A^{d−1}B = 0, the Siu lower bound remains A^d for every ε > 0.

*Needs:* §4.2 (`AH.4/adelic-volume`); §3.1 (`AH.3/intersection-pairing`); §0.5 (`AH.0/projective-volume-siu`).

*Sources:* Yuan–Zhang, Theorem 5.2.2, p. 141; Theorem 5.2.9, p. 148: Proves vol = L^d for nef and vol(L − M) ≥ L^d − dL^{d−1}M for nef L, M, and continuity of the volume.; Yuan, §1.2, p. 8; §2.1, p. 23; proof of Lemma 2.2, p. 27: Uses the Hilbert–Samuel formula and the Siu inequality; items PAPER-YUAN-26/26, 33.

### 4.4 Positivity of Deligne pairings

`AH.4/deligne-positivity` · theorem

Let f : X → Y be projective flat of relative dimension n between flat quasi-projective integral k-schemes, Y normal of dimension d ≥ 1. (1) If L̄₁, …, L̄\_{n+1} are nef and big on X then f\_*⟨L̄₁, …, L̄\_{n+1}⟩ is nef and big on Y. (2) If L̄₁ is effective integrable and L̄₂, …, L̄\_{n+1} and M̄₁, …, M̄\_{d−1} (on Y) are nef, then f\_*⟨L̄₁, …, L̄\_{n+1}⟩·M̄₁···M̄\_{d−1} ≥ 0.

**Hypotheses.**

- f projective flat, Y normal, dim Y = d ≥ 1.

**Proof route.**

- (1) Put P = f\_*⟨L̄₁, …, L̄\_{n+1}⟩, which is nef. Choose a nef big model bundle M̄ on Y. Siu gives L̄₁ − εf^*M̄ big for small ε > 0, hence a positive multiple is effective. Pair it with the remaining nef entries to obtain a pseudo-effective Q. The projection formula gives P = Q + cM̄ with c > 0, since the remaining big bundles have positive mixed degree on the generic fibre. Compare successively P^d ≥ cM̄·P^{d−1} ≥ ⋯ ≥ c^dM̄^d > 0; each difference pairs Q with nef entries. This avoids multiplying several merely pseudo-effective bundles (Yuan Lemma 2.2).
- (2) Composition formula AH.3/projection-formulas(1) reduces to an intersection number on X of an effective bundle with nef ones, ≥ 0.

**Checks.**

- For n = 0 and f finite flat, (1) says the norm of a nef big bundle is nef big.

*Needs:* §3.2 (`AH.3/deligne-pairing`); §3.3 (`AH.3/projection-formulas`); §4.3 (`AH.4/hilbert-samuel-siu`).

*Sources:* Yuan, Lemma 2.2, pp. 26–27: Proves that Deligne pairings of nef and big adelic line bundles are nef and big, and the pseudo-effectivity of a pairing with an effective entry; items PAPER-YUAN-26/31–32.

### 4.5 Bigness of nef bundles under finite covers

`AH.4/finite-cover-bigness` · theorem

Let S′ → S be a finite surjective morphism of flat quasi-projective integral k-schemes of the same dimension. A nef adelic line bundle M̄ on S is big iff its pullback to S′ is big.

**Hypotheses.**

- M̄ nef; S′ → S finite surjective.

**Proof route.**

- By AH.4/hilbert-samuel-siu, bigness of a nef bundle is positivity of its top self-intersection; by the projection formula of AH.3/intersection-pairing the top self-intersection is multiplied by deg(S′/S) > 0 under pullback.

**Checks.**

- For S′ → S of degree 2 and M̄ nef with M̄^d = 1, the pullback has (pullback)^d = 2.

*Needs:* §4.3 (`AH.4/hilbert-samuel-siu`); §3.1 (`AH.3/intersection-pairing`).

*Sources:* Yuan–Zhang, Proposition 4.1.2, p. 105: Proves the projection formula for top intersection numbers of integrable adelic line bundles under morphisms of the same dimension.; Yuan, Proof after Remark 3.9, p. 55: Uses that a nef adelic line bundle is big iff its pullback under a finite surjective morphism is big; item PAPER-YUAN-26/106.

### 4.6 Domination by nef effective model divisors

`AH.4/nef-domination` · theorem

Let X be flat essentially quasi-projective integral over k and D an adelic divisor on X. There is, on a common quasi-projective model U, a model adelic divisor D′ induced by an effective nef arithmetic divisor on a projective model of U such that −D′ ≤ D ≤ D′. In particular every adelic line bundle is dominated by a nef effective model bundle.

**Hypotheses.**

- X flat essentially quasi-projective integral over k.

**Proof route.**

- Choose a model on which a representative of D lives; bound it above and below by multiples of an ample effective arithmetic divisor plus the boundary, then use that ample plus boundary is dominated by nef effective (Yuan–Zhang Lemma 5.1.7(1)).

**Checks.**

- For U projective, D′ can be any sufficiently ample effective arithmetic divisor.

*Needs:* §1.5 (`AH.1/positivity-notions`); §1.2 (`AH.1/boundary-topology`).

*Sources:* Yuan–Zhang, Lemma 5.1.7(1), p. 138: Proves the two-sided domination of an adelic divisor by an effective nef model divisor on a common model.; Yuan, Remark 4.4, p. 67: Uses the domination in the small-points argument; item PAPER-YUAN-26/123.

### 4.7 Heights of algebraic points for adelic line bundles

`AH.4/adelic-heights` · construction · planet: Height of an adelic line bundle

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k, and X a quasi-projective K-variety. For L̄ ∈ P̂ic(X/k) and x ∈ X(K̄) with closure x̃ (Spec of the residue field K(x)) put h\_L̄(x) = deĝ(L̄\|\_x̃)/[K(x) : ℚ] (k = ℤ) or deĝ(L̄\|\_x̃)/[K(x) : K] (k a field), where deĝ is the adelic intersection number on Spec K(x) over k (residue degrees over the fixed k in the geometric case). This is Yuan's normalization: in the arithmetic case Yuan–Zhang §5.3 divide by the degree over K instead, so h\_YZ = [K : ℚ]·h\_L̄ (Yuan p. 64 records the difference); in the geometric case the two agree. More generally, for a finitely generated field F over k and X a quasi-projective F-variety, for integrable L̄ the vector-valued height h(x) = π\_*⟨L̄\|\_x̃⟩/deg(x) ∈ P̂ic(F/k)\_ℚ, and for H̄ ∈ P̂ic(F/k) satisfying the Moriwaki condition the real height h^H̄\_L̄(x) = h(x)·H̄^{d−1}. h\_L̄ is additive in L̄, functorial under pullback, invariant under Galois conjugation and independent of the field used to represent a point with K fixed. Under a finite extension K′/K, absolute arithmetic heights are invariant; geometric heights with degrees over the fixed k scale by [K′ : K], and for a model hermitian line bundle it is the metrized height of ArakelovGeometryAndAbelianHeights R35.1 §1.12; for L̄ with trivial underlying bundle pulled back from P̂ic(K/k), h is the constant deĝ/[K : ℚ].

**Hypotheses.**

- X quasi-projective over a global field K (or over a finitely generated field F).

**Construction.**

- Restriction of adelic line bundles to the closed point x̃ (pullback along Spec K(x) → X) and the degree map on P̂ic(K(x)/k).
- Independence of the field of definition: projection formula for Spec K′ → Spec K(x).
- Vector-valued heights and the Moriwaki condition: Yuan–Zhang §5.3.

**API.**

- `adelicHeight` (constructor): h\_L̄ : X(K̄) → ℝ.
- `adelicHeight_add` (simp): h\_{L̄+M̄} = h\_L̄ + h\_M̄.
- `adelicHeight_pullback` (functoriality): h\_{f^*L̄} = h\_L̄ ∘ f.
- `adelicHeight_galois` (other): Galois invariant; independent of the field representing a point with K fixed. Finite base extension preserves absolute arithmetic heights and multiplies geometric heights over fixed k by its degree.
- `adelicHeight_model` (compatibility): Agrees with the metrized height of R35.1 §1.12 for model bundles.
- `adelicHeight_weil` (compatibility): For O(1) on ℙⁿ with max metrics, equals HeightsRationalPointsAndObstructions RP.0 normalized height.
- `adelicHeight_eq_yuanZhang` (compatibility): Over a number field K, the Yuan–Zhang height of §5.3 is [K : ℚ]·h\_L̄.
- `vectorHeight` (constructor): h(x) ∈ P̂ic(F/k)\_ℚ over a finitely generated field, and h^H̄ = h·H̄^{d−1}.

**Unit tests.**

- `adelicHeight_P1_max` (computation): For ℙ¹\_ℚ, O(1) with max metrics, h([1:2]) = log 2.
- `adelicHeight_constant` (degenerate): For L̄ the pullback of O(c) ∈ P̂ic(ℤ/ℤ), h\_L̄(x) = c for every x: the degree on Spec O\_{K(x)} is [K(x) : ℚ]·c.
- `adelicHeight_extension` (characterisation): Over number fields, h\_L̄(x) does not change after finite extension of K. Over function fields with the same constant base k, h\_{L̄\_{K′}}(x) = [K′ : K]·h\_L̄(x); independence of the field representing x keeps K fixed.
- `adelicHeight_relative_nonexample` (non-example): Dividing by [K(x) : K] instead of [K(x) : ℚ] over a number field gives a height that is not invariant under extension of K.

**Checks.**

- For X = ℙⁿ\_K and L̄ = O(1) with the standard metrics (max at finite places, max or Fubini–Study at infinity), h\_L̄ is the absolute logarithmic Weil height up to a bounded function (equal for max metrics).
- Function-field normalization: ‖·‖\_v = e^{−[k(v):k] ord\_v} at places of K′.

**Uses.** Yuan Theorem 4.2, p. 64: small-points counts h\_L̄(x) ≤ c₁h\_M̄(y); Yuan §4.4.1, p. 77: h\_L(z) = 2ĥ((2g−2)x − (ω − y)) for L = τ^*Θ̄\_J; Gao–Habegger Appendix A, p. 54: Moriwaki heights.

*Needs:* §3.1 (`AH.3/intersection-pairing`); §3.2 (`AH.3/deligne-pairing`); §1.6 (`AH.1/essentially-quasi-projective`); `ArakelovGeometryAndAbelianHeights:R35.1`; `HeightsRationalPointsAndObstructions:RP.0/normalized-height`; `mathlib:NumberField.prod_abs_eq_one`; `mathlib:Projectivization.logHeight`.

*Sources:* Yuan, §4.1.2, pp. 63–64: Defines the normalized height of an adelic line bundle at algebraic points over number fields and function fields; item PAPER-YUAN-26/118.; Yuan–Zhang, §5.3.1–5.3.5, pp. 152–157: Defines heights on quasi-projective varieties, vector-valued heights over finitely generated fields and the Moriwaki condition.

### 4.8 The Yuan–Zhang height inequality

`AH.4/height-inequality` · theorem · planet: Yuan–Zhang height inequality

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k. Let π : X → S be a morphism of quasi-projective K-varieties, L̄ ∈ P̂ic(X/k), M̄ ∈ P̂ic(S/k), and L̃ the image of L̄ in P̂ic(X/K). (1) If L̄ is big on X/k, there are ε > 0 and a dense open U ⊂ X with h\_L̄(x) ≥ ε·h\_M̄(π(x)) for all x ∈ U(K̄). (2) If L̄ is nef on X/k and L̃ is big on X/K, then for every c > 0 there are ε > 0 and dense open U with h\_L̄(x) ≥ ε h\_M̄(π(x)) − c. (3) If L̃ is big, there are c, ε > 0 and U with h\_L̄ ≥ ε h\_M̄∘π − c. For a strict inequality outside a divisor (as needed for closed ≤ small-point sets), apply (1) to M̄ + Ā with Ā of strictly positive height.

**Hypotheses.**

- As stated; K a global field.

**Proof route.**

- (1) Bigness gives, for small ε, a nonzero effective section s of m(L̄ − επ^*M̄) (Siu, AH.4/hilbert-samuel-siu), and h\_{L̄−επ^*M̄} ≥ 0 off div(s) (Yuan–Zhang Theorem 5.3.7).
- (2)–(3) Add a small multiple of the pullback of a positive-degree bundle on Spec K, which makes L̄ big by Siu, then subtract.
- Strict version: replace M̄ by M̄ + Ā where Ā has positive height everywhere (Yuan p. 65 with the correction recorded at PAPER-YUAN-26/E21).

**Checks.**

- For X = S and π = id, (1) says a big L̄ has heights bounded below by a positive multiple of any height off a divisor.

*Needs:* §4.7 (`AH.4/adelic-heights`); §4.3 (`AH.4/hilbert-samuel-siu`); §4.1 (`AH.4/effective-sections`).

*Sources:* Yuan–Zhang, Theorem 5.3.7, p. 163: Proves the three parts of the height inequality over global fields.; Yuan, Proof of Theorem 4.2, p. 65; §1.2, pp. 8–9: Applies the height inequality to big adelic bundles; item PAPER-YUAN-26/121.; DeMarco–Mavraki–Ye, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3): Uses the height inequality h\_M ≥ ε₁h − ε₂ on a dense open set for non-degenerate M.

### 4.9 The fundamental inequality over global fields

`AH.4/fundamental-inequality` · theorem

Let k = ℤ and K a number field, or k a field and K a one-variable function field over k; X a quasi-projective K-variety of dimension n; L̄ a nef element of P̂ic(X/k)\_ℚ whose image L̃ in P̂ic(X/K)\_ℚ is big. Put a\_K = [K : ℚ] in the arithmetic case and a\_K = 1 in the geometric case. With the absolute arithmetic normalization of AH.4/adelic-heights, h\_L̄(X) = L̄^{n+1}/(a\_K·(n+1)·deg L̃) and the essential minimum e₁(X, L̄) = sup\_U inf\_{x∈U(K̄)} h\_L̄(x), one has e₁(X, L̄) ≥ h\_L̄(X) ≥ e₁(X, L̄)/(n + 1).

**Hypotheses.**

- L̄ nef on X/k; L̃ big on X/K.

**Proof route.**

- First inequality: Hilbert–Samuel (AH.4/hilbert-samuel-siu) gives sections of m(L̄ − t) for t < h\_L̄(X), whose divisors contain all points of small height (Yuan–Zhang Lemma 5.3.4).
- Second inequality: successive minima argument of Zhang on a projective model, passed to the limit (Yuan–Zhang Theorem 5.3.3).

**Checks.**

- For a point (n = 0), h\_L̄(X) = e₁ = h\_L̄(x).
- Over a number field K and X = Spec K with O(c) pulled back from Spec ℤ, L̄¹ = [K : ℚ]c, deg L̃ = 1 and both h\_L̄(X) and e₁ equal c. Omitting a\_K would contradict the point case whenever [K : ℚ] > 1 and c ≠ 0.

*Needs:* §4.7 (`AH.4/adelic-heights`); §4.3 (`AH.4/hilbert-samuel-siu`).

*Sources:* Yuan–Zhang, Theorem 5.3.3 and Lemma 5.3.4, pp. 158–159: Proves e₁(X, L) ≥ h\_L(X) ≥ e₁(X, L)/(n + 1) for nef L with big generic fibre over a global field.; DeMarco–Mavraki–Ye, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3): Uses the fundamental inequality to deduce h\_M(X) = 0 from a generic small sequence.

**Refinements left for the lemma-level pass.**

- Lemma-level continuity of the volume (Yuan–Zhang Theorem 5.2.9) used for nef, not strongly nef, bundles.

## Layer AH.5: Equidistribution, invariant extensions and the adelic Hodge bundle

Equidistribution of generic small sequences for nef adelic line bundles on quasi-projective varieties, invariant adelic extensions for polarized dynamical systems over a base (the Tate limit), non-degenerate subvarieties with their height inequality and equidistribution, and the adelic Hodge bundle of a family of curves with the determinant L² metric.

Targets: §5.1 Equidistribution of generic small points on quasi-projective varieties; §5.2 Invariant adelic extensions of polarized dynamical systems; §5.3 Non-degenerate subvarieties and non-degenerate adelic line bundles; §5.4 Height inequality and equidistribution on non-degenerate subvarieties; §5.5 The adelic Hodge bundle of a family of curves.

Planets: Equidistribution of small points, Invariant adelic extension, Adelic Hodge bundle.

### 5.1 Equidistribution of generic small points on quasi-projective varieties

`AH.5/equidistribution` · theorem · planet: Equidistribution of small points

Let K be a number field (k = ℤ) or a one-variable function field over k, X a quasi-projective K-variety and L̄ a nef adelic line bundle on X/k with deg L̃(X) > 0. If {x\_m} is a generic sequence in X(K̄) (no subsequence in a proper closed subvariety) with h\_L̄(x\_m) → h\_L̄(X) (the consistently normalized variety height of AH.4/fundamental-inequality), then for every place v of K the Galois orbits of x\_m equidistribute in X\_v^an for the canonical measure dμ\_{L̄,v} of AH.2/canonical-measures. For X projective and L̄ a model bundle this is Yuan's equidistribution theorem of ArithmeticDynamics DY.4.

**Hypotheses.**

- L̄ nef; deg L̃(X) > 0; generic sequence with heights tending to h\_L̄(X).

**Proof route.**

- Variational principle: for M̄ in the kernel of P̂ic(X)\_int → P̂ic(X/K)\_int and small rational ε, apply AH.4/fundamental-inequality and Siu to L̄ + εM̄ (Yuan–Zhang Theorem 5.4.3).
- Quasi-projective step: test functions are approximated by Green functions of zero-underlying adelic divisors, localized at v (Lemma 5.4.4).

**Checks.**

- For the canonical metric of a polarized endomorphism of ℙ¹, it is the dynamical equidistribution of DY.4.

*Needs:* §4.9 (`AH.4/fundamental-inequality`); §4.3 (`AH.4/hilbert-samuel-siu`); §2.6 (`AH.2/canonical-measures`); `ArithmeticDynamics:DY.4/equidistribution-for-semipositive-adelic-line-bundles`.

*Sources:* Yuan–Zhang, Theorem 5.4.3, p. 168; Lemma 5.4.4, p. 170: Proves equidistribution of generic small sequences for nef adelic line bundles with positive generic degree over global fields.; DeMarco–Mavraki–Ye, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3): Uses the equidistribution of Galois orbits of a generic small sequence to c₁(M)^{dim X}/vol.

### 5.2 Invariant adelic extensions of polarized dynamical systems

`AH.5/invariant-extension` · construction · planet: Invariant adelic extension

Let S be flat essentially quasi-projective integral over k, π : X → S projective flat with geometrically connected fibres, f : X → X an S-morphism and L ∈ Pic(X)\_ℚ with f^*L = qL for a rational q > 1. (1) There is a unique L̄\_f ∈ P̂ic(X/k)\_ℚ with underlying L and f^*L̄\_f = qL̄\_f, and f′^*L̄\_f = q′L̄\_f for every f′ commuting with f with f′^*L = q′L and q′ ≠ 0 (Yuan–Zhang Theorem 6.1.2). (2) If L is relatively ample over S, so that (X, f, L) is a polarized dynamical system, L̄\_f is the boundary limit of the Tate sequence q^{−n}(f^n)^*L̄₀ for any model L̄₀; it is nef, strongly nef when S has an affine model, and lies in P̂ic(X/k) when L ∈ Pic(X), q ∈ ℤ\_{>1} and f^*L ≅ qL integrally (Theorem 6.1.1). (3) For an abelian scheme A → S and a line bundle L rigidified along the zero section with [−1]^*L ≅ εL, ε = ±1, there is a unique adelic extension with [2]^*L̄ = 4L̄ (ε = 1) or 2L̄ (ε = −1); it is integrable and [m]^*L̄ = m²L̄ (resp. mL̄) for all m (Theorem 6.1.3); for symmetric relatively ample L it is the nef extension of (2) with f = [2].

**Hypotheses.**

- f^*L = qL in Pic(X)\_ℚ, q > 1; π projective flat with geometrically connected fibres.
- Nefness only for L relatively ample over S (polarized dynamical system).

**Construction.**

- Choose a boundary divisor; the divisor of the isomorphism ℓ : L → q⁻¹f^*L is bounded by rπ^*E₀, so the Tate sequence is boundary-Cauchy with geometric rate q⁻ⁿ (Yuan–Zhang Theorem 6.1.1).
- Uniqueness: two invariant extensions differ by a vertical bundle V with f^*V = qV and boundary-bounded, forcing V = 0 by injectivity of analytification (Theorem 6.1.2).
- Nefness: limit of nef model bundles after twisting by the pullback of an ample bundle on a model of S.

**API.**

- `invariantExtension` (constructor): L̄\_f with underlying L and f^*L̄\_f = qL̄\_f.
- `invariantExtension_unique` (extensionality): Unique with these properties.
- `invariantExtension_nef` (other): Nef when L is relatively ample; strongly nef over an affine base.
- `invariantExtension_abelian` (constructor): For a rigidified L on an abelian scheme with [−1]^*L ≅ ±L, the integrable extension with [2]^*L̄ = 4L̄ or 2L̄.
- `invariantExtension_commute` (functoriality): If f′f = ff′ and f′^*L = q′L with q′ ≠ 0, then f′^*L̄\_f = q′L̄\_f.
- `invariantExtension_baseChange` (functoriality): Compatible with base change of S.
- `invariantExtension_height` (compatibility): h\_{L̄\_f} is the Call–Silverman canonical height fibrewise.

**Unit tests.**

- `invariantExtension_squaring` (computation): For f(z) = z² on ℙ¹\_K, L̄\_f is O(1) with the max metric and h\_{L̄\_f} is the Weil height.
- `invariantExtension_trivial` (degenerate): For L = O\_X the invariant extension is the trivial adelic bundle.
- `invariantExtension_symmetric_quadratic` (characterisation): For an abelian scheme with symmetric L and [n], [n]^*L̄ = n²L̄.
- `invariantExtension_q_one_nonexample` (non-example): For q = 1 (e.g. f = identity) the Tate sequence is constant and no uniqueness holds.

**Checks.**

- For the squaring map on ℙ¹ over S = Spec K, L̄\_f is O(1) with the max metric at every place.
- For an elliptic scheme and L = O(e), the canonical extension computes the fibrewise Néron–Tate height.

**Uses.** Yuan Theorem 2.9, p. 35: the canonical twice-theta bundle Θ̄ of the relative Jacobian; DeMarco–Mavraki–Ye §4, p. 19: the invariant extension of a polarized family on ℙ¹ recovers the Call–Silverman height.

*Needs:* §1.3 (`AH.1/adelic-line-bundles`); §1.5 (`AH.1/positivity-notions`); §2.3 (`AH.2/analytification-injective`); `ArithmeticDynamics:DY.4/canonical-adelic-metric-of-a-rational-map`.

*Sources:* Yuan–Zhang, Theorems 6.1.1–6.1.3, pp. 180–184: Constructs the invariant adelic line bundle of a polarized dynamical system over a base with invariance, nefness and integrality; proves existence, uniqueness and commutation for arbitrary f^*L = qL; and treats rigidified symmetric and antisymmetric bundles on abelian schemes.; Yuan, §2.3, p. 33; Theorem 2.10(3) proof, pp. 38–39: Uses the dynamical construction for the symmetric twice-theta bundle on the relative Jacobian and the odd Poincaré bundle; items PAPER-YUAN-26/47, 66.; DeMarco–Mavraki–Ye, §4, pp. 19–20 (arXiv v3): Uses the invariant extension L\_Φ of a polarization for a polarized family of endomorphisms.

### 5.3 Non-degenerate subvarieties and non-degenerate adelic line bundles

`AH.5/non-degenerate` · definition

Let K be a number field, S a quasi-projective K-variety, (X, f, L) a polarized dynamical system over S, Y ⊂ X a closed subvariety, M = L̄\_f\|\_Y ∈ P̂ic(Y/ℤ)\_{ℚ,nef} and M̃ its image in P̂ic(Y/K)\_{ℚ,nef} (the geometric part over K). Y is non-degenerate if deg M̃(Y) = M̃^{dim Y} > 0, equivalently M̃ is big on Y/K, equivalently the measure c₁(L̄\_f)^{dim Y} on Y\_σ(ℂ) is nonzero for one (every) embedding σ : K → ℂ (Yuan–Zhang Lemma 5.4.4), and the same at non-archimedean places. For an abelian scheme over a smooth base this is full rank 2 dim Y of the Betti map at some point. More generally a nef adelic M̄ on Y is non-degenerate if M̃ is big on Y/K. Non-degeneracy is not bigness of M on Y/ℤ: a non-degenerate Y can carry a generic sequence of small points, and then M^{dim Y + 1} = 0. For an abelian scheme A → S and a generically finite ι : Y → A, non-degeneracy of ι does not depend on the symmetric relatively ample rigidified L.

**Hypotheses.**

- K a number field; Y a closed subvariety (or Y with a generically finite map).

**Construction.**

- M̃ is nef, so deg M̃(Y) > 0 iff M̃ is big (geometric Hilbert–Samuel, AH.4/hilbert-samuel-siu over K).
- deg M̃(Y) equals the total mass of c₁(L̄\_f)^{dim Y} on Y\_σ(ℂ) (Yuan–Zhang Lemma 5.4.4); for abelian schemes this form is the Betti form, whose top power is nonzero iff the Betti map has full rank (Dimitrov–Gao–Habegger Proposition 2.2 as cited by Yuan–Zhang).
- Independence of L: Betti forms of two relatively ample bundles bound each other by positive constants.

**API.**

- `IsNonDegenerate` (data): deg M̃(Y) > 0 for the geometric part M̃ of L̄\_f\|\_Y.
- `IsNonDegenerate_iff_big` (characterisation): Iff M̃ is big on Y/K.
- `IsNonDegenerate_iff_curvature` (characterisation): Iff c₁(L̄\_f)^{dim Y} restricted to Y\_σ(ℂ) is nonzero.
- `IsNonDegenerate_indep` (other): Independent of the symmetric relatively ample L.
- `IsNonDegenerate_mono` (other): Preserved under generically finite dominant maps of the source.

**Unit tests.**

- `IsNonDegenerate_point_base` (computation): Over S = Spec K every closed subvariety Y is non-degenerate: deg M̃(Y) = deg\_L(Y) > 0. In particular X = A itself is non-degenerate although h\_{L̄}(A) = 0, so M^{dim Y+1} = 0 and M is not big on Y/ℤ.
- `IsNonDegenerate_section` (degenerate): A torsion section of an abelian scheme over a curve is degenerate: the Betti map is constant on it, so deg M̃(Y) = 0.
- `IsNonDegenerate_constant_nonexample` (non-example): For a constant family A₀ × S → S over a positive-dimensional S and Y = Z₀ × S with Z₀ ⊂ A₀ of positive dimension, Y is degenerate: the Betti map factors through Z₀, so its rank is at most 2 dim Z₀ < 2 dim Y.

**Checks.**

- For S = Spec K, M̃ is L\|\_Y and deg M̃(Y) = deg\_L(Y) > 0, so every Y is non-degenerate.

**Uses.** Yuan–Zhang Theorem 6.2.2, p. 188: height inequality on non-degenerate subvarieties; DeMarco–Mavraki–Ye Theorem 1.8 proof, p. 21: non-degeneracy of the critical height bundle.

*Needs:* §5.2 (`AH.5/invariant-extension`); §4.2 (`AH.4/adelic-volume`); §4.3 (`AH.4/hilbert-samuel-siu`); §2.6 (`AH.2/canonical-measures`).

*Sources:* Yuan–Zhang, §6.2.2, p. 188; Lemma 5.4.4, p. 170: Defines Y non-degenerate by deg M̃(Y) > 0 for the geometric part M̃, equivalently bigness of M̃, and relates it to the archimedean measure and to full rank of the Betti map.; DeMarco–Mavraki–Ye, §4, p. 20 (arXiv v3; citing Yuan–Zhang Lemma 5.4 and §6.2.2): Proves non-degeneracy of its metrized line bundles M\_i by checking c₁(M\_i)^{∧dim} ≠ 0.

### 5.4 Height inequality and equidistribution on non-degenerate subvarieties

`AH.5/non-degenerate-height-inequality` · theorem

Let S be a quasi-projective variety over a number field K, (X, f, L) a polarized dynamical system over S, Y ⊂ X a non-degenerate closed subvariety and B̄ ∈ P̂ic(S)\_ℚ. (1) For every c > 0 there are ε > 0 and a dense open U ⊂ Y with h\_{L̄\_f}(y) ≥ ε·h\_B̄(π(y)) − c on U(K̄). (2) If {y\_m} is a generic sequence in Y(K̄) with h\_{L̄\_f}(y\_m) → 0, then for every place v the Galois orbits equidistribute for dμ\_{L̄\_f\|\_Y, v}.

**Hypotheses.**

- Y non-degenerate; K a number field.

**Proof route.**

- (1) is AH.4/height-inequality(2) for Y → S and L̄\_f\|\_Y (Yuan–Zhang Theorem 6.2.2).
- (2) The existence of the sequence forces h(Y) = 0 by the fundamental inequality; apply AH.5/equidistribution (Theorem 6.2.3).

**Checks.**

- For an abelian scheme this is Kühne's relative equidistribution conjecture (Yuan–Zhang p. 189).

*Needs:* §5.3 (`AH.5/non-degenerate`); §4.8 (`AH.4/height-inequality`); §5.1 (`AH.5/equidistribution`); §4.9 (`AH.4/fundamental-inequality`).

*Sources:* Yuan–Zhang, Theorems 6.2.2 and 6.2.3, pp. 188–189: Proves the height inequality and the equidistribution theorem on non-degenerate subvarieties of polarized dynamical systems.; DeMarco–Mavraki–Ye, Proof of Theorem 1.8 in §4, p. 21 (arXiv v3): Uses both statements for the critical height bundle.

### 5.5 The adelic Hodge bundle of a family of curves

`AH.5/adelic-hodge-bundle` · construction · planet: Adelic Hodge bundle

Let S be quasi-projective, flat and integral over ℚ or ℤ and π : X → S a smooth relative curve of genus g > 1. The Hodge line λ\_S = det(π\_*ω\_{X/S}) with the determinant L² metric (‖β‖²\_nat = (i/2)∫\_{X\_s} β ∧ β̄ on π\_*ω) extends to an adelic line bundle λ̄\_S on S/ℤ. Through the canonical isomorphism λ\_S ≅ det(e^*Ω¹\_{J/S}) (JacobianChallengePartII JC6) the determinant L² metric equals the Faltings metric ‖α‖²\_Fal = (i^{g²}/2^g)∫\_{J\_s} α ∧ ᾱ (Szpiro), so h\_{λ̄\_S}(s) = h\_Fal(X\_s), the stable Faltings height of the Jacobian in Faltings' normalization, for s ∈ S(ℚ̄).

**Hypotheses.**

- π smooth of genus g > 1; S flat quasi-projective integral over ℤ or ℚ.

**Construction.**

- Comparison of metrics: Szpiro Lemme 3.2.1 as cited in Yuan Lemma 3.4, on the canonical isomorphism of JC6.
- Adelic extension: Yuan–Zhang Theorem 5.5.1 constructs ω(S) with Faltings metric on an abelian scheme from the minimal compactification of the Siegel moduli (pullback of the ample Hodge bundle with its logarithmically singular metric, R35.5 §§5.0b, 5.3–5.4).
- Height identity: Yuan–Zhang Theorem 5.5.1 (h = h\_Fal), with Faltings normalization from R35.2 §2.7.

**API.**

- `adelicHodgeBundle` (constructor): λ̄\_S ∈ P̂ic(S/ℤ) with underlying det π\_*ω.
- `adelicHodgeBundle_metric` (characterisation): Archimedean metric = determinant L² metric = Faltings metric.
- `adelicHodgeBundle_height` (compatibility): h\_{λ̄\_S}(s) = h\_Fal(X\_s) (Faltings normalization).
- `adelicHodgeBundle_baseChange` (functoriality): Compatible with base change of S.
- `adelicHodgeBundle_identification` (compatibility): Its algebraic line is det e^*Ω¹ of the abelian scheme, identified with the relative curve Hodge determinant through JC6; its analytic metric and model extensions are those of Yuan–Zhang Theorem 5.5.1, adjusted to the stated Faltings normalization.

**Unit tests.**

- `adelicHodgeBundle_normalization` (compatibility): With the Deligne metric (2π)^{−g}\|∫α∧ᾱ\| the height is h\_Fal + (g/2) log π.
- `adelicHodgeBundle_point` (degenerate): For S = Spec O\_K[1/N] and a single curve, the adelic degree of λ̄\_S at Spec K is [K : ℚ]h\_Fal; its absolute point height is h\_Fal.
- `adelicHodgeBundle_not_model` (non-example): λ̄\_S is in general not a model hermitian bundle on any projective model of S: the metric has logarithmic singularities along the boundary of moduli.

**Checks.**

- For g = 0 nothing is defined; for an elliptic family (g = 1, outside the hypothesis) the analogous statement is R35.5 §5.9.
- Normalization: the Deligne/Yuan–Zhang squared norm (2π)^{−g}\|∫α∧ᾱ\| gives h\_Del = h\_Fal + (g/2)log π (R35.2 §2.7).

**Uses.** Yuan §4.4.1, p. 78: M = Θ̄ + π\_J^*λ̄\_S + O(c) has height 2ĥ(y) + h\_Fal(X\_s) + c; Yuan §4.5.2, p. 90: the admissible Noether divisor Ξ\_S uses 12λ̄\_S.

*Needs:* `JacobianChallengePartII:JC6/hodge-line-isomorphism`; `StableReductionPartII:MC.5/hodge-determinant`; `ArakelovGeometryAndAbelianHeights:R35.2`; `ArakelovGeometryAndAbelianHeights:R35.3`; `ArakelovGeometryAndAbelianHeights:R35.5`; §1.3 (`AH.1/adelic-line-bundles`); §4.7 (`AH.4/adelic-heights`).

*Sources:* Yuan–Zhang, Theorem 5.5.1, p. 175: Constructs the canonical adelic line bundle ω(S) extending the Hodge line with the Faltings metric and proves h\_{ω(S)}(s) = h\_Fal(X\_s).; Yuan, Lemma 3.4, pp. 43–44: Gives the canonical isomorphism λ\_S ≅ det(e^*Ω¹\_{J/S}), the equality of the determinant L² metric with the Faltings metric, and the adelic Hodge bundle λ̄\_S; items PAPER-YUAN-26/78, 80, 81.

**Refinements left for the lemma-level pass.**

- The adelic Hodge bundle rests on the parent's logarithmic metrics at the boundary of A\_g^* (R35.5); the comparison is planned there.

## Layer AH.6: Moriwaki heights over finitely generated fields

Moriwaki polarizations of a finitely generated field over ℚ, the Moriwaki height as a Yuan–Zhang height and its height machine, the Moriwaki Néron–Tate height, and the Silverman–Tate and specialization theorems with Moriwaki heights.

Targets: §6.1 Moriwaki polarizations and Moriwaki heights; §6.2 The height machine for Moriwaki heights; §6.3 The Moriwaki Néron–Tate height; §6.4 Silverman–Tate and specialization with Moriwaki heights.

Planets: Moriwaki height, Moriwaki Néron–Tate height.

### 6.1 Moriwaki polarizations and Moriwaki heights

`AH.6/moriwaki-heights` · construction · planet: Moriwaki height

Let k₀ be a finitely generated field over ℚ of transcendence degree d. A polarization B = (B; H̄₁, …, H̄\_d; τ) consists of a normal projective flat integral ℤ-scheme B, nef smooth hermitian line bundles H̄ᵢ on B and an isomorphism τ : ℚ(B) ≅ k₀. For a projective k₀-variety X and a line bundle L on X, the Moriwaki height h^B\_{k₀,X,L} : X(k̄₀) → ℝ is defined modulo bounded functions by h(P) = deĝ(ĉ₁(L̄)·ĉ₁(f^*H̄₁)···ĉ₁(f^*H̄\_d)·[Δ\_P])/[k₀(P) : k₀] for a model (X → B, L̄) and the closure Δ\_P of P; it equals the Yuan–Zhang vector-valued height of AH.4/adelic-heights paired with H̄₁···H̄\_d. B is big if every H̄ᵢ is nef and big. For a field isomorphism ι : k₀ → k′₀ and B′ = (B; H̄; ι∘τ), h^{B′}\_{k′₀} ∘ ι = h^B\_{k₀}. For d = 0 (k₀ a number field, B = Spec O\_{k₀}) it is [k₀ : ℚ] times the absolute Weil height class. The displayed denominator is relative to k₀, as in Moriwaki and Yuan–Zhang; division by [k₀ : ℚ] is needed to compare with AH.4/adelic-heights.

**Hypotheses.**

- k₀ finitely generated over ℚ; H̄ᵢ nef smooth hermitian.

**Construction.**

- Independence of the model up to O(1): Moriwaki Corollary 3.3.5.
- Identification with the Yuan–Zhang height h^{H̄}\_L̄ over F = k₀ (Yuan–Zhang §5.3.5, Moriwaki condition).

**API.**

- `MoriwakiPolarization` (constructor): (B; H̄₁, …, H̄\_d; τ).
- `MoriwakiPolarization.IsBig` (data): All H̄ᵢ nef and big.
- `moriwakiHeight` (constructor): h^B\_L as a class in HeightClass(X(k̄₀)) (RP.0).
- `moriwakiHeight_eq_yuanZhang` (compatibility): Equals the Yuan–Zhang height h^{H̄}\_{L̄} for a model L̄.
- `moriwakiHeight_transport` (functoriality): h^{B′}\_{k′₀} ∘ ι = h^B\_{k₀} for ι : k₀ ≅ k′₀.
- `moriwakiHeight_numberField` (compatibility): For d = 0 it is [k₀ : ℚ] times the absolute logarithmic Weil height class, with the denominator in this node.

**Unit tests.**

- `moriwakiHeight_Q_projective` (computation): For k₀ = ℚ, X = ℙ¹, L = O(1): h^B\_L([1 : n]) = log\|n\| + O(1).
- `moriwakiHeight_trivial` (degenerate): h^B\_{O\_X} = O(1).
- `moriwakiHeight_transport_test` (characterisation): For k₀ = ℚ(t) and the automorphism t ↦ t + 1, transporting B gives the same height function after composing with ι.
- `moriwakiHeight_not_big_nonexample` (non-example): If H̄₁ is the trivial bundle with trivial metric (not big), then h^B\_L ≡ 0 up to O(1) for every L, so Northcott fails for ℙ¹ over k₀ = ℚ(t).

**Checks.**

- For k₀ = ℚ (d = 0) and X = ℙⁿ, L = O(1): h^B\_L = h + O(1), the Weil height (Moriwaki Proposition 3.3.7(1) with Proposition 3.3.2).
- The arithmetic model is projective and normal, as in Moriwaki §3.1; a quasi-projective presentation as in Gao–Habegger §A.1 needs projective extension data before the displayed arithmetic intersection is defined.

**Uses.** Gao–Habegger Theorem A.3, p. 56: the height inequality over finitely generated fields; Gao–Habegger §A.3, p. 56: geometric Bogomolov over any characteristic-zero field.

*Needs:* §4.7 (`AH.4/adelic-heights`); §0.3 (`AH.0/arithmetic-intersection-numbers`); `HeightsRationalPointsAndObstructions:RP.0/height-class`.

*Sources:* Moriwaki, §3.1–3.3, Definition 3.3.6, pp. 10–14: Defines polarizations of finitely generated fields and the arithmetic height function modulo bounded functions, independent of the model.; Gao–Habegger, §A.1, (A.1), pp. 54–55: Recalls the Moriwaki height for a polarization B = (B; H̄₁, …, H̄\_d; τ), its transport under field isomorphisms and the number-field case; item PAPER-GAO-HABEGGER-19/68.; Yuan–Zhang, §5.3.3, p. 155; §5.3.5, pp. 156–157: Identifies Moriwaki's heights with the real-valued heights attached to H ∈ P̂ic(F/k) and defines the Moriwaki condition.

### 6.2 The height machine for Moriwaki heights

`AH.6/moriwaki-height-machine` · theorem

With k₀, B, X as in AH.6/moriwaki-heights: (1) h^B\_{L⊗M} = h^B\_L + h^B\_M; (2) for a quasi-finite morphism q : X → Y of projective k₀-varieties and M on Y, h^B\_{q^*M} = h^B\_M ∘ q; (3) h^B\_L is bounded below off the stable base locus of L, and bounded when L = O\_X; (4) (Northcott) if L is ample and B is big, {P ∈ X(k̄₀) : h^B\_L(P) ≤ C, [k₀(P) : k₀] ≤ D} is finite for all C, D; (5) if L and M are algebraically equivalent and L is ample, then h^B\_M(P)/h^B\_L(P) → 1 as h^B\_L(P) → ∞.

**Hypotheses.**

- As in AH.6/moriwaki-heights; for (4) B big and L ample.

**Proof route.**

- (1), (3), (4): Moriwaki Proposition 3.3.7(2)–(4), (4) proved in Moriwaki §4 (Theorem 4.3).
- (2): Wazir Proposition 2(iv) as cited by Gao–Habegger (the smoothness assumption there is unnecessary; q generically finite suffices in Moriwaki Proposition 1.3(2)).
- (5): the argument of Lang, Fundamentals of Diophantine Geometry Ch. 4, Proposition 3.3 and Corollary 3.4, with Moriwaki heights in place of Weil heights.

**Checks.**

- For d = 0 it reduces to Weil's height machine of HeightsRationalPointsAndObstructions RP.0.

*Needs:* §6.1 (`AH.6/moriwaki-heights`); `HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`.

*Sources:* Moriwaki, Proposition 3.3.7, p. 15; Theorem 4.3, p. 20: Proves additivity, comparison with naive height, boundedness below off the base locus, and Northcott for big polarizations.; Gao–Habegger, Proposition A.1, p. 55: States the height machine (additivity, functoriality under quasi-finite maps, boundedness, Northcott, algebraic equivalence) with its sources; item PAPER-GAO-HABEGGER-19/68.

### 6.3 The Moriwaki Néron–Tate height

`AH.6/moriwaki-neron-tate` · theorem · planet: Moriwaki Néron–Tate height

Let A be an abelian variety over k₀ and L a symmetric ample line bundle. The limit ĥ^B\_L(P) = lim 4^{−n} h^B\_L([2ⁿ]P) exists for P ∈ A(k̄₀), is independent of the representative of h^B\_L, is quadratic (ĥ^B\_L([N]P) = N²ĥ^B\_L(P)), ≥ 0, and vanishes on torsion; if B is big then ĥ^B\_L(P) = 0 iff P is torsion. For k₀ a number field it is [k₀ : ℚ] times the usual absolute Néron–Tate height, with the relative Moriwaki normalization of AH.6/moriwaki-heights. It equals the height of the invariant extension L̄\_{[2]} of AH.5/invariant-extension paired with H̄₁···H̄\_d.

**Hypotheses.**

- L symmetric ample; B big for the kernel statement.

**Proof route.**

- Tate's limit for the bounded-error class (HeightsRationalPointsAndObstructions RP.0 Tate limit).
- Nonnegativity from boundedness below of the ample height; kernel by Northcott (AH.6/moriwaki-height-machine(4)) applied to the subgroup generated by P (Moriwaki Proposition 3.4.1).

**Checks.**

- For k₀ = ℚ it is the Néron–Tate height of RP.0.

*Needs:* §6.2 (`AH.6/moriwaki-height-machine`); `HeightsRationalPointsAndObstructions:RP.0/tate-limit`; §5.2 (`AH.5/invariant-extension`).

*Sources:* Moriwaki, Propositions 3.4.1–3.4.2, p. 16: Proves nonnegativity, vanishing on torsion and, for big polarizations, that the canonical height vanishes exactly on torsion; additivity in L.; Gao–Habegger, (A.2) and Proposition A.2, pp. 55–56: Recalls the Moriwaki Néron–Tate height and its properties; item PAPER-GAO-HABEGGER-19/69.

### 6.4 Silverman–Tate and specialization with Moriwaki heights

`AH.6/moriwaki-silverman-tate` · theorem

Let k₀ be finitely generated over ℚ with a big polarization B (the Hᵢ are nef and big). (1) For an abelian scheme 𝒜 → S over a regular quasi-projective k₀-variety with a projective compactification a symmetric relatively ample L = O(1,1)\|\_𝒜, and an embedding into ℙⁿ × S̄ as in HeightsRationalPointsAndObstructions RP.0/silverman-tate, there is c > 0 with \|ĥ^B\_{𝒜\_{π(P)}}(P) − h^B(P)\| ≤ c·max{1, h^B\_{S̄}(π(P))}. (2) For S a smooth projective k₀-curve and a section σ\_x over a generically finite S′ → S, ĥ^B(σ\_x(t))/h^B\_S(ρ(t)) → ĥ\_{K,A}(x) as h^B\_S(ρ(t)) → ∞ (Silverman's limit with Moriwaki heights). Here h^B\_S has degree-one normalization, and ĥ\_{K,A}(x), K = k₀(S), is the geometric generic-fibre height normalized over K: if x is represented over K′ = k₀(S′), divide its K′-height by [K′ : K]. The comparison height on S̄ is attached to an ample bundle.

**Hypotheses.**

- As in RP.0/silverman-tate and RP.0/silverman-specialization-limit, with Moriwaki heights over k₀.

**Proof route.**

- Apply the Moriwaki height machine and the duplication estimate exactly as in the imported RP.0 proofs. Wazir’s preprint Theorems 0.2–0.3 (pp. 4–5) explicitly give comparison and the specialization limit over a finitely generated characteristic-zero field; Gao–Habegger §§A.2–A.3 supply the ample comparison and big-polarization scope. For a section only after a finite cover, apply the section theorem upstairs and divide the geometric height by the cover degree, using h\_S∘ρ/h\_{S′} → deg ρ.

**Checks.**

- For k₀ a number field (d = 0) these are RP.0/silverman-tate and RP.0/silverman-specialization-limit.

*Needs:* §6.2 (`AH.6/moriwaki-height-machine`); §6.3 (`AH.6/moriwaki-neron-tate`); `HeightsRationalPointsAndObstructions:RP.0/silverman-tate`; `HeightsRationalPointsAndObstructions:RP.0/silverman-specialization-limit`.

*Sources:* Gao–Habegger, §A.2, p. 56; §A.3, p. 57: States that the Silverman–Tate comparison and Silverman's specialization limit hold with Moriwaki heights, citing Wazir 2006 Theorems 2–3; item PAPER-GAO-HABEGGER-19/70.; Wazir, Theorems 0.2–0.3, pp. 4–5 (arXiv v2): The preprint gives the Moriwaki comparison and specialization theorem; its numbering differs from the published Theorems 2–3 cited by Gao–Habegger. Use the ample base height and big polarization specified in this node.

## Layer AH.7: Local admissible metrics on curves

For a smooth projective geometrically integral curve C over a complete non-archimedean field, with g > 1 for the canonical curve-pair: Tate's admissible metrics on abelian varieties, admissibility on C through the Jacobian and on C², the canonical admissible measure, Zhang's canonical pair of admissible metrics on ω\_C and O(Δ), the explicit graph formulas at split semistable reduction, rescaling, good reduction and trivially valued fields, and the global admissible bundles ω\_{C/K,a} and O(Δ)\_a over a global field. The archimedean theory is GrossZagierAndArithmeticHeights GZ.2; graph measures and Green functions are TropicalAndBerkovichArithmetic TB.3/TB.6.

Targets: §7.1 Admissible metrics on abelian varieties; §7.2 Admissible metrics on a curve and on its square; §7.3 The canonical admissible measure on a curve; §7.4 Zhang's canonical admissible metrics on ω_C and O(Δ); §7.5 Explicit graph formulas for the canonical metrics; §7.6 Rescaling, good reduction and trivially valued fields; §7.7 The admissible bundles ω_{C/K,a} and O(Δ)_a over a global field.

Planets: Admissible metric on an abelian variety, Canonical admissible measure, Zhang's admissible metrics, Admissible canonical bundle.

### 7.1 Admissible metrics on abelian varieties

`AH.7/abelian-admissible-metrics` · construction · planet: Admissible metric on an abelian variety

Let A be an abelian variety over a complete field K with a nontrivial non-archimedean absolute value and M a line bundle on A. If M is even ([−1]^*M ≅ M), a continuous metric on M is admissible if the isomorphism [2]^*M ⊗ M^{−4} ≅ O\_A identifies it with a constant metric; if M is odd ([−1]^*M ≅ M^{−1}) replace 4 by 2; in general require admissibility of the induced metrics on M ⊗ [−1]^*M (even) and M ⊗ ([−1]^*M)^{−1} (odd). Every M has an admissible metric on A^an, unique up to a positive constant (Tate's limit); it is integrable, and semipositive when M is ample.

**Hypotheses.**

- K complete non-archimedean, nontrivially valued; A abelian variety over K.

**Construction.**

- Existence: Tate's limit of [2^n]^* of a model metric, uniformly convergent by contraction (Zhang 1995, Yuan §A.3).
- Uniqueness: two admissible metrics differ by a continuous function φ with φ∘[2] = 4φ + c (resp. 2φ + c), forcing φ constant.
- Semipositivity: limit of semipositive model metrics when M is ample.

**API.**

- `AbelianVariety.admissibleMetric` (constructor): The admissible metric, unique up to a constant.
- `AbelianVariety.admissibleMetric_even` (characterisation): For even M, [2]^*M̄ = 4M̄ up to a constant isometry.
- `AbelianVariety.admissibleMetric_odd` (characterisation): For odd M, [2]^*M̄ = 2M̄ up to a constant isometry.
- `AbelianVariety.admissibleMetric_tensor` (simp): Tensor products and pullbacks by homomorphisms of admissible metrics are admissible.
- `AbelianVariety.admissibleMetric_semipositive` (other): Semipositive for ample M.
- `AbelianVariety.admissibleMetric_rigidified_unique` (extensionality): Two admissible metrics differ by one positive scalar; fixing the norm of a rigidifying frame at the origin makes the metric unique. Tensor products and homomorphism pullbacks respect these rigidifications.

**Unit tests.**

- `AbelianVariety.admissibleMetric_goodReduction` (compatibility): With good reduction, the admissible metric is the model metric from the abelian scheme over O\_K, up to a constant.
- `AbelianVariety.admissibleMetric_trivial` (degenerate): For M = O\_A the admissible metrics are the constant metrics.
- `AbelianVariety.admissibleMetric_unique` (characterisation): Two admissible metrics on M have constant ratio.
- `AbelianVariety.admissibleMetric_badModel_nonexample` (non-example): For a Tate elliptic curve the model metric of O(e) on the minimal regular model is not admissible: it is not [2]-invariant up to a constant.

**Checks.**

- For an elliptic curve with good reduction, the admissible metric on O(e) is the model metric of the Néron model.

**Uses.** Yuan §A.3, p. 108: curve admissibility through the Jacobian; Yuan Definition 2.5, p. 30: admissible extensions on abelian schemes over S.

*Needs:* `TropicalAndBerkovichArithmetic:TB.6/formal-model-metrics`; `TropicalAndBerkovichArithmetic:TB.6/semipositive-integrable-metrics`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`; §5.2 (`AH.5/invariant-extension`).

*Sources:* Yuan, §A.3, pp. 107–108: Defines admissible metrics on even, odd and general line bundles on abelian varieties and states existence and uniqueness up to constants, integrability and semipositivity; items PAPER-YUAN-26/201–202.

### 7.2 Admissible metrics on a curve and on its square

`AH.7/curve-admissible-metrics` · definition

Let C/K be smooth projective geometrically integral of genus g > 1 over a complete nontrivially valued non-archimedean field. Choose α ∈ Pic¹(C) (after a finite extension if Pic¹(C)(K) is empty), the Abel–Jacobi map i\_α : C → J and the theta divisor θ\_α. A continuous metric on a line bundle L on C is admissible if for some m ≥ 1 there is a line bundle M on J algebraically equivalent to an integer multiple of θ\_α with an admissible metric and an isometry L^m ≅ i\_α^*M. A metric on a line bundle on C² is admissible if its pullbacks along (x, id) and (id, x) are admissible for every x ∈ C(K′), K′/K finite. Every line bundle on C (resp. C²) has an admissible metric, unique up to a positive constant; the notion is independent of α and of the finite extension, and compatible with base change. For a symmetric metric on O(Δ) (Green function invariant under transposition) the pullback along (x, id) is a metric on O(x).

**Hypotheses.**

- C smooth projective geometrically integral of genus g > 1; K complete non-archimedean.

**Construction.**

- Existence and uniqueness on C from AH.7/abelian-admissible-metrics via i\_α, using that every degree-d bundle is algebraically equivalent to (d/g)·i\_α^*θ\_α in Pic ⊗ ℚ (JacobianChallengePartII JC3 theta pullbacks).
- Independence of α: two Abel maps differ by a translation, and translates of admissible metrics are admissible.
- On C²: use the biextension Picard comparison (JacobianChallengePartII JC4 axis-normalized Picard and pointed-square comparison) and admissibility of the Poincaré bundle.

**API.**

- `Curve.IsAdmissibleMetric` (data): L^m ≅ i\_α^*M isometrically for an admissible M on J.
- `Curve.admissibleMetric_exists` (other): Existence, unique up to a positive constant.
- `Curve.admissibleMetric_indep` (other): Independent of α and of finite extensions; compatible with base change.
- `CurveSquare.IsAdmissibleMetric` (data): Admissible on all horizontal and vertical fibres.
- `CurveSquare.admissibleMetric_exists` (other): Existence and uniqueness up to constants on C².
- `DiagonalMetric.IsSymmetric` (data): Green function of O(Δ) invariant under transposition.

**Unit tests.**

- `Curve.admissible_goodReduction` (compatibility): With good reduction, the model metrics on ω\_C and O(Δ) from the smooth model are admissible.
- `Curve.admissible_trivialBundle` (degenerate): On O\_C the admissible metrics are the constant ones.
- `Curve.admissible_tensor` (characterisation): Tensor products and inverses of admissible metrics are admissible.
- `Curve.admissible_modelBad_nonexample` (non-example): For a totally degenerate genus-two curve with two rational components joined at three nodes (unit-edge banana skeleton), the model metric of ω has atomic curvature δ\_v₁ + δ\_v₂, whereas an admissible metric has curvature 2μ\_a = (2/3)Σ\_e δ\_e. Thus this model metric is not admissible.

**Checks.**

- For C with good reduction, model metrics from the smooth model are admissible.

**Uses.** Yuan Theorem A.1, p. 104: characterisation of Zhang's canonical metrics; Yuan Definition 2.5, p. 30: fibrewise admissibility of adelic extensions.

*Needs:* §7.1 (`AH.7/abelian-admissible-metrics`); `JacobianChallengePartII:JC3/theta-pullback`; `JacobianChallengePartII:JC4/pointed-square-picard-isomorphism`; `JacobianChallengePartII:JC2/degree-one-closed-immersion`.

*Sources:* Yuan, §A.2, pp. 103–104; §A.3, pp. 108–109: Defines symmetric diagonal metrics, curve admissibility through the Jacobian, biadmissibility on C², and states existence, uniqueness and independence; items PAPER-YUAN-26/196, 203, 204, 207, 208.

### 7.3 The canonical admissible measure on a curve

`AH.7/admissible-measure` · construction · planet: Canonical admissible measure

Let C/K be as in AH.7/curve-admissible-metrics. There is a unique probability measure μ\_a on C^an such that a metrized line bundle L̄ on C is admissible iff its metric is integrable and c₁(L̄) = deg(L)·μ\_a. It is the normalized curvature c₁(i\_α^*O(θ\_α))/g of an admissible theta metric. If M on J is algebraically equivalent to zero with an admissible metric then c₁(i\_α^*M̄) = 0. At split semistable reduction, μ\_a = (1/g)·i\_*(Σ\_v g\_v δ\_v + Σ\_e (1/(r\_e + 1))δ\_e) on the skeleton (GrossZagierAndArithmeticHeights GZ.2/explicit-skeleton-measure).

**Hypotheses.**

- C of genus g > 0; for g = 1 normalize with a positive-degree bundle rather than ω (source issue PAPER-YUAN-26/E28).

**Construction.**

- Define μ\_a from θ\_α; independence of α by translation invariance of curvature of algebraically trivial admissible bundles (Yuan–Zhang arithmetic Hodge index for abelian varieties, cited as [YZ1] Theorem 5.16 in Yuan).
- Characterization: an integrable metric with c₁ = deg·μ\_a differs from an admissible one by a metric with zero curvature, hence by a constant (Calabi uniqueness, AH.7/canonical-metric-pair step).

**API.**

- `Curve.admissibleMeasure` (constructor): μ\_a, a probability measure on C^an.
- `Curve.admissible_iff_curvature` (characterisation): Admissible iff integrable with c₁ = deg·μ\_a.
- `Curve.admissibleMeasure_baseChange` (functoriality): Compatible with finite extensions of K.
- `Curve.admissibleMeasure_skeleton` (compatibility): Equals the GZ.2 skeleton measure at split semistable reduction.
- `Curve.admissibleMeasure_unique` (extensionality): The degree-one curvature condition determines the probability measure: for any admissible positive-degree L̄ it equals c₁(L̄)/deg L.

**Unit tests.**

- `Curve.admissibleMeasure_good` (computation): Good reduction: μ\_a = δ\_ζ, ζ the Gauss point.
- `Curve.admissibleMeasure_mass` (degenerate): μ\_a(C^an) = 1.
- `Curve.admissibleMeasure_genus2_banana` (computation): For a genus-2 curve whose skeleton is two vertices of genus 0 joined by three unit edges, μ\_a = (1/2)Σ\_e (1/(1 + 1/2))δ\_e = (1/3)Σ\_e δ\_e (each r\_e = 1/2).
- `Curve.admissibleMeasure_not_canonical_signed` (non-example): μ\_a is not the Baker–Rumely canonical measure μ\_can, which may be signed.

**Checks.**

- For good reduction μ\_a is the Dirac mass at the Gauss point of the reduction.

**Uses.** Yuan Theorem A.1, p. 104: curvature conditions c₁(O(x)) = c₁(O(y)) and c₁(ω) = (2g − 2)c₁(O(x)); Yuan §3.3.1, p. 48: the φ-invariant integrates against the admissible metrics.

*Needs:* §7.2 (`AH.7/curve-admissible-metrics`); §2.6 (`AH.2/canonical-measures`); `GrossZagierAndArithmeticHeights:GZ.2/explicit-skeleton-measure`; `TropicalAndBerkovichArithmetic:TB.6/graph-green-and-admissible-measure`.

*Sources:* Yuan, Proposition A.2, pp. 108–109; Proposition A.5, pp. 117–118: Proves existence and uniqueness of the admissible probability measure characterising admissible metrics, vanishing curvature for algebraically trivial pullbacks, and the explicit skeleton formula; items PAPER-YUAN-26/205, 206.

### 7.4 Zhang's canonical admissible metrics on ω_C and O(Δ)

`AH.7/canonical-metric-pair` · construction · planet: Zhang's admissible metrics

Let C/K be smooth projective geometrically integral of genus g > 1 over a complete nontrivially valued non-archimedean field. There is a unique pair of metrics, on ω\_C and on O(Δ) over (C²)^an, both integrable and the diagonal metric symmetric, such that for every finite extension K′/K and x, y ∈ C(K′): (a) c₁(O(x)) = c₁(O(y)); (b) c₁(ω) = (2g − 2)c₁(O(x)); (c) ∫ g\_Δ(x, ·)c₁(O(x)) = 0; (d) the residue map (ω ⊗ O(x))\|\_x → K′ is an isometry. Here O(x) carries the pullback of the diagonal metric along (x, id). These are Zhang's admissible metrics; both are admissible; their pairing on divisors with disjoint support is Zhang's admissible pairing (D, E)\_a; the canonical isomorphism ω\_C ≅ Δ^*O(−Δ) and p₁\_*⟨O(Δ), p₂^*L̄⟩ ≅ L̄ (L̄ admissible) are isometries up to constants that the normalization (c)–(d) fixes; and Q = (id\_J, i\_α)^*P with admissible L gives q₁\_*⟨Q, q₂^*L⟩ odd with an admissible metric. The pair descends from a finite Galois extension, which reduces existence to the pointed case.

**Hypotheses.**

- g > 0 as stated by Yuan; the proofs of (b) and of the measure identification need g > 1 (source issues PAPER-YUAN-26/E8, E28), so this roadmap uses the pair for g > 1 and records g = 1 as a gap.

**Construction.**

- Uniqueness: Calabi uniqueness on curves — two integrable metrics with the same Chambert-Loir curvature differ by a constant (Yuan–Zhang 2017 [YZ1] Corollary 2.2), and (c)–(d) fix the constants (Yuan p. 106).
- Existence: take admissible metrics (AH.7/curve-admissible-metrics); restriction of an admissible O(Δ) metric to the diagonal is admissible (Heinz Proposition 4.3 as cited, Yuan p. 112); the pairing with the diagonal is an isometry up to constant (pp. 113–114); the Poincaré Deligne pairing is odd (p. 114); then normalize.
- Descent: uniqueness gives Galois invariance (Yuan §A.4).
- Comparison with Zhang's graph construction: Yuan p. 106–107 (Zhang 1993 Theorem 4.6).

**API.**

- `Curve.canonicalOmegaMetric` (constructor): Zhang's admissible metric on ω\_C.
- `Curve.canonicalDiagonalMetric` (constructor): Zhang's symmetric admissible metric on O(Δ).
- `Curve.canonical_curvature` (characterisation): c₁(O(x)) = μ\_a and c₁(ω) = (2g − 2)μ\_a.
- `Curve.canonical_normalization` (characterisation): ∫ g\_Δ(x, ·)dμ\_a = 0 and the residue map is an isometry.
- `Curve.canonical_adjunction` (relation): ω\_C ≅ Δ^*O(−Δ) is an isometry.
- `Curve.admissiblePairing` (compatibility): The pairing (D, E)\_a from g\_Δ is Zhang's admissible pairing.
- `Curve.canonical_descent` (functoriality): Compatible with finite extensions; Galois invariant.
- `Curve.canonicalMetricPair_unique` (extensionality): Any symmetric integrable diagonal metric and dualizing metric satisfying the curvature, zero-mean and residue-isometry conditions agree with the canonical pair; no scalar ambiguity remains.

**Unit tests.**

- `Curve.canonical_goodReduction` (compatibility): With good reduction, the pair is the model pair from the smooth model (AH.7/local-normalizations).
- `Curve.canonical_rescale` (characterisation): Replacing \|·\| by \|·\|^a replaces the metrics by their a-th powers.
- `Curve.canonical_genus2_degree` (computation): For g = 2, c₁(ω) = 2μ\_a has total mass 2.
- `Curve.canonical_model_nonexample` (non-example): On the genus-two, three-unit-edge banana reduction of AH.7/curve-admissible-metrics, the model metric of ω has atomic curvature δ\_v₁ + δ\_v₂ and fails (b), whose right side is (2/3)Σ\_e δ\_e. Bad reduction alone is insufficient for this test: for two elliptic components meeting in one node the model curvature already equals 2μ\_a.

**Checks.**

- Genus normalization: for g = 1, (b) says c₁(ω) = 0 and does not determine the measure; use a positive-degree bundle (Yuan p. 113 note).

**Uses.** Yuan Theorem 2.3, p. 28: the canonical admissible bundles of a curve family restrict fibrewise to this pair; Yuan §3.3.1, p. 48: the local φ-invariant is the integral of g\_{Δ,a} against c₁(O(Δ)\_a)².

*Needs:* §7.2 (`AH.7/curve-admissible-metrics`); §7.3 (`AH.7/admissible-measure`); §0.4 (`AH.0/projective-deligne-pairing`); `JacobianChallengePartII:JC3/jacobian-poincare`; `JacobianChallengePartII:JC3/poincare-curve-square`.

*Sources:* Yuan, Theorem A.1, pp. 104–105; proofs pp. 106–114; §A.4, p. 110: States and proves existence and uniqueness of the canonical pair of admissible metrics with the curvature, normalization and residue properties, the comparison with Zhang's admissible pairing, and Galois descent; items PAPER-YUAN-26/196–199, 210, 217–219.

### 7.5 Explicit graph formulas for the canonical metrics

`AH.7/graph-formulas` · theorem

Let K be complete discretely valued with e\_K = \|ϖ\|⁻¹, C/K of genus g > 1 with a K-point and split semistable reduction, Γ the dual graph of the minimal regular model with unit edge lengths, i : Γ → C^an and r : C^an → Γ the skeleton inclusion and retraction, K\_C the canonical divisor of Γ, μ the admissible graph measure and g\_μ its normalized Green function (GZ.2, TB.6). (1) ‖·‖\_a(x) = ‖·‖\_model(x)·e\_K^{g\_μ(r(x), r(x))} on ω\_C, where ‖·‖\_model comes from the relative dualizing sheaf of the minimal regular model. (2) For distinct geometric points x, y defined over K′/K, g\_{Δ,a}(x, y) = (i(x, y) + g\_μ(r(x), r(y)))·log e\_K, where i(x, y) is the intersection of the two sections on the minimal regular model over O\_{K′} measured as length and divided by the ramification index e(K′/K) — equivalently, measured with residue degrees and divided by [K′ : K], which is how Yuan p. 116 prints the normalization. Plain length divided by [K′ : K] is wrong when K′/K has residue degree > 1 (the extraction note on PAPER-YUAN-26/225).

**Hypotheses.**

- Split semistable reduction with a K-point; unit edge lengths for the minimal regular model.

**Proof route.**

- Compare curvatures: c₁(O\_C(f)) = −i\_*(Δf) for model potentials (Yuan Proposition A.4, TropicalAndBerkovichArithmetic TB.6 model–metric Laplacian), so the corrected metrics have curvature deg·μ\_a; check (c)–(d) of AH.7/canonical-metric-pair.
- For (2), the finite-extension normalization uses the ramification index (source issue PAPER-YUAN-26/E3 and the extraction note on item 225).

**Checks.**

- Good reduction: Γ is one vertex of genus g, g\_μ = 0, and the formulas reduce to the model metrics.

*Needs:* §7.4 (`AH.7/canonical-metric-pair`); `TropicalAndBerkovichArithmetic:TB.2/retraction-to-the-skeleton`; `TropicalAndBerkovichArithmetic:TB.6/model-metric-laplacian`; `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`.

*Sources:* Yuan, §A.5, p. 116; Proposition A.4, p. 117: Gives the explicit correction of the model metric of ω by the graph Green function and the formula for the diagonal Green function; identifies the curvature of model potentials with the graph Laplacian; items PAPER-YUAN-26/224–225.

### 7.6 Rescaling, good reduction and trivially valued fields

`AH.7/local-normalizations` · theorem

Let C/K be smooth projective geometrically integral of genus g > 1. (1) Replacing \|·\| by \|·\|^a (a > 0) replaces the canonical admissible metrics by their a-th powers and Green functions by a times their values. (2) If C extends to a smooth projective model over O\_K, the canonical admissible metrics on ω\_C and O(Δ) are the model metrics of ω\_model and O(Δ\_model) on the smooth model and its square. (3) If K is trivially valued, the canonical admissible metrics are the canonical (trivial-model) metrics of AH.2/trivially-valued-canonical-metric. (4) At real places, the canonical metrics are those of GrossZagierAndArithmeticHeights GZ.2 descended through complex conjugation.

**Hypotheses.**

- g > 1 (see AH.7/canonical-metric-pair).

**Proof route.**

- (1) Conditions (a)–(d) are homogeneous under \|·\| ↦ \|·\|^a.
- (2) Model metrics on a smooth model have curvature the Dirac mass at the Gauss point, satisfy (c)–(d) by adjunction on the smooth model, and uniqueness applies.
- (3) The trivial model is smooth; apply (2) with O\_K = K.

**Checks.**

- Good reduction everywhere outside finitely many places is what makes the global bundles of AH.7/global-admissible-bundles adelic.

*Needs:* §7.4 (`AH.7/canonical-metric-pair`); §2.7 (`AH.2/trivially-valued-canonical-metric`); `GrossZagierAndArithmeticHeights:GZ.2/real-admissible-descent`.

*Sources:* Yuan, §A.5, p. 117; §A.6, pp. 118–119: States rescaling, the good-reduction comparison, the trivially valued case and real places; items PAPER-YUAN-26/226, 232, 233.

### 7.7 The admissible bundles ω_{C/K,a} and O(Δ)_a over a global field

`AH.7/global-admissible-bundles` · construction · planet: Admissible canonical bundle

Let K be a number field or a one-variable function field over k and C/K smooth projective geometrically integral of genus g > 1. Assembling the canonical admissible metrics at all places (AH.7/canonical-metric-pair, GZ.2 at archimedean places) gives adelic line bundles ω\_{C/K,a} ∈ P̂ic(C/k) and O(Δ)\_a ∈ P̂ic(C²/k), because outside finitely many places they are model metrics of a smooth model (AH.7/local-normalizations(2)). Their self-intersections are Zhang's ω\_a² and the admissible pairing; the normalized self-intersection is [ω²\_{C/K,a}] = ω\_a²/[K : ℚ] (number field) or ω\_a² with residue degrees over k (function field).

**Hypotheses.**

- g > 1; K a global field.

**Construction.**

- Adelic: model metrics of a smooth model over an open U ⊂ Spec O\_K (or of the regular projective curve) plus finitely many local corrections give a boundary-Cauchy system (AH.1/essentially-quasi-projective).

**API.**

- `Curve.omegaAdmissible` (constructor): ω\_{C/K,a} ∈ P̂ic(C/k).
- `Curve.diagonalAdmissible` (constructor): O(Δ)\_a ∈ P̂ic(C²/k).
- `Curve.omegaAdmissible_baseChange` (functoriality): The bundles commute with finite base extension. The normalized self-intersection [ω²] is invariant over number fields; with geometric residue degrees over a fixed k it scales by [K′ : K].
- `Curve.omegaAdmissible_sq` (data): [ω²\_{C/K,a}] with the stated normalization.
- `Curve.admissibleBundle_local` (extensionality): The underlying bundle and its prescribed metric at every place determine its adelic isometry class, by injectivity of adelic analytification; at a place of good reduction recover the model metric.

**Unit tests.**

- `Curve.omegaAdmissible_goodReduction_ff` (compatibility): Over a function field with everywhere good reduction, ω\_{C/K,a} is the model ω and [ω²] = ω²\_{model}.
- `Curve.omegaAdmissible_extension` (characterisation): For number fields, [ω²\_{C\_{K′}/K′,a}] = [ω²\_{C/K,a}]. Over one-variable function fields with fixed k, ω²\_{C\_{K′}/K′,a} = [K′ : K]·ω²\_{C/K,a}.
- `Curve.omegaAdmissible_degree` (degenerate): The underlying bundle has degree 2g − 2.
- `Curve.omegaAdmissible_not_arakelov_model` (non-example): At bad places ω\_a² differs from the Arakelov self-intersection of the minimal regular model by the ε-invariant (AH.13/zhang-correction).

**Checks.**

- For a curve with everywhere good reduction over a function field, ω\_{C/K,a} is the model bundle ω of the smooth model.

**Uses.** Yuan Theorem 1.4, p. 14: [ω²\_{C/K,a}] compared with max{h\_Fal, 1}; Zhang 2010 Theorem 1.3.1: the Gross–Schoen height in terms of ω\_a².

*Needs:* §7.4 (`AH.7/canonical-metric-pair`); §7.6 (`AH.7/local-normalizations`); `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric`; `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`; §1.6 (`AH.1/essentially-quasi-projective`).

*Sources:* Yuan, §A.6, p. 119; §1.3, p. 11: Assembles the local canonical metrics into the adelic bundles ω\_{C/K,a} and O(Δ)\_a; item PAPER-YUAN-26/234.

**Refinements left for the lemma-level pass.**

- The genus-one normalization of the canonical curve-pair is excluded (source issues PAPER-YUAN-26/E8, E28); these canonical targets assume g > 1.

## Layer AH.8: Admissible adelic bundles on curve families

For a smooth projective family π : X → S of geometrically connected curves of genus g > 1 over a flat quasi-projective normal integral k-scheme: admissible adelic extensions on X, X ×\_S X and abelian schemes over S, their existence and uniqueness modulo base metrics, the canonical admissible bundles ω\_{X/S,a} and O(Δ)\_a (Theorem 2.3), the canonical twice-theta bundle Θ̄ of the relative Jacobian, section divisors and evaluation, and the relative arithmetic Hodge index identity.

Targets: §8.1 Admissible adelic extensions over a curve family; §8.2 Existence and uniqueness of admissible extensions; §8.3 The canonical admissible bundles ω_{X/S,a} and O(Δ)_a; §8.4 The canonical twice-theta bundle and Poincaré bundle over the relative Jacobian; §8.5 Admissible section divisors and evaluation; §8.6 The vertical adelic Picard group; §8.7 Vertical orthogonality and the relative arithmetic Hodge index identity.

Planets: Admissible adelic extension, Canonical admissible bundles of a curve family, Canonical adelic twice-theta bundle, Relative arithmetic Hodge index.

### 8.1 Admissible adelic extensions over a curve family

`AH.8/admissible-extension` · definition · planet: Admissible adelic extension

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth projective with geometrically connected fibres of genus g > 1, and W one of X, X ×\_S X, or an abelian scheme over S. An integrable adelic extension L̄ ∈ P̂ic(W/k)\_int of a line bundle L on W is admissible if for every v ∈ S^an its metric on W\_{H\_v} is admissible in the sense of AH.7 (AH.7/curve-admissible-metrics on curves and their squares, AH.7/abelian-admissible-metrics on abelian varieties; archimedean: GZ.2).

**Hypotheses.**

- S normal; π smooth projective of genus g > 1 (Yuan states Definition 2.5 through Theorem 2.9 for g > 0; this roadmap restricts to g > 1 because the normalization of Theorem 2.3 is proved only for g > 1, PAPER-YUAN-26/E8).

**Construction.**

- Fibrewise condition through restriction of adelic line bundles to the fibres over points v of S^an (AH.2/analytification-injective).

**API.**

- `AdelicLineBundle.IsAdmissible` (data): Fibrewise admissible at every v ∈ S^an.
- `AdelicLineBundle.IsAdmissible.tensor` (simp): Closed under tensor products and inverses.
- `AdelicLineBundle.IsAdmissible.pullbackBase` (functoriality): π\_W^*N̄ is admissible for N̄ ∈ P̂ic(S/k)\_int.
- `AdelicLineBundle.IsAdmissible.baseChange` (functoriality): Preserved by base change S′ → S.

**Unit tests.**

- `AdelicLineBundle.IsAdmissible.pullback_base_test` (characterisation): π^*N̄ is admissible for every integrable N̄ on S.
- `AdelicLineBundle.IsAdmissible.point_base` (degenerate): For S = Spec K (K a global field), admissible = fibrewise admissible at the places of K.
- `AdelicLineBundle.IsAdmissible.model_nonexample` (non-example): For a family whose stable compactification has a totally degenerate genus-two fibre with three-unit-edge banana graph, the model ω extension is not admissible at the corresponding valuation: its atomic curvature differs from 2μ\_a, which has an edge density.

**Checks.**

- Pullbacks from S, tensor products and inverses of admissible extensions are admissible.

**Uses.** Yuan Proposition 2.6, p. 31: existence and uniqueness modulo base; Yuan Theorem 2.9, p. 35: theta pullback formulas for admissible ᾱ.

*Needs:* §7.2 (`AH.7/curve-admissible-metrics`); §7.1 (`AH.7/abelian-admissible-metrics`); §1.3 (`AH.1/adelic-line-bundles`); §2.3 (`AH.2/analytification-injective`); `GrossZagierAndArithmeticHeights:GZ.2/archimedean-admissible-metric`.

*Sources:* Yuan, Definition 2.5, p. 30: Defines admissible integrable adelic extensions on X, X ×\_S X or an abelian scheme over S by fibrewise admissibility at every v ∈ S^an; item PAPER-YUAN-26/41.

### 8.2 Existence and uniqueness of admissible extensions

`AH.8/admissible-existence-uniqueness` · theorem

In the setting of AH.8/admissible-extension, every line bundle L on W has an admissible integrable adelic extension, and two admissible extensions of the same L differ by π\_W^*N̄ for a unique N̄ ∈ ker(P̂ic(S/k)\_int → Pic(S)). The admissible extensions of L form a torsor under this kernel.

**Hypotheses.**

- As in AH.8/admissible-extension.

**Proof route.**

- Abelian scheme: decompose L into even and odd parts up to torsion and take invariant extensions (AH.5/invariant-extension, q = 4 or 2).
- Curves: choose α of positive relative degree d with Abel map i\_α : X → J; the pullback Pic⁰(J) → Pic⁰(X) and Pic⁰⁰(J ×\_S J) → Pic⁰⁰(X ×\_S X) have torsion cokernel (JacobianChallengePartII JC4), so a power of L is i\_α^* of an admissible bundle on J plus a bundle algebraically equivalent to a multiple of θ, and its pullback is admissible.
- Uniqueness: the ratio of two admissible extensions is fibrewise constant, so it descends to S by AH.3/pullback-injective-descent(2), and the descended bundle has trivial underlying line bundle after the identification.

**Checks.**

- For W = X and L = π^*M the admissible extensions are π^*M̄ for integrable extensions M̄ of M.

*Needs:* §8.1 (`AH.8/admissible-extension`); §5.2 (`AH.5/invariant-extension`); §3.4 (`AH.3/pullback-injective-descent`); `JacobianChallengePartII:JC4/actual-pullback-torsion-cokernel`; `JacobianChallengePartII:JC4/bizero-pullback-torsion-cokernel`; `JacobianChallengePartII:JC2/degree-abel-map`; `JacobianChallengePartII:JC1/relative-jacobian`.

*Sources:* Yuan, Proposition 2.6 and proof, pp. 31–32: Proves existence of admissible extensions on X, X ×\_S X and abelian schemes, and uniqueness modulo pullbacks of base bundles with trivial underlying bundle; items PAPER-YUAN-26/42–43 (with the corrected map (i\_α, i\_α)^* of source issue E11).

### 8.3 The canonical admissible bundles ω_{X/S,a} and O(Δ)_a

`AH.8/canonical-admissible-bundles` · construction · planet: Canonical admissible bundles of a curve family

Let k be ℤ or a field, S flat quasi-projective normal integral over k and π : X → S smooth projective with geometrically connected fibres of genus g > 1. (a) ω\_{X/S} has a unique isomorphism class of adelic extension w = ω̄\_{X/S,a} whose metric on every X\_{H\_v}, v ∈ S^an, is the canonical admissible metric of AH.7/canonical-metric-pair. (b) O(Δ) on X ×\_S X has a unique isomorphism class of integrable adelic extension D = Ō(Δ)\_a inducing the canonical admissible metric on every (X²\_{H\_v})^an. Writing ⟨A, B⟩ = π\_*⟨A, B⟩: (1) the canonical isomorphism ω\_{X/S} → Δ^*O(−Δ) is an isometry w → Δ^*(−D); (2) the canonical identification p₁\_*⟨O(Δ), p₂^*ω⟩ → ω is an isometry p₁\_*⟨D, p₂^*w⟩ → w. For a point s of S whose residue field is a global field, w\|\_{X\_s} and D\|\_{X²\_s} are Zhang's ω\_{X\_s,a} and O(Δ\_s)\_a.

**Hypotheses.**

- g > 1 (Yuan states g > 0; the genus-one normalization is unproved, source issue PAPER-YUAN-26/E8).

**Construction.**

- Take admissible extensions (AH.8/admissible-existence-uniqueness); the defects in (1) and (2) are fibrewise constants, hence by AH.3/pullback-injective-descent are pullbacks β̄₁, β̄₂ of base bundles with trivial underlying bundle; twist ω′\_a and O(Δ)′\_a to cancel them (Yuan §2.2.3, with the corrected display of source issue E12).
- Uniqueness from the torsor structure: the conditions (1)–(2) pin the base twist.

**API.**

- `CurveFamily.omegaA` (constructor): w = ω̄\_{X/S,a}.
- `CurveFamily.diagA` (constructor): D = Ō(Δ)\_a on X ×\_S X.
- `CurveFamily.adjunction_isometry` (relation): w ≅ Δ^*(−D).
- `CurveFamily.pairing_isometry` (relation): p₁\_*⟨D, p₂^*w⟩ ≅ w.
- `CurveFamily.omegaA_baseChange` (functoriality): Compatible with base change S′ → S of normal integral schemes.
- `CurveFamily.omegaA_fibre` (compatibility): Restricts to ω\_{X\_s,a} at points with global residue field.
- `CurveFamily.canonicalAdelic_unique` (extensionality): Two extensions with the prescribed normalized metrics at every analytic fibre are isometrically isomorphic; the canonical pair is preserved by normal integral base change.

**Unit tests.**

- `CurveFamily.omegaA_point` (compatibility): Over S = Spec K, w = ω\_{C/K,a}.
- `CurveFamily.omegaA_degree` (degenerate): The underlying bundle has relative degree 2g − 2.
- `CurveFamily.diagA_symmetric` (characterisation): The transposition of X ×\_S X fixes D.
- `CurveFamily.omegaA_not_model` (non-example): If X → S has a stable compactification with singular fibres, w is not the model bundle ω\_{X̄/S̄}: they differ by the ε divisor (AH.10/epsilon-divisor).

**Checks.**

- For S = Spec K a global field, w = ω\_{C/K,a} and D = O(Δ)\_a of AH.7/global-admissible-bundles.

**Uses.** Yuan Theorem 1.3, p. 11: the main bigness theorem concerns ω\_{X/S,a}; Yuan §3.3.2, p. 49: the φ divisor uses (π,π)\_*⟨D, D, D⟩.

*Needs:* §8.2 (`AH.8/admissible-existence-uniqueness`); §7.4 (`AH.7/canonical-metric-pair`); §7.7 (`AH.7/global-admissible-bundles`); §3.2 (`AH.3/deligne-pairing`); §3.4 (`AH.3/pullback-injective-descent`).

*Sources:* Yuan, Theorem 2.3, p. 28; §2.2.3, pp. 32–33: Constructs the canonical admissible adelic line bundles ω\_{X/S,a} and O(Δ)\_a with the adjunction and pairing isometries and proves uniqueness; items PAPER-YUAN-26/35–38.

### 8.4 The canonical twice-theta bundle and Poincaré bundle over the relative Jacobian

`AH.8/canonical-theta-bundle` · construction · planet: Canonical adelic twice-theta bundle

With π : X → S as in AH.8/canonical-admissible-bundles, let J = Pic⁰\_{X/S} (JacobianChallengePartII JC1) and Θ = Δ\_J^*(P^∨) the canonical symmetric rigidified twice-theta bundle (JC3/twice-theta). Θ̄ ∈ P̂ic(J/k) is its invariant extension with [2]^*Θ̄ = 4Θ̄ (AH.5/invariant-extension); it is nef and admissible. If x : S → X is a section, Q = (id\_J, i\_x)^*P on J ×\_S X has a canonical integrable adelic extension Q̄ with [2]\_X^*Q̄ = 2Q̄ ([2] acting on the J factor), whose fibre at β ∈ J is the admissible extension of the degree-zero class β on X.

**Hypotheses.**

- g > 1; for Q̄ a section x of X → S.

**Construction.**

- Θ is symmetric and relatively ample with e^*Θ ≅ O\_S (JC3), so Yuan–Zhang Theorem 6.1.1 applies with q = 4.
- Q is odd in the J variable, so the invariant extension with q = 2 exists (Yuan–Zhang Theorem 6.1.2 and §6.5.2).

**API.**

- `RelJacobian.thetaBar` (constructor): Θ̄ with [2]^*Θ̄ = 4Θ̄.
- `RelJacobian.thetaBar_nef` (other): Θ̄ is nef.
- `RelJacobian.thetaBar_symm` (simp): [−1]^*Θ̄ = Θ̄ and e^*Θ̄ = 0 in P̂ic(S/k).
- `RelJacobian.thetaBar_mul` (simp): [n]^*Θ̄ = n²Θ̄.
- `RelJacobian.poincareBar` (constructor): Q̄ on J ×\_S X with [2]^*Q̄ = 2Q̄.
- `RelJacobian.thetaBar_height` (compatibility): h\_Θ̄ = 2ĥ, ĥ the Néron–Tate height of the symmetric theta class (half of ĥ\_Θ).
- `RelJacobian.thetaBar_unique` (extensionality): The invariant extension of the rigidified Θ is unique; pullback along any normal integral base change agrees with the extension of the pulled-back rigidified bundle.

**Unit tests.**

- `RelJacobian.thetaBar_zero_section` (computation): e^*Θ̄ is the trivial adelic bundle on S.
- `RelJacobian.thetaBar_n` (characterisation): [3]^*Θ̄ = 9Θ̄.
- `RelJacobian.thetaBar_point` (degenerate): Over S = Spec K, h\_Θ̄ on J(K̄) is the Néron–Tate height for Θ (= 2θ up to algebraic equivalence).
- `RelJacobian.thetaBar_model_nonexample` (non-example): Over S = Spec ℚ, start with Θ̄ and tensor by the constant metric bundle O(c), c ≠ 0. Then [2]^*(Θ̄+O(c)) = 4Θ̄+O(c), whereas 4(Θ̄+O(c)) = 4Θ̄+O(4c); the twisted extension is not invariant. Good-reduction model extensions can be invariant.

**Checks.**

- On each geometric fibre Θ is algebraically equivalent to twice a theta divisor, so Θ̄ restricted to J\_s computes twice the Néron–Tate height for θ.

**Uses.** Yuan Theorems 2.8–2.10, pp. 34–37: all theta identities are statements about pullbacks of Θ̄; Yuan §4.4.1, p. 78: h\_Θ̄ = 2ĥ on fibres.

*Needs:* §5.2 (`AH.5/invariant-extension`); `JacobianChallengePartII:JC3/twice-theta`; `JacobianChallengePartII:JC3/twice-theta-symmetric`; `JacobianChallengePartII:JC3/twice-theta-relatively-ample`; `JacobianChallengePartII:JC3/jacobian-poincare`; `JacobianChallengePartII:JC1/relative-jacobian`.

*Sources:* Yuan, §2.3, p. 33; Theorem 2.10(3) proof, pp. 38–39: Uses the dynamically invariant nef extension Θ̄ of the canonical twice-theta bundle and the invariant extension Q̄ of the pointed Poincaré bundle; items PAPER-YUAN-26/47, 66.; Yuan–Zhang, Theorems 6.1.1 and 6.1.3, pp. 180–184; §§6.5.2–6.5.4, pp. 203–207: Provides the invariant extensions, the Poincaré bundle over the relative Jacobian and the nef symmetric Θ̄ with [2]^*Θ̄ = 4Θ̄.

### 8.5 Admissible section divisors and evaluation

`AH.8/section-evaluation` · theorem

With π : X → S as above and a section x : S → X, put O(x)\_a = (x, id\_X)^*D, an admissible adelic extension of O(x(S)). For every admissible adelic line bundle L̄ on X: (1) the evaluation isomorphism π\_*⟨O(x), L⟩ → x^*L is an isometry π\_*⟨O(x)\_a, L̄⟩ ≅ x^*L̄; (2) there is a canonical isometry π\_*⟨O(x)\_a, O(x)\_a⟩ ≅ −π\_*⟨O(x)\_a, w⟩ = −x^*w.

**Hypotheses.**

- A section x; L̄ admissible.

**Proof route.**

- (1) The algebraic evaluation isomorphism exists. At v ∈ S^an its log norm is the integral of log ‖1‖\_{O(x)\_a} against c₁(L̄\_v) (Yuan Proposition 2.7, pp. 33–34). Admissibility gives c₁(L̄\_v) = deg(L\_v)μ\_a and the canonical Green normalization makes this integral zero. Full faithfulness then gives the isometry; pulling back only the ω pairing does not prove this for arbitrary L̄.
- (2) Apply (1) to L̄ = O(x)\_a: π\_*⟨O(x)\_a, O(x)\_a⟩ ≅ x^*(x, id)^*D = x^*Δ^*D, and Δ^*D ≅ −w by the adjunction isometry (1) of AH.8/canonical-admissible-bundles; while π\_*⟨O(x)\_a, w⟩ ≅ x^*w by (1).

**Checks.**

- For S = Spec K and x ∈ C(K): ⟨x, x⟩\_a = −⟨x, ω⟩\_a, Zhang's admissible adjunction formula.

*Needs:* §8.3 (`AH.8/canonical-admissible-bundles`); §3.3 (`AH.3/projection-formulas`).

*Sources:* Yuan, §2.3, p. 33; Proposition 2.7, pp. 33–34: Defines O(x)\_a and proves the evaluation isometry and the self-intersection identity; items PAPER-YUAN-26/46, 48, 49.

### 8.6 The vertical adelic Picard group

`AH.8/vertical-picard` · definition

For π : X → S as above, P̂ic(X/k)\_vert = ker(P̂ic(X/k)\_int → Pic(X)): integrable adelic line bundles with trivial underlying algebraic bundle (equivalently O(E) for adelic divisors E with zero underlying divisor). This is not the group of divisors supported in singular fibres of a compactification.

**Hypotheses.**

- π as in AH.8.

**Construction.**

- Definition; it is a group since P̂ic\_int is.

**API.**

- `verticalPicard` (constructor): ker(P̂ic(X/k)\_int → Pic(X)).
- `verticalPicard_pullback` (functoriality): Contains π^* of the base kernel.
- `verticalPicard_ofDivisor` (equivalence): Equals {O(E) : E adelic with underlying divisor 0}.
- `verticalPicard.mem_iff` (characterisation): An integrable class belongs precisely when its underlying class in Pic(X) is zero; the kernel is closed under tensor, dual and pullback. A choice of algebraic trivialization identifies it with O(E) for E of underlying divisor zero, modulo principal trivializations.

**Unit tests.**

- `verticalPicard_constant` (computation): O(c) pulled back from Spec ℤ lies in P̂ic(X/ℤ)\_vert.
- `verticalPicard_zero` (degenerate): The trivial bundle is vertical.
- `verticalPicard_nonexample` (non-example): O(x)\_a for a section x is not vertical: its underlying bundle O(x(S)) is nontrivial.

**Checks.**

- π^*(ker(P̂ic(S/k)\_int → Pic(S))) ⊂ P̂ic(X/k)\_vert.

**Uses.** Yuan Theorem 2.8, p. 34: orthogonality of admissible degree-zero bundles.

*Needs:* §1.5 (`AH.1/positivity-notions`).

*Sources:* Yuan, Theorem 2.8(1), p. 34: Defines the vertical part as the kernel to Pic(X); item PAPER-YUAN-26/50.; Yuan–Zhang, Theorem 6.5.1, p. 203: Defines P̂ic(X/k)\_{vert,ℚ} as the kernel of P̂ic(X/k)\_{int,ℚ} → Pic(X)\_ℚ in the statement of the arithmetic Hodge index theorem for curves.

### 8.7 Vertical orthogonality and the relative arithmetic Hodge index identity

`AH.8/relative-hodge-index` · theorem · planet: Relative arithmetic Hodge index

Let M be a line bundle on X of relative degree zero with an admissible extension M̄, and ι : S → J the section of the relative Jacobian it defines. (1) π\_*⟨M̄, V⟩ = 0 in P̂ic(S/k) for every V ∈ P̂ic(X/k)\_vert. (2) π\_*⟨M̄, M̄⟩ = −ι^*Θ̄ in P̂ic(S/k)\_ℚ.

**Hypotheses.**

- M of relative degree zero with admissible M̄.

**Proof route.**

- (1) The Yuan–Zhang arithmetic Hodge index theorem for curves over finitely generated fields gives a unique-up-to-base extension M̄₀ orthogonal to all vertical bundles; fibrewise it is the admissible (flat) metric, so M̄₀ = M̄ up to base twist, which does not affect orthogonality to vertical bundles of fibre degree 0 (Yuan–Zhang Theorem 6.5.1, 6.5.4).
- (2) On the universal Jacobian, the self-pairing of the normalized Poincaré bundle is the negative canonical twice-theta bundle (Yuan–Zhang Corollary 6.5.5, p. 207). Pull this identity back by ι and use the compatibility of Deligne pairings with base change. A possible base twist of M̄ does not change its self-pairing because its relative degree is zero. No multiplication-by-two map on S is assumed.

**Checks.**

- For S = Spec K: ⟨M̄, M̄⟩\_a = −2ĥ\_θ(M) (Faltings–Hriljac form of the Hodge index theorem, GZ.2).

*Needs:* §8.6 (`AH.8/vertical-picard`); §8.4 (`AH.8/canonical-theta-bundle`); §8.2 (`AH.8/admissible-existence-uniqueness`); `GrossZagierAndArithmeticHeights:GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`.

*Sources:* Yuan, Theorem 2.8, p. 34: Proves vertical orthogonality of admissible extensions of relative degree-zero bundles and π\_*⟨M̄, M̄⟩ = −ι^*Θ̄; items PAPER-YUAN-26/51–52.; Yuan–Zhang, Theorem 6.5.1, p. 203; Theorem 6.5.4 and Corollary 6.5.5, p. 207: Proves the arithmetic Hodge index theorem for curves over finitely generated fields and the Néron–Tate height as a Deligne pairing.

**Refinements left for the lemma-level pass.**

- Lemma-level descent argument of Proposition 2.6 through the Brauer obstruction (JacobianChallengePartII JC4 supplies the torsion-cokernel statements).

## Layer AH.9: Theta identities and nefness of the admissible canonical bundle

The pullback formulas of Θ̄ along the Abel map i\_α, the canonical map i\_ω, the difference map j and the universal shift τ, with their Deligne self-pairings, and the resulting expression of ω\_{X/S,a} as a positive combination of nef bundles: ω\_{X/S,a} and ⟨ω\_a, ω\_a⟩ are nef.

Targets: §9.1 Admissible theta pullback formulas; §9.2 Theta identities for the canonical, difference and universal shift maps; §9.3 Nefness of ω_{X/S,a} and of ⟨ω_a, ω_a⟩.

Planets: Admissible theta pullback formulas, Theta identities for the canonical map, Nefness of the admissible canonical bundle.

### 9.1 Admissible theta pullback formulas

`AH.9/theta-pullback-formulas` · theorem · planet: Admissible theta pullback formulas

Let π : X → S be as in AH.8, α a line bundle on X of relative degree d with an admissible extension ᾱ, i\_α : X → J the Abel map x ↦ dx − α (JacobianChallengePartII JC2), w = ω̄\_{X/S,a} and ⟨A, B⟩ = π\_*⟨A, B⟩. In P̂ic(·/k)\_ℚ: (1) i\_α^*Θ̄ = d²w + 2dᾱ − π^*⟨ᾱ, ᾱ⟩. (2) ⟨i\_α^*Θ̄, i\_α^*Θ̄⟩ = d⁴⟨w, w⟩ + 4d³⟨w, ᾱ⟩ − (4g − 4)d²⟨ᾱ, ᾱ⟩, and (g − 1)⟨i\_α^*Θ̄, i\_α^*Θ̄⟩ = g d⁴⟨w, w⟩ + d²ι\_α^*Θ̄, where ι\_α : S → J corresponds to (2g − 2)α − dω\_{X/S}. (3) For a section x and α = O(x) (d = 1, ᾱ = O(x)\_a): i\_α^*Θ̄ = w + 2O(x)\_a + π^*x^*w and ⟨i\_α^*Θ̄, i\_α^*Θ̄⟩ = ⟨w, w⟩ + 4g·x^*w.

**Hypotheses.**

- g > 1 (the paper states g > 0); d any integer for (1)–(2).

**Proof route.**

- (1) Put N̄ = i\_α^*Θ̄ − d²w − 2dᾱ + π^*⟨ᾱ,ᾱ⟩. For any section x, AH.8/relative-hodge-index gives x^*i\_α^*Θ̄ = −⟨dO(x)\_a − ᾱ,dO(x)\_a − ᾱ⟩. AH.8/section-evaluation and bilinearity give x^*N̄ = 0. This argument is compatible with every normal flat base change. Apply it to S′ = X, where the base-changed family has the diagonal section: its evaluation is N̄ itself, so N̄ = 0. This proves the relative arbitrary-degree formula here, rather than assuming the narrower degree-one, field-valued JC3 theta identity supplies it.
- (2) Expand with ⟨A, π^*N⟩ = deg(A)N and ⟨π^*N, π^*N⟩ = 0 (AH.3/projection-formulas); the fibre degree of d²w + 2dᾱ is 2gd². For the second identity insert ⟨M̄, M̄⟩ = −ι\_α^*Θ̄ for M̄ = (2g−2)ᾱ − dw (AH.8/relative-hodge-index).
- (3) Specialize (1)–(2) with AH.8/section-evaluation: ⟨O(x)\_a, O(x)\_a⟩ = −x^*w and ⟨w, O(x)\_a⟩ = x^*w.

**Checks.**

- Consistency check (verified): substituting ι\_α^*Θ̄ = −⟨M̄, M̄⟩ into g d⁴⟨w, w⟩ + d²ι\_α^*Θ̄ gives (g − 1) times the first expansion in (2).
- Consistency check (verified): (3) is (1)–(2) at d = 1 with ⟨ᾱ, ᾱ⟩ = −x^*w and ⟨w, ᾱ⟩ = x^*w.

*Needs:* §8.4 (`AH.8/canonical-theta-bundle`); §8.5 (`AH.8/section-evaluation`); §8.7 (`AH.8/relative-hodge-index`); §3.3 (`AH.3/projection-formulas`); `JacobianChallengePartII:JC3/theta-pullback`; `JacobianChallengePartII:JC3/poincare-curve-square`; `JacobianChallengePartII:JC2/degree-abel-map`.

*Sources:* Yuan, Theorem 2.9 and proof, pp. 35–36: States the three families of identities for the pullback of Θ̄ along the Abel map and its Deligne self-pairing; items PAPER-YUAN-26/53–57.

### 9.2 Theta identities for the canonical, difference and universal shift maps

`AH.9/canonical-theta-identities` · theorem · planet: Theta identities for the canonical map

With π : X → S of genus g > 1, w, D and ⟨·,·⟩ as above, in P̂ic(·/k)\_ℚ: (1) for i\_ω(x) = (2g − 2)x − ω\_{X/S}, i\_ω^*Θ̄ = 4g(g − 1)w − π^*⟨w, w⟩ and ⟨i\_ω^*Θ̄, i\_ω^*Θ̄⟩ = 16g(g − 1)³⟨w, w⟩; (2) for j : X ×\_S X → J, j(x, y) = y − x, j^*Θ̄ = 2D + p₁^*w + p₂^*w and p₁\_*⟨j^*Θ̄, j^*Θ̄⟩ = 4g·w + π^*⟨w, w⟩; (3) for the universal shift τ : J ×\_S X → J ×\_S J, τ(y, x) = (y, y + (2g − 2)x − ω), with Θ̄\_J = p₂^*Θ̄ and q₁ : J ×\_S X → J, π\_J : J → S: q₁\_*⟨τ^*Θ̄\_J, τ^*Θ̄\_J⟩ = 16(g − 1)³Θ̄ + 16g(g − 1)³π\_J^*⟨w, w⟩.

**Hypotheses.**

- g > 1.

**Proof route.**

- (1) AH.9/theta-pullback-formulas with α = ω, ᾱ = w, d = 2g − 2: d² + 2d = 4g(g − 1) and d²(d² + 4d − 4g + 4) = 16g(g − 1)³.
- (2) Over the base X (first projection) the curve X ×\_S X → X has the diagonal section and canonical bundle p₂^*w; apply (3) of AH.9/theta-pullback-formulas: x^*w becomes w and ⟨p₂^*w, p₂^*w⟩ = π^*⟨w, w⟩.
- (3) Over the base J the Abel map with α ↔ ω − y has d = 2g − 2 and (2g − 2)α − dω = −(2g − 2)y, so ι\_α^*Θ̄ = (2g − 2)²Θ̄; the second identity of AH.9/theta-pullback-formulas (2) gives the formula.

**Checks.**

- All three coefficient computations were checked symbolically in this plan (see the reader).

*Needs:* §9.1 (`AH.9/theta-pullback-formulas`); `JacobianChallengePartII:JC5/canonical-abel-map`; `JacobianChallengePartII:JC2/curve-difference`; `JacobianChallengePartII:JC5/universal-shift`.

*Sources:* Yuan, Theorem 2.10, p. 37; proof pp. 37–39: States and proves the theta pullback and self-pairing identities for i\_ω, the difference map and the universal shift; items PAPER-YUAN-26/58, 59, 62, 63, 65 (with the target group of E14).

### 9.3 Nefness of ω_{X/S,a} and of ⟨ω_a, ω_a⟩

`AH.9/nefness-omega-a` · theorem · planet: Nefness of the admissible canonical bundle

For π : X → S smooth projective of genus g > 1 over S flat quasi-projective normal integral over k: w = i\_ω^*Θ̄/(4g(g − 1)) + π^*⟨i\_ω^*Θ̄, i\_ω^*Θ̄⟩/(64g²(g − 1)⁴) in P̂ic(X/k)\_ℚ. Since Θ̄ is nef, so are i\_ω^*Θ̄ and its Deligne self-pairing; hence w is nef on X and ⟨w, w⟩ is nef on S.

**Hypotheses.**

- g > 1.

**Proof route.**

- Substitute AH.9/canonical-theta-identities (1): the right side equals w − π^*⟨w,w⟩/(4g(g − 1)) + 16g(g − 1)³π^*⟨w,w⟩/(64g²(g − 1)⁴) = w.
- Pullbacks of nef adelic bundles are nef; Deligne pairings of nef bundles are nef (AH.3/deligne-pairing); positive combinations of nef bundles are nef.
- ⟨w, w⟩ = ⟨i\_ω^*Θ̄, i\_ω^*Θ̄⟩/(16g(g − 1)³) is nef.

**Checks.**

- The coefficient of π^*⟨w, w⟩ on the right side is −1/(4g(g − 1)) + 16g(g − 1)³/(64g²(g − 1)⁴) = 0 (an example in the suggested Lean file).
- For S = Spec K this recovers Zhang's theorem that ω\_{C/K,a} is nef.

*Needs:* §9.2 (`AH.9/canonical-theta-identities`); §8.4 (`AH.8/canonical-theta-bundle`); §3.2 (`AH.3/deligne-pairing`); §1.5 (`AH.1/positivity-notions`).

*Sources:* Yuan, Theorem 2.10(1) and proof, pp. 37–38; §1.3, p. 11: Expresses w as a positive combination of nef bundles and concludes that w and ⟨w, w⟩ are nef; items PAPER-YUAN-26/60, 241.

## Layer AH.10: Graph invariants and the global ε, φ and Noether divisors

Zhang's invariants of polarized metrized graphs (ε, φ, τ, δ) and their inequalities (Cinkir, Baker–Rumely, de Jong), the local φ-invariant of a curve over a complete field, the global adelic divisors E\_S and Φ\_S that globalize ε and φ over a base, the triple-pairing identity for Φ\_S, the boundary bounds (2g − 2)Δ\_S ≥ E\_S and Φ\_S ≥ Δ\_S/39, the Hodge lower decomposition of ⟨ω\_a, ω\_a⟩, the Gross–Schoen height variation, Faltings' δ-invariant, the arithmetic Noether formula and the admissible Noether divisor Ξ\_S.

Targets: §10.1 Zhang's invariants of a polarized metrized graph; §10.2 Inequalities between graph invariants; §10.3 The local φ-invariant of a curve over a complete field; §10.4 The global ε divisor E_S; §10.5 The boundary bound for the ε divisor; §10.6 The global φ divisor Φ_S; §10.7 The triple self-pairing of the difference map; §10.8 The boundary bound for the φ divisor; §10.9 Hodge lower decomposition of ⟨ω_a, ω_a⟩; §10.10 The Gross–Schoen height and its adelic variation; §10.11 Faltings' δ-invariant; §10.12 The arithmetic Noether formula; §10.13 The admissible Noether divisor Ξ_S; §10.14 What can and cannot be globalized.

Planets: Zhang's graph invariants, Zhang's φ-invariant, Global φ divisor, Triple-pairing identity for Φ_S, Hodge lower bound for ⟨ω_a, ω_a⟩.

### 10.1 Zhang's invariants of a polarized metrized graph

`AH.10/polarized-graph-invariants` · definition · planet: Zhang's graph invariants

A polarized metrized graph (pm-graph) of genus g ≥ 1 is a compact connected metric graph Γ (TropicalAndBerkovichArithmetic TB.3) with a vertex genus function q ≥ 0 such that b₁(Γ) + Σ q(x) = g and whose canonical divisor K = Σ\_x (v(x) − 2 + 2q(x))x (v the valence) is effective (no genus-zero point of valence one); K has degree 2g − 2; μ = μ\_ad is Zhang's admissible measure, g\_μ its normalized Green function (GrossZagierAndArithmeticHeights GZ.2, TB.6) and r the effective resistance. Define: δ(Γ) = ℓ(Γ) the total length, δᵢ(Γ) the total length of edges of type i (type 0: non-separating; type i ≥ 1: separating into parts of genus i and g − i); ε(Γ) = ∫∫ r(x, y)δ\_K(x)μ(y); φ(Γ) = −ℓ(Γ)/4 + (1/4)∫ g\_μ(x, x)((10g + 2)μ − δ\_K); τ(Γ) the Baker–Rumely constant, g\_{μ\_can}(x, y) = −r(x, y)/2 + τ(Γ) for the canonical (possibly signed) measure μ\_can of total mass one.

**Hypotheses.**

- Γ compact connected metric graph with a genus function q ≥ 0 and effective canonical divisor; g ≥ 1 (g ≥ 2 for the curve applications).

**Construction.**

- μ\_ad, g\_μ and the Green-function identities are imported from GZ.2 and TB.6; the formulas for ε and φ are Zhang 2010 §4.1 and (4.1.4), τ is Baker–Rumely §14.

**API.**

- `PMGraph` (structure): A metric graph with vertex genus function; genus b₁ + Σq.
- `PMGraph.canonicalDivisor` (data): K = Σ(v(x) − 2 + 2q(x))x, degree 2g − 2.
- `PMGraph.resistance` (data): Effective resistance r(x, y).
- `PMGraph.epsilon` (constructor): ε(Γ) = ∫∫ r δ\_K μ.
- `PMGraph.phi` (constructor): φ(Γ) = −ℓ/4 + ¼∫ g\_μ(x, x)((10g + 2)μ − δ\_K).
- `PMGraph.tau` (constructor): τ(Γ) from μ\_can.
- `PMGraph.deltaType` (data): δᵢ(Γ), total length of edges of type i; ℓ = Σᵢ δᵢ.
- `PMGraph.scale` (simp): Scaling all lengths by t scales ℓ, δᵢ, ε, φ, τ by t.
- `PMGraph.invariants_iso_subdivision` (functoriality): Isometries preserving vertex genera and subdivision by valence-two weight-zero vertices preserve ε, φ, τ and δᵢ; edge-length scaling multiplies each invariant by the same positive factor.

**Unit tests.**

- `PMGraph.oneLoop_values` (computation): For the one-loop graph of genus g with loop length ℓ: ε = (g − 1)ℓ/(3g), φ = (g − 1)ℓ/(6g), τ = ℓ/12, δ₀ = ℓ.
- `PMGraph.point_values` (degenerate): For a single vertex of genus g (ℓ = 0), all invariants vanish.
- `PMGraph.scale_test` (characterisation): Doubling every edge length doubles ε, φ, τ and ℓ.
- `PMGraph.tau_not_mu_ad` (non-example): τ is defined with Baker–Rumely's μ\_can, not with μ\_ad; using μ\_ad in its defining identity gives a non-constant diagonal in general.

**Checks.**

- One-loop graph (one vertex of genus g − 1 with a loop of length ℓ): μ = ((g − 1)δ\_v + dx/ℓ)/g, K = (2g − 2)v, r(v, t) = t(ℓ − t)/ℓ, so ε = (2g − 2)·(1/g)·(ℓ/6) = (g − 1)ℓ/(3g); τ = ℓ/12; and by the de Jong identity φ = (g − 1)ℓ/(6g).
- A single vertex of genus g with no edges has ℓ = ε = φ = τ = 0.

**Uses.** Yuan Lemma 3.5, p. 47: ε(Γ) ≤ (2g − 2)ℓ(Γ); Yuan Theorem 3.7, p. 53: φ(Γ) ≥ ℓ(Γ)/39; Yuan Theorem 4.11 proof, p. 86: global sums Σ\_v φ\_v, ε\_v, δ\_v.

*Needs:* `TropicalAndBerkovichArithmetic:TB.3/metric-graphs`; `TropicalAndBerkovichArithmetic:TB.3/graph-laplacian`; `GrossZagierAndArithmeticHeights:GZ.2/graph-admissible-measure`; `TropicalAndBerkovichArithmetic:TB.6/graph-green-and-admissible-measure`.

*Sources:* Zhang, §4.1, (4.1.4), pp. 64–66; Lemma 3.5.4, p. 62: Defines the graph invariants ε and φ of a polarized metrized graph and expresses ε through the resistance function.; Baker–Rumely, Theorem 14.1, p. 36; Lemma 14.4, p. 37: Defines the canonical measure μ\_can and the constant τ(Γ) and proves τ = ¼∫(∂\_x r(x, y))²dx.; Yuan, §3.2, p. 47; §3.3.1, p. 49; §4.5.1, p. 86: Recalls ε(Γ), φ(Γ), δᵢ(Γ) and τ(Γ) with the normalizations used; items PAPER-YUAN-26/87, 94, 155.

### 10.2 Inequalities between graph invariants

`AH.10/graph-invariant-inequalities` · theorem

For a pm-graph Γ of genus g ≥ 2: (1) r(x, y) is at most the length of any path from x to y, hence ≤ ℓ(Γ); (2) ε(Γ) ≤ (2g − 2)ℓ(Γ); (3) (Cinkir) φ(Γ) ≥ t(g)δ₀(Γ) + Σ\_{i≥1} (2i(g − i)/g)δᵢ(Γ) with t(2) = 1/27, t(3) = (892 − 11√79)/14580 ≈ 0.0545, t(g) = (g − 1)²/(2g(7g + 5)) for g ≥ 4 (≥ 3/88), so φ(Γ) ≥ ℓ(Γ)/39; more precisely φ ≥ c(g)δ with c(2) = 1/27, c(4) = 3/88, c(g) ≥ 1/25 for g ≥ 5 and c(g) → 1/14; (4) τ(Γ) = ¼∫(∂\_x r(x, y))²dx ≥ 0; (5) δ + ε − 2φ = (3/2)δ − 6τ, hence ε ≤ δ/2 + 2φ.

**Hypotheses.**

- g ≥ 2; Γ a pm-graph.

**Proof route.**

- (1) Rayleigh monotonicity: r(x, w) ≤ r(x, z) + r(z, w) (with the variable names of source issue PAPER-YUAN-26/E4) and r ≤ edge length on an edge (Baker–Faber §6, Klein–Randić Theorem D as cited by Yuan).
- (2) ε = ∫∫ r δ\_K μ ≤ (deg K)·max r ≤ (2g − 2)ℓ, since K is effective (part of the definition of a pm-graph) and μ is a probability measure (Yuan p. 48).
- (3) Cinkir arXiv v2 Theorem 2.9 (Yuan cites it as [Cin1, Thm. 2.11]); min\_g t(g) = t(4) = 3/88 > 1/39 and 2i(g − i)/g ≥ 1.
- (4) Baker–Rumely Lemma 14.4. (5) de Jong Proposition 9.2.

**Checks.**

- One-loop graph: ε = (g − 1)ℓ/(3g) ≤ (2g − 2)ℓ; φ = (g − 1)ℓ/(6g) ≥ ℓ/12 ≥ ℓ/39; δ + ε − 2φ = ℓ and (3/2)δ − 6τ = ℓ.

*Needs:* §10.1 (`AH.10/polarized-graph-invariants`).

*Sources:* Cinkir 2011, Theorem 2.9, p. 5 (arXiv v2): Proves φ(Γ) ≥ t(ḡ)δ₀(Γ) + Σ\_{i≥1} (2i(ḡ − i)/ḡ)δᵢ(Γ) with explicit t(ḡ) and t(ḡ) ≥ 3/88 for ḡ ≥ 4.; Baker–Rumely, Lemma 14.4, p. 37: Proves τ(Γ) = ¼∫(∂\_x r(x, y))²dx.; de Jong, Proposition 9.2, p. 31: Proves the identity relating δ, ε, φ and τ of a pm-graph.; Yuan, Lemma 3.5 proof, pp. 47–48; Theorem 3.7 proof, p. 53; §4.5.1, pp. 86–88: Uses the resistance bound, ε ≤ (2g − 2)ℓ, φ ≥ ℓ/39, the Cinkir constants and the τ identity; items PAPER-YUAN-26/90, 91, 100, 158, 260, 261.

### 10.3 The local φ-invariant of a curve over a complete field

`AH.10/local-phi-invariant` · definition · planet: Zhang's φ-invariant

For C smooth projective geometrically connected of genus g > 1 over a complete valued field K (archimedean via C\_ℂ), with Zhang's admissible metrics (AH.7, GZ.2), φ(C) = −∫\_{(C×C)^an} g\_{Δ,a} c₁(O(Δ)\_a)². (1) Non-archimedean, split semistable reduction, \|ϖ\| = e^{−1}, unit-edge reduction graph Γ: φ(C) = φ(Γ) of AH.10/polarized-graph-invariants. (2) Archimedean: with an L²-orthonormal basis ω₁, …, ω\_g of H⁰(C, ω) for (i/2)∫α∧β̄ and an orthonormal eigenbasis φ\_λ of the Arakelov Laplacian, φ(C) = Σ\_{λ>0} Σ\_{j,k} (2/λ)\|∫\_C φ\_λ ω\_j ∧ ω̄\_k\|², so φ(C) > 0. (3) φ(C) ≥ 0 at non-archimedean places. Under a finite extension K′/K with the extended absolute value, φ is unchanged; with \|ϖ\| = e^{−1} renormalized on K′, φ is multiplied by e(K′/K) (Yuan p. 49 prints the field degree [K′ : K] in the analogous rule for δ; PAPER-YUAN-26/E3).

**Hypotheses.**

- g > 1.

**Construction.**

- (1) Integrate the explicit graph formulas of AH.7/graph-formulas (Zhang 2010 Theorem 1.3.1 and Lemma 3.5.4; finite-extension normalization by ramification index, source issue E3).
- (2) Spectral expansion of the Arakelov Green function (Zhang 2010 Proposition 2.5.3); positivity since each term is ≥ 0 and not all vanish.
- (3) From AH.10/graph-invariant-inequalities(3).

**API.**

- `Curve.localPhi` (constructor): φ(C) ∈ ℝ.
- `Curve.localPhi_graph` (compatibility): Equals φ(Γ) at split semistable reduction (unit edges, \|ϖ\| = e^{−1}).
- `Curve.localPhi_spectral` (characterisation): Spectral formula at archimedean places.
- `Curve.localPhi_pos_arch` (other): φ > 0 at archimedean places.
- `Curve.localPhi_nonneg` (other): φ ≥ 0 at non-archimedean places.
- `Curve.localPhi_rescale` (simp): Replacing \|·\| by \|·\|^a multiplies φ by a.
- `Curve.localPhi_isometry` (functoriality): An isomorphism of curves transports the normalized admissible metric and leaves φ unchanged; extending the absolute value preserves φ, while renormalizing a uniformizer introduces precisely the ramification factor.

**Unit tests.**

- `Curve.localPhi_good` (degenerate): Good reduction gives φ = 0.
- `Curve.localPhi_oneNode` (computation): A type-0 node of thickness m on an otherwise smooth genus-g special fibre gives φ = (g − 1)m/(6g).
- `Curve.localPhi_ramified` (characterisation): For a totally ramified extension K′/K of degree e with the normalization \|ϖ\_{K′}\| = e^{−1} on K′, φ(C\_{K′}) = e·φ(C): the unit-edge reduction graph over K′ has every edge subdivided e times.
- `Curve.localPhi_fieldDegree_nonexample` (non-example): Dividing the node count by [K′ : K] instead of the ramification index gives the wrong value after an unramified extension (source issue PAPER-YUAN-26/E3).

**Checks.**

- Good reduction: φ = 0.
- One-node degeneration of type 0 with thickness m: φ = (g − 1)m/(6g).

**Uses.** Yuan §3.3.2, p. 50: Green function of Φ\_S; Yuan Theorem 3.10, p. 56: uniform positive lower bound of φ on M\_g(ℂ).

*Needs:* §7.4 (`AH.7/canonical-metric-pair`); §7.5 (`AH.7/graph-formulas`); §10.1 (`AH.10/polarized-graph-invariants`); §10.2 (`AH.10/graph-invariant-inequalities`); `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`.

*Sources:* Yuan, §3.3.1, pp. 48–49: Defines the local φ-invariant by the admissible integral and gives the graph and spectral expressions; items PAPER-YUAN-26/93–95.; Zhang, Theorem 1.3.1, pp. 6–7; Proposition 2.5.3, p. 38: Introduces φ and proves the spectral formula at archimedean places.; Wilms 2017, (2.11), p. 10: Records φ(X) > 0 for compact Riemann surfaces of genus ≥ 2.

### 10.4 The global ε divisor E_S

`AH.10/epsilon-divisor` · construction

Let k be a field, S quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with a stable compactification π̄ : X̄ → S̄ (StableReductionPartII MC.6). With P = π\_*⟨w, w⟩, the canonical trivialization over S of π̄\_*⟨ω̄, ω̄⟩ − P (both have underlying bundle π\_*⟨ω, ω⟩ on S) defines an adelic divisor E\_S ∈ D̂iv(S/k) with zero underlying divisor and O(E\_S) = π̄\_*⟨ω̄, ω̄⟩ − P. At a point v ∈ S^an given by a discrete valuation of k(S)/k with e\_v = \|ϖ\_v\|⁻¹ and polarized reduction graph Γ\_v, its Green function is g\_{E\_S}(v) = ε(Γ\_v) log e\_v.

**Hypotheses.**

- k a field; stable compactification exists (after a finite cover, MC.6/stable-compactification-exists).

**Construction.**

- Both bundles are adelic extensions of π\_*⟨ω, ω⟩; their difference has a canonical section 1 over S.
- Green function at discrete v: Zhang's formula ω\_a² = ω²\_model − ε (Zhang 1993 Theorem 4.4, recalled in Yuan p. 47) applied to X\_{H\_v}.

**API.**

- `epsilonDivisor` (constructor): E\_S ∈ D̂iv(S/k), underlying divisor 0.
- `epsilonDivisor_O` (characterisation): O(E\_S) = π̄\_*⟨ω̄, ω̄⟩ − π\_*⟨w, w⟩.
- `epsilonDivisor_green` (compatibility): g\_{E\_S}(v) = ε(Γ\_v) log e\_v at discrete v.
- `epsilonDivisor_baseChange` (functoriality): Compatible with finite base change.
- `epsilonDivisor_trivialization` (characterisation): Use the canonical algebraic identification of the two pairing lines to fix the rational section, so E\_S is a divisor rather than merely a Picard class. Its Green values and zero underlying divisor determine it by adelic analytification.

**Unit tests.**

- `epsilonDivisor_smooth` (degenerate): For a smooth projective family over a projective S, E\_S = 0.
- `epsilonDivisor_oneNode` (computation): Near a generic point of a type-0 boundary divisor of multiplicity m, g\_{E\_S} = (g − 1)m/(3g)·log e\_v.
- `epsilonDivisor_arch_nonexample` (non-example): This construction is over a trivially valued constant field and has no archimedean component. There is no universal arithmetic construction with the same non-archimedean ε values and identically zero archimedean values for degenerating curve families (AH.10/globalization-scope); a good-reduction family can have E\_S = 0.

**Checks.**

- If X̄ → S̄ is smooth (no boundary) then E\_S = 0.

**Uses.** Yuan Theorem 3.8 proof, p. 54: P = π̄\_*⟨ω̄, ω̄⟩ − O(E\_S).

*Needs:* §8.3 (`AH.8/canonical-admissible-bundles`); §10.1 (`AH.10/polarized-graph-invariants`); `StableReductionPartII:MC.6/stable-compactification`; §3.2 (`AH.3/deligne-pairing`).

*Sources:* Yuan, §3.2, pp. 46–47: Defines E\_S by the canonical trivialization and computes its Green function at discrete valuations as ε(Γ\_v) log e\_v; items PAPER-YUAN-26/86–87.

### 10.5 The boundary bound for the ε divisor

`AH.10/epsilon-bound` · theorem

In the setting of AH.10/epsilon-divisor, (2g − 2)Δ\_S − E\_S is an effective adelic divisor with zero underlying divisor on S, where Δ\_S is the boundary divisor of the stable compactification restricted as an adelic divisor on S (its Green function at discrete v is ℓ(Γ\_v) log e\_v).

**Hypotheses.**

- As in AH.10/epsilon-divisor.

**Proof route.**

- By AH.2/effectivity-from-green and AH.2/divisorial-density it suffices to compare Green functions at discrete valuations: g\_{Δ\_S}(v)/log e\_v = ℓ(Γ\_v) (boundary multiplicity = node thickness, StableReductionPartII MC.5/boundary-thickness), and ε(Γ\_v) ≤ (2g − 2)ℓ(Γ\_v) (AH.10/graph-invariant-inequalities(2)).

**Checks.**

- Consistency: for a one-node degeneration (g − 1)m/(3g) ≤ (2g − 2)m.

*Needs:* §10.4 (`AH.10/epsilon-divisor`); §10.2 (`AH.10/graph-invariant-inequalities`); §2.5 (`AH.2/effectivity-from-green`); §2.4 (`AH.2/divisorial-density`); `StableReductionPartII:MC.5/boundary-thickness`; `StableReductionPartII:MC.5/boundary-divisor`.

*Sources:* Yuan, Lemma 3.5, pp. 47–48: Proves that (2g − 2)Δ\_S − E\_S is effective by comparing Green functions at discrete valuations; item PAPER-YUAN-26/92.

### 10.6 The global φ divisor Φ_S

`AH.10/phi-divisor` · construction · planet: Global φ divisor

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1, P = π\_*⟨w, w⟩ and D = Ō(Δ)\_a. Using the canonical algebraic identification (π, π)\_*⟨O(Δ), O(Δ), O(Δ)⟩ ≅ π\_*⟨ω, ω⟩, define Φ\_S ∈ D̂iv(S/k) as the adelic divisor of the corresponding trivializing section of P − (π, π)\_*⟨D, D, D⟩; its underlying divisor is 0. At a discrete or archimedean v ∈ S^an its Green function is ∫\_{((X×\_S X)\_v)^an} log‖1‖\_{Δ,a} c₁(O(Δ)\_a)² = φ(X\_{H\_v}) (domain of integration corrected by source issue PAPER-YUAN-26/E2), in the normalization e\_v = e and its rescaling for other norms.

**Hypotheses.**

- g > 1; S normal.

**Construction.**

- Algebraic identification of the triple self-pairing of the diagonal with π\_*⟨ω, ω⟩ by adjunction twice.
- Green function: the metric of P − (π,π)\_*⟨D,D,D⟩ at v is computed fibrewise by the Deligne pairing metric (AH.0/projective-deligne-pairing) and equals the local φ integral (Yuan §3.3.2).

**API.**

- `phiDivisor` (constructor): Φ\_S ∈ D̂iv(S/k), underlying divisor 0.
- `phiDivisor_O` (characterisation): O(Φ\_S) = P − (π,π)\_*⟨D, D, D⟩.
- `phiDivisor_green` (compatibility): g\_{Φ\_S}(v) = φ(X\_{H\_v}).
- `phiDivisor_baseChange` (functoriality): Compatible with base change.
- `phiDivisor_trivialization` (characterisation): The canonical algebraic triple-pairing identification fixes its trivializing section. With zero underlying divisor its Green function determines Φ\_S by injectivity of analytification; it is compatible with normal integral base change.

**Unit tests.**

- `phiDivisor_good` (computation): At a discrete v over which X has good reduction, g\_{Φ\_S}(v) = 0.
- `phiDivisor_arch` (compatibility): At an archimedean v, g\_{Φ\_S}(v) = φ(X\_v) > 0.
- `phiDivisor_domain_nonexample` (non-example): Integrating over X\_v^an (the printed domain) instead of (X ×\_S X)\_v^an is not defined: the integrand lives on the square.

**Checks.**

- For S = Spec O\_K[1/N] and a curve with good reduction outside N, the Green function at an archimedean place is φ(C\_σ).

**Uses.** Yuan Theorem 3.6, p. 51: triple self-pairing of j^*Θ̄; Yuan Theorem 3.10 proof, p. 57: Φ̃ on the fine moduli space over (ℂ, \|·\|).

*Needs:* §8.3 (`AH.8/canonical-admissible-bundles`); §10.3 (`AH.10/local-phi-invariant`); §3.2 (`AH.3/deligne-pairing`); §0.4 (`AH.0/projective-deligne-pairing`).

*Sources:* Yuan, §3.3.2, pp. 49–50: Defines Φ\_S as the divisor of the canonical trivialization of P − (π,π)\_*⟨D,D,D⟩ and identifies its Green function with the local φ-invariant; items PAPER-YUAN-26/96–97.

### 10.7 The triple self-pairing of the difference map

`AH.10/triple-pairing` · theorem · planet: Triple-pairing identity for Φ_S

With j : X ×\_S X → J, j(x, y) = y − x, and Θ̄ canonical: (π, π)\_*⟨j^*Θ̄, j^*Θ̄, j^*Θ̄⟩ = (12g − 4)P − 8O(Φ\_S) in P̂ic(S/k)\_ℚ. Writing wᵢ = pᵢ^*w and B(A, B, C) = (π, π)\_*⟨A, B, C⟩, the expansion uses B(wᵢ, wᵢ, wᵢ) = 0, B(w₁, w₁, w₂) = B(w₂, w₂, w₁) = (2g − 2)P, B(D, wᵢ, w\_j) = P, B(D, D, wᵢ) = −P and B(D, D, D) = P − O(Φ\_S).

**Hypotheses.**

- g > 1.

**Proof route.**

- Expand (2D + w₁ + w₂)³ by multilinearity: 8B(D,D,D) + 12B(D,D,w₁ + w₂) + 6B(D, w₁ + w₂, w₁ + w₂) + B((w₁ + w₂)³).
- Each auxiliary identity follows from AH.3/projection-formulas and the isometries of AH.8/canonical-admissible-bundles (B(D, D, wᵢ) = −P by adjunction; B(D, wᵢ, w\_j) = P by the pairing isometry).
- Sum: (8P − 8Φ) − 24P + 24P + 12(g − 1)P = (12g − 4)P − 8Φ (checked in this plan).

**Checks.**

- Coefficient check: 8 − 24 + 24 + 12(g − 1) = 12g − 4.

*Needs:* §10.6 (`AH.10/phi-divisor`); §9.2 (`AH.9/canonical-theta-identities`); §3.3 (`AH.3/projection-formulas`); §8.3 (`AH.8/canonical-admissible-bundles`).

*Sources:* Yuan, Theorem 3.6 and proof, pp. 51–52: Proves the triple-pairing identity following de Jong's Theorem 8.1, with the auxiliary multilinear identities; items PAPER-YUAN-26/98, 99, 253–256.; de Jong, Theorem 8.1, p. 28: Gives the single-curve identity that the family version generalizes.

### 10.8 The boundary bound for the φ divisor

`AH.10/phi-bound` · theorem

In the geometric setting of AH.10/epsilon-divisor (k a field, stable compactification), Φ\_S − Δ\_S/39 is an effective adelic divisor on S.

**Hypotheses.**

- k a field; stable compactification.

**Proof route.**

- Compare Green functions at discrete valuations: g\_{Φ\_S}(v)/log e\_v = φ(Γ\_v) ≥ ℓ(Γ\_v)/39 = g\_{Δ\_S}(v)/(39 log e\_v) by AH.10/graph-invariant-inequalities(3); conclude by AH.2/effectivity-from-green and AH.2/divisorial-density.

**Checks.**

- One-node degeneration: (g − 1)m/(6g) ≥ m/39.

*Needs:* §10.6 (`AH.10/phi-divisor`); §10.2 (`AH.10/graph-invariant-inequalities`); §10.5 (`AH.10/epsilon-bound`); §2.5 (`AH.2/effectivity-from-green`).

*Sources:* Yuan, Theorem 3.7, p. 53: Proves Φ\_S − Δ\_S/39 effective from Cinkir's lower bound for φ(Γ\_v); item PAPER-YUAN-26/101.

### 10.9 Hodge lower decomposition of ⟨ω_a, ω_a⟩

`AH.10/hodge-lower-decomposition` · theorem · planet: Hodge lower bound for ⟨ω_a, ω_a⟩

Let k be a field, S quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with a stable compactification. In P̂ic(S)\_ℚ, P = π\_*⟨w, w⟩ = (3/(5(2g − 1)(3g − 1)))λ\_S̄ + A + O(B) with A nef and B effective with zero underlying divisor, where λ\_S̄ is the Hodge line of the compactification.

**Hypotheses.**

- k a field; stable compactification.

**Proof route.**

- P = π̄\_*⟨ω̄, ω̄⟩ − O(E\_S) = 12λ − O(E\_S + Δ\_S) (universal Noether formula pulled back, StableReductionPartII MC.5/integral-noether) = 12λ − (2g − 1)O(Δ\_S) + eff (AH.10/epsilon-bound).
- P = (2/(3g − 1))O(Φ\_S) + nef (AH.10/triple-pairing with j^*Θ̄ nef: (12g − 4)P − 8O(Φ\_S) is nef) = (2/(39(3g − 1)))O(Δ\_S) + nef + eff (AH.10/phi-bound).
- Cancel Δ\_S: (1 + 39(3g − 1)(2g − 1)/2)P = 12λ + nef + eff; replace the coefficient by 20(3g − 1)(2g − 1) ≥ it (allowed since P is nef, AH.9/nefness-omega-a), giving 3/(5(2g − 1)(3g − 1)).

**Checks.**

- Coefficient check: 1 + 19.5(3g − 1)(2g − 1) ≤ 20(3g − 1)(2g − 1) for g ≥ 2, and 12/20 = 3/5.

*Needs:* §10.5 (`AH.10/epsilon-bound`); §10.8 (`AH.10/phi-bound`); §10.7 (`AH.10/triple-pairing`); §9.3 (`AH.9/nefness-omega-a`); `StableReductionPartII:MC.5/integral-noether`; `StableReductionPartII:MC.5/hodge-determinant`.

*Sources:* Yuan, Theorem 3.8 and proof, pp. 54–55: Proves the decomposition P = 3λ/(5(2g − 1)(3g − 1)) + nef + effective by combining Noether, the ε bound, the triple pairing and the φ bound; item PAPER-YUAN-26/105.

### 10.10 The Gross–Schoen height and its adelic variation

`AH.10/gross-schoen-variation` · construction

Let K be a number field or one-variable function field and C/K smooth projective geometrically connected of genus g > 1; choose a rational degree-one divisor ξ = Σ aᵢpᵢ with (2g − 2)ξ = ω\_C. The modified diagonal Δ\_ξ = Δ₁₂₃ − Δ₁₂ − Δ₂₃ − Δ₃₁ + Δ₁ + Δ₂ + Δ₃ ∈ CH²(C³)\_ℚ (Δ₁₂ = Σ aᵢ{(x, x, pᵢ)}, Δ₁ = Σ aᵢa\_j{(x, pᵢ, p\_j)}, and permutations) is homologically trivial, and its Gross–Schoen (Beilinson–Bloch) self-height satisfies ⟨Δ\_ξ, Δ\_ξ⟩ = ((2g + 1)/(2g − 2))ω\_a² − Σ\_v φ(C\_v)deg(v) (Zhang). For a smooth family π : X → S over a quasi-projective normal K-variety, L = ((2g + 1)/(2g − 2))π\_*⟨w, w⟩ − O(Φ\_S) ∈ P̂ic(S/k)\_ℚ satisfies h\_L(y) = ⟨Δ\_ξ(X\_y), Δ\_ξ(X\_y)⟩/a\_y for y ∈ S(K̄), where the pairing in the numerator uses the raw local sums over K(y), and a\_y = [K(y) : ℚ] for number fields or [K(y) : K] for function fields. This is the normalized fibrewise Gross–Schoen height; the displayed single-curve identity uses raw intersections and raw local sums on both sides. No nefness or bigness of L is asserted.

**Hypotheses.**

- g > 1; ξ exists after a finite extension of K.

**Construction.**

- Homological triviality of Δ\_ξ and the Gross–Schoen regular-model construction of its height (Gross–Schoen 1995, as recalled in Zhang 2010 §1.1).
- Zhang 2010 Theorem 1.3.1 with x\_ξ = 0 (the extra term 6(g − 1)⟨x\_ξ, x\_ξ⟩ vanishes since (2g − 2)ξ = ω).
- Family version: restrict L to y and use AH.4/adelic-heights with AH.10/phi-divisor (Yuan §3.3.5).

**API.**

- `grossSchoenCycle` (constructor): Δ\_ξ ∈ CH²(C³)\_ℚ.
- `grossSchoenCycle_homTrivial` (other): Homologically trivial.
- `grossSchoenHeight` (data): ⟨Δ\_ξ, Δ\_ξ⟩ by the Gross–Schoen construction (unconditional for these cycles).
- `grossSchoenHeight_formula` (relation): ⟨Δ\_ξ, Δ\_ξ⟩ = ((2g + 1)/(2g − 2))ω\_a² − Σφ(C\_v)deg(v).
- `grossSchoenVariation` (constructor): L = ((2g+1)/(2g−2))π\_*⟨w,w⟩ − O(Φ\_S); its point height is the raw fibrewise Gross–Schoen self-height divided by a\_y as in the statement.
- `grossSchoenCycle_baseChange` (functoriality): Formation of the rational modified diagonal commutes with field extension; its raw self-height scales by the extension degree, and dividing by a\_y gives the stated fibrewise normalized height.

**Unit tests.**

- `grossSchoenHeight_hyperelliptic` (computation): For hyperelliptic C, Δ\_ξ = 0 in CH²(C³)\_ℚ for ξ a Weierstrass point, so ⟨Δ\_ξ, Δ\_ξ⟩ = 0.
- `grossSchoenCycle_degree` (degenerate): Δ\_ξ has degree 0 against every product class (homological triviality).
- `grossSchoenHeight_extension` (characterisation): The raw self-height multiplies by [K′ : K] under finite extension. Division by [K : ℚ] makes it invariant for number fields; for function fields with fixed k it scales by [K′ : K]. The field used to represent y in the family formula does not affect its normalized point height.
- `grossSchoenVariation_not_nef` (non-example): L is not claimed nef: its nefness is the open question of Yuan p. 54.

**Checks.**

- If C is hyperelliptic then ⟨Δ\_ξ, Δ\_ξ⟩ = 0, giving ω\_a² = ((2g − 2)/(2g + 1))Σφ (AH.13/phi-lower-bounds).

**Uses.** Yuan §3.3.5, p. 54: the open question of nefness/bigness of L.

*Needs:* §10.6 (`AH.10/phi-divisor`); §7.7 (`AH.7/global-admissible-bundles`); §4.7 (`AH.4/adelic-heights`); `SchemeAndStackFoundations:SF.5/chow-group`; `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`.

*Sources:* Zhang, §1.1, pp. 3–4; Theorem 1.3.1, pp. 6–7: Defines the Gross–Schoen modified diagonal for a degree-one divisor and proves the height formula in terms of ω\_a² and local φ-invariants.; Yuan, §3.3.5, pp. 53–54: Recalls the Gross–Schoen cycle and formula and defines the adelic line bundle L whose height is the Gross–Schoen height; items PAPER-YUAN-26/102–104, 257.

### 10.11 Faltings' δ-invariant

`AH.10/faltings-delta` · definition

For a compact connected Riemann surface X of genus g ≥ 1, Faltings' δ(X) ∈ ℝ is the constant in Faltings' comparison of the Arakelov metric on det H⁰(X, ω) with ‖θ‖ and Arakelov Green functions (Faltings 1984, p. 401–402). Fix a period matrix Ω with Y = Im Ω, θ(z,Ω) = Σ\_{n∈ℤ^g} exp(πi nᵗΩn + 2πi nᵗz), ‖θ‖(z) = (det Y)^{1/4} exp(−π(Im z)ᵗY⁻¹(Im z))\|θ(z,Ω)\|, and ν = (i/2)Σ\_{j,k}(Y⁻¹)\_{jk}dz\_j ∧ d z̄\_k, transported to Pic^{g−1}(X) through its theta divisor; ∫ν^g/g! = 1. Equivalently (Wilms Theorem 1.1) δ(X) = −24∫\_{Pic^{g−1}(X)} log‖θ‖ ν^g/g! + 2φ(X) − 8g log 2π. For a semistable curve over a number field, the global δ(C) = Σ\_{v finite} δ\_v log Nv + Σ\_σ δ(C\_σ), with δ\_v the number of singular points of the geometric special fibre of the minimal regular model at v.

**Hypotheses.**

- g ≥ 1 (g > 1 in the applications).

**Construction.**

- Definition by Faltings; Wilms' formula as a characterisation (Wilms Theorem 1.1).

**API.**

- `faltingsDelta` (constructor): δ(X) ∈ ℝ for a compact Riemann surface.
- `faltingsDelta_wilms` (characterisation): Wilms' formula in terms of ∫log‖θ‖ and φ.
- `faltingsDelta_global` (data): Global δ(C) = Σ δ\_v log Nv + Σ\_σ δ(C\_σ).
- `faltingsDelta_iso` (other): Depends only on the isomorphism class of X.
- `faltingsDelta_period_independent` (compatibility): The normalized theta norm and Haar volume descend under changes of period coordinates, so the Wilms expression determines the same δ on isomorphic Riemann surfaces; global archimedean sums count complex embeddings twice.

**Unit tests.**

- `faltingsDelta_genusOne_bound` (computation): For g = 1, δ > −9.
- `faltingsDelta_phi_zero` (degenerate): For g = 1 the φ term in Wilms' formula vanishes.
- `faltingsDelta_finite_nodes` (characterisation): At a finite place with semistable minimal regular model, δ\_v is the number of nodes of the geometric special fibre.
- `faltingsDelta_not_phi` (non-example): δ is not a multiple of φ: the theta integral term is independent.

**Checks.**

- g = 1: φ = 0 and δ is −24∫log‖θ‖ − 8 log 2π, with δ > −9 (Faltings §7 as recalled by Wilms).

**Uses.** Yuan §4.5.2, p. 89: arithmetic Noether formula; Yuan Theorem 4.14 proof, p. 93: Wilms' lower bound for δ.

*Needs:* §10.3 (`AH.10/local-phi-invariant`); `GrossZagierAndArithmeticHeights:GZ.2/normalized-arakelov-green`.

*Sources:* Wilms 2017, Theorem 1.1, p. 1; §2.2, p. 8: Proves δ(X) = −24∫ log‖θ‖ ν^g/g! + 2φ(X) − 8g log 2π and recalls Faltings' definition of δ.; Yuan, §4.5.2, p. 89: Recalls the global δ-invariant with finite nodal and archimedean Faltings contributions; part of item PAPER-YUAN-26/160.; Wilms 2017, §2.1, pp. 5–7: Fixes the theta norm and invariant volume form used in the integral characterisation; no arbitrary additive constant in δ is allowed.

### 10.12 The arithmetic Noether formula

`AH.10/arithmetic-noether` · theorem

For C/K smooth projective geometrically connected of genus g > 1 over a number field with semistable minimal regular model 𝒞 over O\_K, 12 deĝ(λ̄) = ω²\_{𝒞,Ar} + δ(C) − 4g[K : ℚ]log(2π), where λ̄ = det π\_*ω with the determinant L² metric (AH.5/adelic-hodge-bundle), ω\_{𝒞,Ar} the relative dualizing sheaf with the Arakelov metric (GZ.2) and δ(C) the global δ-invariant.

**Hypotheses.**

- Semistable minimal regular model over O\_K; g > 1.

**Proof route.**

- Faltings, Calculus on arithmetic surfaces, Theorem 6, with the constant corrected by Moret-Bailly, La formule de Noether pour les surfaces arithmétiques, Théorème 2.5 (as cited by Yuan p. 89). The proof via the Deligne pairing and the Quillen metric is not repeated here; see the gap list.

**Checks.**

- With δ ≥ −2g log(2π⁴) at each archimedean place (Wilms), the formula gives [ω²\_Ar] ≤ 12h\_Fal + 6g log(2π²) (AH.13/number-field-comparison).

*Needs:* §10.11 (`AH.10/faltings-delta`); §5.5 (`AH.5/adelic-hodge-bundle`); `GrossZagierAndArithmeticHeights:GZ.2/arakelov-dualizing-metric`; `ArakelovGeometryAndAbelianHeights:R35.3`.

*Sources:* Yuan, §4.5.2, p. 89: States the arithmetic Noether formula with the 4g log 2π constant, citing Faltings Theorem 6 as corrected by Moret-Bailly Theorem 2.5; item PAPER-YUAN-26/160.

### 10.13 The admissible Noether divisor Ξ_S

`AH.10/noether-divisor` · construction

Let k be ℤ or ℚ, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1. The semi-canonical Noether isomorphism 12λ\_S ≅ π\_*⟨ω, ω⟩ (on S, where Δ\_S is empty; StableReductionPartII MC.5/semi-canonical-noether), unique up to sign, defines Ξ\_S ∈ D̂iv(S/k) with zero underlying divisor and O(Ξ\_S) = 12λ̄\_S − π\_*⟨w, w⟩; it is independent of the sign. Its Green function is δ\_v + ε\_v at a normalized discrete v and δ(X\_v) − 4g log(2π) at a normalized archimedean v. If the rational-base family has a stable compactification, the image of Ξ\_S in D̂iv(S\_ℚ/ℚ) is E\_{S\_ℚ} + Δ\_{S\_ℚ}.

**Hypotheses.**

- k = ℤ or ℚ; g > 1.

**Construction.**

- Define Ξ\_S as the divisor of the semi-canonical section of 12λ̄\_S − π\_*⟨w, w⟩; the sign ambiguity does not change the divisor of a section (\|−s\| = \|s\|).
- Local Green functions: at discrete v, compare with Zhang's ω\_a² = ω²\_model − ε and the local Noether formula (δ\_v nodes); at archimedean v, the arithmetic Noether formula AH.10/arithmetic-noether fibrewise.
- Geometric part: compare with AH.10/epsilon-divisor and the universal Noether formula.

**API.**

- `noetherDivisor` (constructor): Ξ\_S ∈ D̂iv(S/k), underlying divisor 0.
- `noetherDivisor_O` (characterisation): O(Ξ\_S) = 12λ̄\_S − π\_*⟨w, w⟩.
- `noetherDivisor_green_finite` (compatibility): Green function δ\_v + ε\_v at discrete v.
- `noetherDivisor_green_arch` (compatibility): Green function δ(X\_v) − 4g log 2π at archimedean v.
- `noetherDivisor_geometric` (relation): Image over S\_ℚ/ℚ equals E + Δ.
- `noetherDivisor_sign_independent` (extensionality): Changing the semi-canonical Noether isomorphism by its allowed sign leaves the Green function unchanged; the zero underlying divisor and stated local Green functions determine Ξ\_S.

**Unit tests.**

- `noetherDivisor_sign` (characterisation): Replacing the semi-canonical isomorphism by its negative gives the same Ξ\_S.
- `noetherDivisor_good` (degenerate): At a discrete v of good reduction the Green function is 0.
- `noetherDivisor_arch_value` (computation): At an archimedean point v the Green function is δ(X\_v) − 4g log 2π, which by Wilms is > −2g log(2π⁴) − 4g log 2π.

**Checks.**

- Over a single curve with good reduction at v, the Green function at v is 0.

**Uses.** Yuan Theorem 4.14 proof, pp. 94–95: the coercive divisor D\_S = (3/(2c(g)) + 3)Φ\_S − Ξ\_S.

*Needs:* §5.5 (`AH.5/adelic-hodge-bundle`); §8.3 (`AH.8/canonical-admissible-bundles`); §10.12 (`AH.10/arithmetic-noether`); §10.4 (`AH.10/epsilon-divisor`); `StableReductionPartII:MC.5/semi-canonical-noether`; `StableReductionPartII:MC.5/integral-noether`.

*Sources:* Yuan, §4.5.2, pp. 90–91: Defines the admissible Noether divisor Ξ\_S, computes its local Green functions and identifies its geometric part with E + Δ; items PAPER-YUAN-26/161–163.

### 10.14 What can and cannot be globalized

`AH.10/globalization-scope` · theorem

There is no universal arithmetic adelic divisor on curve moduli whose non-archimedean values are ε(Γ\_v)log e\_v and whose archimedean values are identically zero. For a degenerating family, continuity on the hybrid analytification fails. Thus δ also has no universal globalization with its usual archimedean values, since Ξ\_S already globalizes δ + ε. Special families with zero correction are allowed. Yuan asserts, without proof, that a finer analysis of Theorem 3.10 gives boundary growth of φ (and, using Ξ, of archimedean δ) on complex moduli from the corresponding graph data; these finer asymptotics are recorded as assertions, not targets proved here.

**Hypotheses.**

- Arithmetic base k = ℤ.

**Proof route.**

- Use a one-parameter complex smoothing with a nonseparating node and parameter t. For t\_i → 0, rescale the complex absolute value by a\_i = 1/log(1/\|t\_i\|); then \|t\_i\|^{a\_i} = e⁻¹, while a\_i → 0 makes the norm on constants trivial. In the hybrid space these points approach a nontrivial divisorial valuation with ε(Γ) > 0. The proposed archimedean-zero Green function stays zero along the sequence but would be positive at the limit. The obstruction is at this valuation, not at the trivial valuation on the function field. This explains the general obstruction of Yuan Remark 4.13(1).
- The growth statements (Remarks 3.11 and 4.13(2)) are recorded as asserted consequences, not targets proved here (gap).

**Checks.**

- Φ\_S and Ξ\_S exist arithmetically; the E\_S construction here is geometric. The obstruction concerns a universal rule for degenerating families, and does not exclude E\_S = 0 on a special good-reduction family.

*Needs:* §10.4 (`AH.10/epsilon-divisor`); §10.13 (`AH.10/noether-divisor`); §10.6 (`AH.10/phi-divisor`); §2.1 (`AH.2/global-analytification`); `TropicalAndBerkovichArithmetic:TB.0/hybrid-analytic-space`.

*Sources:* Yuan, Remark 3.11, p. 59; Remark 4.13, p. 91: Records that ε and δ cannot be globalized and that the method describes the boundary growth of φ and δ; items PAPER-YUAN-26/278–280.

**Refinements left for the lemma-level pass.**

- Faltings 1984 and Moret-Bailly 1989 (arithmetic Noether formula) were not read; AH.10/arithmetic-noether is cited through Yuan p. 89 (gap G3).
- The Gross–Schoen regular-model height construction is cited through Zhang 2010 §1.1 (gap G4).
- The boundary-growth assertions of Yuan Remarks 3.11 and 4.13(2) are recorded, not planned (gap G5).

## Layer AH.11: Bigness of the admissible canonical bundle

The uniform positive lower bound for φ on compact Riemann surfaces of genus g, bigness of ⟨ω\_a, ω\_a⟩ in the geometric and arithmetic cases (Theorem 3.2), and the main theorem: ω\_{X/S,a} is nef and big under maximal variation (Theorems 1.3/3.1).

Targets: §11.1 Uniform positivity of φ on compact Riemann surfaces; §11.2 Bigness of ⟨ω_a, ω_a⟩ in the geometric case; §11.3 Bigness of ⟨ω_a, ω_a⟩ in the arithmetic case; §11.4 Bigness of the admissible canonical bundle.

Planets: Uniform positivity of φ, Bigness of the admissible canonical bundle.

### 11.1 Uniform positivity of φ on compact Riemann surfaces

`AH.11/uniform-phi-bound` · theorem · planet: Uniform positivity of φ

For each g > 1 there is c₀(g) > 0 with φ(C) ≥ c₀(g) for every compact Riemann surface C of genus g. On the complex points of a fine full-level moduli space M\_{g,N} (N ≥ 3), φ is continuous, positive and tends to +∞ at the boundary of the stable compactification.

**Hypotheses.**

- g > 1.
- Choose the finite surjective cover of fine level moduli supplied by StableReductionPartII:MC.6/level-stable-compactification, on which a stable compactification and universal family exist; prove the uniform estimate there and descend it by surjectivity and base-change invariance.

**Proof route.**

- Positivity at each point: AH.10/local-phi-invariant(2).
- Continuity on M\_{g,N}(ℂ): φ is the Green function of Φ̃ over (ℂ, \|·\|) (AH.1/complex-base), continuous on M^an.
- Boundary growth requires the complex-base completion, rather than a direct comparison of geometric and archimedean Green functions. Over B = (ℂ,\|·\|), approximate (Φ̃,φ) by model divisors (D\_i,g\_i), with boundary error a\_i(E₀,g₀), a\_i → 0. Then φ ≥ g\_i − a\_i g₀ and D\_i − a\_iE₀ ≥ Φ̃ − 2a\_iE₀ ≥ (1/39 − 2a\_i)E₀. Choose a\_i < 1/78. The function g\_i − a\_i g₀ is a Green function of a positive multiple of the full boundary, so it tends to +∞ there. This proves the required growth (Yuan p. 58).
- Compactness of the stable compactification then gives a positive minimum (Yuan Theorem 3.10 proof, pp. 57–58, with the corrections of source issue E5).

**Checks.**

- For g = 2 the bound agrees in shape with de Jong's asymptotics (Yuan p. 56).

*Needs:* §10.3 (`AH.10/local-phi-invariant`); §10.8 (`AH.10/phi-bound`); §1.7 (`AH.1/complex-base`); `StableReductionPartII:MC.4/fine-level-scheme`; `StableReductionPartII:MC.6/level-stable-compactification`.

*Sources:* Yuan, Theorem 3.10 and proof, pp. 56–58: Proves a uniform positive lower bound for φ on compact Riemann surfaces of genus g by showing φ → ∞ at the boundary of moduli through the adelic divisor Φ̃; items PAPER-YUAN-26/109–111.

### 11.2 Bigness of ⟨ω_a, ω_a⟩ in the geometric case

`AH.11/geometric-bigness` · theorem

Let k be a field, S quasi-projective normal integral over k and π : X → S smooth of genus g > 1 with maximal variation (StableReductionPartII MC.6/maximal-variation). Then P = π\_*⟨w, w⟩ is nef and big on S/k. When dim S = 0 every adelic line bundle on S/k is declared nef and big.

**Hypotheses.**

- k a field; maximal variation.

**Proof route.**

- Nefness: AH.9/nefness-omega-a.
- Pass to a finite cover with a stable compactification (StableReductionPartII MC.6/stable-compactification-exists) and normalize; bigness of nef bundles is invariant under finite covers (AH.4/finite-cover-bigness).
- By AH.10/hodge-lower-decomposition, P = cλ\_S̄ + A + O(B) with c > 0; λ\_S̄ is nef and big under maximal variation (StableReductionPartII MC.6/maximal-variation-hodge, via the Torelli map to the minimal compactification), so cλ\_S̄ + A is nef and big, and adding O(B) effective keeps bigness.

**Checks.**

- For S a curve with a non-isotrivial family, P has positive degree.

*Needs:* §10.9 (`AH.10/hodge-lower-decomposition`); §9.3 (`AH.9/nefness-omega-a`); §4.5 (`AH.4/finite-cover-bigness`); `StableReductionPartII:MC.6/maximal-variation`; `StableReductionPartII:MC.6/maximal-variation-hodge`; `StableReductionPartII:MC.6/stable-compactification-exists`; §4.2 (`AH.4/adelic-volume`).

*Sources:* Yuan, Theorem 3.2, p. 40; proof after Remark 3.9, pp. 55–56: Proves bigness of π\_*⟨ω\_a, ω\_a⟩ over a field from Theorem 3.8 and the bigness of the Hodge bundle under maximal variation; items PAPER-YUAN-26/68, 106, 107.

### 11.3 Bigness of ⟨ω_a, ω_a⟩ in the arithmetic case

`AH.11/arithmetic-bigness` · theorem

Let S be flat quasi-projective normal integral over ℤ, π : X → S smooth of genus g > 1 with maximal variation, d = dim S and P = π\_*⟨w, w⟩. Then P = (2/(3g − 1))O(c₀) + nef + effective with c₀ = c₀(g) of AH.11/uniform-phi-bound, where O(c₀) is the trivial bundle on Spec ℤ with ‖1‖ = e^{−c₀}; hence P^d ≥ (2c₀/(3g − 1))·(P\|\_{S\_ℚ/ℚ})^{d−1} > 0, and P is nef and big on S/ℤ.

**Hypotheses.**

- k = ℤ; maximal variation.

**Proof route.**

- By AH.10/triple-pairing, P = (2/(3g − 1))O(Φ\_S) + nef.
- Φ\_S − c₀ is effective: its Green function is φ at archimedean points (≥ c₀ by AH.11/uniform-phi-bound) and φ ≥ 0 at non-archimedean points (AH.10/local-phi-invariant(3)) — the latter is the step source issue PAPER-YUAN-26/E6 says the paper uses without citing.
- Expand P^d = P^{d−1}·((2/(3g−1))O(c₀) + nef + eff) ≥ (2c₀/(3g − 1))(P\|\_{S\_ℚ})^{d−1}, and (P\|\_{S\_ℚ})^{d−1} > 0 by AH.11/geometric-bigness over ℚ; conclude by AH.4/hilbert-samuel-siu.

**Checks.**

- For d = 1 and S open in Spec O\_K, the normalized degree is deĝ(P)/[K : ℚ] ≥ 2c₀/(3g − 1) > 0; the unnormalized degree has the additional factor [K : ℚ].

*Needs:* §10.7 (`AH.10/triple-pairing`); §11.1 (`AH.11/uniform-phi-bound`); §10.3 (`AH.10/local-phi-invariant`); §11.2 (`AH.11/geometric-bigness`); §4.3 (`AH.4/hilbert-samuel-siu`); §3.1 (`AH.3/intersection-pairing`).

*Sources:* Yuan, Proof of the arithmetic case of Theorem 3.2, p. 57; §1.4, p. 14: Proves bigness over ℤ from P = (2/(3g − 1))O(c₀) + nef + effective; item PAPER-YUAN-26/112, with gap E6.

### 11.4 Bigness of the admissible canonical bundle

`AH.11/bigness-omega-a` · theorem · planet: Bigness of the admissible canonical bundle

Let k be ℤ or a field, S flat quasi-projective normal integral over k and π : X → S smooth of genus g > 1 with maximal variation. Then ω\_{X/S,a} is nef and big on X/k, and π\_*⟨ω\_a, ω\_a⟩ is nef and big on S/k.

**Hypotheses.**

- Maximal variation; g > 1.

**Proof route.**

- Nefness: AH.9/nefness-omega-a.
- Bigness of P = π\_*⟨w, w⟩: AH.11/geometric-bigness or AH.11/arithmetic-bigness.
- Bigness of w: 4g(g − 1)w = i\_ω^*Θ̄ + π^*P (AH.9/canonical-theta-identities(1)). With d = dim S, expand (i\_ω^*Θ̄ + π^*P)^{d+1}: all terms are ≥ 0 by nefness, and the term (d + 1)·i\_ω^*Θ̄·(π^*P)^d equals (d + 1)·a·P^d > 0, where a = 4g(g − 1)(2g − 2) is the generic fibre degree of i\_ω^*Θ̄ (AH.3/projection-formulas); conclude by AH.4/hilbert-samuel-siu (Yuan p. 40).

**Checks.**

- For S = Spec K a global field this is Zhang's ω\_a² > 0 for non-isotrivial curves (the function-field case needs non-isotriviality, which is maximal variation over the constant field).

*Needs:* §11.2 (`AH.11/geometric-bigness`); §11.3 (`AH.11/arithmetic-bigness`); §9.3 (`AH.9/nefness-omega-a`); §9.2 (`AH.9/canonical-theta-identities`); §4.3 (`AH.4/hilbert-samuel-siu`); §3.3 (`AH.3/projection-formulas`).

*Sources:* Yuan, Theorem 1.3, pp. 11–12; Theorem 3.1 and §3.1, p. 40: States and proves that ω\_{X/S,a} is nef and big under maximal variation; item PAPER-YUAN-26/67.

**Refinements left for the lemma-level pass.**

- The arithmetic case uses φ\_v ≥ 0 at non-archimedean places, which Yuan does not cite (PAPER-YUAN-26/E6); it is supplied by AH.10/graph-invariant-inequalities.

## Layer AH.12: Potential bigness

Potential bigness of a nef adelic line bundle on a family with geometrically integral generic fibre, integrality of relative powers, the mixed intersection and Deligne-pairing coefficient computations on relative powers, Theorem 4.1 (bigness of π\_*⟨L^{e+1}⟩ ⟺ potential bigness), the product-grid degree bound, Theorem 4.5 for the Abel, difference and universal-shift families, and cross-characteristic restriction.

Targets: §12.1 Potential bigness and relative powers; §12.2 Intersections and Deligne pairings on relative powers; §12.3 The criterion for potential bigness; §12.4 The product-grid degree bound; §12.5 Potential bigness of theta pullbacks; §12.6 Restriction of adelic line bundles across characteristics.

Planets: Potential bigness, Criterion for potential bigness, Potential bigness of theta pullbacks.

### 12.1 Potential bigness and relative powers

`AH.12/potential-bigness` · definition · planet: Potential bigness

Let k be ℤ or a field, S flat quasi-projective normal integral over k, Y integral and π : Y → S projective flat with geometrically integral generic fibre of relative dimension e. For m ≥ 1 let Y^m\_{/S} = Y ×\_S ··· ×\_S Y (Y⁰ = S); it is integral. For L̄ ∈ P̂ic(Y/k) put m⊠L̄ = Σᵢ pᵢ^*L̄ on Y^m\_{/S}. L̄ is potentially big over S if m⊠L̄ is big on Y^m\_{/S} for some m ≥ 1.

**Hypotheses.**

- π flat with geometrically integral generic fibre.

**Construction.**

- Integrality of Y^m\_{/S}: flatness and geometric integrality of the generic fibre exclude extra components and embedded points (Yuan p. 60).

**API.**

- `relativePower` (constructor): Y^m\_{/S}, integral for m ≥ 1.
- `boxPower` (constructor): m⊠L̄ = Σ pᵢ^*L̄.
- `IsPotentiallyBig` (data): ∃ m ≥ 1, m⊠L̄ big on Y^m\_{/S}.
- `boxPower_nef` (other): m⊠L̄ is nef if L̄ is nef.
- `relativePower_dim` (simp): dim Y^m\_{/S} = dim S + em.
- `boxPower_pullback` (functoriality): The m-fold fibre product represents m-tuples over S; normal integral base change commutes with relativePower and boxPower. Each projection pulls back L̄, so boxPower is invariant under permuting the factors and is additive in L̄.

**Unit tests.**

- `IsPotentiallyBig_relDimZero` (degenerate): If Y = S, potentially big ⟺ big.
- `relativePower_integral` (characterisation): For an elliptic surface Y → ℙ¹ with integral generic fibre, Y ×\_{ℙ¹} Y is integral.
- `boxPower_pullback_nonexample` (non-example): L̄ = π^*M̄ is never potentially big when e ≥ 1: m⊠π^*M̄ = m·π\_m^*M̄ is pulled back from S.

**Checks.**

- For e = 0 (π finite flat of degree 1, i.e. Y = S), L̄ is potentially big iff L̄ is big.

**Uses.** Yuan Theorem 4.2, p. 64: small-points bounds for potentially big L̄; Yuan Theorem 4.5, p. 68: potential bigness of theta pullbacks.

*Needs:* §4.2 (`AH.4/adelic-volume`); §1.3 (`AH.1/adelic-line-bundles`).

*Sources:* Yuan, §4.1, pp. 59–60: Defines potential bigness via box powers on relative powers and proves integrality of relative powers; items PAPER-YUAN-26/113–114.

### 12.2 Intersections and Deligne pairings on relative powers

`AH.12/relative-power-intersections` · theorem

In the setting of AH.12/potential-bigness, let L̄ be nef integrable with a = deg(L\_η^e) > 0 and d = dim S. (1) For nonnegative r₁, …, r\_m with Σrᵢ = em + 1, (π\_m)\_*⟨(p₁^*L̄)^{r₁}, …, (p\_m^*L̄)^{r\_m}⟩ vanishes unless (r₁, …, r\_m) is a permutation of (e + 1, e, …, e), in which case it is a^{m−1}π\_*⟨L̄^{e+1}⟩; hence (π\_m)\_*⟨(m⊠L̄)^{em+1}⟩ is a positive multiple of π\_*⟨L̄^{e+1}⟩. (2) For m ≥ d, the top intersection (p₁^*L̄)^{e+1}···(p\_d^*L̄)^{e+1}(p\_{d+1}^*L̄)^e···(p\_m^*L̄)^e on Y^m\_{/S} equals a^{m−d}(π\_*⟨L̄^{e+1}⟩)^d (with the dimension-zero convention).

**Hypotheses.**

- L̄ nef integrable; a > 0.

**Proof route.**

- Factor π\_m through its projections and use AH.3/projection-formulas. If any rᵢ < e, that factor has too few entries for its fibre dimension and kills the pairing. For a potentially nonzero term all rᵢ ≥ e, and Σrᵢ = em + 1 then forces precisely one rᵢ = e + 1 and all others e. The latter factors each contribute a, leaving a^{m−1}π\_*⟨L̄^{e+1}⟩. The exponent sum alone does not exclude multiple exponents above e before the vanishing terms are removed.
- (2) by induction on d using (1) and the composition formula.

**Checks.**

- For m = 1, (1) is tautological. If e = 0 then the smooth projective geometrically connected family is Y = S; m⊠L̄ = mL̄, its relative pairing is mL̄, and its top intersection is m^dL̄^d.

*Needs:* §12.1 (`AH.12/potential-bigness`); §3.3 (`AH.3/projection-formulas`); §3.1 (`AH.3/intersection-pairing`).

*Sources:* Yuan, Theorem 4.1 proof, pp. 60–63: Computes the mixed top intersections and the Deligne-pairing coefficients on relative powers; items PAPER-YUAN-26/116–117.

### 12.3 The criterion for potential bigness

`AH.12/potential-bigness-criterion` · theorem · planet: Criterion for potential bigness

In the setting of AH.12/potential-bigness, let L̄ be nef with positive fibre degree a = deg(L\_η^e) > 0 and M̄ = π\_*⟨L̄^{e+1}⟩. The following are equivalent: (1) M̄ is big on S; (2) m⊠L̄ is big on Y^m\_{/S} for every m ≥ dim S; (3) L̄ is potentially big over S.

**Hypotheses.**

- L̄ nef; a > 0.

**Proof route.**

- (1) ⇒ (2): m⊠L̄ is nef, so bigness is positivity of (m⊠L̄)^{d+em}; expand and keep the term b\_m of AH.12/relative-power-intersections(2), which is a^{m−d}M̄^d > 0 by Hilbert–Samuel, all other terms being ≥ 0 by nefness.
- (2) ⇒ (3) is trivial.
- (3) ⇒ (1): (π\_m)\_*⟨(m⊠L̄)^{em+1}⟩ is a positive multiple of M̄ (AH.12/relative-power-intersections(1)); Deligne pairings of nef big bundles are nef big (AH.4/deligne-positivity(1)) after adding a small relatively ample perturbation, and finite covers preserve bigness.

**Checks.**

- For dim S = 0 (the paper convention) every L̄ with a > 0 is potentially big.

*Needs:* §12.1 (`AH.12/potential-bigness`); §12.2 (`AH.12/relative-power-intersections`); §4.4 (`AH.4/deligne-positivity`); §4.3 (`AH.4/hilbert-samuel-siu`).

*Sources:* Yuan, Theorem 4.1, pp. 60–63: Proves the equivalence of bigness of the Deligne pairing, bigness of all box powers m ≥ dim S, and potential bigness; item PAPER-YUAN-26/115.

### 12.4 The product-grid degree bound

`AH.12/product-grid-bound` · theorem

Let C be a smooth projective geometrically connected curve over an algebraically closed field F, Z ⊊ C^m closed of codimension d > 0, N a degree-one line bundle and Σ ⊂ C(F) with Σ^m ⊂ Z(F). Then Σ is finite and \|Σ\| ≤ (deg\_{m⊠N} Z)^{1/d}, the degree summing over all irreducible components (of possibly different dimensions).

**Hypotheses.**

- C smooth projective connected over F = F̄; Z proper closed of codimension d.

**Proof route.**

- Induction on m by intersecting with fibres of the projections; Bézout-type bound for products of points (Yuan Lemma 4.3).
- Apply first to finite subsets of Σ, then conclude finiteness of Σ from the uniform bound (the correction of source issue PAPER-YUAN-26/E22).

**Checks.**

- m = 1, Z a finite set of n points: \|Σ\| ≤ n.

*Needs:* `SchemeAndStackFoundations:SF.5/degree`; `SchemeAndStackFoundations:SF.5/exterior-product`.

*Sources:* Yuan, Lemma 4.3, pp. 66–67: Proves \|Σ\| ≤ (deg Z)^{1/d} for Σ^m ⊂ Z; item PAPER-YUAN-26/122.

### 12.5 Potential bigness of theta pullbacks

`AH.12/theta-potential-bigness` · theorem · planet: Potential bigness of theta pullbacks

Let k be ℤ or a field, S flat quasi-projective normal integral over k, π : X → S smooth of genus g > 1 with maximal variation, J, Θ̄, X\_J = J ×\_S X, J\_J = J ×\_S J, q₁ : X\_J → J and τ(y, x) = (y, y + (2g − 2)x − ω) as in AH.9. (1) For α of positive relative degree, π\_*⟨i\_α^*Θ̄, i\_α^*Θ̄⟩ is nef and big on S, so i\_α^*Θ̄ is potentially big on X/S. (2) With X\_X = X ×\_S X, J\_X = X ×\_S J, i\_Δ(x, y) = (x, y − x) and Θ̄\_X = p₂^*Θ̄, p₁\_*⟨i\_Δ^*Θ̄\_X, i\_Δ^*Θ̄\_X⟩ is nef and big on X, so i\_Δ^*Θ̄\_X is potentially big on X\_X/X. (3) q₁\_*⟨τ^*Θ̄\_J, τ^*Θ̄\_J⟩ is nef and big on J, so τ^*Θ̄\_J is potentially big on X\_J/J. (4) If Y is a quasi-projective k-variety with a generically finite Y → J whose image T in S has T → M\_{g,k} generically finite, then q₁\_*⟨τ^*Θ̄\_J, τ^*Θ̄\_J⟩\|\_Y is nef and big on Y and τ^*Θ̄\_J\|\_{Y ×\_S X} is potentially big over Y.

**Hypotheses.**

- Maximal variation; g > 1.

**Proof route.**

- By AH.12/potential-bigness-criterion it suffices to prove bigness of the pairings.
- (1) (g − 1)π\_*⟨i\_α^*Θ̄, i\_α^*Θ̄⟩ = g d⁴P + d²ι\_α^*Θ̄ (AH.9/theta-pullback-formulas) with P nef big (AH.11/bigness-omega-a) and ι\_α^*Θ̄ nef.
- (2) p₁\_*⟨…⟩ = 4g·w + π^*P (AH.9/canonical-theta-identities(2)) with w nef big.
- (3) q₁\_*⟨…⟩ = 16(g − 1)³Θ̄ + 16g(g − 1)³π\_J^*P; Θ̄ is relatively ample and π\_J^*P is big from the base, so the sum is big on J.
- (4) Restrict (3) to Y: Θ̄\|\_Y is ample on the generic fibre of Y → T and P\|\_T is big by maximal variation of T (with dim T in place of dim S, source issue PAPER-YUAN-26/E16).

**Checks.**

- For S = Spec K (dim S = 0) the statements reduce to bigness on the fibre.

*Needs:* §12.3 (`AH.12/potential-bigness-criterion`); §9.1 (`AH.9/theta-pullback-formulas`); §9.2 (`AH.9/canonical-theta-identities`); §11.4 (`AH.11/bigness-omega-a`); §8.4 (`AH.8/canonical-theta-bundle`); `StableReductionPartII:MC.6/maximal-variation`.

*Sources:* Yuan, Theorem 4.5 and proof, pp. 68–70: Proves nef bigness of the Deligne self-pairings of theta pullbacks along the Abel, difference and universal-shift maps and the restriction to Jacobian subvarieties; items PAPER-YUAN-26/124–127.

### 12.6 Restriction of adelic line bundles across characteristics

`AH.12/cross-characteristic-restriction` · construction

Let S be flat quasi-projective integral over ℤ, L̄ ∈ P̂ic(S/ℤ) and y : Spec K → S with K/k a one-variable function field. Restrict L̄ to S\_ℚ/ℚ if char k = 0 or to S\_{𝔽\_p}/𝔽\_p if char k = p, base-change to S\_k/k, and pull back to Spec K over k; the degree weights are [k(v) : k]. The same process applies to L̄ on X and its fibre X\_y.

**Hypotheses.**

- S flat over ℤ.

**Construction.**

- Restriction maps P̂ic(S/ℤ) → P̂ic(S\_ℚ/ℚ) and → P̂ic(S\_{𝔽\_p}/𝔽\_p) (forget archimedean and other-prime data; Yuan–Zhang §2.5–2.7), then geometric base change and pullback (AH.1/adelic-line-bundles).

**API.**

- `AdelicLineBundle.restrictChar0` (functoriality): P̂ic(S/ℤ) → P̂ic(S\_ℚ/ℚ).
- `AdelicLineBundle.restrictCharP` (functoriality): P̂ic(S/ℤ) → P̂ic(S\_{𝔽\_p}/𝔽\_p).
- `AdelicLineBundle.restrictFunctionField` (functoriality): Pullback to Spec K over k with degree weights [k(v) : k].
- `AdelicLineBundle.restrict_nef` (other): Restriction preserves nefness and integrability.
- `AdelicLineBundle.restrict_comp` (simp): Restriction to a characteristic fibre, extension of constants and pullback to a point commute whenever the resulting schemes are integral; tensor product and dual commute with each restriction. The final degree is relative to the chosen constant field k.

**Unit tests.**

- `AdelicLineBundle.restrict_model` (compatibility): For a model bundle the char-p restriction is its reduction mod p.
- `AdelicLineBundle.restrict_constant` (degenerate): O(c) from Spec ℤ restricts to the trivial bundle on S\_{𝔽\_p}/𝔽\_p.
- `AdelicLineBundle.restrict_arch_nonexample` (non-example): On ℙ¹\_ℤ, the model bundle O(1) restricts to O(1) on ℙ¹\_𝔽\_p with degree one. Restriction forgets arithmetic metric data, but does not collapse every algebraic line bundle to O.

**Checks.**

- For L̄ a model bundle on a projective model over ℤ, the restriction to S\_{𝔽\_p} is the reduction mod p of the model bundle.

**Uses.** Yuan Theorem 4.10, p. 81: uniform small-points bounds over function fields of every characteristic.

*Needs:* §1.6 (`AH.1/essentially-quasi-projective`); §1.3 (`AH.1/adelic-line-bundles`); §4.7 (`AH.4/adelic-heights`).

*Sources:* Yuan, Theorem 4.10 explanation, p. 82: Describes the restriction of arithmetic adelic line bundles to geometric ones in every characteristic; item PAPER-YUAN-26/148.

## Layer AH.13: Admissible self-intersection and the Faltings height

The stable Faltings height over function fields, global graph invariants and Zhang's correction, lower bounds of ω\_a² by φ, the function-field comparison (Theorem 4.11), Wilms' lower bound for δ, Bost's lower bound for the Faltings height (with the normalization corrected), the boundary-coercive divisor, the number-field comparison (Theorem 4.14) and the uniform comparison c₃max{h\_Fal, 1} ≤ [ω\_a²] ≤ c₄max{h\_Fal, 1} (Theorem 1.4).

Targets: §13.1 The stable Faltings height over a function field; §13.2 Global φ, ε and δ of a curve over a global field; §13.3 Zhang's correction of the canonical self-intersection; §13.4 Lower bounds of ω_a² by φ; §13.5 Comparison of ω_a² with the Faltings height over function fields; §13.6 Wilms' lower bound for Faltings' δ; §13.7 Bost's lower bound for the Faltings height, in Faltings' normalization; §13.8 The boundary-coercive divisor for the lower height estimate; §13.9 Comparison of ω_a² with the Faltings height over number fields; §13.10 Uniform comparison of [ω_a²] with max{h_Fal, 1}.

Planets: Function-field Faltings height, Function-field comparison with h_Fal, Number-field comparison with h_Fal, Uniform comparison with the Faltings height.

### 13.1 The stable Faltings height over a function field

`AH.13/function-field-faltings-height` · construction · planet: Function-field Faltings height

Let K/k be a one-variable function field and C/K smooth projective geometrically integral of genus g > 1. Choose a finite K′/K over which C (equivalently J) has semistable reduction everywhere, B′ the regular projective k-curve with function field K′, J′ the Néron model of J\_{K′} and e its zero section; put ω\_{B′} = e^*Ω^g\_{J′/B′} and h\_Fal(C) = deg\_{B′/k}(ω\_{B′})/[K′ : K], with deg\_{B′/k}(v) = [k(v) : k] (on Div(B′), source issue E17). It is independent of K′, equals deg(λ\_{B′})/[K′ : K] for the Hodge line of the stable model (Pic⁰ of the stable model is the identity component of the Néron model), is ≥ 0, and is > 0 when C\_{K̄} is non-isotrivial over k̄, with h\_Fal(C) > 3^{−4g²} (char ≠ 3) or > 4^{−4g²} (char 3).

**Hypotheses.**

- g > 1; K/k of transcendence degree one with k the constant field.

**Construction.**

- Independence of the auxiliary extension K′ follows from base change of the semistable identity component, hence of its invariant differential determinant, and scaling of degrees. The full Néron model need not commute with base change (R11.3/semistable-identity-basechange).
- Hodge comparison: JacobianChallengePartII JC6 with BLR §7.4 Prop. 4 (Yuan pp. 72–73).
- Positivity and the explicit lower bound: semistable reduction over the field of N-torsion, N ∈ {3, 4} prime to the characteristic, of degree < N^{4g²}, and integrality of the degree on that field (Yuan Lemma 4.9).

**API.**

- `Curve.faltingsHeightFF` (constructor): h\_Fal(C) ∈ ℚ\_{≥0}.
- `Curve.faltingsHeightFF_extension` (other): Independent of the semistable extension K′.
- `Curve.faltingsHeightFF_hodge` (compatibility): Equals deg λ\_{B′}/[K′ : K].
- `Curve.faltingsHeightFF_pos` (other): Positive for non-isotrivial C, with the explicit lower bound.
- `Curve.faltingsHeightFF_fixed_constants` (functoriality): For a finite K₁/K over the same fixed constant field k, h\_Fal(C\_{K₁}) = [K₁:K]h\_Fal(C); independence of the auxiliary semistable extension keeps K and k fixed.

**Unit tests.**

- `Curve.faltingsHeightFF_isotrivial` (degenerate): For C = C₀ ⊗\_k K, h\_Fal(C) = 0.
- `Curve.faltingsHeightFF_extension_test` (characterisation): The choice of semistable extension K′ does not change h\_Fal(C) for a fixed base field K. Changing the base to K″ over the same k gives h\_Fal(C\_{K″}) = [K″ : K]h\_Fal(C); it is not invariant in this geometric normalization.
- `Curve.faltingsHeightFF_lowerBound` (computation): For g = 2, char ≠ 3 and non-isotrivial C, h\_Fal(C) > 3^{−16}.
- `Curve.faltingsHeightFF_nonsemistable_nonexample` (non-example): Using the Néron model over B without passing to K′ gives a non-stable height that can change under extension.

**Checks.**

- For C with everywhere good reduction over k(t) and constant (isotrivial) J, h\_Fal = 0.

**Uses.** Yuan Theorem 4.11, p. 85: comparison with ω\_a².

*Needs:* `JacobianChallengePartII:JC6/hodge-line-isomorphism`; `StableReductionPartII:MC.5/hodge-determinant`; `ArakelovGeometryAndAbelianHeights:R35.3`; `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`; `NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange`.

*Sources:* Yuan, §4.3.1, pp. 72–73; Lemma 4.9, pp. 75–76: Defines the stable Faltings height over function fields, identifies it with the degree of the stable Hodge line, and proves positivity and the explicit lower bound under non-isotriviality; items PAPER-YUAN-26/131 (and the routed lower bound used in Theorem 4.11).

### 13.2 Global φ, ε and δ of a curve over a global field

`AH.13/global-curve-invariants` · construction

For C semistable over a one-variable function field K/k, φ(C) = Σ\_v φ\_v(C)deg(v), ε(C) = Σ\_v ε\_v(C)deg(v), δ(C) = Σ\_v δ\_v(C)deg(v), with deg(v) = [k(v) : k] and the local invariants of the reduction graphs (AH.10). Over a number field replace deg(v) by log Nv at finite places; at archimedean places φ\_v is the archimedean φ (weight 1 or 2), ε\_v = 0 and δ\_v is Faltings' δ.

**Hypotheses.**

- C semistable over K (after a finite extension).

**Construction.**

- Only finitely many finite places have bad reduction. Under finite base extension, with residue degrees over a fixed k in the function-field case, each raw global sum multiplies by the extension degree, by ramification scaling and the residue-degree formula. Over number fields dividing by [K : ℚ] makes the sums invariant.

**API.**

- `Curve.globalPhi` (constructor): φ(C) = Σ φ\_v deg(v).
- `Curve.globalEpsilon` (constructor): ε(C).
- `Curve.globalDelta` (constructor): δ(C).
- `Curve.global_nonneg` (other): φ, ε, δ ≥ 0 over function fields.
- `Curve.globalInvariants_extension` (functoriality): Under a finite extension of the global field, raw global invariants multiply by its degree; number-field quotients by [K:ℚ] remain unchanged. The geometric statement keeps the constant field fixed.

**Unit tests.**

- `Curve.global_goodReduction` (degenerate): Everywhere good reduction over a function field: all three vanish.
- `Curve.global_oneNode` (computation): One type-0 node of thickness 1 at one place of degree 1: δ = 1, ε = (g − 1)/(3g), φ = (g − 1)/(6g).
- `Curve.global_extension` (characterisation): All three raw sums multiply by [K′ : K] under finite extension. Their quotients by [K : ℚ] are invariant over number fields; the function-field sums with degrees over a fixed k scale by [K′ : K].
- `Curve.global_arch_epsilon_nonexample` (non-example): Over a number field there is no archimedean ε term (ε\_v = 0 at infinity).

**Checks.**

- Everywhere good reduction over a function field: φ = ε = δ = 0.

**Uses.** Yuan Theorem 4.11 proof, p. 85: ω\_a² = 12h\_Fal − δ − ε; Wilms 2022 Theorem 1.2: ω\_a² ≥ ((g − 1)/(2g + 1))φ.

*Needs:* §10.3 (`AH.10/local-phi-invariant`); §10.1 (`AH.10/polarized-graph-invariants`); §10.11 (`AH.10/faltings-delta`).

*Sources:* Yuan, §4.5.1, pp. 85–86; §4.5.2, p. 89: Defines the global φ, ε and δ invariants with function-field and number-field weights; item PAPER-YUAN-26/153.

### 13.3 Zhang's correction of the canonical self-intersection

`AH.13/zhang-correction` · theorem

For C with semistable minimal regular model 𝒞: ω\_a² = ω²\_𝒞 − ε(C), where over number fields ω\_𝒞 carries the Arakelov metric. Over a function field, combined with the Noether formula ω²\_𝒞 = 12 deg λ − δ(C) = 12h\_Fal(C) − δ(C): ω\_a² = 12h\_Fal(C) − δ(C) − ε(C).

**Hypotheses.**

- Semistable minimal regular model.

**Proof route.**

- Local comparison of Zhang's admissible metric with the model metric (AH.7/graph-formulas): at each bad place the difference of self-intersections is ε\_v (Zhang 1993 Theorem 4.4 as recalled by Yuan).
- Noether formula for the semistable fibration over B′ (StableReductionPartII MC.5/integral-noether pulled back) and AH.13/function-field-faltings-height.

**Checks.**

- Good reduction everywhere over a function field: ω\_a² = ω²\_𝒞 = 12h\_Fal.

*Needs:* §7.5 (`AH.7/graph-formulas`); §7.7 (`AH.7/global-admissible-bundles`); §13.2 (`AH.13/global-curve-invariants`); §13.1 (`AH.13/function-field-faltings-height`); `StableReductionPartII:MC.5/integral-noether`.

*Sources:* Yuan, §4.5.1, p. 86; §4.5.2, p. 89: Recalls ω\_a² = ω²\_model − ε and its combination with Noether over function fields; item PAPER-YUAN-26/154.

### 13.4 Lower bounds of ω_a² by φ

`AH.13/phi-lower-bounds` · theorem

For C/K smooth projective geometrically integral of genus g > 1 over a global field, after a finite extension making C semistable (both raw sides scale by the extension degree; their number-field quotients by [K : ℚ] are invariant): (1) ω\_a² ≥ ((g − 1)/(2g + 1))φ(C) (Looper–Silverman–Wilms over function fields, with max(2, g − 1) in place of g − 1 and 2(g − 1) in characteristic 0 or for hyperelliptic C; Wilms over number fields). (2) If C is hyperelliptic (in particular g = 2), ω\_a² = (2(g − 1)/(2g + 1))φ(C). (3) With A(g) = 1 + (3/(2c(g)) + 2)(2g + 1)/(g − 1) built from the Cinkir constants, A(g) ≤ 139 < 144 for g > 2; for g = 2 the hyperelliptic identity gives the coefficient 1 + (3/(2c(2)) + 2)·(5/2) = 107.25; and 12/A(g) → 12/47.

**Hypotheses.**

- g > 1; for (2) C hyperelliptic.

**Proof route.**

- (1) Wilms 2022 Theorem 1.2 (number fields) and Looper–Silverman–Wilms Proposition 6.1 (function fields).
- (2) Zhang 2010 Corollary 1.3.3: the Gross–Schoen cycle of a hyperelliptic curve vanishes (AH.10/gross-schoen-variation).
- (3) Arithmetic: c(3) = 17/288 gives A(3) ≈ 96.9, c(4) = 3/88 gives A(4) = 139, c(g) ≥ 1/25 gives A(g) ≤ 1 + 39.5·(2g + 1)/(g − 1) ≤ 109.625 for g ≥ 5; c(g) → 1/14 gives A(g) → 1 + 23·2 = 47.

**Checks.**

- A(4) = 1 + (44 + 2)·3 = 139 exactly; the g = 2 coefficient 107.25 = 1 + 42.5·2.5 (both checked in the suggested Lean file).

*Needs:* §13.2 (`AH.13/global-curve-invariants`); §10.10 (`AH.10/gross-schoen-variation`); §10.2 (`AH.10/graph-invariant-inequalities`); §7.7 (`AH.7/global-admissible-bundles`).

*Sources:* Wilms 2022, Theorem 1.2, p. 3: Proves ω̂² ≥ ((g − 1)/(2g + 1))φ for curves with semistable reduction over number fields.; Looper–Silverman–Wilms, Proposition 6.1, p. 14: Proves ω\_a² ≥ (max(2, g − 1)/(2g + 1))Σφ over function fields, with 2(g − 1) in characteristic 0 or for hyperelliptic curves.; Zhang, Corollary 1.3.3, p. 7: Gives the hyperelliptic identity.; Yuan, §4.5.1, pp. 87–88; Remark 4.12(1), p. 88: Uses these bounds and derives the coefficient A(g) ≤ 139; items PAPER-YUAN-26/156–158, 281.; Cinkir 2015, Introduction, item (iii), p. 1; concluding summary, p. 18 (arXiv v1): Proves the sharp polarized-genus-three bound φ ≥ (17/288)ℓ, including weighted vertices; it supplies the constant used in A(3). This is the preprint of the cited Manuscripta paper.

### 13.5 Comparison of ω_a² with the Faltings height over function fields

`AH.13/function-field-comparison` · theorem · planet: Function-field comparison with h_Fal

Let K/k be a one-variable function field and C/K smooth projective geometrically integral of genus g > 1, K′/K finite with a semistable minimal regular model C′ over the regular projective k-curve S′ of K′. Then (1/12)h\_Fal(C) ≤ ω²\_{C/K,a} ≤ ω²\_{C′/S′}/[K′ : K] ≤ 12h\_Fal(C). If moreover C\_{K̄} is non-isotrivial over k̄, then (1/12)max{h\_Fal(C), 4^{−4g²}} ≤ ω²\_{C/K,a} ≤ 12max{h\_Fal(C), 1}.

**Hypotheses.**

- g > 1; K/k one-variable function field.

**Proof route.**

- Base change to K′ and write ω\_a² = 12h\_Fal − δ − ε (AH.13/zhang-correction); upper bounds from δ, ε ≥ 0.
- Lower bound: ε ≤ δ/2 + 2φ (AH.10/graph-invariant-inequalities(5)) and δ ≤ φ/c(g) give δ + ε ≤ (3/(2c(g)) + 2)φ ≤ (3/(2c(g)) + 2)((2g + 1)/(g − 1))ω\_a² = (A(g) − 1)ω\_a² by AH.13/phi-lower-bounds(1); hence 12h\_Fal = ω\_a² + δ + ε ≤ A(g)ω\_a² ≤ 139ω\_a² for g > 2, and ≤ 107.25ω\_a² for g = 2 by the hyperelliptic identity, so ω\_a² ≥ h\_Fal/12 (Yuan pp. 86–88).
- Non-isotrivial case: AH.13/function-field-faltings-height lower bound 3^{−4g²} or 4^{−4g²} ≥ 4^{−4g²}.
- Alternative weaker route: the slope inequality ω²\_{C/S} ≥ (4 − 4/g)deg λ\_S for semistable fibrations (Cornalba–Harris, Xiao; Moriwaki in positive characteristic — its generality is not verified here, Yuan Remark 4.12(2)).

**Checks.**

- Everywhere good reduction: ω\_a² = 12h\_Fal, consistent with both inequalities.

*Needs:* §13.3 (`AH.13/zhang-correction`); §13.4 (`AH.13/phi-lower-bounds`); §10.2 (`AH.10/graph-invariant-inequalities`); §13.1 (`AH.13/function-field-faltings-height`).

*Sources:* Yuan, Theorem 4.11 and proof, pp. 85–88; Remark 4.12, p. 88: Proves the two-sided comparison of ω\_a² with h\_Fal over function fields and the max-normalized form under non-isotriviality; items PAPER-YUAN-26/150–152, 159.

### 13.6 Wilms' lower bound for Faltings' δ

`AH.13/archimedean-delta-bound` · theorem

For every compact connected Riemann surface X of genus g ≥ 1, δ(X) > −2g log(2π⁴).

**Hypotheses.**

- g ≥ 1.

**Proof route.**

- From Wilms' formula (AH.10/faltings-delta) using ∫\_{Pic^{g−1}} log‖θ‖ ν^g/g! < −(g/4)log 2 (Jensen) and φ(X) ≥ 0 (Wilms Corollary 1.2).

**Checks.**

- g = 1: −2 log(2π⁴) ≈ −10.54 < −9, consistent with Faltings' δ > −9.

*Needs:* §10.11 (`AH.10/faltings-delta`); §10.3 (`AH.10/local-phi-invariant`).

*Sources:* Wilms 2017, Corollary 1.2, p. 1: Proves δ(X) > −2g log 2π⁴ for compact Riemann surfaces of genus g ≥ 1.; Yuan, Theorem 4.14 proof, p. 93: Uses Wilms' bound in the paper normalization; item PAPER-YUAN-26/167.

### 13.7 Bost's lower bound for the Faltings height, in Faltings' normalization

`AH.13/bost-lower-bound` · theorem

For a principally polarized abelian variety (in particular a Jacobian) of dimension g over ℚ̄, the stable Faltings height in Faltings' normalization ‖α‖² = (i^{g²}/2^g)∫α∧ᾱ satisfies h\_Fal ≥ −(g/2)log(2π²); in Deligne's normalization h\_Del ≥ −(g/2)log(2π). Hence for M̄ = Θ̄ + π\_J^*λ̄\_S + O(c) with c = (g/2)log(2π²) + 1, h\_M̄(y) = 2ĥ(y) + h\_Fal(X\_s) + c ≥ 2ĥ(y) + max{h\_Fal(X\_s), 1}, since h\_Fal + c ≥ 1 always and h\_Fal + c ≥ h\_Fal.

**Hypotheses.**

- Number fields; Faltings normalization as in Yuan §4.3.1.

**Proof route.**

- Import ArakelovGeometryAndAbelianHeights R35.6 §6.5 (Bost's theorem, Gaudron–Rémond Corollary 8.4) and the normalization shift h\_Fal = h\_Del − (g/2) log π of R35.2 §2.7.
- Yuan p. 78 quotes −g log √(2π) = −(g/2)log(2π), Deligne's form, while using Faltings' metric (pp. 43–44, 73); the corrected constant is recorded as source issue ArakelovGeometryAndAbelianHeightsPartII/E1. The argument only needs some uniform constant, so the conclusion is unaffected.

**Checks.**

- g = 1: the minimum of h\_Del is ≈ −0.749 at j = 0 (Deligne), so min h\_Fal ≈ −0.749 − (1/2)log π ≈ −1.321, below −(1/2)log(2π) ≈ −0.919 but above −(1/2)log(2π²) ≈ −1.491.

*Needs:* `ArakelovGeometryAndAbelianHeights:R35.6`; `ArakelovGeometryAndAbelianHeights:R35.2`; §5.5 (`AH.5/adelic-hodge-bundle`); §8.4 (`AH.8/canonical-theta-bundle`).

*Sources:* Yuan, §4.4.1, p. 78; §4.3.1, p. 73; Lemma 3.4, pp. 43–44: Quotes Bost's lower bound to choose the constant c in M = Θ̄ + π\_J^*λ̄\_S + O(c), with the Faltings metric of §4.3.1; item PAPER-YUAN-26/144.; Gaudron–Rémond, §2.3, Definition 2.1, pp. 6–7; Corollary 8.4, p. 37 (arXiv v1): Defines the Deligne-normalized metric, computes its shift from the original Faltings height, and proves Bost’s lower bound for that normalized height; fixes the constant in Yuan’s application.

### 13.8 The boundary-coercive divisor for the lower height estimate

`AH.13/boundary-coercive-divisor` · construction

Fix a Cinkir constant c(g) > 0. In the arithmetic curve-moduli setting (fine level moduli over ℤ[1/N] with a stable compactification of its generic fibre) put D\_S = (3/(2c(g)) + 3)Φ\_S − Ξ\_S ∈ D̂iv(S/ℤ)\_ℚ. Its geometric part D̃ satisfies D̃ − c(g)Δ ≥ 0 over S\_ℚ/ℚ, and its archimedean Green function tends to +∞ at the boundary of moduli, hence is bounded below by a constant c₅′(g).

**Hypotheses.**

- g > 1; fine level moduli with stable compactification.
- Choose the finite surjective cover of fine level moduli supplied by StableReductionPartII:MC.6/level-stable-compactification, on which a stable compactification and universal family exist; prove the uniform estimate there and descend it by surjectivity and base-change invariance.

**Construction.**

- Geometric part: Φ̃ has Green function φ(Γ\_v), Ξ̃ has δ(Γ\_v) + ε(Γ\_v) (AH.10/noether-divisor); ε ≤ δ/2 + 2φ and φ ≥ c(g)δ give (3/(2c) + 3)φ − δ − ε ≥ c(g)δ (the coefficient c(g)Δ, not Δ: source issue PAPER-YUAN-26/E25).
- Archimedean coercivity: as in AH.11/uniform-phi-bound, effectivity of the geometric part over (ℂ, \|·\|) forces the Green function to grow at the boundary; with Wilms' δ bound it is bounded below.

**API.**

- `coerciveDivisor` (constructor): D\_S = (3/(2c) + 3)Φ\_S − Ξ\_S.
- `coerciveDivisor_geometric` (other): D̃ − c(g)Δ ≥ 0 over S\_ℚ.
- `coerciveDivisor_green_bounded` (other): Archimedean Green function bounded below by c₅′(g).
- `coerciveDivisor_local` (characterisation): Its underlying divisor is zero; at a normalized non-archimedean point its Green value is (3/(2c)+3)φ−δ−ε, and at an archimedean point it is (3/(2c)+3)φ−δ+4g log(2π). These follow from Φ\_S and Ξ\_S and determine the divisor.

**Unit tests.**

- `coerciveDivisor_coefficient` (computation): For c(g) = 1/25, 3/(2c) + 3 = 40.5.
- `coerciveDivisor_good` (degenerate): At a discrete v of good reduction the Green function is 0.
- `coerciveDivisor_wrong_coeff` (non-example): For the regular tetrahedral graph K₄ with all six edge lengths 1 and vertex weights 0, g = 3, δ = 6, φ = 17/48 and ε = 11/6. At c(3) = 17/288 the divisor value is (483/17)(17/48) − 6 − 11/6 = 107/48 < 6. Thus D̃ − Δ has value −181/48 and fails effectivity; D̃ − c(3)Δ has value 15/8 > 0.

**Checks.**

- For c(g) = 1/25 the coefficient is 3·25/2 + 3 = 40.5.
- The regular-tetrahedron test computes the failure of the stronger printed boundary coefficient, rather than inferring its failure merely from a weaker proved estimate.

**Uses.** Yuan Theorem 4.14(b), p. 92: the linear lower bound [ω\_a²] ≥ h\_Fal/12 + c₅.

*Needs:* §10.6 (`AH.10/phi-divisor`); §10.13 (`AH.10/noether-divisor`); §10.2 (`AH.10/graph-invariant-inequalities`); §13.6 (`AH.13/archimedean-delta-bound`); §11.1 (`AH.11/uniform-phi-bound`); `StableReductionPartII:MC.6/level-stable-compactification`.

*Sources:* Yuan, Theorem 4.14 proof, pp. 94–95: Introduces D\_S = (3/(2c(g)) + 3)Φ\_S − Ξ\_S, proves D̃ − c(g)Δ effective and the boundary growth of its Green function; item PAPER-YUAN-26/168.; Cinkir 2015, §6, type XIV (tetrahedral graph), pp. 13–14 (arXiv v1): For equal edge lengths the genus-three graph attains φ = (17/288)ℓ; the formulas for ε in terms of τ and θ give the explicit counterexample to D̃ ≥ Δ.

### 13.9 Comparison of ω_a² with the Faltings height over number fields

`AH.13/number-field-comparison` · theorem · planet: Number-field comparison with h_Fal

For g > 1 there is c₅(g) ∈ ℝ such that for every smooth projective geometrically connected C/K of genus g over a number field, with K′/K any finite extension over which C has a semistable minimal regular model C′: max{h\_Fal(C)/12 + c₅, ((g − 1)/(2g + 1))c₀} ≤ [ω²\_{C/K,a}] ≤ [ω²\_{C′/O\_{K′},Ar}] ≤ 12h\_Fal(C) + 6g log(2π²), where [·] divides by the degree over ℚ and c₀ = c₀(g) is the constant of AH.11/uniform-phi-bound. The constant c₅ is not claimed positive or effective.

**Hypotheses.**

- g > 1; number fields.

**Proof route.**

- (a) Wilms: ω\_a² ≥ ((g − 1)/(2g + 1))φ(C); φ\_v ≥ 0 at finite places and φ\_σ ≥ c₀ at archimedean places.
- (b) Write 12λ̄ − P = O(Ξ\_S) on fine moduli and use the coercive divisor (AH.13/boundary-coercive-divisor): (3/(2c) + 3)P ≥ ... gives [ω\_a²] ≥ h\_Fal/12 + c₅ (Yuan pp. 93–95, with the λ̄\_{O\_K} reading of source issue E30).
- (c) ω\_a² ≤ ω²\_Ar since ε ≥ 0; arithmetic Noether with Wilms' δ > −2g log(2π⁴): ω²\_Ar = 12 deĝλ̄ − δ + 4g[K:ℚ]log 2π ≤ 12h\_Fal[K:ℚ] + 2g log(2π⁴)[K:ℚ] + 4g log(2π)[K:ℚ] = [K:ℚ](12h\_Fal + 6g log(2π²)).

**Checks.**

- Constant check: 2g log(2π⁴) + 4g log(2π) = 2g log(8π⁶) = 6g log(2π²).

*Needs:* §13.4 (`AH.13/phi-lower-bounds`); §11.1 (`AH.11/uniform-phi-bound`); §13.8 (`AH.13/boundary-coercive-divisor`); §10.12 (`AH.10/arithmetic-noether`); §13.6 (`AH.13/archimedean-delta-bound`); §13.3 (`AH.13/zhang-correction`); §5.5 (`AH.5/adelic-hodge-bundle`); §13.7 (`AH.13/bost-lower-bound`).

*Sources:* Yuan, Theorem 4.14 and proof, pp. 92–95: Proves the lower bounds by ((g − 1)/(2g + 1))c₀ and h\_Fal/12 + c₅, and the upper bound 12h\_Fal + 6g log(2π²); items PAPER-YUAN-26/164–166.; Wilms 2022, Theorem 1.2, p. 3: Supplies ω̂² ≥ ((g − 1)/(2g + 1))φ.

### 13.10 Uniform comparison of [ω_a²] with max{h_Fal, 1}

`AH.13/uniform-comparison` · theorem · planet: Uniform comparison with the Faltings height

For each g > 1 there are c₃(g), c₄(g) > 0 such that for every number field or one-variable function field K/k and every smooth projective geometrically connected curve C/K of genus g, non-isotrivial over k̄ in the function-field case, c₃·max{h\_Fal(C), 1} ≤ [ω²\_{C/K,a}] ≤ c₄·max{h\_Fal(C), 1}, with [·] dividing by [K : ℚ] in the number-field case only.

**Hypotheses.**

- g > 1; non-isotriviality in the function-field case.

**Proof route.**

- Function fields: AH.13/function-field-comparison with c₃ = 4^{−4g²}/12, c₄ = 12.
- Number fields: from AH.13/number-field-comparison, [ω\_a²] ≥ max{h/12 + c₅, c′} ≥ c₃ max{h, 1} by a convex combination (if h ≤ 1 use c′ = ((g − 1)/(2g + 1))c₀ > 0; if h large use h/12 + c₅), and [ω\_a²] ≤ 12h + 6g log(2π²) ≤ c₄ max{h, 1} using h\_Fal bounded below (AH.13/bost-lower-bound).

**Checks.**

- For a curve with h\_Fal ≤ 1 the statement says [ω\_a²] ≍ 1, uniformly in g.

*Needs:* §13.5 (`AH.13/function-field-comparison`); §13.9 (`AH.13/number-field-comparison`); §13.7 (`AH.13/bost-lower-bound`).

*Sources:* Yuan, Theorem 1.4, pp. 14–15; Theorems 4.11 and 4.14: States the uniform comparison and derives it from the function-field and number-field theorems; item PAPER-YUAN-26/169.

**Refinements left for the lemma-level pass.**

- The positive-characteristic slope inequality mentioned as an alternative route is not used by any target; its generality remains unverified.

## Requests to other roadmaps

- `ArakelovGeometryAndAbelianHeights:R35.1`: Existing upstream roadmap (TauCetiRoadmap PR #1000), cited as it stands: §§1.1–1.3 hermitian bundles over O\_K and the Arakelov degree, §1.7 compactified Picard group, §§1.8–1.9 arithmetic divisors with smooth Green functions on regular arithmetic schemes and their metrized line bundles (with the −log\|f\|² convention, half of which is the Yuan–Zhang Green function), §1.12 heights of algebraic points for continuous metrized line bundles. AH.0 extends §§1.8–1.9 to continuous integrable metrics on arbitrary projective arithmetic varieties and to top intersection numbers, which the parent explicitly excludes from its scope. Needed by §0.3 (`AH.0/arithmetic-intersection-numbers`), §0.1 (`AH.0/hermitian-line-bundles`), §1.8 (`AH.1/arithmetic-curve-comparison`), §4.7 (`AH.4/adelic-heights`).
- `ArakelovGeometryAndAbelianHeights:R35.2`: Existing upstream roadmap (PR #1000), cited as it stands: §2.1 the Faltings metric (i^{g²}/2^g)∫α∧ᾱ, §2.7 the normalization dictionary h\_Del = h\_Fal + (g/2)log π, §2.8 the Faltings metric on families. Used for the adelic Hodge bundle (AH.5) and the Bost bound (AH.13). Needed by §13.7 (`AH.13/bost-lower-bound`), §5.5 (`AH.5/adelic-hodge-bundle`).
- `ArakelovGeometryAndAbelianHeights:R35.3`: Existing upstream roadmap (PR #1000), cited as it stands: §3.4 the stable Faltings height over number fields, independent of the semistable extension. Needed by §10.12 (`AH.10/arithmetic-noether`), §13.1 (`AH.13/function-field-faltings-height`), §5.5 (`AH.5/adelic-hodge-bundle`).
- `ArakelovGeometryAndAbelianHeights:R35.5`: Existing upstream roadmap (PR #1000), cited as it stands: §5.0b the integral minimal compactification of A\_g with an ample power of the Hodge line, §§5.3–5.4 logarithmic growth of the Faltings metric and the Hodge-metrized modular line, which Yuan–Zhang Theorem 5.5.1 uses to build the adelic Hodge bundle. Needed by §5.5 (`AH.5/adelic-hodge-bundle`).
- `ArakelovGeometryAndAbelianHeights:R35.6`: Existing upstream roadmap (PR #1000), cited as it stands: §6.5 Bost's lower bound h\_st,Del ≥ −(g/2)log(2π), i.e. h\_st,Fal ≥ −(g/2)log(2π²). AH.13/bost-lower-bound uses the Faltings form (Yuan p. 78 quotes the Deligne form; source issue ArakelovGeometryAndAbelianHeightsPartII/E1). Needed by §13.7 (`AH.13/bost-lower-bound`).
- `ComplexComparisonPartII:C5`: C5/analytic-cycle-integration, C5/chern-fubini-study-intersection and C5/closed-current-extension supply cycle currents, curvature normalization and finite-mass extension. AH.0/monge-ampere-measures additionally needs the current carrier, Lelong–Poincaré formula, and Bedford–Taylor products for locally bounded plurisubharmonic potentials on possibly singular projective spaces, with monotone continuity. These general pluripotential targets are not supplied by the checked C5 nodes; G2 records the requested extension. The older C5.4 CurrentCalculus label is not a current node. Needed by §0.2 (`AH.0/monge-ampere-measures`).
- `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`: Homological triviality relative to a chosen Weil cohomology, using the geometric base-change convention of MC.2/weil-cohomology-by-base-change over a nonclosed field. This supplies the predicate used for the Gross–Schoen modified diagonal on C³; this roadmap proves that its cycle class vanishes. Needed by §10.10 (`AH.10/gross-schoen-variation`).
- `NeronModelsAndSemistableAbelianVarieties:R11.3`: R11.3/finite-separable-semistable-extension and R11.3/semistable-identity-basechange: finite semistable extension over excellent DVRs and invariance of the identity model under further finite base change. Apply at the finitely many bad places of the global function field; this gives the determinant-of-differentials degree scaling used by AH.13/function-field-faltings-height. No full Néron-model base-change isomorphism is assumed. Needed by §13.1 (`AH.13/function-field-faltings-height`).

## Imported nodes of other roadmaps

- **ArakelovGeometryAndAbelianHeights**: `R35.1`, `R35.2`, `R35.3`, `R35.5`, `R35.6`.
- **ArithmeticDynamics**: `DY.4/canonical-adelic-metric-of-a-rational-map`, `DY.4/equidistribution-for-semipositive-adelic-line-bundles`.
- **ComplexComparisonPartII**: `C5`.
- **GrossZagierAndArithmeticHeights**: `GZ.2/arakelov-dualizing-metric`, `GZ.2/archimedean-admissible-metric`, `GZ.2/explicit-skeleton-measure`, `GZ.2/graph-admissible-measure`, `GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions`, `GZ.2/normalized-arakelov-green`, `GZ.2/real-admissible-descent`.
- **HeightsRationalPointsAndObstructions**: `RP.0/height-class`, `RP.0/normalized-height`, `RP.0/silverman-specialization-limit`, `RP.0/silverman-tate`, `RP.0/tate-limit`, `RP.0/weil-height-machine`.
- **JacobianChallengePartII**: `JC1/relative-jacobian`, `JC2/curve-difference`, `JC2/degree-abel-map`, `JC2/degree-one-closed-immersion`, `JC3/jacobian-poincare`, `JC3/poincare-curve-square`, `JC3/theta-pullback`, `JC3/twice-theta`, `JC3/twice-theta-relatively-ample`, `JC3/twice-theta-symmetric`, `JC4/actual-pullback-torsion-cokernel`, `JC4/bizero-pullback-torsion-cokernel`, `JC4/pointed-square-picard-isomorphism`, `JC5/canonical-abel-map`, `JC5/universal-shift`, `JC6/hodge-line-isomorphism`.
- **MotivesAndAlgebraicCycles**: `MC.2/homological-equivalence`.
- **NeronModelsAndSemistableAbelianVarieties**: `R11.3/finite-separable-semistable-extension`, `R11.3/semistable-identity-basechange`.
- **SchemeAndStackFoundations**: `SF.5/big-line`, `SF.5/chow-group`, `SF.5/degree`, `SF.5/exterior-product`, `SF.5/first-chern`, `SF.5/nef-big`.
- **StableReductionPartII**: `MC.4/fine-level-scheme`, `MC.5/boundary-divisor`, `MC.5/boundary-thickness`, `MC.5/hodge-determinant`, `MC.5/integral-noether`, `MC.5/semi-canonical-noether`, `MC.6/level-stable-compactification`, `MC.6/maximal-variation`, `MC.6/maximal-variation-hodge`, `MC.6/stable-compactification`, `MC.6/stable-compactification-exists`.
- **TropicalAndBerkovichArithmetic**: `TB.0/analytification`, `TB.0/completed-residue-fields`, `TB.0/hybrid-analytic-space`, `TB.0/spectrum`, `TB.2/retraction-to-the-skeleton`, `TB.3/graph-laplacian`, `TB.3/metric-graphs`, `TB.6/formal-model-metrics`, `TB.6/graph-green-and-admissible-measure`, `TB.6/measure-limits-and-local-heights`, `TB.6/model-measures`, `TB.6/model-metric-laplacian`, `TB.6/semipositive-integrable-metrics`.

## Library baseline

- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` (`TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`): The invertible sheaves (locally free rank-one O\_X-modules) on a scheme, the carrier of the underlying line bundles of hermitian and adelic line bundles.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`): Abelian varieties over a field (proper geometrically integral group schemes), the carrier for Tate's admissible metrics on abelian varieties.
- `mathlib:NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean`): The product formula for a nonzero element of a number field, used for independence of heights from the chosen section.
- `mathlib:Projectivization.logHeight` (`Mathlib/NumberTheory/Height/Projectivization.lean`): The relative logarithmic height of a projective point over a field with admissible absolute values; the adelic height of O(1) with max metrics is its normalized version.

The four declarations were checked at Mathlib `082e2d3` and Tau Ceti `f790474`. The height declaration is relative to the ground number field and needs the degree normalization above. The pins supply the underlying algebraic carriers, not the adelic theory. The suggested Lean file states the light boundary-norm definition, coefficient identities, graph numerics and normalization constants that can be expressed there; the remaining theory is a reader-document target.

## Gaps

- **G2. Bedford–Taylor products on singular complex projective varieties.** Yuan–Zhang §2.1.1 uses Bedford–Taylor/Demailly products for locally bounded plurisubharmonic potentials on possibly singular complex projective varieties and Coman–Guedj–Zeriahi regularization. The checked ComplexComparisonPartII C5 nodes supply integration over analytic cycles, curvature normalization and finite-mass current extension, but do not plan this general current/pluripotential construction. The precise request to C5 includes the current carrier, Lelong–Poincaré identity, products, regularization and monotone continuity. This remains an explicit external closure gap.
- **G3. Arithmetic Noether formula.** Faltings, Calculus on arithmetic surfaces (Ann. of Math. 119, 1984), Theorem 6, and Moret-Bailly, La formule de Noether pour les surfaces arithmétiques (Invent. Math. 98, 1989), Théorème 2.5, were not read; the constant 4g log 2π and the normalization of δ are taken from Yuan p. 89 and are consistent with Wilms' formula. A lemma-level plan needs the Quillen-metric proof or Moret-Bailly's Deligne-pairing proof.
- **G4. Gross–Schoen height of the modified diagonal.** The unconditional height of Δ\_ξ uses Gross–Schoen's regular-model construction (Gross–Schoen 1995, Ann. Inst. Fourier), recalled in Zhang 2010 §1.1 but not read in the original; no general Beilinson–Bloch pairing is assumed.
- **G5. Boundary growth of φ and δ from graph data.** Yuan Remarks 3.11 and 4.13(2) assert, without proof, that the adelic divisors Φ̃ and Ξ̃ describe the growth of φ and of Faltings' δ at the boundary of complex moduli (compare Song 2023 and de Jong 2019). These are not targets of this roadmap.
- **G7. Genus one.** Yuan states Theorem 2.3 and Theorem A.1 for g > 0, but the normalization and nefness are proved only for g > 1 (PAPER-YUAN-26/E8, E28). The canonical curve-pair and relative admissible-bundle targets here assume g > 1; genus-one discriminant examples remain valid on their own terms.

## Boundaries with neighbouring roadmaps

- ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructionsPartII: The PAPER-YUAN-26 items on uniform small-points bounds and uniform Bogomolov (Theorems 1.1, 4.2, 4.7, 4.10, 4.17, 4.19 and §§4.4, 4.6; items 119, 120, 128, 142, 143, 145, 147, 149, 171–189, 262–266) are routed to HeightsRationalPointsAndObstructionsPartII (design #3343, not yet designed). They consume this roadmap's AH.4 height inequality, AH.12 potential bigness, AH.13/bost-lower-bound, AH.5/adelic-hodge-bundle and AH.8/canonical-theta-bundle. Proposal: When HeightsRationalPointsAndObstructionsPartII is designed, its uniform-Bogomolov layers import AH.12/theta-potential-bigness, AH.4/height-inequality, AH.12/cross-characteristic-restriction, AH.13/bost-lower-bound and AH.6 (Moriwaki heights for Gao–Habegger Theorem A.3) by node id, and plan nothing of AH.0–AH.13 again.
- ArakelovGeometryAndAbelianHeightsPartII, ArithmeticDynamicsPartIIBifurcation, ArithmeticDynamics: DeMarco–Mavraki–Ye route the Yuan–Zhang machinery (invariant extensions, Deligne pairings along graphs of sections, non-degeneracy, height inequality, equidistribution) here and their bifurcation results to ArithmeticDynamicsPartIIBifurcation. ArithmeticDynamics DY.4 plans the projective-line and projective Yuan equidistribution, which AH.5/equidistribution cites as its projective case. Proposal: ArithmeticDynamicsPartIIBifurcation imports AH.5/invariant-extension, AH.5/non-degenerate, AH.5/non-degenerate-height-inequality, AH.5/equidistribution and AH.3/deligne-pairing. DY.4 keeps the ℙ¹ theory; no change to DY.4.
- ArakelovGeometryAndAbelianHeightsPartII, TropicalAndBerkovichArithmetic, GrossZagierAndArithmeticHeights: Zhang's admissible theory is split three ways: archimedean admissible metrics and the explicit skeleton measure are GrossZagierAndArithmeticHeights GZ.2; metric graphs, model measures and graph Green functions are TropicalAndBerkovichArithmetic TB.3/TB.6; the curve-level non-archimedean canonical metrics, their characterisation through the Jacobian and their families are AH.7–AH.8 here. Proposal: Keep the split. TB.6/graph-green-and-admissible-measure and GZ.2/graph-admissible-measure should cross-reference each other (they plan the same graph measure from two sides); AH.7 imports both and plans no graph theory beyond Zhang's invariants (AH.10/polarized-graph-invariants).
- ArakelovGeometryAndAbelianHeightsPartII, ArakelovGeometryAndAbelianHeights: The parent roadmap stops at ĈH¹ with smooth metrics and heights of points; top arithmetic intersection numbers, the metrized Deligne pairing and arithmetic volumes on projective arithmetic varieties are outside it. AH.0 plans them as the model case of the adelic theory. Proposal: No change to the parent. If a later Arakelov Part III (arithmetic Chow rings, arithmetic Riemann–Roch) is designed, AH.0 is its starting point and stays here.
