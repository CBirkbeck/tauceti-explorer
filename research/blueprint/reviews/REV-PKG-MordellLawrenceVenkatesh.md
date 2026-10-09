# REV-PKG-MordellLawrenceVenkatesh — completed independent review

Verdict: **needs_changes**. Issue #7525; Codex (GPT-6), session
`codex-oL0Zr0`; 2026-10-09. This session did none of the package job #7493.

The mathematical README is a faithful, usable specification after the small
corrections below. The suggested file elaborates, but omits executable
signatures for most of that specification. Compilation of the remaining
signatures does not meet this issue's item 5 and PROTOCOL §§13,20. This is a
finished package review, not an unfinished review or a checkpoint.

## Six required checks

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass after corrections | Mathematical introduction, scope, conventions, reusable library interfaces, twelve ordered layers, target statements, APIs, examples, dependencies, supplier contracts and bibliography. README has 197848 UTF-8 bytes, below 200,000. |
| 2. Fidelity to accepted plan | Pass after corrections | All 146 descriptive target labels, 261 API contracts, 100 tests, 39 milestones and each target's source locators retained. All 396 internal and 319 external prerequisite occurrences match after resolving the short labels. All 76 contracts remain under their 52 owning layers. |
| 3. Own words and citations | Pass | Mathematical restatements organized by reusable objects and dependencies, rather than a section-by-section source summary. Every target retains the accepted theorem/section/page locators, and all ten bibliography anchors and source URLs resolve within the document. No source passage or PDF was added. |
| 4. No process in reader | Pass | README has no job identifiers, packet filenames, review narrative, checkpoint narrative or coverage statuses. Its mathematical supplier requirements are stated intrinsically. |
| 5. Suggested Lean file | **Fail: signature coverage and strength** | Independent `lean-check` exited 0 with 136 warnings, all declaration-uses-`sorry`; zero errors or other warnings. There are 120 active named declarations and 32 active examples. Only 68 of 261 required API names have active declarations, and only 27 of 100 required tests have corresponding labelled examples. Several present declarations are partial adapters, as detailed below. |
| 6. Metadata | Pass | File is exactly the fitting single line `topic = "math.NT"`, followed by a newline. |

The upstream models read were HodgeStructures and
RepresentationTheory/SemisimpleAlgebras in `content/tau-ceti/`, plus the
ClassFieldTheory introduction/interface style. Their distinction between
mathematical specification and suggested code is useful, but does not waive
this job's explicit requirement for the plan's signatures, APIs and examples.

## Scope of the correspondence and source audit

The input is `packets/MordellLawrenceVenkatesh.json`, accepted on 2026-10-06 by
`independent-review-REV-DESIGN-LV~2`. I read the complete package README and
Suggested.lean, the accepted target statements, API/test lists, hypotheses,
source locators, prerequisite lists, supplier contracts and signature audit.
The target-level acceptance remains unchanged. This review checks the final
package against that specification; it does not certify proof implementation
or reopen the accepted plan's source extraction.

| Layer | Accepted targets | Reader targets |
| --- | ---: | ---: |
| LV.0 | 21 | 21 |
| LV.1 | 17 | 17 |
| LV.2 | 11 | 11 |
| LV.3 | 19 | 19 |
| LV.4 | 5 | 5 |
| LV.5 | 16 | 16 |
| LV.6 | 10 | 10 |
| LV.7 | 8 | 8 |
| LV.8 | 11 | 11 |
| LV.9 | 12 | 12 |
| LV.10 | 10 | 10 |
| LV.11 | 6 | 6 |

The total is 146: 22 definitions, 11 constructions, 82 lemmas, 30 theorems and
one comparison. Seventy input statement paragraphs were reproduced without
mathematical alteration; the remaining 76 were compressed or rephrased. I
checked those against the accepted hypotheses, including the shared P, Q and
C settings. The final edits below are clarifications of this compression.
API and test wording remains unchanged. Short prerequisite numbers were
resolved by descriptive target label, not by input array position: the reader
puts some targets in a different order within a layer.

