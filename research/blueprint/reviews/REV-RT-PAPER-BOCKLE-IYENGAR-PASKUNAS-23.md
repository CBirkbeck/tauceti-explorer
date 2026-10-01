# REV-RT-PAPER-BOCKLE-IYENGAR-PASKUNAS-23

Independent verification of the red team RT-PAPER-BOCKLE-IYENGAR-PASKUNAS-23 (Codex, session `codex-rtOQ9t`, PR #5448)
on the extraction PAPER-BOCKLE-IYENGAR-PASKUNAS-23 (Böckle–Iyengar–Paškūnas, *On local Galois deformation rings*, Forum
Math. Pi 11 (2023), e30), for issue #4235.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #2015);
- its review REV-PAPER-BOCKLE-IYENGAR-PASKUNAS-23 (`cc-fb70e5`, PR #2479);
- the red team.

None of the findings cites work of mine.

**Result: all five findings confirmed.**
- /1 and /2 are high: both copy false statements from the published paper.
- /3 and /4 are medium.
- /5 is filed as medium; I would grade it low.

None affects the paper's main theorems.

## What I read

- **The paper.** The published open-access article (<https://doi.org/10.1017/fmp.2023.25>), 54 pages, downloaded on
  1 October 2026 from Cambridge's PDF service. Its SHA-256 differs from the extraction's recorded artefact, because
  Cambridge stamps each download, but the page content matches the extraction's locators. I read:
  - pp. 2, 8, 13–14, 24–25 and 46;
  - the reference list.
- **The extraction.** Items /001, /003, /004, /026, /049, /050, /059, /131 and /147. I also searched its full text for
  Hochschild, Cartan, Galatius, homotopy and benign.
- **The atlas.** The Tau Ceti stage DGAInfinity layer 8.

## The high findings

- **/1: the fibre X_y (p. 8).** The paper's "we may identify the fibre X_y with a closed G-invariant subscheme of X" fails
  unless κ = κ(y).
  - **The example.** Let G_m act trivially on A¹_k. At the geometric generic point, the fibre maps onto the non-closed
    generic point.
  - **What holds.** X_y → X ×_S Spec κ is a closed G_κ-invariant immersion. Lemma 2.2 is unaffected.
- **/2: Lemma 3.35 (p. 24).** Its proof claims that κ(𝔭) is finite over κ(𝔭′) because A is finitely generated over R.
  - **The example.** R = k[[t]], A = R[x], 𝔭 = (0) refutes this. Then ∂_t and ∂_x give two independent derivations, so
    the completion has cotangent dimension at least 2, not that of K⟦T⟧.
  - **The uses.** The lemma is applied only at closed points, where the finiteness holds.
  - **The fix.** Add that hypothesis and record a sourceIssue.

## The medium findings

- **/3: Hochschild cohomology (p. 14, (11)).** The tangent-space computation of Proposition 3.11 uses HH¹ and HH⁰ through
  Cartan–Eilenberg IX.4.4.1 and IX.4.4.4. The extraction records neither.
- **/4: homotopy discreteness (p. 2).** The Galatius–Venkatesh consequence ([26, Lemma 7.5]) is stated after Theorem 1.1
  but is absent from the extraction.
- **/5: Remark 6.2 (p. 46). I would grade it low.** The benign, fixed-type and ramified-E variants are optional
  strengthenings, sketched without proofs. Nothing consumes them, so the omission overstates coverage but changes nothing
  that gets built.
