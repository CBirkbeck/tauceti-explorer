# BP-PadicDifferentialEquationsAndRigidCohomology--RD.0

Completed planning pass for issue #9742 by Codex, session codex-kedTO0. This is a complete blueprint submission, not an implementation or a checkpoint. RD.0 is **planned**, not closed: its prerequisite chains reach the reviewed parent's targets, pinned Mathlib, F1's existing definitions, or the three precise lower-tier requests in this part.

## Delivered

The part has 22 new targets: 3 definitions, 5 constructions and 14 theorems; 43 API items, 32 discriminating unit tests, 3 additional planets and 12 personally inspected baseline declarations. Every implementation status remains unchecked. The parent packet is untouched. The reader contains every target statement, hypothesis, proof route, API item, worked test, direct dependency and acceptance check.

All four areas in the parent's RD.0 remaining list are addressed:

- **Arabia §§1–2:** controlled weak lifting and endpoint-preserving reduction homotopies are RD targets. The ordinary arbitrary-ideal lifting proof belongs to SchemeAndStackFoundations:SF.0. Its request includes the smooth-complete-intersection retract, lift of its projective conormal module, matrix idempotent correction with the commutator argument, and the product-ideal neighbourhood preserving both specified maps. F1 supplies the weak-completion collapse. The new rational integration target explicitly proves polynomial denominator growth and the graded chain-homotopy identity after shrinking a fringe.
- **Slopes 2.2.19 and 2.2.21:** valuation bases and valuation p-bases, the finite-p-rank Laurent example, the coefficient-of-one projection with uniform truncated partial-valuation estimates, completed Galois invariants and tensor injectivity/coefficient descent are specified. The proof uses levelwise density in completed perfection, not π-adic density of the algebraic perfection tower. Completed characteristic-p fixed fields are requested from PerfectoidSpaces:P3. Full faithfulness itself remains the parent's later-layer theorem.
- **Laurent topology and Lazard theory:** Fréchet chart seminorms, the final seminorm/LF Robba topology and finite coefficient extension are specified on the parent's single coefficient carrier, in either characteristic. Compact preparation/PID theory holds for arbitrary complete coefficients. Locally finite closed-point divisors include inseparable factors. Majorants, jet interpolation and the nonzero closed-ideal correspondence require completeness; exact prescribed divisors and the stated noncompact Bézout/principality theorem require spherical completeness. Zero ideals are treated separately. The Robba closed-ideal proof uses finite zero-factor removal and Laurent approximation on compact windows, with no spherical-completeness assumption in that particular proof.
- **Integral Amice and full Frobenius:** explicit weak neighbourhoods U(m,N), inverse-limit quotient ring isomorphisms and weak completeness/density justify substitution. Its positive tail uses nilpotence modulo π^m; its negative tail uses coefficient decay. The full analytic extension states the near-boundary threshold and radius change r→r^(1/q), and checks the norm identity rather than just an upper bound. The same-chart assertion is rejected by the negative-tail example.

## Ownership and manager actions

RT-AREA-padic-2/31 is handled according to the **binding current WORKERS tier order** and the reviewed parent's ownership change. Dagger carriers and differentials are imported from AdicSpacesPartII:F1. The Laurent carrier is imported from the parent RD.0/frobenius-lift-on-robba-ring, not redefined and not imported from higher-tier P7. The new topology and generic compact preparation consequently supply P7's corresponding targets. Reconcile RS-26's old owner/formerly assignment and P7, PG.0 and R30.1 imports; do not reinstate upward dependencies. The part's `restructure` entry records this proposal.

The remaining supplier incorporation is exactly:

1. **SchemeAndStackFoundations:SF.0:** ordinary controlled lifting and endpoint neighbourhoods of Arabia Théorème 2.1.2, Corollaire 2.1.3 and Théorème 2.2.2, with the interior proof inputs in the request. The existing étale neighbourhood and section selector do not supply arbitrary residual matrix-idempotent lifting. The request explicitly asks its owner to inspect the cited Elkik Lemma 3, p.562, or prove the conormal retract directly; this pass did not inspect Elkik.
2. **AdicSpacesPartII:F1:** flat mod-π weak-completion invariance, weak generation by lifted mod-π generators with a linear degree bound, and relative weak completion of finite étale presentations over a weakly finitely generated base. The canonical collapse must preserve the maps to the quotient and both endpoints. F1's current smooth-source-and-target lifting does not cover the arbitrary weak target needed here.
3. **PerfectoidSpaces:P3:** completed characteristic-p fixed fields and the perfect-base Ax–Sen approximation, using the trace-one p-root argument of Fontaine–Ouyang 3.6/3.8. No higher-tier mixed-characteristic Ax–Sen theorem is imported.

