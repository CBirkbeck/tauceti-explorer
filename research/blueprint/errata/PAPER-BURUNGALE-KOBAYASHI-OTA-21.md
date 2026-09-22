# Mistakes in Burungale–Kobayashi–Ota, *Rubin's conjecture on local units in the anticyclotomic tower at inert primes*

Job ERRATA-PAPER-BURUNGALE-KOBAYASHI-OTA-21. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-BURUNGALE-KOBAYASHI-OTA-21.json` beside this file.

**Paper and version read.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, Annals of Mathematics 194 (2021), 943–966, DOI 10.4007/annals.2021.194.3.8. The version read is the published version, the Caltech repository copy of the publisher PDF (SHA-256 `77ff3290…790e`, as the extraction records). Printed page = PDF page + 941.

**Earlier work.**
- The extraction PAPER-BURUNGALE-KOBAYASHI-OTA-21, by Codex, silently used the corrected reading in E2–E6 and E8.
- Its independent review REV-PAPER-BURUNGALE-KOBAYASHI-OTA-21 (PR #1685) flagged those corrections and found E1 and E7.
- This job re-read every passage.

**Existing corrections.** None was found:
- the Annals article page links no erratum;
- no arXiv version of the paper was found;
- a web search found nothing;
- the later extension to p = 3 (arXiv 2401.09037v2) mentions no correction;
- neither Burungale's homepage nor the Kyushu University portal entry shows one.

All eight findings are new.

**Effect on the main results.** None. Rubin's conjecture for p ≥ 5 (Theorem 1.2) and the p-adic BSD inequalities of §6 stand. E1 is a false "in particular" whose case is covered by the next part of the same lemma. The rest are misprints and one unstated step.

**Not recorded here.** BKO themselves correct two mistakes in Rubin's 1987 paper, reference [33]:
- the sign of the Tate-module generator, which differs by (−1)^n from BKO's (p. 948 and footnote 2), with the sign errors this causes in [33];
- "a minor sign error in [33, Th. 3.2]" (p. 961).

These are corrections in print of another source. They belong to that source's errata, with this paper as `known`.

---

## E1. Lemma 5.2(ii) at p = 47 (error; affects a stated result)

**What the paper says.** The number of supersingular points of X₀(N)(F_{p²}) with a_{p²} = ±2p and j ≠ 0, 1728 is at least µ(⌊(p − 1)/12⌋ − 3/2 + (−3/p) + ½(−1/p)). "In particular", such a point unramified for the modular parametrization π exists "if p ≡ 1 mod 12 or p ≥ 31".

**Why it is wrong.** The deduction needs the lower bound to exceed µ/6, the bound on ramification points from part (i). At p = 47 we have ⌊46/12⌋ = 3, (−3/47) = −1 and (−1/47) = −1, so the lower bound is µ(3 − 3/2 − 1 − 1/2) = 0 and proves nothing. A computation over all primes 31 ≤ p ≤ 400 finds 47 as the only failure, and for larger p the floor term dominates.

**Correction.** The conclusion of (ii) holds for p ≡ 1 mod 12 and for p ≥ 31 with p ≠ 47. At p = 47 ≡ 2 mod 3, part (iii) supplies the unramified supersingular point (with j = 0).

**Effect.** None on the theorems. The construction in §5 (p. 957) takes its point "which exists by Lemma 5.2(ii), (iii)", using both parts together, and Rubin's own verification (Remark 2.3) covers small p in any case. Remark 5.3's suggestion to skip (iii) when p ≥ 31 is not quite right at p = 47, but it does no harm for the same reason.

## E2. "Order" for "conductor" of the auxiliary character ν (misprint; affects nothing)

§3.0.2 and Proposition 3.3 take ν ∈ X_l "of order l^m". The construction around them treats l^m as the conductor of ν:
- ξ_ν is built from the elliptic unit z_{fl^m} over K(fl^m p^{n+1});
- the proof of Proposition 3.3(3) speaks of "the conductor fl^m of ϕν";
- the proof of Theorem 3.4 says "let l^m be the conductor".

For l split in K, the l-part of the ring class group of conductor l^n is (Z/l^n)^×, of order (l − 1)l^{n−1}. So a character of exact order l^m with m ≥ 1 has conductor l^{m+1}. The consistent reading is that l^m is the conductor of ν throughout, with the anticyclotomic layer indexed to match. Nothing else in the argument changes.

## E3. [Φ′_s : Φ] for [Ψ′_s : Φ] (misprint; affects nothing)

On p. 958 the local ring class field Ψ′_s is described as "of degree [Φ′_s : Φ] = p^{s−1}(p + 1)". No Φ′_s occurs in the paper; the degree meant is [Ψ′_s : Φ].

## E4. σx_s for σx_{s+1} (misprint; affects nothing)

In the proof of Theorem 5.5(ii), the lattices of the first type are said to be "of the form σx_s with σ ∈ Gal(Ψ′_{s+1}/Ψ′_s)". These are the index-p superlattices of forward conductor s + 1, so the correct form is σx_{s+1}. The relation derived immediately afterwards, T_p x_s = Σ_σ σx_{s+1} + x_{s−1}, uses x_{s+1}.

## E5. ∆ for ∆′ in the case s = 0 (misprint; affects nothing)

"When s = 0, there exist p + 1 lattices containing T with index p, which are permuted by ∆. Hence T_p x = Σ_{σ∈∆} σx₁." The group meant is ∆′, defined on the same page as the torsion subgroup of Gal(Ψ′_∞/Φ) ≅ Z_p × Z/(p + 1)Z. It has order p + 1, and Definition 5.4 sums over it. The group ∆ = Gal(Φ₀/Φ) of §2 has order p² − 1. The formula should read T_p x₀ = Σ_{σ∈∆′} σx₁.

## E6. A missing star in Corollary 5.6 (misprint; affects nothing)

"In particular, V_∞/V^{∗,−}_∞ and V^{∗,−}_∞ are free Λ-modules of rank 1." The quotient meant is V^∗_∞/V^{∗,−}_∞. That is the module the proof of Theorem 5.8 identifies with Λ on the strength of this corollary.

## E7. Why δ factors through V^∗_∞/V^{∗,−}_∞ (gap; affects nothing)

The proof of Theorem 5.8 begins "Consider the Coates–Wiles derivative δ : V^∗_∞/V^{∗,−}_∞ → O". δ is defined on the whole unit module, and the paper does not say why it vanishes on V^{∗,−}_∞. The reason is short. On U^∗_∞, δ₁ = (1 − π^{−1})δ = (1 + p^{−1})δ, where δ₁ is the character derivative at the trivial character. The trivial character lies in Ξ⁺, and V^{∗,−}_∞ kills δ_χ for every χ in Ξ⁺. Hence δ vanishes on V^{∗,−}_∞.

## E8. Gal(Ψ_n/Ψ) for Gal(Ψ_n/Φ) (misprint; affects nothing)

In the definition of the signed local conditions (§6.0.2), F^±(Ψ_n) consists of the points killed by λ_χ "for all χ ∈ Ξ^± factoring through Gal(Ψ_n/Ψ)". No field Ψ is defined. The characters are those of the anticyclotomic tower over Φ, whose n-th layer is Ψ_n, so the group meant is Gal(Ψ_n/Φ).
