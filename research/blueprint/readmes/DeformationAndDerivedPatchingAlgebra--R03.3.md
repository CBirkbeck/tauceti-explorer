# Dimension, depth and complete intersections

Part R03.3 of **Commutative algebra for deformation theory and patching**. This follows the accepted P7 blueprint and covers the remaining commutative algebra of the layer. The packet is a complete planning pass; coverage is **planned**, with explicit open inputs. None of the declarations is implemented. The suggested file checks the signatures at Mathlib 082e2d3 and Tau Ceti f790474.

The objective is to pass from regular sequences and finite resolutions to the precise depth and complete-intersection statements used in patching. The useful conclusions depend on the actual map: a surjection, a finite map, a finite action, or a flat local map. They also depend on whether a module has full support. The reader must be able to see these hypotheses at the theorem boundary.

## Conventions and interfaces

Rings are commutative with identity. A local ring is nonzero. Finite means finitely generated as a module; a finite algebra map means finiteness of the target as a module over its source. Every pair of module actions has the stated scalar-tower compatibility. Write κ_R for the residue field, m_R for the maximal ideal, and R̂ and M̂ for the actual maximal-ideal adic completions.

Use Mathlib's list regularity. Weak regularity asks for injectivity on each preceding quotient; regularity also asks for the final quotient to be nonzero. In a Noetherian local ring, a finite list inside m_R is regular on a nonzero finite module precisely when it is weakly regular. The empty list is regular on a nonzero module. A list containing a unit cannot be regular.

Depth comes from `SchemeAndStackFoundations:SF.0/depth`: the extended-natural supremum of lengths of weakly regular lists inside the specified ideal. Thus depth of the zero module is infinity. For nonzero finite modules over a Noetherian local ring, maximal-ideal depth is finite and equals the first nonvanishing residue-field Ext degree. Support dimension is the native `Module.supportDim`, valued in extended naturals with a bottom element; its zero-module value is bottom. Native categorical projective dimension also has a bottom element for the zero module. Auslander–Buchsbaum therefore has a nonzero hypothesis and uses casts into the common extended-dimension carrier. No invariant is silently converted to a natural number.

The global module CM predicate, its zero case, localization, maximal-depth predicate, depth lemma and associated-prime bounds belong to `SchemeAndStackFoundations:SF.0/cohen-macaulay`. For a nonzero finite local module, CM equates depth with support dimension. It does not equate support dimension with the dimension of the entire ring. The suggested file carries exact supplier definition snapshots because these blueprints are not installed modules; assembly replaces those snapshots with imports.

Use the native ideal conormal I/I² (`Ideal.Cotangent`), with its R/I-module structure, rather than a new conormal carrier. Use native projective resolutions of module-category objects, actual linear maps and actual tensor products. In the tensor-depth signatures the S-module factor is written first; tensor symmetry identifies N⊗_R M with the document's M⊗_R N. Finite projective dimension is expressed by a natural upper bound on the native dimension, not by a new Tor predicate.

## Ownership and library boundary

The pinned audit leaves regular-sequence theory, separated adic filtrations, projective dimension, support dimension and the flat height formula in Mathlib. Reuse the native regular-quotient dimension drop and regular-list quotient projective dimension. Native completion is already flat, has the same residue field as a local ring, and identifies completion of a finite module with tensoring by the completed ring. These are baseline references rather than new targets.

| Supplier | Contract used here |
| --- | --- |
| `SchemeAndStackFoundations:SF.0` | Depth, CM/MCM, Cohen structure, catenarity, excellence, and finite maximal-depth freeness over regular local rings by parameter induction. |
| `DeformationAndDerivedPatchingAlgebra:P7` | Finite minimal representatives, homotopy equivalences, unit-pivot cancellation. |
| Accepted P7 nodes in `DeformationAndDerivedPatchingAlgebra:R03.3` | Ordinary adic Rees quotient, homogeneous pieces and projections, generator maps, Hilbert–Samuel strand, regular-parameter/CM statement. |
| `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd` | Koszul resolution of a regular list, conormal basis and flat base change. The converse local criterion and invertible generator change are requested. |
| `DeformationAndDerivedPatchingAlgebra:R03.1` | Arbitrary-residue-extension regular complete presentation diagram; the separable relative coefficient embedding does not suffice. |
| `DeformationAndDerivedPatchingAlgebra:R03.2` | Noetherianity and quotient comparison for completion, flat completed maps, finite-algebra and finite-module completion products. |
| Tau Ceti `ModularCurves`, layer 4D | Existing completion regularity/dimension, localization regularity and regularity descent contracts. |
| `DeformationAndDerivedPatchingAlgebra:R03.6` | Maximal-depth associated-prime and component-support consequences, including nearly-faithfulness under its own hypotheses. |

Current TauCetiRoadmap main, including the nine post-snapshot roadmaps, and current Tau Ceti were inspected. Current Tau Ceti's finite-type-field presentation dimension bounds do not supply these general local depth and CI contracts. The upstream regularity and finite-map ring miracle-flatness targets remain upstream imports. StablePeriodicCurve's hypersurface maximal-CM matrix-factorization targets do not supply the converse local-CI criteria here.

SF.0 currently has a `needs_changes` review. Its contracts are mathematical suppliers with open implementation/proof obligations. In particular, the P7 maximal-depth-freeness node uses bundled Auslander–Buchsbaum; this part instead uses SF.0's independent parameter induction. Assembly must redirect that P7 consumer before replacing the old bundle by the decomposed AB theorem. The resulting order is syzygy depth → independent maximal-depth freeness → finite pd over regular rings; AB itself uses minimal resolutions and Ext. It does not require finite pd over regular rings.

## Equidimensionality, associated primes and support

The imported CM contract gives minimal associated primes **of the module's support**. For a nonzero finite CM module M over local R, every associated prime p has dim(R/p)=dim Supp(M), and localization remains CM. When M has full support, the SF.0 contract gives equidimensionality of R and the localized dimension formula dim(R_p)+dim(R/p)=dim R. Full support is explicit in that conclusion. R03.6 owns the corresponding component and nearly-faithful conclusions; this part does not strengthen them by omission of a hypothesis.

For example, over k[[x,y]]/(xy), the module R/(x) is nonzero and CM but sees only one component. This prevents any blanket inference of full support from CM. Likewise the zero module is CM by the supplier convention, but it cannot enter a nonzero depth equality or faithfulness theorem.

Catenarity is imported rather than redefined: a Noetherian ring with a finite full-support CM module is universally catenary, in particular a CM ring is universally catenary. Arbitrary Noetherian local rings do not receive that conclusion. Complete Noetherian local rings are excellent by SF.0. This supplies excellence for geometric regular-locus consumers. The flat depth, CM and absolute CI formulas below require no additional excellence hypothesis. Excellence alone does not make a domain's completion a domain; the completed rings in the Kisin argument are domains because they are regular local rings. The domain theorem is recorded below with its actual tangent-cone dependency.


## Regular sequences and regular local presentations

### Regular-sequence ideals

Target: `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal`).

For an ideal I of R, IsRegularSequenceIdeal I means that there is a finite list f of elements of R with Ideal.ofList f = I and RingTheory.Sequence.IsRegular R f. This is a property of the ideal, not of a chosen presentation. No Noetherian assumption is built into the predicate. The final quotient is nonzero, so the unit ideal is excluded; over a nonzero ring the zero ideal is represented by the empty list.

Uses: DPA23.8.3 and R03.4 presentations — Recognize the kernel of a regular local presentation independently of its generators.; R03.6 quotient modules — Apply a finite regular sequence as a specialization ideal.

Planning API:

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.of_list` (constructor): A native regular list f supplies IsRegularSequenceIdeal (Ideal.ofList f).

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.ne_top` (characterisation): Every regular-sequence ideal is proper.

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.map_equiv` (functoriality): A ring equivalence carries regular-sequence ideals to regular-sequence ideals.

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.bot` (example): The zero ideal of a nonzero ring is a regular-sequence ideal.


Definition tests:

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_empty` (degenerate): The zero ideal of any nonzero ring satisfies the predicate.

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_unit` (non-example): The unit ideal never satisfies the predicate.

- `TauCeti.PatchingAlgebra.IsRegularSequenceIdeal.test_polynomial` (computation): In k[X], the ideal generated by X is regular; the singleton zero list is not regular.


Proof route: Use the native list regularity predicate and the native generated ideal; quantify over lists.

Direct prerequisites: `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Ideal.ofList`.

Source: stacks-more, §15.31, Lemmas15.31.7 and15.31.15, tags09CC and066A, pp.78–81 — Local minimal generators preserve the regular-sequence property; this motivates an ideal-level predicate.; stacks-dpa, §23.8, Lemma23.8.3, tag09Q1, p.20 — The kernel ideal, rather than a selected list, enters the local CI criterion.

Acceptance: The unit ideal is false, including in the zero ring.

### CM parameter elements

Target: `TauCeti.PatchingAlgebra.cm_parameter_element` (node `DeformationAndDerivedPatchingAlgebra:R03.3/cm-parameter-element`).

Let M be a nonzero finite Cohen–Macaulay module over a Noetherian local R. If x lies in the maximal ideal and dim Supp(M/xM)+1=dim Supp M, then multiplication by x on M is injective.


