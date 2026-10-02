# Hodge structures (pure, mixed, and polarized), Part II

## Continuation scope and conventions

This is a partial design checkpoint with 47 declaration nodes: 5 comparison, 15 construction, 12 definition, 5 lemma, 10 theorem. It has 100 API items, 85 planned definition/construction unit tests, six H.0 planets and fifteen actual pinned baseline references. Every implementation status is unchecked. No stage is closed. The current suggested file elaborates against the existing pinned Mathlib build with only sorry warnings; its global omission ledger remains unimplemented. H.1–H.8 retain the complete inherited obligations and remain not_read.

The reserved **HodgeStructuresPartII:key/higgs-parameter-connections** is now supplied as a mathematical declaration plan. It defines finite locally free coefficients on a general commutative ringed differential site with an actual additive λ-Leibniz operator, a defined exterior extension and curvature-zero equality. Its sheaf tensor, ordinary-connection and filtration prerequisites are explicit supplier requests. The twelve inherited free affine matrix nodes remain as examples and sign tests. They are not the definition of the global object.

A differential site means a ringed Grothendieck site with **specified** relative exterior forms, restrictions, wedge and d, satisfying the exterior and differential identities. This is not a theorem that every ringed site admits locally free universal differentials. The general connection carrier accepts forms that are not locally free. Finite local freeness of Ω¹ is imposed exactly for the coordinate, symmetric action, nilpotence-kernel and subbundle quotient arguments that need it. The coefficient bundle E is finite locally free, with locally constant rank; there need not be a single global frame or one fixed rank on disconnected components. Commutative coefficients admit nonreduced and positive-characteristic examples. No integral lattice, determinant, trace or stability is silently included.

The parameter is central and relatively constant, dλ=0. In a family over k[t], this means the differential is relative to the parameter base: dt=0. Inverting t is allowed only with this convention. An absolute differential with dt≠0 is a different input. All tensor products are **sheaf tensors**. Formulas on elementary tensors are local formulas checked after a cover and glued; there is no identification of global sections of a tensor sheaf with tensor products of global sections.

For E-valued forms the convention is E followed by forms. The extension is D_n(e⊗ω)=D(e)∧ω+λe⊗dω. Its right graded Leibniz rule has a sign (−1)^n in the term λu∧dω when u has degree n. Curvature is D_1∘D:E→E⊗Ω². Ordered Higgs iterates use Q^⊗N, not ∧^NQ. Thus exterior integrability and finite tensor nilpotence are distinct properties even on a line.

## Ownership and reviewed baseline

The parent tauceti:TauCetiRoadmap/HodgeStructures owns the existing fibrewise pure, mixed and polarized structures and period-domain points. Its HodgeStructures and the nearby ReductiveGroups upstream documents were read completely for scope and density. None of their linear algebra is replanned here. The initial checkpoint's statement that the reviewed coverage had no parent Hodge entries was a lookup error. At continuation tree dc0c470bcc064a08d8d9161ea963afe12b2c4b8d, **AUDIT-02** marks L0, L1 and L3 built, and L2 partly built: its mixed-Hodge abelian-category object packaging is incomplete, while its main filtration/strictness/bigrading results are recorded as built. These verdicts are imported; no new claim of implementation is made on a roadmap-name search.

**AUDIT-10** marks ShimuraData:D3's common variation interface not built. D3 remains the sole owner of the local-system, holomorphic filtered-bundle, fibrewise opposedness and Griffiths-transversality variation datum. This continuation defines the algebra of a filtered connection, which alone is not a variation. It does not infer that a complex variation has an integral lattice.

**AUDIT-22** marks EnhancedDerivedSheaves:E1 partly built. Module sheaves already exist as Mathlib SheafOfModules; locally free sheaves already have SheafOfModules.IsLocallyFree. PresheafOfModules.Monoidal.tensorObj supplies the objectwise presheaf tensor and its restrictions. E1 is requested only for the missing sheaf tensor/coherence, finite dual/evaluation, tensor exactness with locally free coefficients, pullback and descent. A request to construct the native module-sheaf carrier again would duplicate the baseline. IsLocallyFree alone does not assert finite rank: finite local generator types must be an explicit extra premise.

CrystallineCohomology:CR.1 owns the ordinary integrable relative connection carrier and its convention of extended differentials. It supplies the λ=1 comparison; quasi-nilpotence, smooth-lift and nilpotent-base hypotheses belong to its crystal comparison. Arbitrary flat connections are not identified with crystals. DerivedDeRhamCohomology:DD.1 owns the generic filtered/Rees carrier and the associated quotient/fiber coherences; this successor constructs the particular t∇ operator. Finite split Rees modules need no derived-completion premise. AdicSpacesPartII:R0 supplies analytic differentials for p-adic specialization; its full analytic constructions are not duplicated by a formal choice of Ω.

The canonical pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both trees were searched thoroughly for Higgs, λ-connection, LambdaConnection and ParameterConnection. The Mathlib Higgs hits concern matroids, while neither tree gives this general parameter category. Positive citations were checked by reading actual Lean statements. The fifteen references in the packet comprise the nine retained affine prerequisites and SheafOfModules, IsLocallyFree, presheaf tensorObj, KaehlerDifferential.D, TensorProduct.liftAddHom and liftAddHom_tmul. In particular, the additive balanced tensor lift exists already and is reused: an ordinary O-linear tensor lift cannot descend D by falsely assuming D is O-linear.

Near misses were inspected directly. Mathlib CovariantDerivative is for smooth manifold bundles, with differentiability hypotheses in its local Leibniz law. It does not supply the ringed-site λ carrier. TauCeti.AlgebraicGeometry.InvertibleSheaf is the native full subcategory of scheme module sheaves satisfying the invertible predicate; its file expressly leaves tensor/Picard completion to subsequent files. Presheaf relative differentials are available, but first differentials are not an automatic complete exterior calculus with sheaf tensor and descent. These objects receive no replacement nodes.

## Fresh source receipts and proof boundaries

On 2 October 2026 the three inherited PDFs were retrieved again from their public URLs and matched the original hashes. The continuation directly read these passages:

