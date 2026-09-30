# REV-RT-PAPER-DITTMANN-POP-23

**Complete: both findings confirmed.** The fix scope is narrowed for /1. The fixer follows the reasons in the verdict file, not the red team's fix text.

- **Job:** Refs #4068.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** the extraction PAPER-DITTMANN-POP-23 (cc-442dc5, with Codex checkpoints), its review REV-PAPER-DITTMANN-POP-23 (codex-7e92bd), the errata review REV-ERRATA-PAPER-DITTMANN-POP-23 and the red team RT-PAPER-DITTMANN-POP-23 (cc-c2c06b) were all done by other sessions. The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Disclosure:** this session red-teamed Koenigsmann 16 (PR #4691) and Temkin 17 (PR #4697). Both jobs read this extraction for overlaps: the LD layers and the Zariski–Riemann and valuation material.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-DITTMANN-POP-23.review.json`](../redteam/RT-PAPER-DITTMANN-POP-23.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Finding | Severity | Verdict |
| --- | --- | --- |
| /1: the owner of the height-one intersection theorem | medium | confirmed, with a narrowed fix |
| /2: the library note on the fundamental equality | low | confirmed |

## Evidence

**Paper.** [arXiv 2012.01307v2](https://arxiv.org/pdf/2012.01307v2), the final author version (19 pages), fetched 30 September 2026. Its SHA-256 `f9f26f7d…2c1f` matches the extraction's record. I read Lemma 3.6 (p. 10) and Proposition 5.1 (p. 16). The version of record is Ann. of Math. 198 (2023) 1203–1227. Neither finding quotes a stated result, so collating against it was not needed.

**Libraries.** Mathlib 082e2d3 and Tau Ceti f790474, read through the baseline declaration index and the source files at those commits.

**Atlas.** At 24bcb8e8 I read:
- `data/atlas.json`;
- `data/library-coverage.json` (AUDIT-23);
- the accepted restructure RS-08;
- the PadicMeasuresIwasawaAlgebras and FiniteFlatGroupsAndIntegralPadicHodgeTheory packets.

I recomputed the ancestor sets with a read-only call of `scripts.build.assemble(require_distances=False)`.

No Lean was compiled; neither finding needs it.

## /1: the height-one intersection theorem has the wrong owner (confirmed)

Dittmann–Pop use Krull's theorem once, in the proof of Proposition 5.1: "S = ⋂_{p∈X¹} S_p, see e.g. [Ma], Thm 11.5, (ii)". The extraction gives it to AutomorphicCongruences:L4 in three places:
- route 7 routes `krull-intersection` and the two associated-prime lemmas there;
- the item itself is `planned: AutomorphicCongruences:L4`;
- the Part II brief imports it "from the early algebraic portion" of L4.

L4 requires L3 and KatoEulerSystems:L4. I reproduced the red team's counts on the production graph:

| Stage | Ancestor stages | Roadmaps |
| --- | ---: | ---: |
| AutomorphicCongruences:L4 | 846 | 120 |
| DeformationAndDerivedPatchingAlgebra:R03.3 | 5 | 2 |
| AlgebraicModuliForArithmeticGeometry:A0-extension | 5 | 2 |

Links in the atlas join whole stages, so no link can reach only an early portion of L4. As written, the definability Part II would depend on the whole automorphic ancestry of L4. §15 forbids that.

The two other consumers are real:
- PadicMeasuresIwasawaAlgebras:L4/bidual-intersection takes A = ⋂ A_𝔭 as a hypothesis;
- FiniteFlat R07.1/tate-generic-fibre-theorem reduces to DVRs by the same theorem.

Neither library has the general statement. Mathlib has only the Dedekind case and the valuation-ring form.

**Corrections to the red team's fix:**
- **The owner is R03.3, with no alternative.** RS-08 narrowed R03.3 but kept its "associated-prime and support lemmas", so R03.3 is the owner. A0-extension ("higher-dimensional moduli prerequisites") plans neither associated primes nor this theorem. The extraction had also already moved the item off A0-extension.
- **`krull-intersection` becomes `missing`, routed to R03.3.** R03.3's text does not name the theorem, so `planned: R03.3` would overstate what the atlas plans.

**Edits for the fixer.** These go in `PAPER-DITTMANN-POP-23.result.json` and the matching text of its `.md`:
- route 7 goes to R03.3;
- the item's status, `planned` field and note change as above;
- route 3's reason names R03.3;
- the route 4 brief imports the theorem from *Commutative algebra for deformation theory and patching* (DeformationAndDerivedPatchingAlgebra:R03.3);
- gap DP23-G5 and the report's ownership paragraph name R03.3.

**Maintainer notes, not fixer edits:**
- L4 keeps only its zeta-element descent and imports the general theorem;
- the PadicMeasures L4 and FiniteFlat R07.1 packets import it from R03.3;
- this verdict supersedes the route 7 verdict in the extraction's review, and the fixer does not rewrite that review.

## /2: the note on the fundamental equality understates the library (confirmed)

At f790474, [`TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/AffineModel/Extension.lean#L293) proves Σ e·f = [F′ : F] at every place of a finite chart. It needs Dedekind models R and S with `Module.Finite R S`, and has no separability instance. The separable wrapper (`Place/Extension/Fundamental.lean:77`) is a separate theorem. The item's note, "The pin supplies only the separable function-field wrapper", is therefore false at the pin.

I re-derived the use of the identity in Lemma 3.6. There K ⊃ K_s are function fields in one variable over k₁(u), and K|K_s is purely inseparable.
- Let R and S be the integral closures of k₁(u)[u_d] in K_s and in K. For places at infinity, use k₁(u)[u_d⁻¹] instead.
- `finite-normalization-generic` makes both finite over the polynomial ring, so S is finite over R.
- The chart identity then applies.

Finiteness cannot be dropped: the identity fails over non-Japanese DVRs. So finite Dedekind models are the one remaining input, and the status stays `planned`, with AlgebraicCurves Layer 6 as owner.

Route 3's reason does contradict itself. It says the equality "also belongs here", and in its next sentence that it is "not assigned to this source route".

**Edits for the fixer:**
- cite the chart identity and the Fibre inequality in the item's note and in its `library` list;
- point the second proof step at the chart identity;
- delete the "also belongs here" sentence of route 3.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-DITTMANN-POP-23.review.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