The supplier audit preserves the existing/Part II boundaries. In particular,
normalization is only a carrier until the finite/smooth comparisons are
supplied; Mackey decomposition is algebraic until the continuous finite-index
adapter is supplied; coordinate symplectic groups require arbitrary-form
comparisons; topology requires genuine surface data before classification;
branched transfer extends the unbranched theorem; and finite étale
Grassmannians impose ranks on every component. The S-unit and rational-point
statements retain their shared owners and independent proof routes. No
standalone link map for this new roadmap was present in the input directories;
its accepted prerequisite and supplier contracts are the comparison baseline.
No generic supplier result was reassigned or assumed as a theorem field.

I located all 95 baseline declarations in their stated modules at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and read their statement headers.
For the delicate comparisons I also inspected the carrier/condition definitions:
Grassmannian finite-projective quotients and stalk ranks, CM quadratic
extensions of the maximal real subfield, covering/local-system representations,
fundamental-group multiplication, linear transvections, normalization,
Mackey decomposition, and the coordinate symplectic connectedness theorem.
The reviewed library-coverage catalogue was consulted. This does not claim
re-proving those library declarations or elaborating the unused Tau Ceti imports.

The fresh public-source checks concerned the altered or easily misread
statements, not all ten source proofs anew. The Lawrence–Venkatesh v3 PDF
matched the input SHA-256
`e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`
(accessed 2026-10-09). In §2.4, pp.11–12, the largest real and CM subfields
supply a relative quadratic extension, not an absolute degree bound. In
§4.1, pp.20–21, the roots-of-unity and nonsquare reductions specify the Kummer
hypotheses; the subsequent Legendre argument uses the cyclic field factor.
Milne, *Complex Multiplication*, Chapter I, Proposition 1.4, Corollary 1.5
and Remarks 1.6–1.7, pp.10–11, supports the same CM convention; I checked
the author's public PDF. The accepted reader's other theorem/section/page
citations were checked for fidelity, without claiming a fresh full audit of
all their underlying books. No restricted source was used.

## Corrections made in place

- **LV.1.6:** replaced the ambiguous claim that the two fields have degree at
  most two by `[E_K:E_K⁺] ≤ 2`. A CM field can have arbitrarily large absolute
  degree; its maximal totally real subfield has relative index two.
- **LV.3.8:** made the A-point quotient condition explicitly locally free of
  componentwise rank d over `E⊗_k A`. This spells out the convention already
  required by the accepted API and the component-rank counterexample.
- **LV.4.1–4.2:** wrote the scalar extension in the de Rham cohomology notation
  and explicitly specified rational y in the disk, closed y′ above it, and
  w above v before the transported factor statement.
- **LV.6.2:** replaced the reference to a nonexistent part (b) of the compressed
  reductions by `μ₈⊆K`, m the largest power of two dividing `|μ(K)|`, and S
  containing the places above 2, with U₁ explicitly linked to LV.6.1.
- Removed unmatched heading parentheses and dangling locator fragments from
  ten target titles; corrected capitalization after the common-setting
  prefixes and doubled bibliography punctuation.

No executable Lean, metadata or accepted input was changed. The Lean check
therefore applies to the final suggested file without a redundant rerun.

## Required Lean revision

The comment catalogue at Suggested.lean:769–984 explicitly acknowledges
omitted interfaces. It is honest documentation, but it is not executable Lean.
After removing nested block comments and line comments, independently
inventorying namespace-qualified declarations and locating the labelled
examples, I reproduced the input's 120-declaration/27-labelled-example audit.
The 32 total examples include five additional checks; those do not replace the
73 missing named tests. The 120 declarations also include helper definitions
and lemmas, so that number is not the number of covered plan API items.

