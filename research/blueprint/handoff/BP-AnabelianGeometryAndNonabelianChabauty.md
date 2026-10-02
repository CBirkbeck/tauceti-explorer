# BP-AnabelianGeometryAndNonabelianChabauty — invariant-coset checkpoint

Agent: Codex — codex-rtOQ9t. Refs #1020. Winning claim 5953110496;
bot confirmation 5953113784. Publication base
04500e78b7d37fa3a04da7962a7d9f4d58fbfe16. Full issue read before claiming;
freshly fetched full post-confirmation body verified identical. Predecessors:
codex-a71f92 PR #5749 and codex-J6LwjP PR #5756. Their exact historical receipts
remain in Git history and the packet's continuationReceipts.

## Delivered

Eleven new NC.3 nodes package the native invariant coset set, projection π⁰ and
connecting map δ, with exactness at A^G, B^G, invariant cosets and H¹(G,A), and
the left B^G-orbit description of δ's fibres. Two constructions have six API
items and six typed suggested examples. Projection and representative APIs
are promoted to separate lemma nodes for downstream proofs.

The carrier is Mathlib's existing left coset quotient B/i(A), with its existing
QuotientAction/quotient machinery and fixedPoints subset. InvariantCosets is
only a local abbreviation instantiating these existing carriers. The subgroup
need not be normal. π⁰(1) specifies the source base point without assuming
quotient group operations. δ's actual suggested body takes the H¹ class of
the existing continuous connecting cocycle at the chosen quotient representative;
the representative formula proves independence. No continuous quotient section
or topology on the coset set is needed for these set-valued maps.

All 26 inherited node objects are unchanged, as are all eleven requests,
sourceCoverage inventories, sourceIssues, structural proposals and original
40 baseline records. The addressed coset-packaging gap is removed; the other
nine gap objects are unchanged. All seven stages remain partial/not_read and
all implementationStatus values remain unchecked. Packet totals: 37 nodes,
52 API items overall (40 on definitions/constructions), 31 test contracts,
11 planets, 49 baseline records, nine gaps and eleven supplier requests.

Only the four issue deliverables changed. No atlas, shared checker, other
roadmap or extraction was edited. The inherited suggested text is unchanged
apart from the inserted 148-line block before the central-extension marker.

## Fresh reading and ownership

Personally read Kim arXiv:math/0409456v1, printed pp. 5–9: cocycle and gauge
conventions, Proposition 1 and its proof, Proposition 2's printed proof, and
the nonnormal coefficient-subgroup exactness passage. Subsequently read p. 10
through Proposition 3 and its proof while rechecking the subgroup passage.
Earlier pp. 2–4, later sections and external proof citations were not freshly
read. The eleven general topological-group statements are direct elementary
derivations, not separately named theorems of Kim. No new source mistake was
identified in this selected scope; historical errata/source receipts are not
fresh whole-source certificates.

PDF SHA-256: 00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941.
The distinct fresh source entry records the limited scope without rewriting
the old Kim source receipt.

All nine added Mathlib baseline records were checked against complete statements
and local hypotheses at 082e2d37e8b0463410cdb532e111cd43d5a66174 and the pinned
index. Read GroupAction/Quotient.lean lines 35–122, GroupAction/Defs.lean
fixedPoints/mem_fixedPoints and FixedPoints.subgroup with local hypotheses,
and Coset/Defs.lean's left relation, coset equality and representative lemmas.
The old forty baseline receipts remain historical; the fixed-point/coset
passages were corroborated afresh. Tau Ceti pin remains
f790474821cf4256814db967cb154e7af3d0c369.

Read all seven reviewed NC audit rows, all seven current stage descriptions,
and all seventeen touching atlas edges. Screened current link packets: zero
asserted matching links/overlaps and 29 negative examined entries. This is a
catalogue screen, not proof of no uses. Separately read accepted RS-29's
NC.0 arithmetic-path/tangential ownership and its IG.0/Belyi/IG.6 links, and
RS-03's forwarded elliptic Mordell–Weil/Selmer links to NC.5. No new cross-owner
request is needed for these NC.3 additions. Inherited A2/NS and height-owner
boundaries and all conjectural frontiers remain.

JacobianChallenge and Multiquadratic upstream READMEs were personally read in
full. ProfiniteCohomology was partly read only; do not claim a full read of it.

The reserved AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1 node is
preserved exactly: the coefficient class and all-degree canonical comparison
remain essential, with the raw homotopy comparison restricted to its verified
geometric-unibranch scope. Its missing geometric π/sheaf/ε carriers remain
explicit omissions and supplier requests, never assumed proposition fields.

