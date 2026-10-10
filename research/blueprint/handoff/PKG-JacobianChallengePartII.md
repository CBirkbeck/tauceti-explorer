# PKG-JacobianChallengePartII — supplier-blocked continuation

Refs #7593. Current worker: Codex (GPT-6), session `codex-mrc0Mm`,
10 October 2026. Branch: `codex-mrc0Mm-jacobian-package-checkpoint`.
The bot confirmed [claim comment 6099825945](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6099825945).
This run took one issue and stops after submitting this checkpoint.

## Current result and blocking evidence

**The package remains a checkpoint.** The earlier README and Suggested.lean
are preserved unchanged. This continuation independently rechecked the supplier
availability, current upstream ownership boundary, target correspondence and
Lean elaboration; it did not review its own package or re-certify source proofs.
No new mathematical target or implementation is claimed.

The package cannot be finished within this issue's authorized files. WORKERS.md,
“Upstream tiers”, permits a package's target citations only to the libraries,
its own or bundled layers, current Tau Ceti roadmaps and lower-tier packages.
Both of the following required supplier packages remain absent from
`research/blueprint/packages/`; neither has a roadmap in the supplied current
TauCetiRoadmap checkout (commit `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`).

| Required input | Fresh check and exact resumption dependency |
| --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node plan retains its independent `accepted` verdict dated 2026-10-09. Its arbitrary-base abelian schemes, dual/Poincaré/polarization, and nonzero multiplication contracts are necessary in JC1–JC5 and JC7. An accepted plan does not supply the missing package. Consume the eventual package's actual layer targets before adding metadata. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The plan retains its independent `needs_changes` verdict dated 2026-10-05. The unresolved reader/packet contradiction is recorded in that verdict. Revision [#6378](https://github.com/CBirkbeck/tauceti-explorer/issues/6378) is open and available, and its independent review [#6395](https://github.com/CBirkbeck/tauceti-explorer/issues/6395) is blocked. After reconciliation and independent acceptance, MC.4 still needs a package before JC7 can consume it. |

JC7 requires the integral fixed symplectic component over
Z[1/ℓ,ζ_ℓ], its smooth quasi-projective fine scheme and smooth projective
universal curve, with g≥2 and ℓ≥3 invertible. The current MC.4 target includes
this scope; its cited DGH §6.1 result alone is characteristic-zero. Replacing
the supplier with that smaller result would drop an accepted target. Importing
MC.4 into JC0–JC5 would also break the dependency boundary: MC.4 already
consumes JC1's relative Jacobian, base change and principal polarization.

Current Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) was inspected
read-only. `AbelianVariety/Basic.lean` still bundles `AbelianVariety K` with
`[Field K]`, rather than an arbitrary-base abelian scheme. A search through its
algebraic-geometry sources found no `AbelianScheme`, `RelativePicard`,
`PicardScheme`, `DualAbelian` or `PoincareBundle` interface that could replace
these contracts. This search is a boundary check, not a full new library audit.
The current JacobianChallenge and AlgebraicVectorBundles READMEs were read in
full; field/pointed Jacobians and finite locally free dual/determinant
infrastructure keep their existing owners. Neither upstream checkout was
modified, and no Lake command was run there.

## Fresh validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**; 48 nodes, 60 API items, 52 tests, 24 planets,
  14 recorded gaps and 13 requests. All eight stages are planned; none is
  closed. The packet remains unchanged.
- Mechanical correspondence: every one of the 48 accepted target statements,
  all 60 API names and all 52 test names occurs in the README. The geometric
  API/test contract names also occur in Suggested.lean; the native triangular
  portion uses namespace-local lemma names and anonymous examples. This is
  name/statement correspondence, not elaboration of the geometric contracts.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 0 errors, 9 warnings, all `declaration uses sorry`**. Available
  memory was 100 GB before the single check. Compilation checks only JC5.5's
  native declaration, five API lemmas and three examples; the other 47 target
  interfaces remain mathematical comments. No build, update, cache download,
  language server or new Lake project was started.