Only nine of the 33 definition/construction targets have any active API
signatures. The other 24 have none. Of the 30 theorem targets, only
`traceDeterminesSemisimple` is active; the other 29 and the one crystalline
comparison are omitted. In particular the S-unit theorem (LV.6.10), the
period-image density theorem (LV.3.17), point-pushing density (LV.10.9),
Kodaira–Parshin full monodromy (LV.10.10) and rational-point finiteness
(LV.11.6) are only mathematical prose/comments. The named-theorem catalogue
also lists the omitted supporting lemmas layer by layer. An identifier inside
that catalogue does not count as a Lean declaration.

The following exhaustive table of API-bearing targets gives active-name
counts. An active name does **not** certify the full intended statement.
The tests column counts required names attached to active examples.

| Target | API names active / required | Tests labelled / required |
| --- | ---: | ---: |
| `LV.0/semilinear-centralizer` | 7 / 8 | 3 / 3 |
| `LV.0/affine-group` | 13 / 13 | 3 / 3 |
| `LV.0/symplectic-transvection` | 10 / 10 | 3 / 3 |
| `LV.1/largest-cm-subfield` | 7 / 9 | 3 / 3 |
| `LV.1/friendly-place` | 0 / 7 | 0 / 3 |
| `LV.1/filtration-weight` | 8 / 8 | 3 / 3 |
| `LV.2/abelian-by-finite-family` | 0 / 8 | 0 / 3 |
| `LV.2/good-model` | 0 / 6 | 0 / 3 |
| `LV.2/de-rham-bundle` | 0 / 9 | 0 / 3 |
| `LV.2/residue-disk` | 0 / 8 | 0 / 3 |
| `LV.2/gauss-manin-transport-padic` | 0 / 9 | 0 / 3 |
| `LV.2/gauss-manin-transport-complex` | 0 / 7 | 0 / 3 |
| `LV.2/crystalline-frobenius-on-fibres` | 0 / 7 | 0 / 3 |
| `LV.3/lagrangian-grassmannian` | 0 / 9 | 0 / 3 |
| `LV.3/lagrangian-period-variety` | 0 / 10 | 0 / 3 |
| `LV.3/algebraic-monodromy-group` | 0 / 8 | 0 / 4 |
| `LV.3/padic-period-map` | 0 / 6 | 0 / 3 |
| `LV.3/complex-period-map` | 0 / 8 | 0 / 3 |
| `LV.5/surface` | 0 / 4 | 0 / 3 |
| `LV.5/mapping-class-group` | 0 / 7 | 0 / 3 |
| `LV.5/dehn-twist` | 0 / 7 | 0 / 3 |
| `LV.5/point-push` | 0 / 6 | 0 / 3 |
| `LV.5/surface-homology` | 0 / 5 | 0 / 0 |
| `LV.5/simple-closed-curve` | 0 / 6 | 0 / 3 |
| `LV.6/legendre-family` | 4 / 8 | 3 / 3 |
| `LV.7/size-v` | 5 / 7 | 3 / 3 |
| `LV.8/singly-ramified-surjections` | 7 / 7 | 3 / 3 |
| `LV.8/hurwitz-cover-complex` | 0 / 7 | 0 / 3 |
| `LV.8/reduced-prym` | 0 / 7 | 0 / 3 |
| `LV.8/kodaira-parshin-family` | 0 / 7 | 0 / 3 |
| `LV.9/affine-cover` | 0 / 9 | 0 / 3 |
| `LV.9/primitive-homology` | 7 / 8 | 3 / 3 |
| `LV.9/lifted-monodromy` | 0 / 9 | 0 / 3 |
| `LV.9/liftable-curve` | 0 / 7 | 0 / 3 |

Present but narrower comparisons also need attention:

- **Semilinear centralizer:** a specified F fixed pointwise by σ is sufficient
  for the algebra core, but the fixed-field descent comparison is absent.
  `units_semilinearCentralizer` constructs an automorphism from a unit; it
  does not identify the entire commuting automorphism group and its action.
  `semilinearCentralizer_scalar` has no declaration. The linear comparison
  uses an explicit commuting subalgebra instead of the named centralizer
  comparison. See Suggested.lean:148–181 and its catalogue.