RD.5 already owns relative Robba rings over dagger bases. Preserve its radius/fringe quantifiers: every sufficiently small radius can choose its own fringe. Finite coefficient-field extension here does not replace that relative carrier.

At assembly use `planetAssembly`: retain the parent's Robba Frobenius, analytic Bézout and dagger Frobenius planets; add valuation p-bases, overconvergent tensor descent and analytic divisors; demote the other three parent displays without deleting their targets. This leaves six planets in the combined layer. This worker did not edit any parent or supplier packet.

## Source audit

The packet gives edition-specific URLs, read sections, dates and public-PDF hashes. Read Arabia §§1–3 at every cited proof, Slopes §§2.1–2.4 and the §7.5 use of tensor descent, its journal PDF, arXiv v4, published 2007 erratum and 2013 additional errata, Kedlaya's overview Chapter 3, Lazard §§1–8 at all cited constructions, Colmez's author-copy Préface pp.24–25, and Fontaine–Ouyang 3.6/3.8. The cleared van der Put (2.4.4)(iii) and Kedlaya Finiteness §2.5 were read in place; neither scan nor extracted passage was copied to the repository.

Six new findings E101–E106 await independent review. E101 gives the explicit infinite coefficient-p-basis counterexample to Slopes Example 2.2.18; E102 restores y_1 in the tensor rewrite. Both inspected Slopes versions already correctly say “dependent.” E104 restores α in the Fontaine–Ouyang trace identity. E103, E105 and E106 address the zero-ideal exception, the erroneous pointwise valuation sum, and the centre-containing-disc Laurent completion in Colmez's **April 2017 author copy only**. The full SMF version of record was not obtained; its five-page publisher sample does not include p.24. Do not attribute those three findings to the uninspected published page. The packet documents the searches for prior corrections and does not claim exhaustive novelty. Lazard's statements used here produced no additional source finding.

Missing source inspections: Elkik's cited proof; the full published Colmez page. Neither omission is silently represented as inspected. Their effect is respectively an explicit supplier proof obligation and restriction of the findings to the author-copy edition. All mathematical targets use the corrected, explicitly qualified statements.

## Library and upstream audit

Planning pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The 12 Mathlib declarations were read with their hypotheses, including general-field WithSeminorms, finite-basis continuous coordinates, IsBezout, nilpotent formal-smooth lifting, Witt coordinate functoriality and polynomial evaluation/division. Nilpotent lifting was not treated as a solution of arbitrary-ideal controlled lifting.

Current read-only TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected. All nine post-snapshot Suggested files and Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were searched for the specialized carriers/results; no matching target was found. AdicSpaces and LocalFieldsRamification readers were read for nearby interfaces. All 28 atlas link packets mentioning this roadmap were inspected to identify consumers and ownership boundaries. Public Mathlib PR/Zulip searches yielded no usable matching specialized formalisation. The reader states the limits of the negative keyword search. No lake command was run in either read-only tree.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.0.json --index <scratch declaration TSV>`: 0 errors, 0 warnings. The scratch TSV indexed 246,008 declarations from the pinned Mathlib tree. All cited baseline references resolve.
- Swarm intake file check: all four authorized paths, 0 problems.
- Shared source-issue and source-version validators: passed for all six findings.
- Reader/packet cross-check: all 22 exact statements, 43 API items, 32 tests and every acceptance check agree; no target or finding ID collides with the parent's IDs.
- `lean-check research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.0.lean`: exit 0, only nine expected `sorry` warnings. Memory was checked first and exceeded the 20 GB requirement. The file is 103 lines with one real-bodied predicate on an existing carrier; all heavy analytic definitions stay in the reader.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.0.lean`: passed.

Independent review should verify the source findings and the annulus adaptations of Lazard's compact-window/interpolation arguments, then apply the supplier contracts and ownership/display reconciliation. There is no unfinished local authoring to resume, and no scratch file is required to use this submission.
