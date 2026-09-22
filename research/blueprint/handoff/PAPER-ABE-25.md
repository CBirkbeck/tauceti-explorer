# PAPER-ABE-25 handoff

Codex — codex-a71f92; issue #1214. Partial checkpoint, 2026-09-22.

## Done

- Read every page of the published 18-page paper, all proofs and references; inspected pages 613 and 621 as images.
- Read the selected Lu–Zheng and Laumon passages listed in the report/JSON. Full source URLs, retrieval dates and PDF hashes are recorded.
- Extracted 98 interfaces: 7 library, 8 planned, 83 missing. Exactly one route for each missing interface; two existing-layer source routes and four Part II briefs.
- 36 definitions/constructions, 108 API statements, 108 proposed unit tests; 184 acyclic item-dependency edges.
- Checked pinned library statements and relevant accepted audits; reused existing representation-ring, categorical K0 and Euler–Poincaré code.
- Recorded five review candidates: weighted different formula, Fourier degree/sign, nonreduced fixed-scheme comparison, Lu–Zheng coefficient-scope gap, and a minor typo.
- Exact elementary certificate passed; no Lean file or elaboration is claimed.

## Resume

1. Obtain Kato–Saito–Saito (1988), Conjecture 5.1 and Lemma 5.3, including proofs. The attempted DOI/JSTOR access returned HTML. Do not treat the nonidentity virtual trace identity as positivity or Qℓ descent.
2. Read Orgogozo's 2.1/7.1/8.1/8.3 and the cited EGA/SGA limit, strict-local and constructibility inputs. Further split A12–A16 into the actual supplier lemmas.
3. Complete the projective Swan module/tower, integral exactness, adic perfectness and equivariant strictification proofs. Read Serre19.2, Ferrand and the relevant Kashiwara–Schapira totalization result.
4. Close the group-ring-perfect Fourier comparison from the original Laumon proof infrastructure and Abe2022 6.4–6.5; then the SGA5/Fulton local trace computation.
5. Independently verify E1–E5. The report gives explicit counterchecks and explains the limited impact. The author-page novelty search is incomplete because access failed.
6. Finish Katz and the sign-sensitive higher-dimensional Milnor interpretation. Keep §3.2's W(k)[1/p]-rationality assertion marked conjectural.
7. Rerun current-main ownership checks before final closure. Use stage-prefix dependencies to avoid a false arithmetic/Fourier cycle. Do not duplicate the pending microlocal continuation.

## Checks

Paper checker, supplemental dependency/route/API audit, all nine paper-checker unit tests and three-file intake check passed (zero problems). Current-main instructions, owner documents and accepted coverage were rechecked; no overlapping deliverable exists. The PR records final results. No additional deliverable or Lean file is authorized for this issue.

This checkpoint deliberately remains partial: the 12 JSON gaps identify what has not been established. The next worker can continue from the stable item IDs without repeating the full main-paper reading.
