# Handoff: BP-GeneralizedHeegnerCycles--GH.0 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #739.

- The packet is partial, with 6 nodes and 2 planets. The checker reports no errors and no warnings.
- The source is Bertolini–Darmon–Prasanna, Duke 2013, published version (SHA-256 223bfdad…, the same file as the
  integrated decomposition). §1.4 and §§2.1–2.3 (pp. 1051–1063) were read in full, and every excerpt was matched
  against its page.

## What this checkpoint plans

GH.0:
- `cm-elliptic-curve-and-its-hodge-splitting` (definition): A with End_H(A) = O_K, and the algebraic splitting
  H¹_dR = Ω¹ ⊕ H^{0,1} with η_A.
- `cm-projector-and-symmetric-power` (construction): ε_A, with denominator 2^r r!, and Lemma 1.8.
- `cm-character-decomposition`: the eigenbasis ω^jη^{r−j} with characters α^jᾱ^{r−j}.
- `generalized-kuga-sato-variety-and-its-projector` (construction, planet): X_r = W_r × A^r and ε_X = ε_W ε_A. Its
  denominators are 2N·r!, and ε_X^t = ε_X.
- `cohomology-of-the-generalized-kuga-sato-variety` (planet): BDP Propositions 2.4–2.5, in the de Rham and étale
  realizations.
- `self-duality-of-the-projected-cohomology`: ε_X H^{2r+1}(r + 1) is self-dual.

RS-06's owner table puts W_r and ε_W under ModularCurvesPartII R14.3, so they are requested from there. The R14.3
packet plans only weight two. The integrated decomposition's GH.0 node `the-variety-X-r-and-its-smooth-proper-model` is
refined here into the construction node.

## Requests (new)

- ModularCurvesPartII R14.3.
- HeegnerPointEulerSystems HE.1.
- ComplexMultiplicationAndExplicitReciprocity CM.1.
- MotivicEtaleKTheory M.4.
- SchemeAndStackFoundations SF.2.
- EtaleDualityAndPerverseSheaves EDC.2.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against Mathlib 082e2d3 (exit 0, 1 `sorry`). It has:
- the character idempotent in ℚ[G], whose idempotence is left as `sorry`;
- dim Sym^r = r + 1 and dim X_r = 2r + 1;
- #Ξ_r = 2^r r!, proved.

## Source issues

None found in the passages read.

## What remains (precisely)

- **GH.0.** An explicit Hecke-idempotent node on ε_X H^{2r+1}, with its denominators.
- **GH.1.** Refine the decomposition's node from BDP §2.3 (Δ_φ, Remark 2.6, Proposition 2.7) and §3.
- **GH.2–GH.7.** Not planned. The decomposition has nodes for GH.2, GH.4, GH.5 and GH.6 (Castella–Hsieh, Longo–Vigni).
