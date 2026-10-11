# PKG-JacobianChallengePartII — inverse base change and supplier checkpoint

Refs #7593. Codex (GPT-6), session `codex-3ox4gw`, 11 October 2026.
Branch: `codex-3ox4gw-jacobian-package`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7593#issuecomment-6104801418)
at 02:55:45 UTC. This is the only won claim in this run.

**Blocked checkpoint, not a completed or upstream-ready package.** The required
parent abelian-scheme package is absent. The coupled fine-level curve-moduli
supplier also lacks its package and a declared bundle. Those changes fall
outside this job's four authorized paths. This continuation adds two native
interfaces and records the exact conditions for resuming. It changes no packet,
queue, supplier package or bundle schedule.

## Changes and validation

- Add `TriangularCoordinateEquivalence.schemeIso_baseChangeIso` to
  [Suggested.lean](../packages/JacobianChallengePartII/Suggested.lean).
  It states the equality of the complete triangular isomorphisms after arbitrary
  base change, using `Over.pullback`, `Functor.mapIso` and
  `PreservesProduct.iso`. Thus the inverse comparison follows too, rather than
  only the forward-morphism comparison already present. If F(R) ≫ C = C ≫ R′,
  then C⁻¹ ≫ F(R⁻¹) = R′⁻¹ ≫ C⁻¹. Product universality and uniqueness of inverses
  supply the argument; no commutativity is needed.
- Add `test_schemeNoncommutingInverse`, an example on genuine scheme-valued
  points `T ⟶ A` of a group object in `Over(S)`. For ab ≠ ba it distinguishes the
  correct restored tail ba from the incorrect ab. Both additions use the
  existing native carrier and retain `sorry` proofs; no substitute predicate
  or geometric conclusion is assumed.
- Explain both interfaces in README §5.5, including an explicit GL₂(F₂)
  example. With a = ((1,1),(0,1)) and b = ((1,0),(1,1)),
  ab = ((0,1),(1,1)) whereas ba = ((1,1),(1,0)). Exhausting its six matrices
  gives **516 passing inverse-composite assertions** for tuples of one, two and
  three factors, and **18 noncommuting pairs** detecting the wrong restoration.
  This finite calculation tests coordinate order, not scheme-level proofs.
