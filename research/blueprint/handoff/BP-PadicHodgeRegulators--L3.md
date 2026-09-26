# Handoff: BP-PadicHodgeRegulators--L3

Issue #967. Worker: ChatGPT Pro / GPT-6 Astra Pro.
Session `chatgpt-20260926-c8f4a1`.
Branch `chatgpt-20260926-c8f4a1-regulators`.

## Delivered and status

Partial checkpoint: **26 nodes** (4 definitions, 6 constructions, 9 lemmas, 7 theorems), **30 API entries**, **30 named tests**, **7 planets** (one L3, six L4), **9 pinned baseline citations**, **5 gaps** and **6 supplier requests**. Both stages remain `partial`; neither is closed.

The substantive core is LLZ section 4A: specialization constraints, the adapted one-point basis, induction with inverse transport, determinant ideals, and exact coordinate-image generators with polynomial witnesses. L4 also contains the coordinate/logarithmic-matrix identities, simultaneous constant basis covariance, and integral finite-exception shear argument. L3 contains the quadratic Euler formula with separate nonzero Frobenius and Euler denominators. No actual regulator, Wach module or analytic distribution is implemented by this checkpoint.

## Checks actually performed

Exact rational/polynomial SymPy regressions with seed 967 passed: 42 constraint bases, 103 coordinate generators with witnesses, 45 basis transports, 93 Euler calculations, and seven negative controls. These are finite algebra checks, not p-adic analytic proofs.

Local structural checks on the authored files passed: JSON parsing; unique ids; acyclic prerequisites; scope/source fields; API/test requirements; planet counts; presence of every node/API/test name in the companion signatures. These checks are not the official full-world/declaration-index validation. The publication copy of the packet uses the same mathematical declarations with shortened wording. Repository CI supplies the official validation; its live outcome is reported in the PR rather than invented here.

**Lean was not compiled.** No Lean/lake executable is available. Check inferred coefficient algebras, dependent subtype basis matrices, scalar towers, local instances and classical decidability for the finite-set filters when elaborating. Mathematical hypotheses were made explicit where automatic binder inclusion could drop assumptions absent from a basis-valued result type, particularly the domain condition. No claim that all signatures elaborate is made.

## Ownership and baseline

Read WORKERS.md and the blueprint protocol, retaining the source-faithfulness and upstream-style rules already read in this session. Read the complete current regulator document and atlas extract, accepted RS-26, the PG supplier document, relevant accepted AUDIT-26 L3/L4 entries and REV-AUDIT-26. The aggregate `data/library-coverage.json` was too large for the available reader; the accepted source audit was used instead.

No pre-existing packet or integrated decomposition for this part was found. The PG full packet was not found. The inspected PM packet is a partial pseudomeasure core, not a supplier of bounded-series evaluation or the integral image theorem. Our preceding LAD packet is a Fredholm checkpoint, not a source for the missing Mellin/distribution constructions. Requests therefore do not cite unrelated node ids. Searches found the relevant atlas, audits and restructuring interfaces; no new exhaustive catalogue-wide link audit is claimed.

All nine baseline citations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Matrix.det_mul was read earlier in this session at that same pin; the other citations were read for this issue. Tau Ceti remains pinned at `f790474821cf4256814db967cb154e7af3d0c369`; no unverified Tau Ceti declaration is cited as a regulator implementation.

## Source versions and findings

Read the LLZ version of record, ANT 5(8) (2011), 1095–1131, through extracted PDF text, including the complete local proofs of section 4A, the matrix construction, Euler Lemma 5.6, and the integral/shear arguments of sections 5B–5C. Other statements and proof routes were examined, but the imported Perrin-Riou, Colmez, Berger and earlier LLZ proofs were not all read. This is not complete source decomposition.

Relevant preprint pages 16, 21 and 25 of arXiv:1006.5163v2 were inspected as rendered pages during this work. That version is dated **17 October 2010**. Published-page rendering and some additional preprint render requests failed; downloads failed, so no hash is supplied. The two sourceVersions records distinguish the texts actually read.

Two local findings, **E301** and **E302**, are recorded without an independent verdict or novelty claim. The published Proposition 5.11 proof infers an integral GL matrix from a nonzero determinant; e1=1,e2=−4 in Z_5 gives determinant 5 and disproves that implication. Choosing both entries in the maximal ideal repairs the argument; this sufficient choice is already stated in preprint Remark 5.12. The other finding is the reversed S′⊂S in the Proposition 4.2 proof. Neither finding asserts failure of the theorem. Independent review should verify the version-of-record locators, preferably with a successful visual collation. A possible k/j interpolation subscript seen in extraction was not promoted to a finding without that collation.

Only the bibliographic identity and abstract of Rodrigues Jacinto 2018 were identified. Its full open-domain statement and proofs are not counted as read or covered.

## Exact continuation

1. Instantiate evaluation, bounded division and nonzero X−x on O_E[[X]][1/varpi]. Never replace this with all E[[X]], omit distinctness, or allow q_j=0 in the basis theorem.
2. Read LLZ Theorem 2.12 and its imported good-basis proof. Construct the actual psi/Iwasawa/Mellin maps with PG.4–6 and regulator L2; freeness alone is not the good-basis property.
3. Decompose section 2 elementary divisors and sections 4B–4C genuine regulator/Coleman image equality, with every refinement, weight and Frobenius hypothesis and determinant/reciprocity input. Apply the constraint-module lemmas only after identifying the actual image and transported subspaces.
4. Prove the integral lower inclusion from earlier LLZ Proposition 4.11, then Theorems 5.10 and 5.13 with their finite-index/pseudo-null correction. Rational surjectivity is insufficient.
5. Complete L3 finite-character/integer-twist interpolation, auxiliary-h, growth, reciprocity, lattice/base-change and Tate-rank-one sign comparisons.
6. Read Rodrigues Jacinto's exact de Rham-domain theorem and crystalline comparison; elaborate the suggested file. Keep both coverage records partial until their lists are exhausted.

Only this issue's four deliverables were changed. No issue is closed or label changed manually.
