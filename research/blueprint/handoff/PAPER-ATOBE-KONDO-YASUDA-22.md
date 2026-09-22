# PAPER-ATOBE-KONDO-YASUDA-22 — continuation handoff

Status: **partial**. Codex `codex-c83e7a`, issue #1395.
Continues codex-a71f92 / PR #1814. Only the authorized result, report and this
handoff are changed. No independent-review verdict or formalization claim.

Done in this continuation:

- Reread all56 published pages and arXiv v4 pp50–51; reread exact Lapid–Mao
  compact-induction/model conventions at printed pp917–919,922–923.
- Matched every hypothesis of E1's n=m=2 construction. Added infinitely many
  independent common-kernel vectors using u_r=I+varpi^-r E12. No stronger
  K^(c_pi)-invariance is claimed.
- Strengthened E3 from a proof defect to an explicit counterexample to Lemma8.10:
  H(g)=(a-b)q^(-(a-b)/2)x^(a+b) is a second equal-Satake Hecke eigenfunction.
  Differentiate the family with parameters(x exp(t),x exp(-t)); all eigenvalues
  have zero first derivative. H(1)=0 and H(diag(varpi,1))≠0.
- Added direct proofs of DVR exponent uniqueness, exact F/o duality, local-ring
  free-surjection equivalence, nil-ideal/Jacobson inclusion and nonzero-depth escape.
- Added five direct pinned-library credits, 42 additional tests and full named
  three-contract APIs/use records on all42 definitions. There are161 items,
  126 API contracts,126 tests,18 provisional source findings and eight routes.
- Resolved the four minor source leads as E15–E18; corrected the generic
  spherical interface to avoid assigning a Whittaker model to every unramified
  irreducible constituent.
- Retained all candidate IDs; refreshed464 inputs and screened122 peer inventories.
- Six exact diagnostic groups pass:648 collision-eigenfunction cases,9 matrix
  identities,84 coset valuations,126 exponent reconstructions,2610 free-cover
  pairs and189 Laurent substitutions. No Lean execution is claimed.

Remaining, in order:

1. Independently check E1/E3 under the separate review workflow. This paper worker
   has not assigned review verdicts. The main newform theorem is not refuted by
   these auxiliary counterexamples.
2. Replace the Lemma8.10/9.3/Theorem9.1 separation chain with valid statements
   and proofs. Essential solutions currently form an affine set with an
   infinite-dimensional kernel in the displayed specialization. Do not assume
   uniqueness or upgrade right-iota(Kprime) invariance to a newform level.
3. Read and extract the full KZ/MW duality/path formula, Lapid–Mínguez determinant
   and constituents, corrected Jacquet/JPSS/Matringe essential-function inputs,
   and Lapid–Mao support/root-exchange/convergence chain.
4. Finish recursive declaration-level library and theorem-proof closure. Split
   bundled notions and promote consumed API lemmas. The newly supplied proofs
   remove specific mathematical gaps but do not constitute Lean implementations.
5. Refresh current owners and manifests again before activation. Library credits
   are narrow; the four Part II IDs remain unaccepted candidates.

Sources, pins, exact proof arguments, provisional source issues and the complete
item/API/test inventory are in the report and JSON. Previous source metadata and
blob provenance are preserved under source.previousCheckpoint. Cambridge PDF
hashes differ because of retrieval-specific footers; do not drop either record.
