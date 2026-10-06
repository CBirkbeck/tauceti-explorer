# Independent review of HabiroNahmSeries HB.10

Job `REV-HabiroNahmSeries--HB.10`, issue #6457, reviewed by Codex (GPT-6), session `codex-wafmqf`, on 6 October 2026. This session did not write the blueprint under review. The input was the follow-up merged in PR #6610.

**Verdict: accepted after three statement clarifications.** Every node is verified or corrected, every baseline citation is confirmed, and no unresolved contradiction remains in the packet. Its status remains `complete`, with HB.10 `planned`, rather than `closed`: the five explicit gaps and three supplier requests are part of the plan. Every implementation status remains `unchecked`.

## Counts

| Item | Result |
|---|---:|
| Nodes reviewed | 14 |
| Verified / corrected / added / unverifiable | 11 / 3 / 0 / 0 |
| Definitions | 2 |
| API items / named unit tests | 9 / 9 |
| Planets | 4, within the six-per-stage limit |
| Baseline declarations confirmed | 12 |
| Baseline citations removed or replaced | 0 |
| Distinct external supplier nodes read | 26 |
| Open gaps / requests | 5 / 3 |
| Source issues independently confirmed | 2 |

No definitions, API items, tests, planets or Lean signatures needed adding. The suggested Lean file is unchanged.

## Corrections made in place

1. **`quartic-module-export`.** Its conditional statement now retains the proof obligations in the imported `HB.9/module-membership`, including linear-coefficient integrality for the corrected local-section shape and the arbitrary-rank gluing argument. GSWZ writes out the latter only for rank one. The exact quartic algebra certificates verify the algebraic inputs; they do not close these inherited arithmetic arguments. Finite étale scalar change remains a separate owner input.
2. **`picard-and-regulator-export`.** Order-one completion freeness is now explicitly conditional on `HR.6/the-regulator-dies-after-q-minus-one-completion`. That supplier records a statement without an identified proof. Proving HB.7's tensor theorem alone would not establish this additional conclusion.
3. **`higher-cohomology-export-obligation`.** GW Definition 1.2 requires convergence throughout the open disc `|q−ζ_m|_p < 1`, with compatible Frobenius and gluing at all but finitely many primes. The source's smooth proper use of this carrier is now distinguished from Theorem 1.18's affine push-forward. Positive radius at every prime-ideal completion describes the latter's analytic input subring, and does not replace the target carrier's stronger convergence requirement.

The existing supplier-gap entry and coverage remainder now name the inherited HB.9 and separate HR.6 obligations. The five-gap count is unchanged. The GW edition metadata now records the downloaded PDF's actual 48 pages; its arXiv abstract advertises 47. Both source issues have independent review verdicts, and the packet has a verdict for every node.

## Public sources and source findings

The downloaded files match the hashes already recorded in `sources` and `sourceVersions`. Every node's locator and excerpt was checked against its cited text; derived arithmetic certificates are identified as derivations, rather than attributed as quotations.

