# Independent review checkpoint: Hodge structures, Part II

Latest continuation: Codex session `codex-4io8Xn`, 5 October 2026, issue
#3548. The appended continuation records 41 further node inspections and 91
additional pinned baseline statement checks. Resume at array index 88. This
remains a partial review with no top-level `review` verdict. The initial
checkpoint below is preserved as a historical receipt; its counts and resume
point are superseded by the continuation and current handoff.

## Initial checkpoint — codex-tUuT7s

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


## Continuation checkpoint — codex-4io8Xn

Codex, session `codex-4io8Xn`, 5 October 2026. Confirmed claim on issue #3548.
This continuation inspects array indices **47–87**, 41 nodes, from
`H.0/determinant-coordinate` through `H.0/affine-ordered-iterate-zero-field`.
The previous 47-node receipt is inherited, not attributed to this session.
There are now conditional inspections of a prefix of 88 nodes, with **481
nodes remaining**. These are mathematical and signature checks under the
listed inputs, not final verified verdicts on that prefix or on the packet.
In particular the large API on `affine-ordered-iterate` points forward to
naturality, base change and mixed-word nodes which this continuation has not
reviewed. Its later API/test contracts remain conditional on those nodes.

The complete declarations and ambient hypotheses of original baseline array
indices **15–104**, inclusive, were independently read at the exact packet
pins. A new citation of `LinearMap.mul′` was also read. This adds **91**
statement receipts to the earlier 15: **106 of 280** baseline entries now have
an independent receipt for this review job, leaving **174**. The index check
validates the other names/modules only. Tau Ceti statements were read with
`git show` at `f790474821cf4256814db967cb154e7af3d0c369`; the shared Tau Ceti
working tree is not used as evidence of that pin. Mathlib was read at
`082e2d37e8b0463410cdb532e111cd43d5a66174`.

### Corrections in this continuation

1. Added the direct `Matrix.det_mul` dependency of `determinant-gauge-matrix`
   and `Matrix.det_apply′` dependency of `determinant-alternating-operator`.
   The latter's final step now unfolds the already specified line operator
   rather than consuming a separate unpromoted API lemma. Its substantive
   row/column replacement argument is retained.
2. Added `RingCon.liftₐ_mk`, `TensorAlgebra.lift_ι_apply` and
   `SymmetricAlgebra.algebraMapInv` to `affine-symmetric-action`, whose proof
   already explicitly uses these declarations. The target remains the
   actual associative, possibly noncommutative algebra `End(E)`.
3. Added `affineOrderedStep_tmul` to the step construction's projection API
   and suggested file. The pure-tensor formula specifies the actual
   associator/singleton/multiplication/cast composite for arbitrary Q.
   Contraction equations alone do not determine this map unless the dual
   separates the relevant tensors. Added a named non-example over ℤ with
   E=ℤ, Q=ℤ/2 and θ(e)=e⊗1: all dual contractions vanish but the degree-zero
   successor step is nonzero. The codomain is the native tensor power,
   rather than a replacement carrier with a stipulated property.
4. Added the actual ordered-square regression to the `affine-ordered-square`
   tests and suggested file. The incoming characteristic-two witnesses
   separately stated the matrix identities and a tensor-algebra word. They
   did not state the asserted failure on θ's ordered tensor map. The new
   example constructs θ on the four-basis module, computes θ²(1), states
   nonvanishing of the actual ordered square, and states vanishing of its
   entire symmetric projection. It uses native linear multiplication
   `LinearMap.mul′`, now cited in the baseline and relevant prerequisite
   lists. The main named tensor-algebra witness remains a smaller auxiliary
   statement; the ordered map is covered by this supplementary example,
   not by interpreting that auxiliary witness as the whole theorem.
5. Changed the degree-zero iterate test kind from `boundary` to `degenerate`
   and the ℤ/4 square-zero test kind from `boundary` to `computation`, the
   categories actually listed in PROTOCOL §12. This bounded correction does
   not certify the categories or contracts of uninspected tests elsewhere.
