# PKG-MordellLawrenceVenkatesh~2 — blocked checkpoint

Issue [#7911](https://github.com/CBirkbeck/tauceti-explorer/issues/7911).
Codex, session `codex-pniUxk`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7911#issuecomment-6091815939).
Branch: `codex-pniUxk-7911-mordell-package`. Only this job was claimed.
None of the manager's priority issues was available at selection time; this
was an eligible focus package after excluding the post-upstream follow-up jobs.

This is **partial**, with a demonstrated supplier-interface blocker. It is not
a completed package or a time-limit checkpoint. The accepted mathematical
README and the independent `needs_changes` review remain byte-for-byte
unchanged. No packet, reader input, supplier or review record is edited.
Metadata retains its original fitting category. The PR is a draft because
the automatic submission check prohibits deleting any deliverable, while
the intake's package completeness detector only checks that all four files
exist. This combination cannot represent an unfinished package revision with
an on-disk handoff. Keeping the PR as a draft prevents automatic intake from
misclassifying the checkpoint as complete; the maintainer must arrange an
honest checkpoint intake before releasing this job for continuation.

## Repairs available to the next worker

The changes are in [Suggested.lean](../packages/MordellLawrenceVenkatesh/Suggested.lean).
They are checked statement forms with admitted bodies, not formalized proofs.

- **Affine group:** `linearPart_surjective`; a translation homomorphism and
  subgroup, its equality to the kernel, normality and multiplicative
  equivalence with the additive field; a genuine zero-stabilizer subgroup,
  units equivalence, index and quotient-coset evaluation/action; equality of
  the derived subgroup with translations for primes at least three; and
  evaluation/linear-part comparisons with native affine equivalences.
  Additional examples retain the necessary lower bound at two and the
  index/size of the stabilizer at three. These supply the stronger components
  missing from the old pointwise formulas.
- **Centralizer:** `semilinearCentralizerFixed` is a subalgebra over the entire
  native `FixedBy.subfield`. The existing more general constructor still
  permits restriction to any pointwise fixed coefficient field.
  `units_semilinearCentralizer` now returns a multiplicative equivalence with
  the subgroup of commuting linear automorphisms, with both evaluation
  directions. Its subspace action and finite-filtration transport preserve
  semilinear stability. The linear specialization equals native
  `Subalgebra.centralizer`; conjugation allows different vector spaces.
  `scalarTensorSemilinear` acts on the actual tensor product, with a pure-tensor
  formula. `semilinearCentralizer_scalar` characterizes commuting endomorphisms
  as scalar extensions of descended endomorphisms, assuming finite dimension
  and that the coefficient field is exactly the fixed field.
- **Transvections:** the constructor now takes values in native
  `TauCeti.BilinForm.isometryGroup`, with explicit underlying-equivalence
  projections where needed. The main codimension-one theorem starts with an
  arbitrary unipotent isometry and obtains both a nonzero center and nonzero
  parameter; it no longer assumes a normal vector describing the hyperplane.
  The older useful normal-vector lemma has a separate name. Both elementary
  plane transvections are stated over an arbitrary field and compared, via a
  multiplicative equivalence, with native `Matrix.SpecialLinearGroup`.
  The lower elementary matrix has parameter minus the transvection parameter,
  consistently with the pairing order in the source.
- **CM fields:** added the intermediate-field/subfield comparison, the strict
  inequality from the maximal real subfield criterion, the inclusion of the
  real subfield, and the nontrivial cyclotomic-extension specialization.
  The absolute-closure H-orbit comparison and full relative real-field tower
  are still missing; the comment catalogue says so explicitly.
- **Continuous surjections:** a companion carrier uses native
  `ContinuousMonoidHom`, with injective forgetting and a discrete-source
  equivalence. Both peripheral actions have evaluation and forgetting
  comparisons, identity/product laws and commutation. The quotient has trivial
  source action and the center-free stabilizer uses the same inverse convention
  as the algebraic version. Continuous comap is an equivalence along a
  compact-to-Hausdorff continuous group surjection, with the explicit
  common-kernel factorization hypothesis. Its evaluation identifies precomposition.
  Examples check the discrete-source count 810, the identity-peripheral
  obstruction and a nontrivial central stabilizer.
- **Primitive kernel:** `primitiveHomology.baseChange` identifies scalar
  extension of the kernel with the kernel of the scalar-extended map. The
  dimension-ten/minus-four example is now labelled an algebraic adapter: it
  does not construct the required genus-two affine surface cover.

The omission catalogue was updated to agree with these declarations. It still
records every unresolved geometric/arithmetic consumer. Helper-name counts
and additional algebraic examples must not be counted as completion of the
plan's missing target signatures or geometric tests.

## Concrete blocker and owner boundaries

The accepted plan has complete target-level specifications, but its supplier
requests do not provide the definition interfaces required to type the
remaining package signatures. The following were checked against the reviewed
library audit, the actual current library and the owners' current specifications.

| Consumers | Existing owner / accepted contract | Missing interface and evidence |
| --- | --- | --- |
| `AbelianByFiniteFamily`, its fibres/base change, `IsGoodModel`, Legendre variant and reduced Prym | AbelianSchemesAndArithmeticModuli A1–A2; `LV-import-19`, `20`, `47`, `63` | The current native `AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` has a field as its base; its change of base is along a field extension. It supplies neither an abelian scheme over a variable scheme nor a relative polarization/dimension interface. A1–A2 describe those constructions, but no corresponding native `AbelianScheme` declaration is available. The reviewed A1 audit distinguishes these cases explicitly. |
| `deRhamBundle`, complex horizontal transport and both period maps | AbelianSchemesAndArithmeticModuli A4–A5 and ComplexComparisonPartII C5; `LV-import-21`–`23` | The reviewed A4/C5 audits record absence of relative de Rham cohomology, its Hodge subbundle, Gauss–Manin connection and relative Betti comparison. Searching the whole current Tau Ceti Lean tree for their native carrier names still finds no definitions. The owner specifications retain these as construction obligations, not supplied theorem signatures. |
| Crystalline Frobenius on family fibres and its compatibility with transport | CrystallineCohomology CR.1–CR.3, CR.7 and PadicHodgeTheory R06.5; `LV-import-27` and the package omission catalogue | These consumers additionally require the actual crystalline/de Rham family fibre comparison. A scalar semilinear map and a vector-space filtration do not provide that geometric cohomology object. The absent relative de Rham interface already blocks their statement formation. |
| Actual primitive homology, branched transfer and its genus-six test | AlgebraicTopology Stage 5, with its branched-cover extension; `LV-import-67` | The supplied linear kernel does not identify singular homology of a surface cover. The accepted contract explicitly asks for filling the punctured cover, the degree identity and intersection projection formula. Scalar extension of an abstract kernel does not supply these geometric comparisons. Current compact/closed surface predicates are reusable topology inputs, not these transfer constructions. |

Completing the missing owner carriers requires work outside this issue's four
allowed paths. Creating a second generic abelian-scheme, connection or
cohomology hierarchy here would duplicate those owners. Uninterpreted types,
arbitrary propositions or assumptions storing the desired conclusions would
violate the signature requirements. The independent review expressly identifies
the same distinction between an absent definition interface and an unproved
but adequately typed statement.

The other findings in [the independent review](../reviews/REV-PKG-MordellLawrenceVenkatesh.md)
remain open: friendly places and Frobenius comparisons, scheme Grassmannians
and period varieties, mapping classes/Dehn twists/point-pushing, Hurwitz and
Kodaira–Parshin families, lifted monodromy, the missing named theorems and their
required examples. None is silently waived by this checkpoint. In particular,
the S-unit theorem, period-image density, full monodromy and rational-point
finiteness still have no executable signatures here. The full remaining
source/semantic/signature audit is unfinished.

## Validation and reading receipt

- `lean-check research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`:
  final exit 0, zero errors, **208** warnings, all `declaration uses sorry`,
  zero other warnings. No Lean process remains running. Available memory
  exceeded 100 GB before compilation. No build, cache update or language server
  was started.
- Shared Mathlib HEAD is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The native Tau Ceti isometry module
  and its two direct Tau Ceti dependencies match source blobs at
  `f790474821cf4256814db967cb154e7af3d0c369` exactly. Those statements were read
  before importing the group; no coordinate replacement group was introduced.
- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkatesh.json`:
  zero errors and warnings; 146 targets, 100 tests, 39 milestones, 76 requests
  and 79 gaps. Structural validity does not establish supplier closure.
- Unchanged README: **197,848 bytes**, below 200,000. The input packet and
  historical review files are unchanged. `git diff --check` passes.
  The initial submission check rejected deletion of metadata; it was restored
  without changing its category. The draft disposition above is necessary
  to preserve the partial status under the current intake rules.
- Read WORKERS, both protocols, UPSTREAM_GUIDE, the issue and its independent
  review. Read current Completed/UniversalCovers and Completed/HodgeStructures
  as upstream models; inspected current native isometries, the surface
  predicates and PeripheralActions before adding any consumer comparison.
  Current read-only roadmap repository observed at
  `37769f03c170a7bc3e1082df70522a0ad59c5ffd`, current Tau Ceti at
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
- Primary source read for these changes: [Lawrence–Venkatesh v3](https://arxiv.org/pdf/1807.02721v3),
  §2.1, Lemma 2.1 and proof, p.9; §2.3, pp.9–11; §2.6, pp.14–15;
  §2.7, equation (2.4), p.15; §7.3, proof of Lemma 7.4, p.38; and
  §8.2, pp.39–40. SHA-256
  `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`.
  Native fixed fields, tensor base change, centralizers, continuous homomorphisms,
  special linear matrices and the cyclotomic CM criterion were also inspected
  at the pin. No restricted book was used or source passage copied to a deliverable.

## Resume

First obtain the missing owner definition/comparison interfaces, retaining
their exact hypotheses and ownership. Continue from the accepted README and
the independent review's exhaustive target/API/test table. Preserve the native
algebra repairs above; the continuous surjection companion does not replace
an arithmetic fundamental group or Hurwitz family. The fixed-base centralizer
helper and the canonical full-fixed-field constructor must remain distinguished.
Construct the actual surface-cover test before restoring its required test label.
Finish every missing statement and required example, then rerun the whole-file
check and the complete semantic/source audit. The preserved category is
`topic = "math.NT"`; its presence is not evidence of package completion.

No disposable scratch artifact is needed for continuation. Public source files
and elaboration logs can be reacquired; this note contains their useful receipts.
