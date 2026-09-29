# Handoff: BP-PadicHodgeTheory--R06.5 (second checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #969.

- Stages R06.5 and R06.6 of `PadicHodgeTheory`. Part 1, `PadicHodgeTheory--P7` (R06.1–R06.4, P7, P8), is imported throughout. RS-01 keeps both stages unchanged.
- Checkpoint 1 was merged in #3854 (14 nodes).
- This checkpoint adds the modular-curve, Kuga–Sato and Shimura-curve applications, and the R19 inputs, in 5 nodes. The packet now has 19 nodes and 11 planets (5 in R06.5, 6 in R06.6).
- Both stages remain partial. The checker reports no errors.

## New in this checkpoint

R06.5:

- `modular-form-de-rham-realisation` (planet):
  - M_{g,λ}|G_{Q_p} is de Rham, with D_dR = K_λ ⊗ M_{g,dR};
  - Fil^{k−1} is the line of g;
  - the Hodge–Tate weights are 0 and 1 − k (0 and k − 1 for V_g);
  - the pairing ∧²M_g ≅ M_ψ(1 − k) is compatible with D_dR.
- `modular-form-crystalline-good-primes` (planet):
  - crystalline at p ∤ N, with φ-polynomial X² − a_pX + ψ(p)p^{k−1};
  - weakly admissible with t_H = t_N = k − 1;
  - ordinary iff a_p is a unit, in which case there is an unramified subrepresentation (unramified quotient of V_g).
  - Checked on Δ at 11 (ordinary), 2 and 2411 (not ordinary).
- `weight-two-modular-abelian-varieties`: A_f is Barsotti–Tate at p ∤ N, and ordinary iff a_p is a unit. At p ∥ N (p ∤ cond ψ) it is semistable and not crystalline. This translates Darmon–Diamond–Taylor 3.1(f)–(g) into p-adic Hodge theory.

R06.6:

- `modular-form-local-global-compatibility-at-p` (planet; it takes the planet slot of the abelian-variety node, since R06.6 is at six):
  - WD(M_{g,λ}|G_{Q_p})^{F-ss} ↔ π_p(g) under local Langlands (Scholl, Saito);
  - the crystalline, semistable and potentially crystalline criteria in terms of π_p;
  - the guard against compatible systems that are not modular.
- `hilbert-modular-form-compatibility-at-p`: T. Saito's Theorems 1–2 for Hilbert modular forms, through Shimura curves.

## What remains

- **Endpoint weight (R19.5).** The case k = p + 1 or weight p is R06.4's weight-p branches applied to V_g; it is not planned.
- **Saito 1997.** The elliptic case at p | N (Invent. Math. 129) is not public. It is quoted from Diamond–Flach–Guo §5.5, and the proof follows Saito's Hilbert paper. Next action: an author copy on T. Saito's page.
- **Scholl 1990** (Kuga–Sato motives) is not read. It is quoted through Diamond–Flach–Guo and requested from R19.1.
- **Carried over from checkpoint 1:**
  - the rank of N equal to the toric rank (R11.4–R11.5);
  - the converse semistable criterion;
  - the Weil–Deligne comparison for other bad reduction;
  - Berthelot–Breen–Messing.

## Requests

Made in checkpoint 1:

- Tau Ceti EllipticCurves Layer 4;
- ArithmeticGaloisRepresentations R01.6;
- AbelianSchemesAndArithmeticModuli A3 and A4;
- NeronModelsAndSemistableAbelianVarieties R11.1 and R11.3;
- ClassicalAdicEtaleCohomology H5;
- ArithmeticGaloisDuality R02.1.

New in this checkpoint:

- AutomorphicGaloisRepresentations R19.1 (M_g, Kuga–Sato, Eichler–Shimura, V_p(A_f)) and R19.4 (Carayol);
- GL2AutomorphicRepresentationsAndTransfer R16.3 (local Langlands for GL_2);
- ModularCurvesPartII R13.5 (Deligne–Rapoport);
- HilbertModularVarietiesAndShimuraCurves R18.2 (Shimura curves and their semistable models);
- CohomologyComparisons CP.4 (Tsuji);
- WeightsInEtaleCohomology R34.3 (weight spectral sequence).

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against the Mathlib 082e2d3 build, and `sorry` is its only warning.

Checkpoint 2 adds:

- the modular Frobenius polynomial;
- two `decide` tests on Δ;
- a matrix check of the Weil–Deligne sign, F N F⁻¹ = p⁻¹N.

## Source issues

**Checkpoint 1** (E40–E47):

- Berger's survey: E40–E45;
- Brinon–Conrad: E46;
- Coleman–Iovita: E47.

**Checkpoint 2** (all checked on the page images):

- E48, Diamond–Flach–Guo (Ann. ÉNS 2004), p. 669: the geometric Frobenius is said to act on WD through φ^{−1}; it should be φ.
- E49, Diamond–Flach–Guo (Ann. ÉNS 2004), p. 684: Carayol is credited with the case "λ dividing p and p dividing N"; it should read "λ not dividing p".
- E50, T. Saito's Hilbert paper, pp. 9 and 12: the Weil–Deligne relation and φN = pNφ are both reversed. The correct relations are FNF^{−1} = N𝔭^{−1}N and Nφ = pφN; Saito's own Theorem 2 requires them.

E48 and E49 are corrected in the authors' arXiv version 2512.02348v2 (2025).

## Sources

Checkpoint 1:

- Berger, arXiv:math/0210184v1;
- Brinon–Conrad, 2009 notes;
- Coleman–Iovita, arXiv:math/9701229v1.

Checkpoint 2:

- Diamond–Flach–Guo: arXiv:2512.02348v2 and the Numdam copy of Ann. ÉNS 37 (2004);
- T. Saito, arXiv:math/0612077v2;
- Darmon–Diamond–Taylor, the 2007 revision on Darmon's page.

The acceptance values come from Python scripts run during the job:

- a_p of 11a1 and 15a1;
- q and L of 11a1 at 11;
- τ(p) mod p for Δ.

The scripts are not committed. Their results are recorded in the acceptance lists of the nodes.