6. Repointed 26 Heuer citations in this inspected block to a new scoped
   published-HTML receipt, `Heuer25-review-4io8Xn`, using section locators
   rather than pagination not freshly verified. Earlier source receipts are
   preserved. Fresh EG author-copy and LZ v3 reading receipts are appended
   without overwriting the previous reviewer's receipts.

No declaration nodes were added or removed, no second key owner was created,
and no roadmap/reader/data file was edited. The reserved
`key/higgs-parameter-connections` node and its “Higgs and λ-connections”
planet remain unchanged. The checker counts **569 nodes, 541 API entries,
493 tests, six planets, 280 baseline declarations, five requests and 13
gaps**. The API/test counts are for definitions and constructions, as in the
checker; counting all node kinds gives 549 API entries and 508 tests.
`implementationStatus` remains `unchecked` for every node. The packet has no
final top-level `review` object.

### Mathematical inspection ledger

All identifiers in the following table are in H.0. A check establishes only
its stated algebraic route or identifies the remaining boundary; it does not
supply a global sheaf signature or verify later dependencies by implication.

| Index | Node | Check or remaining boundary |
| --- | --- | --- |
| 47 | `determinant-coordinate` | The line coefficient is tr(A), not det(A); λ is preserved. Empty rank gives the unit line. The actual local operator API and rank-zero/rank-one/scalar/no-converse tests were compared with the suggested signatures. Global top-wedge descent is outside this model. |
| 48 | `determinant-matrix` | The sole matrix entry is the defining trace. |
| 49 | `determinant-curvature` | Trace moves through the finite derivative sum; tr[A_i,A_j]=0. This yields the trace of the original curvature, with no rank-scaled λ. |
| 50 | `determinant-flat` | Zero original curvature implies zero scalar curvature. The converse is false: E12,E21 have a nonzero traceless commutator over ℚ. |
| 51 | `determinant-dual` | The coefficient is −tr(Aᵀ)=−tr(A), with unchanged parameter. |
| 52 | `determinant-tensor` | The Kronecker sum has trace rank(W)tr(A)+rank(V)tr(B), including zero ranks and all characteristics. No inverse of a rank is used. |
| 53 | `gauge-curvature` | With s′=Gs, expand A′=GAG⁻¹−λ(δG)G⁻¹. Differentiating GG⁻¹=1 cancels the mixed terms; commuting directions and δλ=0 leave GκG⁻¹. |
| 54 | `determinant-gauge-curvature` | Trace of unit conjugation preserves the scalar curvature, even though the determinant connection coefficient need not be invariant. |
| 55 | `determinant-derivation-rows` | Apply Leibniz to the permutation expansion and sum over the differentiated entry. The proof works for singular S and empty rank; δ of the integer sign is zero. |
| 56 | `determinant-row-action` | Multilinearity gives tr(A)det(S); off-diagonal row replacements have duplicate rows and vanish in characteristic two as well. The pinned Tau Ceti column-weight identity is only a near miss. |
| 57 | `determinant-gauge-matrix` | Trace of the gauge derivative correction agrees with det(G⁻¹)δ(det G) by the existing ColemanPowerSeries unit-Jacobi contract. Its statement and dual-number proof route were read in that supplier packet. This is a statement-fit check, not a fresh review of the supplier's implementation. Added det multiplicativity as a direct dependency. |
| 58 | `determinant-gauge` | Determinant of the unit matrix is a scalar unit via detMonoidHom; the rank-one gauge formula has the same negative logarithmic derivative term. |
| 59 | `determinant-alternating-operator` | For a row-family S, applying A to each column-vector row gives H=SAᵀ. Permutation expansion equates replacement-row and replacement-column sums; transposing reduces to the left row-action identity. No flatness or invertibility of S is needed. |
| 60 | `affine-contractions` | Contract the Q slot, then use the right tensor unit. This is a linear map from Q∨ to the actual composition algebra End(E), with no finite basis on E or Q. |
| 61 | `affine-symmetric-action` | TensorAlgebra.lift permits End(E). Pairwise commutation kills the SymRel congruence, so RingCon.liftₐ descends the action. Direct SymmetricAlgebra.lift would require a commutative target at this pin. Generator, uniqueness and zero-action APIs and the noncommuting/ambient-ideal tests retain this distinction. |
| 62 | `affine-symmetric-commuting` | An action sends commuting symmetric generators to commuting endomorphisms; the converse uses the preceding associative-target construction. |
| 63 | `symmetric-action-word` | The algebra map preserves the ordered list product; endomorphisms are not reordered. |
| 64 | `symmetric-action-morphism` | Generator intertwining extends by scalar, generator, sum and product induction, with linear scalar compatibility. Restriction to generators proves the reverse implication. |
| 65 | `ordered-coordinate-vanishing` | Finite local bases distinguish all ordered coefficient tuples, including degree zero. The later affine coordinate/vanishing statements were inspected here, but the global sheaf tensor-power, restriction and equality-detection inputs remain open E1 requests; its signature is explicitly omitted. |
| 66 | `augmentation-power-generators` | The built Hopf augmentation identifies I with the source symmetric algebra's degree-one span. Repeated span multiplication gives all length-N words; N=0 is the span of 1, hence the top ideal. |
| 67 | `augmentation-power-words` | α kills I^N exactly when it kills the length-N generators of that ideal. The kernel is formed in Sym(Q∨), not as an ambient ideal in End(E). |
| 68 | `ordered-augmentation-nilpotence` | On finite charts the ordered coefficient criterion and source ideal-word criterion have the same bound N, without projecting to Sym^N(Q). Global restriction/quotient-action coherence remains an E1 input and no actual global signature is present. |
| 69 | `truncated-symmetric-action` | Native Ideal.Quotient.liftₐ accepts the associative End(E) target when I^N lies in the kernel. Surjectivity gives uniqueness. N=0 is allowed exactly on the zero module; the nonzero scalar-unit action fails every positive bound. |
| 70 | `symmetric-projection-counterexample` | Over F₂, X²=Y²=0, XY=YX≠0, and θ²(1)=xy⊗(q₀⊗q₁+q₁⊗q₀)≠0. The symmetric quotient merges the mixed tuples and kills their sum; all cubic words vanish. Added an actual tensor-map example. The optional F₃ refinement in its proof outline has not been separately checked in this continuation. |
| 71 | `affine-contractions-reconstruction` | Finite basis of Q suffices to recover a tensor via its dual coordinates; E is arbitrary. The proof uses tensor induction and the native basis expansion, not dual separation for arbitrary Q. |
| 72 | `affine-ordered-square` | The associator composite applies θ again to E and places its newly created Q factor on the left. No integrability premise is needed. The E12/E21 order test distinguishes XY from YX; the new F₂ test detects loss under symmetric projection. |
| 73 | `affine-ordered-square-contraction` | Contracting by (v,w) gives a(v)a(w), with w applied first. |
| 74 | `affine-ordered-square-vanishing` | Reconstruct over the finite basis of Q; all pair coefficients vanish iff the actual ordered square vanishes. Arbitrary E is retained. |
| 75 | `affine-ordered-step` | Native singleton equivalence, tensor multiplication and 1+n=n+1 cast preserve the new factor on the left. Added the direct pure-tensor API and torsion-dual non-example. Naturality API points to the next uninspected node. |
| 76 | `affine-ordered-iterate` | I₀ is the tensor-unit isomorphism and I_(n+1)=S_n I_n, for arbitrary Q. The core unit/zero/scalar/ℤ4 tests match the local signatures. The many later naturality, flatness, base-change and mixed-word APIs/tests are listed but remain unverified pending their later nodes. |
| 77 | `affine-contractions-apply` | The right-unit contraction is the actual map value; no stronger dual-separation assertion is made. |
| 78 | `affine-contractions-zero` | Contracting a zero tensor map gives the zero endomorphism. |
| 79 | `affine-ordered-iterate-unit` | The degree-zero iterate sends e to e⊗1₀. Its empty pairing is id_E, including E=0. |
| 80 | `affine-ordered-iterate-succ` | The stated recurrence is the defining one, with the degree cast included in S. |
| 81 | `affine-ordered-step-zero` | Tensor mapping of the zero field gives the zero step. |
| 82 | `affine-ordered-step-add` | Tensor mapping is additive in θ; the fixed reassociation and degree equivalences preserve that equality. |
| 83 | `affine-ordered-step-contraction` | Tensor induction gives a(v) times the old tuple contraction in that order. Fin.prod_univ_succ is used only for the commutative scalar pairing; endomorphism products use List.prod. |
| 84 | `affine-ordered-iterate-contraction` | Induct with the unit case and successor contraction: pairing against an n-tuple equals its ordered contraction word. No integrability or finite basis is required. |
| 85 | `affine-tensor-power-coordinate` | On pure tuples the native tensor-basis coordinate and dual tuple pairing are the same product of scalar basis coordinates. Native tensor extensionality extends equality. |
| 86 | `affine-ordered-iterate-vanishing` | Reconstruct using the finite tensor basis of Q and arbitrary-E tensor-coordinate reconstruction. I_n=0 iff all ordered n-word coefficients are zero, including the unit case n=0. |
| 87 | `affine-ordered-iterate-zero-field` | At every positive degree the zero successor step kills the previous iterate. Degree zero remains the unit map. |

