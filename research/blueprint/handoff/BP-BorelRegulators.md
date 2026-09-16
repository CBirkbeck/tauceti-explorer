# BP-BorelRegulators handoff

Worker: ChatGPT Pro — cgp-504c2b4122bc. Issue: #74.
Claim comment: 5696761339; workflow confirmation: 5696763041. Ownership was rechecked before submission and was uncontested.

## Status and files

This is a **partial mathematical blueprint**, not an implementation or a completed proof decomposition. All seven scope stages R.1–R.7 remain partial; all implementation statuses are unchecked. The two reserved export identifiers are preserved.

Authorised files:
- `research/blueprint/packets/BorelRegulators.json`
- `research/blueprint/readmes/BorelRegulators.md`
- `research/blueprint/handoff/BP-BorelRegulators.md`

The packet contains 36 nodes: 11 constructions, 10 lemmas, 6 theorems, 4 comparisons, 3 definitions and 2 applications. There are 64 API entries, 2 positively checked baseline declarations, 12 gaps, 11 supplier requests and 1 restructuring proposal. No stage is claimed closed. No other packet, integrated data, queue, reserved ID, application or Lean source is changed.

## Revisions and input checks

Mathematical input revision: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`.
Submission branch base: `1338883fe31f3b357dd91b7d5916e76e3b950c81`.
Branch: `cgp-504c2b4122bc/BP-BorelRegulators`.
Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

The source roadmap, baseline, reserved IDs and blueprint checker were unchanged between these input and branch-base commits. The browser instructions were refreshed after atlas extracts became available, and the Borel extract was checked. The original combined atlas was readable through the blob API but was not available as a local execution input. No substitute atlas was fabricated.

The integrated Borel decomposition and expansion draft returned not found. The input revision's external expansion tree was searched for BorelRegulators without a match. No existing blueprint packet or open duplicate pull request was found in the pre-claim checks. New submissions still require the maintainer's ordinary integration collision checks.

Full upstream documents read: ArithmeticDirichletSeries and RepresentationTheory/LieGroups. Campaign inputs read include BorelRegulators, GeneralAlgebraicKTheory, ArithmeticKTheory, StableHomotopyKTheory, AutomorphicFormsOnReductiveGroups and AutomorphicLFunctionsAndLocalFactors; the relevant M.6–M.8 sections of MotivicEtaleKTheory were read. No independent review is claimed.

## Work preserved

The reserved rank theorem is separated from finite generation. The regulator is defined before nondegeneracy; nondegeneracy is not inferred merely from equal dimensions. Finite generation is imported only for the full lattice and covolume argument.

The target is the conjugation eigenspace of real-valued functions on embeddings, with epsilon=(-1)^(n-1). Coordinates use one representative of each complex pair. Their Lebesgue measure is distinguished from ambient Euclidean subspace measure. The real Tate generator is (2*pi*i)^j. The empty determinant is 1.

The source audit distinguishes the coordinate Borel covolume from Borel's historical determinant R_m^77. The checked 1977 formula involves pi^d times R_m^77; its conversion to the chosen coordinate regulator is explicitly unresolved. The 1980 erratum is included. Tamme's comparison is Borel=2*Beilinson, hence the determinant factor is 2^d, after the same coefficient conversion on both maps.

The M.8/R.7 dependency problem is recorded: M.6 supplies rational weights, not the independent Deligne regulator. Importing the whole M.8 into R.7 would be circular. The restructuring proposal requests an early construction-only export inside the motivic owner, without assigning or editing supplier IDs.

## Sources and verification boundary

All source readings took place on 2026-09-16. Exact URLs, editions, locators and read-section boundaries are in the packet.

Borel 1974: printed pp.266–268 and 270–271, including Proposition 12.2. Borel 1977: introduction, sections 1.1–1.6 and 2.1–2.4, and scans of pp.630–634 including Theorem 6.2 and section 6.4. Borel 1980: the entire correction on p.373. Tamme 2010, arXiv:1007.1385v1: section 3.6, pp.69–71, including Lemma 3.20 and Theorem 3.21 with its proof. The latter refers to Theorem 3.11 and Propositions 3.16/3.18, whose proof interiors remain unaudited.

Bloch's first four lectures were not accessed. The compact-dual table and analytic proof interiors of Borel 1974, most of sections 4–5 of Borel 1977, and the independent global Tamagawa proof remain open work. No PDF files, book-text dumps or fabricated source hashes are included.

Only `NumberField.InfinitePlace` and `NumberField.dedekindZeta` are positive pinned baseline claims. Both declaration bodies were read. The latter is an ideal LSeries, not the negative-integer analytic continuation required here. Mathlib and the official TauCetiProject/TauCeti repository were searched; unsuccessful searches are not claims of absence at the pinned commit.

## Validation performed

The following commands were run in the worker's scratch environment:

```
python3 -c "import json; json.load(open('submission/research/blueprint/packets/BorelRegulators.json')); print('JSON parse: PASS')"
python3 scratch/validate_submission.py
```

Both exited 0. The custom local check reported zero errors for JSON/schema consistency, exact scope, reserved IDs, API roles, local dependency acyclicity, declared supplier references, README node/API coverage, scope vocabulary and private-path/Lean-code checks. Elementary rank/Gamma parity and determinant scaling/permutation sanity checks also passed. An unrelated spreadsheet-runtime startup warning appeared on stderr; the checker executed and returned its report normally.

These are **local subset checks**, not the full repository validator, proof verification or independent review. The complete atlas and pinned declaration index were not present in the execution container, so the required full command was not run locally:

```
python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json
```

The existing PR workflow covers this packet, fetches both pinned library trees and builds the declaration index. Its actual outcome must be read from the PR checks; no success is asserted in this handoff before that outcome exists.

## Exact continuation work

G1–G3: decompose cochain/quotient/compact-dual comparisons, the special-linear K-space bridge, rational primitive Hurewicz and the analytic stability ranges. Provide named finite-type hypotheses rather than relying on finite-level Betti numbers alone.

G4–G7: restore central-division-algebra order and S-integer generality, audit the remaining pinned embedding/linear-algebra/lattice API, construct the normalized universal Chern-character class and prove actual pairing nondegeneracy.

G8: compute the exact historical-determinant-to-coordinate-covolume conversion, including pi powers, factorials, Tate generators and measures. Do not replace that calculation by rational proportionality rhetoric.

G9: obtain Bloch's primary text and supply the global adelic quotient, archimedean measures, compact cycles and Tamagawa pairing proof. The two local-volume nodes are not that proof.

G10–G11: resolve the early motivic Deligne-regulator export, inspect Tamme's referenced comparison inputs, prove transfer/product/Adams compatibility, and pin the weight-two Bloch–Wigner scalar.

G12: obtain and inspect the full repository validation result, then arrange an independent mathematical review under the protocol's account/agent requirements. Preserve both reserved IDs when extending this packet.

The claim is not released merely because files are submitted. Integration, status promotion and review assignment remain with the maintainer/orchestrator.
