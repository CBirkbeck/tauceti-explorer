# BP-DirichletPadicLFunctions: finite tame residues and psi

Codex / codex-7e92bd. Same-worker issue 713 continuation after PR3263 merged
09baf9ce264e75492a5024006ad44057c3806513, with head
184c387984a7471bf89e0fe8d3f43b7eab80fa8f. Original claim 5854790528,
confirmed 5854791937; no additional claim. Review390 remains unclaimed.
Partial; all implementation statuses are unchecked.

## Delivered

Six L2 nodes give the actual tame translation equation, the exact finite residue
coefficient formula, psi eigenrelation, integral psi comparison, ambient unit
restriction and ordinary unit-moment Euler factor. For nonprincipal η modulo D
and p∤D, c_a=−D⁻¹Σ_(j<D)η(a+p^n j)j. Finite-cycle uniqueness retains CharZero K.
The passage from finite coefficients to actual measures uses explicit uniform
approximation of fixed Mahler tests by native residue representatives; the
all-finite-maps separation API is not assumed to establish p-power cofinality.

The result is ψμ=η(p)μ, and on units the kth ordinary moment is multiplied by
1−η(p)p^k. The integral comparison uses the actual norm-valuation integer ring,
its included eigenvalue and all integral-valued continuous tests, without a
new coefficient-extension carrier or a Z_p-algebra choice on the integer ring.
No primitivity or Gauss nonvanishing is needed for this finite arithmetic proof.

Quadratic modulo 3 at p=2: mod-2 masses −1/3,2/3; mod-4 masses
1/3,1/3,−2/3,1/3; psi eigenvalue −1; unit mass 2/3; second unit moment −10/9.
A characteristic-3 finite-cycle negative control records the cancellation limit.
Totals: 190 nodes, 195 API entries, 173 packet tests (113 on definitions/constructions),
176 typed examples, 23 planets, 270 baseline citations. All 184 old nodes,
263 baseline objects and 13 source findings remain whole. Five gaps, one request,
zero closed stages. Predecessor Lean remains a contiguous body with one import.

## Resume point and sources

Next identify ordinary moments with Dirichlet special values and prove the
primitive-conductor product twist and inverse-weight interpolation. Instantiate
composite-modulus Gauss nonvanishing from its existing owner where needed.
Generic p^n-root translation remains a PMIA obligation. No analytic interpolation
or completed-algebra comparison is claimed.

Freshly read published pages 145–146, seven newly cited native statements with
ambient hypotheses, and consumed PMIA nodes and signatures. Prior complete
published 139–147, arXiv v2 PDF 30–35 and visual/version evidence persist. No fresh
whole-paper or correction-search claim, new finding or independent verdict.

## Validation and guarded inputs

Accepted refresh at 4e9c2e32f9c87cb3ae5cc223f4a933c9f4c6190d: full WORKERS.md and its 20-line shared-machine addition read; eight whole SieveMethodsAndPrimePatterns E19–E26 records and all register diff lines read; all prior records preserved by multiset. No independent source verification or verdict. Current scratch is 547 MB; one Lean process remains. Future work will reuse one workspace and existing pinned builds.

PMIA refresh at e7026dfd9ddcd785f86356f99c67869e0c849f2a (merged PR3268): all eleven added nodes, thirteen added baseline records, changed source/coverage/gap metadata and the complete Lean delta were read. All 265 preceding nodes and the complete old Lean body remain unchanged. The new unit-group descent and separation do not replace the additive residue approximation in this checkpoint. The suggested Dirichlet file compiled with 432 placeholder warnings against the verified 265-node PMIA artifact from PR3263; compatibility of all consumed APIs with the current 276-node packet was checked. No compilation against the 276-node revision is claimed.

Indexed blueprint: zero errors and warnings. Four-file intake: zero problems.
Versioned errata, whole-object preservation, reader/signature/test parity and
scoped mutation checks pass. All 13 findings remain whole, including E13's
published-source citation. Graph: 323 reachable nodes, 1412 edges
and 366 baseline leaves; acyclic, with only the PMIA L1 request leaf.
The suggested Lean file compiles with zero errors and 432 expected placeholder
warnings. The actual 265-node PMIA supplier is reused from the successful PR3263
build (569 placeholder warnings); source and olean were compared byte for byte
before retiring the old scratch directory, with source/artifact/log hashes retained.
The current 276-node supplier preserves every consumed API and the complete old
Lean body; no compile against that newer revision is asserted. No fresh supplier
build is claimed. Recursive audit: 3,581 pinned Mathlib modules,
20 pinned Tau Ceti modules and one actual supplier. Prior Tau artifacts have
matching source hashes and zero-warning build logs; no new library build.
Five complete native scratch lemmas compile against 1992 pinned Mathlib modules
with zero errors, warnings or proof holes. They establish the finite-cycle and
representative-bound controls and the finite Mahler translation, not the full
arithmetic residue or psi theorems. All 8,019 exact Fraction checks pass for
finite recurrence, refinement and psi scaling, with total-mass checks and an exact quartic-character control separating η(p) from η(p)⁻¹.
Suggested-file SHA256: `c60f100bfa01d4732d7764ff29d69a60cefb909f7fe5e93a53f495c0045f9d2f`.
Native-proof SHA256: `433011de183ba95793a5e316fd2bfc6164b2c1599a529ed8206301416f362afc`.
The live guard at e7026dfd9ddcd785f86356f99c67869e0c849f2a verifies all 52 captured inputs,
four predecessor outputs, unchanged issue body, exact merged PR3263 head and the
same winning claim. Review390 is blocked and unclaimed. Exactly four authorized
files are published through Git Data REST. The updated shared-machine rules are
in force: one Lean process, reused pinned builds, one continuing workspace and
retirement of submitted scratch copies with minimal handoff evidence retained.

Snapshot754f9846334a20e29ebb40f55f431b3318395dc4: all 52 inputs initially
unchanged and four outputs byte-identical PR3263. Register refresh at
6bc3d007a37d1d9debd9dbe7c1f776aa2d79a6f4 adds one whole inverse-Galois E1 record;
that record and 10 diff lines read, all prior records preserved by multiset.
No independent source verification of that finding. All earlier protocol,
issue, scope, audit, link and model reading provenance persists.
