# REV-ERRATA-PAPER-KISIN-ZHOU-25 — review of the mistakes recorded in Kisin–Zhou (2025)

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job ERRATA-PAPER-KISIN-ZHOU-25 was done by Claude Code, session `cc-fb70e5`; this reviewer took no part in it.

**Correction, 23 September 2026: this review is not independent.** An earlier line here said the reviewer took no part in the paper's extraction. That was false. The same session, Claude Code `cc-442dc5`, completed the extraction PAPER-KISIN-ZHOU-25 (PR #2152, Refs #1069). In doing so it kept and rechecked the checkpoint findings, including E1–E4. The verdicts below therefore re-examine findings this session had already checked. They should not count as an independent review until a different agent re-reviews them. The error was found by the reviewer, not reported by anyone else.

**Source read.**
- **Paper.** M. Kisin and R. Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, Annals of Mathematics 202 (2025), 1077–1156.
- **Version.** arXiv 2103.09945v2 (7 October 2024), the version the errata name, downloaded fresh from arXiv. Its SHA-256 matches the recorded `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.
- **How it was read.** The four locators (pp. 23, 25, 34 and 52) were read as page images.
- **Not collated.** The published Annals text is behind a paywall and was not collated, as the errata say.

**Existing corrections looked for.** arXiv v2 is the latest version, and no erratum is linked from the Annals page.

## Verdicts

- **E1 (misprint): confirmed.** a_G̃ is defined with an undefined A_E where A_G̃ is meant; the maximal ideal m_{A_G̃} is introduced just before. As printed, the isomorphism c relates modules over Ŵ(A_G̃/a_G̃) and over Ŵ(A_G̃). The very-good condition c(s_{α,0} ⊗ 1) = s_{α,0} ⊗ 1 is a statement modulo a_G̃, so both sides must be base-changed there.
- **E2 (misprint): confirmed.** T_pG^∨ is a Z_p-module, so (3.3.2.1) is ⊗_{Z_p}. The isomorphism takes the étale tensors s_{α,ét} ⊗ 1, not s_{α,0}, to s̃_α. §3.3.3 on the same page restates the induced isomorphism exactly in this form.
- **E3 (misprint): confirmed.** Proposition 4.2.3(5) prints "torsion". Its proof on the same page applies Lemma 4.2.4, whose hypothesis is "X_*(G^ab)_I is torsion-free", and the reason given is the torsion-freeness criterion.
- **E4 (misprint): confirmed.** In Lemma 5.2.5 the translation lift ṫ_λ lies in G(F_q((t))). If it lay in G(F_q[[t]]), the lemma would concern only the base point. The proof uses only its F_q-rationality, to run Lang's theorem.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-KISIN-ZHOU-25.json` reports `ok`.

**Search for missed mistakes.** This review did not re-read the whole 63-page paper. It read each locator page in full, as a page image, and found no further mathematical slip on pp. 23, 25, 34 or 52. In particular it recomputed the matrix product in Case (3) on p. 52 (the element t̂_{α∨}^{−1}u_+(−2x^{−1}, 2x^{−2})^{−1}u_−(x, −x²/2)) and found it correct. Language slips on p. 23 ("equivalent the condition", "and and") are not recorded.

## Question for the orchestrator

**Scope of this review.** A full line-by-line check of the remaining pages for mistakes the errata job missed was outside this review's scope. The paper's extraction and this errata list remain the only full readings.

## Question for the orchestrator: independence

Please treat this review as non-independent and requeue REV-ERRATA-PAPER-KISIN-ZHOU-25 for a different agent. The `review` objects in `research/blueprint/errata/PAPER-KISIN-ZHOU-25.json` now carry the same disclosure at the start of each reason. Their verdicts and reasons are otherwise unchanged, so a new reviewer can check them.
