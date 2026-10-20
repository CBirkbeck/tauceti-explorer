# FIX-PKG-K3BlochGroups~adv2 — issue #11336

Worker: Codex (GPT-6), session `codex-52zHpj`; 2026-10-20.
Branch: `codex-52zHpj-k3blochgroups-adv2`.

Completed the maintainer's de-cycling correction. The bot confirmed this
session's claim on comment 6288954196. This is a package fix, not an
independent review or an implementation claim. The issue's final instruction
limits this round to supplier directions and preserves the accepted verdict
unless a source contradicts a statement. No such contradiction was found in
the touched statements.

## Finding dispositions

| Finding | Change | Result |
| --- | --- | --- |
| Analytic P.1 supplier must precede K3BlochGroups | Repointed the ownership paragraph, interval Rogers supplier contract, §5.8 construction and Layer 5 dependencies to PolylogarithmFunctions. Replaced the old P.1 request pointer in §5.8 with the named supplier contract. | Every analytic supplier reference now names PolylogarithmFunctions, without guessing its concurrent design's layer IDs. |
| P.4 specialization read as a supplier | The smooth-curve contract says §3.12 supplies the weight-two specialization lemma to the downstream Polylogarithms P.4 applications. | The specialization remains here; P.4 consumes it. |
| P.2 regulator agreement read as a supplier | The Layer 6 paragraph says downstream Polylogarithms P.2, BorelRegulators R.7 and PadicHodgeRegulators D.2 consume the algebraic comparisons to prove agreement. The ownership and Layer 5 paragraphs make the same direction explicit. | No Polylogarithms occurrence describes a prerequisite of this package. |
| Prior adversarial findings 1–5 | Preserved the Hopf/unit supplement, integral Chern and characteristic-torsion contracts, unstable rank-two symbols, d³/monomial calculations, and actual finite-field maps from the preceding repair. | No new mathematical changes; the earlier finding dispositions remain in `FIX-PKG-K3BlochGroups~adv.md`. |

Only seven README paragraphs changed. All six layers, 61 numbered target
subsections, 51 Checks blocks and 59 source-locator paragraphs are preserved.
`Suggested.lean` is byte-for-byte unchanged: it contains no Polylogarithms
reference. The local Rogers homomorphism, its period and its three real
argument cases remain targets of §5.8; only the interval analytic input moves.
The reviewer identity in `review.json` is the fixing-worker identity expressly
requested by this issue, rather than an independent-review identity.

## Adversarial pass on the touched statements

Values below are coefficients of π². The case split retains x≠0,1; these
excluded endpoints are not silently made reduced generators.

| Statement / interface | Instances tried | Result / change |
| --- | --- | --- |
| Ownership of analytic functions and algebraic descent | Interval function without any Bloch carrier; algebraic symbols before regulator descent | PolylogarithmFunctions supplies analytic identities; K3BlochGroups supplies the algebraic presentation and maps. Downstream regulator descent is not an input. |
| Interval normalization and ordered five-term identity | x=1/2; admissible ordered 0<y<x<1; x=0,1 excluded | L(1/2)=1/12. Suslin's ordered five-term sum is 1/6 before shifting, zero after subtracting L(1); no normalization changes. |
| `realRogersHom` positive case | x=1/2 | ρ([1/2])=1/12−1/6=−1/12. |
| `realRogersHom` greater-than-one case | x=2 | ρ([2])=1/6−1/12=1/12. |
| `realRogersHom` negative case | x=−1, hence 1/(1−x)=1/2 | ρ([−1])=1/12−1/3=−1/4. |
| Period and universal torsion class | c=[2]+[−1]; multiples 1 through 6 | ρ(c)=−1/6 modulo ℤ has exact order six. Reducing modulo half the period would lose the required detector. The source check and exact rational computation agree with the unchanged Checks. |
| Smooth-curve specialization | Identity specialization; the existing small-field/conjectural controls in §3.12 | The specialization hypotheses, targets and controls are unchanged. Only the consumer direction is restated. |
| Layer 5 and Layer 6 comparisons | Construct algebraic maps without a real or p-adic regulator; existing n=1 and n=5 controls | No analytic regulator agreement is used to construct them. The finite-coefficient Habiro application retains its separate, unchanged contract. |
| Lean hypotheses and examples | Whole unchanged file, all existing variable blocks | No signature, hypothesis, map direction or example was edited; all 26 examples still elaborate as proved examples. |

No new carriers, definitions, generality restrictions or denominator claims
were introduced. The zero-ring, characteristic-two, finite-field and
finite-coefficient controls of the preceding repair remain unchanged. The
source checks here concern the analytic input and the local real detector,
not a new review of all untouched proof decompositions.

## Sources and ownership checked

Read the previous adversarial review and repair handoff, the package's supplier
contracts and affected sections, the approved exemplar, and current upstream
AlgebraicTopology and completed ContourIntegration as style/ownership models.
The read-only current roadmap tree is at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches there by Rogers,
dilogarithm, Bloch–Wigner and `realRogersHom` found no competing analytic or
local-detector target. No upstream file was changed or built. Read the former
Polylogarithms Layer 1 analytic contract; the maintainer's new owner replaces
that supplier without importing Polylogarithms' later algebraic layers.

Public source copies inspected on 2026-10-20:

- Zagier, [*The Dilogarithm Function*](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), II.1.A, printed pp.23–24: interval normalization, extension and special value. SHA-256: `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0`.
- Suslin, [*K₃ of a field, and the Bloch group*](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf), Lemma 1.6 and proof, Proposition 1.1, printed pp.219–220: interval presentation, shifted homomorphism and exact order six. These scan pages were rendered and read. SHA-256: `ef16d5d93f6f9f6509f93e9b748f5cf06bda2a2a2da852404375638bab12994c`.

No source passage was added to the repository. No uncleared book was used.
No suspicious instructions were encountered in the external source material
inspected for this fix.

## Validation

- `lean-check research/blueprint/packages/K3BlochGroups/Suggested.lean`:
  exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau
  Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Only the 23 expected
  theorem `sorry` warnings; no errors or other warnings. All 26 examples are
  proved. Available memory was 80 GiB before the check; no Lean server or
  package build was started.
- Machine gate `mech_check.py`, inspected before execution with isolated
  Python: exit 0, with output exactly identical to the baseline. It counts
  40 declarations, 52 bold blocks, 297 underscore-bearing backticked
  identifiers and zero Check labels. Existing diagnostics are 30 README-only
  API names, the ordinary words “continuation” and “continuations”, and the
  required Summary paragraph. There are zero absent Check labels and zero
  empty Lean sections. No declarations or prose were added to suppress these
  unchanged heuristics.
- Targeted preservation check: all six layer headings, 61 target-subsection
  headings, 51 Checks blocks and 59 source-locator paragraphs unchanged;
  no P.1 supplier/request reference; all remaining Polylogarithms references
  explicitly say downstream or consume; the Lean file is byte-identical.
- Exact rational arithmetic confirms the three displayed ρ values and the
  order of their sum modulo the period.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: 0 problems.
- `git diff --check`: passed.

## What remains

Nothing remains for this de-cycling fix. The concurrent PolylogarithmFunctions
design supplies its own definition and layer IDs; this issue authorizes no
edits to it or to the dependency-order file. Earlier supplier-registration
requests and packet gaps retain their existing records and statuses; they are
not discharged by this package-only change. Automatic promotion still requires
an actual independent review: this fixing-worker verdict does not assert one.
