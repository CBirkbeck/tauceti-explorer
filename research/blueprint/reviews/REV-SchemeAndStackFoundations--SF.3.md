# Independent review of SF.3

Job: REV-SchemeAndStackFoundations--SF.3, issue #6285. Reviewer: Codex,
session codex-FSF6kP, 9 October 2026. The input was written by Claude Code,
session cc-7c6bac; this is an independent review.

**Verdict: needs_changes.** This review is finished. The reviewed plan needs a
revision for the three requirements below. Its mathematical corrections are
applied to the packet, and the clear typed-hypothesis errors are corrected in
the suggested file. The reader document was checked but is outside this
issue's editable deliverables; the handoff specifies its required changes.

## Counts and scope

| Item | Result |
|---|---|
| Nodes checked | 26: 21 corrected, 3 verified, 2 unverifiable |
| Nodes added or removed | 0; target-level granularity retained |
| Baseline citations | All 56 confirmed in 53 distinct source files; none removed |
| API items | 53 mathematical specifications; 20 have typed declarations, 33 remain comments |
| Unit tests | 25 mathematical specifications; 8 have typed examples, 17 remain comments |
| Planets | 6, retained |
| Requests | 16; two supplier requests added |
| Gaps | 3, with consuming nodes and exact missing statements |
| Coverage | SF.3 partial; packet partial; no closed stage claimed |

The eight typed examples are not eight complete matches to their packet
specifications. The trivial-bundle example tests rank one rather than all
ranks including zero; the field groupoid example tests its automorphism group
rather than an equivalence of groupoids; the non-discrete example tests
nontrivial automorphisms but not the additional all-modules counterexample.
These discrepancies are part of the suggested-file requirement.

The coverage decision is about missing interfaces and two unclosed arguments,
not about decomposing ordinary proofs into more lemma nodes. All 26 target
nodes remain present. No theorem is claimed to be implemented; every node
keeps implementationStatus unchecked.

## Requirements before acceptance

1. **Make the suggested file agree with the packet.** Give typed carriers,
   definitions, API signatures and examples using the existing module,
   invertible-sheaf, cohomology and abelian-variety carriers and the named
   roadmap suppliers. In particular, picardSheafPoints is currently an
   admitted type with an admitted group structure, without an equivalence to
   Picard-sheaf points or to Galois-fixed geometric line-bundle classes.
   Picard components likewise need their representing-functor, torsor and
   base-change interfaces. Comments naming missing declarations do not meet
   PROTOCOL section 13. A condition that cannot yet be expressed must be
   identified honestly rather than replaced by an unrelated proposition.
2. **Close the double-cover stack and component argument.** Specify the maps,
   norm trivializations and homotopy fibres in the Yun–Zhang sequence, and the
   duality theorem identifying the norm component group with the dual of
   ker(π*:J→J′). For a connected étale double cover this pullback kernel has
   order two. Do not turn the stack sequence into pointwise exactness or
   identify the full norm kernel with the connected image of 1−σ on J′.
   The complex component test is supported by Farkas §2, pp.5–6; that survey
   alone does not supply the general characteristic-different-from-two
   interface.
3. **Close the global Abel–Jacobi pairing comparison.** State the comparison
   between first-order deformation of the divisor P, the connecting map from
   O(P)/O to H¹(O), and the residue realization of coherent Serre duality.
   The calculation must hold at every geometric P. AlgebraicCurves Layer 9
   supplies residues, but its Layer 12E contract does not state this precise
   pairing compatibility. A calculation only in the one-dimensional tangent
   space at the chosen origin cannot identify a g-dimensional space of global
   forms.

## Per-node decisions

Every row refers to the suffix of SchemeAndStackFoundations:SF.3/. The packet's
review.checked entries give the machine-readable decisions.

