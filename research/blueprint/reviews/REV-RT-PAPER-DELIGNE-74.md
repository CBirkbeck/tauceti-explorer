# REV-RT-PAPER-DELIGNE-74

Independent verification of the red team RT-PAPER-DELIGNE-74 (Codex, session `codex-rtOQ9t`, PR #5386) on the
extraction PAPER-DELIGNE-74 (Deligne, *La conjecture de Weil. I*), for issue #4594.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-f805bf`, PR #4551);
- its review REV-PAPER-DELIGNE-74 (`cc-fb70e5`, PR #4561);
- the red team.

**Result: all five findings confirmed.** /1–/3 are high, /4 and /5 medium. None of them touches the theorems of Weil I.

## What I read

- **The paper.** Weil I, Publ. Math. IHÉS 43 (1974), from Numdam
  (<https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>), SHA-256 `8392b345…42e5`, equal to the red team's.
  Printed page = PDF page + 271. I read:
  - the proof of 3.8 (p. 286);
  - 8.2 (p. 302);
  - 8.11–8.12 (p. 306).
- **The extraction.** Items s3-3.8-euler-product-convergence, s6-6.10-arithmetic-monodromy-CSp, s6-6.12-measure-zero,
  s7-H1-P1-constant-vanishes, s8-GOS-formula and s8-8.2-ramanujan-petersson, and the source issues E8 and E16.
- **The atlas.**
  - The requires of DWP.4–DWP.6 and the stage graph.
  - The texts of DWP.4 and EDC.4.
  - The verdict on RT-AREA-finitefields/3.

## /1 (high): E16 is not propagated into item 72. Confirmed.

The proof of 3.8 counts "sur la droite affine … au plus qⁿ points fermés de degré n", although U₀ is an open of P¹, and
item 72 copies the affine-line bound. E16 already corrects it.

The counterexample is: over F₂, P¹ minus the degree-2 point keeps 0, 1 and ∞. For ε = 5, the left side is at least 3/64,
while the bound gives 1/31.

## /2 (high): E8 is not propagated into item 153. Confirmed.

E8 sets CSp_a = {μ(g) = q^{−na}}, with n the fibre dimension and a ∈ Ẑ. Item 153 still writes μ(g) = q^{−n} with n the
Ẑ-coordinate. For n ≠ 1 these are not the fibres of H₁ → Ẑ, so the Fubini step uses the wrong sets.

## /3 (high): H¹(P¹, constant) = 0 is placed downstream of its consumer. Confirmed.

The item is planned only at DWP.6, but DWP.4, which needs it, is an ancestor of DWP.6. EDC.4, already required by DWP.4,
plans the projective-bundle decomposition that gives the vanishing.

## /4 (medium): the Grothendieck–Ogg–Shafarevich owner. Confirmed.

Weil I quotes the formula from Raynaud (p. 306); it does not prove it. Route 4 sends the general theorem to FF.2. The
confirmed RT-AREA-finitefields/3 wants one owner on the étale-duality side, with FF.2 as a consumer.

## /5 (medium): the claimed equivalence in the note of item 181. Confirmed.

The three identities α + β = a_p, αβ = ε(p)p^{k−1} and |ε(p)| = 1 do not force |α| = |β|. Take α = 2ir and β = −ir/2 with
r = p^{(k−1)/2}: then αβ = r² and |α + β| = 3r/2 ≤ 2r, but |α| = 2r.

Weil I proves root purity directly, and the trace bound follows from it.
