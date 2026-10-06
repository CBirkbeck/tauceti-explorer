# Independent review: Polylogarithms P.4

**Accepted**, after corrections. Reviewer: Codex, session `codex-2vYPtb`,
job `REV-Polylogarithms--P.4`, issue #6404, 2026-10-06. This session did
not write the input blueprint. The review identity in the packet is
`independent-review-REV-Polylogarithms--P.4`.

This is a finished target-level planning pass under PROTOCOL §0. Its one
stage is **planned**, with all four target chains present, and is not
closed. Five precise mathematical gaps and three supplier requests remain.
Acceptance verifies the plan's statements and boundaries; it does not
claim to prove the missing inputs or formalise a source theorem.

| Item | Reviewed count |
| --- | ---: |
| Nodes | 18: 6 verified, 12 corrected, 0 added, 0 unverifiable |
| Definitions / constructions | 2 / 6 |
| API entries / discriminating tests | 47 / 32 |
| Pinned baseline declarations | 13 confirmed; 0 removed or replaced |
| Public sources and matching PDF hashes | 5 |
| Source issues | 2 independently confirmed; 0 rejected |
| New / inherited P.4 planets | 2 / 4, total 6 |
| Stages planned / closed | 1 / 0 |

## Corrections made

1. **Imaginary-quadratic exponent.** For ℚ(i), `N=2`, `d=1` in both
   parities, so `e=n(N−d)=n`. The even-weight acceptance example incorrectly
   said `2n`; the general formula was already correct.
2. **Regulator rescaling signature.** The API rescales the Borel map `r`
   by a nonzero rational `q` and adjusts the calibration by its inverse.
   The Lean signature instead rescaled `p`. It now concludes
   `regulatorComparison p (q • r) A`.
3. **All explicit differentials.** `explicitComplex_d` now states the
   three boundary identities in degrees 1→2, 2→3 and 3→4, as its API
   promises. Previously it covered only 1→2.
4. **Published differential misprint.** On G95 p. 223, (1.28c) actually
   prints **βₙ logⁿ⁻¹**, whereas the intended term is **βₙ₋₁ logⁿ⁻²**.
   Expanded `Polylogarithms/E-P4-02` to include both slips. The packet's
   proposed derivative formula was already correct, but its description
   and diagnostic misrepresented the printed coefficient. At weight three
   the literal printed expression gives zero, since β₃=0; direct
   differentiation at `x=1/2` gives `4(log 2)²/3`. Correcting the coefficient
   alone would give `−4(log 2)³/3`. Updated the node, finding and acceptance
   check accordingly.
5. **Homotopy model boundary.** The parent uses rational-curve relations;
   G95 uses all smooth curves. The displayed homotopy assertion is their
   rational-curve analogue, not an established identical formulation of
   G95 Conjecture 1.39. Added the G94 Definition 1.19 comparison locator,
   clarified residue attribution and the Lean comment, and strengthened
   the existing homotopy gap: any deduction from G95 must supply a
   comparison commuting with complexes, field inclusions and residue maps.
6. **Weaker regulator interface.** The weight-four argument needs a map
   from K₇ and containment of all explicit-cycle periods, without an
   equivalence of the entire cycle space and K₇. Replaced its direct
   dependency on the conditional full-comparison theorem with the exact
   R.5 formulas, R.7 calibration, parent determinant and determinant
   infrastructure. The proof sketch now performs the weight-four exponent
   arithmetic directly. The existing R.7 request already names this node.
7. **Source locators and excerpts.** Zagier's period/regulator formula is
   the unnumbered paragraph after (3), p. 393. Equation (2), p. 392, is the
   classical polylogarithm series. Corrected all three affected locators,
   the read-section description and the unrelated `(2)` excerpt. Corrected
   GR v5 Theorem 1.2 locators to its two unlettered assertions and replaced
   an absent excerpt by a phrase actually printed there. Replaced the
   unattested G95 p. 222 excerpt by `homomorphism`. The residue construction
   starts in §1.14, pp. 236–238, before §1.15; corrected that locator.
