# Independent review checkpoint: Hodge structures, Part II

Job `REV-DESIGN-HodgeStructuresPartII`, issue #3548. Codex, session
`codex-tUuT7s`, 5 October 2026. This is a **partial review**, not acceptance or
a finished `needs_changes` verdict. No top-level `review` object has been added.
The review must continue from the handoff before the packet can be promoted.

## Extent and counts

The incoming packet has 569 nodes, all in H.0: 15 definitions, 88 constructions,
443 lemmas, 18 theorems and five comparisons. It records H.0 as partial and
H.1–H.8 as not_read. Those coverage statuses are honest. Its `complete` status
means a planning pass ended after exceeding the 300-node budget; it does not
mean that these stages are planned or closed. Unread stages are not, by
themselves, grounds for rejecting that completed pass under section 0.

This checkpoint inspected the first **47 nodes**, from `H.0/coordinate-frame`
through `H.0/rees-specialization`, including their statements, hypotheses,
proof routes, prerequisite lists, API and tests. It checked the statements of
**15 of 279 baseline citations** at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The other 264 statements and the
remaining 522 nodes have not been independently checked. An indexed structural
check validates all declaration names/modules, but is not a statement audit.

The edited packet still has 569 nodes and six planets. It now has 540 API
entries, 491 test entries, five requests and 13 gaps. No nodes were added or
removed, and no baseline citations were removed. Seven API entries and seven
tests were added, including one actual new affine Lean example. The additional
global tests remain explicitly omitted signatures, so their presence in JSON
does not satisfy the executable-signature requirement.

## Corrections made

1. **Local finite rank does not imply a finite trivializing cover.** The reserved
   node `key/higgs-parameter-connections` required a finite local trivializing
   cover in its first construction step. Its actual hypotheses impose neither
   quasi-compactness nor globally bounded rank. The step now permits an arbitrary
   covering family with a finite basis on each member. A new test uses the
   discrete space N, stalks Q^n, zero forms and zero Higgs operator: this is
   finite locally free with unbounded rank, and cannot have a finite covering
   family of free constant-rank charts. The affine-line nonzero example now
   specifies a field k, excluding the zero-ring ambiguity without restricting
   the general carrier.
2. **The reserved key's sample API is explicit.** The seven sample criteria in
   `data/keydefs/KEYDEF-algebraicgeometry.json` were compared with the reserved
   node. Its original tests included the unit line, parameter unit and
   noncommuting field, but omitted the integrable/non-nilpotent line, invertible
   rescaling, same-parameter tensor/dual/pullback and associated-graded checks
   from that node's own lists. These criteria now appear there with concrete
   values and named supplying nodes. They reuse existing constructions rather
   than adding second owners. The suggested file's global omission ledger was
   updated to match; actual global signatures and examples are still missing.
3. **Frame API and a discriminating test.** Added `Frame.ext` and
   `Frame.test_variable_parameter`. None of the three original frame tests
   detects deleting the constant-parameter field. The new example excludes
   λ=X with the direction ∂/∂X over Q[X], since ∂X=1. Both new signatures are
   present in the suggested file with admitted proofs.
4. **Use the edition independently read.** The 31 core/filtration nodes citing
   the inaccessible published EG20 passages now cite the existing
   `EG-author-2026` record with author-copy pagination. The source matches
   explicitly distinguish the relatively constant restriction and authored
   arbitrary-ring/site deductions from the source's complex-geometric
   statements. `H.0/intrinsic-rescale` additionally replaces its irrelevant
   Liu–Zhu nilpotence citation with the scaling formula in the proof of EG
   Lemma 4.9, author p.24. The original published source record and its
   historical evidence remain available for the rest of the review.
5. **Supplier and source boundaries are gaps.** Added a precise gap for the
   generality of the requested ordinary-connection supplier, and another for
   the two Rees nodes' source and supplier contract. No supplier scope was
   silently enlarged, and no prerequisite edge was redirected without a
   justified replacement.