Proof route: Every associated prime of CM M has quotient dimension dim Supp M by the supplier CM contract. If x were in such a prime, native support_quotSMulTop would put its full-dimensional closed support in Supp(M/xM), contradicting the dimension drop. The native union-of-associated-primes characterization of zero divisors therefore makes x injective.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `SchemeAndStackFoundations:SF.0/depth`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Module.support_quotSMulTop`, `mathlib:biUnion_associatedPrimes_eq_zero_divisors`.

Source: stacks-algebra, §10.103, Lemmas10.103.2–10.103.3, tags00N4 and00N5, pp.246–247 — The dimension drop makes x regular; the induction exchanges two parameter elements.

Acceptance: For a zero-dimensional nonzero M no such x exists.

### Regular generators and codimension

Target: `TauCeti.PatchingAlgebra.regular_generators_iff_dimension_drop` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-generators-iff-dimension-drop`).

Let R be a Noetherian Cohen–Macaulay local ring, f a list in its maximal ideal and c=f.length. Then f is R-regular iff dim(R/Ideal.ofList f)+c=dim R. Equality is in extended dimension, with the finite local dimensions and proper ideal understood.


Proof route: The principal dimension bound forces every intermediate quotient to drop by exactly one when total drop is c. Apply cm-parameter-element inductively; the reverse implication is the native regular-sequence dimension drop.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Module.supportDim`, `DeformationAndDerivedPatchingAlgebra:R03.3/cm-parameter-element`, `mathlib:Module.supportDim_quotSMulTop_succ_eq_supportDim`, `mathlib:Module.supportDim_le_supportDim_quotSMulTop_succ`.

Source: stacks-algebra, §10.103, Proposition10.103.4, tag00N6, pp.247–248; §10.104, Lemma10.104.2, tag02JN, p.249 — Full codimension in a CM module forces regularity; the ring specialization gives the criterion.

Acceptance: No assertion is made for a non-CM ring or a list containing a unit.

### Minimal generators of regular ideals

Target: `TauCeti.PatchingAlgebra.regular_sequence_ideal_minimal_generators` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-minimal-generators`).

Over a Noetherian local R, suppose I is a regular-sequence ideal and f is a list of elements of I generating I whose residue classes form a basis of I/mI over the residue field. Then f is R-regular.


Proof route: A regular list gives a basis of I/I² by the supplier Koszul/conormal result, and hence of I/mI. The change matrix between two minimal generating lists is invertible over R by Nakayama; transport Koszul exactness under its exterior-power automorphism. Use the local equivalence between regularity and Koszul acyclicity from the same supplier contract; its precise comparison is requested.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal`, `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd`, `mathlib:RingTheory.Sequence.IsRegular`, `AdicEtaleGeometry:A3`.

Source: stacks-more, §15.31, Lemmas15.31.7 and15.31.15, tags09CC and066A, pp.78–81 — The local equivalence and invariance under changing generators prove this statement.

Acceptance: Redundant generators are deliberately excluded. In the suggested signature, generation together with list length equal to the native ideal spanFinrank expresses the same residue-basis condition.

### Reflection of regular sequences

Target: `TauCeti.PatchingAlgebra.regular_sequence_reflects_faithfully_flat` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-reflects-faithfully-flat`).

If S is faithfully flat over R, then for any R-module M and list f, f is M-regular iff its image list is regular on S⊗R M.


Proof route: Successive quotient modules commute with tensor product. Faithful flatness reflects the zero kernel of each multiplication map and the nonzero final quotient.

Direct prerequisites: `mathlib:RingTheory.Sequence.IsRegular.of_faithfullyFlat_of_isBaseChange`, `mathlib:RingTheory.Sequence.IsRegular`.

Source: stacks-algebra, §10.68, Lemma10.68.5, tag00LM; §10.39, faithful flatness criterion — This adds the converse to the pinned ascent API without redefining regularity.

Acceptance: For M=0 both regularity assertions are false.

### Faithfully flat descent of regular ideals

Target: `TauCeti.PatchingAlgebra.regular_sequence_ideal_faithfully_flat` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-faithfully-flat`).

For a flat local map of Noetherian local rings R→S and proper ideal I of R, I is a regular-sequence ideal iff IS is a regular-sequence ideal.


Proof route: Extend a minimal generating list of I; residue-field extension keeps it minimal for IS. Use regular-sequence-ideal-minimal-generators and faithful reflection for the reverse direction; native faithful-flat ascent proves the forward direction.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-minimal-generators`, `mathlib:RingTheory.Sequence.IsRegular.of_faithfullyFlat`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-reflects-faithfully-flat`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`.

Source: stacks-algebra, §10.68, Lemma10.68.5, tag00LM; DPA§23.7, Lemma23.7.6, tag09PX, pp.18–19 — A flat local map is faithful and regularity can be tested after its scalar change.

Acceptance: The adjective local is needed to turn flatness into faithful flatness here.

### Kernels between regular local rings

Target: `TauCeti.PatchingAlgebra.regular_surjection_kernel` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-surjection-kernel`).

If φ:R→S is a surjection of regular local rings, then ker φ is generated by a prefix of a regular system of parameters of R. In particular it is a regular-sequence ideal of length dim R−dim S.


Proof route: Lift a basis of the kernel of m_R/m_R²→m_S/m_S² and extend it to a basis of the source. The quotient by that prefix is regular of the same dimension as S, using the imported regular-parameter theorem. A nonzero kernel in a regular local domain strictly lowers dimension, so the remaining surjection is an isomorphism.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-domain`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal`, `mathlib:Ideal.Cotangent`.

Source: stacks-algebra, §10.106, Lemma10.106.4, tag00NR, pp.253–254 — Cotangent-space counting puts the kernel inside a regular parameter system.

Acceptance: A surjection between equal-dimensional regular local rings is an isomorphism.

### Changing regular local presentations

Target: `TauCeti.PatchingAlgebra.regular_presentation_change` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-presentation-change`).

Given surjections R→S→A with R and S regular local and A nonzero local Noetherian, ker(R→A) is a regular-sequence ideal iff ker(S→A) is.


Proof route: Choose a regular parameter prefix generating ker(R→S); lift minimal generators of ker(S→A). The concatenated list generates ker(R→A), and the dimension-drop criterion proves the equivalence; the prefix is already regular.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-surjection-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-generators-iff-dimension-drop`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-minimal-generators`.

Source: stacks-algebra, §10.135, Lemma10.135.6, tag00SE, pp.351–352 — This regular-to-regular comparison is the presentation-independence step.

Acceptance: This comparison does not apply when the intermediate source is merely CM.

## Finite resolutions and Auslander–Buchsbaum

The proof of AB is deliberately decomposed. Minimal finite free resolutions first detect the native pd by residue Ext. Bilinearity kills the maps on residue Ext induced by minimal matrices; the depth-one and strict-syzygy cases then give the induction. This avoids importing a Buchsbaum–Eisenbud determinant theorem as an unnamed step.

### Finite-free resolution bridge

Target: `TauCeti.PatchingAlgebra.finite_free_resolution` (node `DeformationAndDerivedPatchingAlgebra:R03.3/finite-free-resolution`).

For a finite module M over a Noetherian local R and n≥0, pd_R M≤n iff there is a native ProjectiveResolution of ModuleCat.of R M with every term finite free and all terms in degrees i>n zero.


Proof route: Repeatedly choose finite free covers; Noetherianity makes the kernels finite. Dimension shifting makes the nth kernel projective; finite projective modules over a local ring are free. Conversely use the exact native resolution and dimension shifting to bound the native projective dimension.

Direct prerequisites: `mathlib:CategoryTheory.projectiveDimension`, `mathlib:CategoryTheory.ProjectiveResolution`, `mathlib:CategoryTheory.projectiveDimension_le_iff`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:CategoryTheory.ShortComplex.ShortExact.projectiveDimension_X₃_eq_succ_of_not_projective`, `mathlib:IsProjective.iff_projective`, `mathlib:Module.Flat.of_projective`, `mathlib:Module.Finite.exists_fin'`.

Source: stacks-algebra, §10.109, Lemmas10.109.7–10.109.8, tags0CXE and0CXF, pp.262–263 — Finite syzygies and local freeness replace arbitrary projective terms.

Acceptance: For the zero module choose the zero complex; native pd is bottom, not zero.

### Minimal finite resolutions

Target: `TauCeti.PatchingAlgebra.minimal_finite_resolution` (node `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-finite-resolution`).

If R is Noetherian local, M finite and pd_R M≤n, there is such a finite-free native ProjectiveResolution with every differential image contained in m times its target.


Proof route: Reindex the finite chain complex as a cochain complex supported in degrees −n through 0. Apply the existing finite minimal representative and transfer its augmentation; the homotopy equivalence preserves H⁰=M. Reindex back to the native resolution, preserving the degree bound.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-free-resolution`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-complex`.

Source: stacks-algebra, §10.102, Lemma10.102.2, tag00MT, pp.243–244; §10.111, Proposition10.111.1, tag090V, pp.267–268 — Cancelling unit pivots yields the minimal resolution used in the depth argument.

Acceptance: A nonzero finite free M has a minimal resolution concentrated in degree zero.

### Projective dimension from a minimal endpoint

Target: `TauCeti.PatchingAlgebra.minimal_resolution_pd` (node `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-resolution-pd`).

For a nonzero finite M over a Noetherian local R, if a bounded finite-free minimal native resolution has highest nonzero term in degree n, then pd_R M=n.


