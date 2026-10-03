# Hodge structures (pure, mixed, and polarized), Part II

## Continuation scope and conventions

This partial checkpoint has 112 declaration nodes: 12 definitions, 24 constructions, 57 lemmas, 14 theorems and 5 comparisons. It has 147 API items, 139 required definition/construction tests and 141 total tests, 135 pinned baseline references and six H.0 planets. All nodes remain unchecked; H.0 is partial and H.1–H.8 not_read. The current full-sketch and separate native-proof receipts appear in the handoff and the final section below. The 35 inherited global signature omissions remain. No stage or reserved key is closed.

The reserved **HodgeStructuresPartII:key/higgs-parameter-connections** is now supplied as a mathematical declaration plan. It defines finite locally free coefficients on a general commutative ringed differential site with an actual additive λ-Leibniz operator, a defined exterior extension and curvature-zero equality. Its sheaf tensor, ordinary-connection and filtration prerequisites are explicit supplier requests. The twelve inherited free affine matrix nodes remain as examples and sign tests. They are not the definition of the global object.

A differential site means a ringed Grothendieck site with **specified** relative exterior forms, restrictions, wedge and d, satisfying the exterior and differential identities. This is not a theorem that every ringed site admits locally free universal differentials. The general connection carrier accepts forms that are not locally free. Finite local freeness of Ω¹ is imposed exactly for the coordinate, symmetric action, nilpotence-kernel and subbundle quotient arguments that need it. The coefficient bundle E is finite locally free, with locally constant rank; there need not be a single global frame or one fixed rank on disconnected components. Commutative coefficients admit nonreduced and positive-characteristic examples. No integral lattice, determinant, trace or stability is silently included.

The parameter is central and relatively constant, dλ=0. In a family over k[t], this means the differential is relative to the parameter base: dt=0. Inverting t is allowed only with this convention. An absolute differential with dt≠0 is a different input. All tensor products are **sheaf tensors**. Formulas on elementary tensors are local formulas checked after a cover and glued; there is no identification of global sections of a tensor sheaf with tensor products of global sections.

For E-valued forms the convention is E followed by forms. The extension is D_n(e⊗ω)=D(e)∧ω+λe⊗dω. Its right graded Leibniz rule has a sign (−1)^n in the term λu∧dω when u has degree n. Curvature is D_1∘D:E→E⊗Ω². Ordered Higgs iterates use Q^⊗N, not ∧^NQ. Thus exterior integrability and finite tensor nilpotence are distinct properties even on a line.

## Ownership and reviewed baseline

The parent tauceti:TauCetiRoadmap/HodgeStructures owns the existing fibrewise pure, mixed and polarized structures and period-domain points. Its HodgeStructures and the nearby ReductiveGroups upstream documents were read completely for scope and density. None of their linear algebra is replanned here. The initial checkpoint's statement that the reviewed coverage had no parent Hodge entries was a lookup error. At continuation tree dc0c470bcc064a08d8d9161ea963afe12b2c4b8d, **AUDIT-02** marks L0, L1 and L3 built, and L2 partly built: its mixed-Hodge abelian-category object packaging is incomplete, while its main filtration/strictness/bigrading results are recorded as built. These verdicts are imported; no new claim of implementation is made on a roadmap-name search.

**AUDIT-10** marks ShimuraData:D3's common variation interface not built. D3 remains the sole owner of the local-system, holomorphic filtered-bundle, fibrewise opposedness and Griffiths-transversality variation datum. This continuation defines the algebra of a filtered connection, which alone is not a variation. It does not infer that a complex variation has an integral lattice.

**AUDIT-22** marks EnhancedDerivedSheaves:E1 partly built. Module sheaves already exist as Mathlib SheafOfModules; locally free sheaves already have SheafOfModules.IsLocallyFree. PresheafOfModules.Monoidal.tensorObj supplies the objectwise presheaf tensor and its restrictions. E1 is requested only for the missing sheaf tensor/coherence, finite dual/evaluation, tensor exactness with locally free coefficients, pullback and descent. A request to construct the native module-sheaf carrier again would duplicate the baseline. IsLocallyFree alone does not assert finite rank: finite local generator types must be an explicit extra premise.

CrystallineCohomology:CR.1 owns the ordinary integrable relative connection carrier and its convention of extended differentials. It supplies the λ=1 comparison; quasi-nilpotence, smooth-lift and nilpotent-base hypotheses belong to its crystal comparison. Arbitrary flat connections are not identified with crystals. DerivedDeRhamCohomology:DD.1 owns the generic filtered/Rees carrier and the associated quotient/fiber coherences; this successor constructs the particular t∇ operator. Finite split Rees modules need no derived-completion premise. AdicSpacesPartII:R0 supplies analytic differentials for p-adic specialization; its full analytic constructions are not duplicated by a formal choice of Ω.

The canonical pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Both trees were searched thoroughly for Higgs, λ-connection, LambdaConnection and ParameterConnection. The Mathlib Higgs hits concern matroids, while neither tree gives this general parameter category. Positive citations were checked by reading actual Lean statements. The original fifteen references comprised the nine retained affine prerequisites and SheafOfModules, IsLocallyFree, presheaf tensorObj, KaehlerDifferential.D, TensorProduct.liftAddHom and liftAddHom_tmul. In particular, the additive balanced tensor lift exists already and is reused: an ordinary O-linear tensor lift cannot descend D by falsely assuming D is O-linear.

Near misses were inspected directly. Mathlib CovariantDerivative is for smooth manifold bundles, with differentiability hypotheses in its local Leibniz law. It does not supply the ringed-site λ carrier. TauCeti.AlgebraicGeometry.InvertibleSheaf is the native full subcategory of scheme module sheaves satisfying the invertible predicate; its file expressly leaves tensor/Picard completion to subsequent files. Presheaf relative differentials are available, but first differentials are not an automatic complete exterior calculus with sheaf tensor and descent. These objects receive no replacement nodes.

## Fresh source receipts and proof boundaries

The following source receipts belong to the inherited checkpoints; this worker does not claim to have repeated those wider readings. On 2 October 2026 the three inherited PDFs were retrieved again from their public URLs and matched the original hashes. The continuation directly read these passages:

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

The suggested file retains all twelve affine signatures, their APIs and thirty-one examples. It adds a native ring-level additive-balanced core against existing derivations and tensor products. Its TwoForms input contains concrete degree-zero/one/two operations and their defining equations, not a fictitious curvature proposition. It models arbitrary modules in a local chart and does not claim to be the global sheaf object. Every global signature, API and unit test that cannot yet be expressed against the missing sheaf monoidal/filtered interfaces is explicitly listed in its omission ledger, with the actual mathematical statement and the missing carrier. There are no fabricated Proposition-valued stand-ins for those objects. Higher-degree statements are not justified by a truncation to two forms. Historical receipt for codex-J6LwjP’s intrinsic checkpoint: that entire file was elaborated by codex-J6LwjP with Lean v4.34.0-rc2 and the existing Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build: zero errors and 106 admitted-declaration warnings. All imports are Mathlib modules, so this check does not require or certify a built Tau Ceti tree. The continuation repaired the reserved lambda identifier, implicit frame inference, independent universes for finite index types, polynomial scalar annotations and explicit matrix-unit inverse coercions. These repairs change no mathematical node, source, supplier request or global omission. No Lake project/cache setup, library build or language server was started.

The five selected planets are Integrable parameter bundles, Twisted Higgs bundles, Joint Higgs nilpotence, Griffiths filtrations, Graded Higgs field and Rees parameter connection. The former affine preconnection and coordinate-curvature planets were removed so the layer shows its intrinsic definitions and remains within the five-planet limit. All affine node ids survive.


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

This continuation rechecked the reviewed parent L0–L3 audit and the D3/E1 audit boundaries, read the full parent document, and inspected the pinned additive tensor-lift and unit-inverse statements. It adds no mathematical nodes or source-reading claims. The preceding continuation’s PDF/model/projection receipts are retained as historical evidence; they were not rerun here. The current Lean check exercises all 44 native example signatures, including the nonreduced rank-one example with a universe-polymorphic coefficient ring. The 35 global nodes, 65 APIs and 54 tests listed only in the omission ledger still require actual supplier interfaces and native signatures. Compilation checks types; it does not prove the admitted-declaration goals or close H.0.


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

Historical receipt from the preceding codex-J6LwjP checkpoint ONLY (SHA-256 df692430d323e907f4a419970dbde6f4a72a6d354f5759a96a1c5a42c7c154e7; not the current changed file): the expanded entire suggested file elaborated at the exact pinned Mathlib commit with zero errors, 118 admitted-declaration warnings, no other warnings and 48 native examples. The global omission ledger remains unchanged. The packet checker and five-file intake pass; actual atlas projection preserves all 18 required layer edges without pending/skipped links and is acyclic. Fresh exact polynomial/Laurent gauges over characteristics zero, two and three support the determinant formulas; reproduction counts and hashes are in the handoff.


## Current continuation: determinant derivative and frame bridge

Codex — codex-a71f92, issue #3371; immutable audit tree f9cfbaf2b11b46e79508bfaa1c4d60823bd266de. Five finite-coordinate declaration plans are added; all 55 preceding node objects, their 103 API items and 89 planned definition/construction tests, the six planets, eight binding route entries and source-issue records are preserved. Older checkpoint counts/compilation receipts describe their own exact bytes only.

The EG author-hosted preprint was freshly retrieved at SHA-256 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. Fresh selected reading: §1 p.2 fixed-determinant opening/Definition 1.1/Remark 1.2; §2.1 pp.5–6 Higgs/trace-zero definitions and complete printed Lemma 2.1 proof; §4.2 pp.23–24 parameter definition and complete printed Lemma 4.9 proof. Simpson's cited results are not freshly verified. This is the 44-page author version, not the 56-page Acta bytes; no complete edition collation, new erratum or full-paper reading is claimed.

Ownership screening found **ColemanPowerSeries:L1/derivation-determinant-unit** already plans the general matrix-unit Jacobi formula with exactly these commutative-ring/native-derivation hypotheses. Its whole node and proof outline were read. It is imported, not duplicated or moved, and a fifth supplier request makes that exact dependency explicit. Its trace orientation G⁻¹δG is converted to δG G⁻¹ by the pinned Matrix.trace_mul_comm; multiplying by det(G⁻¹) gives the scalar logarithmic-derivative version. The supplier proof uses existing dual numbers and first-order determinants, not a new Hodge or sheaf input. The row-derivative and row-action helpers below remain separate local alternating-evaluation inputs and do not replan the unit Jacobi theorem.

Pinned Mathlib supplies alternating determinants, row additivity/scalar linearity, duplicate-row vanishing, determinant multiplication/transposition, determinant/scalar homomorphisms and native unit transport. Tau Ceti's Matrix.sum_det_updateRow_mul_row is already built for column weights d_j S_rj; its entire pinned module was read. It is not the general derivation or left row-action identity. CR.1/E1/DD.1/D3 contracts remain unchanged; no sheaf/exterior or common-variation carrier is duplicated.

### Derivation of a determinant by row replacements

Declaration: det_derivation_rows. Node: HodgeStructuresPartII:H.0/determinant-derivation-rows.

For a k-linear derivation δ:R→R and any square matrix S, δ(det S)=Σ_r det(updateRow S r (j↦δ(S_rj))). S need not be invertible.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.

Proof plan:

1. Use the pinned det_apply' permutation formula. Additivity moves δ through the finite sum; Derivation.map_intCast kills each integer-valued permutation sign.
2. Induct over the finite product for each permutation: δ(Π_j S_(σj),j)=Σ_j δ(S_(σj),j) Π_{l≠j} S_(σl),l. The empty product derivative is δ(1)=0. This is an induction using the existing Leibniz rule, not a new generic product carrier.
3. For a fixed permutation, the row-replacement determinant has exactly one differentiated factor, in the column j=σ⁻¹(r). Reindex the finite row sum r=σ(j), then exchange the permutation and column sums. The permutation sign is unchanged.
4. No inverse is introduced. The argument also works for singular matrices, repeated rows and characteristic two; do not prove alternating vanishing by cancelling 2.

Acceptance:

- The 0×0 determinant is 1, whose derivative and empty row sum are zero.
- For S=diag(x,x) over F₂[x], δ(det S)=δ(x²)=0, and the two replacement terms cancel in characteristic two.
- The formula applies to singular matrices; invertibility is added only at the unit Jacobi node.

Prerequisites: mathlib:Derivation.leibniz, mathlib:Derivation.map_intCast, mathlib:Derivation.map_one_eq_zero, mathlib:Matrix.det_apply'.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Trace of infinitesimal left row action

Declaration: sum_det_updateRow_left_mul. Node: HodgeStructuresPartII:H.0/determinant-row-action.

For square matrices A and S over R, Σ_r det(updateRow S r ((A*S)r)) = tr(A) det(S). S is arbitrary, including singular matrices.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.

Proof plan:

1. Expand (A*S)_r=Σ_j A_rj • S_j using the native matrix multiplication finite sum.
2. For each fixed replacement row r, use determinant additivity and scalar linearity in that row to move this sum outside: Σ_j A_rj det(updateRow S r S_j). Finite-sum linearity follows by induction from det_updateRow_add and det_updateRow_smul.
3. If j≠r, the replacement matrix has rows j and r equal, so det_updateRow_eq_zero applies. This native alternating lemma works in characteristic two without dividing by 2.
4. The only surviving term is j=r, with updateRow S r S_r=S. Sum A_rr det(S) over r and identify the diagonal sum with Matrix.trace. In rank zero both sides vanish.

Acceptance:

- For A=diag(a,b) and S=diag(x,y), the sum is (a+b)xy.
- An off-diagonal elementary A has trace zero, and every nonzero candidate replacement term has duplicated rows.
- Do not confuse this statement with Tau Ceti's existing column-weight identity sum_det_updateRow_mul_row, whose replacement entries are d_j S_rj, not (A*S)_rj.

Prerequisites: mathlib:Matrix.det_updateRow_add, mathlib:Matrix.det_updateRow_smul, mathlib:Matrix.det_updateRow_eq_zero, mathlib:Matrix.trace.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Determinant coefficient under coordinate change

Declaration: Connection.determinant_gauge_matrix. Node: HodgeStructuresPartII:H.0/determinant-gauge-matrix.

For the inherited convention s′=Gs and frame F, (det(c.gauge G)).matrix_i,0,0 = tr(A_i) − λ det(G⁻¹) δ_i(det G). The determinant connection coefficient is not generally gauge invariant.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Apply determinant_matrix to c.gauge G, then the inherited gauge_matrix formula A′_i=G A_i G⁻¹−λ(δ_iG)G⁻¹.
2. Move trace through subtraction and scalar multiplication using the existing trace_sub and trace_smul declarations; trace_units_conj reduces the first term to tr(A_i).
3. Import ColemanPowerSeries:L1/derivation-determinant-unit with δ=F.delta i and use the pinned Matrix.trace_mul_comm to match its G⁻¹δG trace orientation. Multiply its identity by det(G⁻¹), using determinant multiplicativity and the matrix-unit inverse law; this logarithmic form converts the trace of the derivative correction into det(G⁻¹)δ_i(det G).
4. Keep the minus sign dictated by s′=Gs, and retain λ rather than rank·λ. For λ=0 the derivative term vanishes; this is the conjugation-only Higgs specialization.

Acceptance:

- For A=0, λ=1 and G=diag(x,1), the new line coefficient is −x⁻¹, not zero.
- For G=diag(x,x⁻¹) the determinant correction vanishes even though the vector connection changes.
- An empty vector bundle induces the unit line: det G=1 and the transformed line coefficient remains zero.

Prerequisites: HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/gauge, ColemanPowerSeries:L1/derivation-determinant-unit, mathlib:Matrix.trace_units_conj, mathlib:Matrix.trace_sub, mathlib:Matrix.trace_smul, mathlib:Matrix.trace_mul_comm.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Determinant connection commutes with gauge transport

Declaration: Connection.determinant_gauge. Node: HodgeStructuresPartII:H.0/determinant-gauge.

Let g=Units.map Matrix.detMonoidHom G∈Rˣ, and let ℓ(g)=Units.map (Matrix.scalar (Fin 1)).toMonoidHom g be the native one-by-one matrix unit. Then (c.gauge G).determinant = c.determinant.gauge ℓ(g), with the same F and λ.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Build g and ℓ(g) only by the existing native monoid homomorphisms and Units.map. Units.coe_map exposes values det G and scalar(det G); inverse values are det(G⁻¹) and scalar(det(G⁻¹)). No new determinant-line carrier or arbitrary choice is introduced.
2. Apply the inherited gauge_matrix formula to the one-by-one determinant connection. Its coefficient is (det G) tr(A_i) det(G⁻¹) − λ δ_i(det G)det(G⁻¹).
3. Use det_mul and the inverse equation to simplify the conjugation scalar product to tr(A_i). Commutativity reorders the derivative factors; determinant-gauge-matrix supplies equality with the left side.
4. Connections are determined by their matrix field. Extensionality over directions and the unique Fin 1 row and column proves equality of coordinate connection objects. Their operator compatibility then follows from the inherited operator definition.
5. This is exact finite-coordinate frame coherence. It does not construct exterior-power sheaves or glue local operators; those remain E1/global-comparison obligations.

Acceptance:

- The transformation uses det G, not tr G, and exactly the existing gauge convention.
- A nonconstant diagonal Laurent gauge reproduces the negative logarithmic derivative term on both sides.
- The rank-zero vector frame maps to the identity one-by-one frame on the unit line.

Prerequisites: HodgeStructuresPartII:H.0/determinant-gauge-matrix, HodgeStructuresPartII:H.0/determinant-matrix, HodgeStructuresPartII:H.0/gauge, mathlib:Matrix.det_mul, mathlib:Matrix.detMonoidHom, mathlib:Matrix.scalar, mathlib:Units.map, mathlib:Units.coe_map.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Alternating determinant evaluation intertwines the section operator

Declaration: Connection.determinant_alternating_operator. Node: HodgeStructuresPartII:H.0/determinant-alternating-operator.

Represent an ordered family of sections as the rows of S. For each direction i, Σ_r det(updateRow S r (c.operator i (S r))) = c.determinant.operator i (fun _↦det S) 0 = λδ_i(det S)+tr(A_i)det S. No flatness or invertibility of S is assumed.

Hypotheses:

- k and R are commutative rings and R is a k-algebra.
- d∈N and λ∈R; all derivations are k-linear.
- V is a finite decidable index type, including the empty type. No domain, field, characteristic-zero, factorial or rank-invertibility hypothesis is used.
- F is the inherited coordinate frame with commuting derivations annihilating λ; c is an arbitrary, not necessarily flat, connection on that frame.

Proof plan:

1. Expand each section operator as λδ_i(S_r)+A_i*ᵥS_r. Use determinant linearity in the replaced row to split the derivative and matrix-action sums.
2. Pull λ out of each derivative replacement using det_updateRow_smul. The determinant-derivation-rows identity reduces that sum to λδ_i(det S).
3. For any perturbation matrix H, the sum of single-row replacement determinants Σ_r det(updateRow S r H_r) equals the sum of single-column replacement determinants Σ_j det(updateCol S j (r↦H_rj)). Expand det_apply' on both sides: each permutation term replaces exactly one entry S_(σj),j by H_(σj),j, and the row index is reindexed as r=σ(j). No derivation or invertibility is needed for this finite-sum reindexing.
4. For H_r=A_i*ᵥS_r, entrywise H=S*A_iᵀ, not A_i*S. Convert its replacement-row sum to the preceding replacement-column sum, transpose each determinant, and observe Hᵀ=A_i*Sᵀ. The determinant-row-action node with A_i and Sᵀ now gives tr(A_i)det(Sᵀ)=tr(A_i)det S. This explicitly justifies the column-vector/row-family orientation; duplicate-row vanishing, not cancellation by 2, handles every characteristic.
5. Apply determinant_operator to identify the resulting scalar with the one-by-one line section operator. The empty family evaluates to det(∅)=1 and both sides are zero because δ_i(1)=0.
6. This is the local alternating universal-property test needed by a future top-wedge comparison. It is not yet a connection on a global exterior-power module/sheaf.

Acceptance:

- With S=diag(x,y), λ=1, δ=∂x and A=diag(a,b), both sides equal y+(a+b)xy.
- For an off-diagonal A, the action part is zero on every S, not merely invertible S.
- Rank zero gives the derivative of the unit section, not a zero determinant line.

Prerequisites: HodgeStructuresPartII:H.0/operator, HodgeStructuresPartII:H.0/determinant-coordinate, HodgeStructuresPartII:H.0/determinant-derivation-rows, HodgeStructuresPartII:H.0/determinant-row-action, mathlib:Matrix.det_updateRow_add, mathlib:Matrix.det_updateRow_smul, mathlib:Matrix.det_transpose, mathlib:Matrix.trace_transpose.

Source: [EG author preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), selected fixed-determinant/parameter passages above; the displayed proof is an explicit algebraic derivation from the pinned native declarations and the named supplier plan, not a named source theorem.

### Current verification and remaining boundary

The five new signatures use native Matrix, Derivation and Units objects and admitted-declaration bodies. Historical receipt for codex-a71f92’s determinant checkpoint: that full changed file elaborates with zero errors, 123 admitted-declaration warnings and no other warnings; all 48 native examples remain. There is no new definition/construction in this continuation, so all 103 API items and 89 planned definition/construction tests are unchanged. Acceptance examples are independently exercised by 6,303 exact computations over Q/F₂/F₃ Laurent polynomial rings with nonzero square-zero ε, using 720 matrix pairs of ranks 0–3. These are finite model regressions, not Lean proofs. Current validation receipts are recorded in the handoff/packet; the earlier 118-admitted-declaration compilation covers only its preceding exact-file hash.

The affine row-derivative, trace-action and det(G) coherence steps are decomposed as plans, with the generic Jacobi identity imported from its sole owner. E1 must still supply finite locally free exterior/determinant sheaf carriers; this roadmap owes descent of the induced alternating operator through the exterior universal property, top-wedge comparison using the local formula, restriction/pullback/functoriality and gluing. All 35 global signature omissions remain. The unbounded period-lattice/graded-base-ring/Tate and coefficient-equivariance adapters remain gaps. H.1–H.8, including mandatory real Noether–Lefschetz H.8, remain not_read with all routed obligations retained.

Current exact-file Lean SHA-256: 6e90608f1e0748728112b947e7f5f6bf3b1c55398d62235d80cdf7a6300ad290. The existing top-level project supplied the build. A preliminary nested-project invocation failed on the Aesop search path and automatically fetched redundant dependency copies; those were moved to recoverable trash before using the correct existing project. No library build, cache retrieval or Lean language server was run. The roadmap now explicitly imports ColemanPowerSeries:L1 as a layer dependency so the named unpromoted Jacobi declaration cannot disappear from the provisional atlas link projection.

## Symmetric action and ordered augmentation nilpotence

Codex — codex-rtOQ9t, continuation of issue #3371 at b1a65cb0bd7a8cb7325bc1f77087c39bfa124e76. The latest merged handoff supplied detailed mathematical leads; this continuation turns the action/ordered-nilpotence branch into ten canonical nodes. Historical matrix experiments and compilation receipts remain attributed to their workers.

The existing Tau Ceti augmentation generation theorem is imported. The target End(E) remains associative and may be noncommutative; the affine construction descends TensorAlgebra using RingCon, rather than applying the commutative-target symmetric lift. Ordered nilpotence keeps its exact exponent; the characteristic-two example shows why symmetric projection cannot substitute for the ordered tensor map.

Fresh source scope: [Heuer published HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4), Definition 1.2(2) and complete Definition 4.1/Remark 4.2; [Liu–Zhu v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1 full statement/setup and the short full Lemma 2.15 proof. The following proofs are explicit algebraic deductions, not claims of reading the full correspondence proofs. Spectral image algebras and twisting are the PadicHodgeTheoryPartIIPadicSimpson consumer, whose accepted joining brief was read.

### Contraction of an affine twisted field

Declaration: TwistedHiggsBundle.affineContractions. Node: HodgeStructuresPartII:H.0/affine-contractions.

For an A-linear θ:E→E⊗_A Q, construct the A-linear contraction map a_θ:V→End_A(E), a_θ(v)=(E⊗v)θ followed by the right tensor unit equivalence E⊗A≅E. This is the affine section formula of the existing twisted field, not a new Higgs or dual carrier.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Use the native tensor map of id_E and v; compose with the native right tensor unit equivalence and θ.
2. Use native TensorProduct.map_add_right and map_smul_right to prove linearity in the contracting functional, then compose with θ and rid. This actual affine proof works for arbitrary modules.
3. On local finite projective charts, evaluation separates tensor coefficients. Its sheaf/co-evaluation and gluing interface is the E1 supplier, not an assumption that global sections commute with tensor.

Dependencies: mathlib:Module.Dual, mathlib:TensorProduct.map, mathlib:TensorProduct.rid, mathlib:TensorProduct.map_add_right, mathlib:TensorProduct.map_smul_right.

Planning API:

- TwistedHiggsBundle.affineContractions_apply: a_θ(v)(e) is exactly the tensor-map/right-unit formula.
- TwistedHiggsBundle.affineContractions_zero: The zero field gives the zero contraction map.
- TwistedHiggsBundle.affineContractions_add: Contraction of θ+η is a_θ+a_η.

Unit tests:

- TwistedHiggsBundle.affineContractions.test_zero (degenerate): Every contraction of the zero field vanishes.
- TwistedHiggsBundle.affineContractions.test_line (computation): For E=Q=A, θ(e)=e⊗1 and v=id_A, the contraction sends e to e.
- TwistedHiggsBundle.affineContractions.test_zero_dual (computation): The zero functional contracts every field to zero.

Acceptance: For an A-linear θ:E→E⊗_A Q, construct the A-linear contraction map a_θ:V→End_A(E), a_θ(v)=(E⊗v)θ followed by the right tensor unit equivalence E⊗A≅E. This is the affine section formula of the existing twisted field, not a new Higgs or dual carrier.

### Symmetric action on an affine Higgs module

Declaration: TwistedHiggsBundle.affineSymmetricAction. Node: HodgeStructuresPartII:H.0/affine-symmetric-action.

Given an A-linear a:V→End_A(E) with pairwise commuting images, construct the unique A-algebra map α:S→End_A(E) satisfying α(ι(v))=a(v). For a=a_θ on finite locally free charts, this is the affine adapter of the existing integrable twisted Higgs symmetric action.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Lift a through the built TensorAlgebra.lift, whose target is an associative semiring, so End(E) is allowed.
2. For each native TensorAlgebra.SymRel generator, the two images a(v)a(w) and a(w)a(v) agree. RingCon.ringConGen_le therefore places the symmetric congruence in the kernel of the tensor lift.
3. Descend using native RingCon.liftₐ. RingCon.liftₐ_mk and TensorAlgebra.lift_ι_apply give the generator formula.
4. Use native SymmetricAlgebra.induction on scalars, generators, sums and products to prove uniqueness into the associative End(E) target; the zero action is the composite of algebraMapInv with the scalar algebra map. No commutative target instance is imposed. SymmetricAlgebra.lift and algHom_ext cannot be applied directly to End(E) at this pin.

Dependencies: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorAlgebra.lift, mathlib:TensorAlgebra.SymRel, mathlib:RingCon.ringConGen_le, mathlib:RingCon.liftₐ, mathlib:TensorAlgebra.hom_ext, mathlib:RingCon.Quotient.hom_extₐ, mathlib:SymmetricAlgebra.induction, mathlib:SymmetricAlgebra.algebraMapInv_ι.

Planning API:

- TwistedHiggsBundle.affineSymmetricAction_generator: α(ι(v))=a(v).
- TwistedHiggsBundle.affineSymmetricAction_unique: Any other A-algebra map with the same degree-one contractions equals α.
- TwistedHiggsBundle.affineSymmetricAction_zero: For a=0, α is ε followed by the scalar map A→End(E).

Unit tests:

- TwistedHiggsBundle.affineSymmetricAction.test_zero (degenerate): For the zero field every degree-one generator acts by zero.
- TwistedHiggsBundle.affineSymmetricAction.test_scalar (computation): For E=Q=A and a(id_A)=id_E, the distinguished generator acts as identity, so the action is not nilpotent on a nonzero line.
- TwistedHiggsBundle.affineSymmetricAction.test_rank_zero (degenerate): On the zero module A^(Fin 0), every element of S acts by the zero endomorphism, including its unit.
- TwistedHiggsBundle.affineSymmetricAction.test_noncommuting (non-example): On ℚ² the actual endomorphisms E12 and E21 cannot both be images of degree-one generators under a symmetric-algebra action: their products differ on the first basis vector.

Acceptance: Given an A-linear a:V→End_A(E) with pairwise commuting images, construct the unique A-algebra map α:S→End_A(E) satisfying α(ι(v))=a(v). For a=a_θ on finite locally free charts, this is the affine adapter of the existing integrable twisted Higgs symmetric action.

### Symmetric extension and commuting contractions

Declaration: TwistedHiggsBundle.affineSymmetricAction_iff_commute. Node: HodgeStructuresPartII:H.0/affine-symmetric-commuting.

An A-linear a:V→End_A(E) extends to an A-algebra map from S with generator values a iff a(v)a(w)=a(w)a(v) for every v,w. For a=a_θ and Q finite locally free, the existing exterior-coordinate theorem identifies this condition with θ∧θ=0.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. For the forward implication apply α to ι(v)ι(w)=ι(w)ι(v) in the native commutative symmetric algebra.
2. For the reverse implication use affineSymmetricAction; no commutative ring instance is introduced on End(E).
3. Apply the existing H.0/higgs-commuting exterior basis argument locally; its i<j coefficients work in characteristic two without dividing by 2.

Dependencies: HodgeStructuresPartII:H.0/affine-symmetric-action, HodgeStructuresPartII:H.0/higgs-commuting.

Acceptance: An A-linear a:V→End_A(E) extends to an A-algebra map from S with generator values a iff a(v)a(w)=a(w)a(v) for every v,w. For a=a_θ and Q finite locally free, the existing exterior-coordinate theorem identifies this condition with θ∧θ=0.

### Evaluation of a word of Higgs contractions

Declaration: TwistedHiggsBundle.symmetricAction_word. Node: HodgeStructuresPartII:H.0/symmetric-action-word.

If α(ι(v))=a(v), then for every finite ordered list (v₁,…,v_N), α(ι(v₁)⋯ι(v_N))=a(v₁)⋯a(v_N). The empty word acts as id_E. Endomorphism multiplication is composition, so the rightmost listed contraction applies first.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. The empty list uses α(1)=1 and the actual endomorphism unit.
2. Induct on list length using the algebra map multiplication law and the degree-one formula.
3. If a comes from an integrable field, commuting contractions permit reversal/reordering without changing this product; the ordered tensor-coordinate lemma below does not need that reordering.

Dependencies: HodgeStructuresPartII:H.0/affine-symmetric-action.

Acceptance: If α(ι(v))=a(v), then for every finite ordered list (v₁,…,v_N), α(ι(v₁)⋯ι(v_N))=a(v₁)⋯a(v_N). The empty word acts as id_E. Endomorphism multiplication is composition, so the rightmost listed contraction applies first.

### Morphisms intertwine the symmetric action

Declaration: TwistedHiggsBundle.symmetricAction_morphism. Node: HodgeStructuresPartII:H.0/symmetric-action-morphism.

For contraction maps a:V→End_A(E), b:V→End_A(F) and their generator-preserving actions α,β, an A-linear f:E→F satisfies f∘a(v)=b(v)∘f for every v iff f∘α(s)=β(s)∘f for every s∈S. For finite locally free Q these equalities identify Higgs-horizontal morphisms with intertwining the actual S-actions.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.
- F is another A-module. The action maps on both modules use the same coefficient dual V and the same symmetric algebra S.

Proof plan:

1. An intertwiner of all s intertwines degree-one generators.
2. For the converse, use native symmetric-algebra induction on scalars, generators, sums and products. A-linearity of f handles scalars; composing the two induction equalities handles products.
3. On finite local bases, dual evaluation identifies the generator equalities with (f⊗id_Q)θ_E=θ_F f. Restriction and equality of sheaf maps glue; this is not a new module category carrier.

Dependencies: HodgeStructuresPartII:H.0/affine-contractions, HodgeStructuresPartII:H.0/affine-symmetric-action, mathlib:SymmetricAlgebra.induction, EnhancedDerivedSheaves:E1.

Acceptance: For contraction maps a:V→End_A(E), b:V→End_A(F) and their generator-preserving actions α,β, an A-linear f:E→F satisfies f∘a(v)=b(v)∘f for every v iff f∘α(s)=β(s)∘f for every s∈S. For finite locally free Q these equalities identify Higgs-horizontal morphisms with intertwining the actual S-actions.

### Ordered tensor coefficients detect vanishing

Declaration: TwistedHiggsBundle.iterate_coordinates. Node: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing.

For every N≥0, an O-linear θ:E→E⊗Q with Q finite locally free has θ^[N]=0 iff every ordered word of N dual contractions vanishes, locally on each coefficient trivializing chart. In a basis θ=Σ_i A_i⊗q_i, the coefficient of q_(i₁)⊗⋯⊗q_(i_N) is A_(i₁)⋯A_(i_N); the most recently applied coefficient is the leftmost one. N=0 gives id_E, hence vanishing only for E=0. No integrability is required.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O). E is finite locally free and Q is finite locally free, possibly Ω¹⊗T with T invertible. All maps, tensor powers and algebra objects are sheaves, with restriction-compatible local formulas.
- θ:E→E⊗Q is O-linear. Integrability is required only for the symmetric-action comparison, not for the ordered-coordinate lemma. No characteristic, reducedness, basis or nilpotence condition is built into θ.
- Local finite bases are used on trivializing covers; no tensor of global sections is identified with sections of a sheaf tensor.