6. **Source issues.** Added the missing `source: EG20` to the first source issue.
   The same notation slips occur in the author copy, but a verdict on its
   published-page assertion remains pending. Confirmed the second issue from
   the complete Stacks authors' correction patch: this is an acknowledged,
   already-fixed historical Delta/i misprint. No new source error is alleged.
7. **Planet.** The reserved key's planet is now “Higgs and λ-connections”, the
   key-definition survey's mathematical label. There remain six H.0 planets.

## Mathematical checks in the inspected prefix

These checks establish the indicated algebra or construction route **under its
listed inputs**. They do not verify all later affine prerequisites, discharge
the global supplier requests, or substitute for a final per-node verdict.

| Nodes (all H.0 unless specified) | Check and remaining boundary |
| --- | --- |
| `coordinate-frame`, `preconnection`, `operator` | Derivation carrier and parameter rule match the pin. Polynomial directions require a commutation argument, not merely `derivation_ext`. The actual suggested operator is base-linear, not R-linear. Added the constant-parameter rejection test. |
| `curvature`, `operator-commutator`, `flatness` | Expanded both operator compositions: commuting directions cancel second derivatives and δλ=0 removes the parameter derivative. The coefficient is λδ_iA_j−λδ_jA_i+[A_i,A_j]. Basis-column evaluation gives the converse flatness implication. |
| `gauge`, `tensor`, `dual`, `invertible-rescale` | The convention s′=Gs gives the negative derivative correction. Kronecker sums retain one λ; transpose reverses products, giving negative dual curvature. Constant inverse rescaling gives λ⁻² curvature. |
| `zero-parameter-curvature`, `joint-nilpotence` | Flatness is commutation, not nilpotence. E12 is nonzero with bound 2; a scalar 1 is flat without any positive bound. Nonreduced rank-one square-zero coefficients are correctly allowed. |
| `intrinsic-preconnection`, `extension-balancing`, `exterior-extension` | The whole sum D(e)∧ω+λe⊗dω is additive and balanced. The individual D term cannot be lifted as an O-bilinear map. Sheafification/restriction and all exterior degrees still need their exact supplied carriers. |
| `intrinsic-curvature`, `curvature-linearity`, `flat-extension-square` | The curvature composite is well-typed after extension. Its scalar defect is λe⊗dλ∧da. For dλ=0, D²(e⊗ω)=κ(e)∧ω. The local degree-two prototype does not establish all degrees or the global sheaf maps. |
| `key/higgs-parameter-connections`, `connection-morphism`, `unit-connection` | The reserved definition occurs once and carries actual equations, not arbitrary property fields. Finite local rank was corrected. Horizontal composition follows from the defining equation. λd is a flat unit when dλ=0; the requested global category signatures remain omitted. |
| `zero-fiber`, `ordinary-fiber` | λ=0 gives O-linearity and exterior-square Higgs integrability. λ=1 gives the ordinary equation, but the asserted comparison with the broad CR.1 carrier has not been supplied at that generality. |
| `tensor-balancing`, `intrinsic-tensor`, `tensor-curvature` | Expanding B(ae,f) and B(e,af) gives the same single derivative term. The mixed degree-one terms cancel in curvature, leaving the two factor curvatures. Later affine prerequisites and the native global sheaf construction remain unchecked. |
| `intrinsic-dual`, `dual-curvature` | In λd(φ(e))−φ(D(e)), the scalar derivative terms cancel when checking linearity in e. Finite local freeness gives the tensor-Hom identification; dλ=0 gives negative dual curvature. This still needs actual sheaf evaluation and biduality. |
| `intrinsic-pullback`, `local-descent`, `coordinate-comparison` | Pullback balancing uses the compatibility df(da)=d(fa). Zero curvature is preserved without flat base change. Horizontality makes the local operators glue. Arbitrary frames, especially zero directions, are correctly excluded from the universal-coordinate comparison. Sheaf restrictions/descent and later affine prerequisite statements remain open. |
| `intrinsic-rescale` | The generic inverse scaling is sound with λ a constant unit. Its source locator was corrected. |
| `twisted-higgs`, `higgs-commuting`, `symmetric-action` | Published Heuer Definition 1.2 retains Ω¹(−1). Definition 4.1 explicitly supplies contraction and the symmetric action into the associative endomorphism algebra. Exterior basis coefficients give commutation without dividing by 2; a commutative-target-only lift would not suffice. The cited later affine associative-target node has not yet been audited. |
| `ordered-iterate`, `nilpotence-filtration`, `nilpotence-equivalence` | Ordered tensors are correctly distinguished from exterior tensors. With finite locally free Q, kernels of all coefficient words give the lowering filtration. Steps/quotients need not be subbundles; the square-zero line example is correctly retained. |
| `tensor-nilpotence`, `dual-nilpotence`, `pullback-nilpotence`, `reduced-line-nilpotence` | The mixed-word shuffle route gives N+M−1 without dividing by binomial coefficients; dual words reverse and acquire (−1)^N. Zero composites remain zero under pullback. A reduced line has nilpotent scalar coefficients only when those coefficients vanish; Q's finite local freeness is explicit. Global shuffle/sheaf interfaces and the numerous later affine suppliers have not been fully audited. |
| `griffiths-filtration`, `graded-higgs`, `graded-higgs-integrable` | The scalar derivative and representative change vanish in F^{p−1}/F^p. For the E21 example the symbol lowers e₁ to e₂, whereas the skipped-two filtration is not transverse. Passing ∇²=0 to the degree−2 quotient gives exterior integrability. The quotient-symbol construction is used unbundled before flat Higgs bundling, avoiding a circular proof. |
| `rees-parameter`, `rees-specialization` | The signs t^(−p), t∇ and relative dt=0 are mutually consistent; the zero fiber has the degree-lowering symbol. The actual cited LZ passages do not state Rees modules or their fibers, and the exact finite module-sheaf supplier is not yet verified. Recorded as a gap. |