- `python3 research/blueprint/intake.py check-files` on the README,
  Suggested.lean and this handoff: **3 files, 0 problems**.
- `git diff --check`: clean. Only this handoff changes in this continuation.

The unchanged input packet SHA-256 remains
`2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.
Supplier packet receipts:
`AbelianSchemesAndArithmeticModuli.json`:
`768adc69448c575ea3b07e4631d532c5177bc7572d030e3e3420bd8d6f67b3ff`;
`StableReductionPartII.json`:
`ded54104d6390d9196a8e0ae640ab909938b04fbc1398ff4d1d7eff229f8ce67`.

## Resume only after the supplier boundary changes

The maintainer should gate this package on the two supplier packages above,
so another worker is not sent to repeat this unchanged blocking audit. This is
a recommendation; this run changes no labels, queue files or other jobs.
When the suppliers exist, align their exact layer contracts and sign
conventions with the package, preserve all 48 targets, repeat correspondence
and Lean checks, then add `metadata.toml` containing `topic = "math.AG"`.
The earlier continuation list below retains the detailed mathematical worklist
and source-reading limits. No continuation needs a file from this run's
scratch space.

## Earlier checkpoint record (codex-M9i0Dl)


Refs #7593. Worker: Codex (GPT-6), session `codex-M9i0Dl`, 10 October 2026.
Branch: `codex-M9i0Dl-jacobian-package`. The bot confirmed
[claim comment 6099114728](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6099114728)
in [comment 6099116384](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6099116384).
No second issue was claimed.

**This is a checkpoint, not a complete upstream-ready package.** The mathematical
README is assembled and the native Lean portion elaborates, but two required
supplier packages do not exist in this checkout, and the fine-level supplier's
plan has not been accepted. `metadata.toml` is deliberately absent so the intake
will release this job for continuation rather than mistake file existence for
completion. Its eventual contents are exactly `topic = "math.AG"` followed by a
newline. Do not add it simply to finish the existence check.

## Saved work

- `research/blueprint/packages/JacobianChallengePartII/README.md`: approximately
  80 KB, all 48 targets in JC0–JC7, all 60 definition/construction API items and
  all 52 test specifications. There are 4 definitions and 13 constructions;
  each has at least 3 discriminating tests. Every target has its hypotheses,
  prerequisites and source locators. The introduction states the unpointed
  family problem, exact supplier contracts, conventions, scope boundaries and
  current upstream owners. Layer prose explains the build and the delicate
  descent/comparison arguments without pretending that they are proved.
- `research/blueprint/packages/JacobianChallengePartII/Suggested.lean`: one import
  block, one standard module note, the accepted native construction, 5 API
  signatures and 3 examples, followed by the 47 untyped geometric contracts in
  README order. Every geometric API/test name remains present. The repeated
  omission boilerplate and inherited process commentary were removed; missing
  types were not replaced by arbitrary predicates or replacement point sets.
- This handoff. The input packet, reader and suggested file, supplier files,
  atlas data and current upstream repositories are unchanged.

## Blocking supplier boundary

WORKERS.md, “Upstream tiers”, requires a package to cite only the libraries,
current Tau Ceti roadmaps, its own/bundle layers and lower-tier **packages**.
The draft retains the accepted plan's exact mathematical contracts pending
these two packages; it does not claim that those citations are already eligible
for upstream submission.

| Supplier | Evidence and continuation needed |
| --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | Its packet is complete and independently accepted on 2026-10-09, but no corresponding package directory exists. A1 must supply arbitrary-base abelian schemes, rigidity, square/cube and descent; A2 supplies duals, normalized Poincaré, seesaw and polarization; A3 supplies finite locally free nonzero multiplication, torsion and Weil pairing. Field `AbelianVariety` cannot replace these contracts. Once packaged, align the draft's conventions and citations with its actual targets. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | No package exists. The packet's independent verdict is `needs_changes` (2026-10-05), because its corrected packet and definitive reader contradict one another. The exact integral fine-level statement is therefore an unaccepted proposed supplier. Obtain the accepted, reconciled and packaged supplier before finalizing JC7; do not attribute its integral scope to DGH's characteristic-zero construction. |

`AlgebraicModuliForArithmeticGeometry` and
`NeronModelsAndSemistableAbelianVarieties` do have package READMEs. Relevant
contracts were inspected: the former's §7.6 gives sheafification, base change,
base-class kernel and section splitting; the latter's §4.13 gives the stable
family's fibrewise semi-abelian Picard identity component. Toric rank may jump;
“semi-abelian” does not demand a global constant-rank torus extension.
The fine-level supplier itself consumes JC1's generic relative Jacobian,
base change and polarization. Its input to this roadmap is restricted to JC7.
A DFS of the combined 48-node Jacobian and 528-node stable-reduction plans
found no cycle among their explicit internal node prerequisites. This is not
an accepted atlas integration or a verification of every external supplier.

Protocol §13 explicitly permits conditions whose native types are absent to
be omitted rather than represented by empty `Prop` fields. The independently
accepted design uses that convention for 47 targets. These omissions explain
the compilation boundary; their existence alone is not a new rejection of
that accepted planning pass. To expand the executable prototypes later, first
use the supplying geometric interfaces. Do not restate another owner's general
theory inside this package just to get typed geometric names.

## Inputs and current upstream audit

The source of truth is the 2026-10-05 independently accepted
`JacobianChallengePartII.json`, not its older reader. The review changed 19
contracts without regenerating that reader. This README uses the corrected
packet, including all added APIs/tests, cohomological Brauer groups, the
negative self-Poincaré sign, arbitrary-alpha formulas, stable Hodge scope and
arbitrary pullbacks of the fine-level universal curve. No review of our own
work was performed.

The current upstream JacobianChallenge and AlgebraicVectorBundles READMEs
were read in full for structure and ownership. StableReduction Layer 2 and
its exact J-B/SR-2 contracts were inspected for nodal Gorenstein duality,
coherent cohomology/base change and fibrewise relative ampleness. The current
AlgebraicVectorBundles Suggested.lean was inspected for `dual`,
`pullbackDualIso`, `determinant`, `determinantObjIso` and exterior-power pullback.
JC6.2 now cites L0B and JC6.3 cites L0C directly. This is an ownership citation,
not a new target or a second determinant development. None of the nine newer
upstream roadmaps is replanned.

Read the JacobianChallenge reviewed library audit and the 11 recorded baseline
statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Invertible sheaves, tensor products,
weighted divisor degree and abstract module-sheaf cohomology are usable native
objects; the baseline `LineBundleClass` has only its recorded commutative-monoid
structure. `CommRing.Pic` is the group of invertible semimodules up to
isomorphism and is not a relative Picard scheme. `AbelianVariety` is over a
field. The native Hom group and `GrpObj.comp_div` support JC5.5 directly.
Current Tau Ceti was inspected read-only at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`;
its later actual Weil-divisor/Picard and line-bundle APIs do not supply the
missing arbitrary-base relative Picard, dual abelian-scheme or fine-level
interfaces. No Lake command was run in either read-only upstream checkout.

