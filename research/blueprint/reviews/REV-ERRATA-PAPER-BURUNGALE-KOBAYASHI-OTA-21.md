# REV-ERRATA-PAPER-BURUNGALE-KOBAYASHI-OTA-21 — review of the mistakes recorded in Burungale–Kobayashi–Ota (2021)

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job ERRATA-PAPER-BURUNGALE-KOBAYASHI-OTA-21 was done by Claude Code, session `cc-fb70e5`. The extraction and its review were done by other sessions. This reviewer took no part in any of them.

**Source read.**
- **Paper.** A. A. Burungale, S. Kobayashi and K. Ota, *Rubin's conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966, DOI 10.4007/annals.2021.194.3.8.
- **Version.** The Caltech repository copy of the publisher PDF, the version the errata name, downloaded fresh. Its SHA-256 matches the recorded `77ff3290…790e`.
- **How it was read.** The whole paper was read in the text layer. Pages 949, 952–954 and 956–962 were read as page images.

**Existing corrections looked for.**
- The Annals article page links no erratum.
- Crossref registers no update for the DOI.
- No arXiv version exists, as the errata job found.

## Verdicts on the recorded findings

All eight are confirmed. E1 is reclassified in place.

- **E1: confirmed as a gap, reclassified from "error; affects a stated result" to "gap; affects nothing".**
  - **The arithmetic.** At p = 47 the displayed lower bound of Lemma 5.2(ii) is 0, so the "in particular" does not follow from it. By hand, 47 is the only prime p ≥ 31 where this happens.
  - **The statement is still true.** The proof's own facts give a larger count. Write p − 1 = 12m + 4δ + 6ε. The N(t) table gives N(±2p) = m + δ + ε, and the traces ±p and 0 occur only for j = 0 and j = 1728. So each of the m = ⌊(p−1)/12⌋ supersingular j ≠ 0, 1728 has F_{p²}-models with a_{p²} = ±2p, and each has µ points above it. That gives µm ≥ µ > µ/6 points for every p ≥ 13 (3µ at p = 47).
  - **What the bound is.** The displayed bound equals µ(m − 2δ − ε): valid, but weaker. Only its use for the "in particular" at p = 47 fails.
  - **What was edited.** The kind, affects, correction and reason are updated in the JSON, and the explanation in the `.md`.
- **E2 (misprint): confirmed.**
  - The paper prints "order l^m" on p.952 and in Proposition 3.3, but uses l^m as the conductor in z_{fl^m}, (3.6)–(3.7), the proof of 3.3(3) and p.954.
  - For l split, the part of the ring class group at l has cyclic l-Sylow subgroup of order l^{n−1} at conductor l^n. So a character of exact order l^m has conductor l^{m+1}, and L_m (degree l^m) is not inside K(fl^m p^{n+1}).
  - The entry's phrase "l-part … of order (l−1)l^{n−1}" means the whole local factor. Its conclusion is right.
- **E3, E4, E5, E6, E8 (misprints): confirmed** on the page images: [Φ′_s : Φ] (p.958), σx_s and ∆ (p.959), the missing star (p.959), and Gal(Ψ_n/Ψ) (p.962).
  - **E4.** The first-type superlattices have conductor p^{s+1}.
  - **E5.** Only ∆′, of order p + 1, acts on the points over Ψ′_1.
- **E7 (gap): confirmed.** I derived δ₁ = (1 − π^{−1})δ = (1 + p^{−1})δ independently.
  - **Derivation.** It comes from Coleman's norm relation ∏_{w∈F[π]} f(X[+]w) = f([π]X): take the logarithmic derivative, divide by λ′ and set X = 0.
  - **Why δ factors.** The trivial character lies in Ξ⁺. So δ vanishes on V^{∗,−}_∞, and δ is well defined on V^∗_∞.
  - **A cross-check.** The same factor 1 + 1/p is exactly what reconciles (3.6) with (3.7).

## Findings added by this review (both confirmed, both reaching nothing)

- **E9.** Lemma 5.1(ii) reverses the sign.
  - With a_{p²} = ±2p the Frobenius is ±p, and [π] of a Lubin–Tate group reduces to it. So the parameter is ±p, and the Honda type is ∓x² + p.
  - The paper's own §5.0.1 shows this: E/Q with a_p = 0 has a_{p²} = −2p and Ê ≅ F with parameter −p. Honda's type x² − a_p x + p agrees.
  - Only "Â is Lubin–Tate" is used.
- **E10.** In the proof of Lemma 5.2, "the ramification index of π̄ at elliptic points" should refer to X_0(N) → X(1). π̄ is the modular parametrization.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json` reports `ok`.

**Checked and not recorded.**
- **Lemma 3.1.** The proof passes: d ≡ 1 mod 8 and (d/p) = −1 (p ∤ n), and h(d) < p fails exactly for p ≤ 47.
- **Proposition 3.3(3).** The sign computation passes.
- **Theorem 5.5.** The trace relations pass: Tr y₁ = −(p+1)x₀ = −y, and y₀ = T_p x₀ = 0.
- **Signs in §§2 and 6.** Theorems 2.4, 6.1 and 6.2 print Ξ^{−ε} correctly; the text layer loses the superscript.
- **"We pick N = 27 / N = 32" (p.958).** This reads as choosing E of conductor 27 or 32, for which X_0(N) has no elliptic point of the relevant order. It is not recorded as a mistake.
- **Bibliography.** It was checked against Crossref by DOI.
  - [1]: Crossref gives 611–622; the paper prints 611–621. The last page may be blank.
  - [27]: Crossref gives 81–149 without Fontaine's appendix; the paper prints 81–161.

  Neither is recorded.
- **The interpolation formula in §6.0.1.** Its use of χ versus χ^{−1} depends on Rubin's conventions in [33, Lem. 2.1], which was not read.