- [Esnault–Groechenig, published Acta PDF](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), printed pp.108,131–132: Higgs and flat definitions, λ-Leibniz/integrability, and the explicit Griffiths associated-graded formula. SHA-256 0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab.
- [Liu–Zhu, arXiv v3](https://arxiv.org/pdf/1602.06282v3), PDF pp.5,7,20–22,24: nilpotence scope, Theorem 2.1 tensor/dual/pullback statements, period-ring bundle and filtered-bundle definitions, Definition 3.6 and Remark 3.2. SHA-256 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79.
- [Heuer, published Inventiones PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), printed pp.262,267,297: the explicit Ω¹(−1) coefficient, setup and degree-one contraction into the symmetric-algebra action. SHA-256 7608fff18ccbc47b96bd54cfe01f31f8ccd9953889834cc9f6c39787563175cd.
- [Stacks tag 07J5](https://stacks.math.columbia.edu/tag/07J5), the opening connection/extension definition and full crystal-to-connection lemma proof. This motivates the additive ordinary extension convention; its crystal theorem is imported from CR.1, not replanned here. Tags [0FKF](https://stacks.math.columbia.edu/tag/0FKF) and [07HX](https://stacks.math.columbia.edu/tag/07HX) were read for the stated ring/scheme exterior-calculus convention; no universal locally free forms theorem is inferred.

Reading these definitions is not a reading of the complete nonabelian or p-adic correspondence proofs. All eight binding accepted route briefs were reread at the continuation tree, and all 149 assigned ids are retained unchanged. Only the stated H.0 algebra is decomposed here. The EG paragraph's inherited E10 misprint subset is recorded with the precise correction from integrality to integrability and X to Z for its forms. It is not a new discovery or a corrected theorem. No new source error is asserted. The assumption dλ=0 is a relative input convention, not an alleged erratum to the paper's moduli family.

## H.0: intrinsic Higgs and parameter algebra

The new declaration names use TauCeti.Hodge.ParameterConnection. The reserved carrier depends on the unbundled preconnection and its exterior curvature, so its integrability proof is an equality about an already defined map. Tensor and dual curvature lemmas use their unbundled formulas, avoiding a circular dependency on already-flat constructed bundles. The following statements, proof outlines, APIs and tests are identical to the packet. The general hypotheses at the start of each item are material, not implied by a local matrix presentation.

### I.1. Preconnection: Intrinsic parameter preconnections

**Node:** HodgeStructuresPartII:H.0/intrinsic-preconnection.

A Preconnection(E,λ) is an additive map of sheaves D:E→E⊗_OΩ¹ satisfying D(ae)=aD(e)+λ(e⊗da) on every object after local restriction. It is not O-linear unless its Leibniz correction vanishes. Integrability is a separate predicate; neither a lattice nor trace-zero nor nilpotence is part of this carrier.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the native module-sheaf carrier and imported sheaf tensor. Define D as a morphism of underlying abelian sheaves.
2. Impose the displayed local Leibniz equality, compatible with all restrictions. This automatically gives linearity over the relatively constant base.
3. Equality of D as an additive sheaf map gives equality of preconnections; construction requires actual data and the equality, not a supplied unnamed proposition.

API:

- **Preconnection.mk** (constructor): An additive sheaf map and its λ-Leibniz proof give a preconnection.
- **Preconnection.leibniz** (projection): D(ae)=aD(e)+λ(e⊗da).
- **Preconnection.ext** (extensionality): Equal section maps on all site objects imply equality.
- **Preconnection.base_linear** (compatibility): D(be)=bD(e) whenever db=0.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_affine_line** (computation): On A¹_k, λd on O sends x to λdx.
- **Preconnection.test_zero_parameter** (degenerate): At λ=0 the correction is zero and D is O-linear.
- **Preconnection.test_not_O_linear** (non-example): Over Q[x], d(x·1)=dx while x d(1)=0, so the unit ordinary connection is not O-linear.

Acceptance:

- A Preconnection(E,λ) is an additive map of sheaves D:E→E⊗_OΩ¹ satisfying D(ae)=aD(e)+λ(e⊗da) on every object after local restriction. It is not O-linear unless its Leibniz correction vanishes. Integrability is a separate predicate; neither a lattice nor trace-zero nor nilpotence is part of this carrier.

Prerequisites: mathlib:SheafOfModules; EnhancedDerivedSheaves:E1; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.2. Preconnection.extension_balanced: Balancing the exterior extension

**Node:** HodgeStructuresPartII:H.0/extension-balancing.

For n≥0, B_n(e,ω)=D(e)∧ω+λe⊗dω is biadditive and O-balanced: B_n(ae,ω)=B_n(e,aω). In degree zero use E⊗O≅E. No O-linearity of B_n in an individual argument is assumed.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand B_n(ae,ω) using the λ-Leibniz rule.
2. Expand d(aω)=da∧ω+a dω; the two derivative terms coincide, and bilinearity moves a between factors.
3. Both expressions are aD(e)∧ω+λe⊗da∧ω+λae⊗dω. Additivity is inherited from D,d and wedge.

Acceptance:

- For n≥0, B_n(e,ω)=D(e)∧ω+λe⊗dω is biadditive and O-balanced: B_n(ae,ω)=B_n(e,aω). In degree zero use E⊗O≅E. No O-linearity of B_n in an individual argument is assumed.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom.

Source: StacksConnection, tag 07J5, opening connection/extended differential paragraph; Only the ordinary connection equation and extension formula are imported as motivation. The λ-version and all parameter transport statements are explicit deductions; crystals are not identified with arbitrary flat objects.

### I.3. Preconnection.extend: Extended parameter differential

**Node:** HodgeStructuresPartII:H.0/exterior-extension.

Construct additive sheaf maps D_n:E⊗Ωⁿ→E⊗Ωⁿ⁺¹ by D_n(e⊗ω)=D(e)∧ω+λe⊗dω. D_0 is D via E⊗O≅E; uniqueness follows from local elementary tensors. For u of degree n, D(u∧ω)=D(u)∧ω+(−1)^n λu∧dω.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Descend the balanced biadditive expression using TensorProduct.liftAddHom locally.
2. Restriction compatibility follows on elementary tensors and then by additive generation. Sheafify the local tensor construction and use E1 descent.
3. Apply the graded Leibniz identity for d to establish the displayed rule and the degree-zero identification.

API:

- **Preconnection.extend_tmul** (projection): D_n(e⊗ω)=D(e)∧ω+λe⊗dω.
- **Preconnection.extend_zero** (compatibility): D_0 identifies with D.
- **Preconnection.extend_unique** (universal-property): The elementary tensor formula uniquely specifies the additive extension.
- **Preconnection.extend_wedge** (compatibility): The right graded Leibniz rule has sign (−1)^n on λu∧dω.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_extend_line** (computation): For D=d on Q[x,y], D_1(1⊗xdy)=1⊗dx∧dy.
- **Preconnection.test_extend_zero** (degenerate): A zero-parameter zero field extends by zero in every degree.
- **Preconnection.test_extend_sign** (non-example): For unit λd on Q[x,y,z], D(dx∧y dz)=−λdx∧dy∧dz. The opposite odd-degree sign gives a wrong nonzero answer.
- **Preconnection.test_extend_balancing** (compatibility): D_n(ae⊗ω)=D_n(e⊗aω); using an R-linear tensor lift separately on D would fail when λda≠0.

Acceptance:

- Construct additive sheaf maps D_n:E⊗Ωⁿ→E⊗Ωⁿ⁺¹ by D_n(e⊗ω)=D(e)∧ω+λe⊗dω. D_0 is D via E⊗O≅E; uniqueness follows from local elementary tensors. For u of degree n, D(u∧ω)=D(u)∧ω+(−1)^n λu∧dω.

Prerequisites: HodgeStructuresPartII:H.0/extension-balancing; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom; mathlib:TensorProduct.liftAddHom_tmul.

Source: StacksConnection, tag 07J5, opening connection/extended differential paragraph; Only the ordinary connection equation and extension formula are imported as motivation. The λ-version and all parameter transport statements are explicit deductions; crystals are not identified with arbitrary flat objects.

### I.4. Preconnection.curvature: Intrinsic exterior curvature

**Node:** HodgeStructuresPartII:H.0/intrinsic-curvature.

Curvature is the additive sheaf map κ_D=D_1∘D:E→E⊗Ω². IsIntegrable(D) means κ_D=0. D² here means this extended composite, not an ill-typed composition of E→E⊗Ω¹ with itself.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Compose the exterior extension in degree one with the original section map.
2. Define vanishing as equality of additive sheaf maps; verify it can be checked on every local section.

API:

- **Preconnection.curvature_apply** (projection): κ_D(e)=D_1(D(e)).
- **Preconnection.integrable_iff** (characterisation): Integrability iff κ_D(e)=0 on all local sections.
- **Preconnection.curvature_restrict** (compatibility): Restriction commutes with κ_D.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **Preconnection.test_curvature_unit** (computation): On O, D=λd has κ=λ²d²=0 when dλ=0.
- **Preconnection.test_curvature_zero** (degenerate): The zero Higgs field has zero curvature.
- **Preconnection.test_curvature_A2** (non-example): On A²_Q, θ=E12dx+E21dy has κ=diag(1,−1)dx∧dy≠0.

Acceptance:

- Curvature is the additive sheaf map κ_D=D_1∘D:E→E⊗Ω². IsIntegrable(D) means κ_D=0. D² here means this extended composite, not an ill-typed composition of E→E⊗Ω¹ with itself.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.5. Preconnection.curvature_linear: Curvature is O-linear

**Node:** HodgeStructuresPartII:H.0/curvature-linearity.

For relatively constant λ, κ_D(ae)=aκ_D(e). If dλ is not assumed zero the extra term is e⊗λdλ∧da. Thus κ_D is canonically an O-linear sheaf morphism under the standing hypotheses.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand D_1(aD(e)) with its scalar rule.
2. Expand D_1(λe⊗da). The mixed terms λD(e)∧da and its reversed wedge cancel; d²a=0.
3. The remaining scalar defect is λe⊗dλ∧da, which vanishes by relative constancy.

Acceptance:

- For relatively constant λ, κ_D(ae)=aκ_D(e). If dλ is not assumed zero the extra term is e⊗λdλ∧da. Thus κ_D is canonically an O-linear sheaf morphism under the standing hypotheses.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.6. Preconnection.extend_sq: Flatness in every exterior degree

**Node:** HodgeStructuresPartII:H.0/flat-extension-square.

For dλ=0, D_{n+1}D_n(e⊗ω)=κ_D(e)∧ω for every n. Hence κ_D=0 iff all adjacent extended differentials compose to zero.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Apply the extension formula twice. The D(e)∧dω terms cancel with the degree-one sign.
2. Use d²ω=0 and dλ=0; retain exactly D_1D(e)∧ω.
3. Local elementary tensors generate the sheaf tensor, and n=0 gives the converse.

Acceptance:

- For dλ=0, D_{n+1}D_n(e⊗ω)=κ_D(e)∧ω for every n. Hence κ_D=0 iff all adjacent extended differentials compose to zero.

Prerequisites: HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.7. LambdaBundle: Integrable parameter bundles

**Node:** HodgeStructuresPartII:key/higgs-parameter-connections.

LambdaBundle(Ω,λ) consists of a finite locally free O-module sheaf E and a Preconnection(E,λ) with κ_D=0. The parameter is a central relatively constant global section. This is the reserved general ringed-site definition: at λ=0 it gives integrable Higgs bundles and at λ=1 the imported ordinary connection carrier. Tensor, dual, pullback, coefficient twists and Griffiths grading are provided by the declaration nodes below; they are not axioms stored as arbitrary properties of an object.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Take E in the native sheaf category with a finite local trivializing cover. Require finite local bases, not a single global rank or a global basis.
2. Bundle actual additive D with its Leibniz proof and its defined curvature equality.
3. Use the extension-square theorem to give a genuine complex. λ=1 comparisons use the CR.1 carrier; general Higgs structure is the zero fiber of the same definition.

API:

- **LambdaBundle.mk** (constructor): Bundle E,D, finite local freeness, and the actual curvature-zero equality.
- **LambdaBundle.connection** (projection): Recover D with its λ-Leibniz rule.
- **LambdaBundle.integrable** (projection): The defined exterior curvature is zero.
- **LambdaBundle.ext** (extensionality): For the same underlying E, equal additive D gives equal bundle structures.
- **LambdaBundle.restrict** (functoriality): Restriction to a slice/open subsite retains the same parameter and integrability.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.test_affine_unit** (computation): On A¹_k, (O,d) is a nonzero rank-one flat connection; at λ=0 θ=dx gives an integrable rank-one Higgs object.
- **LambdaBundle.test_parameter_unit** (compatibility): D=λd for constant λ is flat, with λ=1 giving d and λ=0 giving the zero Higgs field.
- **LambdaBundle.test_noncommuting** (non-example): On A²_Q, E12dx+E21dy does not define a LambdaBundle at λ=0.
- **LambdaBundle.test_zero_module** (degenerate): The zero sheaf with its unique operator is admitted, with local rank zero.

Acceptance:

- LambdaBundle(Ω,λ) consists of a finite locally free O-module sheaf E and a Preconnection(E,λ) with κ_D=0. The parameter is a central relatively constant global section. This is the reserved general ringed-site definition: at λ=0 it gives integrable Higgs bundles and at λ=1 the imported ordinary connection carrier. Tensor, dual, pullback, coefficient twists and Griffiths grading are provided by the declaration nodes below; they are not axioms stored as arbitrary properties of an object.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/flat-extension-square; mathlib:SheafOfModules.IsLocallyFree; EnhancedDerivedSheaves:E1; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.8. LambdaBundle.Hom: Horizontal parameter morphisms

**Node:** HodgeStructuresPartII:H.0/connection-morphism.

A morphism between LambdaBundles with the same Ω,λ is an O-linear sheaf map f:E→F satisfying D_F f=(f⊗id)D_E. Identity and composition obey the equality; no determinant or polarization preservation is required.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use native module-sheaf morphisms and tensor functoriality.
2. Compose the horizontal equalities to prove closure under composition. Addition and zero follow from additivity.

API:

- **LambdaBundle.Hom.id** (constructor): Identity is horizontal.
- **LambdaBundle.Hom.comp** (functoriality): Horizontal morphisms compose.
- **LambdaBundle.Hom.add** (structure): Sum of two horizontal O-linear morphisms is horizontal.
- **LambdaBundle.Hom.ext** (extensionality): Equality of the underlying O-linear sheaf maps gives equality of morphisms.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.Hom.test_identity** (compatibility): Identity on the affine unit is horizontal.
- **LambdaBundle.Hom.test_zero** (degenerate): The zero O-linear map is horizontal.
- **LambdaBundle.Hom.test_nonconstant** (non-example): Multiplication by x on (O,d) over Q[x] is not horizontal: d(x)≠0.

Acceptance:

- A morphism between LambdaBundles with the same Ω,λ is an O-linear sheaf map f:E→F satisfying D_F f=(f⊗id)D_E. Identity and composition obey the equality; no determinant or polarization preservation is required.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.9. LambdaBundle.unit: Unit parameter connection

**Node:** HodgeStructuresPartII:H.0/unit-connection.

On O construct D(a)=λda, using O⊗Ω¹≅Ω¹. It is integrable for dλ=0 and is the tensor unit of the fixed-parameter category.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Derivation Leibniz proves the λ-rule.
2. Compute D_1D(a)=λdλ∧da+λ²d²a=0.
3. The unit isomorphisms are horizontal by the tensor formula proved below.

API:

- **LambdaBundle.unit_apply** (projection): The unit operator on a is λda.
- **LambdaBundle.unit_flat** (compatibility): Its defined curvature is zero.
- **LambdaBundle.unit_zero_parameter** (simp): The zero fiber is the zero Higgs field.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.unit.test_x** (computation): On Q[x], with λ=2, D(x)=2dx.
- **LambdaBundle.unit.test_zero** (degenerate): For λ=0 all sections have zero operator.
- **LambdaBundle.unit.test_not_zero** (non-example): At λ=1 the unit operator is not zero because D(x)=dx≠0.

Acceptance:

- On O construct D(a)=λda, using O⊗Ω¹≅Ω¹. It is integrable for dλ=0 and is the tensor unit of the fixed-parameter category.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/curvature-linearity; EnhancedDerivedSheaves:E1; mathlib:KaehlerDifferential.D.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.10. LambdaBundle.zeroEquivHiggs: Higgs zero fiber

**Node:** HodgeStructuresPartII:H.0/zero-fiber.

At λ=0, preconnections are exactly O-linear fields θ:E→E⊗Ω¹, and κ_D=(id⊗wedge)(θ⊗id)θ. Thus LambdaBundle(Ω,0) is equivalent to the integrable Higgs category, including its horizontal morphisms, without any nilpotence or trace-zero condition.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. The zero-parameter Leibniz rule is exactly O-linearity.
2. In the extension formula the dω term vanishes; the remaining composite is θ∧θ.
3. The two constructions leave the underlying E and map unchanged and are inverse on morphisms.

Acceptance:

- At λ=0, preconnections are exactly O-linear fields θ:E→E⊗Ω¹, and κ_D=(id⊗wedge)(θ⊗id)θ. Thus LambdaBundle(Ω,0) is equivalent to the integrable Higgs category, including its horizontal morphisms, without any nilpotence or trace-zero condition.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; HodgeStructuresPartII:H.0/exterior-extension.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.11. LambdaBundle.oneEquivConnection: Ordinary connection fiber

**Node:** HodgeStructuresPartII:H.0/ordinary-fiber.

The λ=1 category identifies with CR.1 ordinary integrable relative connections on the same ringed differential site, by preserving E,D,restriction and the exterior curvature convention. This does not identify it with crystals; their quasi-nilpotence and lift hypotheses remain separate.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Specialize the Leibniz and exterior-extension equations to λ=1.
2. Use the requested CR.1 carrier equivalence, explicitly requiring these input/output equations.
3. Identity on section maps is inverse to the supplier-to-parameter construction.

Acceptance:

- The λ=1 category identifies with CR.1 ordinary integrable relative connections on the same ringed differential site, by preserving E,D,restriction and the exterior curvature convention. This does not identify it with crystals; their quasi-nilpotence and lift hypotheses remain separate.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; CrystallineCohomology:CR.1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.12. LambdaBundle.tensor_balanced: Balancing the tensor connection

**Node:** HodgeStructuresPartII:H.0/tensor-balancing.

For two λ-preconnections on E,F, B(e,f)=D_E(e)⊗f+e⊗D_F(f), with forms moved to the last factor, satisfies B(ae,f)=B(e,af). Its scalar rule is B(ae,f)=aB(e,f)+λ(e⊗f)⊗da. A differing pair of parameters need not descend.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand the left expression with D_E Leibniz and the right with D_F Leibniz.
2. The identical derivative term λe⊗f⊗da cancels in the comparison; all remaining terms are scalar-balanced.
3. Additivity in each argument gives an additive tensor lift, not an O-bilinear lift of each separate summand.

Acceptance:

- For two λ-preconnections on E,F, B(e,f)=D_E(e)⊗f+e⊗D_F(f), with forms moved to the last factor, satisfies B(ae,f)=B(e,af). Its scalar rule is B(ae,f)=aB(e,f)+λ(e⊗f)⊗da. A differing pair of parameters need not descend.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; EnhancedDerivedSheaves:E1; mathlib:TensorProduct.liftAddHom.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.13. LambdaBundle.tensor: Tensor parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-tensor.

Construct the connection D_{E⊗F}(e⊗f)=D_E(e)⊗f+e⊗D_F(f) on the sheaf tensor for the same λ. It satisfies the λ-Leibniz rule with one coefficient λ. Tensor associators, symmetry and unitors are horizontal.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the balancing lemma and the additive tensor universal property.
2. Glue through the imported sheaf tensor and verify the λ-rule on elementary tensors.
3. Three-factor expansions agree and the symmetric swap is compatible; integrability follows from the tensor-curvature lemma.

API:

- **LambdaBundle.tensor_tmul** (projection): D(e⊗f)=D_E(e)⊗f+e⊗D_F(f).
- **LambdaBundle.tensor_leibniz** (compatibility): D(a(e⊗f))=aD(e⊗f)+λ(e⊗f)⊗da.
- **LambdaBundle.tensor_assoc** (compatibility): The native sheaf-tensor associator is horizontal.
- **LambdaBundle.tensor_comm** (compatibility): The native symmetry is horizontal.
- **LambdaBundle.tensor_unit** (compatibility): Tensoring with unit(λ) is horizontally isomorphic to the input.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.tensor.test_unit** (compatibility): unit(λ)⊗unit(λ) identifies with unit(λ).
- **LambdaBundle.tensor.test_zero** (degenerate): Tensor with the zero module is zero.
- **LambdaBundle.tensor.test_one_lambda** (non-example): Over Q[x], tensoring two λ=2 unit lines sends x under the unit identification to 2dx, not 4dx.

Acceptance:

- Construct the connection D_{E⊗F}(e⊗f)=D_E(e)⊗f+e⊗D_F(f) on the sheaf tensor for the same λ. It satisfies the λ-Leibniz rule with one coefficient λ. Tensor associators, symmetry and unitors are horizontal.

Prerequisites: HodgeStructuresPartII:H.0/tensor-balancing; HodgeStructuresPartII:H.0/tensor-curvature; HodgeStructuresPartII:H.0/unit-connection; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.14. Preconnection.tensor_curvature: Tensor curvature formula

**Node:** HodgeStructuresPartII:H.0/tensor-curvature.

For the balanced tensor preconnection, κ_{E⊗F}(e⊗f)=κ_E(e)⊗f+e⊗κ_F(f), with Ω² moved to the last factor. In particular flat inputs yield flat output; no converse is claimed.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the balanced tensor preconnection before bundling flatness, so there is no dependency on the flat tensor object.
2. Apply the extended differential twice on elementary tensors. Mixed terms occur in opposite exterior orders and cancel.
3. The two remaining squares are exactly the input curvatures; extend by locality and additive generation.

Acceptance:

- For the balanced tensor preconnection, κ_{E⊗F}(e⊗f)=κ_E(e)⊗f+e⊗κ_F(f), with Ω² moved to the last factor. In particular flat inputs yield flat output; no converse is claimed.

Prerequisites: HodgeStructuresPartII:H.0/tensor-balancing; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.15. LambdaBundle.dual: Dual parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-dual.

On E∨=Hom_O(E,O), define D∨φ by (D∨φ)(e)=λd(φ(e))−(φ⊗id)D(e). Finite local freeness identifies E∨⊗Ω¹ with Hom(E,Ω¹). Evaluation is horizontal; the construction has the same λ and is intrinsic.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand on ae: the terms λφ(e)da cancel, showing that the displayed expression is O-linear in e.
2. Use the finite locally free evaluation isomorphism supplied by E1 to obtain a unique section in E∨⊗Ω¹.
3. The expression satisfies the λ-Leibniz rule in φ and glues; dual-curvature proves flatness.

API:

- **LambdaBundle.dual_eval** (projection): (D∨φ)(e)=λd(φ(e))−φ(D(e)).
- **LambdaBundle.eval_horizontal** (compatibility): Evaluation E∨⊗E→unit(λ) is horizontal.
- **LambdaBundle.biddual** (equivalence): The canonical E→E∨∨ is horizontal and an isomorphism.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.dual.test_unit** (compatibility): The dual of unit(λ) is unit(λ).
- **LambdaBundle.dual.test_zero** (degenerate): The dual zero module is zero.
- **LambdaBundle.dual.test_sign** (non-example): For θ=a dx on a Higgs line its dual is −a dx; using +a violates the evaluation equation.

Acceptance:

- On E∨=Hom_O(E,O), define D∨φ by (D∨φ)(e)=λd(φ(e))−(φ⊗id)D(e). Finite local freeness identifies E∨⊗Ω¹ with Hom(E,Ω¹). Evaluation is horizontal; the construction has the same λ and is intrinsic.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/dual-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.16. Preconnection.dual_curvature: Dual curvature sign

**Node:** HodgeStructuresPartII:H.0/dual-curvature.

The dual preconnection defined by the evaluation formula satisfies (κ_{E∨}φ)(e)=−φ(κ_E(e)). Hence flatness is preserved and reflected through finite locally free biduality.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct the unbundled dual from the formula, using finite local freeness.
2. Differentiate the evaluation relation a second time. Opposite-degree mixed terms cancel and d²φ(e)=0.
3. The result is the negative dual of κ_E; finite locally free evaluation detects zero.

Acceptance:

- The dual preconnection defined by the evaluation formula satisfies (κ_{E∨}φ)(e)=−φ(κ_E(e)). Hence flatness is preserved and reflected through finite locally free biduality.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/intrinsic-curvature; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.17. LambdaBundle.pullback: Pullback of parameter bundles

**Node:** HodgeStructuresPartII:H.0/intrinsic-pullback.

For a morphism of ringed differential sites f:Y→X with a morphism of exterior calculi f*Ω_X→Ω_Y commuting with wedge and d, set λ_Y=f#λ and construct D_Y(b⊗e)=λ_Y e⊗d_Yb+b·df(D_Xe) on f*E. It is integrable, functorial in f, and compatible with tensor and dual. No flatness of f is required for finite locally free E.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Check scalar balancing against f#(a): d_Yf#(a)=df(d_Xa) supplies exactly the needed correction.
2. Apply local finite free presentations; the sheaf pullback supplier glues and gives independence.
3. Compute curvature on 1⊗e as the image of κ_X(e), then use its O_Y-linearity. Composition follows on generators; tensor/dual follow from their defining equations.

API:

- **LambdaBundle.pullback_apply** (projection): D_Y(b⊗e)=λ_Y e⊗d_Yb+b df(D_Xe).
- **LambdaBundle.pullback_id** (compatibility): Identity pullback gives the original object.
- **LambdaBundle.pullback_comp** (functoriality): Composed pullbacks agree via the canonical sheaf-pullback isomorphism.
- **LambdaBundle.pullback_tensor** (compatibility): Pullback commutes horizontally with same-parameter tensor.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.pullback.test_identity** (compatibility): Pullback along id leaves (O,d) unchanged.
- **LambdaBundle.pullback.test_constant** (degenerate): Along x↦0, the Higgs line dx pulls back to zero.
- **LambdaBundle.pullback.test_ramified** (computation): Along x=y² over Q, a Higgs field dx pulls back to 2y dy; replacing df by an identity would fail.

Acceptance:

- For a morphism of ringed differential sites f:Y→X with a morphism of exterior calculi f*Ω_X→Ω_Y commuting with wedge and d, set λ_Y=f#λ and construct D_Y(b⊗e)=λ_Y e⊗d_Yb+b·df(D_Xe) on f*E. It is integrable, functorial in f, and compatible with tensor and dual. No flatness of f is required for finite locally free E.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/curvature-linearity; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.18. LambdaBundle.descent: Local descent of parameter operators

**Node:** HodgeStructuresPartII:H.0/local-descent.

For a site covering family, finite locally free E_i, horizontal isomorphisms g_ij and their actual cocycle, the imported module-sheaf descent produces E. The D_i glue uniquely to a λ-preconnection on E, and it is integrable iff all its local curvatures vanish. The equations are on the common restricted parameter and differential calculus.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Import descent of the underlying finite locally free module sheaves from E1.
2. The horizontal equality says the additive D_i agree after all identifications on double overlaps. Descend as maps of abelian sheaves to E⊗Ω¹.
3. Leibniz, curvature and finite local freeness are local properties. Uniqueness follows from separatedness; no global coordinates are chosen.

Acceptance:

- For a site covering family, finite locally free E_i, horizontal isomorphisms g_ij and their actual cocycle, the imported module-sheaf descent produces E. The D_i glue uniquely to a λ-preconnection on E, and it is integrable iff all its local curvatures vanish. The equations are on the common restricted parameter and differential calculus.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/connection-morphism; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.19. LambdaBundle.affineCoordinateEquiv: Comparison with the affine frame

**Node:** HodgeStructuresPartII:H.0/coordinate-comparison.

On a chart where Ω¹ has the genuine basis dx_i with commuting dual derivations δ_i, Ω² has its exterior basis, and E≅O^V, write D=λd+A. Its curvature coefficients are λδ_iA_j−λδ_jA_i+[A_i,A_j]. The same-parameter tensor, dual and s′=Gs gauge formulas agree with the twelve retained affine nodes. An arbitrary zero-direction Frame is not enough for this equivalence.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand D of each basis vector to recover A_i uniquely.
2. Use the intrinsic extension to compute curvature on basis sections, then read off exterior-basis coefficients.
3. Under a changed component column s′=Gs, apply the product rule to G⁻¹s′; the derivative correction is −λdG·G⁻¹.
4. Tensor and dual follow on basis tensors and evaluation, with Kronecker sum and minus transpose respectively.

Acceptance:

- On a chart where Ω¹ has the genuine basis dx_i with commuting dual derivations δ_i, Ω² has its exterior basis, and E≅O^V, write D=λd+A. Its curvature coefficients are λδ_iA_j−λδ_jA_i+[A_i,A_j]. The same-parameter tensor, dual and s′=Gs gauge formulas agree with the twelve retained affine nodes. An arbitrary zero-direction Frame is not enough for this equivalence.

Prerequisites: HodgeStructuresPartII:H.0/intrinsic-preconnection; HodgeStructuresPartII:H.0/intrinsic-curvature; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/gauge; HodgeStructuresPartII:H.0/tensor; HodgeStructuresPartII:H.0/dual; EnhancedDerivedSheaves:E1.

Source: EG20, §4.2 p.131, parameter Leibniz definition; §2.1 p.108, Higgs specialization; The source states the sheaf Leibniz and integrability equations. General ringed-site transport is the elementary algebra developed here from those equations; no Simpson or crystal comparison is asserted.

### I.20. LambdaBundle.rescale: Invertible parameter rescaling

**Node:** HodgeStructuresPartII:H.0/intrinsic-rescale.

If λ is an invertible relatively constant section, rescale by λ⁻¹D to obtain an ordinary integrable connection. Its curvature is λ⁻²κ_D. This gives an equivalence of fixed-λ and ordinary connection categories with inverse ∇↦λ∇, including tensor, dual and horizontal morphisms.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Differentiate λλ⁻¹=1 to get dλ⁻¹=0.
2. Expand the scaled Leibniz equation: the scalar derivative coefficient becomes 1.
3. The extended differential scales by λ⁻¹ in every degree, so its square scales by λ⁻². The inverse and morphisms are unchanged on E.

API:

- **LambdaBundle.rescale_apply** (projection): The new operator is λ⁻¹D.
- **LambdaBundle.rescale_curvature** (compatibility): κ_rescale=λ⁻²κ_D.
- **LambdaBundle.rescale_equiv** (equivalence): Scaling by λ and λ⁻¹ are inverse functors.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **LambdaBundle.rescale.test_two** (computation): On Q[x], 2d rescales to d.
- **LambdaBundle.rescale.test_one** (degenerate): λ=1 leaves the operator unchanged.
- **LambdaBundle.rescale.test_t** (compatibility): For relative forms over k[t], t has dt=0; after localizing at t, t∇ rescales to ∇. Absolute forms with dt≠0 do not satisfy the input convention.

Acceptance:

- If λ is an invertible relatively constant section, rescale by λ⁻¹D to obtain an ordinary integrable connection. Its curvature is λ⁻²κ_D. This gives an equivalence of fixed-λ and ordinary connection categories with inverse ∇↦λ∇, including tensor, dual and horizontal morphisms.

Prerequisites: HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/ordinary-fiber.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.21. TwistedHiggsBundle: Twisted integrable Higgs bundles

**Node:** HodgeStructuresPartII:H.0/twisted-higgs.

For an invertible coefficient sheaf T, put Q=Ω¹⊗T. A TwistedHiggsBundle is finite locally free E with O-linear θ:E→E⊗Q whose exterior composite in E⊗Ω²⊗T² vanishes. The twist is in the coefficient of the field, not absorbed into E. No connection on T or differential on T is required for this zero-parameter definition.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the native module-sheaf and supplied tensor/exterior-power identifications. Define the composite by applying θ to the E factor and wedging the Ω¹ factors, with both T factors retained.
2. With T=O, compare by unitors with the zero fiber. If T changes by an isomorphism, transport θ through its coefficient tensor map.
3. Tensor and dual use the same Q and evaluation formulas with no d-term. In the p-adic instance T is O(−1), including its Galois action.

API:

- **TwistedHiggsBundle.zero** (constructor): Every finite locally free E has the zero Q-valued field.
- **TwistedHiggsBundle.coefficient** (projection): The coefficient is Ω¹⊗T and its curvature coefficient is Ω²⊗T².
- **TwistedHiggsBundle.trivialTwistEquiv** (equivalence): T=O gives the ordinary integrable Higgs category via its tensor unitors.
- **TwistedHiggsBundle.changeTwist** (functoriality): An isomorphism T≅T′ transports fields and curvature.
- **TwistedHiggsBundle.tensor** (structure): Same-twist fields tensor by θ_E⊗1+1⊗θ_F, with one Q coefficient.
- **TwistedHiggsBundle.dual** (structure): The dual field is characterized by zero-field evaluation and equals minus transpose locally.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.test_trivial** (compatibility): T=O, θ=E12dx on O² is the usual nonzero square-zero Higgs field.
- **TwistedHiggsBundle.test_zero** (degenerate): θ=0 is integrable for every invertible T.
- **TwistedHiggsBundle.test_Tate** (non-example): For the rigid p-adic instance, Ω¹(−1) and its Galois action must appear in θ; an untwisted target has the wrong character.
- **TwistedHiggsBundle.test_tensor_twist** (compatibility): Tensor of two T-valued Higgs objects remains T-valued; T² occurs in curvature, not in the degree-one tensor field.

Acceptance:

- For an invertible coefficient sheaf T, put Q=Ω¹⊗T. A TwistedHiggsBundle is finite locally free E with O-linear θ:E→E⊗Q whose exterior composite in E⊗Ω²⊗T² vanishes. The twist is in the coefficient of the field, not absorbed into E. No connection on T or differential on T is required for this zero-parameter definition.

Prerequisites: HodgeStructuresPartII:H.0/zero-fiber; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.22. TwistedHiggsBundle.coordinate_integrability: Integrability and commuting coefficients

**Node:** HodgeStructuresPartII:H.0/higgs-commuting.

If Q is locally free with finite basis q_i, write θ=ΣA_i⊗q_i. Then θ∧θ=0 iff [A_i,A_j]=0 for all i,j, in arbitrary characteristic. This uses the exterior basis q_i∧q_j for i<j, not division by 2. An arbitrary collection of directions without a basis cannot give the converse.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Ω¹ has finite locally free local charts; T is invertible.

Construction or proof:

1. Expand θ twice in the specified local basis. Pair i,j and j,i coefficients using q_j∧q_i=−q_i∧q_j and q_i∧q_i=0.
2. Independence of the exterior-basis terms gives each commutator zero, including in characteristic two.
3. The basis-free equation glues across all local trivializations.

Acceptance:

- If Q is locally free with finite basis q_i, write θ=ΣA_i⊗q_i. Then θ∧θ=0 iff [A_i,A_j]=0 for all i,j, in arbitrary characteristic. This uses the exterior basis q_i∧q_j for i<j, not division by 2. An arbitrary collection of directions without a basis cannot give the converse.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.23. TwistedHiggsBundle.symmetricAction: Symmetric-algebra Higgs action

**Node:** HodgeStructuresPartII:H.0/symmetric-action.

For Q finite locally free, construct the O-algebra map Sym_O(Q∨)→End_O(E) sending v to the contraction (id⊗v)θ. Integrability is equivalent to existence of this extension with the stated degree-one restriction. End(E) can be noncommutative; the images of Q∨ must commute.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use finite local dual bases to identify contraction coefficients with A_i. The commuting comparison supplies the commutation relation.
2. Apply the symmetric-algebra universal property into an associative O-algebra with commuting image; glue uniqueness.
3. Conversely a symmetric action gives commuting contractions, hence integrability by the exterior-basis comparison.

API:

- **TwistedHiggsBundle.symmetricAction_generator** (projection): The image of v∈Q∨ is contraction of θ by v.
- **TwistedHiggsBundle.symmetricAction_unique** (universal-property): The degree-one contractions uniquely determine the algebra map.
- **TwistedHiggsBundle.symmetricAction_iff** (characterisation): The given contractions extend iff θ is integrable under Q finite local freeness.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.symmetricAction.test_scalar** (computation): On A¹_Q, θ=dx gives the action Q[x][u]→End(O) with u↦1.
- **TwistedHiggsBundle.symmetricAction.test_zero** (degenerate): Zero field factors through the augmentation Sym(Q∨)→O.
- **TwistedHiggsBundle.symmetricAction.test_noncommuting** (non-example): u↦E12 and v↦E21 cannot define a map from Q[u,v] to Mat₂(Q).

Acceptance:

- For Q finite locally free, construct the O-algebra map Sym_O(Q∨)→End_O(E) sending v to the contraction (id⊗v)θ. Integrability is equivalent to existence of this extension with the stated degree-one restriction. End(E) can be noncommutative; the images of Q∨ must commute.

Prerequisites: HodgeStructuresPartII:H.0/higgs-commuting; EnhancedDerivedSheaves:E1.

Source: Heuer25, Definition 1.2(2) p.262; Definition 4.1 p.297; These passages specify the explicit Tate-twisted Higgs field and its symmetric-algebra action; the p-adic correspondence remains with its consumer.

### I.24. TwistedHiggsBundle.iterate: Ordered Higgs iterates

**Node:** HodgeStructuresPartII:H.0/ordered-iterate.

Define θ^[0]=id_E and θ^[n+1]=(θ⊗id_{Q^⊗n})θ^[n], with coherent reassociation to E⊗Q^⊗(n+1). This uses ordinary ordered tensor powers, never exterior powers. IterateNul(θ,N) means N>0 and θ^[N]=0.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct n-fold tensor powers from the supplied monoidal category and recurse, applying θ only on E.
2. Track associators explicitly; θ O-linearity permits tensoring.
3. Local dual-basis contractions recover every ordered word of coefficients, so vanishing can be checked by those words when Q is finite locally free.

API:

- **TwistedHiggsBundle.iterate_zero** (simp): The zeroth iterate is identity.
- **TwistedHiggsBundle.iterate_succ** (projection): The successor is θ⊗id after the preceding iterate, with the prescribed reassociation.
- **TwistedHiggsBundle.iterate_coordinates** (characterisation): In a finite local basis, θ^[N]=0 iff every word of N coefficients vanishes.
- **TwistedHiggsBundle.iterate_zero_field** (simp): The zero field has bound 1.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.iterate.test_E12** (computation): For E12dx on O², θ^[2]=0 but θ≠0.
- **TwistedHiggsBundle.iterate.test_zero** (degenerate): Zero field has bound 1, including the zero module.
- **TwistedHiggsBundle.iterate.test_scalar** (non-example): The scalar dx over Q[x] has θ^[N](1)=1⊗dx^⊗N≠0 for every positive N, although it is integrable.

Acceptance:

- Define θ^[0]=id_E and θ^[n+1]=(θ⊗id_{Q^⊗n})θ^[n], with coherent reassociation to E⊗Q^⊗(n+1). This uses ordinary ordered tensor powers, never exterior powers. IterateNul(θ,N) means N>0 and θ^[N]=0.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.25. TwistedHiggsBundle.NilpotenceFiltration: Finite Higgs nilpotence filtrations

**Node:** HodgeStructuresPartII:H.0/nilpotence-filtration.

A length-N nilpotence filtration has N>0 and subsheaves 0=K_0⊆K_1⊆⋯⊆K_N=E with θ(K_j) lies in the image of K_{j−1}⊗Q→E⊗Q. When Q is flat this image is the indicated tensor subsheaf. Quotients and steps need not be locally free. Vanishing graded Higgs fields means this lowering equality; it is distinct from the subbundle filtration used for Griffiths associated graded.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use native module-sheaf subobjects with the supplied tensor maps and inclusions.
2. Record the length and lowering condition. No nonreduced-base restriction or unjustified subbundle requirement is imposed.
3. Changing charts transports subobjects, so the definition is global and invariant under isomorphism.

API:

- **TwistedHiggsBundle.NilpotenceFiltration.lower** (projection): θ(K_j) lies in K_{j−1}⊗Q.
- **TwistedHiggsBundle.NilpotenceFiltration.zero** (constructor): A zero field has K_0=0,K_1=E.
- **TwistedHiggsBundle.NilpotenceFiltration.transport** (functoriality): A Higgs isomorphism transports the filtration and length.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **TwistedHiggsBundle.NilpotenceFiltration.test_E12** (computation): For E12dx, K_1 is the line spanned by e₁ and K_2=O².
- **TwistedHiggsBundle.NilpotenceFiltration.test_zero** (degenerate): A zero field gives a length-one filtration.
- **TwistedHiggsBundle.NilpotenceFiltration.test_nonreduced** (non-example): Over Q[ε]/ε², θ=εdx on a line has K_1=(ε), K_2=O. K_1 is not a line subbundle; a compulsory locally free-quotient definition rejects this valid nilpotent field.

Acceptance:

- A length-N nilpotence filtration has N>0 and subsheaves 0=K_0⊆K_1⊆⋯⊆K_N=E with θ(K_j) lies in the image of K_{j−1}⊗Q→E⊗Q. When Q is flat this image is the indicated tensor subsheaf. Quotients and steps need not be locally free. Vanishing graded Higgs fields means this lowering equality; it is distinct from the subbundle filtration used for Griffiths associated graded.

Prerequisites: HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.26. TwistedHiggsBundle.nilpotence_iff_filtration: Tensor nilpotence and finite filtrations

**Node:** HodgeStructuresPartII:H.0/nilpotence-equivalence.

When Q is finite locally free, θ^[N]=0 for N>0 iff a length-N nilpotence filtration exists. No integrability is needed for this equivalence of ordered iterates and lowering filtrations. For a general coherent Q without flatness, this equivalence is not asserted.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Q=Ω¹⊗T is finite locally free; E finite locally free, and the tensor-exactness/kernel identification for Q is imported from E1.

Construction or proof:

1. A lowering filtration kills N successive applications on E=K_N.
2. Conversely define K_j=ker θ^[j]. Locally a finite basis of Q identifies K_j with vectors annihilated by all words of length j.
3. These kernels ascend and θ(K_j)⊆K_{j−1}⊗Q: contraction by each basis covector lands in K_{j−1}; finite locally free tensor exactness identifies the kernel after tensoring.
4. K_0=ker id=0 and θ^[N]=0 gives K_N=E; glue kernels without asserting they or their quotients are locally free.

Acceptance:

- When Q is finite locally free, θ^[N]=0 for N>0 iff a length-N nilpotence filtration exists. No integrability is needed for this equivalence of ordered iterates and lowering filtrations. For a general coherent Q without flatness, this equivalence is not asserted.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/nilpotence-filtration; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.27. TwistedHiggsBundle.tensor_nilpotence_bound: Tensor nilpotence bound

**Node:** HodgeStructuresPartII:H.0/tensor-nilpotence.

If two same-Q fields have positive ordered bounds N and M, their tensor field has bound N+M−1. The proof is valid in arbitrary characteristic and over nonreduced rings, without dividing by binomial coefficients.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Expand the (N+M−1)-fold iterate as a sum indexed by choosing the E or F action at every position; distributivity and tensor associators give this formula without a basis of Q.
2. Reorder actions on separate E,F factors while retaining the corresponding permutation of the ordered Q factors. Every summand factors through an E iterate of length r and an F iterate of length s with r+s=N+M−1.
3. Either r≥N or s≥M. Higher iterates factor through the specified zero iterate, so that summand vanishes. This is an integral shuffle argument: no integrability between directions, local freeness of Q or division by binomial coefficients is required.

Acceptance:

- If two same-Q fields have positive ordered bounds N and M, their tensor field has bound N+M−1. The proof is valid in arbitrary characteristic and over nonreduced rings, without dividing by binomial coefficients.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.28. TwistedHiggsBundle.dual_nilpotence_bound: Dual nilpotence bound

**Node:** HodgeStructuresPartII:H.0/dual-nilpotence.

For finite locally free E,Q, a twisted Higgs field with ordered bound N has a dual field with the same bound N. In a finite local basis, its word equals (−1)^N times the transpose of the reversed original word.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use the dual evaluation definition to identify each contracted matrix with −A_iᵀ.
2. Multiplication under transpose reverses order, and all reversed words are included in the original bound.
3. Finite local evaluation detects zero and glues the bound.

Acceptance:

- For finite locally free E,Q, a twisted Higgs field with ordered bound N has a dual field with the same bound N. In a finite local basis, its word equals (−1)^N times the transpose of the reversed original word.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.29. TwistedHiggsBundle.pullback_nilpotence_bound: Pullback nilpotence bound

**Node:** HodgeStructuresPartII:H.0/pullback-nilpotence.

Pullback of a twisted field through a coefficient map f*Q→Q_Y preserves the ordered bound N. It also preserves integrability when that map induces the required exterior map. No flatness is required to preserve a zero composite; reflection or identification of pulled-back kernels is not asserted.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Tensor functoriality identifies every pulled-back iterate with the image of θ^[N].
2. A zero map remains zero under pullback and postcomposition on coefficients.
3. Use the exterior analogue for integrability; do not infer left-exactness of arbitrary pullback.

Acceptance:

- Pullback of a twisted field through a coefficient map f*Q→Q_Y preserves the ordered bound N. It also preserves integrability when that map induces the required exterior map. No flatness is required to preserve a zero composite; reflection or identification of pulled-back kernels is not asserted.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; HodgeStructuresPartII:H.0/twisted-higgs; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.30. TwistedHiggsBundle.nilpotent_line_eq_zero: Nilpotent fields on reduced lines

**Node:** HodgeStructuresPartII:H.0/reduced-line-nilpotence.

If O is locally reduced, E is invertible and Q is finite locally free, a positive ordered nilpotence bound forces θ=0. Reducedness is necessary: on O=Q[ε]/ε², θ=εdx is nonzero with bound 2.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Trivialize E and Q locally; write θ by scalars a_i.
2. The constant word i,…,i gives a_i^N=0. Reducedness forces every a_i=0.
3. Sheaf locality gives θ=0; the ε example disproves the assertion without reducedness.

Acceptance:

- If O is locally reduced, E is invertible and Q is finite locally free, a positive ordered nilpotence bound forces θ=0. Reducedness is necessary: on O=Q[ε]/ε², θ=εdx is nonzero with bound 2.

Prerequisites: HodgeStructuresPartII:H.0/ordered-iterate; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.31. GriffithsFiltration: Griffiths transverse filtrations

**Node:** HodgeStructuresPartII:H.0/griffiths-filtration.

For an ordinary integrable connection (E,∇), a GriffithsFiltration is a bounded decreasing Z-indexed filtration F^pE by subbundles, exhaustive for p≤a and zero for p>b, with finite locally free successive quotients and ∇F^p⊆F^{p−1}⊗Ω¹. Only this filtration-to-graded algebra is defined here; a VHS additionally has the local-system/fibrewise Hodge data supplied by D3.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
- Ω¹ is finite locally free, the parameter is 1, and F has finite locally free subquotients and local split inclusions.

Construction or proof:

1. Import the ordinary connection from CR.1 and generic filtration/subquotient machinery from DD.1, rather than inventing a second filtration carrier.
2. Require genuine inclusions with antitonicity, boundedness and local splitting of quotient sequences; not mere rank inequalities.
3. Express transversality through the actual tensor inclusion; Ω¹ local freeness ensures those inclusions are monic.

API:

- **GriffithsFiltration.transverse** (projection): ∇F^p⊆F^{p−1}⊗Ω¹ for every integer p.
- **GriffithsFiltration.shift** (functoriality): F⟨m⟩^p=F^{p+m} is again transverse with shifted bounds.
- **GriffithsFiltration.trivial** (constructor): F^p=E for p≤0 and zero for p>0 is transverse.
- **GriffithsFiltration.isVHS_input** (compatibility): A variation from D3 forgets to this datum; this datum alone does not imply opposedness or a rational local system.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.test_trivial** (degenerate): The one-step filtration of a flat line is transverse and has zero graded Higgs field.
- **GriffithsFiltration.test_nonzero_symbol** (computation): On Q[x], take ∇=d+E21dx and F¹=Oe₁⊂F⁰=O². The filtration is transverse and its graded symbol sends [e₁] to [e₂]dx.
- **GriffithsFiltration.test_skip_two** (non-example): Take F²=F¹=Oe₁ and F⁰=O² with ∇=d+E21dx. ∇F² is not in F¹⊗Ω¹, so this filtration is rejected.

Acceptance:

- For an ordinary integrable connection (E,∇), a GriffithsFiltration is a bounded decreasing Z-indexed filtration F^pE by subbundles, exhaustive for p≤a and zero for p>b, with finite locally free successive quotients and ∇F^p⊆F^{p−1}⊗Ω¹. Only this filtration-to-graded algebra is defined here; a VHS additionally has the local-system/fibrewise Hodge data supplied by D3.

Prerequisites: HodgeStructuresPartII:H.0/ordinary-fiber; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.32. GriffithsFiltration.gradedHiggs: Associated graded Higgs field

**Node:** HodgeStructuresPartII:H.0/graded-higgs.

For G^p=F^p/F^{p+1}, define θ_p([e])=[∇e] in G^{p−1}⊗Ω¹. The direct sum G=⊕_pG^p is finite locally free and θ has degree −1. Changing a representative by F^{p+1} changes ∇e by F^p⊗Ω¹; the scalar derivative term e⊗da also lies there, so θ_p is O-linear.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use transversality to map F^p into F^{p−1}⊗Ω¹.
2. Quotient by F^p⊗Ω¹ using tensor exactness; ∇F^{p+1}⊆F^p⊗Ω¹ removes representative dependence.
3. In ∇(ae), the extra e⊗da vanishes modulo F^p⊗Ω¹.
4. Boundedness and finite locally free quotients give finite direct sum. Integrability is the separate symbol-square lemma.

API:

- **GriffithsFiltration.gradedHiggs_apply** (projection): θ_p([e])=[∇e] in G^{p−1}⊗Ω¹.
- **GriffithsFiltration.gradedHiggs_linear** (compatibility): Each degree-lowering symbol is O-linear.
- **GriffithsFiltration.gradedHiggs_shift** (compatibility): Shifting F only reindexes degrees; it does not change the underlying Higgs object.
- **GriffithsFiltration.gradedHiggs_nilpotent** (compatibility): For F exhaustive at a and zero above b, θ^[b−a+1]=0 when a≤b.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.gradedHiggs.test_line** (degenerate): The trivial filtration on (O,d) gives zero graded Higgs field.
- **GriffithsFiltration.gradedHiggs.test_E21** (computation): For the two-step Q[x] filtration, θ([e₁])=[e₂]dx≠0 and θ² as an ordered iterate is zero.
- **GriffithsFiltration.gradedHiggs.test_scalar** (compatibility): The class of ∇(ae) equals a[∇e]; retaining the e da term would incorrectly produce a connection instead of a Higgs field.

Acceptance:

- For G^p=F^p/F^{p+1}, define θ_p([e])=[∇e] in G^{p−1}⊗Ω¹. The direct sum G=⊕_pG^p is finite locally free and θ has degree −1. Changing a representative by F^{p+1} changes ∇e by F^p⊗Ω¹; the scalar derivative term e⊗da also lies there, so θ_p is O-linear.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:H.0/graded-higgs-integrable; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.33. GriffithsFiltration.gradedHiggs_integrable: Flat connection gives integrable symbol

**Node:** HodgeStructuresPartII:H.0/graded-higgs-integrable.

The degree −1 associated-graded symbol of a flat Griffiths-transverse connection has θ∧θ=0. Flatness ∇²=0 is essential. This is an exterior-square assertion; finite ordered nilpotence instead follows from filtration bounds.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Construct the unbundled quotient symbol using representative independence and O-linearity; no flat Higgs bundling is used in this step.
2. The composition maps G^p to G^{p−2}⊗Ω² and is represented by ∇_1∇e modulo F^{p−1}⊗Ω².
3. The coefficient dω term from ∇_1 lies in F^{p−1}⊗Ω² and vanishes in this quotient; the remaining symbol composite is θ∧θ.
4. The actual curvature ∇_1∇e is zero, giving the claimed equality.

Acceptance:

- The degree −1 associated-graded symbol of a flat Griffiths-transverse connection has θ∧θ=0. Flatness ∇²=0 is essential. This is an exterior-square assertion; finite ordered nilpotence instead follows from filtration bounds.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:H.0/exterior-extension; HodgeStructuresPartII:H.0/flat-extension-square; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: EG20, Lemma 4.9 p.132, displayed associated graded and transversality; The filtration-to-Higgs algebra is isolated from the separately unproved rigid-moduli/Simpson assertions in Lemma 4.9.

### I.34. GriffithsFiltration.reesConnection: Rees parameter connection

**Node:** HodgeStructuresPartII:H.0/rees-parameter.

On Rees_F(E)=Σ_p F^pE·t^(−p)⊂E[t,t⁻¹], use the generic DD.1 Rees carrier and construct D_Rees=t∇, relative to the parameter base so dt=0. Transversality sends e t^(−p) to ∇e t^(1−p), which belongs to Rees_F(E)⊗Ω¹. Its parameter is t, and its curvature vanishes.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Import the DD.1 finite split filtration/Rees module, its O[t]-local freeness and embeddings; do not build a second Rees carrier.
2. Define t∇ on Laurent sections with derivative only along the ringed-space direction. Transversality proves preservation of the Rees submodule.
3. The scalar rule on O[t] has coefficient t since dt=0. Curvature is t²∇²=0.
4. Use the imported fiber identifications for the specialization comparison below.

API:

- **GriffithsFiltration.reesConnection_apply** (projection): D(e t^(−p))=∇e t^(1−p).
- **GriffithsFiltration.reesConnection_parameter** (compatibility): The parameter is t and the differential is relative, with dt=0.
- **GriffithsFiltration.reesConnection_flat** (compatibility): Its curvature is zero when ∇ is flat.

Uses:

- EG20 §2.1/§4.2; LZ17 H02–H03; Heuer25 Definition 1.2: Shared intrinsic algebra for complex, crystalline and p-adic specializations; consumers use the named equations without choosing a global frame.

Discriminating unit tests:

- **GriffithsFiltration.reesConnection.test_one** (compatibility): At t=1 its operator identifies with ∇.
- **GriffithsFiltration.reesConnection.test_zero** (compatibility): At t=0 its operator identifies with the graded Higgs symbol.
- **GriffithsFiltration.reesConnection.test_relative** (non-example): Using absolute forms with dt≠0 violates the constant-parameter convention; there is no claim that t∇ extends as this absolute t-connection.

Acceptance:

- On Rees_F(E)=Σ_p F^pE·t^(−p)⊂E[t,t⁻¹], use the generic DD.1 Rees carrier and construct D_Rees=t∇, relative to the parameter base so dt=0. Transversality sends e t^(−p) to ∇e t^(1−p), which belongs to Rees_F(E)⊗Ω¹. Its parameter is t, and its curvature vanishes.

Prerequisites: HodgeStructuresPartII:H.0/griffiths-filtration; HodgeStructuresPartII:key/higgs-parameter-connections; HodgeStructuresPartII:H.0/exterior-extension; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

### I.35. GriffithsFiltration.reesSpecialization: Rees zero and unit fibers

**Node:** HodgeStructuresPartII:H.0/rees-specialization.

Under the generic finite split Rees identifications, (Rees_F(E),t∇)/(t) identifies as a Higgs object with (gr_F E,gr_F∇), and its /(t−1) fiber identifies as an ordinary connection with (E,∇). After t inversion, t⁻¹D_Rees identifies with ∇ on E[t,t⁻¹]. These are operator-compatible sheaf isomorphisms, not just rank or point equalities.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition.
- λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object.
- Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.

Construction or proof:

1. Use DD.1 Rees_F(E)/(t)≅⊕_pF^p/F^{p+1} and the t=1 identification.
2. Evaluate e t^(−p): modulo t the output represents [∇e] one degree lower; at t=1 it represents ∇e.
3. Invert t and use intrinsic rescaling, while retaining relative dt=0.

Acceptance:

- Under the generic finite split Rees identifications, (Rees_F(E),t∇)/(t) identifies as a Higgs object with (gr_F E,gr_F∇), and its /(t−1) fiber identifies as an ordinary connection with (E,∇). After t inversion, t⁻¹D_Rees identifies with ∇ on E[t,t⁻¹]. These are operator-compatible sheaf isomorphisms, not just rank or point equalities.

Prerequisites: HodgeStructuresPartII:H.0/rees-parameter; HodgeStructuresPartII:H.0/graded-higgs; HodgeStructuresPartII:H.0/intrinsic-rescale; DerivedDeRhamCohomology:DD.1; EnhancedDerivedSheaves:E1.

Source: LZ17, Theorem 2.1(i),(iii),(iv), PDF p.7; Remark 1.10 p.5; The source requires twisted fields, tensor, dual and pullback. This packet supplies their generic algebra, not the source correspondence or its nilpotence proof.

## H.0: affine coordinate parameter algebra

Fix commutative rings k and R with a k-algebra structure on R. Directions are indexed by Fin d. A frame specifies k-linear derivations δ_i, requires δ_iδ_j=δ_jδ_i and δ_i(λ)=0, and makes no invertibility assumption on λ. The coefficient module is R^V for a finite decidable index type V. Derivations act entrywise on vectors and matrices. Matrix action is on **column** vectors; juxtaposition denotes composition by matrix multiplication.

A preconnection is a matrix family A_i. Its differential operators are D_i=λδ_i+A_i. Flatness is a separate equation on curvature, not part of the preconnection's data. At λ=0 the model is a Higgs coefficient family; at λ=1 it satisfies the ordinary connection rule. The zero matrices represent the unit connection λd, which is generally not the zero operator.

This is an affine frame model. In an actual polynomial coordinate chart, curvature coefficients multiply dx_i∧dx_j. An arbitrary Frame, including the all-zero frame used by some small matrix tests, is not asserted to represent the universal Kähler differentials of R. General nonholonomic frames would need the bracket term, and are not included by the commuting-frame hypothesis.

All proposed names below live in the namespace TauCeti.Hodge.ParameterConnection.Affine. The twelve nodes are in HodgeStructuresPartII:H.0. Every dependency on another local node is explicit; their recursive prerequisite chains end in the nine read baseline declarations and elementary finite-coordinate algebra.

### 1. Frame: Commuting coordinate directions with constant parameter

Frame consists of d k-linear derivations δ_i:R→R, pairwise commuting on every a∈R, with δ_i(λ)=0. This is a specified affine frame, not a definition of a general differential site.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N and λ∈R; all derivations are k-linear.

Construction or proof outline:

1. Use the pinned Derivation carrier and record its pairwise commutation and constant-parameter equations.
2. Zero derivations give Frame.zero. On k[X_0,…,X_(d−1)], partial derivatives give Frame.polynomial with constant parameter C(c).
3. Prove polynomial commutation on monomials: successive removal of i,j has the same coefficient in both orders, including i=j; extend by k-linearity. Constants differentiate to zero.
4. Frame.one keeps the directions and uses δ_i(1)=0. No invertibility of λ is assumed.

API:

- **Frame.zero** (constructor): The all-zero directions give a frame for every d and λ.
- **Frame.polynomial** (constructor): The d-variable polynomial ring with partial derivatives and parameter C(c) gives a frame.
- **Frame.one** (constructor): Replace λ by 1 without changing directions.
- **Frame.zero_delta** (simp): Every zero-frame direction acts by zero.
- **Frame.polynomial_delta** (compatibility): The ith polynomial-frame direction is exactly MvPolynomial.pderiv i.
- **Frame.one_delta** (simp): The one-parameter frame has the input directions.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Frame.test_zero** (degenerate): In the one-direction zero frame, δ_0(a)=0 for every a.
- **Frame.test_polynomial_X** (computation): Over Q[X] with constant parameter 1, δ_0(X)=1.
- **Frame.test_identity_not_derivation** (non-example): Over Q, 1≠1·1+1·1; the identity map cannot satisfy the derivation Leibniz rule.

Acceptance: λ=X_0 with δ_0=∂_0 is excluded over Q since δ_0λ=1. Zero directions are allowed, but are not universal differential forms.

Prerequisites: mathlib:Derivation; mathlib:Derivation.leibniz; mathlib:MvPolynomial.pderiv; mathlib:MvPolynomial.derivation_ext.

### 2. Connection: Affine coordinate parameter connection

For a fixed Frame F, Connection is a family A_i∈Mat_V(R). It encodes D_i(s)=λδ_i(s)+A_i s before imposing flatness. F is an explicit type parameter: changing the directions or parameter is not a silent type identification.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use the matrix family as the sole data field.
2. Keep F explicitly in the structure declaration even though the matrix field alone does not mention F.
3. Construct zero matrices. Extensionality and constructor projection follow from the product representation.

API:

- **Connection.zero** (constructor): All zero matrices define a preconnection.
- **Connection.zero_matrix** (simp): The ith matrix of the zero preconnection is zero.
- **Connection.matrix_ext** (extensionality): Agreement of all matrices implies equality for the same F,V.
- **Connection.mk_matrix** (projection): The constructor on a family A projects to A_i.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_zero_matrix** (degenerate): Zero preconnection projects to zero.
- **Connection.test_constructor_projection** (characterisation): The ith projection of the constructor on A is A_i.
- **Connection.test_rank_one** (computation): Over Q with one zero direction, the supplied 1×1 matrix is unchanged by construction and projection.

Acceptance: No flatness or nilpotence is imposed on an arbitrary Connection. Any one-direction rank-one matrix family is accepted, including a nonzero scalar.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-frame.

### 3. Connection.operator: Coordinate parameter differential operator

Define the k-linear operator (D_i s)_v=λδ_i(s_v)+(A_i s)_v. It satisfies D_i(a s)=aD_i(s)+λδ_i(a)s and is generally not R-linear.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Apply the derivation in each coordinate, multiply by λ and add the matrix-vector action.
2. k-linearity follows from derivation k-linearity and R-linear matrix multiplication.
3. Expand δ_i(a s_v) using Leibniz and scalar commutation to get precisely one λ in the scalar derivative term.

API:

- **Connection.operator_apply** (projection): D_i(s)=λδ_i(s)+A_i s coordinatewise.
- **Connection.operator_leibniz** (characterisation): D_i(a s)=aD_i(s)+λδ_i(a)s.
- **Connection.operator_zero** (simp): Zero matrices give D_i(s)=λδ_i(s).

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_operator_zero_section** (degenerate): D_i(0)=0.
- **Connection.test_operator_unit** (computation): The zero-matrix model acts by λδ_i in every coordinate.
- **Connection.test_operator_polynomial_leibniz** (computation): Over Q[X] with λ=1 and A=0, D(Xs)=XD(s)+s.
- **Connection.test_operator_parameter_two** (non-example): On Q[X] with λ=2 and zero matrix, D(X)=2, not the ordinary derivative value 1.

Acceptance: Zero matrices give λδ, not the zero operator in general. At λ=1 the scalar derivative is the ordinary connection term.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec.

### 4. Connection.curvature: Coordinate curvature matrix

Define κ_ij=λδ_i(A_j)−λδ_j(A_i)+A_i A_j−A_j A_i with entrywise derivatives. In a genuine polynomial coordinate chart the two-form is Σ_(i<j)κ_ij dx_i∧dx_j.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Construct the displayed matrix expression using entrywise derivations.
2. Unfold to show κ_ii=0, κ_ji=−κ_ij and vanishing curvature for zero matrices.
3. For E12,E21 multiply E12 E21=E11 and E21 E12=E22; constant matrices have zero derivatives.

API:

- **Connection.curvature_self** (simp): κ_ii=0.
- **Connection.curvature_swap** (relation): κ_ji=−κ_ij.
- **Connection.curvature_zero** (simp): All zero matrices have zero curvature.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_curvature_self** (degenerate): Every diagonal-direction curvature is zero.
- **Connection.test_curvature_zero** (degenerate): All curvatures of zero matrices vanish.
- **Connection.test_curvature_noncommuting** (computation): With two zero directions over Q, λ=0, A_0=E12 and A_1=E21, κ_01=diag(1,−1).

Acceptance: On Q[x,y], E12 dx+E21 dy has curvature diag(1,−1)dx∧dy. The zero-direction Q test reproduces the same matrix coefficient without claiming universal forms.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; mathlib:Matrix.single.

### 5. Connection.operator_commutator: Commutator is curvature action

For every c,i,j and s∈R^V, D_i(D_j(s))−D_j(D_i(s))=κ_ij s.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Expand both compositions, including derivatives of λ and all matrix entries.
2. The second derivatives cancel by Frame.commute. Terms λδ_i(λ)δ_j(s) vanish by Frame.constant.
3. Use Leibniz inside finite sums; mixed A_iδ_j(s) terms cancel and remaining entries equal κ_ij s.

Acceptance: Without δλ=0 an extra term is λ(δ_iλ·δ_j(s)−δ_jλ·δ_i(s)). The E12/E21 commutator acts by diag(1,−1).

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec_mulVec.

### 6. Connection.IsFlat: Flatness of the coordinate model

Connection.IsFlat means κ_ij=0 for every i,j. It is equivalent to pairwise commuting D_i on every section, and does not assert nilpotence.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Define the predicate by the explicit curvature equalities.
2. The commutator theorem proves one direction.
3. For the converse evaluate the zero operator on each coordinate basis vector; every column of κ_ij vanishes.
4. For d=1 the only curvature is diagonal and hence zero.

API:

- **Connection.flatZero** (constructor): Zero matrices with their flatness proof give an element of the flat subtype.
- **Connection.isFlat_iff** (characterisation): Flatness iff D_iD_j(s)=D_jD_i(s) for all i,j,s.
- **Connection.isFlat_zero** (simp): The zero preconnection is flat.
- **Connection.isFlat_one_direction** (characterisation): Every one-direction model is flat.

Uses: HodgeStructuresPartII:H.0 reserved general Higgs/parameter interface: Provides local discriminating tests and transport formulas, not a substitute for intrinsic forms, sheaf descent or finite locally free coefficients. EG20 §4.2; LZ17 Remark 3.2: Checks the constant-parameter Leibniz equation and its specializations before any comparison theorem.

Discriminating unit tests:

- **Connection.test_flat_zero** (degenerate): Zero matrices give a flat model.
- **Connection.test_flat_line** (computation): Every one-direction model is flat.
- **Connection.test_flat_noncommuting** (non-example): The two-direction E12,E21 model over Q is not flat.

Acceptance: A scalar Higgs coefficient 1 on A¹_Q is flat but not nilpotent. Two directions with E12,E21 fail flatness.

Prerequisites: HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/operator-commutator.

### 7. Connection.gauge: Coordinate change by an invertible matrix

For a matrix unit G and the convention s′=Gs, define A′_i=G A_i G^−1−λδ_i(G)G^−1. The associated operator is G D_i G^−1 on the new component column.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Differentiate G G^−1=I to get δ_i(G^−1)=−G^−1δ_i(G)G^−1.
2. Expand G D_i(G^−1s′): its derivative coefficient is λ and its matrix coefficient has the displayed minus sign.
3. Its operator commutator is G[D_i,D_j]G^−1. Use the commutator node and coordinate basis evaluation to identify κ′_ij=Gκ_ijG^−1.
4. Invertibility of G proves preservation and reflection of curvature vanishing.

API:

- **Connection.gauge_matrix** (projection): A′_i=G A_i G^−1−λδ_i(G)G^−1.
- **Connection.gauge_curvature** (compatibility): κ′_ij=Gκ_ijG^−1.
- **Connection.gauge_flat** (equivalence): The gauge model is flat iff the original is flat.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_gauge_identity** (degenerate): Gauge by the identity unit fixes c.
- **Connection.test_gauge_flat** (compatibility): Every matrix-unit gauge preserves and reflects flatness.
- **Connection.test_gauge_zero_correction** (computation): Gauge of zero matrices has coefficient −λδ_i(G)G^−1.

Acceptance: The fixed convention is s′=Gs; the opposite convention changes the formula. Gauge of zero matrices need not have zero matrices when λδG≠0.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/operator-commutator; mathlib:Derivation.leibniz; mathlib:Matrix.mulVec_mulVec.

### 8. Connection.tensor: Tensor with the same parameter

For models c on R^V and b on R^W with the same F and λ, construct the free model on R^(V×W) with matrices A_i⊗I_W+I_V⊗B_i, using the Kronecker product. Its parameter is λ, not 2λ.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use the standard free-coordinate tensor identification and define the Kronecker sum.
2. Entrywise differentiate; the cross commutators cancel since A⊗I commutes with I⊗B. The remaining curvature is κ_c⊗I+I⊗κ_b.
3. On elementary tensors, λδ(s⊗t)=λδ(s)⊗t+s⊗λδ(t). Scalar balancing identifies the derivative term represented in either factor, so one λ occurs.
4. Vanishing of both input curvatures implies vanishing of the tensor curvature; no converse is claimed.

API:

- **Connection.tensor_matrix** (projection): The tensor matrix is A_i⊗I_W+I_V⊗B_i.
- **Connection.tensor_curvature** (compatibility): Tensor curvature is κ_c,ij⊗I_W+I_V⊗κ_b,ij.
- **Connection.tensor_flat** (compatibility): Flat inputs give a flat tensor.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_tensor_zero** (degenerate): The tensor of zero matrices is zero.
- **Connection.test_tensor_flat** (compatibility): The tensor of flat models is flat.
- **Connection.test_tensor_parameter** (characterisation): D_tensor,i(a s)=aD_tensor,i(s)+λδ_i(a)s.

Acceptance: Input parameters must agree. The balanced tensor scalar Leibniz rule has one λ derivative term.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Matrix.kronecker; mathlib:Derivation.leibniz.

### 9. Connection.dual: Coordinate dual parameter connection

Identify the dual of R^V with row coefficients transposed to a column, and define the dual matrix as −A_iᵀ. Keep the same F and λ.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Expand the evaluation-pairing equation λδ_i(φ(s))=D_dual,i(φ)(s)+φ(D_i(s)); its coefficient terms force −A_iᵀ.
2. Entrywise differentiation and reversal of products under transpose give κ_dual,ij=−κ_ijᵀ.
3. Double transposition recovers A, and curvature vanishing is preserved.

API:

- **Connection.dual_matrix** (projection): The dual ith matrix is −A_iᵀ.
- **Connection.dual_curvature** (compatibility): Dual curvature is −κ_ijᵀ.
- **Connection.dual_flat** (compatibility): The dual of a flat model is flat.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_dual_zero** (degenerate): The zero model has zero dual.
- **Connection.test_dual_involution** (compatibility): Taking the dual twice returns c.
- **Connection.test_dual_entry** (computation): The (v,w) dual entry equals −A_i(w,v).

Acceptance: Omitting the minus sign breaks compatibility with evaluation. This coordinate identification is only for finite free modules, not a claimed sheaf-duality construction.

Prerequisites: HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Matrix.transpose.

### 10. Connection.rescale: Rescaling an invertible parameter

For u∈R× and F with λ=u, define rescale(c) on F.one by matrices u^−1A_i. Its operator is u^−1D_i and curvature u^−2κ_ij; its scalar Leibniz coefficient is 1.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Differentiate u u^−1=1 and use δ_i(u)=0 to obtain δ_i(u^−1)=0.
2. Retain the same directions with parameter 1 and multiply every coefficient matrix by u^−1.
3. The new operator is δ_i(s)+u^−1A_i s=u^−1D_i(s). Expanding curvature scales derivative and commutator terms by u^−2.
4. Invertibility makes flatness equivalent. Merely changing λ's type while leaving A unscaled is incorrect.

API:

- **Connection.rescale_matrix** (projection): The rescaled matrix is u^−1A_i.
- **Connection.rescale_operator** (compatibility): The rescaled operator is u^−1D_i.
- **Connection.rescale_curvature** (compatibility): The rescaled curvature is u^−2κ_ij.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. EG20 §4.2; LZ17 Remark 3.2: Checks tensor/dual/parameter compatibility before any moduli or comparison theorem.

Discriminating unit tests:

- **Connection.test_rescale_flat** (compatibility): Rescaling preserves flatness.
- **Connection.test_rescale_zero** (degenerate): Zero matrices rescale to zero matrices.
- **Connection.test_rescale_leibniz** (characterisation): D_rescale,i(a s)=aD_rescale,i(s)+δ_i(a)s.

Acceptance: Over Q[X], the zero-matrix λ=2 model maps X to 2; rescaling maps X to 1. λ=0 and nonunit parameters do not admit this operation.

Prerequisites: HodgeStructuresPartII:H.0/coordinate-frame; HodgeStructuresPartII:H.0/operator; HodgeStructuresPartII:H.0/curvature; HodgeStructuresPartII:H.0/flatness; mathlib:Derivation.leibniz.

### 11. Connection.zero_parameter_curvature: Higgs specialization is the matrix commutator

At λ=0 the curvature is A_i A_j−A_j A_i. Flatness means commuting Higgs coefficients, not nilpotence.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Substitute λ=0 into the curvature definition.
2. Remove the zero derivative terms and retain the signed commutator coefficient.

Acceptance: E12 dx+E21 dy on A²_Q has curvature diag(1,−1)dx∧dy. The scalar dx on A¹_Q is integrable and not nilpotent.

Prerequisites: HodgeStructuresPartII:H.0/curvature.

### 12. Connection.JointNilpotent: Joint word nilpotence of Higgs coefficients

At λ=0, JointNilpotent(c,N) means N>0 and A_(i1)…A_(iN)=0 for every direction word of length N. This is a separate finite bound; no rank-one-zero assertion over nonreduced R is made.

The local hypotheses are k and R are commutative rings and R is a k-algebra. d∈N, λ∈R, F is a commuting constant-parameter Frame, and V is a finite decidable index type. Matrix products and scalar actions are over R, on the free coordinate module R^V.

Construction or proof outline:

1. Use all words of length N, not exterior products, and require N>0.
2. Zero matrices satisfy bound 1; one-letter words show that bound 1 iff every A_i=0.
3. For the dual a product equals (−1)^N times the transpose of the reversed original word, hence the same bound holds.
4. Compute E12²=0≠E12 and scalar ε²=0≠ε examples. The scalar 1 has nonzero word product at every positive length.

API:

- **Connection.jointNilpotent_zero** (simp): Zero matrices have bound 1.
- **Connection.jointNilpotent_dual** (compatibility): Duality preserves the stated bound N.
- **Connection.jointNilpotent_one_iff** (characterisation): Bound 1 iff every matrix is zero.

Uses: HodgeStructuresPartII:H.0 general Higgs/parameter interface: Pins local transport and specialization tests without substituting for global sheaf descent. LZ17 Remark 1.10 and Theorem 2.1: Distinguishes a separate finite nilpotence condition from integrability and keeps the coefficient ring visible.

Discriminating unit tests:

- **Connection.test_nilpotent_nonzero** (computation): In one direction over Q, E12 on Q² has bound 2 but is nonzero.
- **Connection.test_integrable_not_nilpotent** (non-example): The one-direction scalar 1 over Q is flat but not JointNilpotent(c,N) for any N.
- **Connection.test_nonreduced_rank_one** (computation): If ε²=0≠ε in R, the one-direction rank-one scalar ε model has bound 2 but is nonzero.

Acceptance: Scalar 1 in one direction over Q is flat but has no finite bound. For ε²=0≠ε in nonreduced R, a rank-one coefficient ε is nonzero with bound 2. The intrinsic finite-filtration comparison and tensor nilpotence bounds are now planned by H.0/nilpotence-equivalence and H.0/tensor-nilpotence; the exact E1 tensor-kernel contract and their global Lean signatures remain outstanding.

Prerequisites: HodgeStructuresPartII:H.0/preconnection; HodgeStructuresPartII:H.0/dual; HodgeStructuresPartII:H.0/flatness; HodgeStructuresPartII:H.0/zero-parameter-curvature; mathlib:Matrix.single.

### Why the tests discriminate

On A¹_Q, the scalar Higgs field dx has zero wedge curvature because there is only one direction, but every positive word product of its coefficient 1 remains 1. Thus integrability is not nilpotence. Conversely E12 dx on a rank-two free module has a genuinely nonzero coefficient with square zero. The nonreduced test is equally important: if ε²=0≠ε, a rank-one Higgs coefficient ε is nonzero and has bound 2. A rank-one-zero rule without a reducedness premise would fail it.

On A²_Q, E12 dx+E21 dy has coefficient curvature E11−E22=diag(1,−1). Replacing integrability by a vacuous exterior condition or by a property checked one direction at a time misses this obstruction. The zero-direction Q matrix test in the suggested file is a coefficient calculation; it is not a claim that Ω¹_Q/Q contains dx and dy.

The constant-parameter premise has a separate role. If commuting directions are ∂_x,∂_y, λ=x and A=0 over Q[x,y], then [x∂_x,x∂_y](y)=x. The displayed constant-parameter curvature expression would be zero. This model is deliberately excluded by δ_xλ=1. The distinction concerns relative constancy; no claim is made that the source's family parameter is an arbitrary nonconstant absolute-coordinate parameter.

For a unit u, rescaling multiplies both D and A by u^−1. The model with λ=2, A=0 on Q[X] sends X to 2, while the ordinary rescaled operator sends X to 1. Tensoring two same-parameter models uses the Kronecker sum, and its Leibniz rule still has λ once. Adding both scalar Leibniz terms as if they acted on an unbalanced tensor would produce an incorrect 2λ coefficient.

Gauge is fixed by the convention s′=Gs; its derivative correction is minus λδG·G^−1. Dual is minus transpose, not transpose. These signs are tested independently of flatness: zero curvature alone cannot detect a wrong coefficient formula in a one-direction model.

## Binding route inventory and remaining layers

The packet's routeManifest preserves all 149 routed item ids from eight accepted route records: the seven papers in the issue and the additional Liu–Zhu shared-prefix obligations. Counts are catalogue obligations, not a claim of 149 freshly verified statements. All eight accepted briefs and the key-definition assignment were read in both checkpoints. Only the selected fresh primary passages above were read in this continuation; reading a brief is not reading the corresponding proof.

- Landesman–Litt: 46 items, H.1–H.5. Retain canonical extensions, fixed parts, period derivatives, parabolic semistability and rank/Clifford bounds, Artinian deformation vanishing, rigidity and integrality. The brief's qualifications remain binding: Lemma 6.1.1 uses the specified isomorphic sublocal system; Proposition 5.2.4 is semistability, not stability; 8.3.3 needs a strict normal-crossing compactification; the 9.1.4 implication imports LL22 Theorem 1.2.5. These require fresh source proofs, not adoption on the strength of a label.
- Gao–Habegger: 3 items, H.2–H.3. Retain the weight-one holomorphic period map, connected monodromy/fixed parts, and the Hodge-generic invariant-subvariation to abelian-subscheme bridge. Common variations come from D3 and abelian geometry from its own supplier. Finite monodromy tests must allow trivial connected monodromy.
- Heuer: 1 item, H.0. The general Higgs carrier includes the explicit Ω¹(−1) twist. Definition 1.2 does not identify the whole p-adic essential image with a complex semistable vanishing-Chern-class locus. The correspondence and its choices remain with PadicHodgeTheoryPartIIPadicSimpson.
- Qian: 1 item, H.6. Preserve the proper semistable log-de Rham carrier, residue connecting morphism, exp(−2πiN), actions/eigenspaces and ramified base change. A disc cannot silently contain other singular fibres. This is a complex log-monodromy interface, not an ell-adic substitute.
- Bakker–Klingler–Tsimerman: 60 items, H.3/H.6/H.7. Preserve the general represented Mumford–Tate orbit inside the ambient period carrier, nilpotent and limiting-mixed structures, simultaneous splitting and norm estimates, finite fixed-K Siegel control, definability and individual algebraic Hodge-locus pullbacks. The brief's buffered domains, angular seam cover, splitting-independent multigrading, rough-monomial denominator conventions and exact Tate normalization require complete proof-level resolution. A countable union is not asserted definable.
- Benoist: 10 items, H.8. Preserve the full real Noether–Lefschetz supplier: real twisted geometric weight-two variations, transported classes, Kodaira–Spencer contraction, period derivative, boundary factorization, Green cone and Voisin kernel-cone interface. Do not rebuild the divisor-class theorem in MC.7, and do not create a backedge from the double-cover application to its variation foundations. Ordinary weak Lefschetz and the equivariant theorem are distinct inputs.
- Esnault–Groechenig: 26 items, H.1/H.5 plus H.0 foundations. Preserve stable moduli, torsion determinant, Riemann–Hilbert/Simpson on the correct component, End-zero rigidity, nilpotent rigid Higgs fields, smooth arithmetic models, λ-Hodge moduli and Griffiths graded objects. Lemma 4.9 explicitly relies on Simpson Theorem 9.1 and Lemma 7.2; this checkpoint does not close those references. Integral and strongly integral remain distinct.
- Liu–Zhu: H02 and H03, H.0. Preserve general ringed differential-site coefficients, twisted Higgs fields, intrinsic finite-filtration nilpotence, tensor/dual/pullback and Griffiths/Rees interfaces. Remark 3.2 supplies a t-connection specialization passage, not the missing global definition or its entire API.

The provisional layer organization is:

### H.0. Higgs fields and parameter connections

Supply the reserved general ringed-site finite-locally-free Higgs/λ-connection interface once: central parameter with dλ=0, integrability, explicit coefficient twist, tensor, dual, pullback, nilpotence bounds and Griffiths associated-graded construction. This continuation supplies the intrinsic reserved carrier and its algebra as plans; supplier contracts and the filtered-coefficient adapter remain open.

Declared draft prerequisites: CrystallineCohomology:CR.1; EnhancedDerivedSheaves:E1.

Coverage: partial intrinsic and affine prefix, with exact supplier and coefficient-adapter boundaries.

### H.1. Stable moduli and complex non-abelian Hodge theory

Build projective stable Betti, de Rham and Dolbeault moduli with the stated torsion determinant and vanishing-Chern-class component. Establish Riemann–Hilbert, Simpson and Hodge moduli after importing generic moduli foundations. Keep rank, determinant, stability and analytic/algebraic comparison hypotheses explicit. No p-adic correspondence is constructed here.

Declared draft prerequisites: HodgeStructuresPartII:H.0.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.2. Variations, canonical extensions and fixed parts

Import the common variation carrier from ShimuraData:D3, including fibrewise opposedness and Griffiths transversality. Add pure/mixed/admissible/graded-polarizable interfaces, canonical logarithmic extensions, Gauss–Manin, fixed-part and connected monodromy results. A complex variation is not assumed to have an integral lattice.

Declared draft prerequisites: HodgeStructuresPartII:H.0; ShimuraData:D3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.3. General period manifolds and period-map derivatives

Extend the parent's fibrewise period points to compact dual charts, Mumford–Tate orbit subdomains, holomorphic period maps and differential formulas. Keep the full ambient period carrier, tensor constraints and connected-component choices; the orbit equals the ambient domain only in the full-isometry specialization. Supply trace-pairing/Kodaira–Spencer period derivatives without duplicating common variations.

Declared draft prerequisites: HodgeStructuresPartII:H.2; tauceti:TauCetiRoadmap/HodgeStructures#milestone-l3--period-domain-points-the-symmetry-group.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.4. Parabolic bounds and unitary deformation vanishing

Plan Landesman–Litt parabolic weights, degrees, slopes, semistability and exact Clifford/rank bounds. Establish the sublocal-system rank theorem and Artinian unitary deformation vanishing with their separate hypotheses. Import curve Riemann–Roch, Serre duality, Clifford and Grassmannian foundations.

Declared draft prerequisites: HodgeStructuresPartII:H.1; HodgeStructuresPartII:H.2; HodgeStructuresPartII:H.3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.5. Rigid loci, arithmetic models and integral variations

Build rigid/cohomologically rigid fixed-determinant loci, End-zero tangent conventions, rigid Higgs nilpotence, equivariant rigid Hodge-moduli splitting, smooth arithmetic models and the zero-graded-Higgs/unitarity criterion. Add rigidity/integrality with quasi-unipotent boundary and finite determinant explicit. Distinguish integral from strongly integral; retain rank-one infinite-image unitary examples. Export to CartierFlows/RigidCompanions without importing those consumers.

Declared draft prerequisites: HodgeStructuresPartII:H.1; HodgeStructuresPartII:H.2; HodgeStructuresPartII:H.4.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.6. Semistable degeneration and logarithmic monodromy

Plan Qian's proper semistable log-de Rham interface, residue/monodromy comparison exp(−2πiN), finite group actions and ramified base-change normalization. Add BKT multivariable nilpotent orbits, monodromy weight filtrations, limiting mixed Hodge structures and splitting-independent norm estimates. Keep discs away from other singular fibres and use buffered charts covering angular seams.

Declared draft prerequisites: HodgeStructuresPartII:H.2.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.7. Definable period maps and algebraicity of Hodge loci

Retain the full BKT continuation: bounded-width positive-height sectors, fixed-canonical-K finite Siegel containment, multigrading estimates, period definability, individual special pullbacks and definable Chow. The exceptional Hodge locus is a countable union of closed irreducible algebraic subvarieties, not itself asserted definable. Untwisted rational tensors have type (0,0); (p,p) tensors require Tate twists.

Declared draft prerequisites: HodgeStructuresPartII:H.3; HodgeStructuresPartII:H.6.

Coverage: not_read; route brief is a requirement, not a source decomposition.

### H.8. Real Noether–Lefschetz variation interfaces

Retain the mandatory Benoist continuation: geometric weight-two real variations, transported Hodge classes, generic Kodaira–Spencer contraction, Griffiths derivative, normal-boundary factorization, Green open cones and the required Voisin kernel-cone interface. Supply RealSurfacePeriodIndex using common variations and the existing divisor-class supplier. Ordinary integral weak Lefschetz is not replaced by an equivariant variant. Double-cover families and application-specific vanishings remain with the consumer.

Declared draft prerequisites: HodgeStructuresPartII:H.3.

Coverage: not_read; route brief is a requirement, not a source decomposition.

## Remaining work and suggested-file boundary

H.0 is partial for the following exact reasons:

1. Discharge the CR.1 ordinary connection/exterior-calculus comparison and E1 sheaf tensor, finite dual evaluation, tensor-kernel exactness, pullback and descent requests; native sheaf carriers and presheaf tensor must be reused.
2. Discharge DD.1 finite split filtration/Rees carrier and specialization equations, then elaborate the global signatures listed in the suggested-file omission ledger.
3. Freshly source-decompose all other H.0 definitions/proof inputs required by the full 149-item route inventory; the reserved carrier and its present algebra are supplied as plans, not implementation.
4. Prove determinant/exterior-power connection functoriality and the coefficient-equivariance adapter for the p-adic Tate instance at declaration granularity; no choices of a Tate basis may erase Galois action.
5. Supply the filtered-coefficient/period-lattice adapter for Liu–Zhu Definition 3.5–3.6: its t-adic filtration is not a bounded subbundle filtration over the original period ring. Import graded base-ring and Tate degree identifications from DD.1 and the p-adic consumer; the finite Griffiths/Rees specialization here does not discharge that adapter.

The finite subbundle Griffiths construction is valid for the complex EG situation. Liu–Zhu Definition 3.5 instead uses an unbounded t-adic period-lattice filtration with t^iFil^j=Fil^{i+j}. Its quotients need not be locally free over the original period ring. Applying the finite-subquotient theorem to that ring would add a false hypothesis. The filtered coefficient ring, degree-zero graded specialization and Tate-character adapter are explicit remaining work; the p-adic consumer and DD.1 must provide their exact comparison. This boundary is retained even though the ordinary relative t-rescaling calculation is valid.

H.1–H.8 retain their exact inherited remaining lists, all binding source tranches and all 149 route ids. In particular real Noether–Lefschetz H.8 is mandatory. Complete source/declaration decomposition and suitable exact supplier nodes remain outstanding; no unread theorem is represented as an implemented planet. The parent and directly used CR.1/E1/DD.1/D3 stage contracts were read. Blueprint and integrated link entries and the atlas stage edges were screened for HodgeStructuresPartII and DegeneratingHodgeStructures at the base tree; none named this successor. This is not a claim that every downstream supplier link was fully audited.

The suggested file retains all twelve affine signatures, their APIs and thirty-one examples. It adds a native ring-level additive-balanced core against existing derivations and tensor products. Its TwoForms input contains concrete degree-zero/one/two operations and their defining equations, not a fictitious curvature proposition. It models arbitrary modules in a local chart and does not claim to be the global sheaf object. Every global signature, API and unit test that cannot yet be expressed against the missing sheaf monoidal/filtered interfaces is explicitly listed in its omission ledger, with the actual mathematical statement and the missing carrier. There are no fabricated Proposition-valued stand-ins for those objects. Higher-degree statements are not justified by a truncation to two forms. The entire current file was elaborated by codex-J6LwjP with Lean v4.34.0-rc2 and the existing Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build: zero errors and 106 sorry warnings. All imports are Mathlib modules, so this check does not require or certify a built Tau Ceti tree. The continuation repaired the reserved lambda identifier, implicit frame inference, independent universes for finite index types, polynomial scalar annotations and explicit matrix-unit inverse coercions. These repairs change no mathematical node, source, supplier request or global omission. No Lake project/cache setup, library build or language server was started.

The six selected planets are Integrable parameter bundles, Twisted Higgs bundles, Joint Higgs nilpotence, Griffiths filtrations, Graded Higgs field and Rees parameter connection. The former affine preconnection and coordinate-curvature planets were removed so the layer shows its intrinsic definitions and remains within the six-planet limit. All affine node ids survive.


## Retained affine declaration IDs

These IDs continue to name the coordinate models; the intrinsic equivalence requires the genuine local form bases specified above.

| Node | Suggested declaration |
| --- | --- |
| `HodgeStructuresPartII:H.0/coordinate-frame` | `Frame` |
| `HodgeStructuresPartII:H.0/preconnection` | `Connection` |
| `HodgeStructuresPartII:H.0/operator` | `Connection.operator` |
| `HodgeStructuresPartII:H.0/curvature` | `Connection.curvature` |
| `HodgeStructuresPartII:H.0/operator-commutator` | `Connection.operator_commutator` |
| `HodgeStructuresPartII:H.0/flatness` | `Connection.IsFlat` |
| `HodgeStructuresPartII:H.0/gauge` | `Connection.gauge` |
| `HodgeStructuresPartII:H.0/tensor` | `Connection.tensor` |
| `HodgeStructuresPartII:H.0/dual` | `Connection.dual` |
| `HodgeStructuresPartII:H.0/invertible-rescale` | `Connection.rescale` |
| `HodgeStructuresPartII:H.0/zero-parameter-curvature` | `Connection.zero_parameter_curvature` |
| `HodgeStructuresPartII:H.0/joint-nilpotence` | `Connection.JointNilpotent` |

## Elaboration continuation — codex-J6LwjP

This continuation rechecked the reviewed parent L0–L3 audit and the D3/E1 audit boundaries, read the full parent document, and inspected the pinned additive tensor-lift and unit-inverse statements. It adds no mathematical nodes or source-reading claims. The preceding continuation’s PDF/model/projection receipts are retained as historical evidence; they were not rerun here. The current Lean check exercises all 44 native example signatures, including the nonreduced rank-one example with a universe-polymorphic coefficient ring. The 35 global nodes, 65 APIs and 54 tests listed only in the omission ledger still require actual supplier interfaces and native signatures. Compilation checks types; it does not prove the sorry goals or close H.0.


## Coordinate determinant continuation — codex-J6LwjP

The fixed-determinant conditions of EG require the induced line connection, not merely the underlying line bundle. On a chosen finite free chart, its coefficient is the trace of the matrix. This continuation supplies that local model over any commutative coefficient ring. It does not construct a determinant sheaf or identify arbitrary global tensors with tensors of global sections.

### Coordinate determinant parameter connection

Declaration: Connection.determinant. Node: HodgeStructuresPartII:H.0/determinant-coordinate.

For the finite free coordinate model c with matrices A_i, construct a rank-one coordinate model det(c) with the same F and λ and one-by-one matrix tr(A_i). Its section operator is s ↦ λδ_i(s)+tr(A_i)s. This is the local coefficient model for the induced top exterior-power connection; the global determinant sheaf, the wedge identification and change-of-frame descent are separate supplier/bridge obligations. Rank zero gives the unit-line connection with zero coefficient.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Define the rank-one matrices by the existing matrix trace, summing diagonal entries; reuse the existing coordinate Connection carrier with index Fin 1.
2. The operator formula follows from the existing operator equation. The scalar derivative term has λ, not rank(V)λ; the rank only multiplies scalar coefficient matrices.
3. This construction uses no scalar division, exterior-sheaf construction or global frame choice. Its identification with a top exterior power is recorded as a separate gap, not an assumed theorem.

Uses:

- EG author §1 Definition 1.1 and §2.1; HodgeStructuresPartII:H.1/H.5: Provide the local coefficients needed for the fixed-determinant connection and trace-zero Higgs condition without assuming an arbitrary connection has trace zero.
- HodgeStructuresPartII:H.0/determinant-curvature: Identify the scalar curvature and prove flatness is preserved.
- HodgeStructuresPartII:H.0/determinant-tensor and HodgeStructuresPartII:H.0/determinant-dual: Test determinant compatibility and rank multiplicities before global exterior-power descent.

API:

- Connection.determinant_matrix (projection): The sole matrix entry of det(c) in direction i equals tr(A_i). Promoted to determinant-matrix for downstream use.
- Connection.determinant_operator (projection): On the coordinate line, D_det,i(s)(0)=λδ_i(s(0))+tr(A_i)s(0).
- Connection.determinant_curvature (compatibility): The sole curvature entry of det(c) in directions i,j is tr(κ_c,ij). Promoted to determinant-curvature for downstream use.

Tests:

- Connection.test_determinant_rank_zero (degenerate): For an empty index Fin 0, det(c) is the rank-one zero-coefficient model; the determinant is not the zero module.
- Connection.test_determinant_rank_one (compatibility): For index Fin 1, det(c)=c.
- Connection.test_determinant_scalar_rank_two (computation): For A_i=a_i I_2, the determinant connection coefficient is 2a_i, not a_i² and not a rank-scaled parameter.
- Connection.test_determinant_flat_no_converse (non-example): For λ=0, two zero directions over Q and A_0=E12, A_1=E21, det(c) is flat while c has nonzero diagonal(1,−1) curvature.

Acceptance:

- Distinguish trace(A_i) from the algebraic determinant of A_i.
- The model preserves the source parameter at every rank, including rank zero.
- Trace loses information: flatness of det(c) has no converse.

Prerequisites: HodgeStructuresPartII:H.0/preconnection, HodgeStructuresPartII:H.0/operator, mathlib:Matrix.trace.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Matrix of the coordinate determinant connection

Declaration: Connection.determinant_matrix. Node: HodgeStructuresPartII:H.0/determinant-matrix.

The unique matrix entry of det(c) in direction i is tr(A_i).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Project the defining one-by-one matrix from the coordinate construction.

Acceptance:

- The coefficient is trace, not determinant.

Prerequisites: HodgeStructuresPartII:H.0/determinant-coordinate.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Curvature of the determinant coordinate line

Declaration: Connection.determinant_curvature. Node: HodgeStructuresPartII:H.0/determinant-curvature.

For all i,j, the unique entry of κ_det(c),ij is tr(κ_c,ij)=λδ_i(tr A_j)−λδ_j(tr A_i).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use determinant-matrix and expand the coordinate curvature. One-by-one coefficient commutators vanish because R is commutative.
2. Apply AddMonoidHom.map_trace to each derivation, commuting differentiation with the finite diagonal sum. Apply trace_add, trace_sub and trace_smul to the original curvature.
3. Matrix.trace_mul_comm identifies tr(A_i A_j) and tr(A_j A_i); their difference cancels. No division by rank or by two is used.

Acceptance:

- Valid over any commutative coefficient ring, including characteristic two.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/curvature, mathlib:AddMonoidHom.map_trace, mathlib:Matrix.trace_mul_comm, mathlib:Matrix.trace_add, mathlib:Matrix.trace_sub, mathlib:Matrix.trace_smul.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Flat connections have flat determinant models

Declaration: Connection.determinant_flat. Node: HodgeStructuresPartII:H.0/determinant-flat.

If c is flat, det(c) is flat. A flat determinant model does not imply that c is flat.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Apply determinant-curvature and trace_zero to every vanishing input curvature matrix; a one-by-one matrix vanishes exactly when its entry does.
2. The test with two noncommuting off-diagonal matrix units has nonzero trace-zero curvature and refutes the converse.

Acceptance:

- Do not replace the full integrability condition by trace-zero curvature.

Prerequisites: HodgeStructuresPartII:H.0/determinant-curvature, HodgeStructuresPartII:H.0/flatness, mathlib:Matrix.trace_zero.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Determinant model commutes with duality

Declaration: Connection.determinant_dual. Node: HodgeStructuresPartII:H.0/determinant-dual.

The coordinate models det(c.dual) and det(c).dual are equal, with the same F and λ.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use the inherited dual coefficient −A_iᵀ. Trace_neg and trace_transpose give tr(−A_iᵀ)=−tr(A_i).
2. The one-by-one matrices agree by determinant-matrix; connection extensionality gives equality.

Acceptance:

- The minus sign is required; transpose alone is wrong.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/dual, mathlib:Matrix.trace_transpose, mathlib:Matrix.trace_neg.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Tensor determinant rank multiplicities

Declaration: Connection.determinant_tensor_matrix. Node: HodgeStructuresPartII:H.0/determinant-tensor.

For c on R^V and b on R^W with the same F and λ, the determinant coordinate coefficient of c.tensor(b) in direction i is rank(W)tr(A_i)+rank(V)tr(B_i), with natural ranks cast into R.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Use the inherited Kronecker-sum coefficient A_i⊗I_W+I_V⊗B_i.
2. Apply trace_add and Matrix.trace_kronecker, then trace_one. Commute the scalar factors in R to obtain the displayed rank coefficients.
3. The section operator still has parameter λ. This coefficient identity alone is not the global determinant-line tensor isomorphism.

Acceptance:

- Ranks appear as elements of R and can vanish in positive characteristic; they are not inverted.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/tensor, mathlib:Matrix.trace_kronecker, mathlib:Matrix.trace_one, mathlib:Matrix.trace_add.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

### Curvature under coordinate change

Declaration: Connection.gauge_curvature. Node: HodgeStructuresPartII:H.0/gauge-curvature.

For the coordinate transformation s′=Gs and every invertible matrix G, curvature transforms as κ_gauge(c,G),ij=G κ_c,ij G⁻¹. This is the promoted curvature API of the inherited gauge construction.

Proof:

1. Differentiate GG⁻¹=I entrywise. The matrix product Leibniz rule gives δ_i(G⁻¹)=−G⁻¹δ_i(G)G⁻¹ by multiplying the resulting zero identity on the left by G⁻¹.
2. Insert the defined coefficient G A_i G⁻¹−λδ_i(G)G⁻¹ into the curvature formula. Use the preceding inverse derivative, the relatively constant parameter and commutation of the coordinate derivations to cancel all terms with derivatives of G; the remaining expression is G(λδ_iA_j−λδ_jA_i+[A_i,A_j])G⁻¹. Finite matrix sums and multiplication are over the commutative ring R.

Prerequisites: HodgeStructuresPartII:H.0/gauge, HodgeStructuresPartII:H.0/curvature, HodgeStructuresPartII:H.0/coordinate-frame, mathlib:Derivation.leibniz.

Source: EG author preprint §4.2 pp.23–24 parameter rule, with explicit coordinate derivation. This promotes the inherited gauge curvature API without adding a second declaration.

### Determinant curvature is gauge invariant

Declaration: Connection.determinant_gauge_curvature. Node: HodgeStructuresPartII:H.0/determinant-gauge-curvature.

For every invertible coordinate matrix G, the one-by-one curvature entry of det(c.gauge(G)) equals that of det(c).

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- F is the existing coordinate Frame: its k-linear derivations commute and annihilate λ. Every coordinate model uses this same frame.
- The index types V and W are finite decidable types. No positive rank, characteristic-zero or invertibility of rank is assumed.

Proof or construction:

1. Apply determinant-curvature on both sides and the inherited gauge curvature identity κ_gauge=G κ G⁻¹.
2. Matrix.trace_units_conj proves equality of the two traces. This requires no derivative of det(G).
3. This is curvature invariance only; the connection coefficient still has its trace of the derivative correction. A global determinant descent theorem also needs the induced frame det(G) and the Jacobi derivative formula.

Acceptance:

- Do not assert that the determinant connection matrices themselves are unchanged under a nonconstant gauge.

Prerequisites: HodgeStructuresPartII:H.0/determinant-curvature, HodgeStructuresPartII:H.0/gauge-curvature, mathlib:Matrix.trace_units_conj.

Source: EG author preprint, §1 p.2, §2.1 pp.5–6 and §4.2 pp.23–24; algebraic coordinate derivations, not separately asserted source theorems.

The new public source is the 44-page author preprint at https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf, retrieved on 2026-10-02 with SHA-256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. The published PDF returned HTTP 403 in this continuation; its historical receipt remains. Only the selected fixed-determinant/Higgs/parameter passages were freshly read. No complete edition collation or new erratum is claimed.

The global determinant/exterior-power bridge remains a gap: import locally free exterior powers and determinant lines from E1, define the induced alternating operator, prove its trace expression in a top-wedge frame, and prove the det(G) transition law using the Jacobi derivative identity before descent. Curvature invariance alone is insufficient. All 35 global signature omissions and later-stage source obligations remain.

The expanded entire suggested file elaborated at the exact pinned Mathlib commit with zero errors, 118 sorry warnings, no other warnings and 48 native examples. The global omission ledger remains unchanged. The packet checker and five-file intake pass; actual atlas projection preserves all 18 required layer edges without pending/skipped links and is acyclic. Fresh exact polynomial/Laurent gauges over characteristics zero, two and three support the determinant formulas; reproduction counts and hashes are in the handoff.