| Node | Verdict | Finding and correction |
|---|---|---|
| nonsingular-projective-model | corrected | Checked the regular proper model and finite boundary. Added quasi-compactness to the Lean locally-finite-type hypotheses. The model's function-field, uniqueness and map signatures and three concrete examples remain missing. |
| curve-affine-or-projective | corrected | Relative normalization in Mathlib does not prove finiteness. Imported SF.0/nagata-normalization-finite and distinguished finite surjective affineness descent from the normalization construction. Added quasi-compactness in Lean. |
| genus-base-change | corrected | Smoothness survives every field extension. The normalization genus-drop example starts with a regular nonsmooth model over an imperfect field. Coherent cohomology and Euler characteristic now use the actual pinned carriers. |
| scheme-riemann-hurwitz | corrected | The torsion quotient of differentials cannot be used in locally-free degree additivity. Use Ω¹_X ≅ f*Ω¹_Y ⊗ O(R). The tame equality includes separability of the residue extension. |
| projective-line-characterization | corrected | Retained the hypotheses of the Stacks genus-zero characterization. The odd-degree smooth conic argument uses ω⁻¹ of degree two; the gcd-of-normal-points argument instead forms a degree-one Cartier divisor by Bezout. |
| genus-one-curves | verified | The degree-one section argument is valid. The γ₁ isomorphism can use the genus-one case of the Abel-map theorem without citing this node circularly. |
| line-bundle-degree-bounds | corrected | Made the family statement's proper, smooth, finite-presentation, geometrically connected and locally Noetherian hypotheses explicit. Fibrewise H¹ vanishing is the base-change input. |
| vector-bundle-degree | corrected | Replaced the claimed filtration after a finite constant extension by component multiplicities and a proper birational modification. Stacks 0AYW, 0AYU and 0DJ5 supply that route. Restricted the pullback formula to integral proper curves with the function-field degree. |
| vector-bundle-riemann-roch | verified | The Gorenstein vector-bundle formula follows from the degree definition and canonical-degree identity. The suggested theorem currently states only its smooth case, which the revision must reconcile. |
| curve-serre-duality | corrected | The vector-bundle derivation uses U∨⊗V to obtain Ext¹(U,V) ≅ Hom(V,U⊗ω)∨. Imported SF.2's relative dualizing module, Cohen–Macaulay Serre duality and smooth-curve comparison explicitly. |
| picard-cohomological | corrected | H¹ classifies torsors; a Čech calculation requires refinement of covers. The finite-Galois Hilbert-90 baseline does not alone supply the absolute-Galois comparison, so the exact SF.2 supplier is included. The affine Lean comparison now preserves multiplication. |
| class-group-picard-locally-factorial | corrected | Locally Noetherian Weil divisors have locally finite support. Tau Ceti's globally finite curve divisor carrier applies to the Noetherian curve specialization. Fixed fields/characteristics for the cone and cuspidal examples. |
| picard-excision-sequence | corrected | Used direct divisor restriction and extension for the Noetherian statement rather than treating general Chow localization as this theorem. Galois equivariance requires U defined over k. |
| picard-groupoid | corrected | Kept the core of invertible sheaves and its automorphisms. Required multiplicative π₀ compatibility in Lean and added a typed nontrivial-π₁ example. Descent and the graded groupoid remain comments. |
| line-bundle-norm | corrected | The determinant normalization is essential. Lean now includes locally finite presentation and proof of the actual constant finrank. The identity example uses the pinned finrank-of-isomorphism theorem. |
| picard-scheme-without-point | corrected | Corrected the torsor isomorphism to (a,t)↦(a⊗t,t) from J×Picᵈ to Picᵈ×Picᵈ. Lean Jac and Picᵈ now require dimension one. Their representing-functor interfaces remain missing. |
| picard-brauer-sequence | corrected | Distinguished Br′(X)=H²(X,G_m)_tors from the whole H² group. A rational section splits Brauer pullback and makes δ zero. Included exact SF.2 Leray, Galois-comparison, field-Brauer and Tsen suppliers; finite inseparable splitting degrees use the central-simple-algebra index argument. |
| rational-divisor-classes | corrected | Separated the square discriminant case, where K′=K and relative Brauer obstruction is zero, from the quadratic case. The arbitrary-field norm quotient comes from QuadraticFormInvariants Layer 7 rather than local ClassFieldTheory Layer 5. |
| degree-zero-class-comparison | verified | Actual degree-zero line bundles map to J(k) with obstruction δ. The period/index relation P∣I∣(2g−2) has the intended genus-one interpretation I∣0. |
| picard-stack-curve | corrected | Stated the stabilizer as the group scheme G_m; testing only a field's rational units can miss it. The eight APIs and four examples have no typed stack carrier. |
| universal-section-stack | corrected | Required coherent associativity/commutativity for addition and retained the jumping-rank test at degree 2g−2. Its eight APIs and four examples remain comments. |
| abel-maps-high-degree | corrected | A fibre is empty when h⁰=0; otherwise it is a linear system or a Brauer–Severi form. Pinned the Brauer sign convention and the nonnegative high-degree bound. Included the direct obstruction prerequisite and a non-effective degree-zero test. |
| picard-norm-sequence | unverifiable | Corrected pullback degree d↦nd, the two components of the full kernel, the connected Prym, and μ₂ automorphisms in the norm kernel stack. Precise stack/component closure is still required. |
| invariant-differentials | corrected | Dualizing the tangent space requires finite-dimensional cotangent space, e.g. local finite type. All global forms are determined by the identity for the proper geometrically integral abelian variety, not for every group variety. Added G_a as a counterexample. |
| abel-jacobi-differentials | unverifiable | Replaced the origin-only argument by the necessary all-point principal-part/residue calculation, and corrected the Milne locator to p.92. The coherent-pairing compatibility is not yet supplied. |
| tate-module-etale-h1 | corrected | Imported TraceFormula Layer 8 rather than constructing another Tate module. Twisted H¹ pullback corresponds to Picard pullback; untwisted H¹ pullback corresponds to the dual of norm. Pinned arithmetic Galois/q-power Frobenius on Tate modules versus geometric Galois Frobenius on cohomology. Typed integration signatures remain missing. |