## Pinned baseline statements read

All entries below were read with their ambient hypotheses at the pinned Mathlib
commit; the packet records separate `independentCheck` receipts for these 15
entries. The indexed checker also found their names in the cited modules.

| Module | Declarations and fit |
| --- | --- |
| `Mathlib/RingTheory/Derivation/Basic.lean` | `Derivation`, `Derivation.leibniz`: base-linear map, zero on one and Leibniz; sufficient for the commutative-ring specialization. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean` | `MvPolynomial.pderiv`: actual polynomial partial derivation, including monomial/constant formulas nearby. |
| `Mathlib/Algebra/MvPolynomial/Derivation.lean` | `MvPolynomial.derivation_ext`: equality from agreement on variables; not a theorem that arbitrary compositions are derivations or commute. |
| `Mathlib/Data/Matrix/Basis.lean` | `Matrix.single`: elementary entry and zero elsewhere, with decidable equality. |
| `Mathlib/Data/Matrix/Mul.lean` | `Matrix.mulVec`, `Matrix.mulVec_mulVec`: finite sums and composition; hypotheses are weaker than the finite commutative-ring models. |
| `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | `Matrix.kronecker`: multiplication on paired indices; does not by itself identify a tensor product of sheaves. |
| `Mathlib/LinearAlgebra/Matrix/Defs.lean` | `Matrix.transpose`: swaps the two indices. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | `SheafOfModules`: module presheaf with underlying abelian presheaf a sheaf. This is already present and is not replanned. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` | `SheafOfModules.IsLocallyFree`: local generator data giving local free isomorphisms; no finite rank or finite covering-family condition follows. The ambient over-site sheafification hypotheses must be retained when prototyping. |
| `Mathlib/Algebra/Category/ModuleCat/Presheaf/Monoidal.lean` | `PresheafOfModules.Monoidal.tensorObj`: objectwise tensor and semilinear restrictions, not a sheaf tensor identification. |
| `Mathlib/RingTheory/Kaehler/Basic.lean` | `KaehlerDifferential.D`: the universal relative derivation. An arbitrary specified differential calculus still requires its own given d; no universal-form identification is inferred. |
| `Mathlib/LinearAlgebra/TensorProduct/Basic.lean` | `TensorProduct.liftAddHom`, `TensorProduct.liftAddHom_tmul`: additive balanced lift and elementary-tensor evaluation; suitable for the non-R-linear connection extension. |

The reviewed audit of the parent HodgeStructures L0–L3 was read. It records
the implemented pure/mixed/polarization/period-point substrate, which these
core connection nodes do not rebuild. The parent's full document and the
AlgebraicCurves scope/convention/acceptance sections were read for boundaries
and granularity. This is not a new audit of the parent's Tau Ceti declarations.

## Sources and versions

- [Esnault–Groechenig author copy](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf),
  44 pages, SHA-256
  `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`:
  definition paragraphs at pp.5–6 and 23–24, and the full printed Lemma 4.9
  statement/proof were inspected. Its Simpson inputs were not independently
  read. The [published Acta URL](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf)
  returned HTTP 403. Consequently neither its pagination nor its first
  source-issue assertion receives a fresh published-version verdict here.
- [Liu–Zhu arXiv v3](https://arxiv.org/pdf/1602.06282v3), SHA-256
  `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`:
  conventions/setup, Remark 1.10, Theorem 2.1(i)–(v), the associated-graded
  passage and equations (2.4)–(2.5), printed pp.5–8. No correspondence proof
  or general nilpotence theorem was checked.
- [Heuer published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf),
  SHA-256 `7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd`:
  Definition 1.2(2), p.262, and complete Definition 4.1/Remark 4.2,
  pp.297–298. The general algebra in the inspected nodes is distinguished
  from this source's rigid-geometric correspondence.
- [Stacks tag 07J5](https://stacks.math.columbia.edu/tag/07J5): the complete
  displayed section, proof and two comments. The
  [authors' historical patch](https://github.com/stacks/stacks-project/commit/d90e73b0eb86c47faa4724d04a3f06a810a83d36.patch)
  was read completely; SHA-256
  `e2baa6d2642f86c2ccb249335cabef74737876c5fc7b0bdee5462d6f9991eff7`.
  Linked crystalline proofs were not recursively audited.

## Supplier questions and remaining work

The descriptions of CR.1, E1, DD.1 and ShimuraData:D3 were read. D3 explicitly
includes the common variation carrier, with fibrewise opposedness and
Griffiths transversality; its use is appropriate as an open request. The other
boundaries require a more exact contract:

- **CR.1:** its stated connection comparison is over suitable crystalline
  lifts with quasi-nilpotence. Which declaration supplies ordinary integrable
  connections on every specified ringed differential site? The current request
  asks for a broader carrier than the stage explicitly promises. Resolve the
  general owner before asserting the comparison; do not add quasi-nilpotence
  to the reserved Higgs/parameter definition.
- **E1:** it describes derived sheaves, ringed pullback and monoidal operations,
  but the requested finite locally free underived tensor, exterior, dual,
  restriction and effective descent package still needs exact declarations.
  The 35-node global signature ledger expressly omits these signatures. An
  affine arbitrary-module prototype does not discharge the sheaf statements.
- **DD.1:** its filtered enhanced modules and “Rees descriptions where
  applicable” need a precise finite split module-sheaf specialization, with
  local freeness and both fibers. Read a primary Rees construction rather than
  using the LZ nilpotence theorem as its evidence.
- **Reader synchronization:** the issue does not authorize edits to
  `research/blueprint/readmes/HodgeStructuresPartII.md`. The assembler or an
  authorized follow-up must carry these corrections into that reader.
- **Final review:** independently inspect the remaining 522 nodes, 264 baseline
  statements, unvisited source records and their exact cross-packet suppliers;
  complete both source-issue verdicts and the source/route/stage screen; then
  write a final `review` object with justified per-node verdicts. This
  checkpoint must not be used as acceptance of the entire prefix or packet.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII.json`
with the supplied pinned declaration index reports **0 errors and 0 warnings**.
The full edited suggested file was checked with `lean-check` against the shared
Mathlib pin. It elaborates with admitted statements; only the expected
`declaration uses sorry` warnings are permitted. The final hash and diagnostic
count are recorded in the handoff after the check finishes. These checks do
not prove the mathematical statements or fill the omitted global signatures.
