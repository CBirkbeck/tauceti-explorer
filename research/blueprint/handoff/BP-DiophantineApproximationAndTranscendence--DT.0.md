# Handoff: BP-DiophantineApproximationAndTranscendence--DT.0 (issue #9319)

Worker: Claude (session claude-hV03pM), 2026-10-13.

## What is closed

Layer DT.0 (heights and approximation constants) is **closed**. The base packet
`research/blueprint/packets/DiophantineApproximationAndTranscendence.json` plans the stage's 46
targets; this follow-up packet adds four nodes, cites the base nodes by id and plans nothing twice:

| Node | Kind | What it closes |
|---|---|---|
| `DT.0/polar-lattice-covering-bound` | theorem | The base pass's only open item: the covering bound behind Kronecker's theorem, requested from GN.4. Evertse, Corollary 2.21, with constant `n`, from the promoted `GN.4/covering-dual-transference` (`μ(L)·λ₁(L*) ≤ n`); Euclidean and maximum-norm matrix forms. |
| `DT.0/siegel-lemma-number-field-product` | theorem | The open request of `ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial`: Berrevoets, Lemma 3.2, the product-over-embeddings Siegel lemma. |
| `DT.0/badly-approximable-iff-bounded-partial-quotients` | theorem | The open request of `ProbabilisticAndMetricNumberTheory:PM.4/bounded-digits-compact-orbit`: badly approximable ⇔ bounded partial quotients of `GenContFract.of ξ`, with constants `1/(B+2)` and `1/c`. |
| `DT.0/max-absolute-height-of-tuple` | definition | `PAPER-BINYAMINI-22/53` (planned at DT.0 by the paper extraction): `h_max(y) = max_i h(y_i)`, with Binyamini's formula (1) as API. 13 API items, 5 unit tests. |

`python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings
(4 nodes, 30 baseline declarations, each statement read at Mathlib 082e2d3). `intake.py check-files`
and `check_sorry_data.py`: no problems.

**Suggested Lean file** `research/blueprint/suggested/DiophantineApproximationAndTranscendence--DT.0.lean`
(249 lines, Mathlib imports only): **compiled** with `lean-check` at the pins (Tau Ceti f790474,
Mathlib 082e2d3), with `sorry` as the only warning. Every packet API item and unit test appears in it
under the packet's name. The example deriving the base file's `∃ C > 0` covering statement from
the `C = n` theorem has a real proof. `BadlyApproximable` is repeated verbatim from the base
suggested file so that the file elaborates alone.

**Reader document** `research/blueprint/readmes/DiophantineApproximationAndTranscendence--DT.0.md`,
sections 0.2a, 0.3a, 0.4a and 0.6a, numbered to fit the package README's Layer 0.

## Edits the assembly must make (recorded in the packet's `restructure`; this job may not edit them)

1. Base node `DT.0/kronecker-approximation-theorem`: replace its prerequisite
   `GeometryOfNumbersAndQuadraticArithmetic:GN.4` (stage) with `DT.0/polar-lattice-covering-bound`,
   set `C_{n+1} = n + 1` in its proof steps, and drop the base packet's GN.4 request. In the base
   suggested file, `Imported.exists_lattice_point_near_of_polar_long` becomes this part's
   `exists_lattice_point_near_of_polar_long`.
2. The base packet's GN.1 request was a promotion bridge only. GN is promoted, and
   `GN.1/minkowski-linear-forms` states the non-strict boundary form. Drop the GN.1 stage anchor
   from `DT.0/dirichlet-approximation-from-minkowski`, and from the two DT.2 nodes
   (`linear-form-dirichlet-exponent`, `absolute-minkowski-for-twisted-heights`), and drop the request.
3. `ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial` should cite
   `DT.0/siegel-lemma-number-field-product`, and
   `ProbabilisticAndMetricNumberTheory:PM.4/bounded-digits-compact-orbit` should cite
   `DT.0/badly-approximable-iff-bounded-partial-quotients`, instead of the stage DT.0. Both requests
   are then supplied. CA.6 uses `N + 1` unknowns, hence the exponent `1/(N + 1 − dM)`; its node
   already has that.

The DiophantineApproximationAndTranscendence package (`research/blueprint/packages/`, Tau Ceti PR
#855) already lists Kronecker under "Needs: GeometryOfNumbersAndQuadraticArithmetic Layer 4". It does
not yet contain the product-form Siegel lemma, the bounded-partial-quotient criterion or `h_max`. A
fix to the package should add them as Layer 0 targets.

## Requests, gaps, moves

No requests and no gaps. No notion moved between tiers: GN (tier 3) is below DT (tier 4).
No planet is added; DT.0 already shows six.

## Mistakes in sources (new, in `sourceIssues`)

- `E601` (misprint, affects nothing): Berrevoets, proof of Lemma 3.2, p. 14. The `d`-th root of
  `∏_k|σ_k(a)|` is called `|N(a)|`; it is `|N(a)|^{1/d}`.
- `E602` (misprint, affects nothing): Berrevoets, proof of Lemma 3.2, pp. 12/14. The box principle is
  set up for an integer `Y`, but `Y` is then set to a real root; take its integer part.

Base E4 (Evertse, proof of Theorem 2.22, target vector `(−θ, 2ε)`) was re-checked and is correct.

## Routing of paper items addressed to DT.0 (packet `routing`)

- `PAPER-BINYAMINI-22/53` is planned as `max-absolute-height-of-tuple`.
- `/28`, `/30` and `/18` are not planned: their route 2 was rejected by `REV-PAPER-BINYAMINI-22`.
  `/28` (Binyamini, Lemma 25) is a corollary of the base `DT.3/thue-siegel-lemma-for-inequalities`
  (Waldschmidt, Lemma 4.11); an accepted route should cite that node.
- `DEMARCO-KRIEGER-YE-20/54` and `/10`, `DEMARCO-MAVRAKI-YE-26/7`, `MASSER-ZANNIER-20/13`: library
  (`NumberField.absLogHeight₁`) or owned by RP.0 / R35.3; nothing new at DT.0.

## Sources read (2026-10-13, scratch copies only)

- Evertse, *Diophantine approximation*, dio19-1/2/3.pdf (Ch. 1 Ex. 1.6–1.7; Ch. 2 pp. 23, 31–36;
  Ch. 3 p. 52).
- Berrevoets, *On Lehmer's problem*, Ch. 3 in full, Lemma 4.8.
- Pottmeyer, *Diophantine Approximation* (2022), §1.3, pp. 12–21.
- Binyamini, Forum Math. Pi 10 (2022) e6, §1.1.4 and §5 (pp. 2, 18–19).

No source was missing.

## What a reviewer should check first

- The Euclidean-to-maximum-norm step and the `n = 0` case of the covering bound.
- Step 5 of the product-form Siegel lemma (choice of `Y`, strict box count).
- Direction (a) of the partial-quotient criterion, which uses Legendre's theorem and the base packet's
  lower bound for the error of a convergent instead of the law of best approximation.
