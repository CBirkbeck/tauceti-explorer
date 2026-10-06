# Independent review of GH.8

**Verdict:** accepted after corrections; complete target-level planning pass,
with GH.8 still **planned**, not closed or implemented.

**Reviewer:** Codex (GPT-6), session `codex-Wb8VXc`, 6 October 2026.
**Job:** `REV-GeneralizedHeegnerCycles--GH.8`, issue #417.
The reviewed input was completed by session `codex-Wlk1LX` for issue #740
and merged in PR #6725. This reviewer did none of that work.

The packet has 16 nodes: five comparisons, four theorems, five lemmas and
two applications. All 16 were checked: **11 verified, five corrected**.
No nodes were added, removed or renamed. There are 11 confirmed baseline
declarations, nine precise supplier requests, six gap groups, 66 acceptance
checks and four planets. There are no new definition/construction nodes,
so no new-definition API or unit-test inventory is required. Arithmetic
objects are imported from their owners. All implementation statuses remain
unchecked.

## Corrections made

1. **GH.5/GH.6 ownership.** The atlas and reviewed audit assign higher-weight
   Kolyvagin systems, admissibility and the integral leading-class comparison
   to GH.5, and CH non-torsion/Selmer consequences to GH.6. The BSD export and
   its two requests had these reversed. Corrected the requests, statement,
   proof steps and gap detail. The leading-class unit is a higher-weight
   GH.5 comparison on the actual GH.3 class; the elliptic HE.8 comparison
   does not supply it.
2. **BSD dependency range.** Removed the BSD export's prerequisites on the
   all-split/p-old weight-two export, the two point-factor lattice lemmas,
   and the elliptic HE.8 nodes. Its native GH.2–GH.7 imports directly supply
   the higher-weight inputs. This retains the precise range-adapter gap:
   corrected BSD Theorem 2.3 requires a nonsplit prime exactly dividing the
   tame level, while the inspected CH standing hypotheses have all tame
   primes split. Neither a weight-two point comparison nor a generic
   nonzero denominator proves the integral leading-class unit. GH.7's
   analytic moments are imported independently of the excluded p-new
   weight-two class specialization.
3. **Ramified conductor fields.** Kept `differential-evaluation` in the
   inspected BDP finite-unramified, good-reduction range. Its use in
   `weight-two-reciprocity` now explicitly requests GH.1 and
   PadicHodgeRegulators L1 comparisons at the actual finite local conductor
   fields, which can be ramified. These include de Rham scalar extension,
   restriction/Bloch–Kato logarithm and corestriction/trace squares, the
   filtration and differential pairing, and the degree-one comparison for
   divisors defined over the extension itself. Naturality on classes that
   descend to the unramified base is not enough for every extension-rational
   CM point. CH author text Section 4.5, p. 19, states the de Rham
   scalar-extension identification; it does not by itself prove all these
   arithmetic squares. Added that locator, direct prerequisites, precise
   requests and acceptance/remaining checks. The completed unramified
   **coefficient** field is not the finite local **conductor** field.
4. **HE.8 supplier hypotheses.** Its current three point-system nodes require
   `E(K)[p]=0`. Added that condition wherever they are invoked, together
   with the actual anticyclotomic indexing and finite ring-class component
   maps. The abstract tail calculation does not establish torsion vanishing.
   For an auxiliary conductor, the finite component is retained until the
   specified corestriction; it is not automatically the conductor-one system.
5. **Suggested differential signature.** Added
   `differential_squared_transport` and three rational examples: scalar 3
   gives 1/9 in the squared formula, one inverse power fails, and a zero
   scalar loses the Abel–Jacobi value. The arithmetic signature is still
   omitted until its actual realization interfaces exist. Updated the file's
   explanatory comment to record the corrected ownership and supplier range.
6. **Review metadata.** Added the required verdict on `E-GH8-1` and a top-level
   review with one justified verdict for every node. Expanded the existing
   gap groups rather than hiding the new obligations or claiming closure.

## Sources and source finding

All seven PDFs were freshly acquired. Each SHA-256 agrees with the packet's
full hash; the following are independent bounded readings, not claims to
have reconstructed all supplier proofs.

