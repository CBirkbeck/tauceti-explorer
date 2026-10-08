# Igusa varieties roadmap package — handoff

Job: PKG-IgusaVarietiesAndTorsionConcentration, issue #7477. Agent: Codex, session codex-7ICQLN. Date: 2026-10-08. Complete package submission, not a checkpoint.

## Delivered

The package README covers all 123 accepted targets across IG.0–IG.7, in mathematical thematic subsections. It is 198,037 UTF-8 bytes, below the 200 KB limit. It states the purpose, neighbouring ownership boundaries, conventions, shared standing hypotheses, target statements, exact source locators and per-target prerequisite layer ids. The prerequisite abbreviation list expands every external owner. Every one of the 234 named API entries is present; definitions have their API statements and examples, while the other targets combine their mathematical statements with named interfaces and additional action/transition laws. The 47 supplier contracts are collected explicitly. No source excerpts or process annotations appear in the README.

Suggested.lean retains every mathematical declaration and test from the accepted suggested input unchanged. It has one opening note, one block of 72 distinct imports and consistent TauCeti.Igusa namespaces. Changes are restricted to the header and mathematical comments, removing editorial provenance and pointing at the package README. Its 9,106 lines include the suggested definitions, theorems, API and all input test signatures. Metadata is `topic = "math.NT"`.

No packet, reader, atlas data, link map or upstream roadmap was edited. WORKERS.md, both protocols, UPSTREAM_GUIDE.md and the complete upstream AdicSpaces and ReductiveGroups READMEs were read. Sources in the package are described in our own words, by result and page, without copying source passages.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json`: exit 0, zero errors and zero warnings. It reports 123 targets, 224 definition/construction API items, 137 unit tests, 34 planets, 17 baseline declarations, eight planned layers, 18 gaps and 47 requests. Counting the theorem/lemma API entries as well gives the 234 names checked against the README.
- README parity and structure checks: all 123 target anchors, all 234 API names, all 20 references, valid internal links, unique anchors, exact metadata, and size below 200,000 bytes. No process annotations or carriage-return corruption.
- Removing Lean comments and normalizing whitespace gives identical input and package mathematical bodies. Imports are distinct.
- Final `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean`: exit 0, zero errors, 1,305 warnings, all exactly “declaration uses `sorry`”; no other warnings. Available memory exceeded 20 GB before the check. No build, cache download or language server was started.

The shared checker uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the required pin. Its Tau Ceti source checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the required `f790474821cf4256814db967cb154e7af3d0c369`. This suggested file imports only Mathlib; it does not compile or rely on declarations from that newer Tau Ceti source. The 17 baseline interfaces were inspected at their stated pins, including the field restriction on ReductiveAffineGroupSchemeCat and the abstract Hecke anti-involution. The shared build has no compiled HeckeRing.Basic/Commutativity modules, so direct Tau Ceti Hecke integration was not tested. No alternative build or repository copy was created.

The library-coverage audit contains no roadmap-specific Igusa layer entries. The package uses the accepted baseline/prerequisite declarations rather than inferring that its advanced geometry is implemented. Nothing is claimed formalized.

## Mathematical qualifications retained

The accepted plan is the source of truth. This package does not discharge its 18 gaps or 47 supplier requests, and does not mark any layer closed. In particular:

- Toroidal invariance requires the unit-similitude extension theorem, compatible boundary principal polarizations and the interior comparison. General-leaf affineness is conditional on it; the minimal fundamental representative has its direct EO route, with complete slope divisibility with G-structure as a separate input. Existence of the unit-similitude quasi-isogeny is restricted to the split case, not asserted at inert primes.
- The GL_r torsion determinant, relative primitive comparison, Scholze–Weinstein PEL classification, integral PEL slope representatives and G-bundle comparison remain precise external interfaces.
- Torsion nearby-cycle exactness over O_C, finite-type residue-field reductions, integral pushforward on the enlarged perverse category, Witt/formal étale invariance and the derived support-limit comparison are stronger than the basic neighbouring statements. Their full coefficients and model compatibility are specified.
- First-kind Drinfeld-level models retain their signature-specific supplier obligation. No uncleared Harris–Taylor, Huber or Faltings–Chai book was obtained or used.
- The local method retains integral/mod-ℓ spectral action, inner-form parameter compatibility, the ordinary costalk/support bound, costalk-to-stalk comparison, κ orientation, derived smooth coinvariants and local-field realization. A dimension formula alone is insufficient for these equivariant assertions.
- The finite-local Euler characteristic needed by the weak generic-lift obstruction is assigned to the ClassFieldTheory supplier. Applications in Li–Liu/LTXZZ remain outside this package's ownership.

The suggested input deliberately omits full signatures for the arbitrary-neat-level good-prime/normal-cover descent, the nearby-cycle compatibility diagrams, and the ACC finite-place-set adapter. It also gives the residue-field restriction-map form of perfect-lift cohomology rather than the full original-field pullback composite. The README retains the complete targets and their dependencies. These are documented signature limits, not empty `Prop` placeholders; the package does not invent stronger formal statements to conceal them.

Public source spot checks in this run covered CSnc Theorem 1.1, Remarks 1.4–1.7, Theorem 4.1.1 and Corollary 4.1.2; Koshikawa Theorems 1.1, 1.3–1.4, Proposition 1.7, Corollary 8.2 and Lemma 9.1 with its proof. Other detailed locators are retained from the accepted plan, not presented as a new independent source review. The author/published Lan–Stroh editions and erratum remain distinguished.

## Resume

Next is the independent package review against the accepted plan, UPSTREAM_GUIDE.md and the Lean command above. There is no remaining package assembly task. Review should pay particular attention to the explicit conditional compactification route and the full supplier contracts, and distinguish the source-level README statements from the narrower suggested signatures. All durable information is in these four deliverables; no scratch file is needed.
