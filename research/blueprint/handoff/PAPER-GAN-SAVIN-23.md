# Handoff: PAPER-GAN-SAVIN-23

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1250).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read.** arXiv 2102.00372v1 in full — the only arXiv version. The published version (Invent. Math. 232 (2023), 1–78) is closed access, which was confirmed on the Springer page and in OpenAlex and Semantic Scholar; it was not read. All locators are to v1, and the source issues are recorded against v1. The open-access sequel (Gan–Savin, *The local Langlands conjecture for G_2*, Forum Math. Pi 11 (2023)) was read where it summarizes this paper and searched for corrections; it records none.

**Deliverables:**

- `research/blueprint/papers/PAPER-GAN-SAVIN-23.result.json`: 87 items, 4 routes, 28 prerequisites, 22 source issues;
- the report `research/blueprint/papers/PAPER-GAN-SAVIN-23.md`.

## Judgement calls for the reviewer

**A new roadmap, not a Part II.** `ExceptionalThetaCorrespondencesForG2` (78 items, area `representations`) covers minimal representations of exceptional groups, the three dual pairs with G_2, the representation theory of p-adic G_2 and PGSp_6, and the Howe duality and dichotomy theorems. A reviewer might instead prefer:

- a Part II of MetaplecticAutomorphicForms, on the ground that theta correspondence is one subject — but that roadmap is built on Weil representations, and exceptional theta uses minimal representations of groups of type E;
- a Part II of SmoothRepresentationsOfLocalGroups, on the ground that this is local representation theory — but that roadmap is the general theory and classifies no group's representations.

The brief asks that the roadmap be designed so that PAPER-GAN-SAVIN-23-B, the local Langlands correspondence for G_2, can extend it; that paper is the only queued consumer.

**The Tau Ceti roadmaps are imported, not extended.** LieHighestWeight Layer 8 plans the split octonions and explicit E_6, E_7 over a characteristic-0 field, and Reductive algebraic groups Layer 9 the split Chevalley groups. Neither plans G_2 = Aut(O) over a p-adic field, the non-split E_6^D or the quasi-split Spin_8^E, so those are items of the new roadmap.

**Three small source routes.** Classical theta inputs to MP.3 (as PAPER-GAN-ICHINO-18 did), two facts about the smooth category to SR.3, and the local Langlands correspondence for GSp_4 to ML.4.

**Statuses to check.** Only three items are not missing: the split octonions (library, Tau Ceti), the smooth-representation tools (planned, SR.2/SR.2a/SR.3) and the local Langlands correspondence for GL_n (planned, ET.6).

## Source issues

Twenty-two, all against arXiv v1: fifteen misprints, one error and six gaps.

- **E9 is the error.** §9's "Weyl-invariant quadratic form" is invariant on cocharacters, not on the character coordinates it is written for; the correction gives both forms. It was verified in exact arithmetic, and nothing later uses it.
- **E20, E10, E21, E13, E12 and E22 are gaps**: Proposition 5.4, the computation of Π_{N_2,ψ_2}, Lemmas 8.1 and 8.3, Proposition 13.6, the cases left to the reader in Lemma 13.8 and §14.3, and the explicit lifts of Theorems 15.2–15.3. E20, E10 and E13 lie on the path to the main theorems.
- The misprints are indices, names, cross-references and one wrong bibliography volume. E3, E5, E9 and E17 were checked on page images.

**A reviewer with access to the published version should check the gaps there.** It is 22 journal pages longer than v1 and was refereed for a year, so some of the missing proofs may have been added; the misprints should also be re-checked against it.

## Remaining

Nothing for this job. The cited inputs were not read; the items that rest on them say so.
