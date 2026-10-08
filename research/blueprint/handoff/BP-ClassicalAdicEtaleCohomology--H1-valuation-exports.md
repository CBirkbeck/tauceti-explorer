# Handoff: valuation exports, issue #6929

Worker: Codex, session `codex-640i94`, 2026-10-08. Branch:
`codex-640i94-valuation-exports`. This is a **source-blocked checkpoint**. Both
packet status and the sole stage's coverage are `partial`; no stage is closed.
The claim was confirmed by the swarm bot for comment 6059527459 on #6929.

## What is preserved and added

The accepted H0 packet is unchanged. Its eleven nodes in
`ClassicalAdicEtaleCohomology:H1:valuation-exports` are listed by id in the new
packet's `importedNodes` and in the reader. Their definitions, APIs, tests,
formal comparisons, finite-presentation/finiteness statements and source gaps
remain owned by H0. The new packet owns exactly four nodes, all with prefix
`ClassicalAdicEtaleCohomology:H1:valuation-exports/`:

1. `total-cohomology-valuation-invariance`: canonical total scheme cohomology
   pullback is an isomorphism for faithfully flat maps of absolutely integrally
   closed valuation rings, invertible prime-power torsion coefficients and
   arbitrary qcqs schemes with bounded-below complexes.
2. `total-cohomology-separably-closed-valuation-invariance`: extend that result to
   separably closed fraction fields by the radicial perfect-closure square and
   scheme étale topological invariance.
3. `closed-support-valuation-invariance`: localization gives the same-degree
   supported cohomology isomorphism for a closed subset with quasi-compact open
   complement. No arbitrary sheaf-level base change for upper shriek is claimed.
4. `proper-nearby-invariance-coherence`: equality of the canonical generic
   cohomology/nearby cohomology composites for a proper scheme, with transport
   through the imported formal tube comparison under its microbial, continuous,
   type-(S) hypotheses. The generic-fibre square need not be Cartesian; the
   exchange transformation must be retained.

There are 3 theorem nodes and 1 comparison node; 0 new definition/construction
nodes, API items or definition unit tests. This is deliberate nonduplication:
general sheaf/derived/support objects are imported from EDC.0 and requested
scheme functors are supplied by SF.2. H0 retains its definition API and unit
tests. The new nodes have concrete acceptance cases, including identity,
geometric fields, nondiscrete rank one, rank-two plus rings, closed supports,
the failure of nonfaithful localization, and the coefficient boundary.

Two planets are nominated, Valuation cohomology invariance and Valuation support
invariance. The packet proposes a split into scheme invariance and nearby/tube
exports. **Do not assemble eight planets in the unsplit star:** H0 already marks
six. Resolve the split or select at most six in assembly; current ids have not
been changed.

## The blocking source input and resumption order

The maintainer's reference-library `INDEX.md` marks Huber's 1996 book as **not
cleared**. No book copy was opened, downloaded or used. The job therefore cannot
be completed by reading that book in this run. No original-book page number or
missing theorem statement was invented.

Resume in this order:

1. Obtain a permitted statement of **Hub96 4.2.8–4.2.9's finite-boundary
   alternative**. Determine the base, morphism, support, boundary and dimension
   conditions, and the coefficient, finiteness and constructibility conclusions.
   Create exact target nodes and backward-chain their proof dependencies. The
   existing finite-presentation/topologically-noetherian imports do not realize
   this alternative. It remains a stage-level gap with no fabricated node.
2. Obtain a permitted statement of **Hub96 4.2.6**. Compare it with H0's
   special-locus/proper local-cohomology statements and with the new closed-support
   base-change consequence. Assign its number only after verifying the actual
   statement. The new theorem is not presented as a restatement of 4.2.6.
3. Compare the original scope of **Hub96 4.2.7** with the public, explicitly
   attributed Hansen–Scholze Corollary 4.5. The AIC, invertible ℓ-power,
   bounded-below public version is established as a target here, and the
   separably closed extension is a derived consequence. Do not infer a broader
   residue-characteristic, composite-torsion or unbounded statement from it.
4. Resolve the two exact supplier requests below. Extend rather than duplicate
   H1:valuation-nearby-cycles and the generic scheme-cohomology owner. Recheck any
   new supplier node's statement before replacing a stage prerequisite by it.
5. Update the reader, suggested signatures, source references and coverage after
   these missing targets are specified. Retain this checkpoint's four ids and
   the eleven H0 import ids. Only mark a completed pass once every target is
   actually represented.

Public searches on 2026-10-08 included `"Hub96" "4.2.6"`,
`"Hub96" "4.2.7"`, `"Hub96" "4.2.8"`, `"Hub96" "4.2.9"`,
`"Huber" "4.2.6" cohomology valuation`, `"Huber" "4.2.8" valuation cohomology`,
`"Huber" "4.2.9" valuation cohomology`, `"Huber" "finite boundary" cohomology`,
and variants with Corollary and support. The 4.2.7 search yielded the public
Hansen–Scholze source below. Searches for the other exact statements did not
produce a verified restatement in this run. Numerical matches in unrelated
works were excluded; this is a search record, not a claim that no public source
exists.

Orgogozo Remarks 4.4–4.5 were re-read: they give nearby base-change over
valuation spectra and the finite-type/topologically-noetherian variant. They do
not identify the missing finite-boundary alternative. Lu–Zheng Example 4.26(3)
discusses Ψ-goodness away from a quasi-finite exceptional locus; that distinct
result is not relabelled as 4.2.8–4.2.9. Hansen–Scholze's finite special-fibre
exceptional set in the proof of Theorem 4.1 is also not treated as evidence for
the unread target.