RT-AREA-algebraicgeometry/8 remains handled by the inherited A2 request: import
NS(A)=Pic(A)/Pic⁰(A), its injection via φ_L into symmetric Hom(A,A∨), finite
generation using A6's finite-rank Hom, and ρ as its rank, building on
JacobianChallenge Layer E. NC.5 consumes these data; it does not define NS
locally. The BDMTV /9 ownership retarget is recorded logically in the existing
inventory; this job does not edit the extraction or A2's files.

## Validation and compilation boundary

Indexed check_blueprint: zero errors, zero warnings. Intake: four files,
zero problems. JSON/whitespace, complete 26-node preservation, original baseline
and source-inventory preservation, new statement/reader parity, declaration/API
name parity and six test-name/example forms passed.

The actual read-only build.assemble pipeline, substituting this packet in memory
into promoted packets, retains all 37 declarations and 11 planets, with no
skipped links. This uses normal retirement, accepted restructuring, link and
decomposition trimming. Complete assembled stage DAG: 3,018 vertices including
51 UPSTREAM interface endpoints, 8,654 edges, acyclic. Combined stage graph plus
this packet's complete declaration graph: 3,044 vertices, 8,768 edges, acyclic.
This is not a full audit of every other packet's unpublished declaration refs.
Overlay receipt SHA-256:
944932889b7f60da54eb8d597202ed3e1c6650646059956a0b51c8c7807863db.

Finite regression independently enumerates C₂ cocycles, gauge orbits, native
left cosets, invariants and all maps in the initial exact sequence. Models:
all six S₃ subgroups and all thirty S₄ subgroups under trivial and transposition
conjugation actions, plus every subgroup of C_n for 2≤n≤12 under negation.
Results: 88 stable action/subgroup cases, 40 nonnormal cases, 498 cosets,
340 invariant cosets, 1,079 representative checks, 2,728 fibre pairs and
162 cohomology classes. Seven cases reject a constant boundary and 56 reject
a constant projection. The C₂ ↪ C₄ doubling/negation example has a nontrivial
boundary on the odd invariant coset and no fixed lift. S₃'s nonnormal
transposition subgroup with trivial action has three invariant cosets.
Finite receipt SHA-256:
15ea19dbf769c12ef90b6f8f87b000857267a44132976de9193ea0f46e4af56b.

The full suggested file was NOT compiled: no existing combined build at both
pins was found. No new project, Lake update/cache retrieval, library build or
language server was started. The preceding worker's Mathlib-only excerpt
compiled before these additions; that historical receipt is not validation of
the new block. All new forms remain uncompiled and admitted. Finite computations
validate examples, never the general proofs or Lean elaboration.
New native block SHA-256:
4fdcbc0678e07e8d93918810ce75162733a080b9c757e42ac893ed23ff097f31.

## Resume

1. Use the newly packaged coset maps as the exactness interface. Elaborate their
   new native forms when a suitable existing pinned build is available; prove
   the local QuotientAction and fixedness lemmas, representative API and exactness.
   Do not substitute quotient groups for nonnormal cosets.
2. Split inherited continuous-cocycles, functoriality and central-extension into
   declaration-sized nodes; finish their explicit omission ledger, especially
   continuous H² central obstructions/freeness, twisting with target repointed
   at [c], and actual finite discrete action instances. InvariantCosets is an
   instantiation of native carriers, not another generic quotient theory.
3. Read/decompose the unipotent-point topology and representability proof leaves,
   then local conditions, global Selmer varieties and dimension calculations.
   The C₄ finite boundary is not a Selmer depth-two obstruction theorem.
4. Resolve the eleven inherited IG.0/IG.1/SF.2/SF.3/A2 requests and raw-homotopy
   foundation candidate. Retain the geometric-unibranch restriction and delegated
   Artin–Mazur/Schmidt/SGA proof leaves; import M₀,n from its reserved owner.
5. Read Chen /57–58 and all routed BDMTV obligations: 17 NC.2 and 19 NC.5 items,
   E9/E10 and four applications. Preserve /58 local word expansion versus /93
   global path-torsor comparison. NS belongs to A2. Generic heights stay with
   pending SelmerComplexesAndPadicHeightsPartII without a reverse NC.5 dependency.

Own scratch is under 1 MB and deleted once the PR is open. Durable hashes,
reading scopes, model descriptions, counts and resume instructions are above.
No compiler or background job remains running.
