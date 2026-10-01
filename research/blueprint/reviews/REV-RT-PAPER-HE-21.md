# REV-RT-PAPER-HE-21

Independent verification of the red team RT-PAPER-HE-21 (Codex, session `codex-rtOQ9t`, PR #5399) on the extraction
PAPER-HE-21 (Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum Math. Pi 9 (2021),
e9), for issue #4245.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-7e92bd`, PR #1927; `cc-fb70e5`, PR #2067);
- its errata (PR #2200);
- its review REV-PAPER-HE-21 (`cc-7b31c4`, PR #2451);
- the red team.

None of the findings cites work of mine.

**Result: both findings confirmed.** /1 as filed is high; I would grade it medium, since only explanations change. /2 is
medium.

## What I read

- **The paper.** arXiv:2001.03325 (<https://arxiv.org/pdf/2001.03325>), the only posted version, SHA-256
  `818873a5…89a3`, equal to the extraction's recorded hash. I read:
  - pp. 4–5 (conventions, ^S W̃, the dominant chamber, critical strips);
  - p. 10 (§4.3–4.4, §5.2, Theorem 5.5);
  - pp. 10–11 (the proof of Theorem 5.5).

  The published Cambridge PDF is stamped per download, and its hash cannot be reproduced. The extraction found it
  identical to arXiv at these locators.
- **The GHN15 erratum** (<https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf>), SHA-256 `cf7efbf8…99c0`,
  all three pages.
- **The extraction.** sourceIssues E1 and E13 with their reviews, items /28, /104 and /119–/122, gap G3, and the reader's
  "Rewritten (6)" paragraph.

## /1: shrunken output with singular γ. Confirmed.

**The sign convention.** He fixes a in the chamber opposite the dominant one, with critical strips −1 < ⟨v,α⟩ < 0.
Translations then act by v ↦ v − λ. That is the only sign compatible with t^λ ∈ ^S W̃ for dominant λ and with the
paper's ℓ(xt^λ) = ℓ(x) + ℓ(t^λ), which I checked in A₁. The extraction's own E1 example also behaves as stated under it.

**The construction.** I reran the proof of Theorem 5.5 for split adjoint A₂ with λ_w = 2ω₂^∨, x = s₁ and y = s₂. It gives:
- J = {s₂} and J′ = {s₁};
- x′ = s₂ and z = s₁;
- γ = ω₁^∨ and y′ = 1;
- a = s₁ ∗ s₂ = s₁s₂.

**The output is shrunken.** The image of the base alcove under a t^γ has vertices (1,−1), (2,−2) and (2,−1), with root
values in [1,2], [−2,−1] and [0,1]. It meets no critical strip, so it is shrunken, although γ is nonzero and singular and
supp(a) = S.

**Where E1's argument fails.** It drops orientation: a(α₂) = −(α₁+α₂) is negative, so ⟨v, a(α₂)⟩ ∈ (−1,0) puts v in no
strip.

**The fix.** Make E1's claim existential, using its own λ = ω₂^∨ example. Gap G3's detail repeats the universal claim and
needs the same rewording. Its instruction to use GHN15 Theorem A stands, and item /120 already imposes no shrunken
hypothesis.

## /2 (medium): the semisimple hypothesis in the GHN erratum. Confirmed.

**The source.** The erratum's kernel formula and torsion-free criterion on p. 2 begin "Assume that G is semisimple". E13
states both without the hypothesis.

**The counterexample.** Split GL₂ has torsion-free X_*(T)_Γ = Z², but π₁(GL₂) = Z → π₁(PGL₂) = Z/2 has kernel 2Z.

**The fix.** Item /104 keeps injectivity as a separate hypothesis, so only E13's explanation changes: add "for semisimple
G".
