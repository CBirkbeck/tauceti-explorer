# FIX-PKG-RefinedTraceMethods~adv3

Issue #11406. Claude (Opus 5.5), session `claude-ED03r3`, 2026-10-20. The bot confirmed the claim at 12:55 UTC. This is a completed fix, not a checkpoint. No second job was taken.

## Inputs

The issue's "READ FIRST" file `research/blueprint/reviews/REV-PKG-RefinedTraceMethods~adv.md` does not exist. I read:

- the two existing package reviews, `REV-PKG-RefinedTraceMethods~codex.md` and `~codex2.md`. The latter accepted the package; its open items are follow-ups for other roadmaps.
- the findings this job names: R3 and R4 of `research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md` and its handoff.
- the maintainer's de-cycling decision: the order is HabiroCohomologyFoundations → HabiroRings → RefinedTraceMethods → HabiroCohomologyFoundationsPartII. This package cites the first two and never Part II.
- PACKAGE_REVIEW.md and UPSTREAM_GUIDE.md.
- the HabiroRings, HabiroCohomologyFoundations and Part II packages, and the Part II packet (request `HT-RT-framed`).
- the upstream PrismaticCohomology and PrismaticCohomologyPartII READMEs on their PR branches (#1057, #1065).

## Finding → change

| Finding | Change |
| --- | --- |
| R3: RT cites the former HR.6 étale Habiro–Hodge comparison | Retargeted to HabiroCohomologyFoundations §4.21 (W-Hab Corollary 3.13, p.27; `HabiroHodgeDescent.etale` of its §4.28). This covers the scope paragraph, the HabiroRings and HabiroCohomologyFoundations contracts, §6.14 (Corollary 6.15 statement, construction and *Needs*) and the Layer 6 Dependencies. HabiroRings is now cited only by HR.1, HR.2 and HR.5, with exported names. Its number-field statements are cited by §5.8 (`etale_localization_away_discr`) and §5.9 (`HabiroRings.relativeHabiro.numberFieldEquiv`) instead of the stale `HR.5-number-field-comparison/...` anchors. HR.6 is stated as unused. |
| R4: full framed KU 6.10 has two ownership records | §6.10 is renamed "Arithmetic gluing, the global comparison and framed smooth algebras". It now owns the full framed targets, replacing the ℤ[x]-only paragraph. The new statements are listed below the table. |
| Ordering (maintainer decision) | No citation of HabiroCohomologyFoundationsPartII as a supplier. The scope paragraph that said HabiroCohomologyFoundations Layers 6/9 are applications of this roadmap now names Part II as the consumer and says that no construction here uses a trace statement of HabiroCohomologyFoundations. Downstream consumers no longer claims that HabiroCohomologyFoundations or HabiroRings use this roadmap; it lists exactly what Part II imports. §8.8 no longer calls itself "the trace input for HQ/HR descent". |

The new §6.10 statements for R4 are:

- `QHodgeTrace.CompatibleSphericalLifts.ofFramed` / `ofFramedE2` (KU Examples 6.7–6.8). At 2 the (E₁) datum comes from the perfectoid cover, which gives the addendum (R₂).
- `qPDDiagonal`, with `diagonalNumerator`, `diagonalNumerator_shift` and `diagonalNumerator_one` (KU Lemma 6.11; Pridham Lemma 1.3).
- `framedCech` (KU 6.12, Lemma 6.13).
- `framedTrace` with `.resolution`, `.modBeta` and `.twoAdic` (KU Theorem 6.10). The 2-adic comparison of the perfectoid and polynomial resolutions is a stated target: KU Remark 3.10 indicates it without proof.
- `framedTrace_completed`, `framedTrace_pair` and `framedTrace_einfty` (KU Remark 6.14, Remark 4.28). The h-complete filtration on qΩ is kept apart from the uncompleted pair pulled back to qdR.
- ℤ[x] (Raksit; KU Theorem 1.4), d = 0 and ℤ[x,y] are Checks.
- `Suggested.lean` gains the three `diagonalNumerator` declarations, all proved, and three examples.

The contracts were extended to the supplier sections these targets use:

- HabiroCohomologyFoundations §§1.14, 1.17, 4.1, 4.4, 4.8 and 4.21–4.23;
- PrismaticCohomology Layer 0 (§0.59);
- PrismaticCohomologyPartII §§5.1–5.8 (`QCrys.envelope`; BS Lemma 16.10);
- HabiroRings §1.2: perfectly covered implies torsion free, so every Ŝ_p is p-torsion free.

References [Pri] and [Stacks] were added.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `ofFramed` / `ofFramedE2` | d = 0 (étale); S = 0; A = ℤ[1/2] (no datum at 2); A = ℚ (all completions zero); x ↦ x² over ℤ (finite flat, not étale); p = 2 with the (E₂) choice | Hypotheses correct. The (E₁) branch needs Ŝ_p p-torsion free, which is automatic (HabiroRings §1.2). At 2, only the (E₁) branch gives ψ⁰. | Checks `.etale`, `.not_etale`, `.not_at_two` |
| `diagonalNumerator`, shift, value at q = 1 | d = 0, 1, 2; q = 1; the classical numerator (x−y)² | Shift identity and q = 1 value hold for all d (proved in Lean). The classical numerator leaves (q−1)²xy. | Lean examples for N₀, N₁, d = 2 and the residue |
| `qPDDiagonal` | λ¹ and λ² computed by hand from ψ²; ∇_{q,y} derived; p = 2, where N₂ ≡ x²−y² modulo 1+q; Wagner's (q;q)_d normalisation | Pridham Lemma 1.3, with x and y exchanged, gives δ^{(d)}/(q−1)^d. With Wagner's Pochhammer normalisation the displayed λ-ring and x-derivative formulas are off by (−1)^d and −(q−1)^{−1}. | Check `qPDDiagonal.pochhammer_sign`, `.prime_level` |
| `framedCech` | n = 0; S = P; d = 0 with S = ℤ[1/2][i] over ℤ[1/2]; p = 2 with classical divided powers | **Source gap.** Wagner's q-D^n inside (S^{⊗(n+1)}⊗ℚ)[[h]] is wrong when S ⊗_P S ≠ S. The coordinate differences generate the diagonal ideal J_n only up to an idempotent. For d = 0 with S = ℤ[1/2][i], the literal ring gives the totalisation ℤ[1/2][[h]] instead of S[[h]]. The p-adic corner, a q-PD envelope, kills the extra factor automatically; the q-D ring does not. | q-D^n is now formed after completing along J_n. Checks `.diagonal_completion`, `.not_classical` |
| `framedTrace` | d = 0 (h-adic); d = 1 (Raksit); d = 2 over ℤ (no prime inverted); reduction by β against the h-adic filtration; p = 2 | Holds at every prime for the intrinsic filtration (Lemma 6.13 uses identity-cover (E₁) data over P^n). Identifying it with the (E₁) filtration at 2 is `.twoAdic`, a target. | Checks `.line`, `.etale`, `.plane`, `.not_hAdic` |
| `framedTrace_pair`, `_einfty` | ℚ[x^{±1}] (qdR ≠ qΩ); d = 0 (H = H_{S/A}); an E₂ lift at an odd prime (only E₁); the q-Leibniz rule on x·x | The completed and uncompleted objects are kept separate. E∞ follows from Remark 4.28 with n = ∞, since the choice at 2 is (E₁). | Checks `.uncompleted`, `.etale`, `.level`, `.notNaiveProduct` |
| Corollary 6.15 (retargeted) | F = ℚ, Δ = 6; Δ = 1, 2 (ring exists by HabiroRings §5.8, but 6 ∤ Δ); the pair of an étale algebra | The h-adic pair is forced on étale R (HabiroCohomologyFoundations §4.21). 6 \| Δ is kept separate from the discriminant condition. | Construction step now cites §4.21 and the case d = 0 of the framed pair |
| Ordering | grep for Part II as a supplier; the HR and HCF Layer 1–5 citations of this roadmap | No upward citation from this package. HR and HCF Layers 1–5 cite RT only as a consumer. | — |

The README and Lean generality agree: `diagonalNumerator` is over ℤ for every d. The framed theorems are stated for every base of §6.1, every relative dimension and every prime.

## Validation

- `lean-check research/blueprint/packages/RefinedTraceMethods/Suggested.lean` (memory checked first): exit 0, with only the four existing `sorry` warnings (lines 56, 158, 215, 224). One iteration fixed a type ascription in the new example.
- `python3 research/blueprint/intake.py check-files` on README.md and Suggested.lean: 0 problems. `review.json` parses. `git diff --check` is clean.
- 100 Checks blocks (was 95), each with at least three entries.

## For the next jobs

- **HabiroCohomologyFoundationsPartII (its next fix or review).**
  - Delete its §§3.1–3.2 copies of `framedTrace`, `framedTrace_einfty`, `qPDDiagonal` and `framedCech`, and its Lean `diagonalNumerator`, `diagonalNumerator_shift`, `diagonalNumerator_one` and the degree-two example. Import RT §6.10 instead: `framedTrace`, `framedTrace.twoAdic`, `framedTrace_completed`, `framedTrace_pair`, `framedTrace_einfty`, `qPDDiagonal`, `framedCech`.
  - Its `TraceInput.ofFramed` is RT's `QHodgeTrace.CompatibleSphericalLifts.ofFramed`. Its `framedTrace_habiro` and §3.3 `canonicalFramedTrace` stay in Part II, consuming `framedTrace_pair`.
  - Part II's §3.2 definition of q-D^n has the same J_n-completion gap as the source; RT's corrected form should be imported.
- **HabiroCohomologyFoundations (FIX-PKG-HabiroCohomologyFoundations~adv4, #11401).** R1 is still pending there: Layer 6 §§6.1–6.5, the trace clause of §8.1 and §9.15's trace comparison still cite RT. Until R1 is applied, that file keeps the HCF ↔ RT cycle from its side. Nothing in RT depends on those sections.
- **HabiroRings.** Its section "Étale comparison in HabiroRingsPartII" states the same étale identification as HabiroCohomologyFoundations §4.21. As the maintainer directed, RT cites §4.21; the maintainer may want HabiroRings to point there too.
- **Source issues for errata:**
  - KU 6.12/Lemma 6.13: completion along the diagonal is missing (above).
  - KU Lemma 6.11: the Pochhammer normalisation of the displayed formulas is off by signs.
  - KU proof of Corollary 6.15: cites QH 3.12 for Corollary 3.13 (already recorded).
  - KU Example 6.7 cites HA Theorem 7.5.4.3 for étale lifting; RT keeps HA Theorem 7.5.0.6, which the previous review verified, and I did not check 7.5.4.3.

## Sources and hygiene

These sources were read in scratch only. All were accessed 2026-10-20, and the SHA-256 hashes match those recorded in the Part II review:

- KU arXiv:2510.06057v1: Examples 6.7–6.9, Theorem 6.10, Lemma 6.11, 6.12–6.13 with proofs, Remark 6.14, Corollary 6.15; 3.9–3.11; 4.18, 4.18a, 4.24–4.29 with footnote 4.6.
- QH arXiv:2510.04782v2: Corollary 3.13, Remark 3.6.
- Pridham arXiv:1608.07142v4: Remark 1.2, Lemma 1.3.
- Stacks Tag 07L7 (Example 60.19.1), read online.

No uncleared book was used. No source text was put in the repository. No suspicious instruction was found in issue comments, pull-request text or fetched pages. No fetched content was executed. The scratch directory is deleted after the pull request opens; nothing here depends on it.