Proof route: Apply Hom_R(−,κ) to the resolution. All differentials vanish, so Ext^n_R(M,κ) is the dual of the nonzero residual nth term. Nakayama makes this group nonzero. The resolution bound gives pd≤n and the Ext obstruction gives pd≥n.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-finite-resolution`, `mathlib:CategoryTheory.projectiveDimension_le_iff`, `mathlib:CategoryTheory.hasProjectiveDimensionLT_iff`.

Source: stacks-algebra, §10.109, Lemma10.109.9, tag065R, p.263; §10.111, Proposition10.111.1, tag090V, pp.267–268 — Ext detects the last term of a minimal finite resolution.

Acceptance: A nonminimal resolution can have a nonzero contractible tail and cannot satisfy this conclusion.

### Depth of nonzero finite free modules

Target: `TauCeti.PatchingAlgebra.depth_finite_free` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`).

For a nonzero finite free module F over a Noetherian local R, depth_R F=depth_R R.


Proof route: Choose a finite basis. A multiplication map on any successive quotient of F is the product of the corresponding multiplication maps on R. A nonempty basis detects injectivity and a nonzero quotient in both directions, so the sets of regular-list lengths agree.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `mathlib:RingTheory.Sequence.IsRegular`.

Source: stacks-algebra, §10.111, Proposition10.111.1, tag090V, pp.267–268, projective base case — The free base case has the same depth as R.

Acceptance: The nonzero hypothesis prevents depth(0)=infinity.

### Residue-field Ext is killed by the maximal ideal

Target: `TauCeti.PatchingAlgebra.ext_residue_annihilated` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ext-residue-annihilated`).

For local R, any R-module N, i≥0 and a∈m, scalar a kills every element of Ext^i_R(κ,N).


Proof route: The scalar action on Ext equals precomposition with multiplication by a on its first argument, using bilinearity and the identity class. Multiplication by a on κ is zero; therefore the induced scalar action is zero.

Direct prerequisites: `mathlib:CategoryTheory.Abelian.Ext.smul_eq_comp_mk₀`, `mathlib:CategoryTheory.Abelian.Ext.smul_comp`, `mathlib:CategoryTheory.Abelian.Ext.mk₀_smul`.

Source: stacks-algebra, §10.72, Lemma10.72.5, tag00LW, pp.172–173; §10.111, tag090V — This residue action supports the Ext proof of the stated depth formula.

Acceptance: No finiteness hypothesis on N is required.

### Minimal maps induce zero on residue Ext

Target: `TauCeti.PatchingAlgebra.ext_minimal_map_zero` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ext-minimal-map-zero`).

Let F and G be finite free modules over local R and u:F→G a linear map with image in mG. The induced map Ext^i_R(κ,F)→Ext^i_R(κ,G) is zero for every i.


Proof route: In finite bases every matrix entry belongs to m. Decompose u as a finite sum of a matrix unit times such a scalar. Functor additivity and ext-residue-annihilated kill every summand.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/ext-residue-annihilated`, `mathlib:CategoryTheory.Abelian.Ext.postcompOfLinear`.

Source: stacks-algebra, §10.111, Proposition10.111.1, tag090V, pp.267–268, minimality argument; §10.72, tag00LW — The source theorem supplies the depth target; this is an alternate Ext-based proof leaf.

Acceptance: For the identity on a nonzero free module the assertion is false, so minimality is substantive.

### Depth drop for a minimal free injection

Target: `TauCeti.PatchingAlgebra.minimal_free_injection_depth` (node `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-free-injection-depth`).

Suppose 0→K→F→M→0 is exact over Noetherian local R, K and F are nonzero finite free, and the first map has image in mF. Then depth_R R≥1 and depth_R M+1=depth_R R.


Proof route: Let d=depth R, finite by the imported depth bound. For d=0, injectivity of Hom(κ,K)→Hom(κ,F) contradicts its being zero on a nonzero source. For d>0 all Ext groups below d of K and F vanish, and Ext^d(κ,K) is nonzero. The zero map Ext^d(κ,K)→Ext^d(κ,F), together with the long exact sequence, makes Ext^(d−1)(κ,M) nonzero and all lower groups zero.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/ext-minimal-map-zero`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`, `SchemeAndStackFoundations:SF.0/depth`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₁'`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₂'`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₃'`.

Source: stacks-algebra, §10.72, Lemmas10.72.5–10.72.6, tags00LW and00LX, pp.172–173; §10.111, tag090V — The Ext characterization and the exact sequence prove the pd-one case without a determinantal criterion.

Acceptance: An injective minimal map of nonzero finite free modules cannot occur over a depth-zero ring.

### Depth in a short exact sequence with unequal depths

Target: `TauCeti.PatchingAlgebra.depth_syzygy_strict` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-syzygy-strict`).

In an exact sequence 0→K→F→M→0 of nonzero finite modules over a Noetherian local ring, if depth K<depth F, then depth K≥1 and depth M+1=depth K.


Proof route: Apply Ext(κ,−). Below depth K−1 both adjacent groups vanish. At that degree the connecting map identifies the first nonzero group of K with one for M; if depth K=0, left exactness gives a contradiction.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₁'`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₃'`.

Source: stacks-algebra, §10.72, Lemma10.72.6, tag00LX, p.173 — This is the equality case extracted from the three depth-lemma inequalities.

Acceptance: The strict inequality is essential.

### Auslander–Buchsbaum formula

Target: `TauCeti.PatchingAlgebra.auslander_buchsbaum` (node `DeformationAndDerivedPatchingAlgebra:R03.3/auslander-buchsbaum`).

Let R be a Noetherian local ring and M a nonzero finite R-module with finite projective dimension. Then pd_R M+depth_R M=depth_R R, using the native projective dimension and the imported depth. In particular pd_R M≤depth R.


Proof route: Induct on the native finite projective dimension p. The projective case is finite free and uses depth-finite-free. Use the first syzygy of a minimal resolution. At p=1 apply minimal-free-injection-depth. At p>1, induction gives depth K=depth R−p+1<depth F; depth-syzygy-strict gives the formula and the necessary nonnegative bound.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-finite-resolution`, `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-resolution-pd`, `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-free-injection-depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-syzygy-strict`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`, `mathlib:CategoryTheory.ShortComplex.ShortExact.projectiveDimension_X₃_eq_succ_of_not_projective`.

Source: stacks-algebra, §10.111, Proposition10.111.1, tag090V, pp.267–268 — The source proves the same formula by regular-element reduction; the packet uses the explicitly decomposed Ext proof.

Acceptance: The zero module is excluded: its native projective dimension is bottom and its depth is infinity. Over a regular local R, R/(f) for a regular list has pd=f.length and depth=dim R−f.length.

### Projective dimension after killing a common regular element

Target: `TauCeti.PatchingAlgebra.regular_quotient_pd_change` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-quotient-pd-change`).

Let R be Noetherian local, M nonzero finite with finite pd, and x∈m regular on both R and M. Then pd_(R/xR)(M/xM)=pd_R M.


Proof route: Tensor a minimal finite free resolution with R/xR. The two-term free resolution of R/xR shows that its positive Tor with M vanishes because x is M-regular. The resulting resolution is minimal and has the same nonzero endpoint by Nakayama. Apply minimal-resolution-pd.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-finite-resolution`, `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-resolution-pd`, `mathlib:RingTheory.Sequence.IsRegular`, `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd`.

Source: stacks-algebra, §10.102, Lemma10.102.6, tag00MZ, pp.244–245; §10.111, tag090V, p.268 — Reduction by a common regular element keeps the exact minimal resolution length.

Acceptance: This differs from pd_R(M/xM)=pd_R M+1, which is already native.

### Syzygy depth bounds

Target: `TauCeti.PatchingAlgebra.syzygy_depth_bound` (node `DeformationAndDerivedPatchingAlgebra:R03.3/syzygy-depth-bound`).

For a finite M over Noetherian local R, in a finite-free resolution the jth syzygy K_j has depth at least min(depth R, depth M+j), allowing K_j=0 with depth infinity.


Proof route: Apply the depth-lemma inequality to each finite syzygy exact sequence. Keep zero syzygies separate; their infinite depth satisfies the bound.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-free-resolution`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`.

Source: stacks-algebra, §10.104, Lemmas10.104.8–10.104.9, tags00NE and00NG, pp.250–251 — Successive finite free covers improve depth until maximal depth is reached.

Acceptance: For M with depth0, the first syzygy has depth at least min(depth R,1).

### Finite projective dimension over regular local rings

Target: `TauCeti.PatchingAlgebra.regular_local_finite_pd` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-finite-pd`).

For a regular local R of dimension d and every finite R-module M, pd_R M≤d.


Proof route: Take d finite free covers. The dth syzygy is zero or has depth at least d, using regular-local CM and the support bound. The imported freeness-at-maximal-depth theorem makes this syzygy free and terminates the resolution. This proof precedes AB and avoids using it circularly.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/syzygy-depth-bound`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`, `SchemeAndStackFoundations:SF.0/free-maximal-depth-regular-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-free-resolution`.

Source: stacks-algebra, §10.110, Proposition10.110.1, tag00O7, pp.265–266 — Finite MCM syzygies become free over a regular local ring.

Acceptance: The theorem includes M=0, with native pd bottom.

### Projective dimension of the residue field

Target: `TauCeti.PatchingAlgebra.regular_residue_pd` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-residue-pd`).

If R is regular local of dimension d, then pd_R κ=d.


Proof route: Choose the regular minimal parameter list of length d provided by P7. The native regular-quotient projective-dimension theorem gives pd of its quotient; identify that quotient with κ.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`, `mathlib:ModuleCat.projectiveDimension_quotient_eq_length`.

Source: stacks-algebra, §10.110, Proposition10.110.5, tag00OC, pp.266–267; §10.109, regular quotients — The residue field realizes the dimension bound.

Acceptance: For a field d=0 and pd κ=0.