- The native file now contains **84 executable declarations**: 10 definitions,
  41 theorem signatures and 33 examples. All 82 inherited declarations remain.
  `lean-check research/blueprint/packages/JacobianChallengePartII/Suggested.lean`
  completed with **exit 0, 78 warnings, all `declaration uses sorry`, zero errors
  and zero other warnings**. Available memory was 98 GiB before the check.
  The shared build uses Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No build or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json`
  completed with **0 errors and 0 warnings**: 48 nodes, 60 API items, 52 tests,
  24 planets, 11 baseline declarations, 14 gaps and 13 requests. All eight
  layers remain planned, none closed. The accepted packet is unchanged and the
  two README additions preserve all its targets, interfaces and checks.
- `git diff --check` and `python3 research/blueprint/intake.py check-files`
  on the three changed deliverables pass. Signature elaboration and structural
  validation do not discharge the geometric obligations below.

## External gates checked afresh

The clone base and checked atlas main are
`b061836721f295b25db6dd43d2fb96ca78830e78`. The fresh remote TauCetiRoadmap main
is `4b002f622e9d68b627bdce9f6224897305a68bdc`. Listings pinned to those commits
contain 75 atlas package entries and 50 upstream roadmap entries; neither has
`AbelianSchemesAndArithmeticModuli` or `StableReductionPartII`.
The local queue contains neither exact package job and still gives this job
`after: []`. Neither `focus.json` nor `upstream/CaraianiNewton.md` declares the
required coupled bundle.

| Required contract | Accepted input | Action required outside this job |
| --- | --- | --- |
| `AbelianSchemesAndArithmeticModuli:A1–A3` | The 89-node parent packet was accepted by `independent-review-REV-AbelianSchemesAndArithmeticModuli`, 2026-10-09. A1 supplies arbitrary-base abelian schemes, products, rigidity and cube identities; A2 supplies both-axis-normalized Poincaré and biduality; A3 supplies nonzero finite locally free multiplication, including inseparable cases. | Supply the parent package as the lower-tier owner. The existing Part II package imports A1–A3 and cannot replace its parent. |
| `StableReductionPartII:MC.4/full-level` and `fine-level-scheme` | The 528-node packet was accepted by `independent-review-REV-DESIGN-StableReductionPartII~2`, 2026-10-10. Full level consumes JC1's relative Jacobian, base change and principal polarization. Fine level supplies the smooth quasi-projective scheme and universal smooth projective curve over the exact cyclotomic symplectic component Z[1/N, ζ_N]. | Supply the separate StableReductionPartII package and declare the coupled bundle for joint upstream submission. |

The node sequence is **JC1 → MC.4 full-level/fine-level scheme → JC7**.
Keep MC.4 out of generic Layers 0–5 and retain the noetherian universal
construction followed by arbitrary pullback in Layer 7. Do not introduce
reciprocal whole-package scheduling dependencies.

[WORKERS.md, Upstream tiers](../WORKERS.md#upstream-tiers) allows package
citations only to libraries, own layers, declared bundle partners and lower-tier
packages, with dependencies upstream first or together in their bundle. The
issue also says **“Change no packet; if the plan has a mistake, describe it in
the handoff note.”** Changing supplier ownership or declaring the bundle is
therefore outside this continuation. The checkpoint follows
[WORKERS.md, Claiming](../WORKERS.md#claiming).

**Metadata remains absent deliberately.** `research/blueprint/issues.py`,
`deliverables_complete`, classifies a package by the existence of all output
paths without consulting its blocked handoff. Adding metadata now would mark
this incomplete package complete. The eventual line is `topic = "math.AG"`.

## Ownership and source receipts

Read the current JacobianChallenge and AlgebraicVectorBundles READMEs in full
and inspected their suggested-file forms, together with the reviewed parent
library-audit entries. The read-only roadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command was run there.
Field/pointed Jacobian results stay with JacobianChallenge; general finite
locally free duals and determinants stay with AlgebraicVectorBundles L0A–L0C.
The current field `AbelianVariety` carrier and section-dependent
`rigidifiedPicardFunctor` do not supply arbitrary-base abelian schemes or
section-free Picard representability. Current-only interfaces must not be
imported into the older compile pin. The README's inherited correction that
current actual line-bundle classes form a commutative group is retained.

Freshly read [Yuan, arXiv:2108.05625v4](https://arxiv.org/pdf/2108.05625v4),
30 April 2024, §4.6.2, pp. 96–98, including the proof of Theorem 4.17(5), p. 98.
The triangular change and the separate multiplication by 2g−2 in the tails
are distinct operations. The general group-object inverse/base-change checks
are elementary deductions, not an attribution of noncommutative geometry to
Yuan or a proof of his nondegeneracy theorem. The PDF SHA-256 is
`a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.
The cleared-library index was read; BLR and MFK are not cleared and were neither
obtained nor read. Other source checks and proof receipts are inherited from
[the preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/b061836721f295b25db6dd43d2fb96ca78830e78/research/blueprint/handoff/PKG-JacobianChallengePartII.md),
not claimed as fresh verification. No source passage or local filesystem path
is included in the deliverables.

## Where to resume

Resume only after the two supplier packages and the declared bundle are
provided. Recheck their final layer identifiers and exact contracts against
every *Needs* paragraph; reconcile current library interfaces with the pin;
resolve any plan correction through its owner; and rerun Lean, packet and
submission checks. Add metadata only when package closure is honest.
Representative native signatures may omit unavailable geometric types under
the binding package rule, but must not replace them with arbitrary predicates
or assumed conclusions. Keep all 48 prose targets and their discriminating
checks. The remaining obligations and target correspondence are retained below.

### Inherited proof/interface obligations

| Inherited gap | Affected targets |
| --- | --- |
| Algebraic equivalence of geometric-fibre actual line classes | §4.1, §4.2, §4.8, §3.10 |
| Fine-level supplier assembly | §7.1, §7.2 |
| Relative Picard representability proof inputs | §0.3 |
| Relative properness and canonical polarization descent | §1.1, §1.4 |
| Relative pointed Abel immersion bridge | §2.4 |
| Poincaré sign and normalized seesaw | §3.1, §3.6, §3.11 |
| Translated theta pullback calculation | §3.4, §3.5 |
| Arbitrary-alpha curve-square computation | §3.7 |
| Nonsymmetric cube recurrence in theta doubling | §3.8 |
| Relative autoduality over nonreduced bases | §4.3, §4.5 |
| Bi-Picard lifts preserving the other projection condition | §4.6, §4.7 |
| Axis-normalized square comparison proof | §4.9 |
| Stable relative duality and determinant API | §6.1, §6.2, §6.3 |
| Native geometric prototypes absent at the pin | 42 omitted targets; identifications in §2.6, §5.2–§5.4 and supplier theorem in §5.6 |

