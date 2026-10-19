# Independent review: Homotopy foundations for algebraic K-theory, Part II

Accepted, with the corrections below applied in place. This is a complete target-level planning pass, not an implementation or a claim that every external interface has been supplied.

Reviewer: Codex, session `codex-0iHdtw`, for `REV-DESIGN-StableHomotopyKTheoryPartII`, 2026-10-19. The design was written by a different worker session, `codex-ZpzkTT`. This review covers the roadmap definition, packet, reader and suggested Lean companion delivered by `DESIGN-StableHomotopyKTheoryPartII`.

## Counts and coverage

| Item | Result |
| --- | --- |
| Nodes | 44: 3 definitions, 11 constructions, 30 theorems |
| Individual node verdicts | 39 verified, 5 corrected; none unverifiable |
| Nodes added or removed | 0 |
| Baseline declarations | All 12 confirmed; none removed or replaced |
| APIs and unit tests | 55 API items; 50 tests across all 14 definitions/constructions |
| Planets | 34 definitions, constructions and named theorems |
| Sources | 11 exact public files checked against the recorded hashes |
| Source findings | 6 independently reviewed: 4 existing entries corrected/confirmed and 2 added |
| Local gaps | 0 |
| External requests | 3, retained explicitly |

The packet contains an individual verdict and mathematical check for every node in `review.checked`. All nodes retain `implementationStatus: unchecked`.

PO.1, PO.2, PO.3 and PO.8 remain closed at the protocol’s target level. PO.4–PO.7 remain planned, with precise remaining supplier interfaces. Every stage target is represented. The eight layers are ordered correctly: operations and Adams/Singer machinery precede finite-type Segal, finite inverse-system control removes finite type, and Frobenius comparisons and applications follow. The final theorem is the prime-order generalized Segal theorem and its stated applications, not the Segal conjecture for arbitrary finite groups.

## Corrections applied

1. **Adams resolution, PO.2/adams-resolution.** The tower is available for any spectrum, but its displayed cohomological Ext identification was stated without the bounded-below and degreewise mod-p finite-type hypotheses used in Lunøe-Nielsen–Rognes §2.1, pp.864–866. Restricted that identification, its cobar API and its proof sketch to this range, while retaining the unrestricted tower construction. Strong convergence remains a separate target. Updated the source match and reader together.
2. **Singer tower notation, PO.2/singer-tate-tower.** Clarified that the brackets in the comparison with the Tate tower denote Greenlees filtration stages, following LNR Definition 4.3, pp.885–886, and Proposition 5.7, pp.902–903. They do not denote suspensions of the full Tate spectrum. Preserved the source’s index, the initial suspension, the cofinal bonding maps and the finite-type hypotheses. Updated the API and reader.
3. **Finite p-complete examples, PO.4/ordinary-and-compact-frobenius.** The mathematical target already used the explicit finite-cell/retract class. Its source match still described categorically compact p-complete spectra. Corrected the match to explain the finite/dualizable proof and the source terminology issue E4. The comparison follows from the sphere by exactness, finite cofibers and retracts.
4. **Atiyah powers, PO.7/atiyah-cyclic-power.** The cited BMMS VIII.4 Theorem 4.1, Proposition 4.2 and Lemma 4.3 occur on scan PDF leaves 141–142, not 137–138. Corrected the packet, roadmap bibliography and reader. Read the actual complexes-of-bundles construction: virtual classes require its signs, as detected by the existing negative-unit and transposition-character tests.
5. **Free-loop prerequisites, PO.8/free-loop-segal.** Nikolaus–Scholze Proposition IV.3.2 and Corollary IV.3.3 occur on pp.347–351, not 352–353. Theorem IV.3.7 and its proof remain pp.354–355. The bibliography also called IV.3.1 a proposition; it is a lemma beginning on p.345. Corrected these locators in all three documents.

No change to the Lean companion was needed. No smaller proof lemmas were added: the existing nodes have the required target-level granularity.

## Source checks and findings