The inseparable regression uses k=F_p(t), p odd, and y²=x^p−t. Its regular
proper model has genus (p−1)/2; after adjoining t^(1/p) the normalization is
rational. Flat base change preserves the arithmetic genus of the base-changed
scheme. This does not contradict the smooth base-change theorem.

## Suggested-file inventory

The following are the exact comment-only APIs. Names are abbreviated within
the Curve or Picard namespace used in the suggested file.

| Node | Missing typed APIs |
|---|---|
| Model (3) | nonsingularModel.functionField_iso, nonsingularModel.unique, nonsingularModel.map |
| Degree (6) | vectorBundleDegree_det, vectorBundleDegree_dual, vectorBundleDegree_twist, vectorBundleDegree_elementaryModification, vectorBundleDegree_baseChange, vectorBundleDegree_pullback |
| Groupoid (2) | picardGroupoid.isStack, gradedPicardGroupoid |
| Norm (6) | lineBundleNorm_pullback, lineBundleNorm_comp, lineBundleNorm_baseChange, lineBundleNorm_det, sectionNorm, lineBundleNorm_divisor |
| Picard stack (8) | picardStack, picardStack.degreeComponent, picardStack.aut_eq_units, picardStack.toPicardSheaf, picardStack.isGerbe, picardStack.split_of_point, picardStack.tensor, picardStack.baseChange |
| Section stack (8) | sectionStack, sectionStack.forget, sectionStack.zeroSection, sectionStack.eq_of_neg, sectionStack.symmetricPowerEquiv, sectionStack.isVectorBundle, sectionStack.add, sectionStack.add_symmetricPower |

