# Handoff: PKG-HabiroCyclotomicCompletions

Issue #7475. Worker: Codex, session `codex-kZQhqP`.
The bot confirmed the claim in comment 6070596170. This submission completes
the package job; it is not a checkpoint. No second job was claimed.

## Deliverables and scope

The package contains `README.md`, `Suggested.lean`, and one-line
`metadata.toml` with `topic = "math.NT"`. This note is the fourth deliverable.
No packet, assembled reader, atlas data, source document, or other job's file
was changed.

The README is approximately 97 KB and presents the mathematics in upstream
roadmap form: purpose, ownership boundaries, conventions, library inputs,
ordered layers, precise theorem hypotheses, usable definition APIs,
examples, prerequisites, and versioned source locators. It is independently
written mathematical prose. None of the assembled reader's legacy source
excerpts is included. No book or source PDF is included. The programme's
process information belongs to this handoff only.

The coverage reconciliation is 48 parent targets plus 59 HC.4 targets, with
HC.6 importing three parent targets and adding no new targets. Each of the
107 distinct targets was assigned to a substantive README subsection.

| Material | Placement in the package README |
| --- | --- |
| HC.1: all 10 completion, topology, cofinality and functoriality targets | The four HC.1 subsections |
| HC.2: all 4 expansion, arithmetic and unit targets | The three HC.2 subsections |
| HC.3: all 6 evaluation, Taylor, naturality and translation targets | The three HC.3 subsections |
| Classical HC.4: 15 parent targets and the 2 finite-domain transfer lemmas | The first four HC.4 subsections |
| HC.4 comparison: 51 definitions, constructions, lemmas and comparisons | The final four HC.4 subsections |
| HC.4 comparison: 6 example targets | HC.6, “Matrix recovery and projector digits” |
| HC.5: all 10 module, component, localization and derived-boundary targets | The five HC.5 subsections |
| HC.6: all 3 inherited export and example targets, including the 39 finite acceptance signatures | Opening consumer table, HC.6 examples, and its implementation/acceptance contract |

The six matrix example targets are the Kontsevich matrix calculation,
its perturbed jet vector, the odd-order projector and its digits, and the
companion projector and its digits. Placing them in HC.6 resolves their
mathematical presentation order: localized integrality of the projectors
requires HC.5's component theorem. No dependency or target was removed.

Two upstream READMEs were read in full for form and density:
`content/tau-ceti/ArithmeticDirichletSeries/README.md` and
`content/tau-ceti/Completed/IntegralLattices/README.md`. AdicSpaces and
ClassFieldTheory were also consulted. WORKERS.md, both protocols, the upstream
guide, the library audit, the three accepted inputs, and the assembly
handoff informed the package.

## Suggested Lean file

The assembled file is retained with one standard header, one import block,
the existing `TauCeti.Habiro` carriers, and its `HC4` subnamespace. All 147
original examples remain. The package adds a real integer-list factorial
digit definition, its polynomial correctness theorem, and one example;
there are now 148 examples and 41 individual Mathlib imports.

`factorialDigitList` is the new iteration consuming the existing Tau Ceti
synthetic-division interface. Its correctness equation spells the descending
Horner fold directly, which equals existing
`TauCeti.Polynomial.ofCoeffList`. There is no privately redeclared
`ofCoeffList` or synthetic-division API. The polynomial residual uses the
negative monic quotient, since the divisor is `X^(n+1)-1` while the factorial
ratio is `1-X^(n+1)`.

The `cycloModuleCompletion.equivPiOfChain` signature now explicitly requires
`(g 0 : R[X]) = 1`, as the accepted module statement does. The assembled
signature omitted that initial-index parameter. The packet itself was not
edited. This restores the stated coordinate construction rather than changing
the mathematical target.

Tau Ceti's existing complete separated ring and coefficient-list interfaces
were read at the stated source baseline. Their built module artifacts are
absent from the available shared build. In accordance with the prohibition
on building Tau Ceti, the file imports only Mathlib. Completeness is stated
with the genuine additive-group uniformity and Hausdorffness, and the list
correctness equation uses the explicit fold. These forms do not introduce
private substitutes for the existing Tau Ceti structures. The README points
implementation to the actual Tau Ceti APIs.

The derived comparison retains the inherited honest omission of a typed
derived declaration: HabiroRings:HR.2 supplies that carrier, which has no
importable Lean interface in this file. It is specified completely at the
supplier boundary in the README and the file's explanatory comment. No
uninterpreted `Prop` field or `def ... : Prop := sorry` was added to fake a
derived construction. This follows PROTOCOL.md section 13's rule for
conditions that cannot yet be stated against an imported interface.

## Validation receipts

