# Independent review of the R24.4 KW lifting import

Job `REV-PotentialModularityAndCompatibleSystems--R24.4`, issue #9399.
Reviewer: Codex, session `codex-iByxgo`, 2026-10-14. The dedicated blueprint was
written by Codex session `codex-fSmUts` (job #9428); this review is independent.

**Verdict: accepted after correction.** This is a finished target-level review,
not a checkpoint. R24.4 is an import of two existing consumer targets. The
lifting contracts agree with KW I Theorem 4.1, and the correction makes the
residual-witness proof obligations explicit. Acceptance applies to this
consumer plan: it does not accept the `needs_changes` GL2 supplier packet,
prove its theorems, or close any of the four recorded gaps.

## Scope and counts

| Item | Reviewed result |
| --- | --- |
| Stage | R24.4, `planned`; packet `complete`, `proofClosed: false` |
| Local nodes | 0; no definitions or constructions introduced |
| Reused comparison targets | 2: one consumer interface corrected, one verified |
| Added / unverifiable nodes | 0 / 0 |
| Baseline declarations | 5 confirmed; 0 removed or replaced |
| New API items / definition tests / planets | 0 / 0 / 0 |
| Imported definition tests | Three for α and three for β, retained with their owner |
| Suggested file | Three concrete matrix signatures; two full arithmetic signatures explicitly omitted |
| Requests / gaps | 4 / 4; one request and one gap added |
| Source issues | Empty; no source error established |

The two target IDs occur in the accepted R24.3 packet and are referenced, rather
than duplicated, in the dedicated packet. Both appear in `review.checked`.
There is no unexamined local-node inventory. A complete pass means this import
plan is finished; it does not mean its supplier proofs are complete.

## Sources and theorem contracts

Read the public author copies anew; their SHA-256 hashes agree with the packet.
Locators below use the printed preprint pages. The publisher versions were not
collated, and Kisin's Durham paper was not read.

- [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf):
  §1 p. 2, §1.5 p. 4, and §4 pp. 6–7, including Theorem 4.1 and its conventions.
- [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf):
  §8.1–§8.2 pp. 69–70, including Lemma 8.1; Theorem 9.7 and its proof pp. 89–90;
  §10.1–§10.3.1 pp. 90–92, especially §10.2 and its Remark; bibliography
  pp. 95–96 for the cited lifting inputs.

`R24.4/alpha-beta-from-residual-modularity` matches the α/β predicates in KW II
§8.2 p. 70 and their production from modularity over ℚ in §10.2 p. 92. α needs
parallel weight k(ρ̄) and unramified components above p. β needs weight 2 and
conductor exponent at most one there. Distinct witnesses are allowed. At p=2,
α is only promised at residual weight 2; β is promised at residual weights 2
and 4. Enlarging prime-to-p level is allowed; optimal level is unnecessary.

`R24.4/kw-theorem-4-1` retains the supplied lift, finite ramification and all
branch guards from KW I pp. 6–7. The dyadic branch needs nonsolvable residual
image and characteristic-zero oddness, with crystalline weight 2 or semistable
weight 2 at residual weight 4. The odd-prime branch needs cyclotomic absolute
irreducibility and crystalline weight between 2 and p+1, or potentially
semistable weight 2. Residual weight and crystalline lift weight are distinct.
At odd p the residual sign determines the lift sign because complex
conjugation has order two; at p=2 it does not.

KW II Theorem 9.7 does not replace the full theorem: §10.2 and its Remark p. 92
explicitly distinguish the further lifting inputs and the self-contained
range. The existing request for the nonordinary crystalline endpoint and the
ordinary/potentially-semistable branch checks is retained. No claim about
reading or proving those literature inputs was added.

## Corrections and supplier closure

1. **Conditional characteristic-zero witnesses.** Read the exact accepted
   `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`
   and `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`
   statements. They require an actual integral reduction eigenvector; they
   do not identify every Katz cusp form with that reduction image. Fine-level
   holomorphic base change does not automatically supply cusp/character base
   change. Their invertible-level hypotheses do not directly cover β at level
   Np. The previous reader's unconditional Katz-to-classical passage was too
   strong for these suppliers. Added the exact transitive prerequisites, an
   acceptance guard, a proof-boundary record, and a fourth request/gap to the
   R22.5 residual adapter. It must establish the classical witnesses at the
   prescribed weights and levels, by the appropriate reduction-image argument
   or a direct classical route. A Hasse weight shift alone does not meet those
   weight requirements. This is a supplier proof obligation, not an extra
   hypothesis on KW's theorem or an alleged source error.
2. **Small-prime acyclicity.** Read the R20.3/R20.4 weight/level exports and
   `SerreWeightAndLevelOptimisation:R20.6/strong-form-case-table`. The latter is
   expressly a manifest. Some rows name later R27 Serre-modularity results;
   they do not export a lower-tier proof for use in Theorem 4.1. Expanded the
   existing small-prime request and gap to exclude a circular discharge through
   those rows. The supplier may prove the weaker, nonoptimal-level witness
   statement required by KW II §10.2, rather than all of the manifest's optimal
   weight/level assertions.
3. **Field-selection scope.** Read the GL2 allowable-base-change and theorem
   statements. Clarified that elementary field selection through R23.1 can be
   a transitive input, consistent with KW II Lemma 8.1 p. 69. The prohibited
   dependence is on R23.3–R23.6 potential modularity, not on every object carrying
   an R23 identifier. R24.1–R24.3 global finiteness, arithmetic points and lift
   existence remain outside the proof of Theorem 4.1.
4. **Synchronized deliverables.** Brought the reader and suggested-file omission
   explanation into line with the packet. Added the complete independent-review
   record, five baseline confirmations and the two consumer verdicts. No
   mathematical theorem signature was weakened, and no supplier file was edited.

The GL2 owner statements and α/β APIs/tests were read in
`GL2ModularityLifting--R22.1.json`, where the stable R22.5/R22.6 IDs reside.
Its review remains `needs_changes`; this review makes no contrary certification.
The dedicated packet's closure ends at exact suppliers, requests and honest
proof/signature gaps. No nonroutine missing proof is passed off as routine.

## Baseline, API and duplication

Every cited module was opened at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the pinned GitHub files were also
compared byte for byte with the shared build. All five matched.

| Declaration | Confirmed scope |
| --- | --- |
| `Field.absoluteGaloisGroup` | Algebraic-closure automorphisms with Krull topology |
| `Representation` | Algebraic monoid homomorphism into linear endomorphisms; continuity is additional |
| `Representation.IsIrreducible` | Simplicity of subrepresentations over the given field; not absolute irreducibility after restriction |
| `Matrix.det` | Finite square matrices over a commutative ring |
| `ZMod` | Actual modular-integer coefficient ring, including characteristic two |

There are no new definitions needing an API or tests. The imported α/β witness
constructors and characterizations are retained. Their six tests correctly
distinguish prescribed weight, unramified/Steinberg components and conductor
exponent two. A failed specified witness is not a proof that no other witness
exists. The matrix examples correctly show determinant-sign and matrix loss
modulo two; they test neither global representations nor modularity. The two
full consumer signatures remain omitted until the arithmetic carriers exist.
The theorem planets remain with the two GL2 theorem owners.

Read `data/library-coverage.json`: it has no R24.4 record. Related G7, R19.3 and
R26.1 records are leads, not a verdict invented for R24.4. Inspected current
TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including LocalGaloisGroups,
ProfiniteArithmetic, IntegralHeckeAndGaloisDeterminants, newforms and coefficient
fields. No full KW lifting export was located. Those existing carriers are
imported rather than replanned. Completed Multiquadratic and InductionRestriction
were read for upstream document form. No source passages or excerpts are copied
into these deliverables.

## Validation and orchestrator follow-through

- `check_blueprint.py`: zero errors, zero warnings; one planned stage, four
  requests and four gaps.
- `lean-check` on the suggested file: elaborates at the pinned build; only three
  expected `declaration uses sorry` warnings.
- Intake file validation and `git diff --check`: pass.

RT-AREA-langlands-2/12 is correctly reflected in the import plan: remove
R24.3→R24.4, give R24.4 the direct R22/R20 inputs, and let R24.5 consume R24.3
and R24.4 directly. The maintainer applies that graph proposal; this job edits
no graph or supplier files. Route the new exact-weight witness request to the
R22.5 adapter owner and retain the existing small-prime and lifting requests.
No further correction to the R24.4 consumer pass is required before acceptance.
