# Fix: EllipticRegulators package after its adversarial review

Issue [#11116](https://github.com/CBirkbeck/tauceti-explorer/issues/11116), `FIX-PKG-EllipticRegulators~adv`.
Claude (Opus 5.5), session `claude-sRrZIM`, 2026-10-19. **Complete.** This session did not write or review the package.

## Findings and dispositions

The adversarial review (`reviews/REV-PKG-EllipticRegulators~adv.md`, Codex `codex-FHh5IB`) had already applied its correctable fixes to
`README.md` (tame-sign and scaled-Steinberg argument in §3.10, the `r_D = 2r_E` label in §5.14, character conjugations in §§7.6–7.15,
weighted rational descent in §7.26, Shimura's primitive Gauss sum and coherent periods in §7.30, light-definition APIs and negative
controls, Siegel and Asakura–Chida locators). Those fixes were re-read and kept. Its single residue was the blocker addressed here.

| Finding | Disposition |
|---|---|
| Bloch's CRM Monograph 11 could not be read, so the truncation estimates (§§3.11–3.15), the Layer 4 normalisations and direct Fourier attributions, the general CM constructions (§§5.6–5.18) and the claimed misprints of the book were unverified. | Resolved by making no statement rest on the book. The book is not freely available (AMS bookstore and book pages refuse access; Bloch's own publications page has no copy; it is not in the cleared library). Every Bloch locator was removed except the three that a free source cites: Theorem 10.2.1 and Lemma 10.2.2 (p. 77) and (8.1.4) (p. 62), all cited by Brunault's thesis, pp. 23–24. Each statement credited to Bloch is now sourced to free sources (Brunault's thesis; Goncharov–Levin, arXiv:alg-geom/9508008v4; Zagier 1990; Dokchitser–de Jeu–Zagier for history) or is proved in the README, and is pinned by computation (below). All assertions about the text or misprints of the book were removed from the README and are listed at the end of this note for a reader with a copy. The opening source-gap paragraph became a "Sources for Bloch's results" paragraph. |
| §§3.11–3.15 (truncation proof) depended on Bloch's lemma numbering. | Rewritten as the roadmap's own lemmas with own proofs: the theta product is defined explicitly (`F = Π_r F₀(q^r w)`, `F₀(0) = 1`, `F₀(∞) = 1`), and (i), (iii), (iv), (a), (b) carry their arguments. They are marked as a second proof, which no later layer uses. **New correction:** in §3.12(iv), the total `Σ e log|β|` over the zeros and poles of `F_N − K` is `0`, because `F_N − K` takes the value `1 − K` at both `0` and `∞`. The README had `log|1 − K|`. The conclusion `O(Nε) + O(1)` was unaffected. Added a Check (degenerate case and the `K = 3` non-example). |
| §3.16 (descent of `R_q` to `K₂`) rested on Bloch's Theorems 8.1.2/8.1.5. | Proved by the free Stokes route: §3.9 (Brunault, Propositions 17, 18 and 26; Goncharov–Levin §3.3, Lemma 3.22, pp. 21–22) gives `r_E = ½ conj R_q((f) ⋄ (g))`. Brunault's Lemme 15 then gives the vanishing on `{F, 1 − F}`, the §3.10 expansion handles `K ≠ 0`, and oddness handles `K = 0`. Added three Checks and the Lean statement `ellipticR_diamond_steinberg`. |
| Layer 4 Bloch locators (§§4.1–4.18). | Convention §4.1 now tied to the divisor formula and to Goncharov–Levin's Bloch map (§3.1, p. 11, its reflection). §§4.6–4.16 carry no book locators; their closed forms were recomputed (below), and a deterministic witness was added to §4.16. The §4.3 Check now names an explicit permitted lift (one origin lifted to `q⁶`), whose value was recomputed. Renamed `finiteFourier10` to `torsionFourier` (README and Lean), because the old name pointed at a lecture number. |
| Layer 5 Bloch locators and "printed scalar" claims. | The scalar is stated as derived in §5.14. The former erratum statements became mathematical non-examples: an extra `|μ_κ|`, the opposite kernel, and the unit index set at level 14. Credit: Brunault §0.5, p. 11; Goncharov–Levin §1.2, pp. 2–3; Dokchitser–de Jeu–Zagier §1, p. 1. §5.1's Lang citation via Bloch was replaced by CM.4. |
| Layers 6 and 8 Bloch references. | §6.1 now cites §2.3 alone. §6.2's original-conjecture remark now cites Dokchitser–de Jeu–Zagier §3, p. 5. §§8.2–8.4 now refer to "Layer 5's identity", and the factor-6 control became a non-example. |

