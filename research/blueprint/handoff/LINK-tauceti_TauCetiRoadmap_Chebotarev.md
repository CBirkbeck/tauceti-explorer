# Chebotarev links — active checkpoint

Job: `LINK-tauceti_TauCetiRoadmap_Chebotarev`; issue #21.
Worker: **ChatGPT Pro — cgp-780fc5e50f71**.
Input revision: `7821d19ab4fd547181beb46287f8968ec64847d1`.
Branch: `browser/cgp-780fc5e50f71/chebotarev-links`.

This is an active checkpoint, not a finished submission or an independent review. The exact-session claim was accepted in issue comment 5696801432, referencing claim comment 5696786549. Resume comment 5696843282 supersedes the earlier stopped-run notice.

## Work preserved

A local draft contains 26 prerequisite links and three overlap records. All fourteen target stages have been read. ArithmeticDirichletSeries was read in full; the relevant NumberFieldArithmetic and GlobalNumberFields stages were checked in full. Downstream reading covers the Euler-system, integral-determinant, representation-recognition and auxiliary-prime applications. The full catalogue sweep and publication of the packet remain in progress.

## Source concerns already isolated

1. Chebotarev §12.1 says deletion of finitely many Euler factors preserves the residue of the Dedekind zeta function. It preserves the order of the pole, not its residue: the residue is multiplied by the product of `1 - N(p)^(-1)` over the deleted primes. The coefficient of the pole of the negative logarithmic derivative is still one. GlobalNumberFields §3E retains the correct finite Euler correction.
2. The detailed Layer 5 text explicitly supplies nonvanishing at `s=1`, while §12.1 needs a continuous regularized boundary on the entire line `Re(s)=1`. The concluding ownership section assigns full-line nonvanishing to Layer 5; its proof and twist/positivity hypotheses need an explicit named interface. Generic Wiener–Ikehara does not supply this missing analytic argument.
3. The disjoint-tag sentence of §7.5 calls `Gal(M/K)` abelian before the standing paragraph assumes `Gal(L/K)` abelian. The application in Layer 9 is abelian; the preliminary statement must retain that hypothesis.

No source roadmap has been edited. These concerns belong in the maintainer's reconciliation and subsequent blueprint review, not in a silent alteration of an input document.

## Validation and baseline

The pinned commits were read from `research/blueprint/baseline.json`: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Names cited as exports are mathematical roadmap contracts, not library declarations audited at these pins.

The full validator has **not** run. `scripts/check_links.py` requires the full `data/atlas.json`; this session has browser access to the extracts but no mounted repository or working network download into its Python environment. The pull-request workflow is configured to run the full validator on changed link files. Its actual outcome must be recorded after publication, not inferred from the existence of the workflow.

## Remaining checkpoint tasks

Finish candidate searches and explicit scope exclusions; confirm endpoint IDs and literal evidence; publish the packet; reconcile against live input revisions and other link submissions; run/read the applicable checks; replace this checkpoint with the final handoff and post the submission on #21. No new job is reserved.