### Depth bounds for submodules

Target: `TauCeti.PatchingAlgebra.depth_submodule_bound` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-submodule-bound`).

For a Noetherian local R, a finite module N and nonzero submodule M of N, dim Supp M≥depth N.


Proof route: Choose an associated prime of M; it is also associated to N by the native inclusion theorem. The imported associated-prime depth bound gives depth N≤dim R/p, and support dimension of M bounds dim R/p.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `mathlib:associatedPrimes.subset_of_injective`, `mathlib:Module.supportDim`.

Source: cg, §6, Lemma6.1, PDF pp.88–89 — The patching codimension argument uses this inequality; the finite ambient-module hypothesis is made explicit.; stacks-algebra, §10.72, Lemma10.72.9, tag0BK4, p.174 — The associated-prime bound is the underlying commutative-algebra input.

Acceptance: A full-dimensional submodule need not have full support over a reducible ring.

## Finite maps and finite actions

### Associated primes under scalar restriction

Target: `TauCeti.PatchingAlgebra.associated_primes_scalar_restriction` (node `DeformationAndDerivedPatchingAlgebra:R03.3/associated-primes-scalar-restriction`).

Let R→S be a ring map with S Noetherian and N an S-module, with the induced compatible R action. The R-associated primes of N are exactly the contractions of its S-associated primes. Neither a finite map nor a finite module is required.


Proof route: Contraction of the radical annihilator of an element commutes with scalar restriction, giving one inclusion. For an R-associated element z, let L be its cyclic S-submodule and I its S-annihilator. Its R-annihilator has the associated prime as radical. The native minimal-prime lifting theorem finds a minimal prime over I contracting to that prime. The Noetherian cyclic module S/I has that minimal prime associated; its injection into N and native associated-prime inclusion give the reverse inclusion.

Direct prerequisites: `mathlib:Ideal.exists_minimalPrimes_comap_eq`, `mathlib:Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes`, `mathlib:associatedPrimes.subset_of_injective`.

Source: stacks-algebra, §10.63, Lemmas10.63.11–10.63.13, tags05BW–05DZ, pp.149–150 — A cyclic submodule and a minimal prime over its annihilator give exact contraction of associated primes.

Acceptance: Do not drop Noetherianity of S: an infinitely generated square-zero-variable algebra over a field can have no associated primes.

### Depth under a local quotient

Target: `TauCeti.PatchingAlgebra.depth_surjective_local` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-surjective-local`).

For a surjective local map R→S of Noetherian local rings and finite S-module N, depth_R N=depth_S N.


Proof route: Lift every list in m_S to m_R. The successive quotient modules and multiplication maps agree under scalar restriction. Every list in m_R maps to one in m_S; compare the same sets of possible lengths, including infinity for N=0.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`.

Source: stacks-algebra, §10.72, Definition10.72.1, tag00LI, pp.172–173; §10.103, Lemma10.103.6, tag0AAD, p.248 — Scalar restriction through a surjection preserves depth and support dimension.

Acceptance: The same formula applies to the quotient through which an action factors.

### Depth over a finite semilocal algebra

Target: `TauCeti.PatchingAlgebra.depth_finite_semilocal` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-semilocal`).

Let R be Noetherian local, S a nonzero finite commutative R-algebra, and N a finite S-module. Then depth_(m_R)(N)=min over maximal q of S of depth_(S_q)(N_q), with infinity allowed at zero localizations.


Proof route: Contraction of associated primes detects depth zero on both sides. If the minimum is positive, finite prime avoidance chooses an element of m_R regular on N; quotient and induct on the finite minimum. If N=0 all depths are infinity. Localizations and quotient maps commute with the induction.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `mathlib:associatedPrimes.finite`, `mathlib:biUnion_associatedPrimes_eq_zero_divisors`, `DeformationAndDerivedPatchingAlgebra:R03.3/associated-primes-scalar-restriction`, `mathlib:Module.associatedPrimes.preimage_comap_associatedPrimes_eq_associatedPrimes_of_isLocalizedModule`, `mathlib:Ideal.subset_union_prime_finite`.

Source: stacks-algebra, §10.72, Lemma10.72.11, tag0AUK, p.174 — The proof uses contraction of associated primes and simultaneous regular elements.

Acceptance: For S a product of two finite local algebras the smaller localized depth is selected.

### Depth under a finite local map

Target: `TauCeti.PatchingAlgebra.depth_finite_local` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-local`).

For a finite local map R→S of Noetherian local rings and a finite S-module N, depth_R N=depth_S N.


Proof route: A finite algebra over a local ring is semilocal and every maximal ideal lies over m_R. In the local case there is one maximal ideal, so the finite semilocal formula has one term.

Direct prerequisites: `SchemeAndStackFoundations:SF.0/depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-semilocal`.

Source: stacks-algebra, §10.72, Lemma10.72.11, tag0AUK, p.174 — The finite semilocal formula specializes to a finite local map.

Acceptance: Flatness of R→S is not required.

### Finite image of a compatible ring action

Target: `TauCeti.PatchingAlgebra.finite_action_image` (node `DeformationAndDerivedPatchingAlgebra:R03.3/finite-action-image`).

Let S be Noetherian, M finite over S, and R an S-algebra acting on M compatibly. The image of the action R→End_S(M) is a finite S-algebra, canonically isomorphic to R/Ann_R M.


Proof route: The native Noetherian instance makes End_S(M) a finite S-module. The image is an S-submodule, so it is finite. The kernel of the action is exactly the native annihilator; apply the first isomorphism theorem.

Direct prerequisites: `mathlib:isNoetherian_linearMap`, `mathlib:Module.annihilator`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159 — The action image in an endomorphism ring is finite over the smaller ring.; kw2, §9.1.2, proof of Proposition9.2(II), author PDF p.83 — This finite action image is the dimension-counting step in ordinary patching.

Acceptance: R itself need not be finite over S unless its action is faithful.

### Depth under a finite action

Target: `TauCeti.PatchingAlgebra.depth_finite_action` (node `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-action`).

Let S→R be a local map of Noetherian local rings and M a nonzero R-module finite over S, with compatible actions. Then depth_S M=depth_R M.


Proof route: Put T=R/Ann_R M. It is local, finite over S and acts faithfully on M. Apply depth-finite-local to S→T and depth-surjective-local to R→T.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-action-image`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-surjective-local`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159; Stacks10.72.11 — The actual finite action, rather than an assumed finite map S→R, supplies the depth comparison.

Acceptance: The proof first passes to the action image; finiteness of the whole ring R is not assumed.

### Support dimension under a finite action

Target: `TauCeti.PatchingAlgebra.support_dimension_finite_action` (node `DeformationAndDerivedPatchingAlgebra:R03.3/support-dimension-finite-action`).

Under the hypotheses of depth-finite-action, dim Supp_S M=dim Supp_R M.


Proof route: The faithful finite action image T has support dimension dim T on the R side. The induced S/Ann_S M→T is injective integral finite. Integral dimension comparison identifies its dimension with dim T.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-action-image`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:Ideal.IsIntegral.comap_lt_comap`, `mathlib:Ideal.exists_ltSeries_of_hasGoingUp`, `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral`, `mathlib:Order.krullDim_le_of_strictMono`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159; Stacks10.112, integral dimension comparison — The dimension of the action image supplies the support comparison.

Acceptance: Both sides concern support, not the dimension of R.

### Freeness from a finite CM action

Target: `TauCeti.PatchingAlgebra.module_miracle_flatness` (node `DeformationAndDerivedPatchingAlgebra:R03.3/module-miracle-flatness`).

Let S be regular local and S→R a local map to Noetherian local R. If M is nonzero, finite over S, Cohen–Macaulay over R, and dim Supp_R M=dim S, then M is free over S.


Proof route: CM and the dimension hypothesis give depth_R M=dim S. The finite action formula gives the same depth over S. AB over the regular local S gives pd_S M=0; convert native categorical projectivity to module projectivity, then local finite freeness.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-action`, `DeformationAndDerivedPatchingAlgebra:R03.3/auslander-buchsbaum`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-finite-pd`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:IsProjective.iff_projective`, `mathlib:CategoryTheory.projectiveDimension_eq_zero_iff`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159 — This is the module freeness step isolated from the finite-map and faithfulness steps.; cg, §6, Lemmas6.1–6.2, PDF pp.88–89 — Depth and codimension enter derived patching separately.

Acceptance: This does not require R to be regular or finite over S.

### Faithfulness from an equal-dimensional action

Target: `TauCeti.PatchingAlgebra.equal_dimension_action_faithful` (node `DeformationAndDerivedPatchingAlgebra:R03.3/equal-dimension-action-faithful`).

Let S and R be Noetherian domains of the same finite Krull dimension d, and M a nonzero R-module finite and faithful over S under a compatible S→R action. Then the R action is faithful, and R is finite over S.