## Source receipts and limits

The source locators are inherited from the accepted review, not silently
re-certified by package assembly. DGH arXiv:2001.10276v3 was read directly at
§6.1, pp.23–25, and its PDF hash agrees with the accepted receipt. Milne's
12 June 2021 notes were inspected at §8, Theorem 8.1 and its family discussion,
pp.27–28. The exact 21 August 2024, 126-page Yuan author-manuscript URL was
unreachable in this run; its mathematical claims and page locators are retained
from the independent review. Publisher pagination (Annals 203 (2026), 15–119)
is expressly distinguished from that manuscript's pagination.

BLR is not in the maintainer's cleared private-library index. This worker did
not obtain or read another copy. The accepted printed BLR locators remain
bibliographic citations; no scan link, copied page or verbatim source passage
is added. Serre, MFK and Zhang auxiliary proofs remain inherited proof/source
work below. Neither the absence of a rereading nor the packet's “complete”
status closes those boundaries.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`:
  **0 errors, 0 warnings**, 48 targets, 60 APIs, 52 tests, 24 planets, 14 gaps,
  13 requests; all 8 stages planned and none closed. This validates the
  unchanged input, not the package's omitted geometric signatures.
- Scripted correspondence checks: all 48 complete target statements and
  nondefault local hypotheses occur in their README sections; all 60 API and
  52 test names occur there; every internal prerequisite label is retained.
  Lean contains the 47 corresponding geometric records and all API/test names,
  counting its namespace-local native lemmas and examples honestly.
- README is below 200 KB. No programme-process words or private filesystem
  paths occur in it. Metadata's intended arXiv topic is recorded above.
- `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`:
  **exit 0, 0 errors, 9 warnings, all `declaration uses sorry`**. Only the
  native construction, API signatures and examples are checked. Mathlib is
  exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`; this file imports no
  Tau Ceti modules, so it is not a validation of Tau Ceti geometric imports.
  Available memory exceeded 100 GB before the final single compilation. No
  build, cache download, update, new Lake project or language server was used.