Opened the exact files linked in the packet and reader: the corrected publisher version of [Nikolaus–Scholze](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf), the entire [2019 correction](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0222/0001/ACTA-2019-0222-0001-a002.pdf), [Lunøe-Nielsen–Rognes](https://ems.press/content/serial-article-files/26162?nt=1), [Adams–Gunawardena–Miller](https://math.mit.edu/~hrm/papers/adams-gunawardena-miller-segal-conjecture.pdf), [BMMS](https://www.math.uchicago.edu/~may/BOOKS/h_infty.pdf), [Milnor](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Milnor-A.pdf), Cartan’s exposés [14](https://www.numdam.org/item/SHC_1954-1955__7_2_A3_0.pdf), [15](https://www.numdam.org/item/SHC_1954-1955__7_2_A4_0.pdf), [16](https://www.numdam.org/item/SHC_1954-1955__7_2_A5_0.pdf), [Kuhn](https://arxiv.org/pdf/math/0202042), and [Malkiewich](https://arxiv.org/pdf/1505.06778). Every node’s locator and source match was checked. Hashes, URLs and reading dates remain recorded. Added the explicit published/preprint kind and reading date fields to the version records. No source text or source file is included in this submission.

All six source findings now have a verdict, reason and reviewer job identifier:

| Entry | Locator in NS | Review result |
| --- | --- | --- |
| E1 | Example I.2.3(iii), p.220 | Confirmed the multiplicative-coordinate sign error. Removed the unsupported allegation of an incorrect p² exponent: that exponent is printed correctly. The constant term at odd primes detects the actual error. |
| E2 | Displays and Theorem IV.1.15, p.332 | Confirmed the missing factor two. Extended the account to the displayed operation codomains: P^i shifts by 2i(p−1), and βP^i by one more. The roadmap already uses these degrees. |
| E3 | Remark IV.1.11, p.328 | Confirmed that the transfer quotient must retain X in its base X×BΣ_p. |
| E4 | Example IV.1.2(ii), p.325 | Confirmed the terminology/inference problem for the sphere and spherical Witt examples. The p-complete sphere is dualizable but fails categorical compactness: the filtered p-multiplication diagram has zero completed colimit, while the colimit of π₀ maps out of the sphere is Q_p. This finding does not assert that the source’s conditional statement under actual compactness is false. |
| E5, added | Proofs of Lemmas IV.1.18 and IV.1.20, pp.335,339 | Confirmed the undefined degree index k; the surrounding formulas and lemma statements require the degree-n operation. This was already noticed in the paper extraction as E10 but omitted from this packet. |
| E6, added | Definition and Lemma IV.1.20, p.338 | Confirmed the omitted BΣ_p in the twisted-cohomology targets. The constructed Thom-spectrum domain, Lemma IV.1.19 on pp.336–337 and Theorem IV.1.21 on p.339 all require X×BΣ_p. The roadmap’s target already has that base. |

The published 2019 correction does not address these findings. Checked the publisher, authors’ public correction/publication listings and the earlier atlas extraction; no further published or author correction was located. Normalized the findings to the protocol’s `source` field. Their `known` value is `new` because no external correction was located; `priorRecord` separately preserves earlier atlas observations. This prevents an earlier extraction from being mistaken for a published correction.

## Baseline, ownership and closure

Read all cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the packet’s Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. No directly cited Tau Ceti declaration required replacement.

| Module | Declarations confirmed |
| --- | --- |
| `Mathlib/CategoryTheory/Types/Basic.lean` | `CategoryTheory.Functor.sections` |
| `Mathlib/CategoryTheory/CofilteredSystem.lean` | `CategoryTheory.Functor.eventualRange`, `isMittagLeffler_of_exists_finite_range`, `toEventualRangesSectionsEquiv`, `surjective_toEventualRanges`, `eval_section_surjective_of_surjective`, `eventually_injective` (all in the same namespace), and `nonempty_sections_of_finite_cofiltered_system` |
| `Mathlib/Algebra/CharP/Lemmas.lean` | `frobenius` |
| `Mathlib/RingTheory/WittVector/Frobenius.lean` | `WittVector.frobenius`, `WittVector.coeff_frobenius_charP`, `WittVector.frobenius_zmodp` |

The finite-system declarations provide the eventual-range and section-evaluation steps with the required finiteness/nonemptiness hypotheses. The node first reduces to eventual ranges and handles an empty inverse limit, rather than silently applying a nonempty-system theorem. Ordinary ring and Witt Frobenius are imports, not new planned constructions.

Read the reviewed library audit and the actual supplier statements from StableHomotopyKTheory H.5/H.6, RefinedTraceMethods RT.2 and both relevant RT.4 parts, EnhancedDerivedSheaves E3/E5, ChromaticHomotopyTheory CH.1/CH.9/CH.13, and the current upstream AlgebraicTopology stage. Checked the current upstream roadmap files, including the roadmaps newer than the atlas snapshot, and searched the current Tau Ceti library. No target here duplicates current upstream work. Ordinary cohomology, monoidal infrastructure, generic Tate and cyclotomic constructions, spectral étale lifting, KU and generic Thom objects retain their existing owners.

In particular, the closure checks retain the distinctions the main proofs need:

- Adams convergence uses finite-type hypotheses, and continuous tower cohomology is not replaced by cohomology of the limit.
- The arbitrary-vector-space Segal step uses uniform stabilization in finite inverse systems, rather than unrestricted interchange of Tate, sums and limits.
- The full stable Steenrod algebra is supported by Cartan’s representing-space calculation as well as the Adem and Milnor calculations; the argument does not assume the desired identification to prove it.
- All-degree operations retain negative representation spheres, permutation signs and the classifying-space base.
- The KU counterexamples retain residual quotient actions and do not apply bounded-below Tate lemmas to periodic KU.
- The free-loop argument uses Kuhn §6, pp.15–16, and Malkiewich Proposition 2.22, pp.14–15, for increasing connectivity. It does not claim that suspension spectra preserve arbitrary totalizations or that Tate preserves arbitrary limits.

All definitions/constructions have usable naturality, evaluation, comparison and characterization contracts and at least three tests. The tests include plausible failures involving lost permutation signs, an untwisted Singer action, a factorial transfer ideal, negative virtual powers and loss of a Thom twist. No additional API items, tests or planets were necessary.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableHomotopyKTheoryPartII.json`: zero errors. The two warnings concern imports of the existing TauCetiRoadmap AlgebraicTopology stage by the cyclic coefficient and Steenrod nodes. That upstream stage already plans ordinary products; no additional work is requested from it.
- Validated the source-finding and source-version records with the repository’s shared errata validators, and checked that all 44 review entries are unique and exhaustive.
- `lean-check research/blueprint/suggested/StableHomotopyKTheoryPartII.lean`: passed at pinned Mathlib, with only the expected `sorry` warning on the finite-tower theorem. The 54-line file uses real existing carriers, contains no admitted data definition, and checks the two Witt Frobenius formulas. The spectral constructions remain reader targets.
- JSON parsing, reader/packet consistency and `git diff --check` pass. Only issue deliverables are changed.

The orchestrator should route the three retained requests before declaring PO.4–PO.7 closed:

1. RT.2: name the basic E∞ Tate-valued Frobenius, with naturality, unit normalization and lax monoidal compatibility. This roadmap owns its Weyl and classical-operation comparisons.
2. RT.4 Habiro-comparison: provide finite étale/free Witt rings of finite fields and uniqueness of the Frobenius lift by reduction, using the existing spectral étale-lift interface.
3. CH.9: provide the precise raw rationality of the height-one Tate sphere and the equivariant unit into the swap action on KU⊗KU. Localized Tate vanishing alone is insufficient.

There are no unresolved mathematical questions in the material accepted here. No ownership move or edit to a supplier packet is needed. Packaging should preserve the explicit requests and the boundedness, finite-type and virtual-twist qualifications above. This review is complete; no checkpoint work remains.