The inherited representability/properness inputs include BLR 8.2/1, 8.2/5,
8.4/2–3, 9.2/13, 9.3/5 and MFK 6.9. The pointed relative immersion requires
proof and descent. Relative autoduality must be an identity on all test schemes,
including nonreduced bases. The axis-normalized comparison needs the auxiliary
Zhang argument or the full currying/Albanese/seesaw proof. Layer 6 needs its
specified rank-g comparison before taking a determinant.

Earlier pointed-difference proof receipts use `GrpObj.comp_div` and binary
product laws. The cocycle uses `div_mul_div_cancel'` on (a(y),a(x),a(z));
translation uses `toUnit_unique` and `mul_div_mul_left_eq_div`. The base-change
proof uses the pulled-back group object, its Hom monoid homomorphism and
`map_div`, then product comparisons. These are inherited proof receipts,
not an implementation claim.

### Target correspondence

The native §5.5 interface is present. §2.6, §5.2–§5.4 and §5.6 have native
companions taking their earlier geometric inputs explicitly. The other 42
geometric targets remain in the README and the short closing comment. Comments
are not counted as elaborated geometric declarations or tests.

| Package target | Accepted node suffix | Kind |
| --- | --- | --- |
| §0.1 | `degree-locally-constant` | lemma |
| §0.2 | `relative-degree-components` | definition |
| §0.3 | `picard-representability` | theorem |
| §0.4 | `picard-torsors` | construction |
| §1.1 | `jacobian-proper` | lemma |
| §1.2 | `relative-jacobian` | construction |
| §1.3 | `jacobian-base-change` | comparison |
| §1.4 | `principal-polarization` | construction |
| §2.1 | `section-free-abel-map` | construction |
| §2.2 | `degree-abel-map` | construction |
| §2.3 | `pointed-factorization` | lemma |
| §2.4 | `degree-one-closed-immersion` | theorem |
| §2.5 | `nonzero-degree-finite` | theorem |
| §2.6 | `curve-difference` | construction |
| §2.7 | `diagonal-base-change` | comparison |
| §3.1 | `jacobian-poincare` | construction |
| §3.2 | `degree-one-theta` | construction |
| §3.3 | `twice-theta` | construction |
| §3.4 | `theta-inverse-pullback` | theorem |
| §3.5 | `theta-pullback` | theorem |
| §3.6 | `poincare-addition-identity` | theorem |
| §3.7 | `poincare-curve-square` | theorem |
| §3.8 | `theta-doubling-formula` | lemma |
| §3.9 | `poincare-diagonal` | theorem |
| §3.10 | `geometric-twice-theta` | lemma |
| §3.11 | `twice-theta-symmetric` | lemma |
| §3.12 | `twice-theta-zero-rigidified` | lemma |
| §3.13 | `twice-theta-relatively-ample` | theorem |
| §4.1 | `actual-picard-zero` | definition |
| §4.2 | `actual-picard-bizero` | definition |
| §4.3 | `relative-autoduality-pullback` | comparison |
| §4.4 | `actual-to-relative-obstruction` | lemma |
| §4.5 | `actual-pullback-torsion-cokernel` | theorem |
| §4.6 | `bizero-lift-one-factor` | lemma |
| §4.7 | `bizero-pullback-torsion-cokernel` | theorem |
| §4.8 | `axis-normalized-picard` | definition |
| §4.9 | `pointed-square-picard-isomorphism` | comparison |
| §5.1 | `canonical-abel-map` | lemma |
| §5.2 | `universal-shift` | construction |
| §5.3 | `faltings-zhang` | construction |
| §5.4 | `shifted-faltings-zhang` | construction |
| §5.5 | `triangular-coordinate-equivalence` | construction |
| §5.6 | `shifted-power-factorization` | comparison |
| §6.1 | `picard-lie-cohomology` | comparison |
| §6.2 | `curve-jacobian-hodge-bundles` | comparison |
| §6.3 | `hodge-line-isomorphism` | comparison |
| §7.1 | `universal-level-jacobian` | application |
| §7.2 | `universal-faltings-zhang` | application |