### Additional pinned baseline receipts

The original declaration array indices 15–104 and the added multiplication
map are grouped below. Each has a packet `independentCheck` receipt from this
session. Ambient hypotheses and statements were read, rather than inferred
from names or the supplied index.

| Pinned module | Independently read declarations |
| --- | --- |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean` | `Matrix.trace`, `Matrix.trace_mul_comm`, `AddMonoidHom.map_trace`, `Matrix.trace_transpose`, `Matrix.trace_neg`, `Matrix.trace_one`, `Matrix.trace_units_conj`, `Matrix.trace_fin_zero`, `Matrix.trace_fin_one`, `Matrix.trace_zero`, `Matrix.trace_add`, `Matrix.trace_sub`, `Matrix.trace_smul` |
| `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | `Matrix.trace_kronecker` |
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | `Matrix.detRowAlternating`, `Matrix.det_apply'`, `Matrix.det_updateRow_add`, `Matrix.det_updateRow_smul`, `Matrix.det_updateRow_eq_zero`, `Matrix.det_transpose`, `Matrix.det_mul`, `Matrix.detMonoidHom` |
| `Mathlib/Data/Matrix/Basic.lean` | `Matrix.scalar` |
| `Mathlib/Algebra/Group/Units/Hom.lean` | `Units.map`, `Units.coe_map` |
| `Mathlib/RingTheory/Derivation/Basic.lean` | `Derivation.map_intCast`, `Derivation.map_one_eq_zero` |
| `TauCeti/LinearAlgebra/Determinant.lean` | `Matrix.sum_det_updateRow_mul_row` |
| `Mathlib/LinearAlgebra/Dual/Defs.lean` | `Module.Dual` |
| `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | `TensorProduct.map`, `TensorProduct.map_add_right`, `TensorProduct.map_smul_right`, `TensorProduct.map_tmul`, `TensorProduct.congr`, `TensorProduct.congr_tmul`, `TensorProduct.map_add_left` |
| `Mathlib/LinearAlgebra/TensorProduct/Associator.lean` | `TensorProduct.rid`, `TensorProduct.assoc`, `TensorProduct.assoc_tmul` |
| `Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean` | `TensorAlgebra.lift`, `TensorAlgebra.hom_ext`, `TensorAlgebra.lift_ι_apply` |
| `Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean` | `TensorAlgebra.SymRel`, `SymmetricAlgebra.algHom`, `SymmetricAlgebra.induction`, `SymmetricAlgebra.algebraMapInv`, `SymmetricAlgebra.algebraMapInv_ι` |
| `Mathlib/RingTheory/Congruence/Basic.lean` | `RingCon.ringConGen_le` |
| `Mathlib/RingTheory/Congruence/Hom.lean` | `RingCon.liftₐ`, `RingCon.liftₐ_mk`, `RingCon.Quotient.hom_extₐ` |
| `Mathlib/RingTheory/Bialgebra/SymmetricAlgebra.lean` | `SymmetricAlgebra.counitAlgHom_eq` |
| `Mathlib/RingTheory/Ideal/Operations.lean` | `Ideal.span_mul_span`, `Ideal.pow_mem_pow` |
| `Mathlib/RingTheory/Ideal/Quotient/Operations.lean` | `Ideal.Quotient.liftₐ`, `Ideal.Quotient.liftₐ_comp` |
| `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean` | `TauCeti.HopfIdeal.mem_augmentation`, `TauCeti.HopfIdeal.augmentation_toIdeal` |
| `TauCeti/Algebra/HopfAlgebra/SymmetricAlgebra/Augmentation.lean` | `TauCeti.SymmetricAlgebra.augmentation_toIdeal_eq_span_range_ι` |
| `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | `Ideal.Quotient.mk_surjective`, `Ideal.Quotient.eq_zero_iff_mem` |
| `Mathlib/Algebra/Algebra/Operations.lean` | `Submodule.span_pow` |
| `Mathlib/Algebra/Group/Pointwise/Set/ListOfFn.lean` | `Set.mem_pow` |
| `Mathlib/RingTheory/Ideal/Span.lean` | `Ideal.span_le` |
| `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | `Matrix.toLin'` |
| `Mathlib/LinearAlgebra/Basis/Defs.lean` | `Module.Basis.sum_repr`, `Module.Basis.coord` |
| `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | `TensorProduct.induction_on`, `TensorProduct.tmul_sum`, `TensorProduct.sum_tmul` |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean` | `Basis.piTensorProduct`, `Basis.piTensorProduct_repr_tprod_apply` |
| `Mathlib/Data/Fin/Tuple/Basic.lean` | `Fin.append_left_eq_cons` |
| `Mathlib/Algebra/BigOperators/Fin.lean` | `Fin.prod_univ_succ` |
| `Mathlib/Algebra/Module/LinearMap/End.lean` | `Module.End.one_eq_id` |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` | `PiTensorProduct.ext`, `PiTensorProduct.induction_on`, `PiTensorProduct.subsingletonEquiv`, `PiTensorProduct.subsingletonEquiv_symm_apply'` |
| `Mathlib/LinearAlgebra/TensorPower/Basic.lean` | `TensorPower`, `TensorPower.algebraMap₀`, `TensorPower.algebraMap₀_one`, `TensorPower.cast`, `TensorPower.cast_tprod`, `TensorPower.gMul_def`, `TensorPower.gOne_def`, `TensorPower.mulEquiv`, `TensorPower.tprod_mul_tprod` |
| `Mathlib/LinearAlgebra/TensorPower/Pairing.lean` | `TensorPower.multilinearMapToDual_apply_tprod`, `TensorPower.multilinearMapToDual` |
| `Mathlib/Algebra/Algebra/Bilinear.lean` | `LinearMap.mul'` |

