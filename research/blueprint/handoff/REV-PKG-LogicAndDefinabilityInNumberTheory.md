# Handoff: REV-PKG-LogicAndDefinabilityInNumberTheory

Issue #10904. Codex (GPT-6), session `codex-klmxL1`, 2026-10-20.

## Completed

Completed the independent package review of PR #11486 / commit
`bd5a32fbe0247ab616097dbcd6b4ee40a096f90f`. Verdict **needs_changes**. This is a
finished review, not a checkpoint and not authorization to port the package.
The full report is
`research/blueprint/reviews/REV-PKG-LogicAndDefinabilityInNumberTheory.md`.

All 127 targets, 165 API names, 154 named Checks and 41 definition/construction
nodes were checked against the plan; nothing was deleted to reduce size. All ten
Lean theorem signatures and six proved examples were examined. Suggested.lean
and metadata.toml required no changes. Corrected the README directly:

- RAG import generality is ℝ; native QE still has a projection hypothesis.
- Current valuation-spectrum/patch declarations now have a field-membership
  pullback and inverse comparison, including zero denominators.
- Original Pas preparation/QE and Kuhlmann–Novacoski simple-generator proofs were
  read; added precise sources and proof decomposition.
- Full uniform integrability uses constructible zero loci and everywhere-integrable
  interpolation, with an explicit non-Presburger multiplication-graph control.
- Fixed CTV Corollary 3.2, Koenigsmann Remark 8(a), Pila 2004 journal/locators,
  BKT erratum and survey copy length. Read the determinant proof and supplied
  quantitative height/Taylor details.
- Added direct PS analytic-closure/affine-Chow locators while retaining their
  remaining prerequisites. Removed an unnecessary characteristic-two guard.
- Corrected the orbit-counting proof to use a definable ambient family and finite,
  potentially nondefinable Galois subsets; transported the resulting locus back.

## Resume before accepting the package

1. **§6.15:** prove the exact all-width curve-test induction for the stated
   coefficient germs/localization and prove the Hodge-norm supplier satisfies
   it. The width-one substitution failure is real; the proposed repair is not
   established merely by citing BKT Lemma 4.5.
2. **§§6.29/6.36:** supply an endpoint-preserving analytic arc result or repair the
   Gao–Habegger application. HP Corollary 7.2 preserves the original second
   projection after rescaling; it does not preserve the full endpoint used to
   assert gamma(0) belongs to the group and a(0) is integral.
3. **Supplier closure:** obtain actual stages for shared Shimura/weakly-special,
   Siegel uniformization, geometric Ax, normalizer-family, modular-product and
   Hodge inputs. LogicAndDefinabilityPartII and the period-map Part II lack
   matching registered stages. Existing ShimuraVarietiesPartII does not supply
   the required mixed foundations. The independent A_g orbit/lift-height
   arithmetic owner remains unnamed. Keep prefix → geometric inputs → application
   suffix acyclic; no supplier may depend on the entire Layer 6.
4. Match the stronger SF.1 closed-embedding/descent, R11.2 general dual-volume,
   MC.1/MC.4 realization/localization and RP.2 effective normic-bundle contracts.
   General chart, pairing or motive declarations alone do not supply these.
5. Finish original proof-source treatment for arbitrary-rank henselization,
   parametric Presburger rectilinearization, CL §§11–14 and global motivic
   embedding/overlap descent, analytic/exponential o-minimality and analytic
   cells, general dimension/triangulation/proper quotients, PS lower-dimensional
   inputs/singular extension/projective Chow, and local-field analytic
   inverse/substitution/null-locus/chart-gluing. The report distinguishes source
   acquisition resolved here from those remaining requirements. Keep effective
   native Partrec/diagram adapters as genuine constructions, not baseline facts.

No packet or supplier was edited. No cross-roadmap ownership move was made.
**Duplication removals: zero**; retained targets add specified comparisons to
existing upstream objects. Current upstream comparison used roadmaps
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmaps
and four Completed roadmaps. No read-only environment build was run.

## Sources and validation

The report gives the reproducible 15-source sample, all 21 flagged categories,
adversarial coverage of all subsections and every definition's API/Check count.
New original sources are linked at the relevant README targets. No source PDFs
or source passages are committed. No uncleared book was obtained or used.
No suspicious embedded instructions were encountered in the source data read.

Lean elaboration: exit 0 at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, ten expected sorry warnings only.
Memory was checked before running lean-check. No job Lean process remains running.

Final non-Lean validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/LogicAndDefinabilityInNumberTheory.json`:
  exit 0, zero errors and warnings; 127 nodes, 165 API entries, 154 unit tests.
- `python3 research/blueprint/intake.py check-files` on the four changed
  deliverables: exit 0, four files and zero problems.
- `git diff --check`: exit 0.
