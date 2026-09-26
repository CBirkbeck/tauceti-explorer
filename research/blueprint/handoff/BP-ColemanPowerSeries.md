# BP-ColemanPowerSeries — algebraic logarithmic-derivative checkpoint

Worker: Codex — codex-a71f92. Date: 2026-09-26. Refs #699.
Claim comment 5849604328 was confirmed by bot comment 5849605432.
Input main: 43719eac2fe5cc40b85b3ac1077a305c8f72059e.
No earlier packet, reader, seed or handoff existed at this input.

## Summary

Partial checkpoint: 19 nodes (2 definitions, 1 construction, 14 lemmas,
1 theorem, 1 comparison), 22 API items, 12 definition/construction unit tests,
1 additional comparison test, 2 further Lean boundary examples, 2 planets,
15 pinned baseline declarations, 6 gaps and 11 stage-level supplier requests.
No layer is closed and every implementation status is unchecked.

The source-derived algebraic chains are the weighted logarithmic derivative
on actual power-series units, its additive-torsion-free kernel, coefficient
and substitution rules, natural-parameter cyclotomic series and unit lift,
and the denominator-cleared smoothed comparison. All 19 statements and their
API/tests appear in the reader and seed. The seed elaborated with 42 expected
declaration-placeholder warnings and no other diagnostics.

## Work and source boundary

Read the five reviewed AUDIT-24 layer entries before planning; retained accepted
RS-16 ownership. Read the complete Coleman stage descriptions, member document,
relevant supplier contracts and every Coleman entry in the two link maps.
ClassFieldTheory and LocalFieldsRamification upstream documents were read
in full during this continuous worker session; additionally inspected the
ProfiniteProPGroups scope and its full L4 exponentiation/module interface.

Downloaded the published Rodrigues Jacinto–Williams paper and arXiv v2.
The packet records the exact read sections and both SHA-256 values. Read
the local interpolation/norm argument and the logarithmic-derivative
calculation, rather than importing the raw sign from Theorem 10.15. The
positive-parameter comparison is Δ(u_a)=a−1−F_a. Unit restriction gives the
raw negative measure, so Col₀(c(a))=−([a]−1)ζ_p and Col=−Col₀.

Nine source findings are recorded against the publication and collated with
v2: the raw Coleman sign, the coefficient/topology gap in the norm proof,
the false polynomial claim for negative parameters, the coefficient ring
in the norm congruence, the geometric-tail sign, the missing positivity in
the Mellin decay argument, the k=1 zeta exception, the undefined bounded-ψ
application to 1/T, and the omitted constant term in Proposition 12.1.
Existing campaign corrections are credited explicitly. The findings have
not been independently reviewed.

The main source and v2 have hashes 78d0479b…b44a6 and efa1e101…39c4.
Printed publication pp.137 and 170 were rendered to verify the two displayed
signs. The author pages, arXiv listing and bounded web correction search found
no separate published correction. The article HTML failed in the web reader;
the publication PDF downloaded successfully. No claim of exhaustive novelty.

The natural-parameter restriction is deliberate, not a silent loss of scope:
f_(−a)=−Y^(−a)f_a and the full negative/p-adic family are exact continuation
tasks. The test at −1 checks the necessary boundary without inventing that
family's arithmetic realization.

## Baseline and checks

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The packet's fifteen baseline statements were read with their hypotheses.
Searches in both pinned trees found no formal power-series unit logarithmic
derivative. Analytic logarithmic derivatives and Chabauty–Coleman integration
are not this object. The open Mathlib PR #43166 on derivative/coefficient-map
compatibility was inspected as design context, not cited as existing baseline;
our coefficient-change proof uses the pinned coefficient formula.

The compilation checked 1,815 Mathlib source files in the import closure byte
for byte against the pin before using their cached compiled artifacts.
This seed imports only Mathlib modules: there was no required Tau Ceti module
and no Tau Ceti rebuild. Lean v4.34.0-rc2 exited 0 with 42 warnings, all for
the required placeholders; this is signature elaboration, not proof checking.

The official blueprint checker with the real declaration index reports
0 errors and 0 warnings. All 19 new nodes depend only on earlier nodes or
baseline references, so no cross-roadmap prerequisite cycle is introduced.
The stage-level requests are continuation contracts, not omitted hypotheses
of those algebraic theorems. Source issue schemas and source-version checks
pass. The private check also verifies statements, hypotheses, proof steps,
acceptance lists, all API names and every packet test against the reader/seed.

The independent exact-arithmetic check passed 1,209 truncated rational-series
identities through degree 19: products, inverses, integer powers, coefficient
factorizations, parameter products, weighted chain rules and smoothing.
Additional controls cover characteristic 3, reduction of f₃ to T², the
negative parameter −1 and the p=5, a=3 degree-two moment +8/3 versus −8/3.
These are finite tests, not substitutes for the proof outlines.

## Resume exactly here

1. Read/decompose RJW §9 and the original local-field/Coleman sources.
   Construct the actual fields, norm-compatible full/principal units and
   topology. Import local-field and pro-p group carriers and prove the
   application hypotheses.
2. In L1, establish finite freeness, the determinant norm and integral trace
   comparison, completed coefficient substitutions, all Lemma 10.11 parts,
   interpolation uniqueness and compact-surjectivity construction.
3. In L2, retain these 19 stable node IDs. Extend the natural-parameter
   algebraic family to negative integers and p-adic substitution. Identify
   it with the real norm-compatible cyclotomic tower. Construct Col₀ using
   the actual PMIA L2 interfaces and discharge the concrete F equation
   from Dirichlet L1. Prove equality of measures and full equivariance.
4. In L3, decompose the mod-p image/compact-lifting argument and 1−φ
   sequence, then construct the topological exact sequence and its
   finite-flat coefficient extension, with O(1) endpoints.
5. Read §11 and §12.3 for L4. Import IntegralIwasawaTheory L0's global
   groups; prove the local closure, norm-compatible generator and
   inverse-limit cyclicity before the plus quotient.

The eleven requests name stages because the missing arithmetic declarations
are not yet decomposed. No false node is introduced merely to give a request
a node-level target. The existing PMIA L3 pseudomeasure nodes do not provide
its L1/L2/L4/L5 interfaces, so they cannot close those requests.

Only the issue's four deliverables are submitted. No source PDFs, extracted
text, private build files, application/data changes, or implementation claims
belong in the pull request. Publication uses GitHub tools from a fresh main
after confirming these four files are still absent; no git command is used.