## Computations (standard-library Python, double precision; scripts were scratch only)

- CM theorem (§§5.14–5.18), all from the definitions: the index set comes from `W` and `χ`, and `Γ = g·H_χ(ḡ)` comes from the pairing.
  - 32a2, `C = 4`: `Γ = 2`, index `{1, 3 + 2i}`. `L(E, 2)` from the functional-equation series is `0.917050635318655`, and `(π/2)ΣD_q` agrees to `2·10⁻¹⁶`. `64·R_q(U) = 37.364004269191i`.
  - 36a1, `C = 6`: `Γ = 3`, index points `(1,0), (3,2), (5,4)`, agreement `2·10⁻¹⁵`.
  - 49a1: at `C = 7`, `Γ = 7` with 21 orbits; at `C = 14`, `Γ = 28` with `|W| = 168` and 84 orbits. Both agree to `2·10⁻¹⁵`, and the 21 unit orbits at level 14 give exactly `2·L(E, 2)`.
  - The complex form `π Γ/(i y² C⁴)·R_q(U)` gives the same values.
- Finite Fourier identity and direct route (§§4.7–4.16): random odd complex `f` at `(τ, C) = (0.1+1.1i, 5), (0.37+0.83i, 3), (−0.2+1.3i, 4)`. The orbit sums `L, M, B` agree with the closed forms of §§4.10, 4.11 and 4.14 to `≤ 2·10⁻¹²`. The raw identity, the regularised identity and `A + iV = J_q + iD_q` also hold. The deterministic witness in §4.16 is new.
- Steinberg (§3.16): degree-two theta quotient at `τ = 0.23 + 1.05i`, `K ∈ {0.6 − 1.3i, 2.5, −0.4 + 0.9i}`. `|R_q((f) ⋄ (K − f))|` and the permitted-lift `J_q` sum are both `< 2·10⁻¹⁴`.
- Lift formula (§4.3): `−0.5197242503939 + 59.4385831263844i` for the stated permitted lift. Moving one point of the `(f_{1/4})` lift by `q` gives `−1553.008…` with Bloch's `J_q` and leaves `R_q` unchanged.
- §3.7: `R_{q(−1/τ)}(x′) = R_q(x)/τ̄` to `10⁻¹⁴`; the `y²`-fixed alternative is off by 30%.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §3.11 (i) no zeros off `A_{N+R}` | `F₀(0)`, `F₀(∞)` from `Σd = 0`, `Πα^d = 1`; `K = 1` | Needs `K ≠ 1`; bound uniform in `N` | Own proof written |
| §3.12 (iv) stray log-sum | `F_N − K` at `0`, `∞`; empty divisor; `K = 3` | Total is `0`, not `log|1−K|` | Corrected; Check added |
| §3.13 (a), (b) | Expansion of `J_q` by `J(1/z) = log²|z| − J(z)` | Tails over `n > N` exactly as stated | Derivation written |
| §3.14 Steinberg, companion | `K = 0` (oddness), `K = 1` (continuity), critical `K` | Holds for `K − f ≠ 0`; count `1 + 2⌊N(1−ε)⌋` | Book labels removed |
| §3.16 descent | `K = 0`, constants, unrelated pair of §2.5 | Zero for `{f, K − f}`, nonzero otherwise | Stokes proof, Lean theorem, 3 Checks |
| `ellipticR_diamond_steinberg` | `f` constant (empty divisor), `K − f ≡ 0` excluded by `hfK`, `K = 0` | True in every case; README generality = Lean | New |
| §4.1 convention | Goncharov–Levin map | Reflection; `R_q` odd, so the sign flips | Reworded |
| §4.3 lift | Origin moved `q⁶ → q⁷` (undetected, equal moduli); `(f_{1/4})` point moved by `q` | Second is the discriminating control | Explicit lift stated |
| §4.4 normalisation | `C = 1`, `1/C` vs `1/C²` | Unchanged | Renamed only |
| §§4.10–4.16 | 3 τ, `C = 3, 4, 5`, complex odd `f`, row-supported `f` | All agree `≤ 2·10⁻¹²` | Witness added |
| §5.15 scalar | `|μ|` factor, opposite kernel, unit index | Fail as stated (`−4L, −6L, −2L, 2L`) | Non-examples reworded |
| §6.2 original form | DJZ §3 p. 5 | Rank exceeds `g` already for `g = 1` | Re-sourced |