Important fit boundaries: the symmetric source algebra is commutative, so
Ideal.span_mul_span's two-sidedness condition is available; its endomorphism
target need not be commutative. TensorAlgebra.lift, RingCon.liftₐ and
Ideal.Quotient.liftₐ support that target. Submodule.span_pow is specialized
with the symmetric algebra itself as scalar ring; Set.mem_pow gives finite
ordered words. The Hopf augmentation citations supply the existing source
ideal, without replanning a second augmentation carrier. Native tensor
pairing requires no basis; only reconstruction and the converse vanishing
criterion require the stated finite coefficient basis.

### Source evidence for this continuation

- The [EG author PDF](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf)
  was freshly retrieved and its SHA-256 matches
  `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`.
  Complete selected printed pp.2, 5–6, 23–24 were read, including the short
  proofs of Lemmas 2.1 and 4.9. The fixed-determinant, trace-zero and parameter
  formulas motivate the determinant block; the arbitrary-ring matrix
  deductions are not alleged named results of the paper. No new published
  Acta collation or source-issue verdict is made.
- The [published Heuer HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4)
  was independently read at full Definition 1.2(2), Definition 4.1 and
  Remark 4.2. It explicitly retains the Tate-twisted coefficient sheaf and
  the contraction/symmetric image algebra. The general affine formulas in
  this block are authored deductions. The PDF endpoint yielded HTML in this
  session: no fresh PDF hash or printed pagination is claimed. This does
  not invalidate a previous worker's successful historical PDF retrieval.
