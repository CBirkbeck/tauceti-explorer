# Independent package review: AdicCoefficientsAndComparisons

**Verdict:** accepted after corrections.  
**Reviewer:** independent-review-REV-PKG-AdicCoefficientsAndComparisons.  
**Agent:** Codex, session codex-sBLyQP; issue #7502.  
**Date:** 2026-10-09.

This review checks the package against the accepted
`research/blueprint/packets/AdicCoefficientsAndComparisons.json`, PROTOCOL §§5, 13 and 20,
and UPSTREAM_GUIDE.md. The package was written by a different worker, Claude session
claude-UvCss8. I read the complete README and Suggested.lean, all 46 accepted nodes,
the package handoff, the reviewed library coverage, and the relevant link-map entries.
The upstream AdicSpaces and AnalyticToricGeometry roadmaps supplied the form comparison.

## Required checks

| Check | Result |
| --- | --- |
| Upstream form | Pass. Purpose, ownership, conventions, prerequisites, ordered layers, exact targets, proof routes, APIs and tests form a reusable mathematical specification. The README is below 200 KB. |
| Fidelity | Pass. All 46 targets occur, with 80 API items and 57 unit tests. Each statement, hypothesis and proof route was checked against its node; the name inventory is an additional mechanical check. |
| Own words and locators | Pass after adding missing page numbers. Definitions and results are restated as mathematical specifications, without source passages or a section-by-section source summary. HTML Stacks results use numbered statements and stable tags rather than PDF page numbers. |
| No process in README | Pass. No packet names, job identifiers, review/checkpoint references or coverage statuses occur. Source corrections describe mathematics, with locators. |
| Suggested Lean | Pass after strengthening the canonical-map statements. The final `lean-check` exits 0, with 423 declaration-uses-`sorry` warnings and no other diagnostics. |
| Metadata | Pass. The unchanged file is exactly one line, `topic = "math.AG"`. |

## Fidelity and boundaries

| Layer | Targets | Hypotheses and distinctions checked |
| --- | ---: | --- |
| L0 | 7 | Regular adic coefficient pairs, derived rather than ordinary completeness, completed tensor and colimits, coherent finite-level operations and their right-adjoint mates. Support retains compactifiability, locally spatial representability and locally finite `dim.trg`; direct-image base change retains its boundedness condition after reduction. Rational lattice identification is restricted to topologically noetherian schemes. |
| L1 | 5 | The characteristic-p plus ring is the integral closure of the prime field; it is not silently replaced by the whole ring. The scheme category uses the left-completed étale essential image. The mixed-characteristic avatar is a small v-sheaf over `Spd O`, with a representable map, and need not itself be a diamond. Both residue-field conventions and the direction of their comparison are preserved. |
| L2 | 21 | Relative finite-presentation descent and its property hypotheses, separatedness for finite-type factorisation, compactifications without a density assumption, strict maps, parallel-arrow equalisation, initial refinements, schematic density and constant-rank decomposition for bundle extension. Cohomological continuity concerns sheaf colimits; Abe's noetherian coefficient hypothesis has no added invertibility assumption. The qcqs support extension consumes the noetherian support theory. |
| L3 | 5 | Full faithfulness in characteristic p, the two right-adjoint identities, and the canonical proper-support comparison for separated finite-type maps of qcqs schemes. The comparison right adjoint is distinguished from geometric direct image. |
| L4 | 2 | The `(π,x)`-adic test space and its punctured locus; analyticity and smoothness are checked after perfectoid base change rather than asserted for `Spa(O,O)`. The named 27.5 exchange map is the map whose invertibility is required. |
| L5 | 2 | Alterations are imported from SF.4. Proper cohomological descent on schemes and v-descent on diamonds are separate inputs; no trace splitting or invertibility of the alteration degree is assumed. Normal-crossing comparison requires matching Kummer classes, twists, cup products and residues. |
| L6 | 4 | Punctured-trait closed stalks use inertia cohomology with residual Galois action. Semistable induction precedes the final constructible comparisons; generic/special fibre separation uses the uniformiser in equal characteristic too. The 27.6 and 27.7 targets retain bounded constructibility and finite prime-to-p coefficients. |

The package imports generic derived completion and enhancement from EnhancedDerivedSheaves,
discrete diamond cohomology and operations from their owning roadmaps, analytic comparison
inputs from ClassicalAdicEtaleCohomology, and purity from EtaleDualityAndPerverseSheaves.
It extends the noetherian scheme support functor supplied by SF.2; it does not introduce a
competing functor. The AdicSpaces link map supplies `Spa` infrastructure to L1 and L4,
without supplying the scheme-avatar gluing or the nonanalytic-base comparison proof.
These boundaries agree with the accepted packet's requests and the library audit.

