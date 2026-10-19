# Independent review: ArithmeticKTheory

Accepted after correction, 19 October 2026. Reviewer: Codex, session
`codex-pZoKxY`, job `REV-ArithmeticKTheory`, issue #10779. This reviewer did not
write the submitted plan or its earlier parts.

The verdict applies to the **effective contracts**: the nine nodes declared in
the main packet and the 130 inherited targets after applying its
`contractRevision` records. It does not accept a concatenation of the unchanged
earlier packets. The packet's `review.checked` lists every target individually.

## Counts and scope

| Item | Result |
| --- | --- |
| Effective targets | 139: 125 verified, 14 corrected |
| Targets added by this review | 0 |
| Direct baseline declarations | 5 confirmed; 0 removed or replaced |
| Effective inherited contract revisions | 22, including the earlier main-pass revisions |
| Coverage | 10 stages planned; 0 closed |
| Remaining boundaries | 9 explicit gaps; 9 open supplier requests |
| Definitions/constructions | 27; all have an API and at least three discriminating tests |
| API-bearing targets | 28, with 3–8 tests each |
| Main source findings | 5 confirmed, including 4 added here |
| Retained source-finding records | 36: 35 confirmed, 1 rejected; repeated historical IDs remain packet-qualified |
| Suggested Lean | 207 lines; 6 real-bodied definitions, 9 admitted named theorems, 10 proved examples |

The three inherited curve/function-field extensions remain historical imports,
outside the number-field scope; this review adds no function-field programme.
All implementation statuses remain unchecked. “Complete” describes a completed
planning pass, and “planned” describes target coverage; neither means proved.

## Corrections made

1. **N.1 determinant.** Made finite S explicit in the statement, matching its
   retained hypothesis, and added the actual U.6 determinant and N.1
   transfer/norm inputs. The arbitrary-S localization presentations remain
   separate. `unit_fg_of_units` supplies finite generation, not a rank formula.
2. **N.2 general localization.** Restored the Dedekind-domain statement supplied
   by S.3, including the field case and the inverse ideal class in the degree-zero
   boundary. The arithmetic spectrum reindexing is its specialization.
3. **N.2 finite extensions.** Replaced a stale “ramification gap” hypothesis by
   finite S, its full inverse-image T and a finite-projective extension. The five
   already-planned ramified restriction targets give the e(q/p)-weighted residue
   pullback; transfer uses restriction of scalars.
4. **N.3 Steinberg finiteness.** Removed the obsolete claim that nonfree
   projective lattices and rank one lacked a supplier. The read R.1 contract
   includes these, its integral orientation character and finite-index descent.
5. **N.3 homotopy finite type.** Routed the connected H-space Serre theorem to
   H.3, matching `R-H3-finite-type`; H.6 retains the distinct homotopy-orbit and
   coefficient work. The theorem must allow nonzero fundamental group.
6. **N.5 Soulé finite-coefficient boundary.** Replaced the unowned coefficient
   construction by L.1/K.7 and explained reduction from safe higher prime powers
   (at least 9 at 3 and 16 at 2). The degree-one coefficient group is the Kummer
   group with its Pic[M] contribution, not just units modulo M. Finite-field
   odd coefficient quotients, Bott multiplication, the boundary projection
   formula and transfer give the stated proof route. The exact K.7 compatibility
   remains requested.
7. **N.5 odd torsion.** Removed the residual full-M.8 dependency. The early M.7
   torsion edge needs the coefficient-colimit compatibility explicitly added to
   `R-M7-edges` and `G-Coefficient`. A natural torsion identification does not
   choose a free summand.
8. **N.7 Bernoulli conventions.** Reused the two pinned Bernoulli sequences and
   retained only the light source-convention adapter. Separated von
   Staudt–Clausen from the stronger denominator statement for B_(2k)/k when
   p divides k; the latter is an explicit Kummer-congruence proof import.
9. **N.7 regularity.** Marked the verification bound as historical to the 2013
   source. The tower equivalence is quoted with a recorded Iwasawa proof boundary.
10. **N.7 regular-prime consequences.** Removed the V.5 backedge and supplied
    the transfer, Galois-weight and coefficient-module argument. Checked the
    generator degrees 0, 1, 5, 7 at l=5 and kept the mod-3 assertion at module
    level. The cyclotomic/Bott-action proof remains `G-RegularProofs`.