- The [Liu–Zhu v3 PDF](https://arxiv.org/pdf/1602.06282v3) was freshly retrieved
  at matching SHA-256
  `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.
  The complete selected Theorem 2.1 and associated-graded paragraph on
  printed p.7, and Lemma 2.15 with its printed proof on pp.18–19, were read.
  Its logarithm/cyclotomic characteristic-polynomial argument motivates
  nilpotence. It does not state these arbitrary-N affine word criteria.

The parent HodgeStructures library audit was retained as the existing base;
the entire HodgeStructures and AdicSpaces upstream documents were read in this
session. No parent work was replanned. The selected local symmetric algebra
and tensor carriers build on the exact pinned libraries. The open E1 sheaf
interfaces are not discharged by their affine prototypes.

### Validation and resume boundary

The pinned-index packet checker reports **0 errors, 0 warnings**. The complete
edited suggested file was elaborated once with `lean-check` in the existing
shared build: **exit 0, 0 errors, 950 warnings, all `declaration uses sorry`**.
This is signature elaboration with admitted proofs. It is not an
implementation audit, and the Mathlib-only imports do not compile Tau Ceti's
pinned declarations. Suggested-file SHA-256:
`0f8be02bb30863536c9e3cff5eb2286ff34e155405b41b6a719056e7a4d4ccd1`.
Diagnostic-log SHA-256:
`629c9a44c5437fbc57b4b4b063933c983d0b91667f4ec63d8e54a18db59a5e9a`.
No language server, library build, cache download or second concurrent Lean
process was started. The check completed before submission.

A separate exhaustive F₂ finite computation checked X²=Y²=0, XY=YX≠0,
the nonzero xy coefficient of the ordered square, zero symmetric projection
on all four basis vectors, and vanishing of all eight words of length three.
It multiplies the exact 4×4 matrices in the suggested fixture modulo 2 and
groups the four ordered coefficient tuples by their degree-two monomials.
This supports the regression's mathematics; it does not prove its admitted
Lean statement. The torsion example follows from Hom_ℤ(ℤ/2,ℤ)=0 and the
native tensor-unit isomorphisms, which send the displayed step to reduction
modulo 2 and hence show it is nonzero.

Resume at **array index 88**, `H.0/affine-ordered-step-natural`, and at original
baseline index **105**, `mathlib:PiTensorProduct.map`. The appended
`LinearMap.mul′` baseline is already checked. Review later consumers before
turning the conditional prefix into verified node verdicts. Still complete
the roadmap definition, routed-source/coverage/duplication/planet screen,
unvisited sources, exact global suppliers, both source-issue version checks
and reader synchronization under an authorized follow-up. The inherited CR.1
and Rees gaps remain open. The 481 remaining nodes and 174 baseline statements
have no new independent verification from this continuation. Keep the packet
unpromoted until the complete independent review issues its final verdict.
