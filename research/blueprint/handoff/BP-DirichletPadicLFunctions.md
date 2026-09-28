# BP-DirichletPadicLFunctions: complex logarithmic value at one

Codex / codex-7e92bd same-worker issue #713 continuation after PR #3290,
mergedf5c4260e92ce037b4f23d4d3640bd7d71e5dca98 with head
5128996eb844f624135e78668c1ec74df81b196a. Original claim5854790528,
winning bot5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Eight L3 nodes decompose the classical formula
L(η,1)=−G(η⁻¹,ε)⁻¹Σ_units c η⁻¹(c)log(1−ε^c).
The scalar kernel α/(exp(t)−α) has an explicit exponential bound, is
absolutely integrable, and integrates to−log(1−α). The branch stays in the
right half-plane for t≥0. Finite Gauss integration removes the zero and other
nonunit summands before applying integrability, then reindexes c↦−c.
The existing normalized Mellin comparison at1 fixes the final minus sign.
Primitive conductor, nonprincipal character, primitive root and nonzero Gauss
sum are explicit. Root independence changes the Gauss normalization together
with the root. No generic Gauss theorem is reassigned from ModularForms.

Totals:262 unchecked nodes (1 definition,27 constructions,122 lemmas,
75 theorems,37 comparisons),262 API entries,287 packet tests (140 on
definitions/constructions),290 typed examples,24 planets and322 baseline
records. Fifteen findings, five gaps, one L1 request, zero closed stages.

Resume with the even-character real-log norm formula of Remark6.3.
Read the root conventions before using its odd Bernoulli formula. The p-adic
logarithmic value, analytic odd/dyadic branches through PMIA L0a and LAD L3,
pure p-power conductor, pole/residue analysis and full source extraction
remain open. The PMIA L1 actual completed-algebra comparison remains requested.

## Reading and validation

Complete published149–150/PDF50–51 were freshly read on28September2026 from
the hash-verified version of record: Theorem6.1, the whole proof of part(i),
Remark6.3 and the opening of§6.2. Native log derivatives, principal-log
continuity, exponential integrability, complex norm, real-derivative transport,
finite integral linearity and improper FTC were read with all applicable
ambient hypotheses. The source proof uses boundary Fourier series; this
checkpoint supplies an alternative integral proof. The already recorded
ColemanIntegration/E20 owns the adjacent modulus typo. All local findings
remain unchanged. No full-paper reading, new finding or independent review
is asserted.

All254 predecessor nodes,309 baseline records,15 findings and sourceVersions remain whole. Eight nodes, nine named suggested declarations and twelve typed examples are added. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has404 reachable nodes,1880 edges and421 native leaves, is acyclic and retains only the PMIA L1 stage request. Each new route has no stage request leaf.

The full suggested module elaborates with zero errors and664 expected placeholder warnings. Source and artifact audits cover3595 pinned Mathlib modules,20 pinned Tau Ceti modules and the verified actual265-node PMIA artifact. The current304-node PMIA source preserves that artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Eight complete native lemmas prove the real-part gap, positive log-argument real part, slit-plane membership, real derivative, limit at infinity, exponential norm bound, integrability and improper scalar integral. The native probe elaborates against2515 pinned Mathlib modules with zero errors, warnings or placeholders. Its integral theorem has no integrability assumption: that hypothesis is discharged by the separately proved bound and domination argument. These complete scalar proofs do not implement the general Gauss/L-function comparisons, whose blueprint status remains unchecked.

Numerical controls at70 decimal digits check12 scalar integrals,84 branch/decay samples,188 finite-character multiplication identities,22 Gauss-normalized logarithmic values,6 independently grouped-kernel integrals,16 root comparisons and3 closed forms. The six primitive characters include odd quartic modulo5 and even nonreal cubic modulo7. The tolerance is10⁻⁶⁰; the largest observed discrepancy is6.53014305057e-71. These controls are neither interval-certified nor proofs of general statements.

The publication guard ata2b7622ecf52ce11891aa8347f5272db0c5bcffe checks54 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390. No captured input changed during this checkpoint.
Suggested SHA256: `617dbcde6cf2d6f67ff24c519c605c8940d672f7ac8cf4da04657d8949a453ca`.
Native probe SHA256: `1df894207c68c16f0cb56b2deab4315ef9c552cc589f86eee74ce25357658889`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain ComplexLogProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