- Final command:
  `lean-check research/blueprint/packages/HabiroCyclotomicCompletions/Suggested.lean`.
  Exit **0**, **383** diagnostics, all `warning: declaration uses sorry`;
  no errors or other warnings. The shared build's Mathlib is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. No Tau Ceti imports affect
  elaboration. Available memory was approximately 111 GB before checking;
  only one Lean check was running in this worker, through the permitted
  wrapper. No Lake build, update, cache retrieval, language server, or new
  Lean project was used.
- `python3 scripts/check_blueprint.py` on each unchanged input:
  `HabiroCyclotomicCompletions.json`,
  `HabiroCyclotomicCompletions--HC.4.json`, and
  `HabiroCyclotomicCompletions--HC.6.json`: **0 errors, 0 warnings** each.
- A target-placement audit covered **107/107** targets. The suggested file
  retains every target label and every API/test terminal name from the
  inputs, accounting for surrounding namespaces. This is a specification
  audit, not evidence of formalized proofs.
- Independent exact polynomial and rational matrix computations checked
  dimensions and determinants for precisions 1–6, the strict `n<N`
  determinant product, weight triangularity, both signed-adjugate
  identities, the explicit precision-three matrix, the precision-five
  Kontsevich and perturbed vectors, and both projector digit lists.
  Determinants were `1, 1, 4, 216, 1327104, 99532800000`.
- Independent finite calculations checked the simultaneous-remainder
  determinant sequence for orders 1–8; F's root values at orders 1–6;
  its first ten coefficients at one, first seven at minus one and first
  three at a primitive cube root, including truncation stability;
  q-inversion at precisions 1–7; the four normalized F-squared digits;
  and the localized, rational and characteristic-two CRT representatives.
  All passed. These calculations exercise mathematical consequences of
  the specified maps rather than implementing placeholder Lean proofs.
- The package is under the README size limit; its metadata is exactly the
  required one line. Content checks found no private paths, process
  vocabulary, or source excerpts in the package. The local intake file check
  reported **4 files, 0 problems**. The staged whitespace check passed.

The arithmetic script and its transient Python dependency live only in
worker scratch and are removed after submission. To reproduce the main
matrix check, form the integer columns `q^k P_(n-1)`, `1<=n<N, k<n`, and
the ordered rows `(m,l,j)` with `ml<N, j<phi(m)`. Extract row entries as
the coefficient of `q^j` in the remainder of
`(-q)^(l-1) * hasseDeriv (l-1) (q^k P_(n-1))` modulo `Phi_m`.
Order rows by weight, decreasing m, then j. Compute determinants, adjugates
and rational inverses. The equations and expected values needed to check
the other calculations are all in the README.

## Inherited boundaries and source corrections

These remain important for the independent package reviewer and for any
later job authorized to edit the input packets:

1. The parent's non-Noetherian Theorem 5.2 transfer gap is mathematically
   resolved by the two accepted HC.4 finite-domain lemmas. The README uses
   both before Taylor rigidity, without adding a Noetherian hypothesis.
   The parent packet still needs those prerequisites and its stale gap
   reconciled by its owner.
2. Individual-root evaluation uniqueness is restricted to cyclotomic
   irreducibility over the fraction field. No general form of printed
   Theorem 6.2 over coefficient rings with split cyclotomic polynomials is
   claimed. Nor is Conjecture 6.1 on arbitrary infinite sets proved.
3. Connectedness stays in the domain theorem. Failure of adjacency is not
   confused with comaximality over arbitrary rings. Root translation uses
   actual p-power root ratios and convergent `eval₂Hom`, not a substitution
   with an unjustified non-nilpotent constant.
4. The universal Taylor coefficient algebra is `R[q]/Phi_m`, even when a
   chosen root is already in R. Torsion-freeness is retained for integral
   injectivity and image criteria. Precision N is modulo `P_(N-1)`, so
   the determinant product ends at `n<N`, correcting the indexing of
   GSWZ v2 (313). No infinite base-change identity is assumed.
5. The polynomial coefficient-module completion is exact. Derived behavior
   of arbitrary q-modules remains HabiroRings:HR.2. The arithmetic rational
   number-field comparison remains HabiroNumberFields:HB.6. The full
   elementary q-toolkit remains QSeriesPartitionsAndMockModularForms:QM.0.
6. The parent's partial HC.4/HC.6 coverage and older RS-10 wording are stale,
   as the assembly handoff already records. The package does not repeat
   those process claims. The proposed atlas split of the large HC.4 layer
   and changes to consumer stage citations remain outside this job's files.

Habiro's published PDF, its 2002 preprint, GSWZ v2 and Wagner v5 were
available and read at the cited sections. The maintainer library index was
also consulted; no restricted book was needed. Apostol's exact resultant
locators are retained from the accepted plan. Its publisher endpoint returned
HTTP 403 in this run, so this worker does not claim a fresh reading of that
article. The resultant-dependent finite determinant calculations were
checked independently; the package does not expand the accepted resultant
theorem's scope.

There is no remaining package-writing work or checkpoint continuation.
The next step is independent review of this package, with any input-packet
reconciliation performed only by a job owning those paths.