8. **Baseline scope.** Clarified that `exteriorPower.ιMulti` supplies the
   alternating insertion used to express wedges. It does not itself
   supply a residue map; that map stays with P.3. Recorded independent
   source-statement checks for all 13 entries.

No node was added, so no `addedBy` entries are needed. All 18
`implementationStatus` fields remain `unchecked`. No supplier, parent,
upstream roadmap, atlas data or reader file was edited.

## Source verification

Downloaded the five public PDFs, compared each SHA-256 with the packet,
and checked every node's cited passage and excerpt. All hashes match.
Scanned sources were inspected visually, preserving printed pagination.
The review checked the relevant passages in these versions:

| Source | Original public version and passages checked |
| --- | --- |
| G94 | [Author manuscript](https://sasha-goncharov.github.io/SeattleMotives.pdf), pp. 6–11 and 13–14: rational-curve recursion, inversion, analytic factorisation, curve-model comparison and period conventions. |
| G95 | [Published scan](https://sasha-goncharov.github.io/Advances1995.pdf), pp. 221–224 and 236–241: Lemma 1.16, both derivative displays, Corollary 1.19, residues and homotopy. PDF page k is printed page 196+k. |
| Z90 | [Published scan](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf), pp. 392–393 and 410–417: periods, Bernoulli normalization, cycle constancy, the two relation models and final conjecture. |
| GR5 | [arXiv v5](https://arxiv.org/pdf/1803.08585v5), cited introductory passages pp. 4–7, 9, 12, 15–18, period formulas pp. 76–78 and proof completion pp. 91–94. These are preprint page locators. |
| S91 | [Suslin English translation](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf), pp. 237–238: Corollary 5.6 and specialization/transfer remarks. |

`E-P4-01` is confirmed: the zero-on-nonunits tensor rule on p. 222 fails
bilinearity for `t·(2/t)=2` over ℂ(t). The `{1}₃` factor is nonzero by its
ζ(3) evaluation; the rational unit class of 2 is nonzero. Angular
components fix this particular defect, while relation preservation remains
an independent gap. This finding does not refute Lemma 1.16 itself.

`E-P4-02` is confirmed in the expanded form above. The adjacent published
odd formula (1.28b) and G94 (14) already give both correct indices. Checked
the author's public publications page and targeted correction searches;
no separate erratum for these passages was located. This is a bounded
search result, not a claim that no correction exists anywhere. No new
source issue duplicates the accepted parent's totally-real correction.

## Baseline and ownership

Read the declarations' actual statements in the source tree at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet retains Tau Ceti
pin `f790474821cf4256814db967cb154e7af3d0c369`; it cites no Tau Ceti
declaration. All baseline references provide infrastructure under
hypotheses satisfied by the ℚ-vector spaces and native complexes here.

| Declaration(s) | Verified use |
| --- | --- |
| `Finsupp.linearCombination` | Linear evaluation of finite symbol sums. |
| `Submodule.liftQ` | Quotient descent after proving the relation submodule lies in the kernel. |
| `LinearMap.ker`, `LinearMap.range` | Kernel and image submodules for the obstruction. |
| `TensorProduct.map`, `TensorProduct.lift` | Termwise linear specialization and bilinear tensor residue. |
| `exteriorPower.map`, `exteriorPower.ιMulti` | Exterior functoriality and alternating wedge insertion. |
| `CochainComplex.of`, `CochainComplex.ofHom` | Native complexes and morphisms with explicit squares. |
| `quasiIso_iff` | Native all-degree characterization with homology hypotheses; no conjectural instance. |
| `Matrix.det`, `Matrix.det_mul` | Empty determinant and multiplicative rational basis changes. |

Read the reviewed Polylogarithms P.4 library audit and the relevant parent
P.1/P.3/P.4 definitions; none of the four audited arithmetic targets is
already provided at the pins. Reused the reviewed K3BlochGroups V.3
conventions, BorelRegulators R.4/R.5 formulas and R.7 small cases.
Read the V.4, R.7 and S.6 stage contracts. The three requests correctly
ask for missing extensions, rather than attributing them to a weaker
existing exact sequence, universal factor-two comparison or generic
Adams operations theorem. Read the ArithmeticDirichletSeries and
HodgeStructures upstream documents for API and dependency granularity.

The elementary cycle obstruction is justified without the full motivic
proof. If `qa=bp` and `p` is onto, changing a lift changes `ax` by
`a(ker p)`, and subtracting such an element produces a cycle exactly when
its quotient class vanishes. In the test with `p=a=id` and `b=q=0`, every
target element has a group lift while only zero has a cycle lift. This
prevents the main presentation error the plan is designed to detect.

## API, Lean and coverage

Each of the eight definitions/constructions has four discriminating
tests and five or six API items. Native linear maps, kernels, tensor
products and quotients retain their existing extensionality and
universal-property API. Additional outlined lemmas expose evaluation,
compatibility, normalization and functoriality without unfolding.

Checked every API and test against the suggested file. Its opening note
honestly identifies generic reductions and omitted full source statements
whose parent definitions do not yet exist. The file checks actual native
objects and explicit equations; it does not encode the missing theorem
as an unconstrained proposition. It does not construct the unavailable
rational-function quotient, full residue complex or motivic comparison.
Elaboration of these signatures does not prove their `sorry` bodies or
instantiate the source-specific hypotheses.

The four target chains terminate in imported nodes, pinned infrastructure,
precise requests or recorded gaps. The dependency graph is acyclic. The
two new planets describe central mathematical objects; together with the
four inherited P.4 planets they satisfy the six-planet limit. The cycle
obstruction remains a useful construction without becoming a seventh
planet. The full weight-four correlator/configuration proof belongs to
the already proposed Part II direction, with no invented live stage id.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/Polylogarithms--P.4.json --json`:
  zero errors, zero warnings, including the available pinned declaration index.
- The shared `check_issues` and `versions_checked` validators accept the
  packet's two findings, source versions and confirmed review verdicts.
  The standalone `check_errata.py` CLI expects an `errata-v1` file and is
  not the validator for this blueprint packet.
- `lean-check research/blueprint/suggested/Polylogarithms--P.4.lean`:
  exit 0 against pinned Mathlib; only `declaration uses sorry` warnings.
  The original input was also elaborated before the two signature fixes.
- Reviewed deliverable scope and whitespace with `git diff --check`.

## Orchestrator actions and remaining mathematics

The reader path is outside issue #6404's deliverables. The packet's new
assembly note therefore carries the corresponding reader corrections:
the ℚ(i) exponent, both derivative misprints and their diagnostic, Zagier
locator, and rational-curve homotopy attribution. Apply these when joining
the parts; the reviewed packet and suggested file are authoritative for
these corrections. In particular, the unchanged reader's statements that
there is only an exponent misprint and that this is literally G95
Conjecture 1.39 should not be copied into the assembled document.

Assign the already proposed weight-four Part II owner and exact V.4,
R.7 and S.6 exports. Continue from the packet's five gaps:

1. Degenerating rational-curve relation specialization.
2. Full explicit weight-four motivic, configuration and period proof,
   including all-explicit-cycle regulator-image containment.
3. Inductive cycle-lifting obstruction vanishing or the weaker calibrated
   period-image containment.
4. Finite-place relation descent, support and signed residue squares.
5. Rational-curve homotopy, any claimed comparison to the all-smooth-curve
   model, and the separate derived-transfer independence statements.

There is no unresolved contradiction in the corrected packet and no
unverifiable node. These inputs remain open explicitly; P.4 must not be
marked closed when this review is integrated.