Proof route: The finite action image T contains S faithfully, so integral dimension comparison gives dim T=dim S=d. If ker(R→T) were nonzero, every prime chain in R/ker could be enlarged below by the zero prime of R, forcing dim T<dim R. Thus R→T is an isomorphism and R is finite over S.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-action-image`, `mathlib:Ideal.IsIntegral.comap_lt_comap`, `mathlib:Ideal.exists_ltSeries_of_hasGoingUp`, `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral`, `mathlib:Order.krullDim_le_of_strictMono`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159 — A finite action image with the full dimension cannot be a proper quotient of the domain.; kw2, §9.1.2, Proposition9.2(II), author PDF p.83 — The patching ring is identified with its faithful action image by this count.

Acceptance: The domain hypothesis cannot be replaced by equidimensionality alone.

### Kisin’s projective module lemma

Target: `TauCeti.PatchingAlgebra.kisin_projective_module` (node `DeformationAndDerivedPatchingAlgebra:R03.3/kisin-projective-module`).

Let S and R be regular Noetherian domains of the same finite Krull dimension d and φ:S→R a ring map. A nonzero R-module M finite projective over S is finite projective and faithful over R; φ is finite.


Proof route: A nonzero projective module over a domain is faithful. The equal-dimensional action theorem makes R finite over S and its action faithful. At q of R over p of S, use the finite completed-algebra product decomposition requested from R03.2: the completed q-localized module is a direct summand of the completed p-localized S-free module. The isolated completed module is nonzero (M was faithful over R) and finite projective, hence free, over the completed local base. That base is a regular local domain, so it acts faithfully on this module and injects into the finite completed target. Integral dimension comparison equates their local dimensions. Depth-finite-local and AB give freeness over the completed target; descent and local projectivity conclude.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/equal-dimension-action-faithful`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/auslander-buchsbaum`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-finite-pd`, `SchemeAndStackFoundations:SF.0/depth`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-domain`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`, `mathlib:Ideal.IsIntegral.comap_lt_comap`, `mathlib:Ideal.exists_ltSeries_of_hasGoingUp`.

Source: kisin, §3.3, Lemma3.3.4, printed p.1159 — The proof uses completions to isolate the q factor, followed by the depth formula and AB.; kw2, §9.1.2, Proposition9.2(III), author PDF p.83 — Kisin is applied after inverting p; it does not assert integral regularity.

Acceptance: Apply only to the regular rings occurring after the source’s scalar inversion.

## Flat local maps and completion

### The fibre injection criterion

Target: `TauCeti.PatchingAlgebra.flat_fibre_injection_cokernel` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-injection-cokernel`).

Let R→S be a local map of Noetherian local rings, N a finite S-module and P a flat R-module. For an R-linear map u:N→P, injectivity of its actual reduction N/m_R N→P/m_R P implies injectivity of u and R-flatness of coker u. P need not be finite or an S-module.


Proof route: R-flatness of P identifies its m_R-adic graded pieces with the corresponding coefficient pieces tensored with its closed fibre. Fibre injectivity therefore places ker(u) in every m_R-adic power of N. The native separatedness theorem for the finite S-module N kills this kernel, since m_R S lies inside m_S. Repeat the injectivity argument over R/a for each ideal a: P/aP is flat, the closed fibre map is unchanged, and N/aN is finite over S/aS. The resulting injection N/aN→P/aP makes the cokernel R-flat by the ideal tensor criterion.

Direct prerequisites: `mathlib:IsHausdorff.of_isLocalRing`, `mathlib:Module.Flat`.

Source: stacks-algebra, §10.99, Lemma10.99.1, tag00ME, pp.231–232 — Adic separatedness lifts fibre injectivity, and reduction by every ideal tests cokernel flatness.

Acceptance: The finite S-module and local-map conditions supply separatedness; injectivity on a fibre alone does not suffice for arbitrary modules.

### Lifting a fibre nonzerodivisor

Target: `TauCeti.PatchingAlgebra.flat_fibre_regular_lift` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-regular-lift`).

Let R→S be a local map of Noetherian local rings, N finite over S and flat over R. If y∈m_S is injective on N/m_R N, then y is injective on N and N/yN is R-flat.


Proof route: Use the local flatness criterion for the map N→N: injectivity on the closed fibre lifts through all m_R-adic quotients. The separatedness supplied by the native Krull intersection theorem makes the kernel zero. The same criterion identifies its cokernel as R-flat.

Direct prerequisites: `mathlib:IsHausdorff.of_isLocalRing`, `SchemeAndStackFoundations:SF.0/depth`, `mathlib:Module.Flat`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-injection-cokernel`.

Source: stacks-algebra, §10.99, Lemmas10.99.1–10.99.2, tags00ME–00MF, pp.231–232; §10.163, Lemma10.163.1, tag0338, pp.452–453 — This is the regular-element lift used in the flat depth induction.

Acceptance: Finiteness over S is required; arbitrary flat R-modules do not suffice.

### Depth comparison for a depth-zero flat fibre

Target: `TauCeti.PatchingAlgebra.flat_depth_zero_fibre` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-depth-zero-fibre`).

For local Noetherian R→S, finite R-module M and finite S-module N flat over R, assume M,N nonzero and depth_(S/m_R S)(N/m_R N)=0. Then depth_S(M⊗R N)=depth_R M.


Proof route: Induct on depth_R M by a regular element of m_R; R-flatness makes it regular on the tensor product, and both depths fall by one. At depth_R M=0 embed κ_R into M using its socle. Tensor injectivity embeds N/m_R N, whose depth-zero socle gives depth zero of the tensor product.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-regular-lift`, `SchemeAndStackFoundations:SF.0/depth`, `mathlib:biUnion_associatedPrimes_eq_zero_divisors`, `mathlib:Module.Flat`.

Source: stacks-algebra, §10.163, Lemma10.163.1, tag0338, pp.452–453, depth-zero fibre case — A socle injection supplies the base case of the tensor depth formula.

Acceptance: The tensor product is nonzero by localness, fibre nonvanishing and Nakayama.

### Depth formula for flat tensor products

Target: `TauCeti.PatchingAlgebra.flat_local_tensor_depth` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-tensor-depth`).

Let R→S be a local map of Noetherian local rings, M a nonzero finite R-module and N a nonzero finite S-module flat over R. Then depth_S(M⊗R N)=depth_R M+depth_(S/m_R S)(N/m_R N).


Proof route: Induct on the finite depth of N/m_R N. Lift a first fibre regular element with flat-fibre-regular-lift. The local flatness criterion makes the same y regular on M⊗N and identifies its quotient with M⊗(N/yN). Apply induction and the regular-element depth drop.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-regular-lift`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-depth-zero-fibre`, `SchemeAndStackFoundations:SF.0/depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-surjective-local`, `mathlib:Module.Flat`.

Source: stacks-algebra, §10.163, Lemma10.163.1, tag0338, pp.452–453 — The statement keeps both coefficient modules and the closed-fibre module explicit.

Acceptance: Taking M=R and N=S gives the ring depth formula; this is not a formula for arbitrary nonflat maps.

### Depth of a flat local ring map

Target: `TauCeti.PatchingAlgebra.flat_local_ring_depth` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ring-depth`).

For a flat local map of Noetherian local rings R→S, depth S=depth R+depth(S/m_R S).


Proof route: Set M=R, N=S, and use the unit tensor equivalence.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-tensor-depth`.

Source: stacks-algebra, §10.163, Lemma10.163.2, tag0337, p.453 — This is the ring specialization of the tensor formula.

Acceptance: If the closed fibre is a field, the two ring depths agree.

### Cohen–Macaulayness under a flat local map

Target: `TauCeti.PatchingAlgebra.flat_local_cm` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-cm`).

For a flat local map of Noetherian local rings R→S, S is Cohen–Macaulay iff R and S/m_R S are Cohen–Macaulay.


Proof route: The two depths add by flat-local-ring-depth; the two dimensions add by the native going-down height formula at the maximal ideals. Each depth is at most its dimension. Equality of the sums holds exactly when equality holds in both factors.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ring-depth`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `mathlib:Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, `mathlib:IsLocalRing.maximalIdeal_height_eq_ringKrullDim`.

Source: stacks-algebra, §10.163, Lemma10.163.3, tag045J, p.453; §10.112, Lemma10.112.7, tag00ON, p.269 — Flatness supplies the dimension equality; no excellence hypothesis is needed.

Acceptance: A base CM ring does not make S CM without the fibre condition.

### Depth under local completion

Target: `TauCeti.PatchingAlgebra.completion_depth` (node `DeformationAndDerivedPatchingAlgebra:R03.3/completion-depth`).

For Noetherian local R and nonzero finite module M, depth_(R̂)(M̂)=depth_R M, for maximal-ideal adic ring and module completions.


Proof route: Use native ofTensorProductEquivOfFiniteNoetherian, native flat_of_isNoetherian, and the native local completion map. Only Noetherianity of the completed ring remains a supplier request. The closed fibre of the completed ring is κ_R of depth zero; the tensor formula proves equality.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-tensor-depth`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:AdicCompletion.residueField_map_bijective`.

Source: stacks-more, §15.44, Lemma15.44.3, tag07NW, p.111; Algebra§10.97, Lemmas10.97.1–10.97.3 — The comparison uses the actual completion map and finite-module scalar change.

Acceptance: The theorem compares depths over different rings; it does not use a bare identification of carriers.

### Freeness from a free closed fibre

Target: `TauCeti.PatchingAlgebra.relative_flat_module_free` (node `DeformationAndDerivedPatchingAlgebra:R03.3/relative-flat-module-free`).

Let R→S be a flat local map of Noetherian local rings, N a finite S-module flat over R. If N/m_R N is free over S/m_R S, then N is free over S.


Proof route: Lift a finite fibre basis to N. Nakayama gives a surjection S^r→N with finite kernel K. R-flatness of N preserves the kernel exact sequence on tensoring with κ_R. The fibre map is an isomorphism, so K/m_R K=0. Since m_R S⊆m_S, Nakayama gives K=0.

Direct prerequisites: `mathlib:Module.Finite.exists_fin'`, `mathlib:Module.Flat`.

