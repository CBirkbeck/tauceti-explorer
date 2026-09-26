# Handoff: BP-ArakelovGeometryAndAbelianHeights

- Issue: #674. Agent: ChatGPT Pro. Session: `cgpt-20260926-6de2`.
- Branch: `cgpt-20260926-6de2-arakelov-height-foundation`.
- Date: 26 September 2026.
- Status: **partial checkpoint; zero stages closed; no completed Lean implementation**.

## Delivered

Four job-owned files only:

1. `research/blueprint/packets/ArakelovGeometryAndAbelianHeights.json`
2. `research/blueprint/readmes/ArakelovGeometryAndAbelianHeights.md`
3. `research/blueprint/suggested/ArakelovGeometryAndAbelianHeights.lean`
4. This handoff.

The packet has 22 nodes, 60 API items, 45 proposed tests, six planets, 19 baseline references, six explicit gaps and four source-issue records. Node kinds: five definitions, ten constructions, five lemmas, two theorems. All six original R35 stages remain in scope; R35.1 is partial and R35.2–R35.6 are not source-decomposed. No original target has been silently removed.

The rank-one contribution uses actual invertible fractional ideals, logarithmic metric scales, complex norms, real arithmetic degree and witnessed scalar changes of coordinate. It constructs the coordinate quotient and its degree/ordinary-class maps. It does not assert that this quotient is already equivalent to all metrized invertible sheaves, that the coordinate product has already been compared with projective-module tensor products, or that normalized degree is already compatible with finite extension.

## Mathematical conventions to preserve

For K a number field, R=O_K and d=[K:Q], write L=(I,w), with local norm exp(w(v))|z|. Infinite places are modulo conjugation; their weights m(v) are one or two.

- Degree: `-log N(I) - sum_v m(v) w(v)`.
- Reframe by a K unit: `(aI, w-log v(a))`, with coordinate map x to ax. In Schoof's divisor convention this is D-(a).
- A constant twist by c multiplies norms by exp(c) and changes degree by `-d*c`.
- Degree-zero normalization twists by **plus** `degree/d`.
- The relation is existence of an actual scalar with the ideal and metric equalities, not equality of degrees.
- Uniform twists of the trivial class are distinct for distinct parameters, even when the ordinary class group is trivial.

The actual R-linear equivalence I to aI must handle nonintegral scalars such as 1/2. The complex-place trace weight is not a factor in the ordinary local complex norm.

## Sources and repository inputs read

Read WORKERS, blueprint PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE and expansion PROTOCOL; the issue and winning-claim bot reply; the current campaign README and six-stage atlas record; the Arakelov portion of AUDIT-08; accepted RS-06 proposal/review ownership; and relevant unmetrized JacobianChallenge and NumberFieldArithmetic descriptions. The oversized integrated library-coverage file was not successfully read in full, and no full-file read is claimed.

Primary mathematical source: Schoof, *Computing Arakelov class groups*, MSRI Publications 44 (2008), publisher PDF, Sections 2–4 through Proposition 4.3 with proof. Compared the corresponding arXiv:0801.3835v1 text and page images. Read the entire author-linked errata at Git blob `f346d7e1e5080ea2b8c21cb433b9c78515dfc7fe`. Source metadata and locators are in the packet.

Pinned Mathlib statement reads: FractionalIdeal Basic/Norm, ClassGroup Basic, InfinitePlace Basic and NumberField ProductFormula. Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. The ordinary ideal norm, principal-ideal map, class group and product formula are reused rather than proposed again.

## Source findings, not self-reviewed verdicts

E1 is the preprint Definition 2.3 sign already corrected in the published chapter. E2 is the Proposition 3.1 equality condition, checked using F=Q(i), u=i. E3 is the named scalar-witness sign in Proposition 4.3. E4 is the missing division by the complex-place multiplicity when recovering a scale from an idempotent's trace norm.

For E2–E4, the author-linked errata and compared versions did not supply these corrections; broader correction searches also found none. This is not a priority claim. Each record has the exact version, printed expression, correction, reason, scope of effect and search trail. **Independent review is required.** The author errata's p.453/p.454 module and generic-fiber clarifications must be retained. No error is alleged in the correct identity `N(conjugate(u))=N(u)`.

## Checks actually performed

A local Python structural preflight passed for the developed design: required fields, counts, unique node ids, declared baseline references, internal dependency resolution, acyclicity, six-stage coverage and source-issue fields. A separate scalar/model calculation suite executed **281 numerical assertions** covering tensor/dual degree, constant twists, frame cancellation, degree-zero normalization and the concrete source examples. These do not prove number-field theorems.

The submitted JSON is the compact editorial version of that design, so the PR's repository validator is the authoritative check of the submitted artifact. The full repository validator and pinned declaration index were **not run locally**. Lean/lake were not available in the worker environment; the Lean file is **not compiled**, and its 45 examples remain proof obligations. No successful CI result is claimed in this handoff. Read the actual PR checks before integration and fix any reported failures on this branch.

## Exact resume point

First independently inspect E2–E4 against the publisher page images and the complete author errata. Then continue R35.1 at the unframed rank-one comparison, not at a purported completed Faltings-height object:

1. Use a generic generator to identify a rank-one projective R-module with a nonzero fractional ideal; show module isomorphisms extend to scalars in K. Reuse existing affine Picard/module theory.
2. Recover compatible placewise metrics. In the real trace-metric formulation, the scale is `sqrt(<e_v,e_v>/m(v))`, not the unweighted square root. Prove both directions of the comparison and compatibility with scalar isometries.
3. Compare coordinate multiplication with the actual tensor product of invertible modules. Build general Hermitian finite-projective modules and determinant metrics from an inspected source and the pinned exterior/determinant API, including exact-sequence compatibilities.
4. Prove finiteness and the norm ratio for I/Rs, then the section formula. Prove the fractional-ideal extension norm and the weighted fiber count of infinite places before claiming normalized-degree base-extension invariance.
5. Reconcile general projective-height normalization and the GZ.2 intersection boundary. Do not invent an atlas id for the unregistered ArithmeticHeights proposal.
6. Only then source-decompose R35.2–R35.6. Use the accepted A6/M6/R11.1 differential-object ownership; do not replace invariant differentials on a nonproper semiabelian model by pushforward top forms. Retain integral bad-place terms, singular boundary metrics, exact constants and the noncircular R35-to-R28 direction.

The later-stage Faltings/Faltings–Chai proofs have not been read at decomposition depth in this checkpoint. They must be transcribed before new theorem nodes are attributed to them. Opening the PR submits this checkpoint; it is not a claim that issue #674's entire mathematical programme is finished.