- `python3 research/blueprint/intake.py check-files` on the three saved
  deliverables: **3 files, 0 problems**. The unchanged completion checker
  confirms that the missing metadata makes this a checkpoint.
- `git diff --cached --check`: clean before commit.

## Continuation

1. Integrate the accepted AbelianSchemesAndArithmeticModuli package and the
   reconciled, accepted StableReductionPartII MC.4 package. Resolve supplier
   target citations against their actual packaged locations and signed
   conventions. Keep MC.4 out of JC0–JC5.
2. Recheck current upstream and library ownership, especially the generic
   Picard, actual classes, invariant differentials and finite locally free
   dual/determinant APIs. Consume those owners rather than copying them.
3. Preserve every mathematical target below and the exact corrected
   hypotheses. Expand a prototype only when a native supplier type is
   available; an omitted interface must remain explicitly untyped otherwise.
4. Run the input checker, verify all 48 targets/60 APIs/52 tests against the
   package, repeat `lean-check`, and run `intake.py check-files` and
   `git diff --check`. Add the one-line metadata only when the package's
   supplier boundary is resolved. Submit a complete continuation of #7593.

The following inherited proof/interface gaps are not alleged to have been
closed by this package. They remain the authoritative packet's worklist;
ordinary future implementation is distinct from the blocking supplier-package
boundary above.

| Inherited gap | Affected package targets |
| --- | --- |
| Algebraic equivalence of geometric-fibre line classes | JC4.1, JC4.2, JC4.8, JC3.10 |
| Fine-level supplier assembly | JC7.1, JC7.2 |
| Relative Picard representability proof inputs | JC0.3 |
| Relative properness and canonical polarization descent | JC1.1, JC1.4 |
| Relative pointed Abel immersion bridge | JC2.4 |
| Poincaré sign and normalized seesaw | JC3.1, JC3.6, JC3.11 |
| Translated theta pullback calculation | JC3.4, JC3.5 |
| Arbitrary-alpha curve-square computation | JC3.7 |
| Cube recurrence in the theta doubling formula | JC3.8 |
| Relative autoduality over nonreduced bases | JC4.3, JC4.5 |
| Bi-Picard lifting retains the other projection condition | JC4.6, JC4.7 |
| Axis-normalized square comparison proof | JC4.9 |
| Stable relative duality and determinant API | JC6.1, JC6.2, JC6.3 |
| Prototype interfaces absent at the pinned baseline | All targets except JC5.5 |

