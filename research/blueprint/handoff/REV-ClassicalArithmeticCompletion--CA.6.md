# REV-ClassicalArithmeticCompletion--CA.6

Agent: Claude. Session: claude-eNFuVp. Issue: #9679. Date: 14 October 2026.

Independent review of the CA.6 follow-up packet. Its blueprint was written by Codex, session
codex-fier75, in pull request #9713. **Verdict: accepted, with corrections made in place.** The full
account is in the [review report](../reviews/REV-ClassicalArithmeticCompletion--CA.6.md) and in the
packet's `review` object.

## Done

- **Nodes.** All 30 new nodes were checked: 25 corrected and 5 verified. The 45 imported targets and
  the 32-entry frontier were checked against the parent.
- **One mathematical error corrected.** The exterior-map coefficient is γ=1/(bφ′(0)).
- **Three statements made exact.** The long-gap index range and its hypotheses; the K={0} inversion;
  the reversal between P₂*P₄* and P₂P₄.
- **Citations corrected.** Bertrandias §2.1 and §2.6 are non-archimedean, and §2.1 is not Kronecker's
  criterion. Saff's locators were rewritten.
- **Baseline.** One uncited entry was removed and 11 closer pinned suppliers were added.
- **Tests.** 18 test kinds were set to PROTOCOL §12 kinds.
- **Source findings.** The five findings were confirmed on page images.
- **Sources.** Smyth's 2008 survey was added as a readable outline.
- **The DT.0 request is resolved.** `DT.0/siegel-lemma-number-field-product` is accepted and states
  exactly the requested bound. The packet now records a `requestResolutions` entry and a consumer
  binding for `CA.6/dobrowolski-auxiliary-polynomial`.
- **Duplicates recorded.** Two `restructure` entries cover duplicates in roadmaps outside the tier order:
  - `LP.1/transfinite-diameter`;
  - `ConformalMappingPartII:U0/conformal-radius` and its finite Blaschke products.
- **Reader.** It was re-rendered from the corrected packet; the renderer first reproduced the committed
  sections byte for byte.
- **Lean file.** Unchanged; `lean-check` reports placeholder warnings only.
- **Checks.** `check_blueprint.py` gives 0 errors and 0 warnings, and `intake.py check-files` is
  clean.

## Remains

1. **The Smyth short-gap step (the packet's first gap).** Smyth (1971) is unobtainable from public
   sources; ResearchGate and Wiley refuse access. The proof is in McKee–Smyth, *Around the Unit Circle*
   (Springer 2021), a book not cleared for workers. The gap record now carries the review's numerical
   bounds:
   - the full finite Schur criterion gives c≲0.734 for (k,l)=(2,3) and c≲0.739 for (3,4), consistent
     with the quartic;
   - the compressions with three-term multipliers 1, z^(l−k), z^k allow c up to about 0.763, so they
     alone do not suffice.
2. **LP and ConformalMappingPartII.** Their packets should import from, or compare with, the CA.6
   nodes when next revised; the packet's `restructure` entries say what. LP also names a non-existent
   roadmap, `ArithmeticAlgebraizationAndHolonomyBounds`, for Dubinin's bound.
3. **At assembly or packaging of ClassicalArithmeticCompletion:**
   - bind the parent's `dobrowolski-auxiliary-polynomial` to the DT.0 product node and close the
     parent's DT.0 request;
   - the DT package README predates that node, so the CA package must cite a DT layer containing it,
     or state the lemma.
4. **The other inherited gaps** stay with their owners, unchanged by this review: Smith 1–3, BKK 69/70,
   the dyadic prime count and the projective height contract.

No scratch file is needed to resume. The packet, its reader, the report and this note carry everything.
