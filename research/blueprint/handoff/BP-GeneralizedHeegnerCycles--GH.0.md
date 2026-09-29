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

# Checkpoint 2 (the core of GH.1)

Agent: Claude Code, session cc-fb70e5. Refs #739.

- The packet now has 13 nodes and 5 planets. The checker reports no errors and no warnings.
- The source is BDP §1.4 Isogenies (pp. 1053–1054), §§2.3–2.4 (pp. 1062–1064) and §§3.1–3.4 (pp. 1064–1070), read in
  full. The file and SHA-256 are the same, and every excerpt was matched against its page.

## What checkpoint 2 plans (GH.1)

- `isogenies-of-conductor-c-prime-to-n` (definition): Isog_c^N(A), the Heegner hypothesis, and the P(O_c)-action.
- `generalized-heegner-cycle` (construction, planet): Δ_φ = ε_X Graph(φ)^r ∈ CH^{r+1}(X_r)_ℚ, with its support.
- `field-of-definition-of-generalized-heegner-cycles`: Remark 2.6.
- `homological-triviality-of-generalized-heegner-cycles`: Proposition 2.7.
- `etale-abel-jacobi-map` (construction, planet): Definition 3.1 and Remark 3.2.
- `extensions-of-filtered-frobenius-modules`: Proposition 3.5.
- `p-adic-abel-jacobi-map` (construction, planet): §3.4, into (S_{r+2} ⊗ Sym^r H¹_dR(A))^∨.

The integrated decomposition's GH.1 node, which bundles the cycles with the Main Theorem, is refined here. The Main
Theorem's formula belongs to GH.4.

## Requests (new)

- EtaleDualityAndPerverseSheaves EDC.3.
- SelmerIwasawaCohomology L0.
- PadicHodgeTheory R06.2, R06.5 and R06.6.
- HeegnerPointEulerSystems HE.1 and MotivicEtaleKTheory M.4 now also serve GH.1 nodes.

## Suggested Lean file

The GH.1 signatures were added as comments, together with a codimension check. The file was compiled with
`lake env lean` (exit 0, 1 `sorry`).

## Source issues

None found. The OCR drops minus signs: the extracted "of weight 1" on p. 1069 reads "of weight −1" on the page image,
which was checked.

## What remains (precisely)

- **GH.1.**
  - The integral lattice version, with the denominators of ε_X.
  - The Coleman primitive and the syntomic realization (BDP §§3.5–3.8).
  - §2.4's relation with classical Heegner cycles, which BDP leave to the reader.
- **GH.2–GH.7.** The decomposition has GH.2, GH.4, GH.5 and GH.6 nodes to refine.