11. **N.7 Vandiver.** Wrote all eight conditional K-group rows, with global
    Vandiver as hypothesis and the corrected c_(2a+2) index in degree 8a+6.
    Added the B.8 higher special-value order formula and the reflection/cyclicity
    proof imports. Reused the L3 predicate and distinguished a conjecture at one
    prime from the global hypothesis.
12. **N.8 arithmetic K3.** Added the direct w-invariant dependency needed for
    w2(Q(i))=24. These arithmetic groups are supplied to V.5, whose
    decomposable/indecomposable analysis remains its own work.

13. **N.2 ramified construction.** Removed the stale assertion that the main
    suggested file declares the direct-sum construction. Its planned native API
    and six tests remain.
14. **N.8 Gaussian bound.** Removed the stale reference to a
    `gaussian_two_mul_norm_mod_le` declaration in the main suggested file.
    The rounding argument and stronger factor-two norm bound remain explicit
    proof obligations.

The reader's statements, hypotheses, proof plans, dependencies, requests and
gap descriptions were synchronized with these changes. The suggested Lean
examples now have proofs; the regularity examples that still need arithmetic
work are named theorem boundaries. No data definition has an admitted body.

## Source and baseline checks

All statements and findings are recorded in our own words. No source passage
or section-by-section source summary was added. Sources read are public author
copies or public published PDFs; their exact versions and URLs remain in the
packet and inherited packets. No uncleared copy of Washington was used.