Source: stacks-algebra, §10.99, Lemma10.99.4, tag00MH, p.232; §10.20, Nakayama — The finite cover and exact fibre comparison give the module form of the local flatness argument.

Acceptance: N=0 is permitted and is free with empty basis.

### Finite pd across a regular closed fibre

Target: `TauCeti.PatchingAlgebra.relative_flat_module_pd` (node `DeformationAndDerivedPatchingAlgebra:R03.3/relative-flat-module-pd`).

For a flat local Noetherian map R→S with regular closed fibre of dimension d, every finite S-module N flat over R has pd_S N≤d.


Proof route: Take d finite S-free covers. Their kernels stay R-flat, since the successive quotient modules are R-flat. On the closed fibre these become an exact free resolution; its dth syzygy is free over the regular local closed fibre. Apply relative-flat-module-free to the dth syzygy and terminate.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/relative-flat-module-free`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-finite-pd`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-free-resolution`, `mathlib:Module.Flat`.

Source: stacks-more, §15.79, Lemma15.79.6, tag09PC, pp.203–204, tor-amplitude[0,0] module case — This isolates the flat-module case used by the CI proof and avoids a general Tor transfer predicate.

Acceptance: The dimension bound is the closed-fibre dimension, not dim R.

## Absolute complete intersections

These are absolute ring predicates. A selected map from a prescribed coefficient ring need not be a regular presentation, and no relative lci-morphism predicate is introduced. Completion belongs to the local CI definition; the non-complete regular-presentation predicate is a separate auxiliary object.

### Regular local presentations

Target: `TauCeti.PatchingAlgebra.HasRegularSequencePresentation` (node `DeformationAndDerivedPatchingAlgebra:R03.3/has-regular-sequence-presentation`).

For a commutative ring A, HasRegularSequencePresentation A means that there exist a commutative ring S in the same universe, an IsRegularLocalRing S instance and a surjective ring homomorphism S→A whose kernel is a regular-sequence ideal. The source is not required to be complete.

Uses: DPA23.8.1 — Express existence before proving independence of the regular presentation.; R03.4 complete deformation rings — Separate regular source, presentation map and equation ideal.

Planning API:

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.of_regular` (constructor): Every regular local ring has the identity regular presentation.

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.nontrivial` (instance): A ring with such a presentation is nonzero.

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.congr` (functoriality): Ring equivalences preserve existence of a regular presentation.


Definition tests:

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_field` (degenerate): Every field has such a presentation with empty regular list.

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_dual_numbers` (computation): k[[X]]/(X²) has such a presentation, although it is not regular.

- `TauCeti.PatchingAlgebra.HasRegularSequencePresentation.test_zero_ring` (non-example): A zero ring has no such presentation.


Proof route: Quantify over actual bundled commutative rings and actual ring maps; retain the regularity instance, surjectivity and exact kernel.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal`, `mathlib:IsRegularLocalRing`.

Source: stacks-dpa, §23.8, introduction and Lemma23.8.1, tag09PZ, pp.19–20 — The complete ring admits a regular presentation whose kernel is the CI condition.

Acceptance: The empty kernel of an identity presentation is included.

### Absolute local complete intersections

Target: `TauCeti.PatchingAlgebra.IsCompleteIntersection` (node `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`).

For a local commutative ring A, IsCompleteIntersection A means IsNoetherianRing A and HasRegularSequencePresentation (AdicCompletion m_A A). This absolute local notion places no regularity requirement on a prescribed coefficient map.

Uses: DPA23.8.3–23.8.9 — Make local criteria independent of the chosen regular presentation.; R03.4 and R03.6 — Supply CM quotients and flat base/fibre tests for patching rings.

Planning API:

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.isNoetherian` (projection): Local CI includes Noetherianity.

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.completion_presentation` (projection): Local CI supplies a regular presentation of the actual completion.

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.congr` (functoriality): A ring equivalence between local rings preserves local CI.


Definition tests:

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.test_field` (degenerate): A field is local CI.

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.test_hypersurface` (computation): k[[X]]/(X²) is local CI and is not regular.

- `TauCeti.PatchingAlgebra.IsCompleteIntersection.test_non_ci_artin` (non-example): k[[X,Y]]/(X,Y)² is CM of dimension zero but is not local CI.


Proof route: Use the actual maximal-ideal completion, not A itself, in the existence predicate.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/has-regular-sequence-presentation`, `mathlib:AdicCompletion`.

Source: stacks-dpa, §23.8, Definition23.8.5, tag09Q3, pp.21–22 — Local CI is defined through a regular presentation of the completion.

Acceptance: The completion clause is retained even when a particular deformation ring is already complete.

### Local CI for a ring

Target: `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection` (node `DeformationAndDerivedPatchingAlgebra:R03.3/locally-complete-intersection`).

For a commutative ring A, IsLocallyCompleteIntersection A means IsNoetherianRing A and, for every prime p, IsCompleteIntersection (Localization.AtPrime p). This is an absolute ring predicate, distinct from an lci morphism relative to a base.

Uses: DPA23.8.7–23.8.8 — Use maximal-prime detection and finite-type compatibility.; Patching after scalar inversion — Treat nonlocal generic-fibre rings prime by prime.

Planning API:

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.isNoetherian` (projection): The predicate includes Noetherianity.

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.atPrime` (projection): Every prime localization is local CI.

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.congr` (functoriality): Ring equivalences preserve the global predicate.


Definition tests:

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_zero_ring` (degenerate): The zero ring is globally local CI, as it has no primes.

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_polynomial` (computation): A polynomial ring k[X] is globally local CI.

- `TauCeti.PatchingAlgebra.IsLocallyCompleteIntersection.test_bad_factor` (non-example): The product k × k[[X,Y]]/(X,Y)² is not globally local CI; one field factor does not suffice.


Proof route: Quantify over native PrimeSpectrum and its native localizations, keeping the Noetherian condition explicit.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `mathlib:Localization.AtPrime`.

Source: stacks-dpa, §23.8, Definition23.8.5, tag09Q3, pp.21–22 — The global predicate asks for local CI at every prime.

Acceptance: The zero ring satisfies the global predicate vacuously; it is not a local ring.

### Independence of a regular presentation

Target: `TauCeti.PatchingAlgebra.complete_presentation_independence` (node `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`).

For a complete Noetherian local A and any surjection φ:S→A from a regular local S, HasRegularSequencePresentation A iff ker φ is a regular-sequence ideal.


Proof route: Complete S and compare kernels under finite-module exact completion and faithful regular-sequence descent. Choose a Cohen power-series presentation of A and lift it to Ŝ using the requested formal lifting theorem; add variables mapping to generators of ker(Ŝ→A). Apply regular-presentation-change to the resulting common regular source and its two regular quotients.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/has-regular-sequence-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-presentation-change`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-faithfully-flat`, `SchemeAndStackFoundations:SF.0/cohen-structure`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Source: stacks-dpa, §23.8, Lemma23.8.1, tag09PZ, pp.19–20 — Completion plus a common formally smooth regular presentation proves independence.

Acceptance: The source S need not be complete; the target A must be complete for this statement.

### CI criterion for a regular local presentation

Target: `TauCeti.PatchingAlgebra.ci_regular_quotient` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`).

For regular local R and ideal I⊆m_R, the quotient R/I is local CI iff I is a regular-sequence ideal.


Proof route: Identify completion of R/I with R̂/I R̂ and use regularity of R̂ from upstream ModularCurves4D. Apply complete-presentation-independence to that actual quotient map and faithful-flat descent of regular ideals.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-faithfully-flat`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Source: stacks-dpa, §23.8, Lemmas23.8.2–23.8.3, tags09Q0 and09Q1, p.20 — The regular quotient criterion is the precise equation test needed in patching.

Acceptance: The condition I⊆m makes the quotient nonzero.

### Lifting conormal generators

Target: `TauCeti.PatchingAlgebra.conormal_generators_lift` (node `DeformationAndDerivedPatchingAlgebra:R03.3/conormal-generators-lift`).

For Noetherian local R, I⊆m_R, and elements f₁,…,f_c in I, if their classes generate the native conormal I/I² over R/I, then they generate I.


Proof route: Surjectivity onto the conormal says I=(f)+I². Since I⊆m, I²⊆mI. Apply Nakayama to the finite module I/(f).

Direct prerequisites: `mathlib:Ideal.Cotangent`, `mathlib:Ideal.toCotangent_surjective`.

Source: stacks-dpa, §23.8, Lemma23.8.3, tag09Q1, p.20 — Nakayama lifts conormal generators to equations of the ideal.

Acceptance: The analogous claim for an arbitrary nonlocal ideal is false.

### The conormal generator criterion

