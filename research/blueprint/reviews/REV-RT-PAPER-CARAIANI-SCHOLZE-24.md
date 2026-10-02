# Independent verification of RT-PAPER-CARAIANI-SCHOLZE-24

Codex, session `codex-J6LwjP`, 2 October 2026. Refs #4047.

**Verdict: 54 confirmed, one rejected.** The confirmed findings retain the red team's severities: one high, 28 medium and 25 low. Finding /15 is rejected. Each of the 55 findings has its own evidence-based reason in [the verification JSON](../redteam/RT-PAPER-CARAIANI-SCHOLZE-24.review.json). Confirmation authorizes only the correction described in that reason, including its qualifications; it does not endorse every sentence of a compound claim or every proposed fix.

The extraction, its original review and the red team were written by other sessions. I did none of those jobs. This submission changes only the two verification deliverables. It does not modify the extraction, certify an erratum, or mark any mathematics formalized.

## Reading and reproducibility

I read all 55 finding records, their evidence and fixes, the original 70 extraction records, all 16 prerequisites and 12 sourceIssues, the extraction report, and the original review JSON/report. The main source was the [accepted arXiv version, 1909.01898v2](https://arxiv.org/pdf/1909.01898v2), dated 22 November 2023: 90 PDF pages, with PDF and printed page numbers agreeing. I read pp. 1–90, including the references. SHA-256:

`803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`

I inspected the page images at pp. 12, 19, 21, 28, 44–45, 49, 66, 75 and 77 for the cohomology, polarization, typography and displayed-formula issues. The [Annals article page](https://annals.math.princeton.edu/2024/199-2/p01) establishes the publication metadata; I did not compare the 2024 typeset PDF with v2. References to a printed defect below mean the inspected accepted version. A §18 errata worker must compare publication and current corrections before asserting a new published erratum.

I independently downloaded and read the following supplier passages, rather than adopting the other extractions' verdicts:

| Public source | Passages checked | Download SHA-256 |
| --- | --- | --- |
| [Caraiani–Scholze 2017, published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | pp. 683–685, 688–690, 692–693, 738–742, 748–751: flag modifications, Newton map, p-divisible classification, Red, infinity coefficients and comparison scope | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [Arthur I, collected published paper](https://www.claymath.org/library/cw/arthur/pdf/26.pdf) | introduction and §1, especially printed p. 327, component convention | `902db792ffe113507165a252b0c1b8c59f78ab8d04def1c5c39b0372362dc3ac` |
| [Arthur II, collected published paper](https://www.claymath.org/library/cw/arthur/pdf/27.pdf) | introduction and §1, printed pp. 501–505; p. 505 image for the component restriction | `42d2193dde29d159ebf757e3636f7ab3e4c0c85644cac360baffb7e0758e507b` |
| [Shin, author-hosted StableGal PDF](https://math.berkeley.edu/~swshin/StableGal.pdf) | PDF pp. 36–37, 40–41, 43: §§5.5–5.6, Lemma 5.10 and (6.7); p. 37 image | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |
| [Caraiani, arXiv 1010.2188v1](https://arxiv.org/pdf/1010.2188v1) | pp. 1–2, Theorem 1.1 and its coefficient-prime exclusion; p. 73, normalized and twisted Red | `769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3` |
| [ACC+, author-hosted published PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | printed pp. 931–932 and 948–949: duality/twisting §2.2.20, Proposition 2.2.21, Corollary 2.2.22, Theorem 2.4.10 | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |

These supplier checks are limited to the named passages. For the missing-reference findings, I verified the actual invocation in CSnc and omission from its prerequisite list; I did not claim to have re-proved or read all of Lan, Lan–Stroh, Labesse, Huber, Mantovan, Oort–Zink or the other cited papers. The classification and arithmetic repair obligations stay explicit where those proofs were not established here.

## Corrections that materially affect implementation

**Polarized isogeny transport (/1).** The common similitude scalar is the obstruction missing from the quoted argument. For principal polarizations, an honest isogeny invertible on a nonzero étale part has unit scalar, and the degree identity forces degree one. The finding's claim of vacuity must keep that nonzero-étale hypothesis: it does not apply indiscriminately to groups with no étale part. Footnote 15's separate outer-part quasi-isogenies do not settle their common scalar. An amended quasi-isogeny statement therefore needs an actual existence and boundary-transport proof; the current proof uses an honest kernel and cannot simply be renamed. This is a proof/supplier gate, not a disproof of affineness.

**General levels (/4).** Lemma 2.1.1 already allows general neat compact open K. The confirmed omission is the subsequent descent from auxiliary principal levels and the comparison of localized Hecke algebras after enlarging S. Neither a principal-level restriction of that lemma nor an automatic splitting formula is justified. The all-N comparison of Proposition 2.6.4 is relevant when p-power levels enter.

**Duality and local normalization (/12, /29, /30).** The missing contragredient on p. 66 is visible in the image and incompatible with the published Hecke root-inversion formula. IG.5 already gives the corrected construction. Shin defines Red by twisting the normalized composite once by the half-modulus character; multiplying the test function is the equivalent alternative, not an additional twist. The infinity functions involve Xi(phi), so the trivial-coefficient assertion cannot be carried into proper endoscopic terms. Keep isobaric constituents and virtual multiplicities, and recheck the local polynomial dictionary. The inspected local-global theorem excludes the coefficient prime; stronger every-place wording needs a separate precise supplier.

**The Hasse-principle proof (/18).** The relevant obstruction is the locally trivial kernel, not all of H¹. The SU(2,2) real signatures already contradict the asserted vanishing. The red team itself gives inconsistent general counts, which the fix must not reproduce. PEL M3 owns the component comparison; its request must spell out the simply connected Hasse principle, torus input and twisting reduction. This review does not silently certify the proposed general ker¹ bijection.

**The rejected twisted-trace claim (/15).** Arthur's §1 conventions explicitly cover components of disconnected groups, with a stated cyclic component restriction. The claim that both papers are connected-only is false. CSnc explains its additional cuspidality simplification, and ET.4 imports the archived Arthur input through AS.6. A separate extraction item and an explicit component-hypothesis check would improve the ledger, but the proposed proof gap requiring replacement sources is not established.

## Shared owners and dependency closure

I read the current assembled descriptions and requires of IG.0–7, PEL M0–M6, compactification C0–C5, perfectoid Shimura S1/S2/S6, Hodge–Tate T2, BunG BG0–BG4, relevant ET/AG2/TC/IHG/ALS stages, A4, the analytic/diamond suppliers and LPV.6. I checked the relevant reviewed library-coverage entries before attributing missing targets. I read the pertinent owner decisions of RS-05, RS-12, RS-17, RS-23, RS-24 and RS-32. Stale overlapping prose is reconciled through the proposed-roadmap packets; it is not permission to edit the atlas base or duplicate an upstream roadmap.

The assembled graph at repository base `b66f00b` has 2,956 stages and 8,563 distinct internal edges after unioning stageEdges with requires. It is acyclic. There is no direct or transitive BG3→IG.3/IG.4 path, and no IG.4/IG.5→IG.6 path. There are no reverse paths for these proposed edges, so the additions themselves do not create a cycle. IG.6 needs the full existence/length induction, including its concentration/rational final case, rather than just the boundary formula.

The BunG packet is partial and unreviewed, with no flag-stratification node; its existing requests do not supply the missing flag adapter. The Huber 3.5.14 supplier exists as a node in the partial ClassicalAdicEtaleCohomology packet and should be imported, with finite-level and limit scope retained. Pending packets are plans, not built declarations or accepted completions.

I checked make_queue.py's accepted-source registration: the extraction's sole route covers BG2–BG3, while 52 items name IG stages. The original review's count of 55 is wrong. Register the detailed IG source obligations, but do not call planned prose automatically circular because no completed blueprint exists. Reconcile the conflicting SW13 classification proposals into one supplier with PEL adapters; likewise keep finite-level duality at ALS, integral normalization at PEL M4, local Raynaud uniformization at R11.3, the residual predicate at AG2.7 and filtered-colimit nearby cycles at LPV.6.

## Pinned-library check and validation

For /54 I read the actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: [Mathlib Hecke definitions](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/HeckeRing/Defs.lean), [Tau Ceti associativity/ring structure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Associativity.lean) and [its anti-involution infrastructure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean). These provide the abstract carrier/convolution ring and coset operation. They do not by themselves establish the unitary spherical/global identification or the geometric adjoint action. The fixed-double-coset commutativity criterion cannot be applied to inversion on arbitrary GL_n cosets.

Validation: `check_redteam.py` on the verification JSON; `intake.py check-files` on the two authorized paths; exact finding-ID coverage, uniqueness and verdict/severity counts; source hashes and downloaded-file sizes; `git diff --check`; and private-machine-path scanning. No Lean file is a deliverable, and no Lean compilation, Lake project, cache download or language server was run. Scratch source downloads are removed after submission; the public URLs, hashes, locators and unresolved proof gates above provide the durable handoff.
