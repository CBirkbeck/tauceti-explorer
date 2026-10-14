# REV-ClassicalArithmeticCompletion--CA.5

Independent review of `BP-ClassicalArithmeticCompletion--CA.5`, the CA.5 follow-up packet written by
Codex, session `codex-SSHEsg` (issue #9669, pull request #9696). Done by Claude, session
`claude-92wfjX`, issue [#9678](https://github.com/CBirkbeck/tauceti-explorer/issues/9678), on
2026-10-14. This session wrote no part of the plan under review.

**Verdict: accepted, with corrections made in place.** The packet, its reader and its suggested Lean
file were corrected. No statement of the plan was false, and no gap or request is needed. The
corrections are of five kinds:

- closer pinned suppliers;
- source locators and matches;
- test kinds;
- one new acceptance check;
- three new source findings.

The review object is in the packet. It has a verdict for every new node, for every entry of the
resolution ledger and for every other imported target, and a list of the edits made.

## What the packet contains

The parent packet `ClassicalArithmeticCompletion.json` (accepted by REV~3) left CA.5 `partial`, with
three remaining items. These were the certificate criteria, the Koymans–Pagano comparisons and a
sixteen-target review frontier. The follow-up answers them in two ways.

- **Eight new targets:** one light definition and seven theorems. These are the unit-action model,
  the two-primary detection lemma, three negative Pell comparisons, the unit Galois-module normal
  form, a determinant error bound and an interval form of the class-number–regulator certificate.
- **A sixteen-entry `frontierResolution` ledger** for the parent's frontier targets. The nineteen
  parent targets are imported by id and not edited.

## Method

- **Sources.** All five public sources were fetched afresh into scratch space. Four checksums match
  the packet. Stein's matches the parent packet's record and is now recorded here too. Every locator
  of the new nodes was read on the page, and so was every locator of the reader's interface
  sections: Koymans–Pagano v1 pp. 1–4, Biasse–Fieker pp. 386 and 398–400, Stein pp. 73–74, Belabas
  pp. 20 and 36, and Conrad pp. 1–4.
- **Baseline.** Each of the 44 declarations was located in the pinned declaration index, and its
  statement was read in the source file at Mathlib 082e2d3 and Tau Ceti f790474.
- **Closure.** Every proof sketch of the new nodes was checked step by step. Every numerical claim
  was recomputed with exact arithmetic: cube coordinates, Pell solutions, determinant bounds and the
  ideal matrices in ℤ[i].
- **Ledger.** Each of the sixteen resolutions was compared with the parent's sixteen
  "Independent review: …" gaps and checked for soundness.
- **Duplication.** A sweep covered pinned and current Mathlib and Tau Ceti, every TauCetiRoadmap
  roadmap, all atlas packets and all accepted packages, plus the open CA.4 pull request #9704.
- **Reader.** The node sections were re-rendered from the packet. The renderer first reproduced the
  committed sections byte for byte from the committed packet. A string check then confirms that
  every statement, hypothesis, acceptance item, API and test text, supplier, locator and match of the
  eight nodes and of the nineteen imported targets appears in the reader. The two exceptions are
  deliberate rewordings that remove the forbidden word "later".
- **Checks.** `check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. The packet's
  `sourceIssues` pass `scripts/check_errata.py`. `lean-check` elaborates the suggested file before
  and after the review's edits, with admitted-proof warnings only. A separate proofread compared
  packet, reader and Lean file after the edits.

## Counts

| Item | Before | After | Notes |
| --- | ---: | ---: | --- |
| New nodes | 8 | 8 | all 8 corrected (sources, suppliers or tests); none added, none unverifiable |
| Ledger entries | 16 | 16 | all verified, matching the parent's 16 frontier gaps one to one |
| Other imported targets | 3 | 3 | verified; their reader text matches the parent packet |
| Baseline declarations | 44 | 48 | all 44 confirmed; 4 closer suppliers added; none removed |
| Source findings | 0 | 3 | E1501–E1503, all new and confirmed |
| Gaps / requests | 0 / 0 | 0 / 0 | |
| Planets | 0 new | 0 new | the parent's six CA.5 planets stand; the limit of six is reached |

Stage coverage `closed` and packet status `complete` are confirmed: every target of CA.5 is a node of
the parent or of this packet, and every chain ends in the pins or in CA.3/CA.4 nodes.

## Corrections

| Node | Correction | Reason |
| --- | --- | --- |
| `negative-pell-narrow-principal-comparison` | Proof now cites the pinned `exists_unit_isTotallyPositive_smul_of_norm_eq_neg_one` and `norm_eq_neg_one_of_isTotallyPositive_smul_gen` (`Quadratic/Conjugation/Norm/NegOne.lean`) and `coe_gen_ne_zero`, in place of re-deriving the sign count from `exists_unit_isTotallyPositive_smul_of_norm_pos`. The Lean signature uses `coe_gen_ne_zero hmin` in place of a separate nonvanishing hypothesis. Locator made precise. | The pinned library already proves both unit-level halves of the comparison; the node remains, as the integral Pell form is not pinned. |
| `quadratic-units-action-normal-form` | Added `norm_eq_intCast_iff_mul_ringOfIntegersQuadraticConj_eq_intCast` as supplier and in step 3. Locator made precise. | The proof passes from u·σ(u) = ±1 to the field norm N(u); that step names a pinned fact. |
| `negative-pell-full-unit-comparison` | Two source entries replaced by one, citing equation (1.1) on p. 1 and the definition of D⁻ on p. 2. | Both original matches were copies written for other nodes (the two-primary map and the unit module). |
| `two-primary-detects-bijectivity`, `negative-pell-two-primary-comparison` | Locator corrected to the first paragraph of p. 2, which defines D and D⁻ and cites Fouvry–Klüners [18, Lemma 1]. Matches now say the paper states coincidence of 2-Sylow subgroups, which the nodes make precise for the natural map. | The packet said "the paragraph following the definition of D"; the statement is in that paragraph. |
| `quadratic-unit-action-model` | Two tests of kind `value` set to `computation`. Locator made precise (second paragraph of p. 3). | `value` is not a PROTOCOL §12 test kind. |
| `determinant-entrywise-enclosure` | Added a Hadamard-matrix acceptance check (and a Lean `example`). The match records that Biasse–Fieker's Lemma 4.4 is false as printed and that the node is the corrected form. | New finding E1501. |
| `interval-class-number-regulator-certificate` | Locator covers pp. 398 and 400. The match says which halves of the two intervals the proof uses, and records E1502. | Precision of the source citation; only R_u ≤ R̂+ε and a−η ≤ hR are needed, so the two-sided hypotheses are harmless. |

The packet also records the Stein checksum, five `sourceVersions` entries, and the pages the review
read (Koymans–Pagano p. 1; Conrad Example 2.5).

## Baseline citations

All 44 declarations exist under the cited names, at the cited modules, at the pins. Each provides what
its citing nodes need, under the same or weaker hypotheses. Points checked in detail:

- `NumberField.norm_gen_eq_neg_radicand`: the index lists two declarations of this name. One is
  public, in `Quadratic/Norm.lean:44`; the other is private, in `Quadratic/RingOfIntegers.lean:327`.
  The packet cites the public module, and that one is correct.
- `NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one` needs `0 < d`. All three
  negative Pell nodes assume `d > 1`.
- `NumberField.Units.regOfFamily_div_regulator` has no maximal-rank hypothesis. Its index is zero
  exactly when the family's regulator is zero, which is consistent with the uses.
- `NumberField.Ideal.primesOverSpanEquivMonicFactorsMod` takes `¬ p ∣ exponent θ`, so the ledger's
  use of `exponent_eq_one_iff` is exactly right.
- `CommGroup.primaryComponent G 2` uses Mathlib's instance `Fact (Nat.Prime 2)`.

No citation was removed. Four were added: the two negative-norm positivity lemmas,
`coe_gen_ne_zero`, and `norm_eq_intCast_iff_mul_ringOfIntegersQuadraticConj_eq_intCast`.

## The resolution ledger

The sixteen ledger ids are exactly the parent's sixteen `reviewFrontier` ids, and each resolution
answers its gap.

- **Granularity demands.** Most of the original findings ask for separate lemma nodes. At target
  level those are proof-sketch steps, and the ledger supplies the steps. Examples are the kernel as a
  submodule, the free-quotient contradiction, and positivity and relative-index-one.
- **Missing suppliers.** The ledger names them, and their statements were read: `index_eq_natAbs_det`,
  `relIndex_eq_one`, `leftMulMatrix_mulVec_repr`, `Ideal.natAbs_det_basis_change`,
  `discr_of_matrix_mulVec`, `exponent_eq_one_iff`, `Zsqrtd.lift` and `norm_add_mul_gen`.
- **The parent's suggested file.** It already states several of the requested signatures:
  `natAbs_det_eq_classNumber_iff`, `relations_and_units_complete_of_lt_two_mul` (with both
  equalities), `exists_idealHermiteMatrix_eq_iff` and `nonempty_pell_mulEquiv_normOneUnits`. The
  CA.5 file adds the integral-basis corollaries, the multiplication-matrix criterion and the interval
  certificate. The Pell index and generation statements stay README statements, as the package shape
  allows.
- **The worked class groups** were rechecked against Conrad Examples 2.3–2.4 (pp. 2–3): M_K ≈ 4.764
  and 6.97, N(2+√−14) = 18, and no elements of norm 2, 3 or 6.
- **The locator the original finding asked about.** For `class-number-divides-relation-determinant`,
  Biasse–Fieker §4.3, p. 398, opening paragraph, was read and is correct.

## Source locators

| Source | Locator(s) | Verdict |
| --- | --- | --- |
| Koymans–Pagano v1 | p. 1 (1.1); p. 2 first paragraph (D, D⁻, [18, Lemma 1]); p. 3 second paragraph (unit Galois module, Z ⊕ Z/2Z with (1,0) ↦ (−1,1)); p. 4 after (1.3) ((√d) narrowly trivial) | statements present. Corrected: the p. 2 paragraph and the p. 3/p. 4 positions. The matches now say the paper states these without proof. |
| Biasse–Fieker, LMS JCM 17A | §2 p. 386 (rows convention, Cl ≅ ℤ^N/ker); §4.3 p. 398 (h′, h* ≤ hR < 2h*, under GRH); p. 400 (test, Lemma 4.4, Proposition 4.5) | correct; two errors found on p. 400 (below) |
| Stein, ANT (2012) | Prop. 6.2.6 p. 73; Example 6.2.8 p. 74 (PDF page = printed page) | correct |
| Belabas, JTNB 16 | Def. 1.1 p. 20; §§5.3.1–5.3.2 p. 36 (column HNF, corner entry) | correct |
| Conrad, class group calculations | §1 p. 1; Examples 2.1–2.4 pp. 1–3 | correct; misprint found in Example 2.5, p. 4 |

## New source findings

All three are recorded in `sourceIssues`, each with a confirmed review verdict and the searches for an
existing correction. No erratum is linked from the Cambridge Core article page, and a web search found
none.

- **E1501, error, Biasse–Fieker Lemma 4.4 (p. 400).** The lemma states the bound
  |det Ω − det Ω̂| ≤ r^(r/2+1)(|Ω|^(r−1) + 1)·2^(−q′), where |Ω| bounds the entries of Ω. Its proof
  bounds the columns of Ω̂ by |Ω| as well, although their entries can reach |Ω| + 2^(−q′).
  - Counterexample, in exact arithmetic: r = 4, Ω the Hadamard matrix and Ω̂ = (3/2)Ω, so q′ = 1. The
    determinants differ by 65, and the printed bound is 64. For fixed q′ the gap grows with |Ω|.
  - Correction: replace |Ω|^(r−1) + 1 by (|Ω| + 2^(−q′))^(r−1). The proof's sum also runs to k
    instead of r.
  - Consequence: the certification survives, at a cost of at most r − 1 further bits. CA.5's own
    bound already uses B + δ.
- **E1502, error, the precision count after Lemma 4.4 and in Proposition 4.5 (p. 400).** The text
  charges r/2 + 1 bits for the factor r^(r/2+1), which costs (r/2 + 1)·log₂ r bits: 6 bits rather
  than 3 at r = 4. The explicit precision of Proposition 4.5 is therefore too small. Its complexity
  bound is unchanged.
- **E1503, misprint, Conrad Example 2.5 (p. 4).** The handout writes (13) = p₄₃p′₄₃ for (43). This
  is outside the cited examples and affects nothing.

## Duplication and ownership

- **No duplicates outside this roadmap.** None of the eight targets is stated in pinned or current
  Mathlib or Tau Ceti, or in a TauCetiRoadmap roadmap.
- **The narrow-principal comparison** is a short corollary of the pinned lemmas named above, and now
  cites them.
- **Determinant perturbation.** The nearest planned statements are different results:
  `LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation` is the non-archimedean bound
  without r!, and `DiophantineApproximationAndTranscendence:DT.3/perturbed-determinant-upper-bound`
  is an analytic bound for A + εB. Neither is a supplier for the archimedean entrywise bound.
- **The open CA.4 pull request** plans D, D⁻, rational solubility and the primes p ≡ 1 (mod 4). It
  does not plan these comparisons.
- **CN.2 restates CA.5's certificates.** `ComputationalNumberTheory:CN.2/units-complete-of-regulator-bound`,
  `CN.2/joint-class-unit-index-certificate` and `CN.2/certified-class-unit-completeness` restate the
  parent's `fundamental-units-from-regulator-bound` and `class-number-regulator-certificate`. CN is
  tier 15 and CA is tier 5, so CN should import them: see the notes below.

## Suggested file

- **Compilation.** `lean-check` elaborates the file at the pins, with admitted-proof warnings only:
  31 before the review and 32 after.
- **Name coverage.** Every packet `leanName`, the `endpoints` entry, and every API and test name of
  the definition occur in the file. Tests appear as comments above their examples.
- **Edits.**
  - `negativePell_iff_narrowPrincipal` drops its redundant hypothesis `(θ : K) ≠ 0` and uses the
    pinned `coe_gen_ne_zero hmin`, as the pinned narrow-class lemmas do.
  - An `example` records the Hadamard check of E1501.
  - A comment ties `relationDet_eq_classNumber_iff` to the parent's `natAbs_det_eq_classNumber_iff`.

## Reader

- **Node sections.** The eight node sections are re-rendered from the corrected packet. One
  cosmetic fix: a doubled full stop at the end of the consumer list.
- **Inherited targets.** Each of the nineteen now has a `Sources:` line with the parent packet's
  locator and match, which the reader omitted. The four Conrad handouts that only inherited targets
  cite are listed after the source inventory.
- **Inventory and findings.** The pinned declaration inventory gains the four added rows. The
  paragraph that said no source error was established now summarises E1501–E1503.
- **Reader-sync summary.** The reader says nothing that the corrected packet contradicts. Each
  section of `## Additional comparison and error targets` matches its packet node field by field.

## Questions and notes for the orchestrator

1. **CN.2 duplicates CA.5's certificates (maintainer note).** The ComputationalNumberTheory plan
   (tier 15) restates the regulator-bound and joint certificates of CA.5 (tier 5), in its packet
   nodes and in its package's CN.2 stopping bounds. On its next revision it should cite
   `ClassicalArithmeticCompletion:CA.5/fundamental-units-from-regulator-bound`,
   `…/class-number-regulator-certificate` and `…/interval-class-number-regulator-certificate`, as
   this packet's `ownership` field already states.
2. **Parent bookkeeping for the assembly.** The parent packet still carries CA.5 coverage `partial`
   and the sixteen "Independent review: …" gaps. This packet's `frontierResolution` resolves them.
   The assembly of ClassicalArithmeticCompletion should mark them resolved, since the parent could not
   be edited here.
3. **Two Lean forms of one target.** The determinant criterion appears in two forms: the parent
   file's `natAbs_det_eq_classNumber_iff` for the presentation map of an ideal family, and CA.5's
   `relationDet_eq_classNumber_iff` for any surjection. The negative Pell comparison appears with the
   parent's `Algebra.norm ℤ` on 𝓞 K and with CA.5's `Algebra.norm ℚ` on K, which is Tau Ceti's
   convention. A package should keep one form of each.
4. **Namespace.** The new nodes' `library.namespace` is `TauCeti.ClassicalArithmetic.CA5`. That
   suits a suggested file, but a library namespace should not name a stage, so a package should use
   `TauCeti.ClassicalArithmetic`.
5. **Koymans–Pagano route 7.** The process boundary is unchanged. The statements of extraction items
   5, 9 and 12 match the three comparison nodes; the route verdict belongs to the paper workflow.