All 22 baseline declarations were checked by reading their statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, existing affine-limit lemmas,
scheme-theoretic image, the small étale/pro-étale carriers, sheaf cohomology, cofiltered
categories and adjunction mates are reused. They are not presented as new definitions.

## Corrections made

1. `AdicSix.reduce` previously quantified over unspecified pullback and support reduction
   isomorphisms. It now refers to the named `pullbackReduction` and `supportReduction`
   transformations and asserts their invertibility and that of their specified right-adjoint
   mates. This preserves the scalar-change maps required by the README.
2. `AdicSix.baseChange` and `SchemeSupport.baseChange` previously asserted only that a
   natural isomorphism existed. Both now assert `IsIso` for a named `baseChangeMap`.
   The introductory support-base-change wrapper derives its isomorphism from that map.
3. The README explains these concrete signatures and distinguishes them from its other
   representative homotopy-category signatures, whose enhanced coherence remains part
   of the mathematical specification.
4. Added page locators for Bhatt–Scholze 5.2.6, 5.3.2 and 6.8.14; Česnavičius 4.10 and
   5.3–5.4; and de Jong's imported statements. Replaced the unlocated Huber bibliography
   pointer with the named supplier layers and the numbered ECD comparison arguments
   that consume them. No mathematical target or coefficient scope changed.

## Source verification

The public PDFs below were accessed on 2026-10-09. Their SHA-256 values match the
versions recorded in the accepted packet. I read the relevant statements and arguments:
ECD §§26–27, introductory 1.8–1.10 and 1.13, and 19.5; Bhatt–Scholze 5.2.6, 5.3.2 and
6.8.14; Zavyalov §2.1; Boxer–Pilloni §2.1.1; Česnavičius §4.10 and §§5.3–5.4;
Abe §1.4; and de Jong's §2.20, 4.1/4.2, 5.8 and 6.5 statements.

| Source | SHA-256 |
| --- | --- |
| [ECD, author PDF](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1` |
| [Bhatt–Scholze](https://arxiv.org/pdf/1309.1198) | `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84` |
| [Zavyalov v3](https://arxiv.org/pdf/2111.01830v3) | `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951` |
| [Boxer–Pilloni, author PDF](https://www.ma.imperial.ac.uk/~gboxer/higherhidaSiegel.pdf) | `b97084726de7a30645a7e154a0bd68de86bdda00d36ead35c5e248fde14662ee` |
| [Česnavičius v4](https://arxiv.org/pdf/1711.06456v4) | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| [Abe v2](https://arxiv.org/pdf/2405.19601v2) | `56d897a77e1a3ef0455c861d0f5bd5b499f47ea9420fd5fcca0594e794c020a6` |
| [de Jong, Numdam](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |

The cited Stacks statements and proofs were read at tags 01YX, 01ZA, 07RN, 01ZM,
01ZR, 0EUU, 081F, 01ZJ, 0ATT, 0ATU, 0F41, 0ESN, 0G41 and 09YQ.
Huber's book was not read: it is not cleared in the supplied library index.
Its imported theorems were checked as supplier contracts, not independently verified
against the book. Full alteration proofs and the journal versions of the public
author/arXiv PDFs were also not claimed as read.

## Validation and limits

`python3 scripts/check_blueprint.py research/blueprint/packets/AdicCoefficientsAndComparisons.json`
reports 0 errors and 0 warnings. Mechanical checks find every accepted target label,
API name and test name in the README and every API/test name in Suggested.lean.
The final Lean run has no errors and only the 423 expected `sorry` warnings.
The local intake file check reports 5 files and 0 problems; `git diff --check` passes.

The helper's shared build uses the exact pinned Mathlib. Its Tau Ceti checkout is
`cf386627e9176a3827c1a5fe804989fd94a4d216`, later than the protocol pin; the only
imported Tau Ceti module, `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic`, is byte-for-byte
identical to the pinned module and imports no further Tau Ceti modules. This verifies
the prototype's Tau Ceti dependency at the pin without claiming that the entire shared
checkout is at that commit.

Acceptance is acceptance of the package specification. The signatures are prototypes,
not implementations or proofs. The accepted plan's eight recorded obligations remain
construction and supplier obligations; this review does not claim to close them.
The README explicitly records omitted enhanced coherence and hypotheses that cannot
yet be expressed in the prototype. No empty `Prop` placeholder was introduced.
