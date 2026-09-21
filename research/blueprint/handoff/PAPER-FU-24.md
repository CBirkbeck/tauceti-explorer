# PAPER-FU-24 handoff — deepened partial checkpoint

Refs #1083. Codex session `codex-a71f92`, 21 September 2026.
Continuation of PR1399; all inherited item IDs are preserved.

## Saved result

123 items: 9 pinned-library inputs, 11 planned imports, 103 missing items routed
exactly once. The three Part II proposals take 33 algebraic, 44 analytic and 25
weight-aspect items. The two source routes take four already-planned CC items
and one missing NE.0 homological theorem. All 42 definitions/constructions have
three API entries and three mathematical unit-test contracts (126 of each).

The exact Fu arXivv2 PDF is archived and read completely, including all proofs
and references. SHA-256:
`d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`.
Ten primary-source PDFs have exact URLs/hashes and inspected scopes in the JSON.
Auxiliary acquisition does not imply full reading; the report distinguishes the
freshly checked statements/proofs from unresolved dependencies.

The former oversized audit access gap is closed. Relevant reviewed audit rows
were read; all 50 relevant rows, seven owner records and their 60 stages match
live main `5de4697bb48359dc1143d6f87bf9fbf6a6a767e4`. Reserved IDs and the current
packet/new-roadmap directory were screened. No proposed-ID collision exists.
The accepted CC torsion/descent and LA L4 decomposition boundaries remain imports,
including their source-proof limitations.

New narrow library inputs are the existing standard integral sl2 lattice,
enveloping action and restricted Kostant action in `Sl2/IntegralLattice.lean` at
Tau Ceti `f790474`. They do not supply the complete p-adic algebraic-group,
symmetric-power and external-product comparison. The six inherited library
interfaces were reread at the pinned sources.

## New proof work to preserve

- An explicit majorant `P_alpha(k)=2 sum_i alpha_i product_(j!=i)(k_j+1)` covers
  both the large-coordinate estimate and every infinite low-coordinate strip.
- Weighted PBW completion and bounded central division supply a precise route
  for the topological U_r central normal form. The algebraic owner provides
  these; the analytic owner imports them and proves the Frommer comparison.
  This does not settle the weaker D_r quotient-filtration argument.
- Finite-free coefficient extension plus AW14 4.6/5.4 at n=0 supplies the
  all-integral injectivity proof outline without equating integral and
  Q_p-induced parameters.
- The cusp Koszul calculation gives dimensions(1,2,1), hence a uniform boundary
  estimate and the explicit `3c` comparison bound for c neat cusps.
- S7 records an actual zero-quotient example for the unqualified auxiliary
  domain statement: at r=p^(-2/3), lambda=p^(-1), Delta-lambda is a Banach unit.
  The integral-parameter main theorem is not contradicted.
- AB07's §5.4 lemma gives the finite-crossed-product Ext comparison. Its next
  corollary concerns injective dimensions; preserve the corrected source locator.

## Resume here

1. Obtain the published Annals PDF and collate it with the fully read v2. The
   public URL `https://par.nsf.gov/servlets/purl/10625156` timed out in both the
   browser and command-line download. No published-PDF digest is claimed.
2. Resolve S5's separatedness for the weaker filtration on D_r central quotients,
   and the all-real-radius integral-parameter statement. The new bounded-division
   argument addresses U_r, not this separate D_r problem. Preserve the unrestricted
   printed source statement and S7 instead of silently narrowing them away.
3. Finish the primary proof audit of AW13 microlocal coefficient hypotheses,
   Frommer and DDMS. Kohlhaase §1.4 now locates Frommer §1.4 Lemma3/Corollaries1–3;
   the original preprint URL failed TLS hostname validation and the candidate
   modern university path returned404. Do not claim its proof was acquired.
4. Independently review the weighted-PBW/division and support-comparison proof
   steps, and route boundaries. The selected DAG is not an exhaustive closed
   blueprint; existing supplier source gaps must remain visible.
5. Only mark extraction complete after the remaining source/scope tasks have
   genuinely been resolved. All previous IDs are retained so refinements can
   be made in place.

## Checks and limits

The full repository `scripts/check_paper.py` passes. Structural checks pass:
123 unique IDs, 173 selected dependency edges, acyclic item and proposed-route
graphs, exact-once missing-item routing, and 42 complete API/test bundles.
The report embeds a standalone Python3 regression program; it passes 41,069
exact finite assertions. These checks are not infinite-dimensional proofs or
executed Lean unit tests. No Lean file was requested or compiled.

Only this issue's two deliverables and handoff are submitted. No atlas, roadmap,
label or unrelated job is changed; this remains a checkpoint, not an accepted
design. Intake should release the job after merging for the next source worker.