| Source | Passages checked |
| --- | --- |
| [BDP published 2013](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Sections 2.3 and 3.1–3.4, pp. 1062–1070: degree-zero divisor, field of definition, Gysin and local realizations. |
| [CH published 2018](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf) | Proposition 4.4 and Section 4.4, pp. 591–593; Definition 5.2 and Lemmas 5.3–5.4, pp. 601–602. |
| [CH author text, 2 July 2022](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | Standing hypotheses; pp. 17–19 and 21–25: carrier and character maps, de Rham base change, local regulator quotient, stabilization, ordinary-line pairing and Theorem 5.7. |
| [Castella family author copy](https://web.math.ucsb.edu/~castella/Heegner.pdf) | Introduction; Theorem 2.11 and proof, pp. 12–13; local/global hypotheses and Proposition 5.2/Theorem 5.3, pp. 21–23; Lemma 6.4, Theorem 6.5, equations (6.7)–(6.9) and Remark 6.6, pp. 27–29. |
| [Loeffler–Zerbes v3](https://arxiv.org/pdf/1108.5954v3) | Definition 4.6, Theorem 4.7 and Propositions 4.8–4.11, pp. 16–18, including the infinite-unramified-direction injectivity proof. |
| [CH erratum](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf) | Entire one-page correction: dimension formula, unramified hypothesis, replacement derived local-condition argument, abelian-extension condition. |
| [Multiplicative BSD correction](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | All five pages, especially Theorems 1.1/2.3, the higher-weight import list and auxiliary-form/congruence proof with footnote 1. |

Every node locator and short excerpt was checked in its source. The revised
CH Theorem 5.7 has the negative sign, `t^{-2r}`, the `psi^{-1}` twist,
`c_0^{r-1}` and the group element `sigma_{-1,p}`. The Castella family identity
has its native positive sign and its own pairing conventions. The packet
correctly requests maps between these formulations rather than equating
their notation. Its source-qualified regulator localization and period
conditions remain necessary.

**`GeneralizedHeegnerCycles/E-GH8-1`: confirmed.** Independently inspected
the rendered published p. 593 and the author revision p. 17. Let
`h=[H_K:K]>1`. The full symmetric-power carrier on the left has rank 1 at
`r=1`, while the induced carrier on the right has rank `h`. At `r=2` the
ranks are `h(2h+1)` and `3h`. Coefficient extension and Tate twist do not
change these ranks. The printed full-carrier isomorphism is false. In
positive degree, pure conjugate components can supply an induced submodule;
they do not exhaust the mixed monomials. Degree zero needs a separate
carrier. GH.0/GH.3 must construct the repair or bypass. This finding does
not assert that all downstream theorems are false.

The NTU erratum, the [UCSB-hosted erratum](https://web.math.ucsb.edu/~castella/erratum.pdf),
both authors' publication pages and source-specific searches were checked
on 6 October 2026. No correction of that display was located. This is a
bounded search, not an assertion that no correction exists anywhere.
The full-unit versus half-unit first-step convention and regulator quotient
descent remain comparison gaps, not additional confirmed source errors.
The differing Kobayashi–Ota lemma numbers in the two erratum versions do not
change the packet's version-qualified NTU reference.

## Baseline, suppliers and closure

Read every cited declaration with its surrounding hypotheses at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. No baseline citation was removed
or replaced.

| Declaration | What its actual statement supplies |
| --- | --- |
| `LinearMap` | Additive, semilinear maps; ordinary linear transport is a specialization. |
| `Module.Dual` | The module of linear maps to the scalar ring. |
| `LinearMap.dualMap_apply` | Evaluation of the transpose as composition. |
| `LinearMap.dualMap_comp_dualMap` | The reversed composition law for transposes. |
| `Int.natAbs_le_of_dvd_ne_zero` | The integer absolute-value bound used in the doubling-tower obstruction. |
| `Submodule.mapQ` | A quotient map with the required source-submodule containment. |
| `Submodule.ker_mapQ` | The descended kernel is the quotient image of the target-submodule preimage. |
| `Submodule.mkQ_map_self` | The source submodule maps to zero under its quotient. |
| `LinearMap.ker_eq_bot` | Zero kernel is equivalent to injectivity. |
| `Equiv.prod_comp` | Finite reindexing; its `to_additive` attribute generates the checked `Equiv.sum_comp`. |
| `MulChar.sum_eq_zero_of_ne_one` | A nontrivial character sum vanishes over a commutative integral domain; this does not require the target module to be torsion-free. |

These declarations provide the cited algebra and none of the missing
arithmetic realization maps. At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, read the abstract
`OrderSystem.weightedAbelJacobiClass`: it is a formal divisor-class map,
not the Jacobian variety or its étale realization. Read the multiplicative
Kummer near miss separately. Searches for the Heegner/Iwasawa/regulator
interfaces and the accepted GH library-audit entries support keeping these
as actual supplier obligations. No available library definition is replanned.

Read all direct HE supplier statements: conductor-change kernel and
ring-class quotients, the modular parametrization, first and repeated trace
relations, finite/continuous elliptic Kummer compatibility, and the three
HE.8 point-system nodes. Also read GH.0–GH.7, the integrated GH.4 reciprocity
node, PadicHodgeRegulators L1, AutomorphicCongruences L2/L2s, BSD.6a and
ModularIwasawaMainConjectures L6. Finer HE nodes remain direct imports.
Requests are explicit extensions of their suppliers' current statements;
the review does not treat requested results as already proved.

The two upstream models, `JacobianChallenge/README.md` and
`GrothendieckEulerForms/README.md`, were read in full. The packet follows
their separation of actual carriers, comparison maps, hypotheses and
discriminating examples. No change to an upstream roadmap is proposed.

The first seven geometric/ordinary targets, the initial normalization,
uniform lattice and denominator targets, the primitive-character
comparison, and the three reciprocity/export targets cover the GH.8 stage
inventory. Their corrected graph has no consumer-to-producer proof cycle.
The six remaining groups are precise: degree-one realizations and local
base change/uniform lattices; CM carrier and character descent; initial
normalization and HE.8 range; regulator/period/specialization maps;
corrected BSD range and leading-class unit; actual arithmetic Lean APIs.
This justifies `complete` for the planning pass and `planned` for coverage,
with zero closed stages. There is no unresolved contradiction in the
corrected packet.

## Acceptance examples, Lean and planets

Independently checked the first-trace expansion, the 1/4 versus 1/8 unit
diagnostic, bottom-only rescaling, common-multiplier coherent lifts,
doubling-tower counterexample, character cancellation with torsion modules,
and the C4, ZMod 8 and C9/F19 boundary examples. The quotient regression
correctly distinguishes injectivity before and after quotienting; a nonzero
functional is injective on an identified line, not on a two-dimensional
space. A specialization of a ring containing `lambda^{-1}` cannot send
`lambda` to zero. Reduction transports exact scalar equalities, not
characteristic ideals or nonvanishing after killing a nonunit.

The suggested file now has **13 named algebraic signatures, 32 examples
and six declaration checks**. Arithmetic signatures identify their missing
supplier APIs instead of inventing opaque carriers or conclusion-bearing
structures. Elaborated with `lean-check` against the exact Mathlib pin:
**exit 0, 45 `sorry` warnings, no errors or other warnings**. These are
signature and regression statements with placeholder proofs, not formal
proofs of GH.8. Available memory exceeded the required 20 GiB before the
single compile.

The four planets remain appropriate central comparison theorems:
Weight-two Abel–Jacobi comparison, Modular differential comparison,
Weight-two ordinary-family comparison and Weight-two explicit reciprocity.
No locator-only or incidental algebraic diagnostic is promoted to a planet.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json`:
  zero errors, zero warnings.
- `lean-check research/blueprint/suggested/GeneralizedHeegnerCycles--GH.8.lean`:
  elaborated with only the 45 intended `sorry` warnings.
- Submission file validation and whitespace checks are recorded in the
  handoff after checking all four final deliverables.

## Reader errata and orchestrator follow-up

The reader is **not** an editable deliverable of issue #417. This report and
the corrected packet provide the following explicit errata to it; no
unlisted file was changed.

- In “Export to the corrected multiplicative BSD proof”, replace GH.6/HE.8
  as the supplier of the higher-weight leading-class unit by GH.5 on the
  actual GH.3 class. Replace “GH.5 owns non-torsion … GH.6 owns the
  Longo–Vigni Kolyvagin system” by GH.6 and GH.5 respectively.
- In “Differential evaluation” and “Weight-two explicit reciprocity”, add
  the finite, possibly ramified conductor-field comparison described in
  correction 3. Retain the inspected unramified BDP statement.
- In the HE.8 comparisons, retain `E(K)[p]=0`, the conductor indexing and
  finite-component maps described in correction 4.
- In “Source carrier and build order”, the corrected BSD export uses native
  higher-weight inputs directly; its proof does not require the preceding
  all-split/p-old point comparison. Update the suggested-file counts to
  13 signatures and 32 examples. The six gap groups and 16 nodes remain.

The orchestrator can synchronize these reader passages in an authorized
reader/assembly follow-up. That housekeeping is outside this review's
deliverable paths. Before mathematical closure, the separately owned
suppliers must resolve the six recorded groups; neither promotion nor this
acceptance certifies those arithmetic results.
