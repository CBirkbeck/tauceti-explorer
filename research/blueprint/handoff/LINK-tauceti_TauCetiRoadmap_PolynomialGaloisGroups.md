# Handoff: PolynomialGaloisGroups links

Worker: ChatGPT Pro — cgp-95cdeccd608b
Job: LINK-tauceti_TauCetiRoadmap_PolynomialGaloisGroups
Issue: #30
Input revision: dbafc759460581dbd23999a3c112149fedefe2b5
Claim comment: 5713497981; session-specific acceptance: 5713499996.
Status: work-in-progress checkpoint, not a complete catalogue mapping or submission.

## Inputs and scope

The complete PolynomialGaloisGroups README was read, including all eight recorded layers (0–6 and 9). The complete CFSGStatement README was also read. The BelyiMaps opening contracts and complete Layers 0 and 1, plus Layer 3 through its end, were read; the remaining Belyi layers are not yet fully examined. ProfiniteCohomology's complete Layer 13 was read. Complete campaign documents read: ComputationalNumberTheory, ArithmeticDynamics, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatistics and ClassicalArithmeticCompletion.

All entries of data/roadmap-summaries.json were read. This is a summary-override file, not the full catalogue; the additional upstream scopes and the full catalogue-wide text screen still need completion. Directory inventory is not counted as reading a mathematical document.

Baseline pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Roadmap declaration names are contracts, not independently verified implementation claims.

## Findings to retain

The polynomial roadmap explicitly imports exactly one NumberFieldArithmetic theorem: the factorization-type/Frobenius-cycle statement of Layer 3.10. Do not add wider ramification or Chebotarev dependencies, and do not duplicate the existing NFA link.

BelyiMaps explicitly consumes fullCycleType and the transitive-reference/label package. Its Layer 1.6 asks for n <= 11 and cites a PolynomialGaloisGroups Layer 7 that is not present in this input; the actual supplier classifies degrees 1–5. Scope any supplied link to that range and record the remaining contract gap.

PolynomialGaloisGroups Layer 1 and ProfiniteCohomology Layer 13 both request the permutation wreath product. Record an ownership overlap rather than guessing a current dependency. A shared general Q-set semidirect-product carrier should retain nonfaithful top actions; the profinite consumer still owes topology, continuous monomial homomorphisms, tensor induction and the norm construction.

CFSGStatement defines group carriers and a classification proposition; it does not prove simplicity, orders or recognition and cannot supply those facts for the low-degree classification here. The other broad campaign consumers need exact stage-level matches; generic mentions of certificates, Galois groups or rooted trees alone do not establish a link.

## Statement issues under verification

- The generic imprimitivity embedding requires a faithful G-action, or replacement of G by its permutation image. The layer expressly allows abstract group actions.
- The S5 order-30 subgroup argument must not assert an exact kernel order of five from a map to S4 without proving its image order. A nontrivial normal kernel contained in the supposed subgroup suffices for the contradiction.
- Check the quartic example's claim that the discriminant of x^4+x^3+x^2+x+1 is a square; its discriminant is 125.
- Track the reference-subgroup data used in resolvent stabilizer claims separately from the later arithmetic label/certificate theorems to avoid a circular layer dependency.
- Separate the finite-field irreducible-polynomial existence statements required at 2, 3 and 5 in the Sn realization.

## Next steps and validation

Finish the Belyi label/data consumer, exact stage-ID verification, catalogue screening, and duplicate checks against the atlas and all other link packets. Write the links-v1 packet with verbatim evidence from both sides and precise remaining requests. Run local structural tests, then the repository check_links.py through the supported PR workflow if the complete atlas cannot be materialized locally. No validation result is claimed at this checkpoint.

Only the authorised link packet, this handoff and scratch files may change. No git commands, source-roadmap changes, merges, approvals, issue closure or done labels are authorised. This checkpoint does not release the claim.