| Text | Material checked |
|---|---|
| [GSWZ, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2), 27 August 2025 | §§1.4–1.9; §3.3; §§4.1–4.3; Example 4.4 in §4.7. Coefficient rings, prime restrictions, module statements, residue descendants, cubic and quartic coefficients, and the rational Gauss family. |
| [Wagner, public thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf) | Part I §2 and §3.2, particularly Corollaries 2.13 and 3.13, printed pp. 33 and 41. Relative equalizer, number-field ring comparison, and the étale degree-zero identification. |
| [Wagner, January 2026 author copy](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf) | Lemma 2.12 and Corollaries 2.13 and 3.13, corroborating the thesis's interfaces in the separate public version. |
| [Garoufalidis–Wheeler, arXiv:2505.19885v1](https://arxiv.org/pdf/2505.19885v1) | Definitions 1.1–1.2, (13)–(14), §§1.5–1.6 and §§3.1–3.3: symmetrisation, root expansions, and the analytic affine push-forward. |
| [Garoufalidis–Wheeler, author copy](https://people.mpim-bonn.mpg.de/stavros/publications/explicit-habiro-cohomology.pdf) | The same source-issue locators, independently checked against this PDF. |

**E64 is confirmed.** Proposition 1.14 at scalar A=3 has coefficient `q^(−k(k+1))[3k+2 choose k]_q`. At q=−1, its T² coefficient is `[8 choose 2]_(−1)=4`, computed directly by q-Pascal recursion. The printed (182) instead gives `(1+T)/δ(T²)`; from Z=1+tZ³ and δ=Z⁻³(3−2Z), the T² coefficient is 5. For k=mh+l, q-Lucas gives the ordinary binomial factor `binom(3h+a_l,h)` and the finite Gaussian factor `[b_l choose l]_(ζ_m)`. The three Lagrange profiles give `Z^(a_l+1)/(3−2Z)`, so the corrected scalar numerator contains `Z^(a_l−2)`. This confirms the packet's correction without claiming a general multidimensional formula or disproving Theorem 1.13.

**E65 is confirmed.** The cross-reference after (162) in §3.1 names Theorem 1.13, while the section heading and its proof goals concern Theorem 1.11. The symmetrisation theorem is separately proved in §3.2. This is a harmless cross-reference misprint.

On the review date, the [arXiv submission history](https://arxiv.org/abs/2505.19885) lists only v1. [Garoufalidis's publications page](https://people.mpim-bonn.mpg.de/stavros/publications/index.html) and [Wheeler's page](https://www.ihes.fr/~wheeler/) list the preprint and show no located correction; title/erratum searches found none. Both downloaded versions retain the two findings. The eleven imported source issues stay attributed to their original owners.

## Baseline and exact arithmetic

All statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The Tau Ceti statement was read from the pinned git object. Module paths, names, hypotheses and conventions agree with the packet.

| Declarations | What they supply |
|---|---|
| `PowerSeries.C`, `PowerSeries.coeff`, `PowerSeries.coeff_C` | Constant series and its coefficient formula. |
| `PowerSeries.map`, `PowerSeries.coeff_map`, `PowerSeries.ext` | Coefficient transport and extensionality. |
| `IsPrimitiveRoot` | Exact order; the consuming node separately requires positive m. |
| `Matrix.det_fin_two` | The two-by-two determinant formula. |
| `Algebra.discr_of_matrix_vecMul` | Change of trace discriminant by the square of the transition determinant. |
| `RingEquiv.trans`, `RingEquiv.trans_apply` | Composition in the order used by the exported map. |
| `NumberField.discr_eq_of_integralBasis` | Equality of the rational trace discriminant of an integral basis and the field discriminant. It is not used to infer maximality merely from integrality. |

The quotient-ring checks used exact rational arithmetic modulo `u⁴+u³+3u²−3u−1`. They verified both Nahm equations, the displayed δ inverse, the Hessian numerator identity, e²−3e+1, v's integral expression, and every product in the proposed lattice. Multiplication matrices yielded the stated trace Gram matrix, determinant −475, power-basis discriminant −11875, and norms −1, 1, 1, −1 and 9025 for u, v, 1−u, 1−v and δ. The basis transition determinant is 1/5. The quartic is irreducible modulo 2: it has no root and is not divisible by the sole irreducible quadratic. Thus the degree-four power basis and index computation are consistent. Maximality still uses the field discriminant imported from the source and parent node, followed by the determinant-square argument.

Exact reduction modulo `z³−z+1` verified δ⁻¹ and the equality of the two quadratic-coefficient expressions. The q-Pascal calculation gave the first ten order-two constants

`1, 1, 4, 5, 21, 28, 120, 165, 715, 1001`.

Truncated exact series arithmetic also checked all three ordinary-binomial profiles through degree eight. Those finite checks support the general q-Lucas/Lagrange proof sketch; they are not an all-coefficient small-prime gluing proof. The rational Gauss formula separately follows from finite character orthogonality: writing k=j+d leaves precisely m dividing 2d, with cancellation when m is 2 modulo 4.

## Closure, ownership and target coverage

The reviewed library audit marks all four HB.10 target families absent. This follow-up uses the generic baseline tools, and imports the parent's already planned rank-one products, abelian example, residue descendants and formal knot matrices. It does not duplicate Gaussian polynomials, general Bloch/K3 theory, the Habiro rings or the cohomology coefficient theory.

All direct supplier node statements were read. In particular:

- QM.0 supplies Gaussian polynomials and the finite binomial theorem. The more specific q-Lucas and weighted Taylor-jet statements remain precise requests to that owner.
- HB.6's full cyclotomic coefficient algebras, Frobenius direction and zero completions at inverted primes match both the Gauss construction and the cubic conditional criterion.
- HB.9's module theorem retains the inverse square-root algebra and restricted root orders. Its proof obligations are now propagated explicitly.
- HB.7's global module/tensor theorem and HR.6's order-one freeness are distinct conditional inputs. A restricted series is not automatically a global generator.
- HR.5/HR.6 and HQ.5 supply the actual dimension-zero ring comparisons and compatible Taylor maps. The composition has the stated Z[q]-algebra target; arbitrary constant coefficient families are not asserted to give an R-algebra structure.
- V.6 supplies certificate soundness and the noncanonical K3-lift fibre. N.6 is asked for the numerical tame kernel, including the 2-primary part. No numerical regulator calculation is promoted to an exact 60-torsion certificate.
- HQ.8's hypothesis-bearing comparison squares do not provide the missing naive-to-algebraic geometric comparison. The latter remains an extension request to the cohomology owner.

HB.10 is at target granularity. Its coordinate, integral-basis, constant-term and export certificates are appropriately sized targets; their routine reductions need no additional lemma nodes. Every target family is represented by a follow-up node or an explicit parent import, and the prerequisite chains terminate in library declarations, owner nodes, requested stages or named gaps. `planned` coverage is therefore accurate; `closed` would not be.

**RT-AREA-topology/11 is satisfied in the packet and reader.** Both give QT.6 every knot-invariant identification, triangulation independence and state-integral comparison. QT.6 consumes HB.4's estimates and HB.8's formal Gaussian integration. HB.10 asserts no such identification, so a reverse QT.6-to-HB.10 prerequisite is unnecessary. The QT.6 consumer changes remain with their owner; this review does not edit another job's files.

## API, suggested file and checks

The Gauss definition has five API items and five tests distinguishing orders 1, 2 and 4, the absence of positive-degree terms, and the complex sum normalization. The quartic vector has projections, extensionality and field-map compatibility, with four tests catching either incorrect exponent, the omitted denominator 5, and an inadmissible zero root. Every packet API name and test name appears in the suggested file. The four planet names identify mathematical objects or theorems.

`lean-check research/blueprint/suggested/HabiroNahmSeries--HB.10.lean` exited successfully in the shared build at the pinned Mathlib, with only `sorry` warnings. Available memory was checked before compiling. The file imports no Tau Ceti modules; its cited Tau Ceti baseline theorem was checked separately at the pin. Missing owner carriers are honestly omitted, as permitted by §13; supplied ring equivalences and Taylor homomorphisms are actual data, rather than proposition-valued substitutes. Nothing is claimed formalised.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.10.json`: zero errors and zero warnings.
- `python3 scripts/check_errata.py` on a scratch `errata-v1` projection containing the unchanged finding IDs, versions and new review verdicts: passed. The checker accepts standalone errata jobs, so direct invocation on a `blueprint-v1` packet is not an applicable schema check.
- Exact rational quotient-ring and finite-series checks described above: passed.
- A dependency traversal found no cycle reachable from the reviewed nodes through 634 explicit blueprint nodes; requested-stage and reserved-ID boundaries remain owner inputs.
- `research/blueprint/intake.py check-files` and `git diff --check`: passed for the submitted deliverables.

## Questions and handoff to the orchestrator

No decision is required to accept this planning pass. The existing follow-up work should retain all five gaps and the three precisely routed requests.

The HB.10 reader is not an authorized deliverable of #6457. Its topology paragraph already gets the confirmed finding right. At the next authorized reader update, mirror the packet's three clarifications: its Definition 1.2 overview should specify the full open unit disc and the smooth proper setup, its quartic module application should name the inherited HB.9 proof obligations, and its order-one freeness sentence should name HR.6's separate obligation. The reader already distinguishes the affine analytic push-forward and records open supplier inputs; these are precision updates to that account.

The reviewed packet remains the place to resume the cubic p=2,3 proof, exact quartic torsion and tame-kernel computations, inherited coefficient-line obligations, and the geometric comparison. The general theories stay with their named owners.
