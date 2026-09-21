# Handoff: PAPER-TSIMERMAN-18

Issue #1141. ChatGPT Pro / GPT-6 Astra Pro. Session `cgp-ao-20260921-a7f3`. Status: **partial checkpoint**. This is not a completed extraction or a request to mark the job complete.

## Saved work

The paper result and report cover all six sections and references of the published 2018 Annals paper, with 65 mathematical items. Published numbering is used, including the field-of-definition Lemma 4.1 absent from arXiv v5. The source URL and access date are recorded; the binary could not be downloaded, so no PDF checksum is claimed.

The latest result has two verified library items, 17 planned items and 46 provisional missing items. Nine of the missing items have source routes; 37 remain intentionally unrouted. Existing owners are LD.6 for the Pila-Zannier/Andre-Oort branch, R35 for stable-height foundations, and CM.0/CM.2 for CM types and reflex reciprocity. Candidate Part II briefs are in the report, but no new IDs or routes are reserved by this checkpoint. Reuse averaged-Colmez paper jobs #1143 and #1145 rather than duplicating them.

## Important correction — use the latest baseline

A fresh read of `Mathlib/NumberTheory/NumberField/CMField.lean` at `082e2d37e8b0463410cdb532e111cd43d5a66174` returned blob `6c7067617742aae433a648031822e84a41746b4f`. The general CM regulator comparison **is already present**, without a Galois-over-Q hypothesis, through:

```text
NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv
NumberField.IsCMField.indexRealUnits_eq_one_or_two
NumberField.IsCMField.units_rank_eq_units_rank
```

The initial working note about a Galois-only `regulator_ratio` declaration was incorrect. It has been corrected in the submitted result. Do not restore that note or its different CM-field declaration names. `NumberField.IsCMField` itself was directly checked at the same pin.

## Resume in this order

1. Obtain readable **accepted** audit coverage for LD, CM, R35/R28 and the basic number-field/height imports. `data/library-coverage.json`, blob `5e708cfc74a51b10e62149113872fe4e00eb5846`, failed through ranged-file, raw-file and blob reads because of size. Do not convert unreviewed audit drafts into evidence. “Missing” is provisional, especially for Northcott, discriminant towers and ideal-counting inputs. Check Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369` before proposing new foundations.
2. Read Silverberg, *Fields of definition for homomorphisms of abelian varieties*, Proposition 2.3 (DOI `10.1016/0022-4049(92)90141-2`), and Shimura-Taniyama, section 15 Main Theorem 1. Verify polarized descent, definition of all endomorphisms/polarizations, and absolute moduli degree versus the reflex-field compositum.
3. Expand the Corollary 3.3 analytic interface. Check conductor-discriminant control for the actual representations, separate the trivial factor, make Brauer pole cancellation explicit, and justify both the value lower bound and derivative bound without an Artin-holomorphy assumption. Constants may be ineffective but must be uniform for fixed g.
4. Read Tsimerman 2012, Theorem 7.1 (DOI `10.1090/S0894-0347-2012-00739-5`), for arbitrary orders/products; read Pila-Tsimerman 2013, Theorem 3.1 (DOI `10.1112/S0010437X12000589`), for exact CM lift degree and height conventions. Preserve the centre-order discriminant.
5. Finish the final parameter-locus/induction part of Pila-Tsimerman 2014 Theorem 7.1 (DOI `10.4007/annals.2014.179.2.5`). Lemma 3.3, Theorem 6.1 and Lemmas 7.2-7.3 were inspected. Read Gao (DOI `10.1515/crelle-2014-0127`) for the mixed consequence: the 2018 paper states the precise scope as pure part a Shimura subvariety of A_g.
6. Finish a second complete nearby upstream-document read; EffectiveBounds was read fully, GlobalNumberFields/Chebotarev/AnalyticNumberTheory only partly. Screen reserved IDs, integrated decompositions, accepted packets and every relevant link before finalizing new Part II ownership. The inspected `research/blueprint/roadmaps/` directory contained only `.gitkeep`, but that alone is not the full screen.
7. Resolve every remaining missing item exactly once, update the status only after genuine closure, and run the full repository `scripts/check_paper.py` command.

## Validation already performed

The exact validator source was reconstructed and its Git blob checked against `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`. Local draft validation passed against a three-owner fixture from fetched roadmaps and extracts. Unique IDs, internal references and dependency acyclicity were checked. A complete-status negative control correctly failed on the 37 unrouted missing items. This was not a full atlas checkout run; PR CI is the check of the submitted files. No Lean compilation was performed or claimed.

Only the two issue deliverables and this handoff are submitted. Leave merging, labels, issue closure and eventual independent review to the repository intake workflow.
