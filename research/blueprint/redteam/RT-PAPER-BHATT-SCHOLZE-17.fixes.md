# FIX-RT-PAPER-BHATT-SCHOLZE-17

Codex, session `codex-J6LwjP`, 2 October 2026. Refs [#5511](https://github.com/CBirkbeck/tauceti-explorer/issues/5511).
All three findings confirmed in `RT-PAPER-BHATT-SCHOLZE-17.review.json` are fixed in the extraction and reader.
This is a correction submission, not an independent review verdict or a claim of formalization.

## Finding 1 — valuation-ring freeness

The original title and statement asserted local freeness for every flat finitely presented algebra over a valuation ring.
The corrected item, retaining its ID `cited-rg-flat-fp-algebra-free`, states the application the paper actually needs:
a **proper flat finitely presented** scheme over a **henselian** valuation ring has an affine open cover with free
section modules, whose rank may be infinite. It remains a route 1 source addition to SchemeAndStackFoundations.

RG71 I.3.3.13 is a pointed statement: a finitely presented morphism and finitely presented sheaf flat at the chosen
point over a local henselian base have an affine neighbourhood whose section module is free over the base ring.
Apply it at every point of the closed fibre to the structure sheaf. Let W be the union of the neighbourhoods.
If the closed complement were nonempty, properness would make its image a nonempty closed subset of the local base.
Every such subset contains the closed point, contradicting coverage of the closed fibre. Thus W is all of the model.

The corrected item and reader record the counterexample: choose 0≠t∈m in a nonfield rank-one valuation ring V.
Then K=Frac(V)=V[1/t]=V[T]/(tT−1) is flat and finitely presented. Since t is invertible in K, K/tK=0, whereas any
nonzero free V-module has nonzero reduction modulo t. The nonempty scheme Spec K refutes the unqualified claim.

F622 now explicitly depends on this corrected supplier and retains the paper's complete algebraically closed rank-one
field, normalized proper flat model, integral closedness and vector bundle hypotheses. Its copied §§7–10 ambient paragraph
has been replaced by the actual Theorem 6.13 hypotheses. Henselianity alone is insufficient for the Hom calculation:
in the nondiscrete rank-one setting, any negative-valuation multiplier fails to send all of m into V, hence
Hom_V(m,V)=V. In a DVR, Hom_V(tV,V)=t⁻¹V instead. For an arbitrary free direct sum, evaluating a homomorphism at one
nonzero a∈m fixes a finite support; the equation a f(x)=x f(a) and torsionfreeness force every coordinate outside it to
vanish. This explains the free-module Hom calculation. Its sheaf/localization and perfection-colimit compatibilities,
and the boundedness argument, remain explicit source/proof gates; the cover is not advertised as proving them alone.

No new source erratum is alleged. The source already chooses a proper flat reduced model before invoking RG71.

## Finding 2 — ordinary symmetric monoidal functors already exist

`symmetric-monoidal-functor` is now **library**, with the following actual statements read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Source at the pin | Fit |
| --- | --- | --- |
| `CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean:389` | Inverse lax/oplax constraints; unit/tensor isomorphisms at 405/411 |
| `CategoryTheory.Functor.Braided` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:531` | Monoidal plus the braiding equation of `LaxBraided`, 385–388 |
| `CategoryTheory.SymmetricCategory` | Same file, 367 | Symmetric braiding on source and target |
| `CategoryTheory.NatTrans.IsMonoidal` | `Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean:46` | Unit and tensor equations for a natural transformation |

Between symmetric categories, the braided strong monoidal functor is precisely the ordinary symmetric monoidal functor
recalled on BS17 p.54. It has been removed from route 12's construction list. The route imports the existing definitions,
and A1205, A1214 and A1217 now depend explicitly on this library item. The inherited monoidal structure on Core and the
coherent Segal/group-completion/spectral maps remain separate obligations. Crediting this definition does not claim any
of those higher constructions are built. All 17 original library items remain unchanged.

## Finding 3 — import the general K-theory suppliers

The four suppliers have been removed from route 10's low-degree determinant work. Existing owner contracts and their
reviewed library-coverage entries were read before assigning statuses (AUDIT-28/29/30; also SF.0/SF.4 and H.1/H.4).
The higher/scheme theorems are planned, not implemented; the audit's existing degree-zero shadows are not substituted.

| Item | Owner and route | Status and scope |
| --- | --- | --- |
| `k-theory-additivity` | GeneralAlgebraicKTheory:K.4:construction, route 11 | Planned Waldhausen additivity; D511 imports it |
| `supported-perfect-complexes-general` | SchemeKTheoryOperations:S.3, route 9 | Planned supported-perfect construction; closed pushforward requires preservation of perfectness |
| `localization-sequences` | SchemeKTheoryOperations:S.3, route 9 | Planned K-localization, retaining the original ID for the K half |
| `localization-g-theory` | GeneralAlgebraicKTheory:K.3, route 11 | New planned item splitting off Quillen Serre localization/devissage; no regularity needed for G |
| `tt90-k-equals-g-regular` | SchemeKTheoryOperations:S.2, route 9 | Missing source extension; its finite-dimensional special case is explicitly imported as planned |

The last item retains the cited regular-noetherian statement rather than silently adding finite dimension. S.2 currently
promises the regular noetherian **finite-dimensional** Cartan equivalence; broader scope remains a source addition to S.2.
This flags the requirement for the owning design/blueprint job without modifying that owner's packet or the reviewed atlas.

S.3 promises general **nonconnective** localization with quasi-compact complement. The paper's regular connective
application retains the degree-zero surjectivity input and the K/G/Quillen comparisons; it is not extended to arbitrary
schemes. The new G item has its source locator, owner, API and empty/full/singular-support acceptance tests. D514 imports
both localization suppliers, support and Cartan. Route 10 retains the determinant consequences and explicit supplier
imports. The original 363 item IDs are preserved; the only added item splits the already recorded paired K/G input.
No recursive TT90/Quillen proof audit is claimed or required by this correction.

## Source and validation record

Sources downloaded 1 October and checked through 2 October 2026:

- [Bhatt–Scholze, arXiv v3](https://arxiv.org/pdf/1507.06490v3), SHA-256
  `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.
  Targeted full-text checks of pp.18–19,25–26,54; rendered checks of pp.19,26,54. The published version of record was
  not collated. No fresh search or revalidation of the 56 historical source observations is implied.
- [Raynaud–Gruson, Inventiones 13 scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0013/PPN356556735_0013.pdf),
  SHA-256 `623b5e4f7182dc04bfa537ef2f656c979fcd93f7b08b179607e3cdfaab0a2a58`.
  This PDF is the 363-page journal volume. Only article printed pp.21–23,25 (scan pp.28–30,32) were read visually;
  the article and volume were not read in full.

Validation:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-SCHOLZE-17.result.json`: passed.
- Intake deliverable-path/JSON checks and `git diff --check`: passed.
- Structural regression: **364** unique acyclic items, **468** internal prerequisite edges, all original edges retained;
  **307** missing items each routed exactly once; exact status totals **18 library / 39 planned / 307 missing**.
  Routes 9/10/11/12 contain **13/21/5/13** items. All 18 routes, 28 bibliography prerequisites, 56 source observations,
  original library items and unaffected item records are preserved. The historical review verdict remains its author's.
- Exact arithmetic regressions: **289** signed-braiding cases, including **64** odd/odd failures of the identity-tensor
  forget-grading functor over F₃; **100** rational valuation witnesses for the nondiscrete Hom calculation and a DVR
  distinction. The localization/nonfree-module and proper-cover counterexamples above are direct mathematical arguments.
  These bounded regressions are not proofs of the imported theorems.
- No Lean file is authorized by this job and no pinned compiled build is available. No Lean compilation was run.

The extraction is complete as a correction deliverable. Implementation and recursive source proof closure remain deferred.
