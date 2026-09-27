# BP-DirichletPadicLFunctions: Bernoulli Mellin–zeta comparison

Codex / codex-7e92bd. Issue713, primary claim5854790528 confirmed5854791937.
Same-session follow-up to merged PR3231, headbf829d45961b222ca1748fec0c1540c1047ef3fe,
mergebc3725db1df8bff4b4c97d6ba803d1ed45429b50. No additional claim.
Partial blueprint, every implementation status unchecked. Independent review390
must remain unclaimed for automatic follow-up intake.

## Delivered

Five L0 declarations give convergence of the actual Bernoulli Mellin integral,
its Gamma-weighted Dirichlet HasSum, Γ(s+1)ζ(s+1) on Re(s)>0, the exact normalized
factor s, and equality L(s)=sζ(s+1) for s≠0 by native analytic uniqueness.
The origin test gives L(0)=1 and differs from the raw totalized product0·ζ(1).
The general sum/integral theorem hasSum_mellin is native and is reused directly.
Its scaled integrals and absolute interchange are not new roadmap nodes.

Totals115 nodes:1 definition,11 constructions,69 lemmas,29 theorems,
5 comparisons;103 API entries;82 packet tests (70 definition/construction),
85 typed examples;16 planets;192 baseline references. Five gaps,one request,
nine source findings and zero closed stages remain. The five new declarations
extend the actual kernel's API;109 other old node objects,183 baseline objects,
all previous suggested bytes and all nine findings are preserved. Four new
tests detect a missing Gamma factor and an incorrect removable value.

## Source and ownership

Published RJW complete printed110–114/PDF11–15 read, including the full Lemma2.7
proof. Printed112 visually checked. The fifteen exact native declarations and
the full hasSum_mellin proof were read at the pinned Mathlib commit. Its role
was independently confirmed with a complete native instantiation. The twelve
primary origin node objects were read fully. Reviewed L0 audit and accepted
RS14 boundary read; binding protocols,two upstream models and touching links
retain their continuous prior reading provenance and unchanged captured blobs.
Input deltas: the already-read LAD quotient/resultant supplier112, and the
registry addition of DiophantineApproximation E217–E224. All eight new registry
entries and their REGISTER additions were read; they do not affect this slice.
No new source finding. E2/E5 remain the derivative/Bernoulli-sign corrections.
No new generic continuation, native zeta values or Bernoulli carrier is planned.

## Validation

Indexed blueprint:0errors/0warnings. Four-file intake:0problems. Versioned
errata wrapper, exact preservation, signature/test/reader parity and output
scope checks pass. The acyclic graph reaches191nodes with802edges and262
baseline leaves; its sole stage leaf is the preserved PMIA L1 request.
Suggested-file SHA256: `d0cd078ae0bd96415e8676381c48ae7ed0a58fb2f70fdb208325e7c17dae5aed`.
Scratch-proof SHA256: `d33d500f7693e752f887181e7318533a7085ab0d4d7991bd71531bf8a348970a`.

Publication guard at 69ab493e4778e308b46c0bad6cae24c1cacb047b verifies all52captured inputs and
four predecessor blobs, the unchanged issue, merged primary PR3231 and the
same session's winning claim; independent review390 remains blocked/unclaimed.
Publication uses exactly four files through Git Data REST.

The full suggested file compiles with226 expected placeholder warnings only;
the actual PMIA supplier compiles with484. Source audit:3,552 pinned Mathlib
modules,19 pinned Tau Ceti modules and one actual supplier. Mathlib source
bytes match the pinned tree; the19 native Tau Ceti modules reuse the primary's
isolated pinned-source build, with zero-warning logs retained.
Thirteen complete scratch lemmas compile against3,471 pinned Mathlib modules,
with no errors,warnings or placeholders. General scratch kernel/continuation
hypotheses are explicit; the public signatures name the actual existing objects.
The scratch calculations are validation, not a claim of implementation.

## Resume

Treat actual smoothed kernels and compare complex/p-adic algebraic Bernoulli
values. Import native negative-zeta values and the existing ModularForms L0
generalized Bernoulli data. Complete the listed residue and idele conventions,
the remaining arithmetic-measure/twist/branch interfaces and the constant
Eisenstein pseudomeasure. The preserved PMIA L1 unit completed-algebra request
is the sole stage leaf. All five gaps remain explicit; no stage is closed.