## Exact requested inputs and ownership

The packet has two requests and three recorded gaps (unread finite-boundary
target; numbering/full scope; proof suppliers).

- **SchemeAndStackFoundations:SF.2:** on EDC.0's actual bounded-below étale
  carrier, exact inverse image, derived direct image and global sections with
  adjunction and coherent composition; the specific cohomology pullback from the
  unit, its identity/composition/naturality; the natural morphism of EDC.0
  localization triangles; scheme étale invariance under universal
  homeomorphisms; geometric-field cohomology invariance; the finite-dimensional,
  coefficient dévissage and qcqs affine-descent inputs of the public total
  invariance proof. The request also specifies scheme ULA by the universal
  Milnor-fibre criterion of Hansen–Scholze Theorem 4.4(iii), p. 22, rather than
  using diamond ULA. Inspect the full request before supplying it. Existing SF.2
  Brauer/coherent-duality/equivariant-support nodes do not have these exact
  scheme-étale statements. EDC.0 already owns the derived and support carriers.
- **ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles:** Hansen–Scholze
  Theorem 4.1, pp. 19–22, on the generic-extension/ULA equivalence for separated
  finitely presented schemes over AIC valuations, with flat AIC base compatibility
  from Corollary 4.2(ii), p. 19. Existing constructibility of (i^*Rj_*) does not
  supply this theorem about (Rj_*) on the total scheme. General ULA remains the
  scheme supplier's predicate. The target-level packet records this key theorem
  as a request, rather than re-planning a supplier's objects or decomposing its
  long proof into local lemma nodes.

Higher étale cohomology continuity is already an exact import,
`AdicCoefficientsAndComparisons:L2/etale-cohomology-continuity`. The original H0
formal-completion naturality and generic finiteness/compactification gaps are
not declared resolved. No files outside this job's four deliverables were
changed, and no messages were sent to supplier workers.

## Sources actually read

The packet has the public URLs, hashes and access date. Source text is not in the
repository; all statements and explanations are authored paraphrases.

| Source | Locators read | SHA-256 |
| --- | --- | --- |
| [Hansen–Scholze, Relative perversity](https://people.mpim-bonn.mpg.de/scholze/RelativePerverse.pdf), author 38-page version, PDF creation date 2023-05-08 | Coefficients pp. 2–3 and 7; Lemma 3.5 and proof pp. 16–17; Theorem 4.1, Corollary 4.2, Lemma 4.3 and their proofs pp. 19–22; Corollary 4.5 and entire proof pp. 22–23 | `7fcca4cf382b20503f4f428b1268d2cd181488c96b362f34150c4f3daba9544e` |
| [Orgogozo, arXiv math/0507475v1](https://arxiv.org/pdf/math/0507475v1) | Remarks 4.4–4.5, p. 13 | `10f18b77e877d376ba81a798a41465759923e10fb32b903a433961086f90903d` |
| [Lu–Zheng, arXiv 1712.10216v7](https://arxiv.org/pdf/1712.10216v7) | Example 4.26(1)–(3) and Theorem 4.27, p. 37 | `065c028994922d853c020bc7cf1b9d286325e0d61c5ea350b50fa4fee5df2bda` |
| [Stacks Project §59.79](https://stacks.math.columbia.edu/tag/09XP) and individual tags | 0DCQ, 0DCS, 04DY (§59.45, including Proposition 59.45.4), 09XP/0A45 and 0F0B; HTML is unpaginated | Dynamic HTML, no PDF hash |

The shorter Bonn-hosted *Relative perversity* file has different pagination;
do not substitute its page numbers for this packet's author version. No source
mistake was established in these readings; `sourceIssues` is empty. H0's
source-issue inventory remains unchanged.

## Verification

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
The reviewed library audit was read before planning. The new packet cites 14
baseline declarations, whose statements were read at the pinned Mathlib.
Searches at the pinned Tau Ceti found no matching nearby-cycle, ULA or valuation
étale invariance export; no Tau Ceti declaration is claimed as one.

The blueprint checker with the supplied declaration index reports **zero
errors and zero warnings**. Its statistics are 4 nodes, 0 new API items,
0 definition unit tests, 2 planet nominations, 14 baseline declarations,
3 gaps, 2 requests, 1 stage with partial coverage.

The suggested file **elaborates using `lean-check` at the pinned Mathlib, with
only admitted-proof warnings**. Memory was checked before compilation. The
four new theorem/comparison signatures use actual schemes and pullback
projections, actual small-étale sheaves of modules, and actual bounded-below
derived carriers. Supplier functors and coherent exchange maps are admitted
interfaces tied to those scheme morphisms, not arbitrary functors parameterized
into a supposed geometric theorem. The proper comparison uses actual generic
and closed fibres. Explicit section inclusions retain valuation, faithful-flat,
qcqs, coefficient and properness hypotheses in the exported signatures. The
new signatures do not attempt to fabricate the missing finite-boundary condition
or a formal/adic carrier, and all implementation statuses remain unchecked.

The reader and packet agree on the four new nodes and the imported ownership.
Before submission, the diff was checked for the four authorized paths and for
absence of private absolute paths, source excerpts, source files and changes to
other packets. Source downloads and transient logs are scratch material and are
removed after the pull request opens. The next worker needs only these
deliverables and the permitted public sources listed above.