For the new hermitian targets I read [CDH III, arXiv v4](https://arxiv.org/pdf/2009.07225v4),
Corollaries 2.3.16–2.3.19, pp.47–48, introduction Corollary 8, p.5, and the
comparison ranges 1.2.12 and 1.3.9, pp.18,31. The quadratic surjection through
2m−2 and symmetric injection from 2m−1 cover adjacent integer ranges. The
classical low quadratic degrees use the actual fibre sequence, not an
isomorphism only valid in higher degrees. The missing Witt signature and
finite-type homotopy-orbit exports remain precise requests.

For the Bott tables I read the [published FGV article](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf),
§§2.6–2.7, pp.240–247, including Proposition 2.9, Lemmas 2.10, 2.11, 2.14,
Corollary 2.12 and Remark 2.13. Checked negative degrees, the canonical
dualization eigenspaces, the degree-one valuation class, degree-zero reduction,
and the distinction between ordinary and Bott-inverted groups. The one-prime
Brauer calculation retains its local-global sum condition.

Inherited contracts were checked against their recorded K-book, Quillen,
Kahn, Sun, orientation-correct Steinberg, Serre, Rognes–Weibel, wild-kernel,
Bass–Tate and explicit-certificate locators. In particular:

- [The K-book author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
  V.6.6–6.8.2, pp.409–413, distinguishes integral and finite-coefficient
  localization; VI.2, pp.469–473, fixes twists and Bernoulli indices;
  VI.8–10, pp.513–533, fixes real/dyadic, regular-prime and Vandiver boundaries.
- The Serre argument was checked in *Homologie singulière des espaces fibrés*,
  III §1 Proposition 1, pp.465–466; IV §3 Proposition 3, p.479; V §§1–2,
  pp.489–491. The universal-cover and singular-complex arguments are why the
  requested theorem covers connected H-spaces with nontrivial π1.
- The author wild-kernel preprint was read visually at the relevant pages,
  especially Lemma 4.4, p.12, and the signature defect, p.20. The unrestricted
  prime-class/norm prescription is false for Q(i), modulus 4 and residue 3.
  This supports the recorded proof gap, not an allegation that the main theorem
  or the uncollated publication is false. The previously rejected signature
  allegation stays rejected: the source already uses the cokernel.
- The independent real-quadratic certificate was checked against Groenewegen,
  *Bounds for computing the tame kernel*, especially Lemmas 6, 7, 9, 12,
  Propositions 10, 13 and Theorems 14–15, pp.1447–1455, and the Bass–Tate
  filtration. Exact rational arithmetic independently verified all eleven
  residue certificates, their 173 relation rows, 23 recorded determinants,
  determinant gcds and generated residue groups. The norm-33 cutoff proof was
  checked separately; Birch–Tate is not the upper-bound argument.

The original Harris–Segal, Keune, Kummer and Herbrand–Ribet proof sources remain
unobtained proof boundaries where stated. Checking their reported statements
does not silently discharge them. Earlier packets retain their separate
baseline inventories; this review does not claim a fresh declaration-by-
declaration audit of every inherited inventory.

The main packet's five baseline declarations were read and their files
byte-compared to the exact pins, Mathlib `082e2d37` and Tau Ceti `f790474`:
`Set.integer` (SInteger, lines 65–70), `Module.End.eigenspace` (Basic,
lines 424–429), `bernoulli` (lines 195–196), `NumberField.classNumber`
(lines 64–65), and `Set.unit_fg_of_units` (Unit, lines 207–210). Their
hypotheses, codomains and conventions support the stated uses. No direct
baseline citation was removed. Read the reviewed library audit, the current
Tau Ceti library and all nine newer upstream roadmap suggestions, including
OperatorTheory's components; no new target duplicates their existing work.

## Source findings

Retained the confirmed FGV Corollary 2.12 proof-weight correction. Added and
confirmed four version-scoped findings:

| Finding | Read locator | Correction |
| --- | --- | --- |
| E-REV-CDH1 | arXiv v4, Corollary 1.2.12 proof, p.18 | Final injectivity inequality uses m, not n, on its right side |
| E-REV-FGV2 | Published Remark 2.13, p.246 | Finite-coefficient K0 is Z/q ⊕ Pic/q |
| E-REV-KBOOK1 | Author draft VI.10.1(6), p.527 | Degree 8k+6 uses c_(2k+2), as in the adjacent tables |
| E-REV-KBOOK2 | Author draft before VI.10.6, p.531 | Correct the parity/congruence for invariant twisted unit constituents |

The first, second and fourth affect proof text; the third affects a stated
order formula. The packet records a check or counterexample for each. Errata,
version histories and correction searches located no verified correction for
these four; the live K-book errata link returned 404. The CDH and K-book
findings do not assert anything about the uncollated printed editions.

All 36 retained finding records have this review's locator-specific verdict
and reason. Their historical IDs overlap, so they must not be deduplicated by
bare ID or re-reported as 36 distinct mistakes.

## Red-team and ownership checks

| Confirmed finding | Checked resolution |
| --- | --- |
| RT-AREA-ktheory-1/1 | R.1 owns building, orientation-correct integral Steinberg finiteness and projective/rank-one cases; N.3 assembles the rank filtration |
| /3 | M.7 supplies real-place/Suslin descent; real KO/BO remains the exact RT.4 request; dyadic and degree-zero exceptions are retained |
| /7 | R.3 computes ranks for orders; N.3:ranks owns the finite-S extension in degrees at least two |
| /9 | S.3/T.5/U.6/Z.6 supply the general and low-degree inputs; N.6 owns the certificate engine and N.8 its arithmetic instances |
| /10 | N.4 supplies W2 and N.3 supplies K2 finiteness to B.1; W2 is not the ordinary roots-of-unity group |
| /11 | The golden-field certificate supplies B.3; its upper bound does not depend on Birch–Tate |
| RT-AREA-ktheory-2/22 | N.5/N.8 supply V.5; residual V.5 and full-M.8 backedges in effective arithmetic contracts were removed |
| /42 | S.3 supplies the full general Dedekind sequence, which N.2 specializes |

The effective arithmetic graph has no internal target cycle. Unchanged outside
packets still contain the documented Chern-family cycle. `G-ChernBoundary` and
the handoff identify the maintainer's external moves; this review does not
claim global acyclicity of the unmodified atlas. The N.6 planet override must
also be applied when assembling: 36 selected planets, at most six per stage.

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory.json`:
  zero errors and zero warnings.
- Source-finding and source-version validators: no errors.
- Effective-target/reader check: all 136 in-scope statements, hypotheses, proof plans
  and dependency lists agree; all definition/construction APIs have at least
  three tests; inherited overrides and review ledger are complete.
- Exact arithmetic certificate recheck: all eleven certificates pass.
- `lean-check research/blueprint/suggested/ArithmeticKTheory.lean`: exit 0;
  exactly nine warnings, all named theorem declarations using `sorry`. No
  other warnings, no admitted data, and all ten examples proved.
- `git diff --check`: clean.

No unresolved contradiction remains in the corrected planning contracts.
The nine named gaps remain prerequisites to mathematical closure. The next
worker should package the effective contracts and route the explicit requests,
not rereview this pass or erase those gaps. External ownership changes and
assembly instructions are in `handoff/REV-ArithmeticKTheory.md`.