- **Affine group:** `linearPart` has no surjectivity assertion;
  `ker_linearPart` is a pointwise membership formula, not the translation
  subgroup identification/normality; `stabilizer_zero` gives evaluation at
  zero, not the stabilizer group equivalence, index or coset-action comparison;
  `commutator_eq` computes a commutator, not equality of the derived subgroup
  with translations for q≥3. The affine-equivalence adapter also lacks the
  required compatibility conclusions. The added semidirect product and sharp
  two-transitivity signatures are useful, but do not supply these results.
- **Transvections:** the core is a Mathlib linear equivalence preserving the
  form. Connect it to the existing Tau Ceti isometry group. The
  codimension-one statement already assumes a chosen nonzero v describing
  the fixed hyperplane; the intended general unipotent statement must obtain
  that data. `symplecticTransvection_sl2` is a rational-plane computation,
  rather than the general two-dimensional field comparison.
- **CM fields:** the concrete Subfield carrier needs its absolute-closure,
  IntermediateField and H-orbit comparisons. The active CM criterion only
  treats the inequality from the real subfield; the full existence-of-CM-
  subfield equivalence and the cyclotomic/embedding interfaces must match
  the reader's API.
- **Legendre:** the Weierstrass equation and its invariants are active, but
  `legendreVariant`, its good-model, fibre-algebra and analytic-family
  comparisons are absent. The quadratic AdjoinRoot example supplies a split
  algebra calculation, not an identification with the family carrier.
- **Short-orbit size:** the permutation core has the correct strict cutoff,
  but the continuous unramified Galois-set, Frobenius-choice, scheme and
  local-place comparisons (`sizeV_scheme`, `sizeV_eq_places`) are absent.
- **Surjections:** the algebraic carrier omits continuity in the profinite
  case, and that adapter is needed by the Hurwitz construction.
- **Primitive homology:** the kernel and projection-formula linear algebra
  are active, but actual surface-cover pushforward/branched transfer,
  intersection and genus comparisons are absent. `primitiveHomology.baseChange`
  has no declaration. The rank-six example assumes vector-space dimensions
  rather than constructing the genus-two affine cover and its homology.

The input already records these partial/omitted signatures and 79 ordinary
mathematical gaps. Its acceptance is a completed target-level plan, not
closure and not permission to omit the package's required Lean interfaces.
The package job did not introduce the gaps, and this review does not remove
or redefine their supplier ownership. Completing them is substantial work;
there is no clear local correction that safely turns the absent geometric,
arithmetic and analytic conditions into typed declarations at this baseline.
In particular, bare proposition placeholders, arbitrary carrier types,
axioms and theorem conclusions stored as carrier fields would not fix this.

For revision, supply the owner's real interfaces and comparisons, state the
remaining API and named theorem contracts against them, add the 73 matching
examples, strengthen the partial adapters above, then rerun the complete
`lean-check`. Keep the full README specification and its source corrections.
If the programme intends to accept a mathematical package with recorded
signature omissions, that requires an explicit adjustment of this issue's
item 5 and PROTOCOL §§13,20; this review does not make that adjustment.

## Validation and disposition

- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkatesh.json`:
  0 errors, 0 warnings.
- `lean-check research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`:
  exit 0, 136 `sorry` warnings, no errors or other warnings; checked with
  the existing shared build at the pinned Mathlib. No Tau Ceti modules are
  imported by this file, so their elaboration was not exercised.
- Structural audits after the corrections: all 146 targets, 261 unchanged
  API contracts, 100 unchanged tests, exact source locators, 715 prerequisite
  occurrences, 39 milestones, ten bibliography entries and 52 supplier
  headings retained. The active Lean-name inventory matches the accepted
  signature audit, independently obtained rather than counting comments.
- Submission path/JSON/private-path checks and `git diff --check` pass.

The package review JSON records `needs_changes`. The next work is a package
revision addressing the above interface coverage; there is no remaining
review step for this session and no second job was claimed.
