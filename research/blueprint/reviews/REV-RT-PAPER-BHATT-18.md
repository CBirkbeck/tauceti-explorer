# REV-RT-PAPER-BHATT-18

Independent verification of the red team RT-PAPER-BHATT-18 (Codex, session `codex-rtOQ9t`, PR #5373) on the
extraction PAPER-BHATT-18, for issue #5066.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-hjdg0j`, `codex-7e92bd`, `cc-fb70e5`, `cc-39fac3`);
- its review REV-PAPER-BHATT-18 (`cc-58621d`, PR #4700);
- the red team.

**Result: both findings confirmed.** /1 is high and /2 is medium. Neither touches the direct summand theorems.

## What I read

- **Gabber–Ramero, *Almost ring theory*** (sixth release,
  <https://websites.umich.edu/~bhattb/almost_purity_2011/almost_ring_theory.pdf>), §2.2.3–2.2.4 on PDF p. 12.
- **The extraction:** items almost-category (statement, note and API) and cohen-structure, and route 9.
- **PAPER-ANDRE-18-B:** route 4 with its accepted verdict, and the items cohen-parameter-presentation and
  coefficient-ring-compatibility.
- **The atlas:** the R03.1 stage text in `data/atlas.json`.

## /1 (high, error): the right adjoint over a general almost base. Confirmed.

**The source.** Gabber–Ramero's (2.2.4) reads Hom_{V^a-Mod}(M^a, N^a) = Hom_V(m̃ ⊗_V M, N) with m̃ = m ⊗_V m. Taking
M = V gives (N^a)_* = Hom_V(m̃, N).

**The item.** It assumes only m² = m and flatness of m̃, yet its API asserts Hom_V(m, N). The two agree only when
m̃ → m is an isomorphism, for instance when m is flat.

**The counterexample, which I checked directly.**
- **The base:** let V be the valuation ring of the completion of F_p((t^{1/p^∞})), W = V/(t) and n = m/tV. Then n² = n.
- **The tensor square:** by right exactness, n ⊗_W n ≅ (m ⊗_V m)/tm ≅ m/tm, because m is V-flat with m ⊗ m ≅ m. This is
  W-flat as a base change of m.
- **The failure:** the multiplication m/tm → m/tV has kernel tV/tm ≅ V/m ≠ 0. So the identity of ñ does not factor
  through n, and the item's formula fails.

**The fix.** Use Hom_V(m̃, N) in general, and derive Hom_V(m, N) when m is flat. That flat case is the perfectoid
valuation base of Bhatt's footnote 5, so this is an extraction error, not a source erratum.

## /2 (medium, duplicate): the Cohen coefficient ring. Confirmed.

The cohen-structure item routes the construction of W(k) → A0 to the new DirectSummandsAndBigCohenMacaulay roadmap, and
its note says no layer plans it.

The accepted PAPER-ANDRE-18-B route 4 (source R03.1) instead asks R03.1 to "Add the exact Cohen
presentation/compatibility". Its item cohen-parameter-presentation needs the same W(k) coefficient ring for complete
Noetherian local rings with perfect residue field. R03.1 owns complete local coefficient categories and residue-field
change.

The fix imports the coefficient ring from R03.1 and keeps only the regular-local presentation as a corollary, without a
reverse dependency.