For the relative representability/properness chain retain BLR 8.2/1, 8.2/5,
8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9 as exact proof inputs. The pointed
relative Abel immersion must be proved and descended. For the theta formulas
retain the arbitrary-degree-one-divisor calculations and the nonsymmetric
cube recurrence. Autoduality must be an all-test-scheme identity over
nonreduced bases; the bi-zero lifts must preserve the other projection's
algebraic-triviality condition. The actual axis-normalized square comparison
requires the Zhang auxiliary lemmas or a full currying/Albanese/seesaw proof.
The Hodge comparison requires the specified rank-g map before taking its
determinant. Do not substitute geometric-point tests for any of these proofs.

## Target correspondence

The numbering follows prerequisite order inside each layer: local degree
constancy precedes the degree components; properness precedes the abelian-scheme
conclusion. No target is dropped. The native item is JC5.5; all other items
have an honest geometric interface record in Suggested.lean.

| Package target | Accepted node suffix | Kind |
| --- | --- | --- |
| JC0.1 | `degree-locally-constant` | lemma |
| JC0.2 | `relative-degree-components` | definition |
| JC0.3 | `picard-representability` | theorem |
| JC0.4 | `picard-torsors` | construction |
| JC1.1 | `jacobian-proper` | lemma |
| JC1.2 | `relative-jacobian` | construction |
| JC1.3 | `jacobian-base-change` | comparison |
| JC1.4 | `principal-polarization` | construction |
| JC2.1 | `section-free-abel-map` | construction |
| JC2.2 | `degree-abel-map` | construction |
| JC2.3 | `pointed-factorization` | lemma |
| JC2.4 | `degree-one-closed-immersion` | theorem |
| JC2.5 | `nonzero-degree-finite` | theorem |
| JC2.6 | `curve-difference` | construction |
| JC2.7 | `diagonal-base-change` | comparison |
| JC3.1 | `jacobian-poincare` | construction |
| JC3.2 | `degree-one-theta` | construction |
| JC3.3 | `twice-theta` | construction |
| JC3.4 | `theta-inverse-pullback` | theorem |
| JC3.5 | `theta-pullback` | theorem |
| JC3.6 | `poincare-addition-identity` | theorem |
| JC3.7 | `poincare-curve-square` | theorem |
| JC3.8 | `theta-doubling-formula` | lemma |
| JC3.9 | `poincare-diagonal` | theorem |
| JC3.10 | `geometric-twice-theta` | lemma |
| JC3.11 | `twice-theta-symmetric` | lemma |
| JC3.12 | `twice-theta-zero-rigidified` | lemma |
| JC3.13 | `twice-theta-relatively-ample` | theorem |
| JC4.1 | `actual-picard-zero` | definition |
| JC4.2 | `actual-picard-bizero` | definition |
| JC4.3 | `relative-autoduality-pullback` | comparison |
| JC4.4 | `actual-to-relative-obstruction` | lemma |
| JC4.5 | `actual-pullback-torsion-cokernel` | theorem |
| JC4.6 | `bizero-lift-one-factor` | lemma |
| JC4.7 | `bizero-pullback-torsion-cokernel` | theorem |
| JC4.8 | `axis-normalized-picard` | definition |
| JC4.9 | `pointed-square-picard-isomorphism` | comparison |
| JC5.1 | `canonical-abel-map` | lemma |
| JC5.2 | `universal-shift` | construction |
| JC5.3 | `faltings-zhang` | construction |
| JC5.4 | `shifted-faltings-zhang` | construction |
| JC5.5 | `triangular-coordinate-equivalence` | construction |
| JC5.6 | `shifted-power-factorization` | comparison |
| JC6.1 | `picard-lie-cohomology` | comparison |
| JC6.2 | `curve-jacobian-hodge-bundles` | comparison |
| JC6.3 | `hodge-line-isomorphism` | comparison |
| JC7.1 | `universal-level-jacobian` | application |
| JC7.2 | `universal-faltings-zhang` | application |

Input SHA-256: `2da73e3c0831882d8ce8aafb9ac0d468cfefdf784ef8e25b5651a5347d37f275`.