Target: `TauCeti.PatchingAlgebra.ci_conormal_criterion` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ci-conormal-criterion`).

Let R be regular local, I⊆m_R, and c≥0 with dim(R/I)+c=dim R. Then R/I is local CI iff its native conormal I/I² can be generated by at most c elements over R/I.


Proof route: Use conormal-generators-lift to get at most c equations; the dimension bound forces exactly c for a minimal list. Use regular-generators-iff-dimension-drop for that list. Conversely the imported Koszul conormal basis of a regular list has rank c.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.3/conormal-generators-lift`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-generators-iff-dimension-drop`, `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd`.

Source: stacks-dpa, §23.8, Lemma23.8.3, tag09Q1, p.20, mathematical conditions(1)–(3) — Only the three stated mathematical conditions are used; the editorial fourth item is not a criterion.

Acceptance: Freeness of an arbitrary conormal module, without this regular source and codimension, is not the assertion.

### Conormal injection from finite Tor dimension

Target: `TauCeti.PatchingAlgebra.finite_tor_conormal_injection` (node `DeformationAndDerivedPatchingAlgebra:R03.3/finite-tor-conormal-injection`).

Let R be Noetherian local and I⊆J⊆m_R. If R/J has finite projective dimension over R/I, then I∩m_R J=m_R I, equivalently I/m_R I→J/m_R J is injective.


Proof route: If a nonzero class f in I/mI maps to zero, choose I′ containing mI with I/I′ spanned by f. R/I′→R/I is a principal square-zero extension; writing f as a relation in mJ gives a nonnilpotent obstruction class. The exact missing Tate-resolution obstruction is recorded as a gap, not assumed as an unproved generic vanishing theorem.

Direct prerequisites: `mathlib:Ideal.Cotangent`.

Source: stacks-dpa, §23.7, Lemmas23.7.3–23.7.4, tags09PU and09PV, pp.17–18 — The square-zero obstruction forces unbounded even Tor if the conormal map is not injective.

Acceptance: For the finite module R/J over Noetherian local R/I, finite Tor dimension and finite pd agree. This finite-pd formulation uses the native dimension carrier.

### Nested ideals of finite Tor dimension

Target: `TauCeti.PatchingAlgebra.nested_regular_ideals` (node `DeformationAndDerivedPatchingAlgebra:R03.3/nested-regular-ideals`).

Let R be Noetherian local, I⊆J⊆m_R, J a regular-sequence ideal, and R/J of finite projective dimension over R/I. Then I is a regular-sequence ideal and J/I is a regular-sequence ideal in R/I.


Proof route: Extend a residue basis of I/mI to one of J/mJ, using the injection. Lift the basis so its prefix generates I. The full list is regular by regular-sequence-ideal-minimal-generators; its prefix and the quotient tail are regular by the native list recursion.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-tor-conormal-injection`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-minimal-generators`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal`.

Source: stacks-dpa, §23.7, Lemma23.7.5, tag09PW, p.18 — The conormal injection permits a minimal generator list with the desired prefix.

Acceptance: Both ideals are proper and the quotient ideal is the actual image.

### Regular ideals across a flat regular fibre

Target: `TauCeti.PatchingAlgebra.flat_regular_fibre_ideals` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-regular-fibre-ideals`).

Let R→S be flat local Noetherian with regular closed fibre, I⊆m_R, J⊆m_S and IS⊆J. Assume the induced quotient map R/I→S/J is flat. Then J is a regular-sequence ideal iff I is a regular-sequence ideal and J/IS is one in S/IS.


Proof route: Apply relative-flat-module-pd to R/I→S/IS and N=S/J: the hypothesis is flatness of the actual induced quotient map, and the closed fibre is the same regular ring. Use nested-regular-ideals in S with IS⊆J. Faithful-flat descent gives regularity of I. In the converse direction concatenate a regular generator list of IS and a lifted regular list for J/IS.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/nested-regular-ideals`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-faithfully-flat`, `AdicEtaleGeometry:A3/koszul-regular-sequence-fpd`, `DeformationAndDerivedPatchingAlgebra:R03.3/relative-flat-module-pd`.

Source: stacks-dpa, §23.7, Lemma23.7.6, tag09PX, pp.18–19 — The Tor transfer and nested-ideal lemma give the two regular ideals.

Acceptance: The closed fibre must be regular; CM alone does not supply this transfer.

### Avramov’s flat local CI criterion

Target: `TauCeti.PatchingAlgebra.flat_local_ci` (node `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ci`).

For a flat local map R→S of Noetherian local rings, S is local CI iff R and S/m_R S are local CI.


Proof route: Complete both rings and use the requested regular presentation diagram R₀→S₀ with flat regular closed fibre and horizontal quotient maps. For kernels I and J use flat-regular-fibre-ideals; flatness of R→S provides Tor dimension zero. Identify the minimal generators of J/IS₀ with those of the closed-fibre kernel. Native dimension addition and the conormal criterion give the forward implication; lifting fibre regular elements gives the reverse.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-regular-fibre-ideals`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-regular-lift`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `mathlib:Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`.

Source: stacks-dpa, §23.8, Proposition23.8.4 and Lemma23.8.9, tags09Q2 and09Q7, pp.21–22 — The base and fibre equivalence is Avramov’s theorem, not an elementary consequence of depth.

Acceptance: No excellence hypothesis is required for this absolute ring theorem.

### Localization of local CI rings

Target: `TauCeti.PatchingAlgebra.ci_localization` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ci-localization`).

If R is Noetherian local CI and p a prime ideal, then R_p is local CI.


Proof route: Choose a prime of R̂ lying over p by faithful flatness. The flat local CI criterion descends along R_p→(R̂)_q. For the complete case use a regular presentation; regular local rings localize to regular local rings and the list localizes inside the chosen prime.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ci`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`, `mathlib:RingTheory.Sequence.IsWeaklyRegular.isRegular_of_isLocalization_of_mem`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`.

Source: stacks-dpa, §23.8, Lemma23.8.6, tag09Q4, p.22 — Descent from a prime of the completion reduces to localizing the regular quotient presentation.

Acceptance: Do not infer a corresponding localization statement for arbitrary completed lci morphisms.

### Detection of global local CI at maximal ideals

Target: `TauCeti.PatchingAlgebra.ci_maximal_detection` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ci-maximal-detection`).

For Noetherian R, IsLocallyCompleteIntersection R iff R_m is local CI for every maximal ideal m.


Proof route: A prime lies below a maximal ideal. Localize the local CI maximal localization once more and identify the resulting ring with R_p.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/locally-complete-intersection`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-localization`.

Source: stacks-dpa, §23.8, Lemma23.8.7, tag09Q5, p.22 — Localization stability reduces the global quantifier to maximal ideals.

Acceptance: The global zero-ring case is vacuous on both sides.

### Local CI rings are Cohen–Macaulay

Target: `TauCeti.PatchingAlgebra.ci_cohen_macaulay` (node `DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay`).

Every Noetherian local CI ring R is Cohen–Macaulay.


Proof route: The completion is a regular local ring modulo a regular sequence, hence CM by iterated regular-quotient CM invariance. Its closed fibre over R is the residue field. Descend CM by the flat local CM equivalence.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-cm`, `DeformationAndDerivedPatchingAlgebra:R03.2`.

Source: stacks-dpa, §23.8, tags09PY–09Q3, pp.19–22; Algebra§10.104, Lemma10.104.2, tag02JN, p.249 — A regular-sequence quotient is CM, and completion descends that property.

Acceptance: CM does not imply CI: k[[X,Y]]/(X,Y)² is a zero-dimensional counterexample.

## The remaining regular tangent-cone inputs

The tangent cone here is the P7 ordinary quotient of the native Rees algebra by the extended coefficient ideal. Its generator map is the actual degree-one polynomial map. Preserve its coefficient algebra, direct-sum decomposition, projections and all inherited Hilbert–Samuel and formal-curve proof leaves. No new associated-graded carrier or replacement map is planned.

### The tangent cone of a regular local ring

Target: `TauCeti.PatchingAlgebra.regular_local_graded_polynomial` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-graded-polynomial`).

Let R be regular local of dimension d and f:Fin d→m_R a minimal generator family. The existing P7 polynomial map ε_f:(R/m_R)[X₁,…,X_d]→Gr_m R is an isomorphism of graded algebras; it sends X_i to the existing degree-one class of f_i.


Proof route: Use the existing surjective graded polynomial map on the ordinary Rees quotient. The Hilbert–Samuel dimension comparison gives degree d−1 for graded-piece growth when d>0. A nonzero homogeneous kernel relation would force smaller growth; the exact polynomial-quotient counting leaf remains a gap. Handle d=0 separately: m=0 and the degree-zero field map is an isomorphism.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-surjective`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`.

Source: stacks-algebra, §10.106, Lemma10.106.1, tag00NO, p.253; §10.58, Lemma10.58.10 — The proof compares Hilbert growth to rule out any homogeneous relation.

Acceptance: The source is not merely a polynomial surjection; injectivity is what supplies the domain proof.

### Regular local rings are domains

Target: `TauCeti.PatchingAlgebra.regular_local_domain` (node `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-domain`).

Every regular local ring R is a domain.


Proof route: For nonzero a and b, native Krull intersection gives finite maximal m-adic orders. Their initial forms in the actual P7 tangent cone are nonzero. The polynomial-algebra comparison makes their product nonzero, so ab cannot vanish.

