# RT-PAPER-BHATT-SCHOLZE-17

Codex, session `codex-rtOQ9t`, 1 October 2026. Refs #4176.

The audit finds three defects: **one high-severity statement error and two medium-severity library/ownership errors**. They concern the extraction; they do not disprove the projectivity theorem.

## Scope and evidence

The input snapshot is `a7560b3c450813d05d519490101670c75b76e134`. I did not write or review the extraction (Codex `codex-c83e7a`, completion `cc-442dc5`, review `cc-2aeb03`). I read all 61 pages of [arXiv v3](https://arxiv.org/pdf/1507.06490v3), including proofs and bibliography, and checked its 363 extracted statements and locators. PDF SHA-256: `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. Pages 19, 26 and 54 were also inspected as images. I read the accepting review and the 56 recorded corrections; the reader's historical inventory was interpreted using its current review notice. This is not a collation of the 95-page published version.

The machine-readable report details the library reads and scope checks. All 17 existing library items have support at the stated pins. The fresh atlas has all 29 distinct destination/planned stage IDs; every one of the 311 missing items has exactly one route. There are no unresolved internal prerequisites or cycles in the 363-item graph. The remaining 35 items are planned and 17 library. These counts do not establish that every semantic route is correct.

## 1. Flat finite presentation does not imply freeness — high

The item `/cited-rg-flat-fp-algebra-free` drops crucial context. Let V be a nonfield rank-one valuation ring, choose a nonzero nonunit t, and put K=Frac(V). Rank one gives K=V[1/t], so K is flat and finitely presented as a V-algebra. Yet K is not free as a V-module: multiplication by t is surjective on K, while it cannot be surjective on a nonzero free module over V. Spec K has only one nonempty open, so passing to an affine open cover cannot fix the claim. The example remains available with a perfect, henselian V and algebraically closed complete fraction field.

[Raynaud–Gruson I.3.3.13](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0013/PPN356556735_0013.pdf), printed p. 23 (scan page 30), is a neighbourhood result over a local henselian pointed base. I inspected printed pp. 21–23 and 25, not the whole supplier article. In BS17 p. 26, X_0 is proper as well as flat and finitely presented. The corollary covers its closed fibre by affine opens with free V-module sections. Properness forces their union to cover X_0: a nonempty closed complement has closed image containing the closed point of Spec V.

Restore either the actual pointed corollary or this proper henselian application. “Free” here concerns the section modules on a suitable affine cover, not all stalks. Keep the separate integral-closedness and valuation assumptions in the ensuing Hom argument. The extraction should retain the localization example to make the boundary explicit. This is an extraction overgeneralization, not a newly alleged error in BS17.

## 2. Symmetric monoidal functors already exist — medium

The item `/symmetric-monoidal-functor` is marked missing. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the following declarations supply its ordinary categorical content:

- [Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean#L389): invertible coherent tensor and unit constraints.
- [Functor.Braided](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean#L531): preservation of braiding in addition to the monoidal structure. For symmetric source and target categories this is the required symmetric monoidal functor.
- [NatTrans.IsMonoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean#L46): unit/tensor compatibility for a natural transformation.

Credit these declarations, remove the item from route 12's missing work and update counts. This does not assert that the Segal construction, infinity-categorical coherence or the inherited monoidal structure on the core is already implemented.

## 3. General K-theory suppliers are assigned to their consumer — medium

Route 10's determinant destination receives `/k-theory-additivity`, `/supported-perfect-complexes-general`, `/tt90-k-equals-g-regular` and `/localization-sequences`. The last three are general scheme K-theory inputs to BS17 Theorem 5.5; the first is the general additivity used to construct the determinant. Their existing suppliers are:

| Input | Existing owner |
| --- | --- |
| S-construction additivity | GeneralAlgebraicKTheory:K.4:construction |
| Support category and support K-theory | SchemeKTheoryOperations:S.3 |
| K/G comparison | SchemeKTheoryOperations:S.2 |
| K-localization and Quillen G-localization | SchemeKTheoryOperations:S.3 and GeneralAlgebraicKTheory:K.3 |

These stages were read at the input snapshot, with their reviewed coverage targets. The low-degree stages Z.3/U.3/U.6 are determinant, SK1 and comparison consumers. Route 10's imports already acknowledge the suppliers, but its missing-item list contradicts that ownership. Move the general inputs to routes 9/11, mark already covered contracts planned and keep determinant-specific consequences in route 10. Where the extracted K=G theorem exceeds S.2's finite-dimensional promise, keep the extension at S.2 rather than silently narrowing the theorem or declaring that generality planned.

## Candidates not raised and limits

The note on `/lattice-determinant-e1-map` already requires subtraction of the constant K-class. The p-nullhomotopy issue in Q1155 is already an explicit proof obligation. The source ledger already records finite-presentation, truncation, normalization, Kottwitz and Segal-unit corrections; they are not new findings here. Route 17 explicitly calls for early/late stage separation, so its list of roadmap imports alone is not evidence of a cycle.

Supplier proof closure and complete definition APIs/tests belong to subsequent blueprints under PROTOCOL §16. Their absence was not treated as an extraction defect. The bounded arXiv/author-list/erratum searches located no separate matching correction, without establishing universal absence. The audit does not certify every proof in every supplier or the published-version pagination.

## Validation

The red-team schema checker and intake deliverable-path check passed for these two files; the staged whitespace check passed. No Lean file is required, written or compiled. No library build or cache download was used.
