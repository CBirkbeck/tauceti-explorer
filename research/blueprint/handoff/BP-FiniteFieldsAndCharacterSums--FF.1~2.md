# FF.1 revision round 2

Job: BP-FiniteFieldsAndCharacterSums--FF.1~2, issue #6515. Agent: Codex,
session codex-bEOnlg. Date: 2026-10-10.

## Completed revision

The reader now agrees with the mathematical packet and suggested file accepted
in substance by [REV-FiniteFieldsAndCharacterSums--FF.1](../reviews/REV-FiniteFieldsAndCharacterSums--FF.1.md).
Both outstanding reader corrections are complete:

- Its source audit treats E750 as a rejected allegation. Cohen-II,
  Lemma 11.7.12, printed pp.390–391, uses the fraktur prime ideal 𝔭; the earlier
  rational-prime interpretation was a transcription mistake in the blueprint.
  The reader distinguishes this from the known n/N erratum E751 in
  Theorem 11.6.14, printed p.372, and supplies the author-errata locator.
- Its projective-evaluation paragraph describes all five tests. The fifth,
  `projectiveEvalTests.finite_nonzero_linear`, evaluates X at 2 over F₃ with
  ambient degree two and expects 2. It detects a rule that evaluates every
  finite point at zero. The other four tests retain their existing meanings.

The packet and suggested file are unchanged, including all eight node ids,
statements, prerequisites, source-issue verdicts and the prior `review` object.
The next independent reviewer must replace that object; this revision does not
record its own acceptance. The packet remains `complete`, FF.1 remains
`planned`, and every node's implementation status remains `unchecked`.

## Reviewer changes checked and retained

The following in-place corrections from the prior review were checked:

1. Kowalski's source record identifies the author notes dated 14 September 2021.
   A fresh download has the recorded hash and that date on its title page.
2. The all-character Fourier-boundary node uses the exact AC.0 transform and
   the native row-sum and Gauss-shift identities. Its direct prerequisites do
   not include the predecessor's nontrivial-only expansion.
3. E750 remains rejected in its source-issue review. The product proof and
   chosen-root request use the maximal-ideal normalization, without claiming
   a source correction or uniqueness for arbitrary roots reducing to one.
4. E751 remains confirmed; the official errata corrects both multiplier
   occurrences to N.
5. The fifth projective test and matching suggested example remain present;
   the construction's acceptance list requires five tests.
6. Finite-product Gauss factorization has only `gaussSum` and
   `Fintype.prod_sum` as direct prerequisites. Norm and trace lifts remain
   application data, rather than inputs to this elementary factorization.
7. The prior review's node checks and source verdicts are preserved for the
   fresh independent review to assess alongside the corrected reader.

All 32 baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including their relevant typeclass
scopes. In particular, the native polynomial linear maps and monomial
membership support the fifth test, and finite dependent product/sum interchange
supports the simplified factorization prerequisites. No new library claim or
mathematical node was needed. The direct predecessor, AC.0, L3 and RD.6
interfaces were checked against the retained consumer statements.

## Source and upstream evidence

Fresh public-source checks on 2026-10-10:

- [Cohen's author errata](https://www.math.u-bordeaux.fr/~cohen/deabookerrata.pdf),
  dated 30 November 2008, PDF p.4, the Volume II printed-p.372 entry for
  Theorem 11.6.14. SHA-256:
  `a2f5e8a3897494a2b7727019fdda1f47ac97af5b6528685e0c024a29aa786fa4`.
- [Conrad's Gauss and Jacobi sums](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf),
  Appendix (A.6), p.19 and footnotes 8–9: the two product intervals, multiplier
  and trivial Gauss-sum sign agree with the retained target. SHA-256:
  `546796c67f82b251c416dcfd10a20602e77efe3c63f0df8749d1e22831d163b7`.
- [Kowalski's elementary notes](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf),
  title-page edition check only. SHA-256:
  `ff30b82d143cedcaf76f1ef2f15a49856c0eabc2c95ba7ac0da2e3e43da9a866`.

The E750 typography evidence is inherited explicitly from the independent
review's inspection of Cohen's page images and fonts. This revision did not
reopen the full book: it is absent from the maintainer's cleared-book index.
The other original source-reading receipts, including BFP v2, remain inherited
from the packet and review. No source passage, PDF or extracted source text is
added by this revision.

The current upstream CharacterTheory and Completed/OrthogonalL2Bases readers
were read for the required roadmap examples. Current upstream roadmaps,
including the nine additions absent from the atlas snapshot, and the current
Tau Ceti library were searched for the retained elementary targets. No existing
target requiring a replacement of this reader revision was found. The inspected
upstream commit was `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; the current Tau
Ceti source commit was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Validation

- `scripts/check_blueprint.py` on the packet: zero errors and zero warnings.
- `lean-check` on the suggested file at the pinned Mathlib: exit zero,
  only the expected declaration-uses-`sorry` warnings. This checks admitted
  signatures and examples, not proofs.
- Correspondence checks: eight node declarations, six construction API
  declarations and five named tests agree between packet, reader and suggested
  file; source verdicts, status, scope and unchecked implementation flags are
  preserved. Source-issue schema and source-version checks pass.
- Packet and suggested-file SHA-256 match the claimed input respectively:
  `2a6a23cebd48c2b637933605e9c4c2dd8567919d46c8c2f6bc1ee66cbc141dc5`
  and `63b12d8f716701932d3a55053a4e78af9da6f23dfb8e6509eb2a12855c549a1f`.
- Deliverable-file checks and `git diff --check` pass. Only the authorized
  reader and this round's handoff are changed.

Totals: eight nodes (seven theorems, one construction), six API items, five
definition tests, four planets and 32 baseline declarations. One analytic gap
and two precise supplier requests remain; no new request is added.

## Remaining mathematical and maintainer work

There is no outstanding correction within this revision. A fresh independent
review should check the reader's source verdicts and fifth-test description.

For mathematical closure, RD.6 must supply both exact interfaces for the actual
Robert-sign formal series: its normalized coefficient norm bound, and its
coefficient sum on Teichmuller lifts equal to the compatible chosen-root trace
character, including p=2. L3's existing Gross–Koblitz comparison can then be
instantiated to discharge the unconditional product target's recorded gap.
The exact Gamma multiplication argument already supplies the required
prime-to-p root identity; it does not supply those analytic inputs.

Assembly must replace the predecessor's coarse AC.0 dependency/request with
the exact transform, Parseval and field-transport nodes; attach this route to
its existing product target and single product planet; and reconcile its old
product-root gap with the present analytic gap. No predecessor or supplier
packet was edited here.

The assigned findings RT-AREA-finitefields/7–10 retain their reviewed treatment:
built characters, orthogonality, Gauss/Jacobi identities and reciprocity are
baseline imports (/7); the predecessor owns elementary signed lifting and this
part supplies the distinct product route (/8); geometric Lang, duality and
Swan material stays with FF.2 and its external owners (/9); historical EXT-08
integration and queue forwarding remain maintainer work outside this issue's
authorized files (/10).