Direct prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-graded-polynomial`, `mathlib:IsHausdorff.of_isLocalRing`.

Source: stacks-algebra, §10.106, Lemma10.106.2, tag00NP, p.253 — Separatedness and the polynomial tangent cone prove absence of zero divisors.

Acceptance: This closes the statement inventory of the precise domain leaf recorded by P7, without asserting its Hilbert–Samuel proof is closed.

## Consumer checks and atlas planets

Specialization consumers in R03.4 and R03.6 must choose the actual ideal and verify it is a regular-sequence ideal; a dimension subtraction in a non-CM ring is insufficient. Patching consumers in R03.5, P7 and P9 must distinguish finiteness of the action image from finiteness of the original algebra map, and discharge the module's support-dimension equality before applying module miracle flatness. The Kisin theorem applies to regular domains of equal finite Krull dimension, as in its source. Khare–Wintenberger apply it after inversion of p; that application supplies no integral regularity or integral R=T assertion.

The conormal criterion tests the kernel of a surjection from a regular local ring. Freeness of a module with the name “conormal” is insufficient without the actual I/I² carrier, generation lift and codimension equality. In particular k[[x,y]]/(x,y)² is zero-dimensional CM but not CI; its conormal needs three generators while the regular source has dimension two. A unit ideal, a zero local ring and redundant regular-list generators are excluded where stated. A field gives the empty-presentation case; k[[x]]/(x²) supplies a nonregular CI.

The selected planets are: Regular-sequence ideals, Auslander–Buchsbaum formula, Module miracle flatness, Flat local depth formula, Local complete intersections, Conormal criterion. These six are the layer's reusable definitions and central theorems; inherited Hilbert–Samuel planets stay in their existing packet.

## Open proof inputs and supplier requests

Coverage is planned, not closed. A checked signature supplies neither a proof nor completion of an imported blueprint. The following inputs are exact endpoints of the dependency chains.

### Tate divided-power obstruction for conormal injection
Decompose Stacks23.6.9 and23.7.1–23.7.3 (09PS–09PU): a finite-variable-per-degree Tate resolution for a finitely presented quotient, the degree−2 derivation induced by a principal square-zero extension, its compatibility with divided powers, and the relation class whose iterated divided-power images remain nonzero in every even Tor degree. Native DividedPowers alone does not provide these differential graded constructions. This proof leaf is essential for Avramov, through nested-regular-ideals; it is not inferred from depth or conormal freeness.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-tor-conormal-injection`.

### Polynomial relation growth for the regular tangent cone
At lemma level, prove Stacks10.58.10: for d>0 a nonzero homogeneous relation in κ[X₁,…,X_d] forces eventual degree-piece growth strictly smaller than degree d−1 (including the eventual-zero d=1 case). Use injective multiplication by that relation and exact piece dimensions, with the P7 native grading; handle d=0 separately. This combines with the inherited Hilbert–Samuel degree/dimension gap, not with an assumed CM or domain theorem.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-graded-polynomial`.

### Supplier contracts not yet closed
SF.0 depth, CM, Cohen structure and the induction proof of maximal-depth freeness are imported mathematical contracts. SF.0 currently has needs_changes review; its statement-level imports are not completed implementations. In particular the depth Ext comparison, CM localization and regular-parameter inputs must survive its independent repair. The accepted P7 maximal-depth-free node uses bundled AB, so this packet uses SF.0’s induction proof to avoid an AB/finite-pd cycle. Assembly should redirect the P7 consumer to the noncircular supplier.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-generators-iff-dimension-drop`, `DeformationAndDerivedPatchingAlgebra:R03.3/cm-parameter-element`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-free`, `DeformationAndDerivedPatchingAlgebra:R03.3/minimal-free-injection-depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-syzygy-strict`, `DeformationAndDerivedPatchingAlgebra:R03.3/syzygy-depth-bound`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-submodule-bound`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-surjective-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/depth-finite-semilocal`, `DeformationAndDerivedPatchingAlgebra:R03.3/module-miracle-flatness`, `DeformationAndDerivedPatchingAlgebra:R03.3/kisin-projective-module`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-fibre-regular-lift`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-depth-zero-fibre`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-tensor-depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-cm`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay`.

### Inherited graded-module and numerical-polynomial induction
Preserve P7’s ordinary adic Rees quotient, coefficient algebra, actual homogeneous components, projections and generator maps. Complete the general positive-variable graded polynomial-module kernel/cokernel induction with finite remaining-variable actions and finite piece lengths. Its degreewise recurrence includes the kernel correction h_M(n+1)−h_M(n)=h_Q(n+1)−h_K(n); use P_Q(T)−P_K(T−1) before summation and the corrected tail cutoff. Native rational-series special cases do not prove the general statement.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/eventual-hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-graded-polynomial`.

### Inherited Hilbert–Samuel degree and leading coefficient bridges
Retain P7’s exact open inputs: Stacks10.60.9’s ring degree/dimension argument, Artin–Rees finite-colength top-coefficient invariance, shifted-polynomial comparison, finite-length branch and prime-filtration support maximum. Preserve the cumulative n+1 convention, zero polynomial degree bottom and zero-module support bottom. No elaborated formal-curve calculation closes the general dimension theorem.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/dimension-normalized-additivity`, `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-graded-polynomial`.

### Inherited localized lengths and multiplicity associativity
Preserve P7’s need for finite top-dimensional support primes and finite actual localization lengths, exact localization of prime-filtration factors, and their zero/residue-field dichotomy. Establish the finite associativity sum without mapping infinite module length to zero through toNat.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/multiplicity-associativity`.

### Inherited finite-jet and formal tangent-cone proofs
P7 already supplies actual finite equation jets, quotient length signatures, sharp cutoffs, explicit polynomials and the multiplicative formal-curve tangent-cone plan. Their proof bodies remain unchecked; retain their distinct formal-series coefficient and ideal-power proof leaves. This packet adds no duplicate curve maps and makes no new proof claim for them.

Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-homogeneous`.

### Requests

- `AdicEtaleGeometry:A3`: For finite lists inside the maximal ideal of a Noetherian local ring: native regularity is equivalent to positive-degree acyclicity of the owned Koszul complex, and an invertible generator change induces a Koszul-complex isomorphism. The existing koszul-regular-sequence-fpd node supplies only the forward implication. Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-sequence-ideal-minimal-generators`.

- `DeformationAndDerivedPatchingAlgebra:R03.1`: Formal lifting of a Cohen power-series presentation into a complete local ring across a surjection, with no separability restriction on the residue extension; adding variables produces the regular-source square of Stacks15.40.3 (07NN), flat vertical map and regular closed fibre. The existing separable relative coefficient-map node is insufficient. Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ci`.

- `DeformationAndDerivedPatchingAlgebra:R03.2`: Noetherianity of the native local completion; natural ring identification R̂/I R̂≅completion(R/I); extension of a local map to completions and preservation of flatness; finite-algebra completion decomposes into the finite product of completions at primes over a fixed maximal ideal, compatibly for finite modules. Native finite-module completion/tensor comparison, flatness and residue-field comparison are already baseline and must be reused. Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/completion-depth`, `DeformationAndDerivedPatchingAlgebra:R03.3/kisin-projective-module`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.3/flat-local-ci`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-localization`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay`.

- `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`: Use the existing completion regularity and dimension invariance, regular localizations and regularity descent contracts in upstream4D. These are imports of that roadmap, not new targets here. Consumers: `DeformationAndDerivedPatchingAlgebra:R03.3/kisin-projective-module`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-presentation-independence`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-regular-quotient`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-localization`.

## Source slips

- `DeformationAndDerivedPatchingAlgebra/E-R033-01`, §23.8, Lemma23.8.3, tag09Q1, numbered condition4, PDF p.20; public PDF and online tag inspected2026-10-10: The equivalence list ends with a numbered editorial reminder instead of a mathematical condition. Correction: Use the three mathematical conditions: CI completion, regular kernel, and the codimension-sized conormal generating family. Remove the editorial item from the equivalence list. The extra item states no proposition and the proof establishes the intended three-way equivalence. No fourth hypothesis is used in this packet. This changes no intended mathematics; independent confirmation is required.

- `DeformationAndDerivedPatchingAlgebra/E-R033-02`, §23.8, Lemma23.8.1, tag09PZ, completed quotient display, PDF p.19; public PDF and online section09PY inspected2026-10-10: The middle quotient in the completion comparison uses an n-indexed generator list, although the kernel was just assigned r minimal generators; n counts unrelated power-series variables. Correction: All ideals in that completion comparison use the r chosen kernel generators. Completing the quotient uses the fixed kernel ideal generated by those r elements. Changing its number of generators to the number of coefficient-presentation variables has no justification. This changes no intended mathematics; independent confirmation is required.


## Sources and validation

The cited results are restated here in our own words. Chapter-prefixed theorem numbers and the PDF page numbers fix the locators for the inspected versions. The packet records the SHA-256, public URL and access date of each PDF.

- [The Stacks Project: Commutative Algebra](https://stacks.math.columbia.edu/download/algebra.pdf), The Stacks Project Authors. Read §10.72, pp.172–174; §10.99, pp.231–232; §10.102–106, pp.243–254; §10.109–112, pp.261–270; §10.135, pp.351–352; §10.160, pp.439–445; §10.163, pp.452–453.

- [The Stacks Project: More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf), The Stacks Project Authors. Read §15.31, pp.78–81; §15.40, pp.101–103; §15.44, pp.111–112; §15.79, pp.203–204.

- [The Stacks Project: Divided Power Algebra](https://stacks.math.columbia.edu/download/dpa.pdf), The Stacks Project Authors. Read §23.7, pp.16–19; §23.8, pp.19–22.

- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Frank Calegari and David Geraghty. Read §6, Lemmas6.1–6.2, PDF pp.88–89; patching argument, PDF pp.11–14.

- [Moduli of finite flat group schemes, and modularity](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), Mark Kisin. Read §3.3, Lemma3.3.4, printed p.1159.

- [On Serre’s conjecture for 2-dimensional mod p representations of Gal(Qbar/Q), II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Chandrashekhar Khare and Jean-Pierre Wintenberger. Read §9.1, author PDF pp.82–83 and 88–89.


The suggested file elaborates at the pinned shared build with only proof-placeholder warnings. The JSON checker verifies exact indexed baseline names, ownership references, acyclicity within the packet, definition APIs, tests and the six-planet limit. A separate consistency check matches every proposed declaration, API item and definition-test name against the suggested file. The handoff records the final receipts and the remaining transitive supplier gaps. Every implementation status remains unchecked.