Proof plan:

1. Induct over the existing ordered iterate recursion, fixing the associators and the order of the newly inserted coefficient factor.
2. Use the native/local finite tensor basis: its distinct ordered tuples give independent coefficients, with no symmetrization, factorial or exterior projection.
3. Dual basis contractions extract those coefficients. Conversely arbitrary local dual sections are linear combinations of dual basis sections, so multilinearity gives every ordered word.
4. Equality of the maps is local and therefore glues. For N=0 use the tensor unit and identity, rather than imposing a positive bound on this coordinate lemma.

Dependencies: HodgeStructuresPartII:H.0/ordered-iterate, HodgeStructuresPartII:H.0/affine-contractions, EnhancedDerivedSheaves:E1.

Acceptance: For every N≥0, an O-linear θ:E→E⊗Q with Q finite locally free has θ^[N]=0 iff every ordered word of N dual contractions vanishes, locally on each coefficient trivializing chart. In a basis θ=Σ_i A_i⊗q_i, the coefficient of q_(i₁)⊗⋯⊗q_(i_N) is A_(i₁)⋯A_(i_N); the most recently applied coefficient is the leftmost one. N=0 gives id_E, hence vanishing only for E=0. No integrability is required.

### Augmentation powers and contraction words

Declaration: TwistedHiggsBundle.augmentation_pow_iff_words. Node: HodgeStructuresPartII:H.0/augmentation-power-words.

For every integer N≥0 and a generator-preserving action α:S→End_A(E), I^N⊆ker α iff every ordered product a(v₁)⋯a(v_N) is zero for all v₁,…,v_N∈V. Equivalently I^N annihilates E with its actual α-action. The exponent is the same on both sides; set-theoretic support on the zero section supplies no such exponent.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Import the already built TauCeti.SymmetricAlgebra.augmentation_toIdeal_eq_span_range_ι. HopfIdeal.mem_augmentation and the built SymmetricAlgebra.counitAlgHom_eq identify its ideal with ker ε, where ε=algebraMapInv.
2. Induct on N using native Ideal.span_mul_span and ideal power multiplication: I^N is the ideal generated by all products of N degree-one generators. This is a deduction from the existing ideal operations, not a new augmentation or homogeneous grading plan.
3. Use symmetricAction_word and the fact that ker α is an ideal. Containment is equivalent to vanishing on those generators.
4. The zero endomorphism acts by zero on all e, and conversely equality of its evaluations detects a zero endomorphism. For N=0 the ideal is S and the empty endomorphism word is id_E; both vanish precisely for E=0.

Dependencies: HodgeStructuresPartII:H.0/symmetric-action-word, tauceti:TauCeti.SymmetricAlgebra.augmentation_toIdeal_eq_span_range_ι, tauceti:TauCeti.HopfIdeal.mem_augmentation, mathlib:SymmetricAlgebra.counitAlgHom_eq, mathlib:Ideal.span_mul_span.

Acceptance: For every integer N≥0 and a generator-preserving action α:S→End_A(E), I^N⊆ker α iff every ordered product a(v₁)⋯a(v_N) is zero for all v₁,…,v_N∈V. Equivalently I^N annihilates E with its actual α-action. The exponent is the same on both sides; set-theoretic support on the zero section supplies no such exponent.

### Ordered nilpotence equals augmentation annihilation

Declaration: TwistedHiggsBundle.nilpotence_iff_augmentation_power. Node: HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence.

For an integrable twisted Higgs field with Q finite locally free and its actual sheaf algebra action α:Sym_O(Q∨)→End_O(E), and a specified positive N, θ^[N]=0 iff (ker ε)^N acts by zero on E. The same N occurs on both sides in every characteristic and over nonreduced bases. This also identifies a specified ordered nilpotence bound with factorization of α through Sym_O(Q∨)/(ker ε)^N.

Hypotheses:

- A commutative ringed Grothendieck site (C,J,O). E is finite locally free and Q is finite locally free, possibly Ω¹⊗T with T invertible. All maps, tensor powers and algebra objects are sheaves, with restriction-compatible local formulas.
- θ:E→E⊗Q is O-linear. Integrability is required only for the symmetric-action comparison, not for the ordered-coordinate lemma. No characteristic, reducedness, basis or nilpotence condition is built into θ.
- Local finite bases are used on trivializing covers; no tensor of global sections is identified with sections of a sheaf tensor.
- θ∧θ=0 and N>0. ε is the actual degree-zero augmentation of the symmetric sheaf algebra; annihilation is an equality of action maps, not an arbitrary stored predicate.

Proof plan:

1. Use symmetric-action and affineSymmetricAction to identify the local contraction action, retaining the actual coefficient sheaf Q and any Tate character.
2. On local finite charts apply ordered-coordinate-vanishing and augmentation-power-words. Integrability permits the listed contractions to commute; no projection onto Sym^N(Q) occurs.
3. Check equality and ideal-power annihilation locally. Restriction compatibility of the supplied sheaf algebra and module action glues the equivalence with the same N.
4. Apply the native quotient-action construction on affine charts and the E1 quotient/sheaf coherence for global factorization. The sheaf-level carrier and gluing remain named native omissions until supplied.

Dependencies: HodgeStructuresPartII:H.0/symmetric-action, HodgeStructuresPartII:H.0/ordered-coordinate-vanishing, HodgeStructuresPartII:H.0/augmentation-power-words, HodgeStructuresPartII:H.0/truncated-symmetric-action, EnhancedDerivedSheaves:E1.

Acceptance: For an integrable twisted Higgs field with Q finite locally free and its actual sheaf algebra action α:Sym_O(Q∨)→End_O(E), and a specified positive N, θ^[N]=0 iff (ker ε)^N acts by zero on E. The same N occurs on both sides in every characteristic and over nonreduced bases. This also identifies a specified ordered nilpotence bound with factorization of α through Sym_O(Q∨)/(ker ε)^N.

### Action through a fixed augmentation quotient

Declaration: TwistedHiggsBundle.truncatedSymmetricAction. Node: HodgeStructuresPartII:H.0/truncated-symmetric-action.

Given α:S→End_A(E), N≥0 and I^N⊆ker α, construct the unique A-algebra map β:S/I^N→End_A(E) satisfying β([s])=α(s). Such a generator-preserving factorization exists iff I^N⊆ker α. No radical quotient or unspecified larger nilpotence bound replaces I^N.

Hypotheses:

- A is a commutative ring; E and Q are A-modules. For this affine algebra no smoothness, characteristic-zero, reducedness, freeness or finite-generation assumption is imposed.
- V=Hom_A(Q,A), S=Sym_A(V), ε:S→A is the canonical degree-zero augmentation, and I=ker ε. End_A(E) has its actual associative composition product and central A-algebra structure; it is not assumed commutative.

Proof plan:

1. Use the built Ideal.Quotient.liftₐ with the actual ideal I^N and the actual endomorphism algebra. Its associative semiring target is sufficient.
2. The containment supplies vanishing on I^N. The native quotient lift computes definitionally on representatives, giving the representative formula.
3. Use Ideal.Quotient.mk_surjective for uniqueness; any competing factorization kills I^N by Ideal.Quotient.eq_zero_iff_mem. These actual affine proofs do not require augmentation_pow_iff_words.
4. For the zero module the bound N=0 is permitted because the target algebra is the zero algebra; positive bound conventions remain in IterateNul, not in this quotient construction.

Dependencies: HodgeStructuresPartII:H.0/augmentation-power-words, mathlib:Ideal.Quotient.liftₐ, mathlib:Ideal.Quotient.liftₐ_comp, mathlib:Ideal.Quotient.mk_surjective, mathlib:Ideal.Quotient.eq_zero_iff_mem, mathlib:Ideal.pow_mem_pow.

Planning API:

- TwistedHiggsBundle.truncatedSymmetricAction_mk: β([s])=α(s).
- TwistedHiggsBundle.truncatedSymmetricAction_unique: The representative formula uniquely determines β.
- TwistedHiggsBundle.truncatedSymmetricAction_exists_iff: A factorization through this exact quotient exists iff I^N⊆ker α.

Unit tests:

- TwistedHiggsBundle.truncatedSymmetricAction.test_generator (computation): When N=1, each degree-one generator acts by zero.
- TwistedHiggsBundle.truncatedSymmetricAction.test_scalar_rejected (non-example): On a nonzero Q-line with generator acting by identity, no positive augmentation power is killed.
- TwistedHiggsBundle.truncatedSymmetricAction.test_rank_zero (degenerate): The action on A^(Fin 0) kills every augmentation power, including I^0=S.
- TwistedHiggsBundle.truncatedSymmetricAction.test_square_zero (computation): For Q=A=Q, a(v)=v(1)X with X nonzero and X²=0, the action kills I² but not I. A nonzero E12 gives this example.

Acceptance: Given α:S→End_A(E), N≥0 and I^N⊆ker α, construct the unique A-algebra map β:S/I^N→End_A(E) satisfying β([s])=α(s). Such a generator-preserving factorization exists iff I^N⊆ker α. No radical quotient or unspecified larger nilpotence bound replaces I^N.

### Symmetric projection loses ordered nilpotence

Declaration: TwistedHiggsBundle.symmetricProjection_charTwo_counterexample. Node: HodgeStructuresPartII:H.0/symmetric-projection-counterexample.

Over k=F₂, take E=k[x,y]/(x²,y²), Q=kq₀⊕kq₁, and θ(e)=xe⊗q₀+ye⊗q₁. The two multiplication contractions commute and square to zero, but their product xy is nonzero. θ^[2](1)=xy⊗(q₀⊗q₁+q₁⊗q₀) is nonzero, whereas its image in E⊗Sym²(Q) is zero. In fact the projected second iterate is the zero map. The action has I²E≠0 and I³E=0. Thus symmetrized vanishing cannot replace ordered vanishing with the same exponent.

Hypotheses:

- The ground field is F₂. E has the actual basis (1,x,y,xy), with x²=y²=0; Q has its actual two-element basis. No division by 2 is available.

Proof plan:

1. Multiplication by x and y on the displayed four-dimensional module gives commuting matrices A,B with A²=B²=0 and AB=BA≠0.
2. The ordered degree-two tensor basis distinguishes q₀⊗q₁ and q₁⊗q₀, so their sum is nonzero. A dual tensor coefficient extracts xy from θ^[2](1).
3. In the symmetric quotient the two basis words agree, and 2=0. All diagonal coefficients also vanish, hence the projected map is zero.
4. All words of length three contain x² or y²; the mixed degree-two word acts nontrivially. Apply augmentation-power-words to get the exact bounds. The analogous finite regression over F₃ uses x³=y³=0: projected degree three vanishes while ordered degree three does not, and the ordered bound is five.

Dependencies: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing, HodgeStructuresPartII:H.0/augmentation-power-words, mathlib:SymmetricAlgebra.algHom.

Acceptance: Over k=F₂, take E=k[x,y]/(x²,y²), Q=kq₀⊕kq₁, and θ(e)=xe⊗q₀+ye⊗q₁. The two multiplication contractions commute and square to zero, but their product xy is nonzero. θ^[2](1)=xy⊗(q₀⊗q₁+q₁⊗q₀) is nonzero, whereas its image in E⊗Sym²(Q) is zero. In fact the projected second iterate is the zero map. The action has I²E≠0 and I³E=0. Thus symmetrized vanishing cannot replace ordered vanishing with the same exponent.

### Exact continuation boundaries

The ordered-coordinate statement promotes the existing iterate_coordinates API to a declaration node with no duplicate API or carrier. Its existing omission entry is reused. The affine action morphism signature is present, while its sheaf horizontal-morphism interpretation still requires E1 finite-dual and gluing interfaces. The global ordered-augmentation equivalence has a precise omission entry. The previous 35 global objects, 65 APIs and 54 tests remain omitted; no affine construction discharges them.

The remaining field/reduced-ring rank bound must distinguish geometric-prime fibres from rigid classical points; reducedness is essential. The nonreduced rank-one multiplication-by-2 example over Z/4 is nonzero and square-zero. Nilpotence filtrations allow ordinary submodules, not necessarily subbundles. The predecessor image-algebra/base-change and nonsplit-kernel arguments remain precise resume leads in the handoff. H.8 real Noether–Lefschetz remains mandatory.

### Historical codex-rtOQ9t validation receipt

The entire expanded Mathlib-only suggested file elaborates at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean v4.34.0-rc2: zero errors, 151 admitted-declaration warnings, no other warnings, and 58 native examples. This validates signatures only. The Tau Ceti baseline augmentation theorem was read and cited, not imported into this Mathlib-only file or certified by a Tau Ceti build. Existing build/artifacts were reused; no project/cache/library setup or Lean server.

Native SHA-256: 92d380f0b3fd13af0187b13920525b4e2ccc957872e27cf41d16eddf7a810f24. Compiler-output SHA-256: b625bfec8c11ee32b9154fffad4ea7512a4a138d813bb894d3efda740fc89b51.

Independent standard-library finite algebra checks passed 11,378 assertions. All 6,817 pairs of 2×2 matrices over F₂/F₃ were screened; the 1,033 commuting pairs compare all ordered words and commutative monomials in degrees 0–4. The four- and nine-dimensional truncated polynomial modules verify projected degree-p vanishing and ordered degree-p nonvanishing, with ordered bounds 3 and 5. These finite computations do not prove the general ideal/sheaf equivalences or any correspondence. Script SHA-256: 5dfc681b5f0b4b707166a8a24d5d548ad7f63aa3d515af49fdbfc182880364cd.

The indexed packet checker reports zero errors and warnings. Actual in-memory atlas assembly, with normal retirements/restructuring/link overlays and replaced-decomposition trimming, retains 70 declarations and six planets, with no own pending/skipped links. Its complete stage graph has 3,056 vertices and 8,663 edges; this packet’s declaration graph has 70 vertices and 137 edges; stage plus this packet’s recursively used declarations has 3,121 vertices and 8,914 edges. All three are acyclic. All 19 named stage prerequisite pairs are reachable, which does not assert they are all direct displayed edges. The single recursively used external declaration is ColemanPowerSeries:L1/derivation-determinant-unit. The seven unrelated skipped links exactly match unmodified baseline assembly; unrelated declaration graphs were not audited.

All 60 inherited node statements, 103 APIs, 89 tests and 149 routed obligations remain. Fifty-nine inherited node objects are unchanged; the existing symmetric-action object gains only the precise associative-target proof step and dependency. No source issue, restructuring proposal or stage status is removed. H.0 remains partial; H.1–H.8 remain not_read.

### Historical affine proof continuation — Codex codex-J6LwjP

This checkpoint supplies actual bodies for fifteen existing affine declarations. The contraction map is the composite of θ, the tensor map id⊗v and the right unit equivalence; native tensor-map add/scalar laws prove its linearity. The symmetric action lifts through the tensor algebra and descends through the existing symmetric congruence using the commuting hypothesis. Its generator equation is the native tensor-lift computation. Symmetric-algebra induction proves uniqueness into the associative endomorphism algebra, and comparison with the scalar augmentation proves the zero-action law. No commutative target instance is assumed.

