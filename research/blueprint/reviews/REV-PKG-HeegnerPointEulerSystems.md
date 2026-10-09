# REV-PKG-HeegnerPointEulerSystems

Verdict: **accepted after corrections**. Reviewer: Codex (GPT-6), session
`codex-A9f0aT`. Date: 2026-10-09. Job: #7522. The package was written for #7490
by a different session; this reviewer did not write it.

## Scope and method

Read the complete package against the currently accepted
`HeegnerPointEulerSystems--HE.0.json` and
`HeegnerPointEulerSystems--HE.7s.json`, rather than the older aggregate reader.
Followed WORKERS.md, blueprint PROTOCOL.md, expansion PROTOCOL.md and
UPSTREAM_GUIDE.md. Used the upstream Multiquadratic and GlobalNumberFields
roadmaps as form and ownership comparisons. Consulted the reviewed AUDIT-25
Heegner entries and the relevant ClassFieldTheory, EllipticCurves,
NumberFieldArithmetic and Chebotarev link-map records.

Independently checked the previous package handoff's correspondence table
against both input inventories, the actual README sections, and Lean code with
comments removed. Checked every definition's API and labelled examples, every
direct prerequisite, and every target's source identifier. Compared the
mathematical statements individually; differences from the input wording are
notation changes, removal of programme terminology, or shared context, with the
RM context repaired as described below. The full correspondence table remains
in [the package handoff](../handoff/PKG-HeegnerPointEulerSystems.md#target-correspondence).

This is an independent package review, not a claim to have newly checked every
proof in every cited paper. Fresh primary-source checks concentrated on the
sensitive interfaces listed below. The accepted plans' source and supplier
limitations remain part of the specification.

## The six acceptance criteria

| Criterion | Finding |
| --- | --- |
| 1. Upstream form | Pass. Introduction, pinned conventions, library and ownership interfaces, ten ordered mathematical layers, target-level prerequisites and references follow upstream's mathematical form. The README is 190358 UTF-8 bytes, below 200000. Definitions include usable API and concrete regression examples. The source-acquisition layer does not become a mathematical layer. |
| 2. Fidelity | Pass after restoring the shared RM hypotheses. All 140 targets occur: 78 finite/exceptional targets and 62 anticyclotomic targets. All 15 definitions/constructions, 61 API items and 47 tests are present. All 586 direct prerequisite references and 162 target source references are retained. The seven promoted API targets reuse their actual API declarations. No additional arithmetic endpoint is asserted. |
| 3. Own words and sources | Pass. The roadmap is organized around mathematical constructions and dependencies, rather than a sequential digest of a paper. Statements are paraphrases with theorem/section/page locators and edition-specific references. No source passage or private source file was added. |
| 4. Timelessness | Pass after removing inherited process references from Lean comments. No job, review, checkpoint or coverage-status narrative remains in the package. “Toral packet” is the mathematical orbit terminology. |
| 5. Suggested Lean | Pass after correcting the residue-field/family shape of Zhang's congruence. All 140 target names resolve to actual declarations, all 61 API items have signatures, and the 47 labelled tests correspond to 47 admitted examples. Pinned `lean-check` succeeds with 234 `sorry` warnings, no errors and no other warnings. |
| 6. Metadata | Pass. TOML parses as exactly `topic = "math.NT"`, and the file contains that single line. |

All 172 explicit README anchors are unique; every internal link resolves.
The package uses both specified namespaces and individual Mathlib imports.
There are no private/local paths, duplicate imports or replacement Prop-valued
arithmetic definitions. The non-exhaustive prototype note and explicit omitted
arithmetic conditions satisfy PROTOCOL §13: successful elaboration checks the
suggested forms, not their eventual arithmetic realization.

## Corrections made in place

1. **Integral RM context.** Restored the totally real coefficient field,
   open compact level, central quotient `N_U*`, modular compactification in
   the split classical case, nonzero integral Hecke-linear quotient map,
   fixed integral cusp/Hodge normalization `m[P]−mδ`, and the actual trace
   from `K(x)` to `K`. The six HE.7 statements that refer to the common
   context now retain their accepted hypotheses. Nekovář §1.19, pp.14–15,
   and §3.1–Theorem 3.2, pp.18–19, support this context. Replaced the unexplained
   condition symbol by its no-CM meaning for the trivial character.
2. **Zhang's coefficient field and uniform scalar.** Changed
   `zhang_cohomological_congruence` from two elements of `ZMod p` to two
   families over a supplied field `k₀`. Its conclusion chooses one unit
   before quantifying over the family. This accommodates a nonprime residue
   field and the conductor-independent scalar of Zhang Theorem 4.3 and
   equations (4.9)–(4.11), pp.217–221. Geometry and compatible localization
   remain explicitly omitted arithmetic conditions, as in the accepted plan.
3. **Conductor notation.** Finished the change from Zhang's finite conductor
   sets `Λ, Λ′` to `𝒩, 𝒩′` in the reduction target, residual APIs and Lean
   mathematical comments. The Iwasawa algebra keeps `Λ`; the local toral
   order may also use its own scoped `Λ`. No coefficient modulus changed.
4. **Presentation.** Removed inherited blueprint identifiers and the two
   process references in Lean comments; placed the nonvanishing comment in
   its mathematical HE.8 layer. Shortened five promoted API headings to noun
   phrases without changing their anchors, statements or declarations.
   Repaired punctuation in the positive-library table and the article in
   the p=3 proof-obligation sentence.

## Library and ownership checks

Read all 23 distinct positive Mathlib declarations cited by the two inputs in
source at `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their relevant
hypotheses. They cover subring preimages, Picard functoriality and the class-group
comparison, affine nonsingular points, p-adic integers and their nonzero
ideal/valuation statements, dihedral operations, module length/rank, prime
factor lists, group-algebra basis elements, linear maps, homomorphisms, tensors,
extended naturals, compact products and closed finite intersections. In
particular, neither p-adic zero elements nor the zero ideal are silently covered
by the nonzero valuation/ideal theorems.

The audit distinguishes existing algebraic carriers from missing arithmetic
orders, CM models, class-field existence, Heegner cohomology and Iwasawa descent.
The package respects that distinction. GN11 owns order/Picard theory; CFT12/13
own existence and reciprocity, with CFT-L62/L103 distinguishing quadratic-over-ℚ
wrappers from relative CM existence. NFA supplies the actual place-dependent
Frobenius/conjugation operations. EllipticCurves supplies Tate modules, reduction,
Kummer sequences, finite generation and Selmer–Sha exact sequences. Chebotarev
CH-L13 supplies prime selection only after the arithmetic detection fields and
classes have been verified. ES owns generic derivative, correction, rigidity and
error-tolerant descent. The package verifies their Heegner applications rather
than building a second general theory.

Tau Ceti's stated baseline remains
`f790474821cf4256814db967cb154e7af3d0c369`. The suggested file imports no Tau Ceti
module; the successful build checks the exact pinned Mathlib, and makes no claim
about compiling new Tau Ceti arithmetic implementations.

## Primary-source checks and retained mathematical limits

- **Howard §2.3, pp.28–30, Lemmas 2.3.2–2.3.4.** Checked the initial factor,
  first-step group, norm recurrences, simultaneous compact lifting, differentiated
  Kummer classes and local conditions. The package retains finite simultaneous
  solvability with bottom and auxiliary constraints, its chosen-family ambiguity,
  and the class-number conductor shift in the weaker CGLS branch.
- **Nekovář §1.19 and §3.1–3.2, pp.14–15,18–19.** Checked the integral divisor
  map and RM context. Non-torsion trace is a descent input, rather than a
  consequence of an unstated analytic rank assumption; no-CM over the relevant
  field is not replaced by geometric non-CM.
- **Zhang Notations (xii)–(xv), pp.202–203, and §4, pp.217–221.** Read the
  maintainer-cleared article in place. Checked the two prime sets, all three
  clauses of Hypothesis ♥, the residue field and the fixed-scalar congruence.
  No file or passage from that copy was saved or added.
- **BCGS Theorem 1.3.1, p.15, and §2.2, pp.17–19.** Checked that one common
  multiplying power works for the family and that the resulting error is
  independent of it. The exact paired-length proof uses Lemma 2.2.4 at p>3;
  the unresolved p=3 extension is not presented as proved.
- **CGLS Theorems 4.1.1–4.1.2, Remark 4.1.3 and Proposition 4.2.1,
  pp.27–29.** Checked weaker torsion, class-number retention, normalization and
  rational localization. The bound after inverting p and augmentation is not
  promoted to an integral equality.
- **Castella–Sano §3.1–3.4, pp.13–17.** Checked the Heegner specialization
  factors, all-p strict ordinary complex, determinant/characteristic comparison,
  propagated twisted quotient and specialization defect. Its `X_BK` for a
  general twist is not automatically the Bloch–Kato quotient. The inert-prime
  main-conjecture hypothesis is retained.
- **BCK Theorem 5.2, published pp.1646–1647 (PDF pp.20–21).** Checked the
  integral comparison and its standing prime restrictions. CGLS's rational
  odd-prime statement does not remove the p>3 restriction from this integral
  route.
- **BCS v2 Theorems 1.2.2/1.2.4, p.3; Theorem 4.2.1, pp.8–9;
  Proposition 5.2.1 and §5, pp.9–11.** Checked rational irreducibility versus
  integral surjectivity, auxiliary-field restrictions and the early base-change
  supplier chain. The anticyclotomic equality does not depend on a cyclotomic
  return whose proof already uses it.
- **CGS Theorem C and Greenberg reformulation, pp.3–4.** Checked the independent
  Eisenstein local-character branch. No analytic-rank-one condition is added;
  the equality is imported from BSD.7a before the late BCGS applications.
- **Cornut–Vatsal §1.1, Theorems 1.4–1.5, pp.3–7.** Checked torsion-character
  compatibility and the existence conclusion in each permitted sufficiently
  large stratum. The package does not assert nonvanishing of every character.

The global χ change-of-group/localization square, original classical square-index
proof input, general-`F_P` S-arithmetic dynamics, exact integral regulator/lattice
and Selmer-complex interfaces, and early Eisenstein arithmetic suppliers remain
explicit requirements. A local automorphism is not applied to global cocycles
without that supplier; real Ratner theory is not substituted for the required
p-adic theorem. Nonzero carrier values, rational ideal equalities and determinant
rationalizations do not certify integral units or bases. The inputs' 31 gap
records and 93 requests were not marked closed by this package review.

## Reproducibility

Validation on 2026-10-09:

- Both accepted inputs pass `python3 scripts/check_blueprint.py` with zero
  errors and zero warnings.
- The inventory, statement comparison, prerequisite/source references, API and
  examples checks above pass; metadata parses and internal anchors resolve.
- `lean-check research/blueprint/packages/HeegnerPointEulerSystems/Suggested.lean`
  exits 0: 234 warnings, all declaration uses `sorry`; no errors or other warnings.
  Available memory exceeded 20 GB. No language server, library build, update or
  cache download was used.
- `git diff --check` passes. Only the named package deliverables, this report and
  the job's handoff change. Scratch source texts and logs are not deliverables.

The following hashes identify the public PDFs used for the targeted source
checks. URLs are the editions linked in the package references; downloaded
2026-10-09. These receipts do not claim that every page or proof was re-reviewed.

| Package source | PDF SHA-256 |
| --- | --- |
| [howard](https://arxiv.org/pdf/1202.6340v1) | `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a` |
| [bcgs](https://arxiv.org/pdf/2312.09301v2) | `e575367ab8dd9ffdb1850959dde93f205c4007b0e56af4ed30e120079660aee3` |
| [cs](https://web.math.ucsb.edu/~castella/Kurihara.pdf) | `9478dc414299a3821fe4192ef138bb1da96a30b95f8b01beae54895340f903c9` |
| [cgls](https://web.math.ucsb.edu/~castella/Eisenstein.pdf) | `2bd32832411151a628136b245eada847f2f1b2e04872391bbe630e8e1a54819b` |
| [cv](https://personal.math.ubc.ca/~vatsal/research/part1.pdf) | `bdf258c742a88ce4328dcf3ef1df0dfe1235f1640c06bd66eeaaef2c1c6625e1` |
| [nekovar](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf) | `05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a` |
| [bcs](https://arxiv.org/pdf/2405.00270v2) | `bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3` |
| [bck](https://web.math.ucsb.edu/~castella/PRconj-print.pdf) | `6380182b4211ad71e8c9a8b8557132902c673ccd69e7a28192ffde9343b44fdd` |
| [cgs](https://web.math.ucsb.edu/~castella/Mazur.pdf) | `4ca65e104b68ce441b2d62ba39af96bc4058fab26947919d5a8d4a6eb929382e` |