The 17 comment-only tests are the model's affine-line, multiplicative-group and
imperfect-field examples; degree on P¹ and along a filtration; the groupoid of
P¹; the norm's square-map, field and determinant counterexample; all four
Picard-stack examples; and all four section-stack examples. Existing examples
with weaker statements must also be completed as described above.

Named theorem coverage needs the same audit. General Serre duality,
étale/fppf Picard cohomology, arbitrary-dimensional class groups, excision,
rational divisor classes, the degree-zero comparison, Abel maps, the norm
stack sequence, invariant differentials, Abel–Jacobi differentials and the
general Tate comparison are currently comments or only partial special cases.
The genus-zero ℓ-adic subsingleton theorem is a useful acceptance instance; it
is not the general comparison theorem.

The concrete improvements made here are: actual pinned cohomology and Euler
characteristic, quasi-compactness for finite type, dimension-one Picard
components/Jacobian, finite-locally-free norm hypotheses including actual
rank, multiplicative Picard comparisons, and the nontrivial-automorphism
example. The file elaborates with `sorry` warnings only. This verifies its
written signatures, not comments or theorems' proofs.

## Sources, baseline and suppliers

I read every cited mathematical locator and relevant proof rather than
inferring statements from theorem names. The six original external PDF hashes
were independently reproduced. Farkas's public Prym survey was added, with
URL and hash, only for the complex component regression. Stacks tag statements
and proofs were read at a04446e57ec1fbc252a871afcec7752fb2807b14. Source versions,
URLs and locators remain in the packet. This review does not claim to have
read every chapter of every source in full.

The 56 baseline declarations were independently read with their enclosing
section hypotheses. All 53 containing files matched the corresponding raw
files at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Each baseline entry now has a
reviewChecked record. No citation was removed or renamed. The important
boundaries are:

- Scheme.Hom.normalization supplies relative normalization, not Nagata
  finiteness, projective regular models or affineness descent.
- AlgebraicCycle has locally finite support. SchemeWeilDivisor has global
  finite support; its Weil–Cartier and line-bundle comparisons assume the
  Noetherian integral dimension-at-most-one/DVR conditions recorded in their
  source files. They do not supply the general locally factorial theorem.
- LineBundleClass is a commutative monoid at this pin. Tensor inverses and
  Picard comparisons are imported through JacobianChallenge's line-bundle
  interface, not falsely claimed as baseline group instances.
- Cohomology and eulerCharBelow already exist. The latter's short-exact
  additivity needs finite-dimensional H⁰,H¹ and vanishing H². Module.finrank
  alone is not a finiteness theorem.
- Mathlib's EllAdicCohomology is pro-étale cohomology. Classical comparison,
  smallness, continuous actions and finiteness are roadmap imports.
- Mathlib's Hilbert-90 declaration is for finite Galois extensions; absolute
  continuous-Galois comparison comes from SF.2. Algebra.norm is an algebra
  norm, not the sheaf-theoretic line-bundle norm.
- The function-field genus-zero/genus-one and degree-class declarations need
  exact constants and the divisor/place dictionary. They do not identify
  unrepresented rational Picard points with actual line bundles.

Supplier statements were checked in JacobianChallenge, AlgebraicCurves,
StableReduction, ClassFieldTheory and QuadraticFormInvariants, and the SF.0
and SF.2 packets. The more precise SF.2 packet already contains
site-leray-spectral-sequence, etale-galois-comparison,
hochschild-serre-galois-covering, brauer-field-comparison,
relative-dualizing-module, cm-serre-duality, curve-dualizing-comparison and
tsen-theorem. These remove the old alleged low-degree Leray gap. General
duality stays at SF.2; SF.3 supplies its curve consequences.

The two new requests are QuadraticFormInvariants Layer 7's general quadratic
cyclic-cohomology norm quotient and AlgebraicCurves Layer 9's residues for the
Abel–Jacobi calculation. The latter does not by itself close the scheme-level
pairing comparison. Existing requests were refined where necessary.

