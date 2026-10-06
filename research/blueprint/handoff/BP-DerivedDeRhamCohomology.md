# BP-DerivedDeRhamCohomology — completed planning pass

Issue #708, claimed by Codex with session `codex-4pmoDm` on 6 October 2026.
This is one job and a complete target-level planning pass, not a checkpoint.
The independent review has not been performed. No declaration is implemented.

## Deliverables and coverage

The packet, reader and suggested file cover DD.0–DD.6 under the accepted RS-01
ownership. All 27 checkpoint node IDs are retained. Every scoped target is
assigned to a declaration family in `targetCoverage`; every stage is `planned`.
None is `closed`: 12 precise proof/signature gaps and 12 supplier requests remain.
The protocol's target-level stop condition is met; proof-lemma decomposition is
follow-up work rather than an unfinished breadth-first pass.

The packet contains 132 nodes: 16 definitions, 34 constructions, 14 lemmas,
13 comparisons, 50 theorems and 5 applications. It contains 190 API items,
151 unit tests, 39 planets and 45 pinned baseline declarations. Each definition
and construction has uses, API contracts and at least three tests. The reader
includes every statement, prerequisite, source, proof route, API and test.

The suggested file contains all declaration/API/test names. Twenty inherited
ordinary differential-algebra nodes keep their precise Kähler/exterior-power
forms. The remaining 112 nodes have underlying ordinary derived-category,
complex, ring, monoid or scheme forms, with their full mathematical contracts
in comments. The completed reader explicitly distinguishes these carrier views
from the full enhanced contracts.

## Checks and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DerivedDeRhamCohomology.json --json`:
  0 errors and 0 warnings, with the supplied pinned declaration index.
- Recursive fine-node dependency audit: 162 reachable nodes, 779 edges,
  78 baseline leaves; no unresolved reference and no fine-node cycle. Stage
  requests are scoped leaves, not an assertion that an entire supplier is closed.
- All new downloaded-source excerpts matched their literal source text.
  Index/sign and log-base-change findings were also inspected at their locators.
- Retained-ID, target-family, API/test-name, unchecked-status, planet and
  authorized-file checks passed. Packet and reader contain mathematical
  specifications and no implementation code.
- The final `lean-check research/blueprint/suggested/DerivedDeRhamCohomology.lean`
  passed: 0 errors, 463 admitted-declaration warnings and no other warnings.
  The final concrete tests include dual numbers, the non-lci square-zero
  quotient, Laurent polynomials and the existing p-adic integers.

