# Handoff: PAPER-GAN-ICHINO-18

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1149).

## Done

The extraction is complete. `scripts/check_paper.py` reports ok, and every missing item is routed exactly once.

**What was read:**

- the whole of arXiv 1705.10106v3;
- the published Annals version, which is free on the Annals site: compared with v3 word by word, with every differing passage read;
- arXiv v1, compared for the history of the statements.

**Deliverables:**

- `research/blueprint/papers/PAPER-GAN-ICHINO-18.result.json`: 89 items, 6 routes, 48 prerequisites, 4 source issues;
- the report `research/blueprint/papers/PAPER-GAN-ICHINO-18.md`.

## Judgement calls for the reviewer

**One Part II, not a new roadmap.** `MetaplecticAutomorphicFormsPartIIShimuraWaldspurger` (57 items) extends MetaplecticAutomorphicForms. That roadmap builds the covers, Weil representations and theta modules but not the correspondence. The Part II holds:

- the general theory, in layers 1–4 of the brief:
  - local genuine representations;
  - the local Shimura correspondence and the local Langlands correspondence for Mp_2n;
  - J.-S. Li's stable range;
  - global theta lifts and the Rallis inner product formula;
- the paper's own theory, in layers 5–9: the discrete spectrum, the comparison of local lifts, the globalizations and the main theorems.

A reviewer could split layers 1–4 into their own Part II, "theta correspondences". Other queued papers that use theta lifts would benefit from that split, for example Gan–Savin 2023 on exceptional theta correspondences and Disegni–Liu. The brief already asks for layers 1–4 to be importable on their own.

**Local theta facts go to MP.3 as a source.** MP.3 names Howe duality as "a separately source-qualified extension" to be "pinned to an actual theorem". The facts routed there are:

- Howe duality, with Gan–Takeda as the pin;
- the conservation relation;
- the induction principle;
- the MVW involution;
- the unramified correspondence, as PAPER-CHENEVIER-TAIBI-20 did.

**The paper's hypothesis goes to ML.4.** This is the multiplicity formula (6.1) for non-split SO_2n+1, which Ishimoto proved for generic parameters (IMRN 2024). The Vogan-packet local Langlands correspondence for SO(V⁻), and Lemmas 5.1 and 5.5, go to ML.4 with it. ML.4's text asks for exactly this bookkeeping of conditional hypotheses. Theorem 1.4's item states the hypothesis and says it has since been proved.

**Planned statuses that lean on consistency with earlier extractions:**

- the symplectic/orthogonal dichotomy is planned in ML.4, as in PAPER-CHENEVIER-TAIBI-20;
- A-parameters for Mp_2n are Arthur's parameters for SO_2n+1, planned in ML.4, as in PAPER-JIANG-ZHANG-20;
- the archimedean local Langlands correspondence for GL_n goes to AF.1, as in PAPER-CHENEVIER-TAIBI-20.

## Source issues

**E1–E3 are gaps**: extensions of cited results asserted without argument.

- **E1.** Gan–Savin's Lemma 7.4 for s > −1/2, in the included proof of Lemma 5.2. The lemma is also credited to Atobe.
- **E2.** The induction principle "in the case at hand", in Lemma 6.3.
- **E3.** The Mp_2n analogue of Ichino–Lapid–Mao's Lemma A.2, in Proposition A.2.

E2 and E3 lie on the path to Theorem 1.4.

**E4 is a misprint in the published version only.** Reference [44] was replaced in copyediting by Langlands' "Ein Märchen". The intended paper is "On the notion of an automorphic representation", which arXiv v3 lists as [44]. The published list has no entry for it, and all the other references match v3 after renumbering.

## Remaining

Nothing for this job. The cited inputs were not read, except Ishimoto's introduction and main theorem. The items that rest on them say so.
