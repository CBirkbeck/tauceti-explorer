# REV-RS-12 handoff

Refs #823. ChatGPT Pro, session `cp-7b4e91`, 2026-09-21.

**Review finished; proposal needs changes.** The author was a different session,
`cg-6b83f1`. Read the review in `research/blueprint/reviews/REV-RS-12.md` before
integrating the proposal. No implementation or source-blueprint completion is
claimed.

Changed only the proposal, independent review and this handoff. The proposal now
has a `review` object with `status: needs_changes`. Its AG2.5 contract separates
the ramified irreducible principal-series test (`N=0`) from the Steinberg test
(`N!=0`). Its R19.1 contract explicitly carries forward the required correction
to the inherited characteristic-p fibre count; the F5 counterexample was rerun.
The source documents and partial decomposition packets are not edited.

The remaining issue is structural: AG2.0/AG2.1a are kept in Part II but supply
its declared base through ET.6 → R16.3 → R16.6 → R19.1. Preserve that raw
cohomology input. Do not insert R19.1 → AG2.0, which creates a cycle. Resume by
choosing a genuine shared-foundation/extension boundary or by performing a
source-supported refinement of the relevant existing dependency; record all
new owners and consumer forwarding. The review gives the exact witness and
required conservation checks. This choice was not silently made across other
workers' roadmap boundaries.

## Checks run

At repository snapshot `9d79cd8f47dad84d63319b99ce6910a8d41c7721`:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-12.result.json`: **ok**.
- `python3 -m unittest discover -s tests -p 'test_check_restructure.py'`: **8 passed**.
- `python3 -m unittest discover -s tests -p 'test_intake.py'`: **21 passed**.
- Independent Python graph/conservation check: sixteen family stages, twenty
  ownership scopes, thirty distinct proposal links, twenty external consumer
  edges retained, all four narrowing-forwarding sets complete. The existing
  2,019-vertex, 3,508-edge DAG becomes a 3,534-edge DAG. The counterfactual reverse
  edge above produces a cycle, as expected.
- Exact finite checks: nonsingular F5 curve has five rational points; a nonzero
  square-zero N satisfies `F*N*F^-1=N/2`; no-ratio-p examples distinguish repeated
  eigenvalues from forbidden cyclotomic ratios.

The schema check does not certify the unresolved extension frontier. No
suggested Lean file was changed; Lean compilation is not applicable to this
restructuring review. The inherited partial blueprints and their source gaps
remain partial. No git commands were run to prepare or submit these changes.

Submission branch `cp-7b4e91-rev-rs12` starts at
`9d8d1e955901f08441f25b7241dd256533683ef7`. The GitHub comparison with
the input snapshot lists no changes to the review inputs, atlas or relevant
validators. The live proposal blob was still
`78948f23888e4ae300a4507e2dd4f13131c242bd` before the review edit.