Compilation used the pre-existing pinned Mathlib build, with the pre-existing
Tau Ceti semilinear Kähler object in a read-only search path. The default shared
Tau Ceti build lacks that object. No Lake project, dependency update, cache
fetch, library build or language server was started. The exact pinned Mathlib
commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`; relevant Tau Ceti
sources were compared with `f790474821cf4256814db967cb154e7af3d0c369`.
The pre-existing `MapSemilinear.lean` source SHA-256 is
`45f031ab561bf5bd7904b60ffc8bd649efdcc85211198aab6e7732e4614f3b7d`;
its object SHA-256 is
`ea1c064564095c6ee21ecaed521ab3db38822d5055a2f27e2194f6c0131e49d8`.
A future elaboration should use the existing pinned shared artifacts, with
that object visible, rather than rebuild the libraries.

## Binding corrections and owner boundaries

DD.4 alone owns the natural filtered derived-to-classical crystalline/PD
comparison and its flat/lci isomorphism range. CR.0/CR.2 provide ordinary PD
and site/Poincaré inputs; CR.4 supplies only its early classical smooth
WΩ/Nygaard prefix. DD.5 provides the QRSP covers and Čech calculation needed
by DD.4. DD.3 provides Cartier control used by DD.5. DD.4 supplies RT.6.

RT-padic-2/35 is handled by the explicit Q0 → DD.5 prerequisite. The early Q0
fine node with the historical slug
`semiperfectoid-quasisyntomic-and-qrsp-rings` supplies integral perfectoid rings
only after RS-01. DD.5 owns QSyn and QRSP. Its elementary root cover is
independent of Q3 and of the later animated perfectoid applications.

The confirmed RT-padic-2/7 correction is incorporated: a strict quotient alone
is not G-lci. The log-smooth Cartier factor must be followed locally by a
strict **regular-sequence** quotient, with flat nilpotent-p endpoints in the
finite comparison theorem. Filtered extensions need compatible regular
presentations. RT-padic-2/36's single-comparison ownership is respected.

Hodge and conjugate graded pieces both carry [−i], with unshifted derived
powers. Full de Rham complexes are base-linear, not target-linear. BMS2's
filtered grading, Beilinson Ext shift and Nygaard **graded** injection are
corrected. The log tensor expression is corrected over the original base.

## Source review and limits

The packet records 24 sources and their actual read sections. This run read
Bhatt pp.4–38, the routed cotangent/completion and algebraization arguments,
BMS2's relevant completion, filtered, PD/derived-Witt and descent sections,
Bhatt–Lurie's appendices, Gwilliam–Pavlov, the relevant Stacks sections,
Avramov/Iyengar, and Koshikawa–Yao §§2–3. The CMM p-basis locator is PDF
pp.39–40, not p.52. The two upstream roadmap documents read were
GrothendieckEulerForms and JacobianChallenge.

There are 11 `sourceIssues`: three inherited, the binding G-lci correction,
and seven further index/sign/base-change or naming findings. New findings
await independent verification. BMS2 findings were collated with the Numdam
version of record and arXiv v2. Bhatt's affected author-copy passages retain
the regular-quotient and Wilson-sign slips.

Koshikawa–Yao's published 2025 PDF was not served. Its three §2 findings are
scoped only to arXiv v1. The October 2026 corrigendum metadata/abstract names
later Theorems 7.35–7.36; its unavailable full text is not asserted to settle
those §2 findings. Original Illusie/Berthelot–Ogus book proofs were not fully
available. Inherited author-erratum fingerprints/access dates remain identified;
no book-proof coverage or novelty claim is manufactured.

## Where the open-stage follow-ups resume

Read each stage's `remaining` list and the exact affected nodes in `gaps`.
Resolve suppliers in their owners, preserving the early-prefix order.

1. **DD.0:** Cohen-factorization/lci converse interiors, integral derived-power
   décalage with the Illusie corrections, and SAG's reverse F-finiteness theorem.
2. **DD.1:** full Noetherian Artin–Rees pro-zero proof and any explicitly
   hypothesised weak-proregular extension.
3. **DD.2–DD.3:** corrected arbitrary-resolution and rational Hodge-comparison
   interiors, enhanced coherent filtered structures, and full convergence forms.
4. **DD.4:** Scholze–Weinstein's PD root-torsion input, regular-ring
   perfection/Popescu–Kunz route, and exact early CR.0/CR.2/CR.4/AI.0/period
   suppliers. Keep inversion inside the finite Hodge quotients before taking
   the rational period limit. Reuse registered torsion corrections E17/E18.
5. **DD.5:** perfect lifting of compatible finite-p perfect systems and the
   nonnoetherian coherent-cohomology/formal-geometry supplier contracts.
   Uncompleted p-de Rham descent retains its relative-QSyn or specified
   Z_p/integral-perfectoid big-slice hypotheses.
6. **DD.6:** original Gabber–Olsson and exactification/PD proofs, compatible
   filtered G-lci/Fontaine presentations, and the two-sort completed log-root
   descent argument. Preserve general prelog monoids and the actual
   P-flat → P/P× surjectivity requirement.
7. **Every stage:** replace the deliberately smaller prototype views by full
   signatures once EDS/CR suppliers can express them. Ordinary Hom sets give
   only π₀ of mapping spaces. Filtered diagrams omit enhanced coherence.
   Tensor, scalar extension and PD/site/period operators are actual-data
   parameters with their missing identification hypotheses omitted. QSyn's
   prototype shows amplitude only, QRSP adds mod-p semiperfectness only, and
   corrected G-lci shows only the regular-kernel clause. The negative Z_p/QRSP
   test uses its missing p-th root of p; it never falsely excludes Z_p from
   the weaker amplitude predicate. Universal-property views retain only their
   expressible uniqueness/evaluation components.

Review the 31 accepted-target groups and all 11 source findings first. The
pass is ready for its independent mathematical review; open-stage work follows
that review rather than a second claim by this session. The scratch research
and generators are disposable: all persistent mathematical inputs, limitations,
checks and resume points are in these four deliverables.