## Lean

`lean-check research/blueprint/packages/EllipticRegulators/Suggested.lean`: exit 0. There are 27 warnings, all `declaration uses sorry`, and no errors (26 before, plus `ellipticR_diamond_steinberg`). The file has 491 lines. `scripts/check_sorry_data.py` passed, and `intake.py check-files` on the package files reports 0 problems.

## Sources read (all free; data only, no instructions found)

- Brunault, thesis, arXiv:math/0602186v1 (SHA-256 `8fd73fab…94fb7`): §0.5 p. 11; Théorème 21 and its proof sketch, pp. 23–24 (the source of the three kept Bloch numbers); Propositions 17, 18, 26.
- Goncharov–Levin, arXiv:alg-geom/9508008v4 (`f1478cb5…bf60a`; printed page = PDF page − 1): §1.2, pp. 2–3 (CM torsion statement); §3.1, p. 11 (Bloch map `f ∗ g⁻`); §3.3, pp. 21–22, Lemma 3.22 (the regulator via `K_{2,1}`).
- Zagier, Math. Ann. 286 (author scan, `e56ae905…193bf`): pp. 615–616.
- Dokchitser–de Jeu–Zagier, arXiv:math/0405040v2 (`a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`): §1, p. 1; §3, p. 5.
- Rolshausen–Schappacher, MPIM preprint 1997-94 (PostScript only; not used; no PostScript reader on the machine).

## Inherited claims about Bloch's text, removed and still unverified

These were in the README, credited to the lectures. They may be right, but they need collation against an authorized copy before any errata job restores them. In each case the README now states the mathematics without reference to the text.

1. Theorem 11.2.1 / (11.2.4): an extra factor `|μ_κ|`, said to come from (11.2.1), p. 91, omitting the division by `|μ|`.
2. (11.1.1), p. 87: the kernel `⟨y, x⟩`, giving `−F̂` for odd `F`; (11.1.2) said to hold for the dual-first transform.
3. Lemma 11.1.2, p. 88: printed `sin(2π[an − bm]/C)`.
4. (11.2.3), p. 92: index set `(O/CO)^×/μ_κ`, too small when `g` has a prime not dividing `f`.
5. Lemma 11.1.3, pp. 88–89: a factor from `y` in place of `y′²`.
6. Lemma 8.1.4, p. 62: printed proof drops a sign.
7. Lemma 10.2.3: printed `ℓ³/3c³`.
8. (10.3.1): conjugation of the denominator lost.
9. Lecture 11 cites "Theorem 10.3.2" for 10.2.1.
10. Theorem 9.1.1: continuity reduction asserted without proof, and `e_k = ±1` "for simplicity".
11. The constant `log|1 − K|` of Lemma 8.2.4 (see the §3.12 correction above).
12. The boundary-term parenthesis before (10.3.2), p. 80.
13. All other lemma, equation and page numbers of Lectures 8–11 previously cited (8.1.1–8.1.6, 8.2.1–8.2.4, 9.1.1–9.1.5, 9.2.1–9.2.3, 10.1.2, 10.2.1 transform, 10.2.3, 10.3.1–10.3.5, 11.1.1–11.1.7, 11.2.1–11.2.4, and Lang's Theorem 10, p. 140, via Lecture 11).

Earlier part reviews (ER.4, ER.5) report reading a "publicly available HTML" of the lectures. The book is not legitimately free, so that copy was not sought and should not be used.

## What remains

Nothing for this fix. Possible follow-ups:

- A sources/errata job with an authorized copy of CRM 11 could restore the items above as recorded errata.
- If the Rolshausen–Schappacher preprint gives a free published account of the truncation proof, it could be read and cited for §§3.11–3.15.