For PR 196 I read the relevant TraceFormula, ConstructibleEtale and
EllAdicRealization statements at commit
4bd72379658126cbe9be935656396f0c9dac4de0. TraceFormula Layer 8 is the torsion,
Tate-module and finite-level H¹-dual-comparison supplier; EllAdicRealization
Layers 4–6 provide the classical/pro-étale comparison and Layer 8 continuous
Galois/Frobenius actions. SF.3 owns the curve integration and convention
agreement, not those underlying theories.

## Source issues

E-SF3-1 is **rejected** as a source error. Milne, *Abelian Varieties* v2.00,
Part III, proof of Proposition 2.2, p.92, deliberately leaves the comparison
square as an exercise. A stated exercise is not an unnoticed false proof
step. The roadmap nevertheless has to prove the comparison, so its own gap
is retained with the all-point formulation. The old p.91 locator is corrected.

E-SF3-2 is **confirmed** for the author notes at that same locator. Their
argument extends determination of all global forms by their value at the
identity to arbitrary group varieties. On G_a=Spec k[t], the nonzero form
t dt vanishes at the identity, disproving that generalization. Translation
invariant forms are determined there; all global forms are so determined for
the proper geometrically integral abelian variety needed in the application.
Stacks 047I supplies the differential trivialization. The author version
history, course-notes landing page and errata page were checked; no matching
correction was listed. The finding is scoped to the notes read, not to the
separately published chapter. Both entries have explicit review verdicts and
own-word evidence; no source passage was copied into these deliverables.

## Red-team findings and ownership

- RT-AREA-algebraicgeometry/8: φ_L and symmetric-homomorphism/
  Néron–Severi theory stay at AbelianSchemesAndArithmeticModuli A2. SF.3 does
  not recreate that higher-dimensional abelian-moduli theory. NC.5 should
  import A2, not interpret the curve Picard comparisons as that theory.
- RT-AREA-algebraicgeometry/18: full coherent and vector-bundle duality is
  imported from SF.2; the exact Ext computation is corrected here. Relative
  moduli statements remain at their owners. The field curve case and its
  compatibility are SF.3's scope.
- RT-AREA-geomlanglands/15: BS17 route 3's G811, G814, G815 and G817 belong
  to the general positivity/Keel development at SF.5, with SF.3's curve
  degree and SF.4's geometric inputs. Artin contraction and gluing remain
  source gates there. A degree theorem on curves does not establish Keel's
  criterion. G819's Witt-specific contraction/relation comparison remains
  on the GS0 route. No general Keel proof was duplicated in this packet.

All six planet names describe central objects or named comparisons and fit the
limit: vector-bundle degree, curve Serre duality, Picard torsors, Picard–Brauer
obstruction, Abel maps and the Tate/H¹ comparison. They are proposed names,
not promoted atlas data.

## Validation and orchestrator actions

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.3.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.3.lean`: exit zero at the pinned shared build; only declaration-uses-`sorry` warnings. Available memory was above the required threshold before compilation.
- `git diff --check`: passed.

The errata-only checker is not applicable to a blueprint-v1 packet; its
wrapper/filename requirements are for separate errata-v1 deliverables. The
sourceIssues entries were reviewed directly and are part of the validated
blueprint packet.

The orchestrator should give the revision authority to edit the reader
document as well as the packet and suggested file. The required propagation
is detailed in this job's handoff. Supplier ownership is otherwise definite:
retain the moved-down field Picard torsors/Brauer obstruction, the BGW field
comparison, the SF.2 duality/Leray imports, the general quadratic norm-quotient
supplier and the TraceFormula Tate-module owner. The remaining question for
the revision is where to express the exact dual-component and coherent-pairing
interfaces within those existing owners; do not create a duplicate theory or
claim that the recorded gaps have already been closed.