The extension-exists iff commute statement, evaluation on ordered words, and morphism-intertwiner equivalence have actual affine proofs. The intertwiner proof uses induction on scalars, generators, sums and products, retaining composition order. These are the affine parts of Heuer Definition 4.1; the sheaf restriction/finite-dual/gluing interpretation remains a supplier obligation. Fresh selected source reading covered Definition 1.2(2), the complete Definition 4.1 and Remark 4.2 in the [publisher HTML](https://link.springer.com/article/10.1007/s00222-025-01321-4). No further source correspondence theorem is certified here.

The exact I^N quotient action, representative computation, uniqueness and existence iff containment use the already built ideal quotient lift. They have actual bodies independent of the still-admitted augmentation-word criterion. The quotient-zero criterion proves the necessary containment. Surjectivity of representatives proves uniqueness. Bound N=0 is accepted for the zero module. The scalar rejection example uses membership of generator^N in I^N and its image 1, and its proof even works for N=0. The positive-N test statement is retained.

Nine existing examples now have actual proofs: three contraction tests, three symmetric-action tests, and the generator/scalar-rejection/zero-module quotient tests. The new TwistedHiggsBundle.affineSymmetricAction.test_noncommuting constructs E12 and E21 as actual linear endomorphisms of ℚ². Any symmetric action sending generators to them would make their products equal; evaluating on the first basis vector gives 1=0. This tests the essential commuting hypothesis in an endomorphism algebra that is actually noncommutative. The square-zero augmentation example and characteristic-two ordered/projection witnesses remain admitted.

Named affine proof bodies: TwistedHiggsBundle.affineContractions, TwistedHiggsBundle.affineContractions_apply, TwistedHiggsBundle.affineContractions_zero, TwistedHiggsBundle.affineContractions_add, TwistedHiggsBundle.affineSymmetricAction, TwistedHiggsBundle.affineSymmetricAction_generator, TwistedHiggsBundle.affineSymmetricAction_unique, TwistedHiggsBundle.affineSymmetricAction_zero, TwistedHiggsBundle.affineSymmetricAction_iff_commute, TwistedHiggsBundle.symmetricAction_word, TwistedHiggsBundle.symmetricAction_morphism, TwistedHiggsBundle.truncatedSymmetricAction, TwistedHiggsBundle.truncatedSymmetricAction_mk, TwistedHiggsBundle.truncatedSymmetricAction_unique, TwistedHiggsBundle.truncatedSymmetricAction_exists_iff.

The full exact Mathlib-only suggested file elaborates with Lean v4.34.0-rc2: zero errors, 127 admitted-declaration warnings, no other warnings, 59 native examples, 3.55 seconds. Source SHA-256: af7d537a0dc75975f2081fbd6b143a70b7d63a81b92e032511fd9a20d0ae4b83. Compiler-output SHA-256: 9458fef8f76f8955e974846509c23124dd24da5b252d934fc6a0494df7968a3e. A separate focused file contains these fifteen matching declarations and ten proved examples and reports zero errors and warnings. Printing axioms for all fifteen names reports only propext, Classical.choice and Quot.sound, with no admitted-proof axiom. Focused source SHA-256: 4f92141c3c91821a4ce6a20e2a177506ac44554b3a42343e47cc7b0aafeb92be; axiom-output SHA-256: e44351794e0b77d4828e013fc26647c405fe51313db9ae126ee6138ccbf91253. Existing pinned artifacts were reused with one Lean process at a time and 74 GB available before each final invocation; no library/cache/project setup or Lean server.

The indexed packet check reports zero errors and warnings: 70 nodes, 112 API items, 100 planned definition/construction tests, six planets, 69 named baseline citations, eleven gaps and five requests. Six newly cited built statements were read with ambient hypotheses and matched to the pinned index: tensor-map add/scalar laws, augmentation on generators, ideal-quotient representatives and zero criterion, and ideal-power membership. No generic carrier is replanned.

Current actual read-only atlas assembly uses the normal retirement/restructuring/link overlays and replaced-decomposition trimming. The stage graph has 3022 vertices and 8663 edges; the own declaration graph has 70 vertices and 137 edges; stages plus the 71 reachable declarations and explicit supplier-request edges have 3087 vertices and 8914 edges. All three are acyclic. All 21 computed stage prerequisite pairs, including request/stage dependencies, reach their consumers; none is asserted to be a direct displayed edge. The only external declaration is the existing Coleman Jacobi supplier. No own pending/skipped links; unrelated skips and all stage edges match the unchanged 70-node packet overlay. Projection-script SHA-256: 14985a897bb969631f728f35ee9a1bc67280f0245e6034effe465300eec58d41.

All 70 prior node IDs, mathematical statements, hypotheses, APIs, acceptance and source records survive; all 99 prior tests remain and one test is added. Sixty-seven whole node objects are unchanged; only the contraction, symmetric-action and quotient-action proof/dependency/test outlines change. Requests, gaps, source issues, restructuring and all 149 routed obligations remain. Earlier finite-model/PDF receipts are historical and were not rerun here. All nodes remain unchecked; H.0 partial and H.1–H.8 not_read; zero stages closed. Actual affine proofs do not discharge the augmentation-word proof, ordered coefficient theorem, sheaf carrier/gluing omissions, determinant descent, rank bounds or later source decomposition.


## Augmentation generator continuation

The new TwistedHiggsBundle.augmentation_pow_generators identifies I^N with the ideal span of length-N degree-one words for every N≥0. Its source is the actual degree-zero augmentation of Sym_A(Q∨). The already built Tau Ceti augmentation ideal/span equality and HopfIdeal.augmentation_toIdeal identify I; the built Submodule.span_pow and Set.mem_pow then give the word generators. This replaces the handoff's proposed generic private induction. No general span-power, augmentation or symmetric algebra object is planned again.

The existing same-exponent word criterion uses this adapter and Ideal.span_le. Its statement and hypotheses are unchanged. End(E) remains an associative target. At N=0 the empty word is identity and I⁰ is the whole source; annihilation means E is the zero module. At N=1 the generator formula recovers the built augmentation span. The two new lemma boundary tests record these cases.

The new TwistedHiggsBundle.affineSymmetricAction.test_ambient_ideal regression uses X=E12 and Y=E21 on ℚ². The rank-one action with u↦X has I²⊆ker α. Yet YX is a nonzero idempotent in the ambient left ideal span{X}, so that ideal cannot be nilpotent. Keep the augmentation ideal and action kernel in Sym_A(Q∨); the commutative image algebra is a separate possible formulation. This tests a potential implementation error and records no source erratum.

TwistedHiggsBundle.augmentation_pow_generators.test_zero checks that the empty word generates the whole source ideal at N=0. TwistedHiggsBundle.augmentation_pow_generators.test_one recovers the degree-one generator span of ker ε. The generator lemma assumes only a commutative coefficient ring and modules, with V=Hom_A(Q,A); it adds no freeness, finite-generation, reducedness or characteristic restriction.

Fresh primary reading was Heuer25 Definition 1.2(2), all of Definition 4.1 and Remark 4.2 in the publisher HTML, and Liu–Zhu Lemma 2.15 with its complete short proof. Spectral/coherent-image and twisting results in Heuer's consumer are not absorbed into this roadmap. All later source obligations, sheaf gluing, rank bounds and filtered-period interfaces remain open.

Under PROTOCOL section 13, the current suggested bodies are admitted sketches. The fifteen actual affine declarations and ten proved examples remain available at immutable commit 9a36f4d1d6743c0202f12020c0df603400149faa; their preceding exact-file receipts remain historical. A separate Mathlib-only experiment proves the generic span/word/kernel implication from an explicit ideal-generation equality, without admissions. That experiment is evidence for the algebraic route, not a compiled proof of the Tau Ceti augmentation adapter or of a global sheaf statement. Current exact-file and projection receipts appear in the packet and handoff.

Current exact admitted sketch receipt: 0 errors, 156 admitted-declaration warnings only, 62 examples; source SHA-256 e7c84108653b8d910a49fb6aebe50ca9880572f206b2e0348ba36e625665af4b. Compiler-output SHA-256 2c8ff8fa3cfb9ca4ba9deef0bc48a0fdb6436a483149be1da355a8281715482f. Separate conditional proof: 0 errors/warnings, both axiom audits contain only propext, Classical.choice and Quot.sound. The finite script freshly reruns all 88 commuting F₂ pairs at N=0,…,4 (440 cases) and its ambient-ideal, characteristic-two and nonreduced fixtures. The actual assembler has an acyclic 3,022-vertex/8,663-edge stage graph; the own declaration graph is 71/138; the reachable declaration/request graph is 3,088/8,916. All 21 computed stage prerequisite pairs are reachable, with unchanged stage edges and no own skipped links. Sixty-eight of the seventy inherited node objects are unchanged; all mathematical statements and prior tests survive. All 71 nodes remain unchecked; H.0 partial and H.1–H.8 not_read.

## Ordered second iterates on affine coefficient charts

For a finite basis (q_i) of Q, contraction reconstructs θ(e)=Σ_i a_θ(q_i∨)(e)⊗q_i. This requires no basis or reducedness on E. Apply θ a second time to the E-factor and use the native associator to obtain E⊗(Q⊗Q). The new coefficient occupies the left slot, so contraction by (v,w) is a_θ(v)∘a_θ(w), with w applied first. This formula holds for noncommuting contractions.

Reconstructing both tensor factors proves that the second iterate vanishes exactly when every ordered product of two coefficient contractions vanishes. Exterior integrability and commuting contractions are not hypotheses. This supplies the N=2 affine step of the existing all-N coordinate theorem; it retains the required all-N induction, restriction/change-of-chart and sheaf gluing. No tensor of global section modules replaces a sheaf tensor.

Declaration: HodgeStructuresPartII:H.0/affine-contractions-reconstruction. lemma. Native name: TwistedHiggsBundle.affineContractions_reconstruct.

Statement: For a finite basis b=(q_i) of Q and every e in E, θ(e)=Σ_i a_θ(b_i∨)(e)⊗q_i in the actual E⊗_R Q. The coordinate dual is b.coord i. Only Q has a finite basis; E is an arbitrary module.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:Module.Basis.coord, mathlib:Module.Basis.sum_repr, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.tmul_sum.

Proof: Tensor induction reduces reconstruction to zero, pure tensors and sums. For e⊗q, contracting b.coord i gives the corresponding scalar times e. Tensor balancing and the native finite basis reconstruction sum give e⊗q. Apply this identity to θ(e); no generic basis or tensor carrier is defined.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square. construction. Native name: TwistedHiggsBundle.affineOrderedSquare.

Statement: Construct θ^[2]:E→E⊗(Q⊗Q) as assoc∘(θ⊗id_Q)∘θ. The outer θ creates the left coefficient factor; no exterior or symmetric quotient is taken.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.map, mathlib:TensorProduct.assoc.

Proof: Compose the existing linear tensor map of θ and id_Q with θ, then apply the existing associator. The codomain retains both ordered coefficient slots even for noncommuting contractions.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing. Supplies the exact native N=2 affine specialization before the general iteration and sheaf assembly.

Use: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing. Tests ordered nilpotence by actual products of two contractions.

API: TwistedHiggsBundle.affineOrderedSquare_apply (projection). The value on e is the native associator applied to (θ⊗id_Q)(θ(e)).

API: TwistedHiggsBundle.affineOrderedSquare_zero (simp). The zero field has zero second iterate.

API: TwistedHiggsBundle.affineOrderedSquare_contraction (compatibility). Contraction of the two slots by v,w equals a_θ(v)∘a_θ(w), with w applied first.

Test: TwistedHiggsBundle.affineOrderedSquare.test_zero (degenerate). For any modules E,Q, the second iterate of the zero field is zero.

Test: TwistedHiggsBundle.affineOrderedSquare.test_line_nonzero (non-example). For any nontrivial R, E=Q=R and θ(e)=e⊗1, the ordered second iterate is nonzero. A rank-one field cannot be declared square-nilpotent from an exterior-square condition.

Test: TwistedHiggsBundle.affineOrderedSquare.test_empty_coefficients (degenerate). If Q is subsingleton, every θ has zero second iterate.

Test: TwistedHiggsBundle.affineOrderedSquare.test_order (computation). Over ℚ, E=Q=ℚ², let X=E12,Y=E21 and θ(e)=Xe⊗q0+Ye⊗q1. Contraction of θ^[2] by the coordinate pair (q0∨,q1∨) is XY=E11 and differs from the reverse YX=E22. No integrability is assumed.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square-contraction. lemma. Native name: TwistedHiggsBundle.affineOrderedSquare_contraction.

Statement: For arbitrary dual functionals v,w on Q, contract θ^[2] by the functional lid∘(v⊗w):Q⊗Q→R. The resulting endomorphism is a_θ(v)·a_θ(w), with the right factor applied first. No finite basis or integrability is needed.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-square, HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul, mathlib:TensorProduct.rid.

Proof: On each outer pure tensor e⊗q, use a second tensor induction on θ(e). The native associator and tensor map identify the result with w(q) times the v-contraction of θ(e); commuting coefficient scalars uses the commutative base only. Additivity finishes both inductions. Apply the result to θ(e) and use the actual composition multiplication in End_R(E).

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

Declaration: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing. lemma. Native name: TwistedHiggsBundle.affineOrderedSquare_eq_zero_iff.

Statement: For a finite basis b of Q, θ^[2]=0 iff a_θ(b_i∨)·a_θ(b_j∨)=0 for every ordered pair i,j. No integrability, field, reducedness or finite basis on E is needed. Distinct ordered pairs remain distinct, including in characteristic two.

Hypotheses: R is any commutative ring and E,Q are R-modules. No freeness, finiteness or reducedness is required on E. A finite basis b of Q is required only for reconstruction and the converse vanishing criterion. The tensor products and End_R(E) are the existing native algebraic carriers. The second iterate is ordered, with the newly applied Q-factor on the left. Integrability and commuting contractions are not hypotheses. These are affine statements; sheaf restriction/gluing stays an E1 input.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-square, HodgeStructuresPartII:H.0/affine-ordered-square-contraction, HodgeStructuresPartII:H.0/affine-contractions-reconstruction, mathlib:TensorProduct.sum_tmul, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul.

Proof: If θ^[2] vanishes, contract the two slots and use the exact two-slot formula. Conversely reconstruct θ(e) and then θ(a_θ(b_j∨)e) in the finite coefficient basis. Every summand of the associated ordered double tensor has coefficient a_θ(b_i∨)a_θ(b_j∨)e. The hypothesized endomorphism equality kills every coefficient, so both finite sums vanish. This is an actual algebraic N=2 proof; general N and sheaf gluing are separate obligations.

Source: Heuer25 Definitions1.2(2) and4.1 motivate the contraction. The displayed ordered algebra is derived, not quoted as a named source theorem.

The existing HodgeStructuresPartII:H.0/ordered-coordinate-vanishing now imports HodgeStructuresPartII:H.0/affine-ordered-square-vanishing and HodgeStructuresPartII:H.0/affine-contractions-reconstruction for its affine N=2 step. That predecessor receipt stopped at N=2; the current all-N affine continuation follows below. Its sheaf hypotheses and statement remain unchanged.

Native baseline statements:

- mathlib:Module.Basis.sum_repr — A vector in a finite basis is the finite sum of its coordinates times basis vectors. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.coord — Existing linear dual coordinate of a chosen basis. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:TensorProduct.induction_on — Existing zero/pure-tensor/add induction for the actual tensor product. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.
- mathlib:TensorProduct.assoc — Existing linear associator from (E tensor Q) tensor Q to E tensor (Q tensor Q). Source: Mathlib/LinearAlgebra/TensorProduct/Associator.lean.
- mathlib:TensorProduct.assoc_tmul — The actual associator sends (e tensor q) tensor r to e tensor (q tensor r). Source: Mathlib/LinearAlgebra/TensorProduct/Associator.lean.
- mathlib:TensorProduct.map_tmul — Native tensor map applies its two component maps to a pure tensor. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean.
- mathlib:TensorProduct.tmul_sum — Tensoring a fixed first factor distributes over a finite sum in the second factor. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.
- mathlib:TensorProduct.sum_tmul — Tensoring a finite sum in the first factor distributes over a fixed second factor. Source: Mathlib/LinearAlgebra/TensorProduct/Defs.lean.

The source-augmentation generator adapter remains HodgeStructuresPartII:H.0/augmentation-power-generators: the actual source ideal power is generated by words of exactly that length, including the empty word at degree zero. This is separate from the new tensor-square chart calculation.

## Historical validation of the ordered-square contracts

The [separate native proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/a31c7908e2ba7455d333f1f4e25e07a6563f692b/research/blueprint/suggested/HodgeStructuresPartII.lean) proves finite-coefficient reconstruction, the actual second-iterate construction, its projection/zero/contraction formulas and the exact finite-basis vanishing criterion. All four new examples are proved, including the E12/E21 ordering test. A narrow extraction passes with zero errors or warnings and seven kernel axiom audits without admission dependencies. It reuses the historical native contraction proof; it does not prove general-N or global sheaf statements.

Under PROTOCOL section13 the submitted new signatures/examples retain admitted bodies. The entire suggested file, which imports only Mathlib, passes at the exact pin with 66 examples, zero errors, 166 admission warnings and no other warnings. The 35 inherited global omission entries remain; compilation does not supply those signatures. No TauCeti build, library cache or language server was created.

The packet has 75 nodes, 115 API items, 107 total tests (105 for definitions/constructions), 82 baseline references and six planets. All 71 predecessor statements and 70 complete predecessor node objects are preserved. The actual stage graph and its transitive stage/declaration graph are acyclic, all 21 required stage pairs are reachable, and this packet has no skipped/pending links. H.0 remains partial, H.1–H.8 not_read; eleven gaps and five requests remain.

## Arbitrary-N native affine continuation

This extends the exact native second-iterate chart proof using Mathlib TensorPower, its zero-degree unit, native dual pairing and existing finite tensor basis. The tensor-power carrier, basis and associators are imported, not replanned. No global module-sheaf object is replaced by its sections. All75 predecessor statements are retained; only the existing global ordered-coordinate proof/input list is refined.

For a tuple of duals, contractions form a list product in the actual potentially noncommutative End algebra. The leftmost dual is the newest coefficient, so a two-letter word is A_i A_j with A_j acting first. The empty product is the identity. The scalar products inside the dual pairing commute because the base ring is commutative; no endomorphism commutativity is inferred.

### Prepend one coefficient factor

Node: HodgeStructuresPartII:H.0/affine-ordered-step. construction. Declaration: TwistedHiggsBundle.affineOrderedStep.

Statement: For θ:E→E⊗Q and n≥0 construct S_θ,n:E⊗Q^⊗n→E⊗Q^⊗(n+1) by θ⊗id, the associator, the native singleton tensor equivalence Q≅Q^⊗1, native multiplication of tensor powers and the cast 1+n=n+1. The new Q factor is inserted on the left.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: mathlib:TensorPower, mathlib:TensorPower.mulEquiv, mathlib:TensorPower.cast, mathlib:PiTensorProduct.subsingletonEquiv, mathlib:TensorProduct.congr, mathlib:TensorProduct.assoc, mathlib:TensorProduct.map.

Proof: Compose the existing tensor maps and linear equivalences; the singleton/multiplication/cast equivalences are internal data, not new carriers. On a pure input e⊗(q₁⊗⋯⊗qₙ), expand θ(e) and insert its Q factor before q₁. No symmetric or exterior quotient is used.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing — Supplies the native arbitrary-N affine chart calculation, with the empty word and tensor unit retained; restriction and local equality detection remain separate supplier obligations.

Use: LZ17 Theorem2.1(i); Lemma2.15 — Provides an ordered-coefficient interface for the nilpotent Higgs conclusion. No geometric nilpotence or source correspondence proof follows from this algebraic calculation alone.

API: TwistedHiggsBundle.affineOrderedStep_zero (simp). S_0,n=0 for every n.

API: TwistedHiggsBundle.affineOrderedStep_add (compatibility). S_(θ+η),n=S_θ,n+S_η,n.

API: TwistedHiggsBundle.affineOrderedStep_contraction (compatibility). For any η:E→E⊗Q^⊗n, contract S_θ,n∘η by (v,vs) to obtain a_θ(v) times the vs contraction of η, in this order.

Test: TwistedHiggsBundle.affineOrderedStep.test_zero (degenerate). The zero field gives a zero successor step at every order.

Test: TwistedHiggsBundle.affineOrderedStep.test_empty_coefficients (degenerate). If Q is subsingleton then S_θ,n=0 for every θ and n, including n=0.

Test: TwistedHiggsBundle.affineOrderedStep.test_scalar_nonzero (non-example). For any nontrivial R, E=Q=R and θ(e)=e⊗1, every S_θ,n is nonzero. A unit field cannot acquire nilpotence at a positive order.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Native ordered Higgs iterates

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate. construction. Declaration: TwistedHiggsBundle.affineOrderedIterate.

Statement: For every n≥0 construct θ^[n]:E→E⊗Q^⊗n recursively: θ^[0] is the inverse right tensor unit followed by the native identification R≅Q^⊗0; θ^[n+1]=S_θ,n∘θ^[n]. This definition uses no integrability or finite basis.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, mathlib:TensorPower.algebraMap₀, mathlib:TensorProduct.rid, mathlib:TensorProduct.map.

Proof: Use primitive recursion into the native tensor-power codomains, with the actual degree-zero unit rather than a zero map. Apply the successor step at each degree; its new factor is always the leftmost coefficient.

Use: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing — Supplies the native arbitrary-N affine chart calculation, with the empty word and tensor unit retained; restriction and local equality detection remain separate supplier obligations.

Use: LZ17 Theorem2.1(i); Lemma2.15 — Provides an ordered-coefficient interface for the nilpotent Higgs conclusion. No geometric nilpotence or source correspondence proof follows from this algebraic calculation alone.

API: TwistedHiggsBundle.affineOrderedIterate_zero (projection). θ^[0](e)=e⊗1₀ in the actual degree-zero tensor unit.

API: TwistedHiggsBundle.affineOrderedIterate_succ (projection). θ^[n+1]=S_θ,n∘θ^[n].

API: TwistedHiggsBundle.affineOrderedIterate_contraction (compatibility). Contraction by an ordered n-tuple of duals equals the ordered product of the n contractions of θ; at n=0 the product is id_E.

API: TwistedHiggsBundle.affineOrderedIterate_zero_field (simp). The zero field has zero iterate at every positive order. Order zero remains the tensor-unit identity.

Test: TwistedHiggsBundle.affineOrderedIterate.test_unit_boundary (boundary). For any θ, contraction of θ^[0] by the empty tensor pairing is id_E, including E=0.

Test: TwistedHiggsBundle.affineOrderedIterate.test_zero (degenerate). The zero field vanishes at all positive orders without imposing any assumption on E,Q.

Test: TwistedHiggsBundle.affineOrderedIterate.test_scalar_nonzero (non-example). For any nontrivial R, the scalar unit field on E=Q=R has nonzero θ^[n] for every n≥0.

Test: TwistedHiggsBundle.affineOrderedIterate.test_nonreduced_nilpotent (boundary). Over Z/4, θ=2 times the scalar unit field is nonzero but θ^[2]=0. This rules out unconditional rank-one or reduced-base shortcuts.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Evaluate an affine contraction

Node: HodgeStructuresPartII:H.0/affine-contractions-apply. lemma. Declaration: TwistedHiggsBundle.affineContractions_apply.

Statement: For any dual v and e∈E, a_θ(v)(e)=rid((id_E⊗v)(θ(e))).

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.rid, mathlib:TensorProduct.map.

Proof: Unfold the contraction linear map and its compositions. This is an existing API item promoted because the arbitrary-N unit calculation consumes it.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Contractions of the zero field

Node: HodgeStructuresPartII:H.0/affine-contractions-zero. lemma. Declaration: TwistedHiggsBundle.affineContractions_zero.

Statement: For any E,Q the contraction linear map of the zero field is zero.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-contractions.

Proof: Evaluate the native compositions at each functional and vector. Promote the existing API to discharge the forward coefficient-vanishing implication.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Degree-zero tensor unit

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-unit. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_zero.

Statement: For every θ and e, θ^[0](e)=e⊗algebraMap₀(1).

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate, mathlib:TensorPower.algebraMap₀, mathlib:TensorProduct.rid.

Proof: Unfold only the zero branch and evaluate the native right tensor unit and tensor map.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Ordered successor recurrence

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-succ. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_succ.

Statement: For every n≥0, θ^[n+1]=S_θ,n∘θ^[n].

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

Proof: The equality is the successor branch of the recursive construction.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Zero successor step

Node: HodgeStructuresPartII:H.0/affine-ordered-step-zero. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_zero.

Statement: For every n≥0, S_0,n=0.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step.

Proof: Evaluate the composite; the tensor map of the zero field is zero.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Successor step is additive in the field

Node: HodgeStructuresPartII:H.0/affine-ordered-step-add. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_add.

Statement: For every θ,η,n, S_(θ+η),n=S_θ,n+S_η,n.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, mathlib:TensorProduct.map_add_left.

Proof: Distribute the tensor map in its left argument, then use additivity of the associator and prepend map.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Contract the new leftmost factor

Node: HodgeStructuresPartII:H.0/affine-ordered-step-contraction. lemma. Declaration: TwistedHiggsBundle.affineOrderedStep_contraction.

Statement: For arbitrary η:E→E⊗Q^⊗n, v∈Q∨ and vs:Fin n→Q∨, contraction of S_θ,n∘η by the native pairing of Fin.cons v vs equals a_θ(v)·a_η(pairing(vs)). No basis or integrability is required.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-step, HodgeStructuresPartII:H.0/affine-contractions, mathlib:TensorProduct.induction_on, mathlib:PiTensorProduct.induction_on, mathlib:TensorProduct.map_tmul, mathlib:TensorProduct.assoc_tmul, mathlib:TensorProduct.congr_tmul, mathlib:PiTensorProduct.subsingletonEquiv_symm_apply', mathlib:TensorPower.gMul_def, mathlib:TensorPower.tprod_mul_tprod, mathlib:TensorPower.cast_tprod, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Fin.append_left_eq_cons, mathlib:Fin.prod_univ_succ, mathlib:TensorProduct.rid, mathlib:TensorPower.multilinearMapToDual.

Proof: Induct on the input E⊗Q^⊗n, then on the native PiTensorProduct factor. Reduce to a scalar times a pure n-tuple. A second tensor induction on θ(e) reduces the new leftmost factor to a pure tensor. The singleton, multiplication and cast formulas identify it with Fin.cons of the new coefficient and the old tuple. Evaluate the native dual pairing; its commutative scalar product splits into v(q) times the tail product. Only scalar commutation is used. The resulting endomorphism composition is a_θ(v) after the tail contraction.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Exact ordered coefficient formula

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-contraction. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_contraction.

Statement: For every n≥0 and vs:Fin n→Q∨, contraction of θ^[n] by the native tensor-power dual pairing equals the ordered list product [a_θ(vs(0)),…,a_θ(vs(n−1))]. Its empty product is id_E. End_R(E) need not be commutative.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-unit, HodgeStructuresPartII:H.0/affine-ordered-iterate-succ, HodgeStructuresPartII:H.0/affine-ordered-step-contraction, HodgeStructuresPartII:H.0/affine-contractions-apply, mathlib:TensorPower.algebraMap₀_one, mathlib:TensorPower.gOne_def, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Module.End.one_eq_id, mathlib:TensorPower.multilinearMapToDual.

Proof: At n=0 evaluate the actual tensor unit and empty scalar pairing; the result is the identity. At n+1 split the dual tuple into its head and successor tail and apply the left-factor contraction lemma and induction hypothesis. Use the core finite-list head/tail recursion to obtain an ordered list product. A commutative finite-set product of endomorphisms is never used.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Dual coordinates of a native tensor power

Node: HodgeStructuresPartII:H.0/affine-tensor-power-coordinate. lemma. Declaration: TwistedHiggsBundle.affineTensorPower_coordinate.

Statement: For a finite basis b:I→Q, every n≥0 and word p:Fin n→I, the p coordinate of the existing native piTensorProduct basis equals the tensor-power pairing of the dual coordinates b.coord(p(i)). This includes the unique empty word.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: mathlib:Basis.piTensorProduct, mathlib:Basis.piTensorProduct_repr_tprod_apply, mathlib:PiTensorProduct.ext, mathlib:TensorPower.multilinearMapToDual_apply_tprod, mathlib:Module.Basis.coord, mathlib:TensorPower.multilinearMapToDual.

Proof: By native PiTensorProduct extensionality it suffices to evaluate both functionals on a pure tuple. The tensor basis representation and native dual pairing both give the product of the corresponding scalar coordinates. No new tensor-power basis carrier is introduced.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### All-order finite-chart vanishing criterion

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_eq_zero_iff.

Statement: For a chosen finite basis b of Q and every n≥0, θ^[n]=0 iff every ordered coefficient word [a_θ(b.coord(p(0))),…,a_θ(b.coord(p(n−1)))] has zero product. At n=0 this is equivalent to id_E=0, hence E is the zero module. E need not have a finite basis.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-contraction, HodgeStructuresPartII:H.0/affine-tensor-power-coordinate, HodgeStructuresPartII:H.0/affine-contractions-reconstruction, HodgeStructuresPartII:H.0/affine-contractions-zero, mathlib:Basis.piTensorProduct.

Proof: If θ^[n]=0, use the exact contraction formula and the promoted zero contraction lemma. For the converse reconstruct each θ^[n](e) using the existing finite native tensor basis and the arbitrary-E contraction reconstruction lemma. Identify every tensor coordinate with its dual tuple pairing, replace it by the ordered coefficient product, and kill each summand by hypothesis. This proves the affine statement; sheaf equality detection and gluing remain separate.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Zero field at every positive degree

Node: HodgeStructuresPartII:H.0/affine-ordered-iterate-zero-field. lemma. Declaration: TwistedHiggsBundle.affineOrderedIterate_zero_field.

Statement: For every n≥0, the (n+1)-st ordered iterate of the zero field vanishes. The zero-th iterate is not asserted to vanish.

Hypotheses: R is an arbitrary commutative ring; E and Q are R-modules. No finite basis, field, reducedness or integrability is assumed on E or θ. A chosen finite basis of Q is required only in the coordinate and converse vanishing lemmas. Use the native TensorPower R n Q, its degree-zero tensor unit and the actual associative composition algebra End_R(E). Products of endomorphisms are ordered from left to right, with the rightmost factor applied first. Scalars alone commute. These are affine module statements; E1 owns the global sheaf tensor-power and restriction/gluing interfaces.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-succ, HodgeStructuresPartII:H.0/affine-ordered-step-zero.

Proof: Rewrite the recurrence and use the zero successor step; composition with zero vanishes.

Source: [Heuer Definitions1.2(2) and4.1](https://link.springer.com/article/10.1007/s00222-025-01321-4) motivate the Higgs/contraction interface. These are authored algebraic deductions from the named pinned native declarations, not printed correspondence results.

### Historical all-order evidence and remaining closure

Fresh primary reading is restricted to complete Heuer Definitions1.2(2) and4.1, including image/canonical-section/twisting formulas, and [Liu–Zhu Theorem2.1(i)–(v) and Lemma2.15 with its proof](https://arxiv.org/pdf/1602.06282v3), PDFpp.7 and18–19. The latter proves nilpotence of the logarithm through the cyclotomic-conjugation characteristic-polynomial argument. It motivates the algebraic coefficient interface but does not print its arbitrary-N proof. Publisher HTML SHA256 f70c37b9ea04164e15efe2dfe2754cd5eb605adb008260000153ce279a9f4934; Liu–Zhu v3 PDF SHA256 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79. Other source findings, all149 routed obligations and accepted owner boundaries are inherited unchanged. No new source error is asserted.

The [immutable native proof prototype](https://github.com/CBirkbeck/tauceti-explorer/blob/ea49500be7122dfa7b09c7128537d8a304dae405/research/blueprint/suggested/HodgeStructuresPartII.lean) proves all eleven new native declarations and seven new examples; it restores the actual affine contraction/reconstruction/square proof prefix for a check without admission dependencies. Its narrow extraction has14 examples, zero errors/warnings/admissions and20 axiom audits with no admission dependencies. The standard kernel dependencies are propext, Classical.choice and Quot.sound. The predecessor N=2 noncommuting E12/E21 example remains in this extraction. The all-N vanishing criterion requires a finite basis only for Q, not E. The new Z/4 example preserves the nonreduced-base boundary.

The entire submitted Mathlib-only planning sketch elaborates at the exact pin with73 examples, zero errors,184 admitted-declaration warnings and no other warnings. All new bodies are admitted under PROTOCOL section13. The35 inherited global signature omissions remain. This elaboration does not certify those missing signatures, sheaf gluing, rank bounds or any stage. Native arbitrary-N coefficient proofs and admitted planning signatures are distinct receipts.

The exact-pin baseline entries record native tensor powers, singleton/multiplication/cast/unit equivalences, pure-tensor dual pairing, piTensorProduct basis coordinates, extensionality and induction. Core finite-list recursion is routine; Fin.prod_univ_succ is applied only to commutative scalar products. It is never used for products of endomorphisms.

Baseline: mathlib:Basis.piTensorProduct — For a finite family of R-modules with chosen bases, the native PiTensorProduct has a basis indexed by tuples of factor-basis indices. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean, declaration line33.

Baseline: mathlib:Basis.piTensorProduct_repr_tprod_apply — The tuple coordinate of a pure native tensor is the product of scalar basis coordinates in each factor. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean, declaration line42.

Baseline: mathlib:Fin.append_left_eq_cons — Appending a singleton tuple on the left of an n-tuple agrees with Fin.cons of its sole value and that tuple. Source: Mathlib/Data/Fin/Tuple/Basic.lean, declaration line367.

Baseline: mathlib:Fin.prod_univ_succ — For a commutative monoid, a product over Fin(n+1) is its zeroth factor times the product of successor factors. Used only for base scalars here. Source: Mathlib/Algebra/BigOperators/Fin.lean, declaration line76.

Baseline: mathlib:Module.End.one_eq_id — The unit of the native composition endomorphism algebra is the identity linear map. Source: Mathlib/Algebra/Module/LinearMap/End.lean, declaration line51.

Baseline: mathlib:PiTensorProduct.ext — Two linear maps out of a native PiTensorProduct are equal if they agree on every pure tuple. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line364.

Baseline: mathlib:PiTensorProduct.induction_on — Prove a predicate on native finite-family tensors by additivity and scalar multiples of pure tuples. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line356.

Baseline: mathlib:PiTensorProduct.subsingletonEquiv — For a subsingleton index type with a chosen element, the native PiTensorProduct is linearly equivalent to that one module factor. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line806.

Baseline: mathlib:PiTensorProduct.subsingletonEquiv_symm_apply' — For the constant module family over a subsingleton index type, the inverse singleton equivalence sends an element to the constant pure tuple. Source: Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean, declaration line829.

Baseline: mathlib:TensorPower — For a commutative semiring R and R-module Q, TensorPower R n Q abbreviates the existing PiTensorProduct of n copies indexed by Fin n. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line38.

Baseline: mathlib:TensorPower.algebraMap₀ — The native linear equivalence R≅Q^⊗0; no assumption of freeness or nontriviality on Q. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line202.

Baseline: mathlib:TensorPower.algebraMap₀_one — The degree-zero algebra-map equivalence sends1 to the graded tensor unit. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line208.

Baseline: mathlib:TensorPower.cast — Reindex a native tensor power along a specified equality of degrees; a linear equivalence with no change to its module factors. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line98.

Baseline: mathlib:TensorPower.cast_tprod — The degree cast sends a pure tuple to its native reindexed tuple along the inverse Fin congruence. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line100.

Baseline: mathlib:TensorPower.gMul_def — The native graded multiplication is the linear tensor-power multiplication equivalence applied to a pure tensor of two tensor-power elements. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line86.

Baseline: mathlib:TensorPower.gOne_def — The native degree-zero graded tensor unit is the pure empty tuple. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line72.

Baseline: mathlib:TensorPower.mulEquiv — Native linear equivalence Q^⊗n⊗Q^⊗m≅Q^⊗(n+m), preserving the first block before the second block. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line76.

Baseline: mathlib:TensorPower.multilinearMapToDual_apply_tprod — The native pairing of an n-tuple of duals with a pure n-tuple is the product of scalar evaluations in the commutative coefficient semiring. Source: Mathlib/LinearAlgebra/TensorPower/Pairing.lean, declaration line53.

Baseline: mathlib:TensorPower.tprod_mul_tprod — Multiplying two pure tensor tuples gives the concatenated tuple with the first tuple before the second. Source: Mathlib/LinearAlgebra/TensorPower/Basic.lean, declaration line138.

Baseline: mathlib:TensorProduct.congr — A pair of compatible semilinear module equivalences gives the native semilinear tensor-product equivalence; specialize to identity scalar homomorphisms here. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line260.

Baseline: mathlib:TensorProduct.congr_tmul — The tensor congruence sends a pure tensor to the pure tensor of the two equivalence images. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line270.

Baseline: mathlib:TensorProduct.map_add_left — Tensor mapping distributes over addition of the first semilinear map, with the same fixed second map. Source: Mathlib/LinearAlgebra/TensorProduct/Map.lean, declaration line149.

Baseline: mathlib:TensorPower.multilinearMapToDual — For any commutative semiring R and R-module Q, the native multilinear map sends n dual functionals to a linear functional on Q^⊗n. On a pure tensor it is the commutative scalar product of evaluations. No finite basis on Q is required. Source: Mathlib/LinearAlgebra/TensorPower/Pairing.lean, declaration line31.

Actual atlas assembly and the scoped prerequisite DAG pass without unresolved inputs or cycles. There are88 nodes,122 API items,114 total tests (112 required construction/definition tests),105 baseline entries and six unchanged planets. The reserved key, parent Hodge L0–L3, common variation D3, ordinary connection CR.1, generic sheaf tensor/dual/descent E1 and filtration/Rees DD.1 ownership remain unchanged. Global tensor-power comparison, change-of-chart/restriction and local equality detection/gluing are still required; the augmentation-power and rank/period adapters are separate obligations. H.0 remains partial, H.1–H.8 not_read, with11 gaps and5 requests.


## Predecessor checkpoint: native naturality and exact bound transport

This continuation uses the existing E-left convention: a field has codomain E tensor Q, and its next application prepends the new Q coefficient before the previous coefficient word. The preceding mathematical handoff used a Q-left presentation. Those presentations require the actual tensor flip; they are not literally the same carrier. The native affine formulas below preserve all88 predecessor statements.

The source input is the actual field and intertwining equation in [Heuer, arXiv v3, Definition1.2](https://arxiv.org/html/2307.01303v3), read with its complete two parts. The tensor discussion in [Stacks, Section17.16](https://stacks.math.columbia.edu/tag/01CA) distinguishes the presheaf tensor from the sheaf tensor. The following seven results are authored affine algebraic deductions, not named correspondence theorems from either source. No integrability, coefficient basis or finite rank is required. Generic tensor functor laws and congruences are existing Mathlib work, not new Higgs constructions.

Write T_n(u) for the existing finite-family tensor map of n copies of u, and I_n(theta),S_theta,n for the existing native iterate and step. For theta:E→E tensor Q, psi:F→F tensor P and R-linear f,u assume psi composed with f=(f tensor u) composed with theta, except in the independent order-zero test. All modules are arbitrary over a commutative ring.

### Naturality of a coefficient-prepending step

**Node:** HodgeStructuresPartII:H.0/affine-ordered-step-natural. **Proposed declaration:** TwistedHiggsBundle.affineOrderedStep_natural. **Kind:** lemma; implementation unchecked.

For every n≥0, S_psi,n composed with (f tensor u^(tensor n)) equals (f tensor u^(tensor(n+1))) composed with S_theta,n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-step; mathlib:PiTensorProduct.map; mathlib:PiTensorProduct.map_tprod.

**Proof route:** Reduce equality of linear maps by native tensor extensionality, then induction on the existing n-fold coefficient tensor. For a pure coefficient word, substitute psi(f(e))=(f tensor u)(theta(e)); expand theta(e) by native tensor induction. Both sides are f(x) tensor the word (u(q),u(q1),…,u(qn)); singleton, multiplication and degree-cast maps retain the new leftmost slot. Extend by scalar linearity and addition.

**Acceptance:** The identity holds at n=0 with the actual empty tensor, not a zero surrogate. Every linear coefficient map u is permitted, including u=0. The convention retains the newly applied factor before the old ordered word.

### Naturality at every ordered degree

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_natural. **Kind:** lemma; implementation unchecked.

For every n≥0, I_n(psi) composed with f equals (f tensor u^(tensor n)) composed with I_n(theta).

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-step-natural; HodgeStructuresPartII:H.0/affine-ordered-iterate-unit; HodgeStructuresPartII:H.0/affine-ordered-iterate-succ.

**Proof route:** At n=0 both sides send e to f(e) tensor 1_0; the empty coefficient maps are equal by elimination of Fin 0. At n+1 substitute the two successor recurrences and the degree-n induction hypothesis. Apply step naturality and associativity of linear-map composition. No coefficient dualization or finite basis is required.

**Acceptance:** Order zero works for arbitrary f,u even without the intertwining hypothesis. The same n appears on both sides; no enlargement of the exponent occurs. In particular, coefficient specialization with f=id transports a vanishing iterate.

### Enlarge an ordered nilpotence bound

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-mono. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_mono. **Kind:** lemma; implementation unchecked.

If n≤m and I_n(theta)=0, then I_m(theta)=0, including n=0.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-succ.

**Proof route:** Write m=n+d and induct on d. The zero increment is the hypothesis; each successor is S_theta,n+d composed with the zero map. This is a statement about a given exponent; it does not construct a bound on an arbitrary infinite cover.

**Acceptance:** Vanishing at degree two implies vanishing at degree five. The assertion includes zero modules and the n=0 boundary. No commutativity of coefficient contractions is used.

### Preserve a fixed bound through a surjective morphism

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-surjective. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_zero_of_surjective. **Kind:** lemma; implementation unchecked.

For a surjective intertwiner f:E→F and any coefficient map u:Q→P, I_n(theta)=0 implies I_n(psi)=0 with exactly the same n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural.

**Proof route:** Naturality and the zero hypothesis show I_n(psi) composed with f is zero. Evaluate any x in F on a preimage under f; this proves I_n(psi)(x)=0. Surjectivity of f says nothing about zero detection by u. Do not reverse this implication for arbitrary coefficient maps.

**Acceptance:** For f=id and any u this gives coefficient specialization. A zero coefficient map in characteristic two preserves zero but erases a nonzero unit field. Reflection is provided only by the separate two-isomorphism theorem.

### Reflect the same bound through two isomorphisms

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-equiv. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_equiv_zero_iff. **Kind:** lemma; implementation unchecked.

For linear isomorphisms f:E≃F and u:Q≃P intertwining theta and psi, I_n(psi)=0 if and only if I_n(theta)=0, at the identical n.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-natural; mathlib:PiTensorProduct.congr; mathlib:TensorProduct.congr.

**Proof route:** The native tensor congruence of f and the family of n copies of u is an invertible linear map. If I_n(psi)=0, naturality makes this invertible tensor map annihilate I_n(theta); injectivity reflects zero pointwise. Conversely I_n(theta)=0 and surjectivity of f imply I_n(psi)=0. The proof covers n=0 without a separate positive-degree restriction.

**Acceptance:** Identity frame changes preserve the exact exponent. Both module and coefficient isomorphisms are explicit; f=id with u=0 is a counterexample to omitting the latter. There is no assumption that arbitrary scalar extension is faithful.

### First iterate and the singleton tensor equivalence

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-one. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_one. **Kind:** lemma; implementation unchecked.

Let a:Q≃Q^(tensor 1) be the existing inverse singleton tensor equivalence. Then I_1(theta)=(id_E tensor a) composed with theta.

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-unit; HodgeStructuresPartII:H.0/affine-ordered-iterate-succ; mathlib:PiTensorProduct.subsingletonEquiv; mathlib:TensorPower.mulEquiv.

**Proof route:** Unfold the degree-zero unit and the first successor step. Expand theta(e) into pure tensors using the native tensor induction principle. The first singleton coefficient multiplied by the empty tensor word, then cast 1+0=0+1, is the same singleton coefficient. Hence both maps agree.

**Acceptance:** I_1(theta)=0 if and only if theta=0, by injectivity of the native tensor congruence. No literal equality between Q and its singleton tensor-power carrier is asserted. The unit line field over Z/2 has a nonzero first iterate.

### Second iterate and the ordered associator square

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-two. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_two. **Kind:** lemma; implementation unchecked.

Let a:Q≃Q^(tensor 1) be the inverse singleton equivalence and c=(a tensor a) followed by native tensor-power multiplication into Q^(tensor 2). Then I_2(theta)=(id_E tensor c) composed with affineOrderedSquare(theta).

**Inputs:** HodgeStructuresPartII:H.0/affine-ordered-iterate-one; HodgeStructuresPartII:H.0/affine-ordered-square; mathlib:TensorProduct.congr; mathlib:TensorPower.mulEquiv.

**Proof route:** Apply the successor recurrence and the degree-one comparison. First induct on theta(e), then on each theta(x), so both expressions reduce to pure coefficient tensors. Both sides send an ordered term y tensor(p tensor q) to y tensor the two-slot word (p,q). The degree cast at 1+1=2 is definitionally the identity. No flip, exterior quotient or symmetric quotient is introduced.

**Acceptance:** I_2(theta)=0 if and only if the separate ordered square is zero. The new coefficient p occupies the first slot, preserving the earlier E12/E21 noncommuting discriminator. The assertion holds over arbitrary rings, including characteristic two.

### New APIs and native acceptance tests

The step construction gains its promoted naturality API. The iterate construction gains naturality,monotonicity,surjective preservation,two-isomorphism reflection and degree-one/two comparison APIs, each promoted to the corresponding lemma node above when consumed. Their existing projections and tests are retained.

| Test | Kind | Exact contract |
|---|---|---|
| TwistedHiggsBundle.affineOrderedIterate.test_natural_unit | compatibility | For arbitrary fields theta,psi and maps f,u, the degree-zero naturality equation holds even without an intertwining assumption; the empty tensor word is mapped to itself. |
| TwistedHiggsBundle.affineOrderedIterate.test_coefficient_quotient | compatibility | For any u:Q→P and n, I_n(theta)=0 implies I_n((id_E tensor u) composed with theta)=0 at the same n. |
| TwistedHiggsBundle.affineOrderedIterate.test_chart_identity | compatibility | Take f=id_E,u=id_Q and psi=theta in the isomorphism transport theorem; the same-exponent equivalence holds for every n. |
| TwistedHiggsBundle.affineOrderedIterate.test_bound_two_to_five | computation | If I_2(theta)=0 then I_5(theta)=0 over any commutative ring, with no integrability assumption. |
| TwistedHiggsBundle.affineOrderedIterate.test_one_zero_iff | characterisation | For any theta, its first ordered iterate is zero if and only if theta itself is zero. |
| TwistedHiggsBundle.affineOrderedIterate.test_two_zero_iff | compatibility | For any theta, its second ordered iterate is zero if and only if the separate associator-defined ordered square is zero. |
| TwistedHiggsBundle.affineOrderedIterate.test_characteristic_two_nonreflection | non-example | Over Z/2 with E=F=Q=P=Z/2, let theta(e)=e tensor 1, psi=0, f=id and u=0. The fields intertwine, I_1(psi)=0, and I_1(theta)≠0. Thus arbitrary coefficient maps cannot reflect a fixed bound even when f is an isomorphism. |

The characteristic-two test is an actual native tensor calculation, not a symmetric-square shortcut: the identity map on E intertwines the unit field with the zero field when u=0, yet only the latter has zero first iterate. The degree-two comparison uses the coefficient equivalence c explicitly; injectivity of id_E tensor c reflects the square-zero condition. It preserves the prior noncommuting ordered-product discriminator; no reversal of the two coefficient slots occurs.

### Remaining mathematical interfaces

These results settle native affine change of module/coefficient charts and same-ring isomorphism transport. An R-linear map u:Q→P is not the cross-ring functor S tensor_R−. Arbitrary scalar extension therefore still needs the actual scalar-tower and tensor-associativity comparison. Its fixed-exponent preservation uses no flatness, whereas reflection needs faithful zero detection. The inherited flat but nonfaithful projection example remains a valid warning against dropping faithfulness. Fixed-bound locality needs sheaf morphism equality detection; varying local bounds require a separate finite subcover/maximum argument. Field/reduced-ring rank bounds, image-algebra base change, period/Tate equivariance and global determinant comparison stay open. No tensor of global sections is substituted for a sheaf tensor. All5 supplier requests,11 gaps,149 source-route obligations and35 omitted global signatures remain. H.0 stays partial and H.1–H.8 not_read.

### Predecessor native proof and exact sketch evidence

The [immutable native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/ab19cc58e36f8fe16ff95e0258bb5dd308e2fb5f/research/blueprint/suggested/HodgeStructuresPartII.lean), delimited by ARCHIVED CHECKED HIGGS NATURALITY, contains the complete real native carriers and allseven new proofs/seven examples. Verbatim public extraction is byte-identical to the source checked against Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2. Source SHA-256:98d24ca7657199269c93f26eaae69b83dfedcd777ea8b0f0a669e5bb437bacc8. The check has zero errors,warnings or admissions; allseven kernel axiom audits contain only propext,Classical.choice andQuot.sound. Runtime2.20seconds,maxRSS2154116KiB,65GiB available beforehand. Twelve native declaration headers match the canonical planning file, including the inherited step,iterate,square and unit/successor types.

The entire submitted Mathlib-only planning file has80 examples and elaborates with zero errors,198 admitted-declaration warnings and no other warnings. Exact source SHA-256:87dd584cbe55a71d10bf049f6839f87a83e04c1d73b81b334a685b079b4cfb2b; compiler-log SHA-256:a0bff331fa557021ea49a37df2737387a4bf6417dbeeb2a76f629e7640e01a5e. Runtime4.70seconds,maxRSS2933908KiB,65GiB available. These are admitted signatures under protocol13. The separate actual proof does not turn any implementationStatus into implemented or discharge global omitted signatures. One bounded Lean process ran at a time; no project,cache,library build or language server was started.

The indexed packet and actual read-only atlas assembly pass. The stage/planet graph is3022vertices/8663edges; the own declaration prerequisite graph95/179; the stage/planet plus reachable prerequisite graph3112/8880,with96 reachable declarations and51 existing virtual supplier endpoints. Allare acyclic; zero unresolved references,no own skipped/pending links and unchanged stage edges. There are95 nodes,129 APIs,121 total tests,110 baseline references,six planets,five requests andeleven gaps. All88 inherited mathematical statements,86 complete node objects,122 inherited APIs,114 inherited tests,149 paper-item obligations andstage requires are retained. Only step/iterate constructions gain new promoted APIs/uses and the iterate gains seven tests.


## Scalar extension of ordered Higgs iterates

This partial continuation compares different coefficient rings using the existing native scalar-extension functor. Let R→S be any map of commutative rings, and let E and Q be R-modules. Write E_S=S⊗_R E and Q_S=S⊗_R Q. Extend the actual field θ:E→E⊗_R Q and compose with Mathlib’s existing S-linear distribution equivalence to obtain θ_S:E_S→E_S⊗_S Q_S. This construction needs neither integrability nor a basis, and it does not define another generic tensor functor. It sends a⊗θ(e) to the distribution image; a term a⊗(x⊗q) becomes (a⊗x)⊗(1⊗q).

Suppose b:I→Q is a basis. Its existing native extension b_S is an S-basis of Q_S with the same index type; this requires no flatness. Contract θ_S by the i-th coordinate of b_S. On a⊗e, expand θ(e) into elementary tensors. The coordinate of 1⊗q is the scalar image of b.coord(i)(q); tensor balancing moves this scalar back to the E factor. Consequently the contraction is exactly the S-extension of the original coordinate contraction. This comparison allows an infinite basis index type: each coordinate and each individual ordered word is finite data.

Apply the actual endomorphism scalar-extension algebra homomorphism to a list of contractions. It preserves the list product in the original order, even when the endomorphisms do not commute. The newest coefficient remains on the left, and the rightmost operator acts first. At degree zero, the empty product extends to the identity of E_S. No symmetric or exterior quotient, factorial denominator, field or characteristic assumption is used.

A finite basis of Q is required for the all-order vanishing criterion already planned here. E can still be any module. Apply that criterion before and after extension: every original ordered product vanishes when I_n(θ)=0, so its scalar extension vanishes, and reconstruction in the extended tensor-power basis gives I_n(θ_S)=0. The integer n is identical on both sides, including n=0. Scalar extension preserving a zero map requires no flatness; this calculation makes no assertion that kernels or image algebras commute with nonflat extension.

For reflection, assume S is faithfully flat over R. If I_n(θ_S)=0, each extended ordered product is zero. Evaluate it at 1⊗e. The native faithful-flat zero-detection lemma implies the original product kills e. Since e is arbitrary, the original word is zero; the original finite-basis criterion gives I_n(θ)=0. This is an application of [Stacks Lemma10.39.14](https://stacks.math.columbia.edu/tag/00H9), imported through pinned Mathlib, to the authored Higgs-word comparison. It is not a source theorem about the p-adic Simpson correspondence.

The construction and four consumed lemmas below keep all these hypotheses explicit. Their implementation status remains unchecked; the separate checked native proof provides evidence for the plan, while the suggested file retains admitted signatures under protocol13.

### Scalar extension of an affine twisted field

**Node:** HodgeStructuresPartII:H.0/affine-base-change. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange. **Kind:** construction; implementation unchecked.

For θ:E→E⊗_R Q, construct the S-linear field θ_S:E_S→E_S⊗_S Q_S by the existing linear-map scalar extension followed by the existing tensor-distribution equivalence. On an elementary term a⊗(x⊗q), the latter gives (a⊗x)⊗(1⊗q). No coefficient differential map or integrability claim is included.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity.

**Inputs:** mathlib:LinearMap.baseChange; mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange.

**Proof route:** Compose the native scalar extension of θ with the native S-linear tensor equivalence; introduce no new generic tensor or scalar-extension carrier. Pure tensor evaluation is the defining baseChange formula followed by distribBaseChange_tmul. The zero field extends to zero.

| API | Role | Contract |
|---|---|---|
| TwistedHiggsBundle.affineBaseChange_tmul | projection | θ_S(a⊗e) is the native tensor-distribution image of a⊗θ(e). |
| TwistedHiggsBundle.affineBaseChange_zero | simp | The zero field extends to the zero field for every R-algebra S. |
| TwistedHiggsBundle.affineBaseChange_contraction | compatibility | For any basis b of Q and i∈I, contraction of θ_S by the extended coordinate equals scalar extension of the i-th contraction of θ. |
| TwistedHiggsBundle.affineBaseChange_word | compatibility | Every ordered word of extended coordinate contractions is scalar extension of the corresponding original word, including the empty word. |

| Test | Kind | Contract |
|---|---|---|
| TwistedHiggsBundle.affineBaseChange.test_zero | degenerate | The extended zero field has zero iterate at every positive degree for arbitrary modules E,Q and every R-algebra S. |
| TwistedHiggsBundle.affineBaseChange.test_line | computation | For E=Q=R and θ(e)=e⊗1, θ_S(a⊗e)=(a⊗e)⊗(1⊗1). This detects the placement of the coefficient unit. |
| TwistedHiggsBundle.affineBaseChange.test_unit_all_orders | boundary | For every nontrivial R-algebra S, the scalar-extended unit field on E=Q=R has nonzero iterate at every n≥0. The empty product and positive degrees must all survive. |
| TwistedHiggsBundle.affineBaseChange.test_nonfaithful | non-example | Over R=Z with E=Q=Z, θ(e)=2e⊗1 is nonzero; its scalar extension to S=Z/2 is zero. Arbitrary scalar extension cannot reflect vanishing. This example does not assert that Z→Z/2 is flat. |

### Scalar extension of coordinate contractions

**Node:** HodgeStructuresPartII:H.0/affine-base-change-contraction. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange_contraction. **Kind:** lemma; implementation unchecked.

For any basis b:I→Q, θ:E→E⊗_R Q and i∈I, a_(θ_S)((b_S).coord i)=(a_θ(b.coord i))_S as actual S-linear endomorphisms of E_S. I need not be finite.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. A specified native R-basis b:I→Q is given, with arbitrary index type I.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change; HodgeStructuresPartII:H.0/affine-contractions; mathlib:Module.Basis.baseChange; mathlib:Module.Basis.baseChange_repr_tmul; mathlib:TensorProduct.AlgebraTensorModule.ext; mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul.

**Proof route:** Check equality on a⊗e, then induct on θ(e) in the native E⊗_R Q. For x⊗q, the extended coordinate of 1⊗q is the scalar image of b.coord(i)(q). The right tensor unit makes it act on a⊗x. The tensor balancing relation identifies this with a⊗a_θ(b.coord i)(e). Zero and sums follow by linearity. No evaluation of global sections or finite-basis reconstruction is used.

### Scalar extension of ordered contraction products

**Node:** HodgeStructuresPartII:H.0/affine-base-change-word. **Proposed declaration:** TwistedHiggsBundle.affineBaseChange_word. **Kind:** lemma; implementation unchecked.

For any basis b:I→Q, n≥0 and p:Fin(n)→I, the ordered product of the extended coordinate contractions equals scalar extension of the original ordered product. At n=0 both sides are id_(E_S).

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. A specified native R-basis b:I→Q is given; its index type may be infinite because each individual word is finite.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-contraction; mathlib:Module.End.baseChangeHom; mathlib:map_list_prod.

**Proof route:** Rewrite each factor by the coordinate-contraction lemma. Apply the existing endomorphism scalar-extension algebra homomorphism to the ordered list product. The generic monoid-homomorphism list-product law applies without commutativity. The homomorphism preserves the empty product as the actual identity endomorphism. No word reversal, divided factorial or characteristic assumption appears.

### Preserve an ordered bound under scalar extension

**Node:** HodgeStructuresPartII:H.0/affine-base-change-bound. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_baseChange_zero. **Kind:** lemma; implementation unchecked.

For a finite basis b of Q and any n≥0, I_n(θ)=0 implies I_n(θ_S)=0 with exactly the same n, for every R-algebra S. E is arbitrary and S need not be flat.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. The basis index type I is finite; no finite-generation or freeness hypothesis is imposed on E.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-word; HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing; mathlib:Module.Basis.baseChange; mathlib:LinearMap.baseChange_zero.

**Proof route:** Apply the actual all-order coordinate-vanishing criterion to b_S. Each extended word is scalar extension of the corresponding original word. Original iterate vanishing annihilates all such words; scalar extension preserves their zero values. The finite index type is used only for the native tensor-power basis and reconstruction in the criterion. The proof also covers n=0 and zero modules.

### Reflect an ordered bound under faithful scalar extension

**Node:** HodgeStructuresPartII:H.0/affine-base-change-bound-faithful. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_iff. **Kind:** lemma; implementation unchecked.

For a finite basis b of Q and faithfully flat R-algebra S, I_n(θ_S)=0 if and only if I_n(θ)=0, at the identical n≥0. E is an arbitrary R-module.

**Hypotheses:** R and S are arbitrary commutative rings and S is an R-algebra. E and Q are R-modules. Tensor products, scalar extensions, bases and endomorphism composition use the existing native Mathlib carriers. No integrability, reducedness, field, flatness or finiteness premise is imposed unless separately stated. Write E_S=S⊗_R E and Q_S=S⊗_R Q. A chosen basis b indexed by I is needed only for coordinate contraction/word comparisons; a finite index type I is required only for the all-order vanishing criterion. E remains an arbitrary module. A successor prepends its coefficient on the left, and the rightmost endomorphism acts first. At n=0 the ordered product is the identity. I is finite and S carries the native Module.FaithfullyFlat R S instance.

**Inputs:** HodgeStructuresPartII:H.0/affine-base-change-bound; HodgeStructuresPartII:H.0/affine-base-change-word; HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing; mathlib:Module.FaithfullyFlat; mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff.

**Proof route:** Use the existing preservation lemma for the forward scalar-extension direction. For reflection, extended iterate vanishing makes every extended ordered word zero. The word comparison identifies it with scalar extension of the original word. Evaluate each extended endomorphism at 1⊗e. Native faithful zero detection gives that the original word kills e, for arbitrary e. Apply the original finite-basis coordinate criterion. Flatness alone is not used as a substitute for faithfulness; the characteristic-two field-collapse test and the retained historical flat-nonfaithful projection lead distinguish the assumptions.


The unit-line test computes the coefficient-unit placement directly. Its all-order variant proves the scalar-extended unit field has nonzero iterate at every n when S is nontrivial, including the empty-word boundary. The concrete field θ(e)=2e⊗1 over Z is nonzero, yet becomes zero over Z/2. This rules out unconditional reflection. It does not assert flatness of Z→Z/2; the predecessor’s flat but nonfaithful projection example remains a historical lead with its original receipt.

The global pullback-nilpotence theorem retains its original statement. Its proof now imports the affine scalar-extension bound, followed by the existing same-ring coefficient-map preservation for Q_S→Q_Y. E1 must still supply the actual sheaf tensor-power comparison, finite-projective charts, restriction and morphism equality detection. No global tensor of sections, pullback-integrability theorem or coefficient differential is silently supplied. General arbitrary-Q tensor-power comparison, sheaf gluing, field/reduced-ring rank bounds, kernel/image-algebra base-change hypotheses, determinant descent and period/Tate equivariance remain open. H.0 remains partial, H.1–H.8 not_read; allfive requests,eleven gaps,149 routed obligations and35 omitted global signatures remain.

### Scalar-extension evidence

The [immutable native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/dc25c5c1974994ba2e382998b82d187f9b027bd9/research/blueprint/suggested/HodgeStructuresPartII.lean), delimited by BEGIN/END ARCHIVED CHECKED HIGGS SCALAR EXTENSION, contains the complete standalone native source:607 lines,18 examples and28 kernel axiom audits. Its source SHA-256 is f922ee36944f958ba59913bf9bef72223e69b22de885590cc37c35beefe8ebb6. Verbatim extraction was checked byte-for-byte. At the exact Mathlib pin with Lean4.34.0-rc2 it elaborates with zero errors,warnings or admissions; each audit contains only propext,Classical.choice andQuot.sound. Runtime3.80seconds,maxRSS2991956KiB,63GiB available. All28 native declaration headers and the four new example types are matched to the canonical sketch. The full final admitted-sketch receipt and actual assembler checks are in the current handoff and packet verification. Historical receipts earlier in this document apply only to their original hashes.

The entire exact final Mathlib-only suggested file elaborates:84examples,zero errors,209admitted-declaration warnings andzero other warnings. Source SHA-256:ab7b037d990ebfd7e39d242e8819ab8aaaece15e07adf3c171c64893d18e3bc3; normalized diagnostics SHA-256:c0699f5d698b2734b1774f886f1f3da335303bf55ba8d276acfbde43c41237d0. Runtime5.00seconds,maxRSS2960448KiB,61GiB available beforehand. Normalize the source filename to suggested/HodgeStructuresPartII.lean and omit the final elapsed/maxRSS line when hashing the diagnostics. Allplanning bodies remain admitted.

Indexed packet checker:zero errors/warnings. Actual atlas assembly:stage graph3022vertices/8663edges; own prerequisite graph100/189; stage plus reachable prerequisite graph3117/8890;101reachable declarations,51existing virtual supplier endpoints,zero unresolved references. Allacyclic; no own skipped/pending links; stage edges and other roadmaps skipped/pending links unchanged from the base control. No site output is written. Five-file intake,JSON validity,statement/hypothesis/API/test preservation,exact public archive extraction,all28 declaration headers,four new example types andwhitespace pass. Only the packet,reader,suggested file andhandoff change; roadmap definition stays byte-identical. Scratch is deleted after the PR opens; allreproduction inputs are durable in tracked files/history. No owned background process remains.

## Coefficient changes and exact ordered bounds

The coefficient-map step of pullback is separate from extension of the coefficient ring. Work over an arbitrary commutative ring R with arbitrary R-modules E,Q,P,T. The existing affine field is a native linear map θ:E→E⊗_R Q; its ordered iterates I_n(θ) use the existing Fin n-indexed tensor powers. No local basis of E or Q, finiteness, integrability, flatness, reducedness or field hypothesis is imposed in this section. This affine generality includes modules that are not vector bundles. The global bundle endpoints retain their finite local freeness and differential-calculus hypotheses.

**TwistedHiggsBundle.affineCoefficientMap.** For an R-linear coefficient map u:Q→P, construct θ_u=(id_E⊗u)∘θ:E→E⊗_R P using the existing TensorProduct.map. The module E and the base ring remain fixed. This is a named adapter for the actual field, not a new tensor functor or Higgs carrier. It supplies the coefficient leg after scalar extension in the original pullback-nilpotence theorem. Giving this operation explicitly prevents a statement about a scalar-extended field from silently assuming that its coefficient module is already the target module of forms.

The API follows its consumers. `TwistedHiggsBundle.affineCoefficientMap_apply` gives θ_u(e)=(id_E⊗u)(θ(e)) on the actual native tensor. `TwistedHiggsBundle.affineCoefficientMap_id` says θ_id=θ. `TwistedHiggsBundle.affineCoefficientMap_zero` says a zero coefficient map kills every field. `TwistedHiggsBundle.affineCoefficientMap_comp` says successive changes by u then v agree with the single change by v∘u. `TwistedHiggsBundle.affineOrderedIterate_coefficientMap` compares every ordered iterate at the same degree. The latter two APIs have individual consumed lemma nodes below; generic tensor composition and identity remain imported baseline declarations.

**TwistedHiggsBundle.affineCoefficientMap_comp.** For u:Q→P and v:P→T, compute

    (θ_u)_v=(id_E⊗v)(id_E⊗u)θ=(id_E⊗(v∘u))θ=θ_(v∘u).

Associativity of linear-map composition and the native tensor-map composition law prove this equality. The order is v after u. No coordinate expansion, dualization or generic new monoidal structure is introduced. This equation is consumed by reflection through a coefficient left inverse, so it is an explicit declaration rather than an unrecorded proof step.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap.** For every n≥0,

    I_n(θ_u)=(id_E⊗u^(⊗n))∘I_n(θ).

The map u^(⊗n) is the existing PiTensorProduct.map on n copies of u. Apply the inherited all-degree naturality theorem with the module map f=id_E and the target field ψ=θ_u. Its intertwining equation is exactly the construction. Thus the proof uses the actual native ordered tensor-power carriers, including their associativity and prepend convention, without choosing dual coordinates or replacing tensor powers by symmetric powers.

At n=0 the coefficient tensor power is the unit. The zero-th iterate is the native identity after its tensor-unit identification, not the original field and not a zero map. In particular, sending Q to P by a zero map does not erase degree zero for a nonzero E. At positive degree a zero coefficient map kills the field, but this is compatible with the degree-zero exception. The rational-line acceptance example checks this boundary for every coefficient endomap, including zero.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero.** If I_n(θ)=0, then I_n(θ_u)=0, at the identical n. The iterate formula is a postcomposition of zero by a native tensor map, and postcomposition preserves zero without any exactness hypothesis. This direction works for every coefficient map and every E. It does not assert that the tensor map detects a zero source map, that kernels commute with tensor product, or that nilpotence filtrations pull back as subbundles.

In the affine chart proof of the original global pullback theorem, first use the native scalar-extension construction and its same-bound result to obtain θ_S on E_S with coefficient Q_S. Then use affineCoefficientMap for the specified map Q_S→Q_Y and apply the same-bound preservation lemma. This supplies the two algebraic legs. Identification with the actual sheaf-level pulled-back iterate still requires the E1 tensor-power comparison, chart restriction and equality detection/gluing. Integrability still needs the separate exterior-map compatibility. The coefficient step cannot certify either global interface by itself.

**TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff.** Suppose a specified R-linear v:P→Q satisfies v∘u=id_Q. Then I_n(θ_u)=0 if and only if I_n(θ)=0, for every n≥0 and arbitrary E. For reflection, apply the preservation theorem a second time to θ_u with coefficient map v. Its result is I_n((θ_u)_v)=0. The composition API and v∘u=id identify this field with θ. The converse is the preservation theorem. The identical n appears throughout; no larger unspecified bound is substituted.

A linear left inverse makes u a split inclusion, and its tensor powers carry corresponding left inverses. This proof uses the field composition directly, so no new generic theorem about split injections is needed. Neither u nor v is required to be an isomorphism; no assertion u∘v=id_P is used. The native inclusion Q→Q×P with its first projection is an acceptance example at every degree. It shows reflection works after adjoining unused coefficient directions, even when E is not flat.

Mere coefficient injectivity does not give this reflection for arbitrary E. Take R=ℤ, Q=P=ℤ, u multiplication by2 and E=ℤ/2. The coefficient map is injective because 2x=2y implies x=y in ℤ. Let θ be the inverse right tensor-unit map E→E⊗_ℤℤ. This field is nonzero: applying the right tensor-unit map to θ(1) returns the nonzero element1 of E. But its coefficient change sends e⊗1 to e⊗2=2(e⊗1)=0. The actual counterexample test proves both injectivity of u and vanishing of the changed field while θ remains nonzero. It changes the coefficient module at the same base ring; it is distinct from the existing counterexample that changes the base ring. E here is not a finite locally free ℤ-module, so this does not claim a counterexample with E flat or a failure of the original finite-locally-free bundle hypotheses.

The remaining construction tests compare the identity change with the original arbitrary field and show that the nonzero native rational unit field becomes zero under the zero coefficient map. Together with the split-inclusion, injective-map and degree-zero tests, these distinguish the operation, its direction of composition and its detection hypotheses. They check native maps and tensors rather than an assumed vanishing predicate.

A separate actual-body prototype proves these eight named declarations, five examples and their inherited native iterate/naturality inputs without admissions. Twelve axiom audits list only standard axioms and contain no admitted axiom. The full submitted suggested file elaborates at the pinned existing Mathlib build with every new planning body admitted, as PROTOCOL§13 requires. These checks are interface evidence, not a claim that a packet node or missing global theorem is implemented.

The source carrier is Heuer, arXiv2307.01303v3 Definition1.2(2), freshly read with the selected introduction. The coefficient formulas and left-inverse argument are authored affine algebraic deductions. Stacks Section17.16 explains why the sheaf tensor and its pullback comparison require their own interface; its opening construction and Lemmas17.16.1–5 were read, including the displayed proofs. These scoped readings do not certify the correspondence, the full149-item source inventory or any omitted global signature. The reserved general Higgs/parameter carrier, all100 inherited mathematical contracts, source findings, requests, planets and nine-stage roadmap remain. H.0 stays partial and H.1–H.8 stay not_read.


## Flat coefficient injections and horizontal subobjects

Write I_n for the existing ordered iterate. The coefficient-change and split-inclusion statements above continue to hold for arbitrary modules. The following reflection criteria use the native flat-module hypothesis, which follows in particular from projectivity without a chosen basis. They are statements about modules over one fixed ring. They supply no new global Higgs carrier, chart descent or comparison of tensor products of global sections.

### Reflect ordered bounds on flat ambient subobjects

**Node:** HodgeStructuresPartII:H.0/affine-ordered-iterate-flat-subobject. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_natural_zero_iff_of_flat. **Kind:** lemma; implementation unchecked.

Let f:E→F and u:Q→P be injective R-linear maps with ψ∘f=(f⊗u)∘θ. If F,Q,P are flat over R, then for every n≥0, I_n(ψ)∘f=0 if and only if I_n(θ)=0. In particular a specified bound on ψ restricts to the same bound on θ. E need not be flat. The left side is the restriction along f, not vanishing on all of F.

Hypotheses:

- R is any commutative ring, and E,F,Q,P are R-modules with their native additive group and module structures. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R P are R-linear. No integrability, rank, reducedness or chosen basis is assumed.
- I_n is the existing ordered iterate with the newest coefficient on the left and the native tensor-unit identity at n=0. The base ring stays fixed. These are affine module statements; restrictions and equality detection for actual sheaf tensors remain E1 supplier obligations.
- F,Q,P are flat R-modules; f and u are injective and satisfy the displayed horizontal equation. No flatness assumption on E is used.

Inputs: HodgeStructuresPartII:H.0/affine-ordered-iterate-natural; mathlib:Module.Flat; mathlib:Module.Flat.of_linearEquiv; mathlib:TensorProduct.map_injective_of_flat_flat; mathlib:TensorPower.algebraMap₀; mathlib:TensorPower.mulEquiv; mathlib:TensorPower.cast; mathlib:TensorPower.cast_tprod; mathlib:TensorPower.tprod_mul_tprod; mathlib:PiTensorProduct.subsingletonEquiv; mathlib:PiTensorProduct.map_tprod; mathlib:TensorProduct.congr; mathlib:PiTensorProduct.induction_on.

Proof:

1. Use the native unit R≅Q^⊗0 and the prepend equivalence Q⊗Q^⊗n≅Q^⊗(n+1), formed from the singleton equivalence, tensor-power multiplication and the 1+n=n+1 reindexing. Native flat tensor closure and transport through a linear equivalence prove flatness of Q^⊗n by induction.
2. Inductively prove injectivity of u^⊗n. In degree zero its conjugate by the two native unit identifications is id_R. At a successor, the native prepend diagram identifies u^⊗(n+1) with u⊗u^⊗n. Check that diagram on pure tensors with the native tprod multiplication and cast laws; coefficient order is unchanged. Apply the baseline tensor-map injectivity lemma using P flat and Q^⊗n flat. These are local helper deductions in this proof, not new generic carriers or an assumed injection certificate.
3. Apply the same baseline tensor-map lemma to f and u^⊗n using F flat and Q^⊗n flat. The existing naturality equality identifies I_n(ψ)∘f with (f⊗u^⊗n)∘I_n(θ). Injectivity of the actual tensor map reflects zero pointwise; postcomposition preserves zero for the other implication.
4. If I_n(ψ)=0, its restriction is zero and the equivalence applies. Without surjectivity of f, vanishing on its image gives no vanishing on a complementary summand.

Acceptance:

- At n=0 both sides detect the zero source E, since f is injective and I_0 is the tensor-unit identity.
- An ambient bound I_n(ψ)=0 restricts to I_n(θ)=0 with no flatness premise on E.
- Over ℤ, f embeds the first summand of ℤ⊕ℤ, θ=0 and ψ(a,b)=(0,b)⊗1. The horizontal equation holds with u=id; ψ∘f=0 but ψ≠0. Thus the conclusion does not replace the restricted iterate by the whole ambient iterate.

### Reflect ordered bounds through a flat coefficient injection

**Node:** HodgeStructuresPartII:H.0/affine-coefficient-map-bound-flat. **Proposed declaration:** TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff_of_flat. **Kind:** lemma; implementation unchecked.

If E,Q,P are flat R-modules and u:Q→P is injective, then for every n≥0, I_n(θ_u)=0 if and only if I_n(θ)=0, where θ_u=(id_E⊗u)∘θ. No coefficient left inverse, finite basis, finite generation or integrability is required; the same exponent occurs on both sides.

Hypotheses:

- R is any commutative ring, and E,F,Q,P are R-modules with their native additive group and module structures. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R P are R-linear. No integrability, rank, reducedness or chosen basis is assumed.
- I_n is the existing ordered iterate with the newest coefficient on the left and the native tensor-unit identity at n=0. The base ring stays fixed. These are affine module statements; restrictions and equality detection for actual sheaf tensors remain E1 supplier obligations.
- For this coefficient-only specialization F=E and f=id_E. E,Q,P are flat over R and u is injective. These are sufficient hypotheses, not a claim of minimal hypotheses for each degree.

Inputs: HodgeStructuresPartII:H.0/affine-coefficient-map; HodgeStructuresPartII:H.0/affine-ordered-iterate-flat-subobject; mathlib:Module.Flat; mathlib:Module.Flat.of_projective.

Proof:

1. Instantiate the horizontal reflection theorem with F=E, f=id_E and ψ=θ_u. Its horizontal equation is the definition of coefficient change. Remove composition with the identity.
2. Projective coefficients and E satisfy the flatness hypotheses by the native projective-to-flat instance; no basis or finite-rank choice enters this implication.
3. The inherited split coefficient result still applies to arbitrary E, even when this flatness hypothesis fails. The two reflection criteria therefore retain their separate hypotheses.

Acceptance:

- For E=Q=P=ℤ and u multiplication by 2, the equivalence holds for every θ and n, although no ℤ-linear left inverse exists.
- Native projective E,Q,P satisfy the statement without finite generation or a chosen basis.
- The inherited E=ℤ/2, Q=P=ℤ, u=2 counterexample excludes dropping flatness of E from this sufficient criterion.
- Degree zero keeps the actual tensor-unit identity; no positive-degree nilpotence condition is built into the field.

The ordered-iterate construction gains the compatibility API **TwistedHiggsBundle.affineOrderedIterate_natural_zero_iff_of_flat**: Let f:E→F and u:Q→P be injective R-linear maps with ψ∘f=(f⊗u)∘θ. If F,Q,P are flat over R, then for every n≥0, I_n(ψ)∘f=0 if and only if I_n(θ)=0. In particular a specified bound on ψ restricts to the same bound on θ. E need not be flat. The left side is the restriction along f, not vanishing on all of F. The coefficient-map construction gains **TwistedHiggsBundle.affineOrderedIterate_coefficientMap_zero_iff_of_flat**: If E,Q,P are flat R-modules and u:Q→P is injective, then for every n≥0, I_n(θ_u)=0 if and only if I_n(θ)=0, where θ_u=(id_E⊗u)∘θ. No coefficient left inverse, finite basis, finite generation or integrability is required; the same exponent occurs on both sides.

Discriminating construction tests:

- **TwistedHiggsBundle.affineCoefficientMap.test_flat_nonsplit** (non-example): For E=Q=P=ℤ and u multiplication by 2, every specified ordered bound is equivalent before and after coefficient change, but there is no ℤ-linear v with v∘u=id.
- **TwistedHiggsBundle.affineCoefficientMap.test_projective_no_basis** (compatibility): For native projective R-modules E,Q,P and an injective u:Q→P, the coefficient-changed iterate vanishes exactly when the original iterate does, at every specified degree, without finite generation or any chosen basis.
- **TwistedHiggsBundle.affineOrderedIterate.test_flat_subobject** (compatibility): For a horizontal pair of injections f:E→F and u:Q→P with F,Q,P flat, an ambient zero iterate I_n(ψ)=0 gives I_n(θ)=0; E is an arbitrary module.
- **TwistedHiggsBundle.affineOrderedIterate.test_restriction_not_ambient** (non-example): Over ℤ let f(a)=(a,0) and ψ(a,b)=(0,b)⊗1. Then ψ∘f=0 and ψ≠0. Restricted vanishing does not assert ambient vanishing, even with free finite modules and the identity coefficient map.

The nonsplit test is stronger than checking identity or coefficient isomorphisms: any proposed ℤ-linear left inverse of multiplication by 2 would force 2v(1)=1. Reflection instead follows from the actual flat tensor-map induction. The inherited E=ℤ/2 example still rules out replacing flatness by mere coefficient injectivity. The subobject conclusion keeps composition with f: a field can vanish on the first summand and act nontrivially on the second. In degree zero the tensor unit detects the source module; it is not a positive nilpotence bound.

Sources read for this extension are [Heuer, arXiv v3, Definition 1.2](https://arxiv.org/html/2307.01303v3) for the field and horizontal-morphism convention, and [Stacks, Definition 10.39.1 and Lemma 10.39.5](https://stacks.math.columbia.edu/tag/00H9) for flatness and tensor preservation of injections. The finite tensor-power induction and the two Higgs-specific deductions are authored algebra, not attributed correspondence theorems. The pinned native flat tensor closure, projective-to-flat instance, equivalence transport and tensor-map injectivity proofs were read and reused. Historical broader source receipts remain historical.

All 105 inherited statements, hypotheses and acceptance conditions, the reserved key, six planets, five supplier requests, eleven gap entries, 149 routed source obligations and the 35 global omissions remain. Two existing constructions gain the displayed APIs, uses and tests. Arbitrary-Q cross-ring coherence, finite-projective chart restriction, sheaf equality detection/gluing, exterior integrability and the remaining source routes still require their recorded inputs. The narrower same-ring flat reflection does not close them.

### Flat-reflection validation

The [standalone native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/d94ef3bb3b47d21b8308c595f6e23055cd390a3a/research/blueprint/suggested/HodgeStructuresPartII.lean) contains the complete actual inherited iterate/naturality/coefficient definitions and proofs followed by the flat-reflection proof and tests. The archive marker is BEGIN/END ARCHIVED CHECKED HIGGS FLAT REFLECTION. Its SHA-256 is b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc. The 517-line source elaborates at pinned Mathlib with Lean 4.34.0-rc2: nine examples, no errors, admissions or warnings; fourteen axiom audits contain only the standard kernel axioms. The two new public signatures and four example types match the submitted planning file.

The entire final suggested file, SHA-256 82a282d7a295d3c678c3fdc9462c64b8c6931ebccd4617053b08dc7662121b29, elaborates with 93 examples, zero errors, 228 admitted-declaration warnings and no other warnings. The packet checker reports no errors or warnings. Actual atlas assembly has stage graph 3022 vertices/8663 edges, own graph 107/199 and combined prerequisite graph 3124/8900; all are acyclic with zero unresolved references. Stage edges and unrelated pending/skipped links match the control. The current handoff records exact reproduction and remaining work; earlier receipts apply only to their original hashes.


## Arbitrary-coefficient scalar-extension continuation

The canonical affine field θ_S is the native linear-map scalar extension composed with the native tensor distributor. For a horizontal pair f:E→F and u:Q→P, this field construction preserves the actual horizontal equation. Taking f=id shows that scalar extension commutes with arbitrary coefficient postcomposition. No coefficient basis, finite generation, flatness, integrability or invertibility is needed for either equality. Applying the existing ordered naturality theorem over S gives an all-degree receiving-ring equation, including the degree-zero tensor unit.

If S is faithfully flat over R, evaluating θ_S on 1⊗e and undoing the tensor distributor detects θ(e) in E⊗_R Q. Thus θ_S=0 iff θ=0, without flatness of E or Q. The actual singleton tensor-power equivalence gives the corresponding degree-one iterate criterion. Torsion source/coefficient examples over ℤ check this generality; the field e↦2e⊗1 becomes zero over ℤ/2 and checks the need for faithful flatness in reflection. A horizontal test retains vanishing only on the image of f_S.

These are authored affine deductions motivated by [Heuer, §4.2, Theorem 4.8 and Remark 4.9](https://arxiv.org/html/2307.01303v3), whose local formula and displayed proof were freshly read. They do not discharge that analytic theorem or its chart independence. The predecessor's finite-basis all-degree scalar-extension contracts remain unchanged. Receiving-ring naturality alone does not identify I_n(θ_S) with scalar extension of I_n(θ): the arbitrary-Q cross-ring tensor-power unit/prepend coherence and comparison are still open, followed by finite-projective restriction and E1 sheaf equality detection/gluing. The complete new proof and exact final-sketch receipts are in the current handoff; inherited wider source receipts remain historical.

## Arbitrary-coefficient cross-ring ordered coherence — codex-a71f92

Read base: `f6de888f4ad723d376d77b66fa8486d538bd1aeb`. This is a partial affine checkpoint, not a closed H.0 stage or a global sheaf implementation. The reserved general parameter-connection carrier and all 149 binding route obligations remain unchanged.
Let E_S=S⊗_R E and Q_S=S⊗_R Q. Write α_R,n for the exact native singleton/multiplication/cast left-prepend equivalence already used by the ordered step. The adapter T_n is an actual equivalence, recursively built from native distributors, not an assumed comparison or a second tensor carrier. D_n is the binary distributor followed by id⊗T_n.
Fresh primary reading is limited to Heuer’s [arXiv v3](https://arxiv.org/html/2307.01303v3), Definition 1.2(1)–(2), Definition 4.1, Theorem 4.8(1)–(3), Remark 4.9 and the complete displayed proof. Download SHA-256: `ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081`, accessed 2026-10-02. The following arbitrary-ring tensor equations are authored algebraic deductions; the geometric correspondence and its descent are not proved here.

### Scalar extension of ordered coefficient powers

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change` — `TwistedHiggsBundle.affineTensorPowerBaseChange` (construction).
Construct T_n:S⊗_R Q^⊗n≃_S Q_S^⊗n for every n≥0, with Q_S=S⊗_R Q. T_0 is the scalar extension of (R≃Q^⊗0)⁻¹ followed by S⊗_R R≃S and S≃Q_S^⊗0. T_(n+1) is the scalar extension of α_R,n⁻¹, followed by the native binary distributor, id_(Q_S)⊗T_n and α_S,n. No basis of Q is chosen.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `mathlib:TensorPower.algebraMap₀`, `mathlib:LinearEquiv.baseChange`, `mathlib:TensorProduct.AlgebraTensorModule.rid`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.congr`, `mathlib:PiTensorProduct.subsingletonEquiv`, `mathlib:TensorPower.mulEquiv`, `mathlib:TensorPower.cast`.

Proof plan:

1. At degree zero compose the three specified existing linear equivalences; no nontriviality assumption is used.
2. At a successor compose the four specified native linear equivalences. The private syntactic abbreviation α is exactly the singleton/multiplication/cast composite already used by affineOrderedStep, not a replacement tensor carrier.
3. Primitive recursion supplies the actual S-linear equivalence and its actual inverse at every degree; no comparison property or bijectivity is stored as an assumption.

API:

- `TwistedHiggsBundle.affineTensorPowerBaseChange_unit` (compatibility): For every a∈S, T_0(a⊗algebraMap₀_R(1))=algebraMap₀_S(a). In particular the empty coefficient word maps to the tensor unit, with no premise on Q.
- `TwistedHiggsBundle.affineTensorPowerBaseChange_prepend` (compatibility): For every n≥0, a∈S, q∈Q and t∈Q^⊗n, T_(n+1)(a⊗α_R,n(q⊗t))=α_S,n((a⊗q)⊗T_n(1⊗t)). This is the actual cross-ring prepend equation, not same-ring coefficient-map naturality.

Tests:

- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_unit` (computation): For R=ℤ, S=ℤ/4 and Q=ℤ/2, T_0(a⊗1_0)=algebraMap₀(a) in Q_S^⊗0, for every a∈S. The coefficient module is not free over ℤ.
- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_prepend` (compatibility): For R=S=ℤ, Q=ℤ/2, q∈Q and t∈Q^⊗1, T_2(1⊗α_R,1(q⊗t))=α_S,1((1⊗q)⊗T_1(1⊗t)). This keeps the new factor on the left without a coefficient basis.
- `TwistedHiggsBundle.affineTensorPowerBaseChange.test_nonflat_distributor` (characterisation): For R=ℤ, S=Q=ℤ/2, every n≥0 and x∈S⊗_R Q^⊗n, T_n⁻¹(T_n(x))=x. The distributor remains an equivalence although S is not flat over R; this alone does not reflect scalar-extended vanishing.

Uses:

- `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit`: Keep the empty-word tensor unit in the iterate comparison.
- `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend`: Keep the coefficient order in the successor square.
- `HodgeStructuresPartII:H.0/affine-ordered-base-change`: Combine this coefficient-power adapter with the existing binary distributor.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension preserves the empty coefficient word

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit` — `TwistedHiggsBundle.affineTensorPowerBaseChange_unit` (lemma).
For every a∈S, T_0(a⊗algebraMap₀_R(1))=algebraMap₀_S(a). In particular the empty coefficient word maps to the tensor unit, with no premise on Q.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:LinearEquiv.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.rid_tmul`.

Proof plan:

1. Unfold T_0, evaluate the scalar-extended inverse degree-zero equivalence, then the native right tensor unit. The two degree-zero inverse evaluations and 1 acting on a give the displayed equality.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension respects ordered coefficient prepending

`HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend` — `TwistedHiggsBundle.affineTensorPowerBaseChange_prepend` (lemma).
For every n≥0, a∈S, q∈Q and t∈Q^⊗n, T_(n+1)(a⊗α_R,n(q⊗t))=α_S,n((a⊗q)⊗T_n(1⊗t)). This is the actual cross-ring prepend equation, not same-ring coefficient-map naturality.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:LinearEquiv.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`.

Proof plan:

1. Evaluate the successor definition on the specified elementary tensor, cancel α_R,n with its inverse, and use the existing binary distributor evaluation and tensor congruence. No permutation of the coefficient factors is made.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension of ordered iterate codomains

`HodgeStructuresPartII:H.0/affine-ordered-base-change` — `TwistedHiggsBundle.affineOrderedBaseChange` (construction).
Construct D_n:S⊗_R(E⊗_R Q^⊗n)≃_S E_S⊗_S Q_S^⊗n as the native binary distributor followed by id_(E_S)⊗T_n, at every n≥0. Both E and Q are arbitrary modules.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-power-base-change`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.congr`.

Proof plan:

1. Compose the existing binary distributor with tensor congruence for id_(E_S) and T_n. This introduces no new scalar-extension, tensor-product or module carrier.
2. Evaluate on elementary tensors using the binary distributor: D_n(a⊗(e⊗t))=(a⊗e)⊗T_n(1⊗t).

API:

- `TwistedHiggsBundle.affineOrderedBaseChange_tmul` (simp): For all n,a,e,t, D_n(a⊗(e⊗t))=(a⊗e)⊗T_n(1⊗t).
- `TwistedHiggsBundle.affineOrderedBaseChange_step` (compatibility): For every θ:E→E⊗_R Q and n≥0, D_(n+1)∘(S_θ,n)_S=S_(θ_S),n∘D_n as actual S-linear maps on S⊗_R(E⊗_R Q^⊗n).

Tests:

- `TwistedHiggsBundle.affineOrderedBaseChange.test_unit` (degenerate): For arbitrary R,S,E,Q and a∈S,e∈E, D_0(a⊗(e⊗1_0))=(a⊗e)⊗1_0 in E_S⊗_S Q_S^⊗0. No field or horizontal-morphism hypothesis is needed.
- `TwistedHiggsBundle.affineOrderedBaseChange.test_torsion_degree_two` (compatibility): For R=S=ℤ and E=Q=ℤ/2, D_2∘(I_2(θ))_S=I_2(θ_S) for every θ:E→E⊗_R Q. Neither E nor Q is flat over R.
- `TwistedHiggsBundle.affineOrderedBaseChange.test_zero_module` (degenerate): For E=(Fin 0→R), every n≥0 and x∈S⊗_R(E⊗_R Q^⊗n), D_n(x)=0, without any hypothesis on Q or S beyond the ring/algebra structure.

Uses:

- `HodgeStructuresPartII:H.0/affine-ordered-base-change-step`: Transport the actual successor step between rings.
- `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`: Compare the entire scalar-extended iterate, including the degree-zero unit.
- `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful`: Use the actual equivalence's injectivity before applying faithful-flat one-tensor detection.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension commutes with the ordered successor step

`HodgeStructuresPartII:H.0/affine-ordered-base-change-step` — `TwistedHiggsBundle.affineOrderedBaseChange_step` (lemma).
For every θ:E→E⊗_R Q and n≥0, D_(n+1)∘(S_θ,n)_S=S_(θ_S),n∘D_n as actual S-linear maps on S⊗_R(E⊗_R Q^⊗n).

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-prepend`, `HodgeStructuresPartII:H.0/affine-ordered-step`, `HodgeStructuresPartII:H.0/affine-base-change`, `mathlib:TensorProduct.AlgebraTensorModule.ext`, `mathlib:LinearMap.baseChange_tmul`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`.

Proof plan:

1. Use heterobasic tensor extensionality, then tensor induction to reduce the input to a⊗(e⊗t).
2. Expand the actual field and step maps before tensor-inducting on θ(e). Zero and sum cases follow from additivity; for x⊗q use the cross-ring prepend equation with scalar 1.
3. The E factor carries a; the new Q factor carries 1; remaining coefficients use T_n. Both sides thus have the same left-prepended ordered tensor.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Scalar extension of every ordered Higgs iterate

`HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_comparison` (lemma).
For every θ:E→E⊗_R Q and n≥0, D_n∘(I_n(θ))_S=I_n(θ_S) as actual S-linear maps E_S→E_S⊗_S Q_S^⊗n. Here (I_n(θ))_S is native scalar extension of the source-ring iterate, whereas I_n(θ_S) is formed recursively over S. No coefficient basis or integrability premise is required.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-power-base-change-unit`, `HodgeStructuresPartII:H.0/affine-ordered-base-change-step`, `HodgeStructuresPartII:H.0/affine-ordered-iterate`, `HodgeStructuresPartII:H.0/affine-base-change`, `mathlib:LinearMap.baseChange_comp`.

Proof plan:

1. At n=0 evaluate on a⊗e, use the actual tensor-unit definition and the cross-ring degree-zero unit equation. Do not assume a zero field or discard the empty word.
2. At n+1 apply native baseChange_comp to the iterate recursion. Associate compositions, insert the promoted step square, then the inductive comparison. The result is precisely the receiving-ring recursion.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Preserve ordered nilpotence without a coefficient basis

`HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_of_arbitrary_coefficients` (lemma).
For every specified n≥0 and every R-algebra S, I_n(θ)=0 implies I_n(θ_S)=0 at the identical n, for arbitrary R-modules E and Q. S need not be flat.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`, `mathlib:LinearMap.baseChange_zero`.

Proof plan:

1. Rewrite the receiving-ring iterate by the cross-ring comparison. Scalar extension of the zero source iterate is zero; composition with D_n remains zero. No finite-basis coordinate criterion is invoked.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Reflect ordered nilpotence without a coefficient basis

`HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful` — `TwistedHiggsBundle.affineOrderedIterate_baseChange_zero_iff_of_arbitrary_coefficients` (lemma).
If S is faithfully flat over R, then for every specified n≥0, I_n(θ_S)=0 if and only if I_n(θ)=0, for arbitrary modules E and Q. The exponent is unchanged, and no flatness or finiteness of E or Q is needed.

Hypotheses:

- R and S are arbitrary commutative rings with a specified R-algebra structure on S. E and Q are arbitrary native R-modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic hypothesis is imposed.
- Use native TensorPower R n Q and its existing singleton, multiplication, degree cast and tensor-unit equivalences. Write α_R,n:Q⊗_R Q^⊗n≃Q^⊗(n+1) for the left-prepend composite used by affineOrderedStep. A successor adds its coefficient on the left; the rightmost endomorphism is applied first. Degree zero is the tensor unit, not a zero map.
- These are affine module adapters, not new tensor/module-sheaf carriers. E1 restriction, sheaf tensor comparison, equality detection and gluing remain separate open inputs.
- Only this reflection result additionally assumes Module.FaithfullyFlat R S. This is a hypothesis on the algebra S, not on E or Q.

Prerequisites: `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`, `HodgeStructuresPartII:H.0/affine-ordered-base-change`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`, `mathlib:Module.FaithfullyFlat.one_tmul_eq_zero_iff`.

Proof plan:

1. For reflection evaluate the comparison on 1⊗e. The receiving iterate is zero, so injectivity of the actual D_n gives 1⊗I_n(θ)(e)=0.
2. Apply the native faithful-flat one-tensor detection theorem to the arbitrary module E⊗_R Q^⊗n; extensionality gives I_n(θ)=0.
3. For preservation apply the preceding arbitrary-algebra fixed-bound lemma. Nonfaithful extensions do not satisfy this equivalence.
Source: Definition 1.2(1)–(2); Definition 4.1; Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof, arXiv 2307.01303v3; literal excerpt “Higgs field”. The source motivates the local field and scalar-extension formula. The arbitrary-ring ordered tensor-power equivalence and all-degree equations here are authored affine deductions from the named native Mathlib maps; they are not statements of the geometric correspondence or sheaf gluing.

### Existing ordered-iterate API and new regression tests

Keep the finite-basis preservation/reflection contracts and their names unchanged; the general results have distinct names. The existing iterate construction gains the promoted comparison and two arbitrary-coefficient bound APIs above, plus these tests:
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_preservation` (compatibility): For R=ℤ, E=ℤ/4, Q=ℤ/2 and S=ℤ/2, I_n(θ)=0 implies I_n(θ_S)=0 for every specified n≥0 and actual θ. The extension S and both coefficient/source modules are not flat; no reflection is asserted.
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_reflection` (compatibility): For R=S=ℤ, E=ℤ/4 and Q=ℤ/2, I_n(θ_S)=0 iff I_n(θ)=0 at every specified n≥0 for every θ, using the faithfully flat identity algebra, without source or coefficient flatness.
- `TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_degree_zero` (non-example): If R is nontrivial and S is faithfully flat, the degree-zero receiving iterate of every θ:R→R⊗_R Q is nonzero, even for Q=0. Tensor nilpotence at exponent zero cannot mean the zero field.

### Exact boundary and checks

Current codex-a71f92 checkpoint supplies actual native arbitrary-Q affine cross-ring unit/prepend/step/iterate equations and all-degree same-exponent preservation and faithfully-flat reflection, including n=0; earlier affine missing-work wording above is retained as checkpoint history. Finite-projective chart restriction, sheaf tensor-power comparison/equality detection/gluing, exterior-integrability transport, globally uniform versus locally varying exponents, rank bounds and all global/source/supplier obligations remain open. This does not identify sheaf tensor sections with tensors of global sections or assert kernel/image base-change compatibility.
The full suggested file remains the admitted signature plan required by PROTOCOL §13. A distinct complete native proof, its immutable public archive and a portable read-only checker/assembly recipe are recorded in the handoff. All implementation statuses remain unchecked, every old contract and key carrier is retained, H.0 remains partial and H.1–H.8 remain not_read. No source route, supplier request, global omission or stage is closed.

### Native equivalence inverse API

`TwistedHiggsBundle.affineTensorPowerBaseChange_symm_apply` (characterisation): For every n≥0 and x∈S⊗_R Q^⊗n, T_n⁻¹(T_n(x))=x. The inverse is the actual inverse of the recursively composed native equivalences, with no flatness or basis premise.

The ordered-codomain distributor also exposes `TwistedHiggsBundle.affineOrderedIterate_baseChange_comparison` as its compatibility API, referring to the single promoted comparison node above. No duplicate theorem is introduced.


## Affine charts and local ordered nilpotence (Codex — codex-5ebb6f)

This partial continuation starts from the inherited checked arbitrary-coefficient tensor comparison. The field in a chart is the actual composite `(e ⊗ q) ∘ θ_S ∘ e⁻¹`. Both equivalences matter: negating only the coefficient chart negates the field. The coefficient factor is not absorbed into the source module.

These statements work for arbitrary modules over commutative rings, hence include finite-projective affine charts without chosen bases. A fixed bound descends by joint zero detection on `D(r)` for elements spanning the unit ideal. A localization need not be faithful individually. The module-zero detector and finite-subcover extraction are existing pinned library theorems, reused here.

### Twisted field in actual affine module charts

`TwistedHiggsBundle.affineChartField` — Construct θ_(S,e,q)=(e⊗q)∘θ_S∘e⁻¹:F→F⊗_S P. The source-ring field is scalar-extended by its actual native map before both module charts are applied; neither chart comparison nor horizontality is assumed as an oracle.

Compose the native scalar-extended field with e inverse on the source and the existing tensor map of e and q on the target. Apply e inverse to e(x) to obtain the actual horizontal square; zero and reflexive charts reduce by native composition laws.

- `TwistedHiggsBundle.affineChartField_horizontal`: θ_(S,e,q)∘e=(e⊗q)∘θ_S as actual S-linear maps.
- `TwistedHiggsBundle.affineChartField_zero`: The chart field of θ=0 is zero for every S and both actual chart equivalences.
- `TwistedHiggsBundle.affineChartField_refl`: With reflexive e and q, the chart field is exactly θ_S, with no flatness assumption.
- `TwistedHiggsBundle.affineOrderedIterate_chart_comparison`: For every n≥0, I_n(θ_(S,e,q))∘e=(e⊗q^⊗n)∘D_n∘baseChange(I_n(θ)).
- `TwistedHiggsBundle.affineOrderedIterate_chart_zero_iff`: At every specified n≥0, I_n(θ_(S,e,q))=0 iff I_n(θ_S)=0. This is reflection between receiving-ring charts, not reflection to R along a single localization.
- `TwistedHiggsBundle.affineOrderedIterate_chart_zero_of`: If I_n(θ)=0, then I_n(θ_(S,e,q))=0 for every algebra S and actual chart, at the identical n.

- `TwistedHiggsBundle.affineChartField.test_refl` (compatibility): For every θ and S, chart transport through reflexive module equivalences is exactly affineBaseChange S θ.
- `TwistedHiggsBundle.affineChartField.test_zero` (degenerate): For every S and arbitrary e,q, affineChartField S 0 e q=0.
- `TwistedHiggsBundle.affineChartField.test_coeff_sign` (computation): With reflexive e and q equal to negation on Q_S, affineChartField S θ e q=(-1:S)•θ_S. This detects a definition that forgets the coefficient chart.
- `TwistedHiggsBundle.affineChartField.test_projective_unbased` (compatibility): For projective E,Q with no chosen bases, I_n(θ)=0 implies I_n(affineChartField S θ refl refl)=0 for every n and S.
- `TwistedHiggsBundle.affineChartField.test_noncover_erasure` (non-example): Over R=ℤ take E=ℤ/2, Q=ℤ and θ the inverse right tensor unit. Then θ≠0 but affineBaseChange (Localization.Away 2) θ=0. D(2) alone does not cover Spec ℤ. This is an arbitrary-module counterexample, not a finite-locally-free example.
- `TwistedHiggsBundle.affineChartField.test_two_principal_opens` (characterisation): For R=ℤ, E=ℤ/4 and Q=ℤ/2, every θ and n≥0 satisfy: I_n(θ)=0 iff I_n(θ_(R[1/r]))=0 for every r∈{2,3}. These opens cover although neither localization is faithfully flat over ℤ.
- `TwistedHiggsBundle.affineChartField.test_degree_zero_cover` (degenerate): For nontrivial R, E=R, arbitrary Q and every principal cover spanning 1, it is impossible that every localized I_0(θ) is zero. The empty ordered word remains the tensor unit.

### Ordered iterates in actual affine charts

`TwistedHiggsBundle.affineOrderedIterate_chart_comparison` — For every n≥0, I_n(θ_(S,e,q))∘e=(e⊗q^⊗n)∘D_n∘baseChange(I_n(θ)).

Use the proved chart horizontal square in the inherited receiving-ring ordered naturality theorem. Insert the actual cross-ring iterate comparison D_n∘baseChange(I_n(θ))=I_n(θ_S), retaining n=0 and coefficient order.

### Fixed bound is independent of affine coordinates

`TwistedHiggsBundle.affineOrderedIterate_chart_zero_iff` — At every specified n≥0, I_n(θ_(S,e,q))=0 iff I_n(θ_S)=0. This is reflection between receiving-ring charts, not reflection to R along a single localization.

Apply the inherited equivalence criterion to e and q and the proved horizontal square. Tensor powers of q are actual native linear equivalences. Use e surjectivity for the reverse direction and tensor-equivalence injectivity for the forward direction. This does not assume R→S faithful.

### Fixed bound restricts to every affine chart

`TwistedHiggsBundle.affineOrderedIterate_chart_zero_of` — If I_n(θ)=0, then I_n(θ_(S,e,q))=0 for every algebra S and actual chart, at the identical n.

Preserve the source-ring zero at the same n under arbitrary scalar extension, then transfer it through the two actual chart equivalences. No coefficient basis or projectivity is used.

### Detect an ordered bound on a principal cover

`TwistedHiggsBundle.affineOrderedIterate_away_cover_zero_iff` — If Ideal.span s=R and A_r=R[1/r] (or any actual away localization), then for every fixed n≥0, I_n(θ)=0 iff I_n(θ_(A_r))=0 for every r∈s. E,Q are arbitrary; individual R→A_r maps need not be faithful.

For each x∈E evaluate the actual cross-ring comparison on 1⊗x. Vanishing of each receiving iterate and D_n injectivity give 1⊗I_n(θ)(x)=0 in A_r⊗_R(E⊗_R Q^⊗n). The native unit-tensor map is a localized-module map. Apply the existing joint module-zero detector for the unit-ideal cover, then use linear-map extensionality. The converse is inherited arbitrary-algebra bound preservation; no new generic locality theorem is planned.

### Detect a bound through arbitrary module charts

`TwistedHiggsBundle.affineOrderedIterate_chart_cover_zero_iff` — For a principal cover s spanning 1, actual A_r-localized modules and arbitrary chart isomorphisms e_r:A_r⊗E≃F_r, q_r:A_r⊗Q≃P_r, I_n(θ)=0 iff I_n(θ_(A_r,e_r,q_r))=0 for every r, at the identical specified n≥0.

Apply the chart zero equivalence on each receiving ring; replace each local chart zero by its actual scalar-extended field zero. Apply the preceding principal-cover zero criterion. This supplies finite-projective charts as a special case without choosing bases or asserting global freeness.

### A positive bound from finitely many chart bounds

`TwistedHiggsBundle.affineOrderedIterate_finite_chart_bound` — If s spans 1, its subtype is finite, and each chart has a specified bound N(r) with I_(N(r))(θ_(A_r,e_r,q_r))=0, then I_(1+sup_(r∈s)N(r))(θ)=0. The actual finite supremum makes the global exponent positive, even for the empty zero-ring cover; local bounds are not assumed equal.

Each N(r) is at most the finite supremum and hence at most 1 plus that supremum. Use ordered-iterate monotonicity on every receiving chart, then jointly detect the common zero. This changes local exponents explicitly; it does not assert identical local bounds.

### Ordered nilpotence is affine local

`TwistedHiggsBundle.affineOrderedIterate_chart_local_nilpotent_iff` — For any principal cover s spanning 1, possibly infinitely indexed, every local chart has some positive vanishing ordered iterate iff θ has some positive globally vanishing ordered iterate. The positive global exponent is extracted from a finite principal subcover, and is not claimed equal to every local exponent.

Choose the given positive local exponents, then use the native unit-ideal finite-subset theorem to extract a finite principal subcover. Restrict the actual rings, module charts and exponent function along the subtype inclusion. Reuse their away-localization instances and apply the finite bound theorem to obtain 1 plus the finite maximum. For the converse use the one positive global exponent on every chart by arbitrary-algebra preservation. Affine finite-subcover extraction is essential; this theorem makes no claim about a general non-quasi-compact ringed site.

A prescribed common exponent stays unchanged on all charts. Varying local exponents on a finite cover give the explicit positive global bound `1 + max N(r)`. Even for an infinitely indexed affine principal cover, the unit-ideal hypothesis supplies a finite subcover before taking a maximum. This uses affineness; it does not give a uniform exponent on every general ringed site.

The counterexample uses the inverse right unit on ℤ/2: it is nonzero over ℤ and vanishes after inverting 2. The proper cover by D(2),D(3) detects every specified bound for E=ℤ/4,Q=ℤ/2. Degree zero stays the tensor unit and cannot vanish on every chart when E=R and R is nontrivial.

Fresh primary reading: [Stacks tag 00EN](https://stacks.math.columbia.edu/tag/00EN), complete Lemmas 10.23.1–10.23.2 and proofs. Its generic locality results motivate the authored ordered-field deductions; it does not state the new Higgs theorems. The earlier Heuer/Esnault–Groechenig/Liu–Zhu receipts remain historical.

Current codex-5ebb6f affine-local checkpoint proves actual chart transport and ordered comparison, fixed-bound detection through a unit-ideal principal cover, and a positive finite-subcover bound for varying local exponents. Finite-projective modules are included without bases. This does not construct actual sheaf restriction identifications, sheaf tensor powers, equality detection or gluing: discharge the E1 request on the native module-sheaf carrier before upgrading the affine statement to a global ringed-site theorem. Non-quasi-compact sites need separate uniformity hypotheses. Exterior-integrability transport, rank bounds, period/Tate adapters, all source routes and H.1–H.8 remain open.

All nodes remain unchecked plans. A separate archived native proof tests this affine slice; no generic module/sheaf carrier, E1 implementation, global integrability or paper correspondence is supplied here.


## Affine chart overlap coherence — 2026-10-03 checkpoint

This continuation supplies the affine field agreement needed before chart descent. Both chart pairs identify the same scalar-extended E and Q over the same receiving ring S. No bases or finiteness hypotheses are used. Actual sheaf tensor/restriction identifications and equality detection/gluing remain E1 supplier obligations. These are plans, with separate checked native proofs; all implementations remain unchecked.

### Unique field in a specified affine chart

Declaration: `TwistedHiggsBundle.affineChartField_eq_iff_horizontal` (`HodgeStructuresPartII:H.0/affine-chart-field-uniqueness`).

For every S-linear ψ:F₁→F₁⊗_S P₁, ψ=θ₁ if and only if ψ∘e₁=(e₁⊗q₁)∘θ_S.

Hypotheses and conventions:

R and S are commutative rings with a specified R-algebra S. E,Q are arbitrary R-modules. For i=1,2, e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i are actual native linear equivalences. No basis, flatness, finite generation, projectivity or exterior-integrability assumption is needed.

Write θ_i=(e_i⊗q_i)∘θ_S∘e_i⁻¹, a_i=e_i⁻¹.trans(e_j) and b_i=q_i⁻¹.trans(q_j), where trans applies its right argument after its left. I_n is the inherited left-prepended ordered tensor iterate, with the tensor unit at n=0. Both charts must identify the same receiving-ring modules.

For restrictions to a common overlap ring, first obtain the actual scalar-extension and restriction identifications from the E1 supplier. These affine statements neither supply a ringed-site sheaf tensor comparison nor prove equality detection or gluing. No individual nonfaithful scalar extension reflects a source-ring field merely because its receiving charts agree.

Proof plan: The forward implication is the existing actual horizontal square. For the reverse implication evaluate the horizontal equality on e₁⁻¹(x), cancel e₁e₁⁻¹, and compare with the actual definition of θ₁. Surjectivity is supplied by the equivalence, not an extra stored equality.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field`, `mathlib:LinearEquiv.apply_symm_apply`.

### Horizontal transition between affine field charts

Declaration: `TwistedHiggsBundle.affineChartField_transition` (`HodgeStructuresPartII:H.0/affine-chart-field-transition`).

Put a=e₁⁻¹.trans(e₂):F₁≃_S F₂ and b=q₁⁻¹.trans(q₂):P₁≃_S P₂. Then θ₂∘a=(a⊗b)∘θ₁ as actual S-linear maps.

Proof plan: Expand only the actual affine chart-field composites. The left side evaluates θ_S on e₁⁻¹(x) after cancellation in e₂. Use native TensorProduct.map_map on the right. Cancel e₁⁻¹e₁ and q₁⁻¹q₁; both sides become (e₂⊗q₂)(θ_S(e₁⁻¹(x))). The coefficient transition is indispensable.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field`, `mathlib:TensorProduct.map_map`, `mathlib:LinearEquiv.trans_apply`, `mathlib:LinearEquiv.symm_apply_apply`.

### Ordered iterate agreement on affine chart overlaps

Declaration: `TwistedHiggsBundle.affineOrderedIterate_chart_transition` (`HodgeStructuresPartII:H.0/affine-chart-iterate-transition`).

For the same a and b and every n≥0, I_n(θ₂)∘a=(a⊗b^⊗n)∘I_n(θ₁). Here b^⊗n is the actual PiTensorProduct.map on Fin n, including the empty tensor unit.

Proof plan: Apply the inherited actual ordered-iterate naturality to the proved field-transition square with f=a and u=b. Its base case uses Fin 0 and the tensor unit, and its successor preserves the inherited ordered prepend. No coefficient basis or bound rescaling is introduced.

Prerequisites: `HodgeStructuresPartII:H.0/affine-chart-field-transition`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-natural`.

### Chart API acceptance tests

`TwistedHiggsBundle.affineChartField.test_horizontal_unique` (characterisation): Any two S-linear candidate chart fields satisfying the actual horizontal square with the same e and q are equal. The inverse chart determines the value on every section.

`TwistedHiggsBundle.affineChartField.test_chart_roundtrip` (compatibility): At every n≥0, reversing the two charts reverses both module transitions and gives the reverse ordered-iterate square, with no bound change.

`TwistedHiggsBundle.affineChartField.test_empty_word_transition` (degenerate): For every input x, the degree-zero iterate in the second chart sends a(x) to a(x)⊗1 in F₂⊗_S P₂^⊗0. It is independent of the first coefficient chart; the value remains the tensor unit rather than an imposed zero value.

`TwistedHiggsBundle.affineChartField.test_sign_overlap` (computation): With identity E-charts, first coefficient chart identity and second coefficient chart negation, I_n(θ₂)=(id⊗neg^⊗n)∘I_n(θ_S) for every n, including zero.

`TwistedHiggsBundle.affineChartField.test_missing_coefficient_transition` (non-example): Over ℤ, (id⊗neg)(1⊗1)≠1⊗1, as detected by the native right tensor unit. Omitting the coefficient transition gives the wrong square even in rank one.

`TwistedHiggsBundle.affineChartField.test_triple_overlap` (compatibility): For three arbitrary chart pairs of the same θ_S, the two successive E-transitions and two successive Q-transitions give exactly the direct 1→3 ordered-iterate square for every n. Native equivalence cancellation proves the cocycle; no generic cocycle construction is replanned.

Source: [Heuer, published paper](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition 1.2(2), p.262 and Definition 4.1/Remark 4.2, pp.297–298, selected passages read 2026-10-03. The affine chart equations are authored deductions; no global Simpson equivalence or new generic sheaf descent carrier is claimed.

Current codex-J6LwjP chart-overlap checkpoint supplies unique affine chart fields, actual horizontal two-chart transition and all-degree ordered-iterate transition, including tensor-unit and triple-overlap checks. Before global restriction/descent, discharge E1’s actual sheaf tensor-power comparison, restriction identifications and equality detection/gluing. Exterior-integrability transport, global determinant/Tate adapters, rank bounds, all 149 source obligations and H.1–H.8 remain open.

The three new declarations are API entries of the existing affineChartField construction. Its previous contracts, six API items, seven tests and all inherited source routes are retained. The test labels above correspond to six new planning examples.


## Affine exterior integrability and chart comparison

The actual native affine exterior square, horizontal naturality, module/coefficient-equivalence reflection, receiving-chart transition, arbitrary-characteristic two-direction commutator formula and split-coefficient detection are now supplied as plans with separate checked native proofs. The full two-coordinate integrability criterion and scalar unit field at every ordered degree are checked, including characteristic two and integrability without nilpotence. Still supply the arbitrary-Q cross-ring exterior projection/base-change comparison, the global Ω²⊗T² identification, finite-projective sheaf restriction/exterior comparison, equality detection/gluing, the full arbitrary finite-basis coordinate criterion and every inherited rank, determinant/Tate, period, supplier and source obligation. These affine proofs do not compare a sheaf tensor with tensors of global sections or reflect source-ring curvature through a nonfaithful extension.

Define κ(θ) by projecting the actual second ordered coefficient tensor to the actual native exterior square. The projection is the existing Tau Ceti fromTensorPower definition, transparently expanded to its Mathlib multilinear lift here; it is not a new generic exterior construction. The target is E⊗Λ²Q. The global twisted identification Λ²(Ω¹⊗T)≃Ω²⊗T² and the sheaf calculus remain supplier work.

A horizontal square for f,u induces the exterior square for f,Λ²u. Actual inverses reflect zero without flatness. Two receiving charts identify the same S-modules before this comparison applies; no source-ring reflection or cross-ring exterior comparison follows merely from chart agreement.

For θ(e)=A(e)⊗q+B(e)⊗r, the inherited prepend convention gives κ(θ)(e)=[A,B](e)⊗(q∧r). Repeated arguments vanish and swapping gives a minus sign; neither step divides by two. Commutativity suffices for integrability with arbitrary directions. The converse requires the actual unit-value exterior functional. For the standard two-coordinate chart the native exterior-dual pairing supplies that functional over any commutative ring. Dependent directions give an essential counterexample to an unconditional converse.

The scalar unit field is integrable, but its actual n-th iterate evaluates to the constant unit tensor word and is nonzero at every n, including zero. The native multilinear product and tensor unitor detect the value one. This separates integrability from ordered tensor nilpotence even in a reduced rank-one chart. The E12/E21 examples detect exterior curvature over ℤ and ℤ/2. These are actual module-chart tests, not a construction of a geometric affine-space differential calculus.

### Exterior square of an affine Higgs field

Declaration: TwistedHiggsBundle.affineExteriorSquare.

For arbitrary R-modules E,Q and an R-linear field θ:E→E⊗Q, construct κ(θ)=(id_E⊗π₂)∘I₂(θ):E→E⊗Λ²_R Q. Here π₂ is the existing native tensor-power exterior projection, implemented by its exact Mathlib multilinear-lift expression; I₂ is the inherited left-prepended ordered iterate. No division by two or integrability premise occurs.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Apply the existing native exterior projection to the coefficient factor of the actual second ordered iterate. Its pure-word value is the native alternating exterior product, not an antisymmetrization divided by two. Retain the full target E⊗Λ²_R Q, even when Q is torsion, not flat or not finitely generated.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-iterate, mathlib:PiTensorProduct.lift, mathlib:exteriorPower.ιMulti, tauceti:exteriorPower.fromTensorPower.

API TwistedHiggsBundle.affineExteriorSquare_zero (compatibility): For arbitrary E,Q, κ(0)=0.

API TwistedHiggsBundle.affineExteriorSquare_natural (compatibility): If ψ∘f=(f⊗u)∘θ for actual R-linear maps f:E→F and u:Q→P, then κ(ψ)∘f=(f⊗Λ²u)∘κ(θ). No injectivity, surjectivity, basis, flatness or integrability assumption is required.

API TwistedHiggsBundle.affineExteriorSquare_equiv_zero_iff (compatibility): For a horizontal pair of native linear equivalences f:E≃F and u:Q≃P, κ(ψ)=0 if and only if κ(θ)=0. Neither coefficient nor module flatness is needed.

API TwistedHiggsBundle.affineExteriorSquare_coefficientMap (compatibility): For every actual coefficient map u:Q→P, κ(θ_u)=(id_E⊗Λ²u)∘κ(θ), where θ_u is the inherited actual coefficient postcomposition.

API TwistedHiggsBundle.affineExteriorSquare_coefficientMap_zero (compatibility): If κ(θ)=0, then κ(θ_u)=0 for every R-linear coefficient map u, including zero and quotient maps.

API TwistedHiggsBundle.affineExteriorSquare_coefficientEquiv_zero_iff (compatibility): For every native linear equivalence u:Q≃P, κ(θ_u)=0 if and only if κ(θ)=0.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection (compatibility): For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute (compatibility): If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff (compatibility): Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

API TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff (compatibility): For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

API TwistedHiggsBundle.affineExteriorSquare_chart_transition (compatibility): For two actual charts of the same receiving-ring scalar extensions, with θ_i the inherited chart field, a=e₂∘e₁⁻¹ and b=q₂∘q₁⁻¹, κ(θ₂)∘a=(a⊗Λ²b)∘κ(θ₁). Every exterior power is over the receiving ring S. This is a chart-transition equation, not a comparison with scalar extension of the source-ring exterior square.

API TwistedHiggsBundle.affineExteriorSquare_chart_zero_iff (compatibility): For those two charts of the same S-modules, κ(θ₂)=0 if and only if κ(θ₁)=0. An individual nonfaithful R→S extension is not asserted to reflect the original source-ring exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_zero (degenerate): The actual zero field on arbitrary E,Q has zero exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_torsion_coefficients (compatibility): For E=ℤ, Q=ℤ/2, P=ℤ/3 and every actual θ:E→E⊗Q, postcomposition by the zero coefficient map has zero exterior square; no flat coefficient or basis exists here.

Test TwistedHiggsBundle.affineExteriorSquare.test_scalar_line (non-example): For the actual unit field θ on E=Q=ℤ, κ(θ)=0 and the actual associator-defined ordered square is nonzero.

Test TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_integer (non-example): For E=Q=ℤ×ℤ, A=E12 and B=E21 as the actual inl/snd and inr/fst composites, the standard two-direction field has nonzero exterior square.

Test TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_char_two (non-example): The same actual E12/E21 field on E=Q=(ℤ/2)×(ℤ/2) has nonzero exterior square. No division by two or characteristic-zero premise is valid.

Test TwistedHiggsBundle.affineExteriorSquare.test_coefficient_erasure (non-example): The actual noncommuting ℤ two-coordinate field has nonzero exterior square, but its postcomposition by the zero coefficient map to ℤ has zero exterior square. Arbitrary coefficient maps do not reflect integrability.

Test TwistedHiggsBundle.affineExteriorSquare.test_coefficient_equiv (compatibility): For every actual coefficient equivalence u:Q≃P, exterior integrability of θ_u is equivalent to exterior integrability of θ.

Test TwistedHiggsBundle.affineChartField.test_exterior_transition (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary coefficient directions.

Test TwistedHiggsBundle.affineChartField.test_exterior_zero_iff (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary coefficient directions.

Test TwistedHiggsBundle.affineExteriorSquare.test_degree_two_not_nilpotence (non-example): The actual unit field on ℤ has zero exterior square and a nonzero degree-two ordered tensor-power iterate.

Test TwistedHiggsBundle.affineExteriorSquare.test_integrable_not_nilpotent (non-example): The actual unit field on ℤ has zero exterior square, while every actual ordered iterate at every n≥0 is nonzero. Exterior integrability cannot replace tensor nilpotence.

### Exterior square of the zero field

Declaration: TwistedHiggsBundle.affineExteriorSquare_zero.

For arbitrary E,Q, κ(0)=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Unfold the two successors in the actual ordered iterate. The zero field makes the positive iterate zero, and exterior projection preserves zero.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

### Exterior square under a horizontal morphism

Declaration: TwistedHiggsBundle.affineExteriorSquare_natural.

If ψ∘f=(f⊗u)∘θ for actual R-linear maps f:E→F and u:Q→P, then κ(ψ)∘f=(f⊗Λ²u)∘κ(θ). No injectivity, surjectivity, basis, flatness or integrability assumption is required.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Apply the inherited ordered-iterate naturality at degree two. Use the existing exterior-projection naturality; its exact pinned proof compares pure tensor words via the native exterior map on alternating generators. Compose the two actual linear-map squares.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-ordered-iterate-natural, tauceti:exteriorPower.map_comp_fromTensorPower, mathlib:exteriorPower.map_apply_ιMulti.

### Integrability under module and coefficient equivalences

Declaration: TwistedHiggsBundle.affineExteriorSquare_equiv_zero_iff.

For a horizontal pair of native linear equivalences f:E≃F and u:Q≃P, κ(ψ)=0 if and only if κ(θ)=0. Neither coefficient nor module flatness is needed.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Construct the actual left inverse f⁻¹⊗Λ²(u⁻¹) using native tensor and exterior functor composition. It makes f⊗Λ²u injective. Evaluate the horizontal exterior square to reflect zero through this injection. Preserve zero using surjectivity of f.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, mathlib:exteriorPower.map_comp, mathlib:exteriorPower.map_id, mathlib:LinearMap.injective_of_comp_eq_id.

### Exterior square after changing coefficients

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientMap.

For every actual coefficient map u:Q→P, κ(θ_u)=(id_E⊗Λ²u)∘κ(θ), where θ_u is the inherited actual coefficient postcomposition.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use horizontal naturality with f=id_E and the defining coefficient-map square.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, HodgeStructuresPartII:H.0/affine-coefficient-map.

### Coefficient maps preserve integrability

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientMap_zero.

If κ(θ)=0, then κ(θ_u)=0 for every R-linear coefficient map u, including zero and quotient maps.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Substitute the zero exterior square in the proved coefficient-map equation.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-coefficient-map.

### Coefficient equivalences reflect integrability

Declaration: TwistedHiggsBundle.affineExteriorSquare_coefficientEquiv_zero_iff.

For every native linear equivalence u:Q≃P, κ(θ_u)=0 if and only if κ(θ)=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the module identity equivalence and the specified coefficient equivalence in the horizontal zero-reflection theorem.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-equiv, HodgeStructuresPartII:H.0/affine-coefficient-map.

### An affine field with two coefficient directions

Declaration: TwistedHiggsBundle.affineTwoDirectionField.

For A,B∈End_R(E) and arbitrary q,r∈Q, construct the actual R-linear field θ(e)=A(e)⊗q+B(e)⊗r by the native bilinear tensor constructor. The directions need not be a basis or independent, and A,B need not commute.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Compose the native linear map e↦e⊗q with A, compose e↦e⊗r with B, and add the resulting actual linear maps.

Prerequisites: mathlib:TensorProduct.mk.

API TwistedHiggsBundle.affineTwoDirectionField_apply (projection): For every e, the constructed two-direction field evaluates to A(e)⊗q+B(e)⊗r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection (compatibility): For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute (compatibility): If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

API TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff (compatibility): Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

API TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff (compatibility): For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

Test TwistedHiggsBundle.affineTwoDirectionField.test_apply (computation): The actual two-direction field evaluates at each e to A(e)⊗q+B(e)⊗r.

Test TwistedHiggsBundle.affineTwoDirectionField.test_zero (degenerate): The actual two-direction field is zero when both operators are zero, for arbitrary q,r.

Test TwistedHiggsBundle.affineTwoDirectionField.test_dependent_directions (non-example): With q=r, the actual two-direction field has zero exterior square for every pair A,B, even when the operators do not commute. Directions without a detection hypothesis cannot give the converse.

Test TwistedHiggsBundle.affineTwoDirectionField.test_commutator_detection (characterisation): For Q=R×R and the actual standard coordinate vectors, the field has zero exterior square exactly when A∘B=B∘A, for arbitrary R and E.

### Evaluation of the two-direction field

Declaration: TwistedHiggsBundle.affineTwoDirectionField_apply.

For every e, the constructed two-direction field evaluates to A(e)⊗q+B(e)⊗r.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Read the value of the two tensor-constructor composites; this is definitional.

Prerequisites: HodgeStructuresPartII:H.0/affine-two-direction-field.

### Commutator formula for the exterior square

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection.

For the actual two-direction field, κ(θ)(e)=(A(B(e))−B(A(e)))⊗(q∧r) for every e. The sign follows the inherited left-prepended order. This holds over every commutative ring, including characteristic two.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the proved comparison with the associator-defined ordered square. Expand all four actual pure tensor terms. The diagonal terms vanish because repeated arguments of the native alternating map vanish. Swap r,q to obtain minus q,r, without dividing by two. Collect the two off-diagonal terms in the module factor to obtain the stated commutator, with the rightmost endomorphism acting first.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square, HodgeStructuresPartII:H.0/affine-two-direction-apply, HodgeStructuresPartII:H.0/affine-ordered-iterate-two, HodgeStructuresPartII:H.0/affine-ordered-square, mathlib:PiTensorProduct.lift.tprod, mathlib:AlternatingMap.map_eq_zero_of_eq, mathlib:AlternatingMap.map_swap.

### Commuting operators give an integrable two-direction field

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_of_commute.

If A∘B=B∘A, then κ(θ)=0 for the actual two-direction field, for arbitrary q,r.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Evaluate the commutator formula at every e and substitute the specified equality of the two composites.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction.

### A split exterior coefficient detects commutation

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoDirection_zero_iff.

Suppose an actual linear functional ℓ:Λ²_R Q→R satisfies ℓ(q∧r)=1. Then κ(θ)=0 if and only if A∘B=B∘A for the two-direction field. This unit-value hypothesis is essential; arbitrary dependent directions do not detect commutation.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. ℓ is an actual R-linear functional on the full native exterior square, and ℓ(q∧r)=1. It is neither a stored zero-reflection oracle nor an omitted independence condition.

Proof: Apply id_E⊗ℓ and the tensor right unitor to each value of the commutator formula. The actual unit value makes the resulting map the identity on the commutator vector. For the converse, apply the proved commuting-operator lemma.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction, HodgeStructuresPartII:H.0/affine-exterior-two-direction-commute.

### Integrability in the native two-coordinate chart

Declaration: TwistedHiggsBundle.affineExteriorSquare_twoCoordinates_zero_iff.

For Q=R×R, q=(1,0) and r=(0,1), the actual two-direction field has κ(θ)=0 if and only if A∘B=B∘A. E is an arbitrary R-module and R is an arbitrary commutative ring; no characteristic restriction or basis of E occurs.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: Use the actual native exterior-dual functional determined by the coordinate projections fst,snd. Its value on q∧r is the determinant of the identity two-by-two matrix, hence one over every commutative ring. Apply the split-coefficient detection lemma.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-two-direction-detection, mathlib:exteriorPower.alternatingMapToDual, mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti.

### Exterior square on affine chart overlaps

Declaration: TwistedHiggsBundle.affineExteriorSquare_chart_transition.

For two actual charts of the same receiving-ring scalar extensions, with θ_i the inherited chart field, a=e₂∘e₁⁻¹ and b=q₂∘q₁⁻¹, κ(θ₂)∘a=(a⊗Λ²b)∘κ(θ₁). Every exterior power is over the receiving ring S. This is a chart-transition equation, not a comparison with scalar extension of the source-ring exterior square.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. S is a commutative R-algebra. For i=1,2 the actual e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i identify the same receiving-ring scalar extensions. Sheaf restriction/exterior/twist comparisons and equality detection/gluing remain E1 supplier obligations.

Proof: Apply exterior horizontal naturality over S to the proved actual chart-transition square.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-natural, HodgeStructuresPartII:H.0/affine-chart-field-transition.

### Integrability is independent of the receiving chart

Declaration: TwistedHiggsBundle.affineExteriorSquare_chart_zero_iff.

For those two charts of the same S-modules, κ(θ₂)=0 if and only if κ(θ₁)=0. An individual nonfaithful R→S extension is not asserted to reflect the original source-ring exterior square.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. S is a commutative R-algebra. For i=1,2 the actual e_i:S⊗_R E≃_S F_i and q_i:S⊗_R Q≃_S P_i identify the same receiving-ring scalar extensions. Sheaf restriction/exterior/twist comparisons and equality detection/gluing remain E1 supplier obligations.

Proof: Use the actual module and coefficient transition equivalences in the exterior zero-reflection theorem.

Prerequisites: HodgeStructuresPartII:H.0/affine-exterior-square-equiv, HodgeStructuresPartII:H.0/affine-chart-field-transition.

### Every ordered iterate of the scalar unit field

Declaration: TwistedHiggsBundle.affineOrderedIterate_unitField.

For θ(e)=e⊗1 on E=Q=R, every n≥0 satisfies I_n(θ)(e)=e⊗(1⊗⋯⊗1), with the empty word and tensor unit retained at n=0.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned.

Proof: The degree-zero defining unit identifies the empty Fin 0 word. Induct through the actual successor prepend. The tensor unitor gives θ(e)=e⊗1; native tensor-power multiplication and cast identify the constant unit word at n+1.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-iterate, HodgeStructuresPartII:H.0/affine-ordered-step.

### The scalar unit field is never tensor nilpotent

Declaration: TwistedHiggsBundle.affineOrderedIterate_unitField_ne_zero.

If R is a nontrivial commutative ring, then I_n(θ)≠0 for every n≥0 for the actual scalar unit field θ(e)=e⊗1. This does not require R to be reduced, a domain or a field.

Hypotheses: R is a commutative ring. Every displayed module, tensor product, exterior power, linear map and linear equivalence uses its actual native carrier. E,F,Q,P are arbitrary R-modules; no finiteness, freeness, projectivity, flatness or integrability hypothesis is implicit. I_n uses the inherited left-prepended ordered coefficient convention. Write q∧r for the native alternating generator of Λ²_R Q. The exterior projection is exactly the existing Tau Ceti fromTensorPower definition expressed by its Mathlib lift; no second exterior algebra or tensor carrier is planned. R is nontrivial. E=Q=R with θ the actual inverse tensor right unitor.

Proof: Evaluate the supposed zero iterate at e=1. Apply the actual multilinear product of the n coefficient entries and the tensor right unitor. The value of the constant unit word is one, contradicting nontriviality.

Prerequisites: HodgeStructuresPartII:H.0/affine-ordered-unit-field, mathlib:PiTensorProduct.lift, mathlib:MultilinearMap.mkPiAlgebraFin, mathlib:MultilinearMap.mkPiAlgebraFin_apply_const.

## Finite coefficient directions and exterior integrability

Work over any commutative ring R. The field module E is arbitrary, including torsion or nonflat modules. The coefficient module Q is arbitrary in the finite-direction formula and in integrability implying commutation of all dual contractions. Only the converse criteria take a specified finite basis of Q. Neither the construction nor any proof uses division by two.

Put aθ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ), using the existing native tensor-power exterior projection and the inherited left-prepended iterate. For θ_A,q(e)=Σ_i A_i(e)⊗q_i, expanding twice gives κ(θ_A,q)(e)=Σ_jΣ_i A_i(A_j(e))⊗(q_i∧q_j). The rightmost operator acts first. Pair (i,j) with (j,i): commuting operators cancel using alternating swaps, and diagonal summands vanish by alternation. The native sum-involution lemma explicitly requires that a nonzero summand has no fixed point; diagonal vanishing discharges this requirement even in characteristic two. Antisymmetry alone would not suffice there.

The canonical alternating dual functional on Λ²Q has value v(p)w(q)−w(p)v(q) on p∧q. Two tensor inductions identify its contraction of κ(θ) with [aθ(v),aθ(w)] in the actual endomorphism algebra. Thus integrability implies commutation for all dual contractions even when Q has no basis. Conversely, a finite coefficient basis reconstructs θ, and pairwise commutation of its coordinate operators makes the actual double-sum square vanish. The all-dual criterion and independence of the chosen basis follow from these actual equalities, not from an assumed separation predicate.

The exact pinned imports are the existing tensor map/right-unitor/induction, basis coordinate/reconstruction and exterior-dual determinant APIs. Finset.sum_involution is the generated additive counterpart of the indexed Finset.prod_involution; Fintype.sum_prod_type' is generated from Fintype.prod_prod_type'. Native tensor/exterior/dual/basis carriers are reused, not replanned. The published Heuer Definition1.2(2), complete Definition4.1 and Remark4.2 motivate the field/contraction interface. These thirteen deductions are authored affine algebra, not named theorems or a correspondence proof from that paper.

### Finite coefficient-direction Higgs field

`HodgeStructuresPartII:H.0/affine-finite-direction-field`; `TwistedHiggsBundle.affineFiniteDirectionField` (construction).

For a finite index type I, arbitrary A:I→End_R(E) and q:I→Q, construct the actual R-linear field θ_A,q(e)=Σ_i A_i(e)⊗q_i. The q_i need not be independent and the A_i need not commute.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- For each i compose the native tensor constructor e↦e⊗q_i with A_i, and take the finite sum in the actual R-linear-map module.

Prerequisites: `mathlib:TensorProduct.mk`.

API:

- `TwistedHiggsBundle.affineFiniteDirectionField_apply` (projection): For every e∈E, θ_A,q(e)=Σ_i A_i(e)⊗q_i in the native tensor product E⊗_R Q.
- `TwistedHiggsBundle.affineFiniteDirectionField_reconstruct` (compatibility): For a chosen finite basis b:I→Q and every actual field θ:E→E⊗_R Q, θ equals the finite-direction field with operators A_i=a_θ(b.coord i) and directions b_i. This is an equality of native linear maps, with no basis assumption on E.
- `TwistedHiggsBundle.affineExteriorSquare_finiteDirection` (compatibility): For every finite-direction field and e∈E, κ(θ_A,q)(e)=Σ_j Σ_i A_i(A_j(e))⊗(q_i∧q_j). The operator indexed by the inner sum acts last in the left-prepended coefficient convention; no commutation or independence hypothesis occurs.
- `TwistedHiggsBundle.affineExteriorSquare_finiteDirection_zero_of_commute` (compatibility): If A_i A_j=A_j A_i for every i,j, then κ(θ_A,q)=0 for arbitrary directions q_i. This holds over every commutative ring, including characteristic two; no inverse of two or flatness assumption is used.
- `TwistedHiggsBundle.affineExteriorSquare_contraction` (compatibility): For arbitrary Q and E and all v,w∈Q∨, contraction of κ(θ) by the actual exterior-dual functional ℓ(v,w)=alternatingMapToDual_R,Q,2(v,w) equals a_θ(v)a_θ(w)−a_θ(w)a_θ(v) in End_R(E). On p∧q the functional has value v(p)w(q)−w(p)v(q); rightmost endomorphisms act first.
- `TwistedHiggsBundle.affineFiniteDirectionField_contraction` (compatibility): For all finite A,q and v∈Q∨, a_(θ_A,q)(v)=Σ_i v(q_i)•A_i as an equality in the actual native endomorphism module.
- `TwistedHiggsBundle.affineFiniteDirectionField_coordinate` (compatibility): If b:I→Q is a finite basis, contraction of θ_A,b by b.coord i equals A_i, for every i. The coordinate evaluation is the native basis coordinate, not a stored comparison oracle.
- `TwistedHiggsBundle.affineExteriorSquare_zero_commute` (compatibility): If κ(θ)=0 then a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for all v,w∈Q∨. No finiteness, freeness or projectivity hypothesis on Q or E is needed in this forward implication.
- `TwistedHiggsBundle.affineExteriorSquare_finiteBasis_zero_iff` (characterisation): For a finite basis b:I→Q, κ(θ_A,b)=0 if and only if A_i A_j=A_j A_i for every i,j. R is an arbitrary commutative ring and E an arbitrary R-module. A merely spanning or dependent list of directions is not substituted for the basis in the converse.
- `TwistedHiggsBundle.affineExteriorSquare_coordinate_zero_iff` (characterisation): For every finite basis b:I→Q and actual θ:E→E⊗_R Q, κ(θ)=0 if and only if the coordinate contractions a_θ(b.coord i) commute pairwise. Only Q has a basis; E need not be free, finite, projective or flat.
- `TwistedHiggsBundle.affineExteriorSquare_dual_zero_iff` (characterisation): If Q has a chosen finite basis, κ(θ)=0 if and only if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for every v,w∈Q∨. The backward implication explicitly uses finite-basis reconstruction; separation by the dual is not assumed for an arbitrary coefficient module.
- `TwistedHiggsBundle.affineExteriorSquare_coordinates_basis_independent` (characterisation): For two finite bases b:I→Q and c:J→Q, with possibly different index types, pairwise commutation of the b-coordinate contractions is equivalent to pairwise commutation of the c-coordinate contractions for the same θ. Both criteria are identified with the same native κ(θ)=0.

Uses:

- HodgeStructuresPartII:H.0/higgs-commuting: Supply the actual finite-coordinate affine criterion, including characteristic two, before using E1 to restrict, compare exterior powers and glue local fields.
- HodgeStructuresPartII:H.0/symmetric-action: Certify commutation of actual contraction operators from exterior integrability; the native symmetric-algebra action and its global endomorphism/sheaf comparison remain distinct existing obligations.
- HodgeStructuresPartII:key/higgs-parameter-connections: Give coordinate-independent affine integrability tests without a basis for E and without identifying sheaf tensor sections with tensors of global sections.
- Heuer Definition 4.1 and Remark 4.2: Relate the actual exterior obstruction to the signed commutator of contraction operators, retaining the finite coefficient-basis hypothesis only for the converse.

Unit tests:

- `TwistedHiggsBundle.affineFiniteDirectionField.test_apply` (computation): The finite-direction field evaluates at e to Σ_i A_i(e)⊗q_i.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_empty` (degenerate): For I=Fin 0 the finite-direction field is the zero linear map.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_zero` (degenerate): For any finite I and q, setting every A_i=0 gives the zero field.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_reconstruct` (characterisation): Any actual θ is recovered exactly from the contractions by the coordinates of a chosen finite basis of Q.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_coordinate` (computation): For finite-basis directions, contracting θ_A,b at b.coord i recovers the actual A_i.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_dependent` (non-example): For an arbitrary family of operators with all coefficient directions equal to q, the exterior square is zero even without operator commutation. Dependence cannot supply the converse criterion.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_one_direction` (degenerate): A field with one coefficient direction and an arbitrary endomorphism has zero exterior square.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_torsion_module` (example): Over R=ℤ with the torsion module E=ZMod 2, the one-direction identity field has zero exterior square. No freeness or flatness of E is required.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_char_two_three_coordinates` (non-example): Over ZMod 2, take E=(ZMod 2)², Q=Fin 3→ZMod 2 with its native standard basis, and operators E12,E21,0. The finite-direction field has nonzero exterior square, detected by the 0,1 coordinate commutator at (1,0).
- `TwistedHiggsBundle.affineFiniteDirectionField.test_all_duals` (characterisation): With a finite coefficient basis, κ(θ)=0 exactly when all actual dual contractions commute, not only the selected coordinate contractions.
- `TwistedHiggsBundle.affineFiniteDirectionField.test_basis_independent` (invariance): Coordinate commutation is equivalent for any two finite coefficient bases, even if their index types differ.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Evaluation of a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-apply`; `TwistedHiggsBundle.affineFiniteDirectionField_apply` (lemma).

For every e∈E, θ_A,q(e)=Σ_i A_i(e)⊗q_i in the native tensor product E⊗_R Q.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the finite sum of the tensor-constructor composites using native linear-map sum evaluation.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-field`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Reconstruction as a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-reconstruct`; `TwistedHiggsBundle.affineFiniteDirectionField_reconstruct` (lemma).

For a chosen finite basis b:I→Q and every actual field θ:E→E⊗_R Q, θ equals the finite-direction field with operators A_i=a_θ(b.coord i) and directions b_i. This is an equality of native linear maps, with no basis assumption on E.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the finite-direction field at each e, apply the existing affineContractions_reconstruct to the chosen finite coefficient basis, and use native linear-map extensionality.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-contractions-reconstruction`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Finite double-sum exterior-square formula

`HodgeStructuresPartII:H.0/affine-exterior-finite-direction`; `TwistedHiggsBundle.affineExteriorSquare_finiteDirection` (lemma).

For every finite-direction field and e∈E, κ(θ_A,q)(e)=Σ_j Σ_i A_i(A_j(e))⊗(q_i∧q_j). The operator indexed by the inner sum acts last in the left-prepended coefficient convention; no commutation or independence hypothesis occurs.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Use the inherited affineOrderedIterate_two comparison with the associator-defined ordered square.
- Expand θ_A,q twice with native tensor-map and linear-map finite-sum laws. The first q_j is on the right after prepending the second q_i.
- Evaluate the existing tensor-power exterior projection on each pure word to obtain precisely q_i∧q_j.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `HodgeStructuresPartII:H.0/affine-exterior-square`, `mathlib:PiTensorProduct.lift.tprod`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Commuting finite directions give integrability

`HodgeStructuresPartII:H.0/affine-exterior-finite-direction-commute`; `TwistedHiggsBundle.affineExteriorSquare_finiteDirection_zero_of_commute` (lemma).

If A_i A_j=A_j A_i for every i,j, then κ(θ_A,q)=0 for arbitrary directions q_i. This holds over every commutative ring, including characteristic two; no inverse of two or flatness assumption is used.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Rewrite the double sum as a sum on I×I using the generated additive form Fintype.sum_prod_type' of the indexed native product theorem.
- Use the actual Finset.sum_involution generated from Finset.prod_involution with (i,j)↦(j,i). Pairwise operator commutation and AlternatingMap.map_swap make paired summands negatives.
- A fixed point has i=j and its alternating generator is zero by AlternatingMap.map_eq_zero_of_eq. This explicit zero condition, not 2x=0, closes the involution hypothesis.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-finite-direction`, `mathlib:Finset.prod_involution`, `mathlib:Fintype.prod_prod_type'`, `mathlib:AlternatingMap.map_swap`, `mathlib:AlternatingMap.map_eq_zero_of_eq`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Exterior-dual contraction is the commutator

`HodgeStructuresPartII:H.0/affine-exterior-contraction-commutator`; `TwistedHiggsBundle.affineExteriorSquare_contraction` (lemma).

For arbitrary Q and E and all v,w∈Q∨, contraction of κ(θ) by the actual exterior-dual functional ℓ(v,w)=alternatingMapToDual_R,Q,2(v,w) equals a_θ(v)a_θ(w)−a_θ(w)a_θ(v) in End_R(E). On p∧q the functional has value v(p)w(q)−w(p)v(q); rightmost endomorphisms act first.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate the actual linear-map equality at e. Tensor induction on θ(e), followed by tensor induction on θ(x), reduces it to two pure coefficient vectors p,q; sums are preserved by the genuine linear maps.
- The inherited left-prepended iterate yields the exterior generator p∧q. Read the native alternatingMapToDual_apply_ιMulti determinant, evaluate its 2×2 determinant and use tensor right-unit/balancing.
- The value is (v(p)w(q)−w(p)v(q))•x; native commutative scalar multiplication and module subtraction give the signed commutator, without commutation of endomorphisms.

Prerequisites: `HodgeStructuresPartII:H.0/affine-contractions-apply`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `HodgeStructuresPartII:H.0/affine-exterior-square`, `mathlib:TensorProduct.induction_on`, `mathlib:exteriorPower.alternatingMapToDual`, `mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Contraction of a finite-direction field

`HodgeStructuresPartII:H.0/affine-finite-direction-contraction`; `TwistedHiggsBundle.affineFiniteDirectionField_contraction` (lemma).

For all finite A,q and v∈Q∨, a_(θ_A,q)(v)=Σ_i v(q_i)•A_i as an equality in the actual native endomorphism module.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Evaluate on e, distribute the actual tensor map and right unitor over the finite sum, and use rid(e⊗r)=r•e.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-apply`, `HodgeStructuresPartII:H.0/affine-contractions-apply`, `mathlib:TensorProduct.map_tmul`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Basis coordinates recover the specified operators

`HodgeStructuresPartII:H.0/affine-finite-direction-coordinate`; `TwistedHiggsBundle.affineFiniteDirectionField_coordinate` (lemma).

If b:I→Q is a finite basis, contraction of θ_A,b by b.coord i equals A_i, for every i. The coordinate evaluation is the native basis coordinate, not a stored comparison oracle.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Apply the preceding contraction formula and native basis coordinate evaluation b.coord i (b j)=δ_ij. The finite sum reduces to A_i.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-contraction`, `mathlib:Module.Basis.coord`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability makes all contractions commute

`HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`; `TwistedHiggsBundle.affineExteriorSquare_zero_commute` (lemma).

If κ(θ)=0 then a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for all v,w∈Q∨. No finiteness, freeness or projectivity hypothesis on Q or E is needed in this forward implication.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Apply the actual exterior-contraction commutator identity to v,w.
- Replace κ(θ) by the zero linear map and use the existing affineContractions_zero. The commutator is zero, hence the two products are equal.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-contraction-commutator`, `HodgeStructuresPartII:H.0/affine-contractions-zero`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for finite-basis fields

`HodgeStructuresPartII:H.0/affine-exterior-finite-basis-criterion`; `TwistedHiggsBundle.affineExteriorSquare_finiteBasis_zero_iff` (lemma).

For a finite basis b:I→Q, κ(θ_A,b)=0 if and only if A_i A_j=A_j A_i for every i,j. R is an arbitrary commutative ring and E an arbitrary R-module. A merely spanning or dependent list of directions is not substituted for the basis in the converse.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Necessity: apply the arbitrary-module forward contraction theorem to b.coord i and b.coord j, then recover the specified A_i and A_j by the proved coordinate formula.
- Sufficiency: use the finite-direction swap-involution theorem with directions b_i. No exterior-basis or invertibility-of-two lemma is required.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-finite-direction-coordinate`, `HodgeStructuresPartII:H.0/affine-exterior-finite-direction-commute`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for coordinate contractions

`HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`; `TwistedHiggsBundle.affineExteriorSquare_coordinate_zero_iff` (lemma).

For every finite basis b:I→Q and actual θ:E→E⊗_R Q, κ(θ)=0 if and only if the coordinate contractions a_θ(b.coord i) commute pairwise. Only Q has a basis; E need not be free, finite, projective or flat.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Reconstruct θ as the finite-direction field of its coordinate contractions using the existing native finite coefficient-basis reconstruction.
- Substitute the equality in the finite-basis field criterion; no module coordinates for E are introduced.

Prerequisites: `HodgeStructuresPartII:H.0/affine-finite-direction-reconstruct`, `HodgeStructuresPartII:H.0/affine-exterior-finite-basis-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Integrability criterion for all dual contractions

`HodgeStructuresPartII:H.0/affine-exterior-all-dual-criterion`; `TwistedHiggsBundle.affineExteriorSquare_dual_zero_iff` (lemma).

If Q has a chosen finite basis, κ(θ)=0 if and only if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) for every v,w∈Q∨. The backward implication explicitly uses finite-basis reconstruction; separation by the dual is not assumed for an arbitrary coefficient module.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Forward: invoke the arbitrary-module all-contractions necessity theorem.
- Backward: specialize all-functional commutation to the finite basis coordinates and invoke the coordinate criterion. The given basis supplies the exact reconstruction needed for sufficiency.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Basis independence of coordinate commutation

`HodgeStructuresPartII:H.0/affine-exterior-coordinate-basis-independence`; `TwistedHiggsBundle.affineExteriorSquare_coordinates_basis_independent` (lemma).

For two finite bases b:I→Q and c:J→Q, with possibly different index types, pairwise commutation of the b-coordinate contractions is equivalent to pairwise commutation of the c-coordinate contractions for the same θ. Both criteria are identified with the same native κ(θ)=0.

Hypotheses:

- R is any commutative ring; E and Q are actual R-modules. There is no implicit characteristic-zero, reducedness, finiteness, basis, projectivity or flatness assumption on E. I is a finite index type only in the finite-direction and basis statements.
- θ:E→ₗ[R]E⊗[R]Q, a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) are the inherited actual native maps. π₂ is the already-built Tau Ceti tensor-to-exterior projection expressed by its exact Mathlib lift. Products in End_R(E) are composition, with the rightmost factor applied first.
- A chosen finite basis of Q is required exactly where the statement names b or c. The finite-direction construction and integrability⇒commuting-duals implication allow arbitrary Q. These are affine module statements: E1 sheaf restriction, tensor/exterior comparison, local equality detection and gluing remain explicit supplier work.

Proof/construction:

- Identify both coordinate-commutation statements with κ(θ)=0 by the coordinate criterion, and compose the equivalences.

Prerequisites: `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

Source: Ben Heuer, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Definition1.2(2), printed p.262; complete Definition4.1/Remark4.2, printed pp.297–298. Short literal: “θ ∧ θ = 0”. The native deduction extends the baseline APIs described above. Implementation status remains unchecked.

### Global boundary

The affine finite-coordinate result does not construct a sheaf tensor or identify its sections with tensors of global sections. The existing H.0/higgs-commuting global target still consumes E1 restriction, exterior/dual tensor comparison, local equality detection and gluing. Arbitrary-Q cross-ring exterior projection/base-change comparison, finite-projective dual localization, the global Ω²⊗T² identification and all λ-connection/Griffiths/Rees supplier obligations remain explicit work. No Hodge parent carrier is duplicated, no stage or reserved key is closed, and all149 source-route obligations retain their previous status. H.0 is partial and H.1–H.8 are not_read. The full suggested file uses admitted bodies under protocol13; its type check is separate from the admission-free native prototype archived in the handoff.

## Affine tensor Higgs fields — codex-7e92bd continuation

General ringed-site Higgs/constant-parameter connection plan with 173 nodes. The affine tensor continuation supplies the actual tensor field on arbitrary modules, its contraction and coefficient-map identities, horizontal tensor maps, native symmetry, both unitors and associator; finite-basis coefficient directions give tensor integrability over any commutative ring. All 161 inherited contracts, ordered-iterate/base-change/chart/exterior APIs, eight routes and 149 source obligations remain. H.0 is partial and H.1–H.8 are not_read; every node is unchecked. General-Q tensor curvature, nonzero-parameter balancing, the integral tensor-nilpotence bound, exterior scalar extension, finite-projective and actual sheaf restriction/gluing, determinant/Tate/period adapters and source decomposition remain open.

Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), §2.1 Theorem 2.1(iv), equation (2.4), uses the sum of the two induced Higgs fields on a sheaf tensor. The following arbitrary-ring affine identities are authored deductions, not a proof of the correspondence or its tensor functor. The source read covers all of §2.1 and the preceding Theorem 1.6, Remark 1.10 and conventions; it does not cover the whole paper.

R is an arbitrary commutative ring; E,F,Q (and any explicitly named E′,F′,G,P) are arbitrary R-modules. Fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps, without an integrability assumption unless explicitly stated. No finiteness, flatness, freeness, reducedness or characteristic hypothesis is imposed on E or F.
Write T(θ,ψ)=rightComm∘(θ⊗id_F)+assoc⁻¹∘(id_E⊗ψ), with target (E⊗_R F)⊗_R Q; write a_θ(v)=rid∘(id_E⊗v)∘θ and κ(θ)=(id_E⊗π₂)∘I₂(θ) for the inherited native contraction and exterior square. Tensor associators, symmetry and unitors are the existing Mathlib linear equivalences, not new general module constructions.
Only the integrability theorem requires a chosen finite basis b:I→Q. Every other new tensor identity holds for arbitrary Q. The tensor unit carries the zero Higgs field. This is the affine λ=0 specialization: neither the nonzero-parameter Leibniz balancing nor actual sheaf restriction/gluing is discharged.

The coefficient module Q remains a single common factor. In the p-adic application Q models the existing differential/Tate coefficient module; no Tate trivialization is chosen here. Tensoring a Higgs field with the zero field on R gives the unit operation. Tensoring two scalar unit fields instead adds their scalar coefficients.

### Affine tensor Higgs field

`TwistedHiggsBundle.affineTensorField` — Construct T(θ,ψ):E⊗_R F→(E⊗_R F)⊗_R Q as the sum rightComm∘(θ⊗id_F)+assoc⁻¹∘(id_E⊗ψ). Both summands retain one common coefficient module Q; no tensor-square coefficient or division is introduced.

Proof outline: Compose the native tensor maps with rightComm and the inverse associator, then add in the native module of linear maps.

Prerequisites: `mathlib:TensorProduct.map`, `mathlib:TensorProduct.rightComm`, `mathlib:TensorProduct.assoc`.

### Tensor Higgs field on pure tensors

`TwistedHiggsBundle.affineTensorField_tmul` — For every e∈E and f∈F, T(θ,ψ)(e⊗f)=rightComm(θ(e)⊗f)+assoc⁻¹(e⊗ψ(f)).

Proof outline: Evaluate the two defining composites on a pure tensor.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-field`, `mathlib:TensorProduct.map_tmul`.

### Tensor of zero Higgs fields

`TwistedHiggsBundle.affineTensorField_zero` — T(0_E,0_F)=0 as a native linear map E⊗_R F→(E⊗_R F)⊗_R Q.

Proof outline: Apply native tensor extensionality and the pure-tensor formula.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.ext'`.

### Contraction of the tensor Higgs field

`TwistedHiggsBundle.affineTensorField_contractions` — For every v∈Hom_R(Q,R), a_T(θ,ψ)(v)=a_θ(v)⊗id_F+id_E⊗a_ψ(v) in End_R(E⊗_R F).

Proof outline: Apply tensor extensionality; expand the contraction of each summand. Tensor induction on θ(e) and ψ(f) reduces the two equations to pure tensors, where scalar balance gives the stated endomorphisms.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-contractions`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Commuting tensor contractions

`TwistedHiggsBundle.affineTensorField_contractions_commute` — For v,w∈Hom_R(Q,R), if a_θ(v)a_θ(w)=a_θ(w)a_θ(v) and a_ψ(v)a_ψ(w)=a_ψ(w)a_ψ(v), then a_T(θ,ψ)(v)a_T(θ,ψ)(w)=a_T(θ,ψ)(w)a_T(θ,ψ)(v). Products are composition with the right factor applied first.

Proof outline: Use the contraction formula and tensor extensionality. Expand both products into four terms; the two mixed terms match by acting in separate tensor factors, and the two same-factor terms match by the hypotheses. Reorder the four-term sum without dividing by two.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-contractions`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.map_tmul`.

### Integrability of the tensor Higgs field

`TwistedHiggsBundle.affineTensorField_integrable` — If Q has a chosen finite basis b:I→Q and κ(θ)=κ(ψ)=0, then κ(T(θ,ψ))=0. E and F remain arbitrary R-modules, including torsion modules.

Proof outline: Use the inherited finite-coordinate integrability criterion for Q. Each input curvature vanishing gives commuting contractions at b.coord i and b.coord j; the tensor contraction lemma supplies the pairwise commutation required by the criterion.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-commute`, `HodgeStructuresPartII:H.0/affine-exterior-zero-contractions-commute`, `HodgeStructuresPartII:H.0/affine-exterior-coordinate-criterion`.

### Tensor field under coefficient postcomposition

`TwistedHiggsBundle.affineTensorField_coefficientMap` — For any R-linear u:Q→P, (id_(E⊗F)⊗u)∘T(θ,ψ)=T((id_E⊗u)∘θ,(id_F⊗u)∘ψ). This is same-ring postcomposition, with no injectivity or flatness requirement on u.

Proof outline: Apply tensor extensionality and expand both fields. Tensor induction on each input field value reduces naturality of the associator and permutation to their pure-tensor formulas.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-coefficient-map`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Tensor of horizontal linear maps

`TwistedHiggsBundle.affineTensorField_horizontal` — For fields θ′ on E′ and ψ′ on F′ with coefficients Q and R-linear f:E→E′, g:F→F′, suppose θ′∘f=(f⊗id_Q)∘θ and ψ′∘g=(g⊗id_Q)∘ψ. Then T(θ′,ψ′)∘(f⊗g)=((f⊗g)⊗id_Q)∘T(θ,ψ). No map needs to be invertible.

Proof outline: Evaluate on e⊗x, substitute both horizontal equations, and separate the two summands. Tensor induction on θ(e) and ψ(x) proves each tensor-map/permutation identity.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal tensor symmetry

`TwistedHiggsBundle.affineTensorField_comm` — For the native symmetry c:E⊗_R F≃F⊗_R E, T(ψ,θ)∘c=(c⊗id_Q)∘T(θ,ψ).

Proof outline: Evaluate on e⊗f, swap the two summands, and use tensor induction on the two field values with the native commutor, rightComm and associator evaluations.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.comm`, `mathlib:TensorProduct.comm_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal right tensor unit

`TwistedHiggsBundle.affineTensorField_rid` — For the native right unitor ρ:E⊗_R R≃E and the zero field on R, θ∘ρ=(ρ⊗id_Q)∘T(θ,0_R).

Proof outline: Evaluate at e⊗r. Linearity makes the left side r•θ(e); tensor induction on θ(e) identifies the right side with the same scalar action.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.rid`, `mathlib:TensorProduct.rid_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`.

### Horizontal left tensor unit

`TwistedHiggsBundle.affineTensorField_lid` — For the native left unitor ℓ:R⊗_R E≃E and the zero field on R, θ∘ℓ=(ℓ⊗id_Q)∘T(0_R,θ).

Proof outline: Evaluate at r⊗e and use linearity. Tensor induction on θ(e) reduces both sides to r acting on the E component of each pure tensor.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.lid`, `mathlib:TensorProduct.lid_tmul`, `mathlib:TensorProduct.ext'`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.assoc_symm_tmul`.

### Horizontal tensor associator

`TwistedHiggsBundle.affineTensorField_assoc` — For a third arbitrary R-module G with field χ:G→G⊗_R Q and the native associator α:(E⊗_R F)⊗_R G≃E⊗_R(F⊗_R G), T(θ,T(ψ,χ))∘α=(α⊗id_Q)∘T(T(θ,ψ),χ).

Proof outline: Use threefold tensor extensionality and expand the fields into the three summands contributed by θ,ψ,χ. Reassociate the sum; for each term, tensor induction on its field value reduces the equality to the native permutation and associator formulas.

Prerequisites: `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `mathlib:TensorProduct.assoc`, `mathlib:TensorProduct.assoc_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.ext_threefold`, `mathlib:TensorProduct.induction_on`.

### Construction tests

- `TwistedHiggsBundle.affineTensorField.test_zero` (degenerate): For arbitrary E,F,Q, tensoring the two zero Higgs fields gives the zero field.
- `TwistedHiggsBundle.affineTensorField.test_integer_sum` (computation): Over R=ℤ and E=F=Q=ℤ, tensor the two fields e↦e⊗1. The value at 1⊗1 is (1⊗1)⊗2, retaining both summands.
- `TwistedHiggsBundle.affineTensorField.test_char_two_cancellation` (non-example): Over R=E=F=Q=ZMod 2, the scalar unit field e↦e⊗1 is nonzero, but tensoring it with itself gives the zero field. Tensor-field vanishing cannot reflect the vanishing of either input.
- `TwistedHiggsBundle.affineTensorField.test_torsion_integrability` (compatibility): Over ℤ with Q=ℤ, use E=ZMod 2 and F=ZMod 4 and the one-direction fields with identity operators and direction 1. Their tensor field has zero native exterior square, without a flatness or freeness assumption on either module.
- `TwistedHiggsBundle.affineTensorField.test_zero_direction_map` (degenerate): For arbitrary fields θ,ψ and an arbitrary target coefficient module P, postcompose both fields by the zero map Q→P; their tensor field is zero.

### Ownership and remaining work

The affine λ=0 tensor field, tensor contraction formula, horizontal maps and native associativity/symmetry/unit equations are now planned with separately checked proofs for arbitrary modules. Tensor integrability is proved using a chosen finite basis of Q and no condition on E,F. Still prove the actual tensor-curvature formula for arbitrary Q, the N+M−1 ordered nilpotence bound by integral shuffles, same-λ nonzero-parameter balancing, cross-ring tensor/exterior comparison and E1 sheaf restriction/gluing. No global key, supplier, source route or stage is closed.

All six existing planets, all eight accepted routes, the 149 routed obligations, five supplier requests and 35 global suggested-file omissions are retained. The intrinsic tensor construction gains these affine inputs without changing its original statement. Generic underived sheaf tensor, dual, exterior and pullback comparisons remain with E1; ordinary connection/calculus with CR.1; filtration/Rees with DD.1; general VHS with D3; Jacobi with the existing ColemanPowerSeries declaration.

## Affine tensor exterior curvature over arbitrary coefficients

Fix an arbitrary commutative ring R and arbitrary native R-modules E,F,Q. Let θ:E→E⊗Q and ψ:F→F⊗Q be the specified actual fields. Write π(q⊗r)=q∧r for the existing exterior quotient, κ for the inherited actual exterior square, Sθ=(id⊗π)∘assoc∘(θ⊗id) and T for the inherited tensor field. The mixed pairing M reorders (E⊗Q)⊗(F⊗Q) into (E⊗F)⊗(Q⊗Q) before applying π. All factor permutations are native Mathlib equivalences.

The left extension contribution contains −M(θ(e)⊗ψ(f)); the right contains +M(θ(e)⊗ψ(f)). Their cancellation is integral: the alternating relation supplies the sign, and repeated coefficients vanish by the independent diagonal alternating relation. No division by two, dual separation, chosen basis or flatness is used. This gives the actual curvature formula for arbitrary coefficient modules and therefore tensor integrability for flat Higgs inputs. Nilpotence and converse reflection are distinct statements.

The actual affine tensor-curvature formula and integrability theorem now have native proofs for arbitrary E,F,Q over every commutative ring, with no basis or flatness hypothesis. Prove the existing integral ordered tensor nilpotence bound N+M−1 for positive input bounds, cross-ring tensor/exterior comparison and finite-projective restriction, then discharge E1 actual sheaf tensor/exterior restriction, equality detection and gluing. Same-λ nonzero-parameter additive balancing, determinant/Tate/period adapters, the reserved global ringed-site carrier, all 149 routed source obligations and H.1–H.8 remain open. Earlier narrower affine-frontier statements are retained as checkpoint history.

### Exterior extension of an affine Higgs field

`HodgeStructuresPartII:H.0/affine-exterior-step` — `TwistedHiggsBundle.affineExteriorStep`.

Construct Sθ:E⊗Q→E⊗∧²Q as (id_E⊗π)∘assoc∘(θ⊗id_Q), where π(q⊗r)=q∧r is the native tensor-to-exterior projection. This is the degree-one exterior extension at λ=0, without a differential term.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Compose native tensor maps, associator and the existing exterior quotient. No basis or dual separation argument is used.

Dependencies: `mathlib:TensorProduct.map`, `mathlib:TensorProduct.assoc`, `tauceti:exteriorPower.fromTensorPower`, `mathlib:TensorPower.mulEquiv`.

API `TwistedHiggsBundle.affineExteriorStep_tmul` (simp): For e∈E and q∈Q, Sθ(e⊗q)=(id_E⊗π)(assoc(θ(e)⊗q)); in particular if θ(e)=x⊗r, this equals x⊗(r∧q).

API `TwistedHiggsBundle.affineExteriorStep_add` (relation): For θ,χ:E→E⊗Q, S(θ+χ)=Sθ+Sχ as native linear maps.

API `TwistedHiggsBundle.affineExteriorStep_zero` (simp): S(0_E)=0:E⊗Q→E⊗∧²Q.

API `TwistedHiggsBundle.affineExteriorSquare_eq_step` (compatibility): The inherited actual exterior square satisfies κ(θ)=Sθ∘θ as a native linear map.

Test `TwistedHiggsBundle.affineExteriorStep.test_zero` (degenerate): The zero field on arbitrary E,Q has zero native exterior extension.

Test `TwistedHiggsBundle.affineExteriorStep.test_integer_value` (computation): Over ℤ, with E=ℤ and Q=ℤ², the field θ(e)=e⊗(1,0) has Sθ(1⊗(0,1))=1⊗((1,0)∧(0,1)).

Test `TwistedHiggsBundle.affineExteriorStep.test_square_comparison` (compatibility): For arbitrary θ,E,Q, the exterior-step composite Sθ∘θ equals the inherited actual affineExteriorSquare θ.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior square as a composed extension

`HodgeStructuresPartII:H.0/affine-exterior-square-step` — `TwistedHiggsBundle.affineExteriorSquare_eq_step`.

The inherited actual exterior square satisfies κ(θ)=Sθ∘θ as a native linear map.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use the inherited degree-two ordered-iterate comparison and compose the native tensor-to-exterior projection; tensor-map composition identifies the expressions.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-two`, `HodgeStructuresPartII:H.0/affine-ordered-square`, `mathlib:TensorProduct.map_comp`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior extension on a pure tensor

`HodgeStructuresPartII:H.0/affine-exterior-step-tmul` — `TwistedHiggsBundle.affineExteriorStep_tmul`.

For e∈E and q∈Q, Sθ(e⊗q)=(id_E⊗π)(assoc(θ(e)⊗q)); in particular if θ(e)=x⊗r, this equals x⊗(r∧q).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Unfold the extension and evaluate the native tensor map and associator.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.assoc_tmul`, `tauceti:exteriorPower.fromTensorPower_tprod`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Additivity in the Higgs field

`HodgeStructuresPartII:H.0/affine-exterior-step-add` — `TwistedHiggsBundle.affineExteriorStep_add`.

For θ,χ:E→E⊗Q, S(θ+χ)=Sθ+Sχ as native linear maps.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use native tensor-map additivity in its first map and distribute composition.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `mathlib:TensorProduct.map_add_left`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Exterior extension of the zero field

`HodgeStructuresPartII:H.0/affine-exterior-step-zero` — `TwistedHiggsBundle.affineExteriorStep_zero`.

S(0_E)=0:E⊗Q→E⊗∧²Q.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: The first tensor map is zero; its composite is zero.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Mixed tensor exterior pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair` — `TwistedHiggsBundle.affineTensorWedgePair`.

Construct M:(E⊗Q)⊗(F⊗Q)→(E⊗F)⊗∧²Q as (id_(E⊗F)⊗π)∘tensorTensorTensorComm. It sends (e⊗q)⊗(f⊗r) to (e⊗f)⊗(q∧r).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Reuse the native four-factor tensor permutation, followed by the native exterior quotient. This is the specified mixed-term adapter, not a replacement exterior-power carrier.

Dependencies: `mathlib:TensorProduct.tensorTensorTensorComm`, `mathlib:TensorProduct.map`, `tauceti:exteriorPower.fromTensorPower`, `mathlib:exteriorPower.alternatingMapToDual`, `mathlib:exteriorPower.alternatingMapToDual_apply_ιMulti`, `mathlib:Matrix.det_fin_two`.

API `TwistedHiggsBundle.affineTensorWedgePair_tmul` (simp): M((e⊗q)⊗(f⊗r))=(e⊗f)⊗(q∧r), for every e,f,q,r.

API `TwistedHiggsBundle.affineTensorWedgePair_same_direction` (relation): For all e,f,q, M((e⊗q)⊗(f⊗q))=0, including characteristic two.

API `TwistedHiggsBundle.affineTensorWedgePair_swap` (relation): For z∈E⊗Q and w∈F⊗Q, M_(F,E)(w⊗z)=−(comm_(E,F)⊗id_(∧²Q))(M_(E,F)(z⊗w)).

Test `TwistedHiggsBundle.affineTensorWedgePair.test_repeated_coefficient` (degenerate): For arbitrary e,f,q, the mixed pairing of e⊗q with f⊗q is zero.

Test `TwistedHiggsBundle.affineTensorWedgePair.test_integer_sign` (computation): Over ℤ with E=F=ℤ and Q=ℤ², pairing (1⊗(0,1)) with (1⊗(1,0)) gives −(1⊗1)⊗((1,0)∧(0,1)), with the coefficient sign retained.

Test `TwistedHiggsBundle.affineTensorWedgePair.test_characteristic_two_nonzero` (non-example): Over ZMod 2, with E=F=ZMod 2 and Q=(ZMod 2)², the actual mixed exterior pairing is nonzero. Alternating signs in characteristic two do not make the exterior projection vanish.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Mixed pairing on four factors

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul` — `TwistedHiggsBundle.affineTensorWedgePair_tmul`.

M((e⊗q)⊗(f⊗r))=(e⊗f)⊗(q∧r), for every e,f,q,r.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Evaluate the native four-factor permutation and tensor-to-exterior projection.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `mathlib:TensorProduct.tensorTensorTensorComm_tmul`, `mathlib:TensorProduct.map_tmul`, `tauceti:exteriorPower.fromTensorPower_tprod`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Left contribution and reversed mixed term

`HodgeStructuresPartII:H.0/affine-exterior-step-tensor-left` — `TwistedHiggsBundle.affineExteriorStep_tensor_left`.

For z∈E⊗Q and f∈F, ST(rightComm(z⊗f))=rightComm(Sθ(z)⊗f)−M(z⊗ψ(f)), where T=T(θ,ψ). The minus sign comes from reversing the two coefficient factors.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Induct on z by native tensor generation and distribute the two field summands. Induct on θ(e) for the pure left contribution, and on ψ(f) for the mixed contribution. The latter has r∧q=−q∧r by native alternating-map swap. No division by two is used.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-exterior-step-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:AlternatingMap.map_swap`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Right contribution and direct mixed term

`HodgeStructuresPartII:H.0/affine-exterior-step-tensor-right` — `TwistedHiggsBundle.affineExteriorStep_tensor_right`.

For e∈E and w∈F⊗Q, ST(assoc⁻¹(e⊗w))=M(θ(e)⊗w)+assoc⁻¹(e⊗Sψ(w)), where T=T(θ,ψ).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Induct on w by native tensor generation and distribute the field summands. Induct on θ(e) and ψ(f) for the two terms; native tensor permutations give the specified factor order.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-step`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-exterior-step-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor curvature on elementary tensors

`HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul` — `TwistedHiggsBundle.affineTensorField_curvature_tmul`.

For arbitrary Q, κ(T(θ,ψ))(e⊗f)=rightComm(κ(θ)(e)⊗f)+assoc⁻¹(e⊗κ(ψ)(f)), with ∧²Q moved to the last factor.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Replace each exterior square by its exterior-step composite. Expand T(e⊗f) and substitute the left and right extension identities. The identical mixed pairings occur with opposite signs and cancel.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-exterior-square-step`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-exterior-step-tensor-left`, `HodgeStructuresPartII:H.0/affine-exterior-step-tensor-right`.

Test `TwistedHiggsBundle.affineTensorField.test_curvature_value` (compatibility): For arbitrary actual fields and pure e⊗f, the tensor exterior square equals the two input exterior squares in the specified last-factor order.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor integrability for arbitrary coefficients

`HodgeStructuresPartII:H.0/affine-tensor-integrable-arbitrary` — `TwistedHiggsBundle.affineTensorField_integrable_of_arbitrary_coefficients`.

If κ(θ)=κ(ψ)=0, then κ(T(θ,ψ))=0 for every R-module Q. E,F,Q may all have torsion; no basis, projectivity or flatness of any of them is needed.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use native pure-tensor extensionality and the actual curvature formula; both surviving terms are zero. No converse or nilpotence implication follows.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul`, `mathlib:TensorProduct.ext'`.

Test `TwistedHiggsBundle.affineTensorField.test_torsion_coefficient_integrability` (compatibility): Over ℤ with E=F=ℤ and torsion Q=(ZMod 2)², tensor the scalar one-direction fields in directions (1,0) and (0,1). The actual tensor field has zero exterior square without a coefficient basis or flatness hypothesis.

Test `TwistedHiggsBundle.affineTensorField.test_no_reflection_through_zero_module` (non-example): Over ℤ take the nonintegrable two-direction field E12 dx+E21 dy on ℤ² and F=(Fin 0→ℤ). Its tensor field with the zero field on F has zero curvature, while the original field has nonzero curvature. Tensor integrability does not reflect the integrability of an input through a zero module.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Tensor curvature as a linear-map equality

`HodgeStructuresPartII:H.0/affine-tensor-curvature` — `TwistedHiggsBundle.affineTensorField_curvature`.

κ(T(θ,ψ))=rightComm∘(κ(θ)⊗id_F)+assoc⁻¹∘(id_E⊗κ(ψ)) as native linear maps E⊗F→(E⊗F)⊗∧²Q.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Apply native tensor extensionality; evaluate both sides and use the elementary-tensor curvature formula.

Dependencies: `HodgeStructuresPartII:H.0/affine-exterior-square`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-curvature-tmul`, `mathlib:TensorProduct.ext'`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Repeated coefficients in the mixed pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-repeated` — `TwistedHiggsBundle.affineTensorWedgePair_same_direction`.

For all e,f,q, M((e⊗q)⊗(f⊗q))=0, including characteristic two.

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Evaluate the mixed pairing and use the alternating relation q∧q=0, rather than deriving it from a sign by division.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:AlternatingMap.map_eq_zero_of_eq`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

### Signed swap of the mixed pairing

`HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-swap` — `TwistedHiggsBundle.affineTensorWedgePair_swap`.

For z∈E⊗Q and w∈F⊗Q, M_(F,E)(w⊗z)=−(comm_(E,F)⊗id_(∧²Q))(M_(E,F)(z⊗w)).

R is an arbitrary commutative ring; E,F,Q are arbitrary R-modules. The fields θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear maps. No field, characteristic, reducedness, basis, finite generation, projectivity or flatness hypothesis is imposed unless an individual concrete test states one. κ is the inherited actual native exterior square of the ordered iterate. The native π₂ is the existing exteriorPower.fromTensorPower; the binary π is its composite with the native two-factor tensor-power comparison. The suggested helper pairExterior is this literal existing-library expression, with its evaluation proof retained, not a new general exterior quotient target. These are affine λ=0 statements. No nonzero-parameter balancing, sheaf tensor/global-section identification, nilpotence bound, scalar-extension exterior comparison or global descent is established.

Proof: Use tensor induction in z and w. On four pure factors use the actual commutor and alternating coefficient swap; extend by additivity.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair`, `HodgeStructuresPartII:H.0/affine-tensor-wedge-pair-tmul`, `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.comm_tmul`, `mathlib:AlternatingMap.map_swap`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iv), (2.4), pp.7–8. The arbitrary-ring affine proof is an authored deduction; it does not establish the correspondence or its global sheaf/Tate/Galois interfaces.

## Affine monoidal scalar extension — current checkpoint

General ringed-site Higgs/constant-parameter connection plan with 197 unchecked nodes. Ten new affine lemmas prove the actual tensor Higgs field commutes with arbitrary scalar extension through the native monoidal comparison, its inverse, all-degree ordered transport, same-exponent preservation and faithfully-flat reflection. Exterior identities compare the two S-fields only. All 187 incoming whole node objects, eight routes, 149 obligations and 35 global omissions remain. H.0 is partial and H.1–H.8 not_read; global sheaf/nonzero-parameter algebra, integral tensor bound, cross-ring exterior curvature, source decomposition and suppliers remain open.

The affine arbitrary-module monoidal scalar-extension comparison for the actual tensor Higgs field is now proved, including its inverse, all-degree ordered transport, specified-exponent preservation, faithfully-flat reflection, and same-S exterior comparison. Still prove the integral ordered tensor bound N+M−1 from positive bounds on the factors, actual cross-ring exterior-power comparison and curvature transport, finite-projective restriction, and E1 sheaf tensor/exterior identification, equality detection and gluing. Same-λ nonzero-parameter balancing, determinant/Tate/period adapters, the general reserved ringed-site carrier, all 149 source obligations and H.1–H.8 remain open. Earlier frontier text is checkpoint history.

For δ_(X,Y), use Mathlib’s existing tensor comparison, with δ(a⊗(x⊗y))=(a⊗x)⊗(1⊗y) and δ⁻¹((a⊗x)⊗(b⊗y))=(ab)⊗(x⊗y). No additional tensor carrier, field, basis or flatness hypothesis is built into the horizontal equation. Integrability and tensor nilpotence remain different predicates. The exterior comparison below is between two S-fields; it is not a claim about scalar extension of ∧²_R Q or original R-curvature.

### Left tensor summand under scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-left` — `TwistedHiggsBundle.affineTensorBaseChange_left`.

For a∈S,z∈E⊗_R Q,f∈F, rightComm_S(δ_(E,Q)(a⊗z)⊗(1⊗f))=(δ_(E,F)⊗id_(Q_S))δ_(E⊗F,Q)(a⊗rightComm_R(z⊗f)).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Tensor induction in z reduces to e⊗q, where native pure-tensor evaluations give both sides ((a⊗e)⊗(1⊗f))⊗(1⊗q). Extend by additivity.

Dependencies: `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`, `mathlib:TensorProduct.rightComm_tmul`, `mathlib:TensorProduct.map_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Right tensor summand under scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-right` — `TwistedHiggsBundle.affineTensorBaseChange_right`.

For a∈S,e∈E,w∈F⊗_R Q, assoc_S⁻¹((a⊗e)⊗δ_(F,Q)(1⊗w))=(δ_(E,F)⊗id_(Q_S))δ_(E⊗F,Q)(a⊗assoc_R⁻¹(e⊗w)).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Tensor induction in w reduces to f⊗q. Apply the actual inverse associator and native scalar-extension evaluation; extend by additivity.

Dependencies: `mathlib:TensorProduct.induction_on`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange_tmul`, `mathlib:TensorProduct.assoc_symm_tmul`, `mathlib:TensorProduct.map_tmul`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Tensor Higgs field commutes with scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change` — `TwistedHiggsBundle.affineTensorField_baseChange`.

T(B_Sθ,B_Sψ)∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S))∘B_S(T(θ,ψ)) as S-linear maps S⊗_R(E⊗_R F)→(E_S⊗_S F_S)⊗_S Q_S.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Use additive tensor induction in S⊗_R(E⊗_R F) and in E⊗_R F. On a⊗(e⊗f), expand the actual tensor field and apply the left and right summand identities. No assertion that the two individual endomorphisms commute is required.

Dependencies: `HodgeStructuresPartII:H.0/affine-base-change`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-tensor-tmul`, `HodgeStructuresPartII:H.0/affine-tensor-base-change-left`, `HodgeStructuresPartII:H.0/affine-tensor-base-change-right`, `mathlib:TensorProduct.induction_on`, `mathlib:LinearMap.baseChange_tmul`.

API `TwistedHiggsBundle.affineTensorField_baseChange` (compatibility): T(B_Sθ,B_Sψ)∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S))∘B_S(T(θ,ψ)) as S-linear maps S⊗_R(E⊗_R F)→(E_S⊗_S F_S)⊗_S Q_S.

API `TwistedHiggsBundle.affineTensorField_baseChange_inverse` (compatibility): B_S(T(θ,ψ))∘δ_(E,F)⁻¹=(δ_(E,F)⁻¹⊗id_(Q_S))∘T(B_Sθ,B_Sψ).

API `TwistedHiggsBundle.affineTensorField_baseChange_ordered` (compatibility): For every n≥0, I_n(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S tensor-power n))∘I_n(B_S(T(θ,ψ))).

API `TwistedHiggsBundle.affineTensorField_baseChange_ordered_zero_iff` (compatibility): For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(B_S(T(θ,ψ)))=0. No flatness or faithful-flatness of S is required for this comparison of two S-fields.

API `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence` (compatibility): For every specified n≥0, if I_n(T(θ,ψ))=0, then I_n(T(B_Sθ,B_Sψ))=0. The same exponent is retained under every R-algebra S, including nonflat scalar extensions.

API `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence_iff` (compatibility): Assume S is faithfully flat over R. For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(T(θ,ψ))=0.

API `TwistedHiggsBundle.affineTensorField_baseChange_exterior` (compatibility): κ_S(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(∧²_S Q_S))∘κ_S(B_S(T(θ,ψ))). Both sides use the same S-exterior coefficient module; no original R-curvature is compared.

API `TwistedHiggsBundle.affineTensorField_baseChange_exterior_zero_iff` (compatibility): κ_S(T(B_Sθ,B_Sψ))=0 if and only if κ_S(B_S(T(θ,ψ)))=0, with no flatness hypothesis. This compares two S-fields, not κ_R(T(θ,ψ)) with its scalar extension.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_zero` (degenerate): For arbitrary R,S,E,F,Q, tensor the scalar extensions of the two zero fields; the actual resulting S-field is zero.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_integer_value` (computation): For R=E=F=Q=ℤ, S=ℚ and θ=ψ:e↦e⊗1, B_S(T(θ,ψ))(2⊗(1⊗1))=(2⊗(1⊗1))⊗(1⊗2). Both scalar tensor summands survive.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_nonflat_tensor` (compatibility): Specialize the actual horizontal equation to ℤ→ZMod 2 and the two unit fields on ℤ. No flatness premise is allowed; the coefficient order and native comparison remain exact.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_torsion_coefficients` (compatibility): Over ℤ use E=ZMod 2, F=ZMod 4 and Q=(ZMod 2)²; for arbitrary actual fields and every n, the two S-fields with S=ZMod 2 have the same n-th iterate vanishing. No coefficient basis or flatness is present.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_degree_zero` (degenerate): For arbitrary fields and ring extension, the two scalar-extended tensor fields have equivalent vanishing of I_0; the empty tensor is the native unit, not a stipulated zero iterate.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_faithful` (compatibility): For faithfully flat S/R, reflect the same specified exponent from the actual tensor of the extended fields to the original R-tensor field; E,F,Q remain arbitrary.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_exterior_scope` (compatibility): For arbitrary S/R, the two actual S-fields have equivalent exterior-integrability. Both exterior powers are over S on Q_S; the test does not assert transport of original R-curvature.

Test `TwistedHiggsBundle.affineTensorField.test_baseChange_nonfaithful_erasure` (non-example): Over ℤ, the tensor of two scalar unit fields on E=F=Q=ℤ is nonzero, but after scalar extension to ZMod 2 the actual tensor of their two extended fields is zero. Unconditional reflection of the original field or its degree-one iterate is false.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Inverse tensor comparison is horizontal

`HodgeStructuresPartII:H.0/affine-tensor-base-change-inverse` — `TwistedHiggsBundle.affineTensorField_baseChange_inverse`.

B_S(T(θ,ψ))∘δ_(E,F)⁻¹=(δ_(E,F)⁻¹⊗id_(Q_S))∘T(B_Sθ,B_Sψ).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Evaluate on x=δ_(E,F)(y), using surjectivity of the existing native equivalence. Apply its inverse tensored with the identity to the forward horizontal equation and cancel the tensor-map composite.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `mathlib:TensorProduct.map_map`, `mathlib:TensorProduct.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Ordered tensor iterates through the monoidal comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered` — `TwistedHiggsBundle.affineTensorField_baseChange_ordered`.

For every n≥0, I_n(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(Q_S tensor-power n))∘I_n(B_S(T(θ,ψ))).

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited all-degree ordered naturality theorem to the actual horizontal equation with module map δ_(E,F) and coefficient identity. Simplify the family tensor of identities, including the empty family at n=0.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-natural`, `mathlib:PiTensorProduct.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Same-exponent vanishing across the tensor comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero` — `TwistedHiggsBundle.affineTensorField_baseChange_ordered_zero_iff`.

For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(B_S(T(θ,ψ)))=0. No flatness or faithful-flatness of S is required for this comparison of two S-fields.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited ordered equivariance zero criterion with actual equivalences δ_(E,F) and id_(Q_S), and the proven tensor horizontal equation.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-equiv`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Specified tensor nilpotence bound survives scalar extension

`HodgeStructuresPartII:H.0/affine-tensor-base-change-nilpotence` — `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence`.

For every specified n≥0, if I_n(T(θ,ψ))=0, then I_n(T(B_Sθ,B_Sψ))=0. The same exponent is retained under every R-algebra S, including nonflat scalar extensions.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Use the inherited arbitrary-coefficient same-exponent scalar-extension preservation for the actual R-tensor field, then the same-exponent S-tensor comparison.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Faithful-flat reflection of the tensor bound

`HodgeStructuresPartII:H.0/affine-tensor-base-change-nilpotence-iff` — `TwistedHiggsBundle.affineTensorField_baseChange_nilpotence_iff`.

Assume S is faithfully flat over R. For every n≥0, I_n(T(B_Sθ,B_Sψ))=0 if and only if I_n(T(θ,ψ))=0.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate. For this reflection lemma only, the native condition Module.FaithfullyFlat R S is required.

Proof: Compose the S-tensor comparison with the inherited actual faithfully-flat scalar-extension reflection for arbitrary coefficient modules. The condition is imposed on S, not on E,F or Q.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change-ordered-zero`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Curvature of the two scalar-extended tensor fields

`HodgeStructuresPartII:H.0/affine-tensor-base-change-exterior` — `TwistedHiggsBundle.affineTensorField_baseChange_exterior`.

κ_S(T(B_Sθ,B_Sψ))∘δ_(E,F)=(δ_(E,F)⊗id_(∧²_S Q_S))∘κ_S(B_S(T(θ,ψ))). Both sides use the same S-exterior coefficient module; no original R-curvature is compared.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited same-ring exterior naturality to the actual S-horizontal equation. Simplify the exterior-power map of the coefficient identity.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-exterior-square-natural`, `mathlib:exteriorPower.map_id`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.

### Integrability across the monoidal tensor comparison

`HodgeStructuresPartII:H.0/affine-tensor-base-change-exterior-zero` — `TwistedHiggsBundle.affineTensorField_baseChange_exterior_zero_iff`.

κ_S(T(B_Sθ,B_Sψ))=0 if and only if κ_S(B_S(T(θ,ψ)))=0, with no flatness hypothesis. This compares two S-fields, not κ_R(T(θ,ψ)) with its scalar extension.

R and S are arbitrary commutative rings with an R-algebra structure on S; E,F,Q are arbitrary R-modules. θ:E→E⊗_R Q and ψ:F→F⊗_R Q are actual R-linear fields. No integrability, coefficient basis, finite generation, projectivity, flatness, reducedness or characteristic hypothesis is imposed unless explicitly stated. Write E_S=S⊗_R E, F_S=S⊗_R F and Q_S=S⊗_R Q. Let δ_(X,Y):S⊗_R(X⊗_R Y)≃X_S⊗_S Y_S be the existing native distribBaseChange, B_S(θ)=δ_(E,Q)∘(id_S⊗θ) the inherited affineBaseChange, T the inherited actual tensor field, and I_n its ordered iterate including the tensor-unit degree n=0. The exterior statements compare the two actual S-linear fields B_S(T(θ,ψ)) and T(B_Sθ,B_Sψ) through δ_(E,F); both exterior powers are taken over S on Q_S. They do not identify S⊗_R∧²_R Q with ∧²_S Q_S, nor prove preservation/reflection of original R-curvature. Sheaf tensors, sections, restrictions/gluing and nonzero parameters remain separate.

Proof: Apply the inherited exterior equivariance criterion with native module equivalence δ_(E,F), coefficient identity equivalence, and the tensor horizontal equation.

Dependencies: `HodgeStructuresPartII:H.0/affine-tensor-base-change`, `HodgeStructuresPartII:H.0/affine-exterior-square-equiv`.

Source: Liu–Zhu, [arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1(iii)–(iv), (2.4), pp.7–8. This arbitrary-ring affine proof is an authored deduction, not a source correspondence or global sheaf proof.
