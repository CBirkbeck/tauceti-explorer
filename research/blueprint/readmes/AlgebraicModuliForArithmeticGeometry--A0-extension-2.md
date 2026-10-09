# Higher-dimensional moduli prerequisites

This part of Algebraic moduli and representability for arithmetic geometry builds general Picard spaces, their neutral components and the approximation inputs of the Artin representability criteria. It also supplies perfect cohomology over arbitrary bases, analytification of algebraic spaces, and the arithmetic Cartier and fractional-coefficient adapters used by the modularity applications.

The stage is **AlgebraicModuliForArithmeticGeometry:A0-extension**. The six existing relative-Picard targets supply sheafification, base change, the middle kernel and section-rigidified splitting. General proper coherent cohomology over locally Noetherian bases, in every relative dimension, is supplied by **JacobianChallenge Layer C** and **StableReduction Layer 2**. The cohomological contribution here is the finite-presentation and perfect-complex extension over arbitrary bases. General coherent duality has the single owner **SchemeAndStackFoundations:SF.2**. The Picard component's identification with the dual of an abelian scheme belongs to **AbelianSchemesAndArithmeticModuli:A2**; PEL and Hilbert–Siegel representability checks belong to **PELModuli:M2** and **HilbertSiegelArithmeticModuli:H1**.

Use cohomological indexing: V[−i] has V in degree i. All sheaves carry their full structure, including nilpotents. Relative Picard classes are fppf sheafified classes; a relative class over an arbitrary base need not have a global line-bundle representative. A Picard stack retains automorphisms. A complete-local formal object includes all orders and coherent transition data; a finite jet alone is not a formal object.

## Imported targets and order


**All-dimensional locally Noetherian proper coherent cohomology.** Existing work imported in all dimensions.
Suppliers: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Relative Picard, Pic⁰ and effectivity criteria.** The basic relative sheaf and section comparison are imports.
Suppliers: `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`.

**Étale-presentation analytification and local comparisons.** Scheme constructions supply the charts.
Suppliers: `tauceti:TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison#layer-2-complex-analytic-spaces-and-analytification`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R3`.

**Finite normalization under excellence.** Nagata finiteness is an import.
Suppliers: `SchemeAndStackFoundations:SF.0/quasi-excellent-nagata`, `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`.

**PEL and abelian-specific checks.** Owned downstream by PELModuli:M2, HilbertSiegelArithmeticModuli:H1 and AbelianSchemesAndArithmeticModuli:A2, they import these general criteria.

**Routed arithmetic prerequisites.** The adapters below use the general duality supplier.
General coherent duality supplier: `SchemeAndStackFoundations:key/coherent-duality`.

The existing complex scheme construction is [ComplexComparison, Layers 0–2](https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/README.md), read at head `4bd72379658126cbe9be935656396f0c9dac4de0`. It covers all finite-type complex schemes, nilpotents, fibre products and étale local biholomorphisms. Its exact contract is an import; it is not rebuilt here. Scheme nonarchimedean analytification and proper GAGA come from **AdicSpacesPartII:R1/R3**.

The construction order is SF.0 G-rings and Popescu → A0 approximation → A0 Artin criterion → R09.4 coherent-sheaf moduli → A0 Picard targets. R09.6 consumes this approximation prefix. The criterion prefix precedes coherent-sheaf moduli, which precedes the Picard conclusions. EnhancedDerivedSheaves is a separate tier-4 unit; the lower SF.2 space substrate is the required derived supplier.

The six imported nodes are:

- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/rigidified-picard-setoid`
- `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`

## Approximation and algebraicity

### Finite type permanence of G-rings

**Theorem: gRing_essentiallyFiniteType.** If R is a Noetherian G-ring and R→B is essentially of finite type, B is a G-ring. In particular the local rings of a finite-type scheme over a G-ring have geometrically regular formal fibres.

**Hypotheses and conventions.** R is Noetherian; G-ring means regularity of each local completion map.

**Inputs.** `SchemeAndStackFoundations:SF.0/g-ring`, `SchemeAndStackFoundations:SF.0/regular-map-completion`.

**Argument.** Use the localization and quotient permanence of formal-fibre regularity. Reduce to one polynomial variable, compare completions after the regular base change R→R̂, and check geometric regularity of fibres as in 07PV. This polynomial permanence is a key theorem here, not a consequence assumed in the Artin criterion.

**Acceptance.** A non-excellent G-ring is allowed; universal catenarity and J-2 are not hypotheses.

**Source.** [The Stacks Project authors, The Stacks Project: More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf), Proposition 15.51.10, tag 07PV, pp. 129–131. Preservation under essentially finite-type maps is the missing prerequisite of approximation.

### Approximation over local G-rings

**Theorem: polynomial_approximation.** Let (R,m) be Noetherian local and a G-ring. Every solution in R̂ of a finite polynomial system over R can, for each N≥1, be approximated modulo m^N by a solution in a pointed étale R-algebra R′ with the same residue field. If R is henselian the solution can be chosen in R itself.

**Hypotheses and conventions.** Finitely many equations and variables; N≥1; the completion of R′ at its specified point is identified with R̂.

**Inputs.** `SchemeAndStackFoundations:SF.0/popescu-desingularization`, `SchemeAndStackFoundations:SF.0/regular-map-completion`, `AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type`.

**Argument.** Encode congruence by auxiliary variables and chosen generators of m^N. Factor the resulting finitely presented solution algebra through a smooth R-algebra using SF.0 Popescu. Lift its residue-field point after an étale base change; henselian lifting gives an R-point in the henselian case.

**Acceptance.** Retain the pointed étale extension for a nonhenselian ring; a solution in R is not asserted there.

**Source.** [The Stacks Project authors, The Stacks Project: Smoothing Ring Maps](https://stacks.math.columbia.edu/download/smoothing.pdf), Theorems 16.13.1–16.13.2, tags 07QY–07QZ, pp. 32–34. Finite congruence approximation follows from regular completion and smooth factorization.

### Common étale neighbourhoods

**Theorem: common_etale_neighbourhood.** For schemes X₁,X₂ locally of finite type over a field or an excellent discrete valuation ring S, pointed at finite-type points with a specified S-isomorphism of completed local rings, there is a common pointed S-scheme U with étale maps to X₁ and X₂ inducing residue-field isomorphisms. Any fixed finite jet of the specified formal isomorphism can be matched; equality of the entire formal map is not promised.

**Hypotheses and conventions.** The points have identified residue fields and lie over the same point of S; the given isomorphism respects S.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/polynomial-approximation`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Approximate the finitely presented equations defining the formal graph and its inverse. Invert the Jacobian conditions to obtain étale projections and preserve the prescribed finite jet. Compare completions at the common point; no assertion that every chosen formal automorphism is algebraic is needed.

**Acceptance.** Over C this applies to nonreduced finite-type schemes, not only smooth varieties.

**Source.** [Michael Artin, Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf), Corollaries 2.5–2.6, pp. 28–29; Theorem 1.10, p. 26. The original common-neighbourhood conclusion has the indicated classical base hypotheses.

### Strong infinitesimal gluing

**Definition: StrongInfinitesimalGluing.** For a covariant affine functor F from commutative rings to sets, RS* means that F(A×_C B)→F(A)×_{F(C)}F(B) is bijective for every cospan A→C←B with B→C surjective and square-zero kernel. For a category fibred in groupoids use equivalence with the 2-fibre product, retaining the gluing isomorphism.

**Hypotheses and conventions.** Use a fixed universe; the relative version uses rings over the affine base.

**Inputs.** `mathlib:CategoryTheory.Limits.pullbackComparison`, `mathlib:CommRingCat.pullbackConeIsLimit`, `SchemeAndStackFoundations:SF.4/hull`.

**Argument.** Use the actual ring pullback and canonical comparison, not a chosen bijection. For stacks replace the ordinary fibre product by the 2-fibre product. Filtering an Artinian nilpotent kernel by square-zero ideals implies the local RS condition required by the criterion.

**Acceptance.** Forgetting commutative rings satisfies this condition.

**API.**

- **StrongInfinitesimalGluing.of_preservesLimits** (compatibility): A functor preserving finite limits satisfies RS*.
- **StrongInfinitesimalGluing.comparison_bijective** (characterisation): Each permitted ring pullback has a bijective canonical comparison.
- **StrongInfinitesimalGluing.transport** (functoriality): A natural isomorphism of functors transports RS*.

**Unit tests.**

- **StrongGluingTests.forget** (compatibility): The commutative-ring forgetful functor satisfies RS*.
- **StrongGluingTests.terminal** (degenerate): The terminal constant functor satisfies RS*.
- **StrongGluingTests.zeroKernel** (computation): For A→C←C with the second map the identity, the comparison is bijective.

**Uses.** Artin 98.22.2: Provides module-valued obstruction functors and openness of versality. Artin 98.16.1 and 98.17.1: Implies the local RS hypothesis without losing isomorphism data in the stack case.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), 98.18, pp. 28–29; 98.5–98.6, pp. 5–8. The stronger all-square-zero condition implies the classical Rim–Schlessinger condition.

### Compatible formal points

**Definition: FormalPoint.** For an affine set-valued functor F, a ring R and ideal I, FormalPoint(F,R,I) consists of ξ_n∈F(R/I^(n+1)) for every n≥0, compatible with every quotient transition. Restriction sends x∈F(R) to its family. In the geometric criterion take I=m_R, R complete Noetherian local over S, and residue field finite type over S.

**Hypotheses and conventions.** The affine prototype has no completeness restriction; the criterion adds it explicitly. For stacks replace equality compatibility by coherent pullback isomorphisms in the formal-object groupoid.

**Inputs.** `mathlib:Ideal.Quotient.factorPow`, `SchemeAndStackFoundations:SF.4/formal-completion`.

**Argument.** Use positive quotient powers, hence never the uninformative R/I^0 stage. Use the quotient transition ring maps to impose compatibility at all orders. Construct the restriction family by functoriality.

**Acceptance.** A single truncated jet does not supply a formal point.

**API.**

- **FormalPoint.ofPoint** (constructor): Restrict an actual point to every positive quotient power.
- **FormalPoint.ext** (extensionality): Equality of every component implies equality of formal points.
- **FormalPoint.ofPoint_value** (simp): The n-th component is restriction along R→R/I^(n+1).
- **FormalPoint.transition** (compatibility): Restriction from the m-th component to the n-th agrees for n≤m.

**Unit tests.**

- **FormalPointTests.affineLine** (computation): For the ring forgetful functor the components are x modulo I^(n+1).
- **FormalPointTests.terminal** (degenerate): The terminal functor has only one formal point.
- **FormalPointTests.allOrders** (characterisation): Agreement at every order forces equality of compatible families.

**Uses.** Artin 98.10.1: Approximation uses an actual complete-local point and its finite jets. Artin 98.16.1: Effectivity is required for every compatible formal family.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definition 98.9.1, pp. 11–12; Section 98.15, pp. 25–26. The full compatible tower, together with local-ring hypotheses, is the input to effectivity.

### Effectivity of formal points

**Definition: IsEffective.** Affine set-valued effectivity at (R,I) is surjectivity of F(R)→FormalPoint(F,R,I). The Artin space criterion quantifies this over all complete Noetherian local S-algebras with finite-type residue field. For a stack, effectivity means essential surjectivity of restriction to its formal-object groupoid. The stronger equivalence interface also retains unique compatible lifting of morphisms; with represented diagonal this is the standard supplied effectivity interface.

**Hypotheses and conventions.** Use the restriction map of formal-point, not a separately postulated algebraization predicate.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/formal-point`, `SchemeAndStackFoundations:SF.4/grothendieck-existence`.

**Argument.** Define the affine predicate by the actual restriction map. For the stack version retain isomorphisms at each order; Grothendieck existence for proper coherent modules is the geometric source, extended to spaces by a supplier request.

**Acceptance.** The set-valued prototype does not certify fully faithful restriction for stacks.

**API.**

- **IsEffective.iff_lift** (characterisation): Every formal point is the restriction of an actual point.
- **IsEffective.lift** (constructor): Choose a realizing point from an effectivity proof.
- **IsEffective.lift_spec** (compatibility): The chosen lift restricts to the specified whole formal family.

**Unit tests.**

- **EffectivityTests.terminal** (degenerate): The terminal functor is effective for any ideal.
- **EffectivityTests.zeroIdeal** (compatibility): For I=0, quotient powers are R and any functor is effective.
- **EffectivityTests.topIdeal** (computation): The affine-line functor is effective at I=R because every quotient is the zero ring.

**Uses.** Artin 98.16.1 and 98.17.1: One of the selected criterion hypotheses. Picard algebraicity: Formal invertible modules must be algebraized together with their isomorphisms.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definition 98.9.4 and Lemma 98.9.5, pp. 12–14; 98.14 and 98.17.1, pp. 24–27. Effectivity must not be weakened to existence of independent lifts at each finite order.

### The tangent fibre

**Definition: TangentFiber.** For x∈F(k), define the tangent fibre as the fibre over x of F(k[ε]/ε²)→F(k), with zero tangent given by the split inclusion k→k[ε]/ε². For a stack take isomorphism classes of lifts with a specified identification with x; infinitesimal automorphisms are the kernel of the automorphism restriction of the split lift. RS supplies their natural k-vector-space structures.

**Hypotheses and conventions.** k is a field; relative functors and dual numbers are taken over the base.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing`, `mathlib:TrivSqZeroExt`, `SchemeAndStackFoundations:SF.4/hull`.

**Argument.** Use the native trivial square-zero extension and its first projection. Fix the residue point before forming the fibre. Use addition and scalar maps of square-zero extensions to induce the vector-space structure through RS; the native prototype specifies the underlying fibre only.

**Acceptance.** For F equal to the affine-line point functor the fibre is k, rather than k×k.

**API.**

- **TangentFiber.zero** (constructor): The split lift is a tangent element over x.
- **TangentFiber.ext** (extensionality): Two tangent elements with equal underlying lift are equal.
- **TangentFiber.map** (functoriality): A natural transformation induces a map between the corresponding tangent fibres.

**Unit tests.**

- **TangentTests.affineLine** (computation): The affine-line tangent fibre at x is equivalent to k via the ε coefficient.
- **TangentTests.terminal** (degenerate): The terminal functor has a one-element tangent fibre.
- **TangentTests.zeroRestriction** (compatibility): The split tangent element restricts to the specified residue point.

**Uses.** Artin 98.16.1 and 98.17.1: Finite dimension of tangent and automorphism spaces is an explicit criterion input. Picard infinitesimal lifting: Line-bundle tangent classes are H¹ of the structure sheaf.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), 98.8, pp. 9–11. The framing at x is essential; tangent and infinitesimal automorphism spaces are separate.

### Module-valued obstruction theories

**Definition: ModuleObstructionTheory.** For x∈X(Spec A), A Noetherian over S, an obstruction theory assigns an A-linear functor O_x on A-modules, natural in module maps, and to each square-zero extension A′→A of kernel M a class ob_x(A′)∈O_x(M), compatible with pushout of extensions. Its class vanishes exactly when the groupoid of lifts of x with specified identification is nonempty. T_x(M) and Inf_x(M) respectively describe differences between liftings and their infinitesimal automorphisms.

**Hypotheses and conventions.** For the openness theorem use the full module-functor axioms of 98.22.1, including naturality in extensions and in the object; the finite-dimensional Artin-local obstruction space of SF.4 alone is insufficient.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing`, `AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre`, `SchemeAndStackFoundations:SF.4/obstruction-theory`.

**Argument.** Use actual square-zero extensions, not a flag asserting liftability. Define the framed lifting groupoid and its pushout along a kernel map. Extend the local-Artin obstruction interface to finite Noetherian base algebras and modules; retain the full product comparisons needed by openness.

**Acceptance.** The zero obstruction class means existence of a framed lift, not uniqueness.

**API.**

- **ModuleObstructionTheory.pushout** (functoriality): A map M→N sends the obstruction to that of the pushed-out extension.
- **ModuleObstructionTheory.zero_iff_lift** (characterisation): The obstruction vanishes exactly when a framed lift exists.
- **ModuleObstructionTheory.lifting_torsor** (relation): If lifts exist their framed isomorphism classes form a torsor under T_x(M), with Inf_x(M) their infinitesimal automorphisms.

**Unit tests.**

- **ObstructionTests.split** (computation): A split extension has zero obstruction and its split lift exists.
- **ObstructionTests.zeroKernel** (degenerate): A zero-kernel extension has the original object as lift.
- **ObstructionTests.curveLineBundle** (compatibility): For a line bundle on a proper smooth curve over k, O_x(M)=H²(X,O_X)⊗M=0, though H¹ may parametrize different lifts.

**Uses.** Artin 98.22.2: Product compatibility converts formal versality to an open locus. AbelianSchemesAndArithmeticModuli:A2: Applications must verify their own deformation conditions; H²=0 is sufficient, not necessary.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Definition 98.22.1, pp. 38–40. This is the general module-valued interface used in openness of versality.

### Approximation of complete-local objects

**Theorem: formal_object_approximation.** Let S be locally Noetherian, X a category fibred in groupoids limit preserving on objects, R a complete Noetherian local S-algebra with finite-type residue field, and x∈X(R). If O_{S,s} is a G-ring at the image s, then for every N≥1 there are a finite-type S-algebra A, a maximal ideal m_A, an object x_A, and an S-isomorphism R/m_R^N≅A/m_A^N identifying the restrictions of x and x_A. One can also identify the associated graded rings at the specified points.

**Hypotheses and conventions.** The algebra A is over an affine neighbourhood of s; residue fields are identified. This is finite-order approximation, not an isomorphism R≅A or full algebraization of x.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/g-ring-finite-type`, `AlgebraicModuliForArithmeticGeometry:A0-extension/polynomial-approximation`.

**Argument.** Descend x to a finitely presented algebra by limit preservation on objects. Present R as a quotient of a completed polynomial local algebra; encode kernel generators and syzygies. Use Artin–Rees and sufficiently accurate polynomial approximation to preserve the requested jet and the associated graded ring.

**Acceptance.** The same finite-order statements retain nilpotents and automorphism-bearing objects.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.10.1, tag 07XB, pp. 14–16. This is the approximation input used before converting formal versality into a smooth algebraic chart.

### Openness of versality from obstructions

**Theorem: openness_of_versality.** Let X be a category fibred in groupoids over locally Noetherian S with representable diagonal, RS*, limit preservation and a module-valued obstruction theory. Suppose for every Noetherian A, x and family (M_i) of A-modules the map T_x(∏M_i)→∏T_x(M_i) is an isomorphism and O_x(∏M_i)→∏O_x(M_i) is injective. For an object over a finite-type S-scheme U, its formal versality at a finite-type point implies versality at all finite-type points in some open neighbourhood.

**Hypotheses and conventions.** Formal versality is the smooth lifting property of its complete-local deformation functor, as in SF.4 hull; retain both product conditions and the representable diagonal.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/module-obstruction-theory`, `AlgebraicModuliForArithmeticGeometry:A0-extension/strong-infinitesimal-gluing`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Use the tangent comparison to identify simultaneous lift differences. Use injectivity of the obstruction comparison to detect simultaneous vanishing. Apply the finite-presentation algebra and openness argument of 0CYF; do not infer openness merely from finite-dimensional tangent spaces.

**Acceptance.** No H²-vanishing hypothesis is substituted for the stated obstruction product condition.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.22.2, tag 0CYF, pp. 40–42. The explicit sufficient hypotheses produce precisely the openness axiom of the selected criterion.

### Artin representability for spaces

**Theorem: artin_space_criterion.** An étale sheaf F:(Sch/S)^op→Sets satisfying the listed hypotheses is an algebraic space locally of finite presentation over S. Limit preservation means colim F(Spec A_i)→F(Spec colim A_i) is bijective for every filtered system of affine S-algebras.

**Hypotheses and conventions.** F is an étale sheaf. S is locally Noetherian; O_{S,s} is a G-ring for every finite-type point s. A fixed universe bounds the cardinalities of finite-type field fibres. The diagonal is representable by algebraic spaces. The functor preserves filtered affine limits, satisfies local RS, and all finite-type field tangent spaces are finite dimensional. Every complete-Noetherian-local formal object with finite-type residue field is effective, and versality for finite-type families is open.

**Inputs.** `mathlib:CategoryTheory.Limits.PreservesFilteredColimits`, `AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation`, `AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre`, `SchemeAndStackFoundations:SF.4/hull`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Construct formal versal hulls from RS and finite tangent spaces using SF.4. Use effectivity to realize the compatible formal point and approximation to obtain a finite-type family with the prescribed tangent jet. Use the openness hypothesis and representable diagonal to obtain smooth charts. The sufficient obstruction criterion is openness-versality. Take the bounded coproduct of charts at finite-type field points, prove surjectivity by openness, and apply the SF.1 smooth-presentation bootstrap; limit preservation supplies local finite presentation.

**Acceptance.** An algebraic space is the conclusion; no projectivity or scheme representability follows.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Proposition 98.16.1, tag 07Y1, p. 26; Sections 98.13 and 98.15, pp. 20–26. The selected criterion includes all seven axioms and represented diagonal.

### Artin representability for stacks

**Theorem: artin_stack_criterion.** An étale stack in groupoids X over S satisfying the listed hypotheses admits a smooth surjective atlas by schemes and is an algebraic stack locally of finite presentation over S. Limit preservation is equivalence of the 2-colimit of affine fibre groupoids with the fibre over the filtered colimit.

**Hypotheses and conventions.** X is a stack for the étale topology. S is locally Noetherian; O_{S,s} is a G-ring for every finite-type point s. A fixed universe bounds the cardinalities of both isomorphism classes and arrows over finite-type fields. The diagonal is representable by algebraic spaces. The functor preserves filtered affine limits, satisfies local RS, and all finite-type field tangent and infinitesimal automorphism spaces are finite dimensional. Every complete-Noetherian-local formal object with finite-type residue field is in the essential image of restriction, and versality for finite-type families is open.

**Inputs.** `DiamondsAndVStacks:D0`, `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:A0-extension/formal-object-approximation`, `AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/tangent-fibre`, `SchemeAndStackFoundations:SF.4/hull`.

**Argument.** Construct versal deformation hulls, retaining infinitesimal automorphisms. Use essential effectivity, approximation and open versality to obtain smooth charts. Represented diagonal identifies Isom sheaves with spaces and supplies fully faithful compatible restriction of morphisms. Take the bounded coproduct, test surjectivity at finite-type points after base change, and conclude algebraicity.

**Acceptance.** Do not replace the represented diagonal by a represented double diagonal without the additional hypotheses of 98.17.2.

**Source.** [The Stacks Project authors, The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf), Lemma 98.17.1, tag 07Y4, p. 27; Section 98.14, pp. 24–25. This avoids the weaker-diagonal variant and its extra versality conditions.

## Perfect cohomology over arbitrary bases

### Perfect pushforward and arbitrary base change

**Theorem: perfect_proper_pushforward.** Let f:X→Y be a finitely presented morphism of algebraic spaces. Let E be perfect on X and G• a bounded complex of finitely presented O_X-modules, termwise flat over Y, each with support proper over Y. Then Rf_*(E⊗^L G•) is perfect on Y. For every Y′→Y the derived base-change comparison to Rf′_*(E′⊗^L G′•) is an isomorphism. In particular this holds for Rf_*E when f is proper, flat and finitely presented.

**Hypotheses and conventions.** No Noetherian hypothesis on Y; boundedness, finite presentation, target-flatness and proper supports are all retained.

**Inputs.** `SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category`, `SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh`, `SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom`, `SchemeAndStackFoundations:SF.2/tor-independent-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Argument.** Étale locally reduce Y to affine and descend the finite-presentation data to a Noetherian model. Apply the existing all-dimensional locally Noetherian cohomology/base-change package on that model. Use finite locally free complex models, target-flatness and derived pullback to compare every base change, then descend perfectness on Y.

**Acceptance.** The closed immersion Spec k→Spec k[ε]/ε² with G=k is excluded because G is not Y-flat. Its pushforward is not perfect.

**Source.** [The Stacks Project authors, The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemma 75.25.1, tag 0A1P, pp. 60–61; Lemma 75.25.4, tag 0CTM, p. 61, corrected. This is the arbitrary-base extension, not a replanning of the locally Noetherian theorem.

### Fibre Betti numbers and Euler characteristic

**Theorem: fibre_betti_semicontinuity.** For a perfect complex K on an algebraic space Y, β_i(y)=dim_{κ(y)}H^i(K⊗^Lκ(y)) is upper semicontinuous, étale locally constructible, and invariant under arbitrary residue-field extension. The finite alternating sum χ(K_y)=Σ_i(−1)^iβ_i(y) is locally constant. Apply this to the perfect pushforwards above.

**Hypotheses and conventions.** Finite Tor amplitude is imposed locally, so the Euler sum is finite; the fibre is derived.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category`.

**Argument.** Represent K locally by a bounded finite locally free complex. Compute differential ranks by determinantal ideals and their changes under field extension. Subtract successive ranks for β_i and cancel them in the alternating sum.

**Acceptance.** For O_Y⊕O_Y[−1], the Euler characteristic is zero although there are two nonzero Betti numbers.

**Source.** [The Stacks Project authors, The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemmas 75.26.1–75.26.3, pp. 62–64. Fibre invariants are consequences of perfectness without a Noetherian base.

### The single degree free locus

**Theorem: single_degree_free_locus.** For a perfect complex K on Y, a fixed integer i and rank r≥0, the condition that K_y has cohomology only in degree i and β_i(y)=r is represented by an open subspace U⊂Y. Universally for T→Y it means K_T≅V[−i] for a locally free rank-r module V on T. This equivalence is local on T and commutes with arbitrary base change.

**Hypotheses and conventions.** Use a perfect K; the condition covers all degrees, not merely β_i=r.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/fibre-betti-semicontinuity`, `SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category`.

**Argument.** Split invertible blocks in a finite free complex near the specified fibre. Discard its contractible summands to isolate the single free module. Prove the resulting locus represents the condition after all base changes.

**Acceptance.** A complex with another nonzero cohomology degree is excluded even if β_i=r.

**Source.** [The Stacks Project authors, The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemma 75.26.4, pp. 64–65. This represents concentration and freeness, not a numerical rank condition alone.

### The lowest degree rank stratum

**Theorem: lowest_degree_rank_stratum.** Let K be perfect of Tor amplitude [a,b]. The locus β_a=r has a finitely presented locally closed structure representing, for every T→Y, the condition that H^a(K_T) is locally free of rank r and its formation commutes with every further base change. On the open β_a≤r locus this stratum is closed.

**Hypotheses and conventions.** a≤b and r≥0; use cohomological degree a, even when a≠0.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/fibre-betti-semicontinuity`, `SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category`.

**Argument.** Use a finite free complex in degrees a,…,b and the determinantal locus of its first differential. The rank condition yields a free kernel with arbitrary-base-change compatibility. Construct its universal locally closed scheme structure and descend étale locally.

**Acceptance.** K=O_Y[−a], a≠0, has β_a=1 on all Y and H⁰=0. The rank condition must concern H^a.

**Source.** [The Stacks Project authors, The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemma 75.26.6, tag 0D21, pp. 65–66, corrected in its final clause. The lowest cohomological degree is retained; E2002 records the printed H⁰ misprint.

### Universal functions from geometric fibres

**Theorem: universal_functions.** If f:X→Y is proper, flat and finitely presented with geometrically reduced, geometrically connected fibres, then O_T→(f_T)_*O_{X_T} is an isomorphism for every T→Y. More generally the same conclusion holds when H⁰(X_k,O)=k for every field-valued point Spec k→Y. Étale locally Rf_*O_X splits as O_Y⊕P with P perfect of Tor amplitude at least 1.

**Hypotheses and conventions.** The field-valued test is quantified over every point; geometric connectedness alone without geometric reducedness does not suffice.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `AlgebraicModuliForArithmeticGeometry:A0-extension/single-degree-free-locus`.

**Argument.** Apply the perfect complex theorem to O_X. Split its unit summand after detecting a one-dimensional H⁰ and a unit nonzero in every field fibre. The complementary positive-amplitude complex has no H⁰ after any base change.

**Acceptance.** For a finite nontrivial residue-field extension, geometric connectedness fails and the unit is not an isomorphism.

**Source.** [The Stacks Project authors, The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemmas 75.26.7–75.26.8, p. 66. This supplies exactly the universal-function hypothesis of the Picard representability theorem.

## Picard spaces and their neutral components

### The Picard stack on algebraic spaces

**Definition: PicardStackSpaces.** For f:X→B define the stack whose fibre over T→B is the groupoid of invertible O_{X_T}-modules with all isomorphisms, and whose pullback functors are pullback of invertible modules. Tensor product, the structure sheaf and duals make this a commutative group stack. It is not the discrete groupoid on the relative Picard sheaf.

**Hypotheses and conventions.** X and B are algebraic spaces; invertible modules are taken on their small étale ringed sites; morphisms include line-bundle automorphisms.

**Inputs.** `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `AlgebraicModuliForArithmeticGeometry:R09.3/space-quasicoherent-modules`, `DiamondsAndVStacks:D0`.

**Argument.** Import the scheme/curve Picard-groupoid construction, and extend invertible-module pullback to the SF.1 algebraic-space ringed site through R09.3. Use fpqc descent of invertible modules and their isomorphisms to obtain stack descent. Tensor coherence is inherited from invertible-module tensor products, not from isomorphism classes.

**Acceptance.** The automorphism group of the trivial line bundle over Spec k is k×, not the trivial group.

**API.**

- **PicardStackSpaces.ofLineBundle** (constructor): An invertible module on X_T defines an object in the fibre over T.
- **PicardStackSpaces.pullback** (functoriality): Pullback respects tensor, unit and composition up to the canonical coherent isomorphisms.
- **PicardStackSpaces.automorphism** (compatibility): Automorphisms of a line bundle are Γ(X_T,O_X_T×); under universal functions this is Γ(T,O_T×).

**Unit tests.**

- **PicardStackTests.point** (computation): For X=B=Spec k the fibre stack is B G_m, although the relative Picard sheaf is zero.
- **PicardStackTests.disjointPoints** (computation): For two points over k the trivial line bundle has automorphism group k××k×.
- **PicardStackTests.baseChange** (compatibility): Restricting the stack to Sch/T agrees with the Picard stack of X_T/T.

**Uses.** Artin/Picard representability: Provides actual objects, diagonal Isom sheaves and formal groupoids. Schröer Section 5: The class sheaf is obtained after discarding and sheafifying automorphisms.

**Source.** [The Stacks Project authors, The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), Section 99.10, tag 0D02, p. 26. The space-valued family has a Picard stack distinct from the sheaf of classes.

### Algebraicity of the Picard stack

**Theorem: picard_stack_algebraic.** If f:X→B is proper, flat and finitely presented, the Picard stack is algebraic, quasi-separated and locally of finite presentation over B. It is the open substack of Coh_{X/B} consisting of invertible modules.

**Hypotheses and conventions.** No global section, Noetherian base or projectivity is required. The ambient coherent-sheaf stack parametrizes finitely presented T-flat modules with support proper over T.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Import the general Coh_{X/B} algebraicity theorem from its R09.4 owner. Invertibility is open in a flat finitely presented family; the complement of its locus has proper image in T. Restrict the coherent-sheaf stack to that open substack and import its local finite presentation and quasi-separatedness.

**Acceptance.** Proper algebraic spaces are not assumed to be projective schemes.

**Source.** [The Stacks Project authors, The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.10.1, tag 0D02, p. 26; Moduli 108.8.2, p. 13. Algebraicity comes from the coherent-sheaf moduli stack, with invertibility an open condition.

### The torsor of rigidifications

**Theorem: rigidification_gm_torsor.** For proper flat finitely presented X→B with a section σ, the map from the stack of σ-rigidified line bundles to the Picard stack is representable, smooth and surjective: over L on X_T its fibre is the G_m-torsor of trivializations of σ_T*L. This conclusion does not require universal functions.

**Hypotheses and conventions.** Rigidification is an isomorphism O_T≅σ_T*L; a global trivialization need not exist on T.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces`, `SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves`.

**Argument.** Pull back along an arbitrary object L. Identify the fibre with the sheaf of trivializations of its invertible module on T. This is a G_m-torsor, hence represented smoothly and surjectively.

**Acceptance.** The fibre over a nontrivial invertible module is locally inhabited but may have no global section.

**Source.** [The Stacks Project authors, The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.11.6, pp. 28–29. This separates local existence of rigidifications from triviality of rigidified automorphisms.

### Representability of the relative Picard sheaf

**Theorem: relative_picard_algebraicSpace.** If f:X→B is proper, flat and finitely presented and O_T→(f_T)_*O_{X_T} is an isomorphism for every T→B, its relative fppf Picard sheaf is an algebraic space, quasi-separated and locally of finite presentation over B. It remains the sheafification of line-bundle classes modulo base classes; arbitrary T-points need not be represented by a line bundle.

**Hypotheses and conventions.** Universal functions is an arbitrary-base-change condition. Neither a section nor geometrically integral fibres are required.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-base-change`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-algebraicity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/rigidification-gm-torsor`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Fppf locally on B obtain sections by covering from X and use the rigidified Picard stack. Universal functions kills its rigidified automorphisms, so the stack is an algebraic space and agrees with the relative class sheaf by the prior splitting theorem. Descend algebraic-space representability and local finite presentation; use the diagonal description for quasi-separatedness.

**Acceptance.** With a global section the representing space recovers rigidified line-bundle classes. Without it the Brauer obstruction is retained.

**Source.** [The Stacks Project authors, The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.11.8, pp. 29–30; Moduli 108.9.3, p. 14. The general arbitrary-base representability conclusion is an algebraic space.

### Separation of the Picard space

**Theorem: relative_picard_separated.** Under the preceding Picard hypotheses its diagonal is a quasi-compact immersion, hence it is locally separated. If every geometric fibre of X→B is integral, the Picard space is separated over B.

**Hypotheses and conventions.** For the separatedness statement geometric integrality is required; normality is not added. Universal functions remains in force.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`, `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Express the diagonal as the locus of relative equality of line-bundle classes, computed by sections of L and L⁻¹. Use perfect pushforward and rank loci for its immersion and quasi-compactness. For a valuation-ring test, two positive section spaces on an integral fibre force a line bundle generically trivial and relatively equal to zero; conclude the properness of the diagonal.

**Acceptance.** A reducible family does not inherit separated Picard merely from properness of X.

**Source.** [The Stacks Project authors, The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf), Lemma 99.11.9, p. 30; Moduli 108.9.2–108.9.4, pp. 14–15. The geometric-integrality refinement gives the exact separatedness criterion.

### Infinitesimal lifting of line bundles

**Theorem: picard_infinitesimal_lifting.** Let X₀ be proper over k and X_A⊂X_A′ a flat small Artinian thickening of kernel I annihilated by the maximal ideal. For a line bundle L_A the obstruction to a lift with specified reduction lies in H²(X₀,O_X₀)⊗_k I. When it vanishes, framed lift classes form a torsor under H¹(X₀,O_X₀)⊗I and infinitesimal automorphisms are H⁰(X₀,O_X₀)⊗I. Extend the existing scheme statement to algebraic spaces by étale descent.

**Hypotheses and conventions.** Use framed lifts. Unframed fibres of Pic(X_A′)→Pic(X_A) can be quotients by unit boundary maps. H²=0 is sufficient for smoothness, not a necessary condition.

**Inputs.** `SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces`, `SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison`, `AlgebraicModuliForArithmeticGeometry:A0-extension/module-obstruction-theory`.

**Argument.** On the ringed étale site use the square-zero unit sequence 1→1+I O_X₀→O_X_A′×→O_X_A×→1. Identify 1+I O_X₀ with the additive quasi-coherent module and read the connecting classes. Import the scheme calculation and descend it on space charts, retaining the framing and automorphisms.

**Acceptance.** For a proper smooth curve H²=0, but H¹ can have positive dimension and lifts are not unique.

**Source.** [Steven L. Kleiman, The Picard scheme](https://arxiv.org/pdf/math/0504020), Proposition 5.19, p. 47; Stacks Moduli 108.4.1, pp. 5–6. The higher-dimensional obstruction calculation explains the smoothness hypothesis used by Pic⁰.

### The identity component Picard sheaf

**Definition: PicardZeroSheaf.** For the represented relative Picard sheaf P, define Pic⁰(T) as the subgroup of P(T) whose value at every geometric point t of T lies in the connected component containing zero in P_t. Keep the full induced scheme or algebraic-space structure when this subfunctor is represented; do not replace a nonreduced component by its reduction.

**Hypotheses and conventions.** P is a group algebraic space locally of finite presentation over B; geometric points test every base-changed fibre.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`, `SchemeAndStackFoundations:SF.1/group-action`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Define the identity component fibrewise and require membership after all geometric restrictions. Tensor and inverse preserve the component containing the unit, giving a subgroup. Under the component representability supplier, identify this sheaf with the open neutral-component subspace; otherwise no open subspace is assumed.

**Acceptance.** For higher-dimensional X, numerical degree zero is not the definition of Pic⁰.

**API.**

- **PicardZeroSheaf.inclusion** (coercion): Pic⁰ includes naturally into the relative Picard sheaf as a subgroup.
- **PicardZeroSheaf.baseChange** (functoriality): Membership is preserved under every base change; the neutral component of a fibre is geometrically connected because it has the identity point.
- **PicardZeroSheaf.fibre** (characterisation): On geometric fibres the sheaf is exactly the identity component, with its full structure.

**Unit tests.**

- **PicardZeroTests.projectiveLine** (computation): For P¹/k the relative Picard sheaf is the constant degree group Z and Pic⁰ is zero.
- **PicardZeroTests.curve** (compatibility): For a smooth proper pointed curve Pic⁰ agrees with the existing JacobianChallenge identity component.
- **PicardZeroTests.nonreduced** (non-example): For an ordinary Enriques surface Y over an algebraically closed field k of characteristic 2, Picτ=μ₂ is connected, hence Pic⁰=μ₂. Its coordinate ring k[t]/((t−1)²) retains a nonzero nilpotent t−1; the reduced identity component would be the trivial group.

**Uses.** AbelianSchemesAndArithmeticModuli:A2: Supplies the component whose abelian-specific dual interpretation is checked downstream. Kleiman Proposition 5.20: The representation criterion constructs an open proper component with these geometric fibres.

**Source.** [Steven L. Kleiman, The Picard scheme](https://arxiv.org/pdf/math/0504020), Definition 5.10 and Proposition 5.20, pp. 42, 47–48. The criterion uses full fibre identity components and their smoothness, not reduced Picard varieties. [Stefan Schröer, Enriques surfaces over the integers](https://arxiv.org/pdf/2004.07025), Section 4, classification table, pp. 12–13. The ordinary characteristic-two Enriques case supplies a nonreduced identity-component control.

### Representability criteria for Picard identity components

**Theorem: picard_zero_criterion.** Assume B is locally Noetherian and P is the relative Picard algebraic space above. In the scheme-represented case, if the identity components P_s⁰ are smooth of locally constant dimension, Pic⁰ is an open finite-type group subscheme; it is smooth when B is reduced, and proper and closed in P when all P_s⁰ are proper and P is separated. For algebraic spaces, under the requested neutral-component extension, the same conclusions hold. Over a nonreduced B instead require formal smoothness of P along the neutral component; local finite presentation then yields smoothness. With proper geometric identity components and separated P the resulting Pic⁰ is a smooth proper finitely presented group space.

**Hypotheses and conventions.** Kleiman 5.20 supplies the scheme-represented case. The algebraic-space extension and proper neutral-component criterion are an explicit supplier gap, not claimed source theorems here. Smooth geometric fibres alone do not imply smoothness over a nonreduced base.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-separation`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

**Argument.** Apply Kleiman 5.20 with its represented-scheme and reduced-base assumptions intact. For a general algebraic space request the neutral-component open-subspace theorem and properness criterion from SF.1, compatible with arbitrary base change. Use the infinitesimal smoothness condition to cover nonreduced bases. Abelian-specific verifications and the identification with the dual belong to A2.

**Acceptance.** H²(X,O_X)=0 is a sufficient way to obtain formal smoothness, but must not be required of an abelian scheme of dimension at least two.

**Source.** [Steven L. Kleiman, The Picard scheme](https://arxiv.org/pdf/math/0504020), Proposition 5.20, pp. 47–48, with the algebraic-space extension explicitly recorded as a gap. The exact scheme theorem motivates the conditional space criterion; no unproved strengthening is attributed to Kleiman.

### The Picard and Brauer obstruction sequence

**Theorem: picard_brauer_obstruction.** For proper flat finitely presented f:X→T with universal functions, the fppf Leray spectral sequence for G_m gives 0→Pic(T)→Pic(X)→Pic_{X/T}(T)→H²_fppf(T,G_m)→H²_fppf(X,G_m). The image of a relative class has zero obstruction exactly when it is represented by a line bundle on X. With a section the obstruction vanishes and the sequence recovers the prior split Picard comparison.

**Hypotheses and conventions.** H² denotes cohomological Brauer data, without asserting that every class is Azumaya or torsion over every base.

**Inputs.** `SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence`, `SchemeAndStackFoundations:SF.2/hilbert-90`, `SchemeAndStackFoundations:SF.3/picard-brauer-sequence`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-kernel`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`.

**Argument.** Use universal functions to identify f_*G_m with G_m. Use Hilbert 90 and invertible-module descent to identify R¹f_*G_m with the relative Picard sheaf. Read the Leray five-term sequence; the section gives a retraction on cohomology and hence zero boundary.

**Acceptance.** For a real conic without real points, the geometric degree-one relative Picard class has nonzero quaternion Brauer obstruction and no degree-one line bundle on the conic.

**Source.** [Stefan Schröer, Enriques surfaces over the integers](https://arxiv.org/pdf/2004.07025), Section 5, p. 14, five-term sequence; Stacks SF.2 Leray and SF.3 field case imported. This extends the field sequence to the required relative base using a named Leray supplier.

### Finite Picard classes and Cartier-dual torsors

**Theorem: finite_picard_cartier_torsors.** Let f:X→B be proper flat finitely presented with universal functions, M a finite locally free commutative group scheme over B and D(M) its Cartier dual. There is a natural isomorphism of fppf sheaves R¹f_*(D(M)_X)≅Hom_B(M,Pic_{X/B}). Thus a homomorphism into the Picard sheaf gives fppf-locally on B a D(M)-torsor on X. With a section, rigidifying the torsor along it gives the pointed global correspondence. Without a section there can be a base H²(D(M)) obstruction to a global representative.

**Hypotheses and conventions.** Finite locally free includes flatness and finite presentation; the statement includes non-étale group schemes. Sheafification of torsors and global torsors are distinguished.

**Inputs.** `tauceti:TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality`, `SchemeAndStackFoundations:SF.2/abelian-torsor-h1`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-brauer-obstruction`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Import Cartier duality on affine bases from the pinned library and request its group-scheme descent, rather than reconstruct it. Push out a D(M)-torsor by each character to obtain the corresponding Picard homomorphism. Use fppf-local splitting of extensions of M by G_m to reverse this construction as in Raynaud 6.2.1. Apply Leray for D(M) to distinguish sheaf points, globally realized torsors and pointed rigidifications.

**Acceptance.** For M=Z/n, D(M)=μ_n even when n is not invertible; do not replace μ_n by an étale constant group.

**Source.** [Michel Raynaud, Spécialisation du foncteur de Picard](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf), Proposition 6.2.1, pp. 50–51; Schröer Section 5, p. 15. Raynaud relates the Cartier-dual torsor sheaf to homomorphisms from M, not M itself.

### Raynaud’s condition N star

**Definition: RaynaudNStar.** For a proper flat finitely presented scheme X over a discrete valuation trait S, condition N means the special fibre has no embedded associated points and X is normal at the generic points of that fibre. Condition N* adds f_*O_X=O_S. The last equality is over S itself; universal cohomological flatness is a conclusion of the degree-one criterion, not part of the definition.

**Hypotheses and conventions.** S is a discrete valuation trait; this definition is not a condition on an arbitrary base.

**Inputs.** `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`.

**Argument.** Retain both associated-point and generic-normality clauses of Raynaud 6.1.4. Add the actual direct-image equality to define N*. Separate this from regularity of the whole total space and from universal functions.

**Acceptance.** A regular proper flat family with a section and geometrically connected generic fibre is a standard test case, provided f_*O_X=O_S is checked.

**API.**

- **RaynaudNStar.noEmbedded** (projection): The special fibre has no embedded associated points.
- **RaynaudNStar.genericNormal** (projection): The total space is normal at every generic point of the special fibre.
- **RaynaudNStar.functions** (projection): The structure-sheaf direct image over the trait is O_S.

**Unit tests.**

- **RaynaudTests.regularPoint** (computation): For X=S with the identity morphism, N* holds.
- **RaynaudTests.embeddedPoint** (non-example): A flat trait family whose special fibre has an embedded associated point fails N regardless of its generic fibre.
- **RaynaudTests.nontrivialConstants** (non-example): For a nontrivial finite unramified trait extension X→S, N holds but N* fails because f_*O_X is the extension ring.

**Uses.** Raynaud Theorem 8.2.1: The degree-one-divisor conclusion requires N*. Schröer Proposition 8.1, pp. 21–22: The normal proper curve model must satisfy the trait hypothesis before applying cohomological flatness.

**Source.** [Michel Raynaud, Spécialisation du foncteur de Picard](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf), Definition 6.1.4, pp. 48–49. The trait hypothesis N* used by 8.2.1 is weaker than already assuming universal cohomological flatness.

### The degree one criterion over a trait

**Theorem: raynaud_degree_one_cohomologicallyFlat.** Let f:X→S be a proper flat finitely presented relative curve over a discrete valuation trait satisfying N*. If the generic fibre after strict henselization of S has a divisor of degree one, f is cohomologically flat in degree zero: formation of f_*O_X commutes with every base change. In particular a section gives the required generic degree-one divisor.

**Hypotheses and conventions.** The divisor is on the generic fibre after strict henselization. A generic degree-one divisor without N* does not meet the theorem.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/raynaud-n-star`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Argument.** Use Raynaud 8.2.1: the strict-henselian generic degree-one condition forces the prime-to-residue-characteristic multiplicity invariant to be one. Invoke the cohomological-flatness implication within that theorem. Relate a section to its degree-one divisor on the smooth generic curve; keep the trait/model conditions separately.

**Acceptance.** On the normal curve model used by Schröer 8.1, check no embedded special-fibre points, generic normality and f_*O=O before invoking the section.

**Source.** [Michel Raynaud, Spécialisation du foncteur de Picard](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf), Theorem 8.2.1, pp. 66–67; Schröer Proposition 8.1, pp. 21–22. Only the cohomological-flatness consequence is planned; equivalences involving the multiplicity invariant are not redefined.

## Analytification of algebraic spaces

### Analytification through étale presentations

**Construction: SpaceAnalytification.** For a complex algebraic space X locally of finite type with locally separated diagonal, take an étale scheme presentation R⇉U and construct X^an as the analytic quotient of R^an⇉U^an. The local-isomorphism relation glues analytic structure, including nilpotents. Over a complete nontrivially valued nonarchimedean field K use an existing quotient of this analytified relation; separated X has such a quotient by the next theorem. Its quotient sheaf is represented, and U^an→X^an is an étale cover with R^an≅U^an×_{X^an}U^an.

**Hypotheses and conventions.** Scheme analytification is imported from the existing complex proposal and AdicSpacesPartII. In the nonarchimedean case existence is not assumed for every locally separated X.

**Inputs.** `SchemeAndStackFoundations:SF.1/groupoid-space`, `SchemeAndStackFoundations:SF.1/etale-equivalence-relation`, `SchemeAndStackFoundations:SF.1/algebraic-space-category`, `AdicSpacesPartII:R1`.

Existing scheme import: Finite-type complex scheme analytification, nilpotents, fibre products and étale local biholomorphisms.

**Argument.** Analytify the scheme presentation using the existing fibre-product comparison. In the complex case étale scheme maps become local analytic isomorphisms and descend the ringed-space structure through the quotient. In the nonarchimedean case define the construction on analytifiable relations and invoke separated existence only after the quotient theorem. Use étale effective descent to identify the presentation fibre product with R^an.

**Acceptance.** Analytification of Spec C[ε]/ε² retains its nilpotents; the result is not a manifold-only construction.

**API.**

- **SpaceAnalytification.chart** (projection): The analytic chart is étale and surjective, with relation equal to its fibre product.
- **SpaceAnalytification.quotient** (universal-property): Maps out are exactly maps out of U^an equalizing the two relation arrows.
- **SpaceAnalytification.scheme** (compatibility): For a scheme, this agrees with the existing scheme analytification, including the structure sheaf.

**Unit tests.**

- **AnalytificationTests.dualNumbers** (compatibility): For Spec C[ε]/ε² the analytic local ring contains the nonzero class ε with ε²=0.
- **AnalytificationTests.point** (degenerate): A single field point analytifies to the existing analytic field point.
- **AnalytificationTests.presentation** (characterisation): A disjoint union presentation of the same scheme gives the same analytification and its actual overlap relation.

**Uses.** PELModuli:M3 and HilbertSiegelArithmeticModuli:H1: Import space analytification and verify their own presentation conditions. ComplexComparisonPartII:C3: Consumes this space descent; coherent complex GAGA remains in its own higher layer.

**Source.** [Brian Conrad and Michael Temkin, Non-archimedean analytification of algebraic spaces](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), Definitions 2.2.1–2.2.4, pp. 6–8; introduction p. 1; existing complex proposal Layer 2. Algebraic-space analytification is a quotient extension of the existing scheme construction.

### Separated nonarchimedean analytification

**Theorem: separated_nonarch_analytification.** Every separated algebraic space locally of finite type over a complete nontrivially valued nonarchimedean field admits rigid analytification, compatible with the scheme construction. On the Berkovich side an étale equivalence relation R⇉U with closed-immersion diagonal has a separated analytic quotient; good and strictly analytic properties descend.

**Hypotheses and conventions.** Separatedness, not merely local separatedness, guarantees existence. The lower analytic-space substrate and rigid/Berkovich bridge are a supplier request.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/space-analytification`, `AdicSpacesPartII:R1`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Choose separated étale scheme charts; the analytified relation has closed diagonal. Apply the analytic quotient theorem, reducing étale-locally to free finite-group actions and gluing their quotients. Use the good strictly analytic/rigid comparison to return to rigid spaces. Record the missing Berkovich quotient proof substrate explicitly.

**Acceptance.** Conrad–Temkin Example 3.1.1 is a smooth locally separated surface that is not analytifiable; it rules out replacing separatedness by local separatedness.

**Source.** [Brian Conrad and Michael Temkin, Non-archimedean analytification of algebraic spaces](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), Theorems 4.2.1–4.2.2, p. 20 and proofs §§4.3–5; Example 3.1.1, pp. 13–15. The quotient existence theorem is the additional nonarchimedean input.

### Independence and functoriality of presentations

**Theorem: analytification_descent.** For analytifiable algebraic spaces, the quotient analytification is independent up to unique canonical isomorphism of the chosen étale presentation. It is functorial in morphisms and compatible with fibre products whenever the terms are analytifiable. The scheme comparison respects these identifications; complex étale morphisms yield local analytic isomorphisms.

**Hypotheses and conventions.** In the nonarchimedean case étale morphisms stay étale and need not be local isomorphisms for the rigid topology.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/space-analytification`, `AdicSpacesPartII:R1`.

Existing scheme import: Finite-type complex scheme analytification, nilpotents, fibre products and étale local biholomorphisms.

**Argument.** Use the common refinement of two étale presentations and the quotient universal property. Lift morphisms on refinements and descend them; uniqueness gives identity and composition. Apply the scheme fibre-product theorem to charts and descend the resulting comparison.

**Acceptance.** No claim that every nonarchimedean étale analytic map is locally an isomorphism is made.

**Source.** [Brian Conrad and Michael Temkin, Non-archimedean analytification of algebraic spaces](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), Theorem 2.2.5, pp. 8–9; §2.3, pp. 9–12. The presentation comparison is canonical and compatible with scheme analytification.

### Complex local comparison by common étale neighbourhoods

**Theorem: complex_local_comparison.** For finite-type complex schemes at complex points, isomorphic analytic germs imply isomorphic completed local C-algebras and hence a common pointed étale neighbourhood with residue-field isomorphisms. Conversely a common pointed étale neighbourhood yields an isomorphism of analytic germs. These conclusions extend to locally separated finite-type complex algebraic spaces by choosing étale charts and descending the local analytic identifications.

**Hypotheses and conventions.** Use finite-type complex objects, retain nonreduced analytic structure and respect the chosen complex points. The particular formal automorphism need not itself analytify.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/common-etale-neighbourhood`, `AlgebraicModuliForArithmeticGeometry:A0-extension/analytification-descent`.

Existing scheme import: Finite-type complex scheme analytification, nilpotents, fibre products and étale local biholomorphisms.

**Argument.** Import the analytic/algebraic completed-stalk identification from the scheme analytification substrate. Apply the common étale neighbourhood theorem over C to the chart completions. Étale analytification gives local biholomorphisms; compare refinements to descend the germ statement for spaces.

**Acceptance.** The statement concerns isomorphism classes of pointed germs, not convergence of every formal automorphism.

**Source.** [Michael Artin, Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf), Corollary 2.6, pp. 28–29; existing complex proposal Layer 2; Conrad–Temkin introduction p. 1. Artin supplies the algebraic étale bridge; the existing complex functor supplies local biholomorphisms.

### Proper nonarchimedean GAGA for spaces

**Theorem: proper_space_gaga.** For a proper morphism h:X→Y of analytifiable finite-type algebraic spaces over K and coherent F, (R^j h_*F)^an→R^j h^an_*F^an is an isomorphism for every j≥0. For X proper over K, analytification induces an exact tensor equivalence of coherent-module categories.

**Hypotheses and conventions.** K is complete and nontrivially valued; the source is the étale ringed site of an algebraic space. This is the space extension of the existing proper scheme theorem. Complex coherent GAGA is a downstream C3 target, not an imported prerequisite here.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/analytification-descent`, `SchemeAndStackFoundations:SF.4/chow-lemma`, `SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison`, `AdicSpacesPartII:R3/proper-gaga`, `AdicSpacesPartII:R3/proper-gaga-coherent-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Argument.** Construct the morphism of étale ringed topoi using analytic charts and flat local stalk comparisons. Use coherent-module equivalence between rigid Tate and étale sites. Apply Chow modifications and coherent dévissage for algebraic spaces to reduce to proper scheme GAGA; use cohomological descent rather than claiming proper spaces are projective schemes.

**Acceptance.** Include proper spaces with no global scheme presentation; scheme GAGA alone is not a complete proof until the space dévissage supplier is provided.

**Source.** [Brian Conrad and Michael Temkin, Non-archimedean analytification of algebraic spaces](https://math.stanford.edu/~conrad/papers/analgpaper.pdf), §3.3, Example 3.3.1, pp. 16–17. The paper describes the reduction to scheme GAGA through étale coherent descent and Chow’s lemma.

## Arithmetic normalization and valuation adapters

### Finite arithmetic normalization and its generic étale locus

**Application: arithmetic_normalization_genericallyEtale.** For a field k, a reduced finite-type k-algebra A and a finite extension E of its total fraction ring, its relative normalization is finite by the SF.0 Nagata theorem. For A=k[t₁,…,t_d] and a finite separable extension E/k(t₁,…,t_d), the finite normalization is generically étale. Finite normalization also holds for reduced finite-type schemes over an excellent base without a separability assumption.

**Hypotheses and conventions.** Finite many generic field extensions; separability is used only for the generic-étale conclusion, not for finite normalization.

**Inputs.** `SchemeAndStackFoundations:SF.0/quasi-excellent-nagata`, `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`, `SchemeAndStackFoundations:SF.0/japanese-ring`, `SchemeAndStackFoundations:SF.1`.

**Argument.** Import the general normalization finiteness theorem from SF.0 without re-proving it. For a separable function-field extension, invert the nonzero discriminant of a primitive element and compare the normalization on this open. Apply the same imported Nagata theorem to excellent bases; retain inseparable finite extensions for the finiteness assertion.

**Acceptance.** A purely inseparable field extension is allowed for finite normalization but is not generically étale.

**Source.** [Philip Dittmann and Florian Pop, Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307), Proposition 3.8 and proof, pp. 10–11; SF.0 Nagata normalization import. This is the arithmetic application and its separability-sensitive open-locus refinement.

### Descent of minimal polynomial coefficients

**Theorem: root_coefficient_descent.** Let V be a valuation subring of F, W a valuation subring of an extension field N with W∩F=V, and p∈F[T] monic. If p splits in N and every root, including its multiplicity, belongs to W, then every coefficient of p lies in V. In particular, let E/F be finite, x∈E and N/F a finite normal extension containing every conjugate of x. Let V be a valuation subring of F and W a prolongation to N. If every F-embedding of F(x) into N sends x into W, every coefficient of the monic minimal polynomial of x lies in V. Therefore the coefficients lie in ∩V_i when the condition holds for each specified V_i and prolongation.

**Hypotheses and conventions.** For inseparable extensions retain multiplicities of roots in the minimal polynomial; separability is not required for this coefficient conclusion.

**Inputs.** `mathlib:integralClosure`, `mathlib:ValuationSubring.comap`, `mathlib:Polynomial.Splits.eq_prod_roots_of_monic`, `mathlib:minpoly`.

**Argument.** Write the minimal polynomial as the product of all conjugate roots with their inseparable multiplicities in N. Each elementary symmetric polynomial belongs to W because every root does. Coefficients already lie in F, so W∩F=V places them in V.

**Acceptance.** In characteristic p a polynomial T^p−a has one distinct root but multiplicity p; replacing it by the distinct-root product gives the wrong coefficients and degree.

**Source.** [Philip Dittmann and Florian Pop, Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307), Lemma 5.3 proof, pp. 16–17. The repeated-root argument supplies the coefficient descent used in the valuation intersection proof.

### Integral closure through all prolongations

**Theorem: valuation_prolongation_integrality.** Let F be a field, E/F a finite extension, (V_i) any family of valuation subrings of F and B=∩_i V_i inside F. The integral closure of B in E is the intersection of all valuation subrings W of E whose intersection with F is one of the specified V_i, taking every prolongation of each V_i. No equality Frac(B)=F is required.

**Hypotheses and conventions.** Empty families are interpreted as B=F and the intersection in E as E; all prolongations, not one chosen prolongation per V_i, are used.

**Inputs.** `mathlib:integralClosure`, `AlgebraicModuliForArithmeticGeometry:A0-extension/root-coefficient-descent`, `mathlib:LocalSubring.exists_le_valuationSubring`, `mathlib:ValuationSubring.isMax_toLocalSubring`, `mathlib:iInf_valuationSubring_superset`, `mathlib:ValuationSubring.comap`.

**Argument.** To extend a V_i to the finite normal splitting extension N/F, regard its image as a local subring of N and apply LocalSubring.exists_le_valuationSubring. Contract the dominating valuation ring to F; ValuationSubring.isMax_toLocalSubring identifies this contraction with V_i. This works without Frac(B)=F. If x belongs to every specified prolongation in E, every F-conjugate of x lies in the chosen prolongation to N: contract the valuation subring along each embedding F(x)→N and extend to E by the same domination argument. Apply root-coefficient-descent, retaining inseparable root multiplicities, to place all minimal-polynomial coefficients in each V_i, hence in B. Conversely an integral equation over B also holds over each V_i, and every prolongation is integrally closed. The existing iInf_valuationSubring_superset is the general native integral-closure comparison; only the specified-family arithmetic adapter is new.

**Acceptance.** For B=Z inside F=Q and E=Q(√2), intersecting all p-adic valuation prolongations recovers Z[√2].

**Source.** [Philip Dittmann and Florian Pop, Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307), Lemma 5.3, pp. 16–17. Integrality is detected by the entire specified prolongation family.

## Cartier restriction, boundary traces and fractional cohomology

### Cartier restriction of duality

**Theorem: cartier_duality_restriction.** Let S be Noetherian and f:X→Y an embeddable morphism between embeddable S-schemes X,Y, both local complete intersections of the same pure relative dimension n over S. Let F be locally free of finite rank r on Y and h a section of a line bundle L with h regular on Y and f*h regular on X. Write D=V(h), D′=V(f*h) and f_D:D′→D. Then the canonical comparison (f^!F)|_{D′}≅f_D^!(F|_D) is an isomorphism of locally free sheaves of rank r. Here f^!O_Y≅ω_{X/S}⊗f*ω_{Y/S}^{−1} lies in degree zero; f itself is not assumed lci. For finite flat f the comparison on affine charts is Hom_A(B,F)⊗_B(B/hB)≅Hom_{A/h}(B/hB,F/hF), and commutes with evaluation at one.

**Hypotheses and conventions.** S is Noetherian; embeddability has the finite-type separated convention of the imported duality pseudofunctor. Regularity of both Cartier equations and equal relative dimensions are retained. F need not be invertible; r is arbitrary.

**Inputs.** `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2/finite-formula`, `SchemeAndStackFoundations:SF.2/trace`, `SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom`, `SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence`, `SchemeAndStackFoundations:SF.2/lci-upper-shriek`, `SchemeAndStackFoundations:SF.2`.

**Argument.** Use the imported duality composition and the lci formulas for X/S and Y/S to identify f!O_Y with the indicated line bundle in degree zero, then tensor with f*F. Do not infer that f is lci from the two lci structure maps. Represent O_D by the perfect two-term complex L⁻¹→O_Y. Apply the SF.2 perfect-coefficient comparison; regularity on both sides and local freeness eliminate higher Tor. This identifies the restriction with the duality expression for D′/D. Glue the canonical comparisons and check composition coherence. In the finite-flat specialization use the imported Hom formula and its evaluation-at-one trace.

**Acceptance.** Take F=O_Y²: the restricted coefficient remains rank two, rather than becoming invertible.

**Source.** [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Lemmas 3.8.9–3.8.10, p. 59, arXiv v3, with the rank wording corrected; general perfect-coefficient duality imported from SF.2. The Cartier adapter retains the full embeddable equal-dimensional lci-over-S generality, not only its finite-flat specialization.

### Functionals compatible with boundary quotients

**Construction: BoundaryDualFunctional.** For an A-algebra B and ideals I⊂A,J⊂B, BoundaryDualFunctional(A,B,I,J) consists of A-linear maps ℓ:B→A with ℓ(J)⊂I. Such a functional induces a unique A-linear map B/J→A/I, and its value at the class of 1 is ℓ(1) modulo I. If J^n⊂IB, ℓ is A-linear and sends IB into I, then for c∈J^(n−1) the functional b↦ℓ(cb) belongs to this construction.

**Hypotheses and conventions.** No division by n and no separability hypothesis. The final power application assumes n≥1.

**Inputs.** `mathlib:Submodule.liftQ`, `mathlib:Ideal.Quotient.mkₐ`.

**Argument.** Compose ℓ with A→A/I and kill J. Apply the quotient-module universal property; uniqueness gives evaluation and scalar compatibility. For the power application multiply cJ⊂J^n⊂IB before applying ℓ.

**Acceptance.** A functional not sending J into I must be excluded even if its value at 1 is defined.

**API.**

- **BoundaryDualFunctional.reduce** (constructor): Induce the functional B/J→A/I.
- **BoundaryDualFunctional.reduce_mk** (simp): On the class of b the reduction has value ℓ(b) modulo I.
- **BoundaryDualFunctional.evaluate_one** (compatibility): Evaluation at one commutes with the two quotient maps.
- **BoundaryDualFunctional.ext** (extensionality): Equality of underlying linear maps implies equality of boundary functionals.

**Unit tests.**

- **BoundaryTests.zeroFunctional** (degenerate): The zero functional descends for every pair of ideals.
- **BoundaryTests.identity** (compatibility): For B=A and J=I, the identity functional descends to the identity of A/I.
- **BoundaryTests.dualNumbers** (non-example): For B=Q[ε]/ε², I=0 and J=(ε), the ε-coefficient functional is excluded because it sends ε to 1. Multiplying its input by ε gives the permitted constant-coefficient functional.

**Uses.** BCGP Proposition 3.8.17: J^(n−1) times a dualizing functional descends across a ramified divisor. Pilloni Lemma 4.2.4.1: Checks respect for boundary ideals rather than only a map on ambient structure sheaves.

**Source.** [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proposition 3.8.17 proof, pp. 61–62. The quotient-functional algebra is the local core of the ramified divisor trace.

### Fundamental classes and reduced boundaries

**Theorem: fundamental_class_boundary.** Let f:X→Y be an embeddable morphism between S-schemes of the same pure relative dimension. Under the imported SF.2 fundamental-class hypotheses, let D_X,D_Y be reduced relative effective Cartier divisors with f^−1(|D_Y|)=|D_X|. For the determinant construction assume the normal/smooth dense open and relative normal-crossings conditions of Pilloni 4.2.4.1(1); for the trace construction assume f finite flat as in (2). Then Θ sends O_X(−D_X) into f^!O_Y(−D_Y). Under an open base change or, in the finite-flat case, any base change for which the Cartier divisors remain Cartier, this boundary map agrees with the base-changed map.

**Hypotheses and conventions.** A determinant fundamental class over a nonflat general morphism is not declared compatible with arbitrary base change. The two construction hypotheses are kept separate.

**Inputs.** `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2`, `AlgebraicModuliForArithmeticGeometry:A0-extension/boundary-dual-functional`, `AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction`.

**Argument.** Request the general determinant/finite-flat fundamental class and their agreement from the sole SF.2 duality owner. On the smooth boundary chart take the determinant of the logarithmic differential; its twist maps the source boundary ideal into the target twisted dualizing module. In the finite-flat case use the trace and boundary quotient calculation; compare the two constructions only under their common hypotheses. For an open base change use restriction; for finite-flat base change use finite-projective Hom base change.

**Acceptance.** Do not extend the base-change claim to a nonflat general embeddable map.

**Source.** [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weight](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Lemmas 4.2.3.1–4.2.4.1 and Proposition 4.2.5.1, pp. 17–19; Fakhruddin–Pilloni 2.6–2.7, pp. 8–9. Only the boundary adapter is new here; the ambient fundamental class is a requested SF.2 import.

### Traces on ramified Cartier divisors

**Theorem: ramified_divisor_trace.** Let f:X→Y be finite flat between smooth varieties over a field, D⊂Y and D′⊂X smooth effective Cartier divisors with f^*D=nD′, n≥1. The canonical-bundle trace restricts to f_*ω_X(−(n−1)D′)→ω_Y. Restriction and adjunction give a compatible divisor map f_{D′*}(ω_{D′}⊗O_X(−nD′)|_{D′})→ω_D⊗O_Y(−D)|_D. These maps commute with ambient trace and quotient restriction.

**Hypotheses and conventions.** The pullback is the scheme-theoretic equality nD′, not equality of supports. Characteristic may divide n; the statement does not divide by n.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction`, `AlgebraicModuliForArithmeticGeometry:A0-extension/boundary-dual-functional`, `SchemeAndStackFoundations:SF.2/finite-formula`, `SchemeAndStackFoundations:SF.2/trace`, `tauceti:Algebra.trace_quotient_pow_mk`.

**Argument.** Write I=I′^n on finite-flat affine charts. A multiplier in I′^(n−1) makes the dual functional kill I′ modulo I. Use boundary-dual-functional to obtain the quotient trace, then evaluate at one. Identify the dualizing modules by adjunction to the two smooth Cartier divisors and retain their normal-line twists. The pinned arithmetic quotient-power trace is a separate multiplicity check; it does not supply geometric dualizing-module adjunction.

**Acceptance.** For n=1 recover the unramified Cartier restriction. For a purely inseparable finite-flat map the ordinary trace can vanish; no inverse to n is introduced.

**Source.** [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proposition 3.8.17 and proof, pp. 61–62. The ramification exponent changes the boundary twist and quotient functional.

### Fractional quotient coefficients

**Construction: KOCoefficients.** For a commutative ring O, an O-algebra K and O-module M, define KOCoefficients(M)=(K⊗_O M)/im(m↦1⊗m). For a discrete valuation ring O, fraction field K, uniformizer π and flat M this identifies with M⊗_O(K/O), and 0→M/πM→KOCoefficients(M)→KOCoefficients(M)→0 is exact with first map m↦π^−1⊗m and second map multiplication by π. Apply the same construction to a locally free coherent sheaf.

**Hypotheses and conventions.** Flatness is required for the exact identification and injection; the raw quotient construction exists for every M.

**Inputs.** `mathlib:TensorProduct.mk`, `mathlib:Submodule.mkQ`, `SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom`.

**Argument.** Form the native tensor product and quotient by the image of the integral module. For a DVR identify the quotient with the filtered union of π-power denominators. Use flatness to identify the π-torsion with M/πM and to sheafify the exact sequence.

**Acceptance.** When K=O the quotient is zero; it is not the localization K⊗M itself.

**API.**

- **KOCoefficients.mk** (constructor): A fractional tensor determines a class modulo integral tensors.
- **KOCoefficients.integral_zero** (simp): The class of 1⊗m is zero.
- **KOCoefficients.mk_add** (structure): The quotient class map is additive.

**Unit tests.**

- **KOTests.baseField** (degenerate): For K=O every quotient coefficient is zero.
- **KOTests.zeroModule** (degenerate): For M=0 the coefficient module is zero.
- **KOTests.integralClass** (compatibility): An integral tensor 1⊗m is zero in the quotient, although it need not be zero in K⊗M.

**Uses.** Calegari–Geraghty Lemma 3.7: The uniformizer exact sequence controls cofinite K/O cohomology. SF.2 coherent duality consumer: Dualize cohomology only after finiteness and the coefficient sequence are established.

**Source.** [Frank Calegari and David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Section 3.2, proof of Lemma 3.7, pp. 18–20. The π-divisible quotient, not an ordinary coherent coefficient module, enters dévissage.

### Cofiniteness with K over O coefficients

**Theorem: ko_cohomology_cofinite.** Let X be a proper flat finitely presented relative curve over a complete discrete valuation ring O with fraction field K, uniformizer π and residue field k, and let L be locally free coherent. Cohomology with L_{K/O} is zero above degree one; H¹(X,L_{K/O}) is π-divisible, and H⁰ and H¹ are cofinite O-modules. Here cofinite means their Matlis/Pontryagin dual under the appropriate K/O injective-cogenerator pairing is finitely generated. H⁰(X,L_{K/O})[π]≅H⁰(X_k,L_k), and H¹(X,L_{K/O})[π] is a quotient of H¹(X_k,L_k).

**Hypotheses and conventions.** Use proper finiteness, curve cohomological dimension, filtered-colimit compatibility and the exact coefficient sequence. Do not identify cofinite with finite cardinality.

**Inputs.** `AlgebraicModuliForArithmeticGeometry:A0-extension/ko-coefficients`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence`, `SchemeAndStackFoundations:SF.2`.

**Argument.** Apply cohomology to 0→L_k→L_{K/O}→π L_{K/O}→0. The curve vanishing H²(X_k,L_k)=0 gives surjectivity of multiplication by π on H¹. Proper finite-dimensional special-fibre cohomology bounds the π-torsion, and the torsion-module duality criterion gives finite generation of the dual. Import coherent Serre/Grothendieck duality from SF.2 for pairings; do not reconstruct it here.

**Acceptance.** A divisible K/O-type module can be infinite and still cofinite; finite π-torsion is the relevant test.

**Source.** [Frank Calegari and David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Lemma 3.7, proof in §3.2, pp. 18–20. The exact sequence proves divisibility and cofiniteness on curves, not in arbitrary relative dimension.

## Supplier contracts

The following precise extensions are needed in the supplying directions. They qualify the construction and proof inputs above.

**SchemeAndStackFoundations:SF.1.** Algebraic-space ringed étale sites, represented diagonals and smooth-presentation bootstrap; limits/descent of finite-presentation space families. In addition, neutral components of a locally finitely presented smooth separated group algebraic space over a locally Noetherian base: open finite-presentation subgroup, arbitrary-base-change compatibility, properness when geometric neutral fibres are proper. Supply the reduced-base Picard extension of Kleiman 5.20 without assuming scheme representability.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/common-etale-neighbourhood`, `AlgebraicModuliForArithmeticGeometry:A0-extension/openness-versality`, `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-space-criterion`, `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-stack-criterion`, `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`, `AlgebraicModuliForArithmeticGeometry:A0-extension/finite-picard-cartier-torsors`, `AlgebraicModuliForArithmeticGeometry:A0-extension/arithmetic-normalization`, `AlgebraicModuliForArithmeticGeometry:A0-extension/separated-nonarch-analytification`.

**DiamondsAndVStacks:D0.** The existing ordinary category-fibred-in-groupoids/étale stack, strong-transformation and stack descent interfaces; no diamond geometry or analytic-stack formalism is needed.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-spaces`, `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-stack-criterion`.

**AlgebraicModuliForArithmeticGeometry:R09.4.** Coh_{X/B} for proper flat finitely presented algebraic spaces: finitely presented T-flat coherent modules with proper support form an algebraic stack quasi-separated and locally of finite presentation, and invertibility cuts out an open substack. Use only the A0 criterion prefix if a criterion is needed, never the Picard conclusion.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-algebraicity`.

**AlgebraicModuliForArithmeticGeometry:R09.3.** Coherent invertible-module descent on algebraic-space étale presentations and space Chow/coherent dévissage reducing proper GAGA to the proper scheme case; keep the quasi-coherent fpqc and coherent locally Noetherian hypotheses distinct.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/proper-space-gaga`.

**SchemeAndStackFoundations:SF.4.** Extend proper Grothendieck existence for coherent modules and isomorphisms, and Chow modifications, from schemes to proper algebraic spaces. Restriction to the formal object groupoid must be an equivalence, not just surjective on object classes.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/effectivity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-stack-algebraicity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/proper-space-gaga`.

**AdicSpacesPartII:R1.** Import existing scheme analytification and finite-product comparisons. Add the Berkovich analytic-space/rigid comparison and effective étale quotient substrate for closed-diagonal equivalence relations used in Conrad–Temkin 4.2.2; include completed local stalk comparisons. This is an AdicSpaces Part II addition, not an import of a higher-tier TropicalBerkovich roadmap.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/space-analytification`, `AlgebraicModuliForArithmeticGeometry:A0-extension/separated-nonarch-analytification`, `AlgebraicModuliForArithmeticGeometry:A0-extension/analytification-descent`.

**SchemeAndStackFoundations:SF.2.** As sole coherent-duality owner, expose determinant and finite-flat trace fundamental classes with their agreement under the precise normal/CM/Gorenstein and codimension-two hypotheses of Fakhruddin–Pilloni 2.6 and Pilloni 4.2.2–4.2.3. Include the open or finite-flat base-change comparison. Also supply the torsion-DVR-module Matlis/Pontryagin cofiniteness criterion and sheaf-cohomology filtered-colimit compatibility needed by K/O dévissage. Expose the perfect-coefficient comparison Lf*P ⊗ f!K ≅ f!(P ⊗ K) for perfect P and its composition coherence. A0 constructs the regular-Cartier restriction adapter from this general comparison, rather than assuming arbitrary nonflat base change for f!.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary`, `AlgebraicModuliForArithmeticGeometry:A0-extension/ko-cohomology-devissage`, `AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction`.

**SchemeAndStackFoundations:SF.2.** SchemeAndStackFoundations, Part II: coherent duality over qcqs universally coherent schemes. For separated finitely presented morphisms supply f^! on D⁺_qc, proper right adjunction, proper D_coh preservation and the source-qualified flat/Tor-independent base-change comparisons of Zavyalov §2.2, pp. 11–14. Do not assert this over an arbitrary non-Noetherian base; AS.1 is a downstream comparison consumer. Independently extend the SF.2 D_QCoh, perfect and pseudo-coherent complexes, Tor-amplitude, derived tensor and derived pullback/pushforward interfaces from schemes to qcqs algebraic spaces by étale descent. This space substrate is needed over arbitrary bases for the perfect-pushforward theorem; it does not assert coherent duality over arbitrary bases. EnhancedDerivedSheaves is a separate tier-4 unit and is not an A0 supplier.

Consumers: `AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction`, `AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary`, `AlgebraicModuliForArithmeticGeometry:A0-extension/ramified-divisor-trace`, `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `AlgebraicModuliForArithmeticGeometry:A0-extension/fibre-betti-semicontinuity`, `AlgebraicModuliForArithmeticGeometry:A0-extension/single-degree-free-locus`, `AlgebraicModuliForArithmeticGeometry:A0-extension/lowest-degree-rank-stratum`, `AlgebraicModuliForArithmeticGeometry:A0-extension/universal-functions`.

## Source corrections

All targets above use the corrected formulations. Each observation is scoped to the exact source file identified below; it does not assert anything about an unread publisher version.

**E2001.** [The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemma 75.25.4, tag 0CTM, clause (2), p. 61; July 14, 2026 chapter PDF and live tag read October 9, 2026. In own words: the flatness assumption on G is written relative to the common scheme S rather than the target Y of f. Require G to be flat over Y, consistently with Lemma 75.25.1. Take S=Spec k, Y=Spec k[ε]/ε², X=Spec k and the closed immersion f, with G=k. It is S-flat and has proper support, but f_*G=k has infinite projective dimension over the dual numbers, so the asserted perfectness fails.

**E2002.** [The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Lemma 75.26.6, tag 0D21, final clause, pp. 65–66; July 14, 2026 chapter PDF and live tag read October 9, 2026. In own words: after fixing the lowest Tor degree a, the final rank condition uses H⁰ instead of H^a. Use local freeness of H^a of rank r in the final clause as in the earlier universal characterization. For K=O_Y[−a] with a≠0 and r=1, β_a=1 everywhere and H^a=O_Y, while H⁰=0. The H⁰ wording therefore excludes the entire representing locus incorrectly.

**E2003.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Lemma 3.8.10, p. 59, arXiv:1812.09269v3 (the preprint version read). The comparison for arbitrary locally free F is described as involving invertible sheaves. The compared sheaves are locally free of the same rank as F; they are invertible only when F has rank one. For f the identity on A¹_k, D the origin and F=O², both restrictions have rank two. Lemma 3.8.9 supplies an invertible f!O, not an invertible f!F for arbitrary F.

**E2004.** [Hecke operators and the coherent cohomology of Shimura varieties](https://www.imo.universite-paris-saclay.fr/~pilloni/heckeoperators.pdf), Lemma 2.4, p. 7, public author file heckeoperators.pdf downloaded October 9, 2026. The upper-shriek input is the structure sheaf O_X for h:X→S. The input is O_S: h!O_S≅ω_{X/S}[n]. The functor h! has domain D⁺(O_S), whereas O_X is a sheaf on X. The corrected formula also agrees with the immediately following proof of Proposition 2.5.

## Routed arithmetic inputs

| Input | Disposition | Owner or target |
| --- | --- | --- |
| PAPER-SCHROER-23/182 — Picard classes are represented when a section exists | imported | AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split |
| PAPER-SCHROER-23/211 — Representability of the relative Picard functor (Artin) | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability |
| PAPER-SCHROER-23/212 — Subgroups of the Picard functor and torsors under the Cartier dual (Raynaud) | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/finite-picard-cartier-torsors |
| PAPER-SCHROER-23/230 — Low-degree Leray sequence for G_m and the Brauer obstruction | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/picard-brauer-obstruction |
| PAPER-SCHROER-23/251 — Raynaud degree-one criterion for cohomological flatness | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/raynaud-degree-one |
| PAPER-DITTMANN-POP-23/valuation-prolongation-integrality — Integral closure detected by prolonged valuation rings | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/valuation-prolongation-integrality |
| PAPER-DITTMANN-POP-23/finite-normalization-generic — Finiteness of normalization over arithmetic polynomial rings | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/arithmetic-normalization |
| PAPER-DITTMANN-POP-23/root-coefficient-descent — All conjugates control the coefficients of a minimal polynomial | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/root-coefficient-descent |
| PAPER-BOXER-PILLONI-26/fakhruddin-pilloni-fundamental-class — Fundamental class for lci correspondences ([FP21] Prop. 2.6) | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-CALEGARI-GERAGHTY-18/verdier-serre-duality — Grothendieck–Serre (‘Verdier’) duality over O/ϖ^n with trace | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-CALEGARI-GERAGHTY-18/KO-devissage-cofiniteness — Dévissage and cofiniteness for K/O coefficients on curves over O | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/ko-cohomology-devissage |
| PAPER-PILLONI-20/embeddable-and-projectively-embeddable-morphisms — Embeddable and projectively embeddable morphisms | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/fundamental-class-and-divisors-construction-1 — Lemma 4.2.4.1 (1): fundamental class respects boundary divisors (Construction 1) | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary |
| PAPER-PILLONI-20/fundamental-class-and-divisors-construction-2 — Lemma 4.2.4.1 (2): fundamental class respects boundary divisors (Construction 2) | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary |
| PAPER-PILLONI-20/fundamental-class-and-trace — Fundamental class Θ: f^*O_Y → f^!O_Y and the trace Tr: Rf_*f^*O_Y → O_Y | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-PILLONI-20/fundamental-class-base-change — Proposition 4.2.5.1 (2): base change of the fundamental class | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary |
| PAPER-PILLONI-20/fundamental-class-construction-1-determinant-of-differential — Construction 1: fundamental class as determinant of the differential | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-PILLONI-20/fundamental-class-construction-2-trace — Construction 2: fundamental class of a finite flat morphism is the trace | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-PILLONI-20/fundamental-class-constructions-agree — Lemma 4.2.3.1 (2): det(df) is the trace (Constructions 1 and 2 agree) | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-PILLONI-20/grothendieck-duality-projectively-embeddable — Grothendieck duality for projectively embeddable morphisms | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/lci-morphism-cotangent-complex-dualizing-sheaf — Local complete intersection morphisms, cotangent complex L_{X/S} and ω_{X/S} | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/quasi-coherent-derived-categories — Derived categories D_qcoh, D^±_qcoh, D^b_qcoh, D^b_qcoh(O_X)_{fTd}; the base S | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/relative-dualizing-sheaf-between-lci — Corollary 4.1.3.1: f^!O_Y = ω_{X/S} ⊗ f^*ω_{Y/S}^{-1} | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/residue-symbol-trace-property — Residues and the trace (Hartshorne, property (R6)) | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-PILLONI-20/trace-map-projectively-embeddable — Trace map Rf_*f^! ⇒ Id for projectively embeddable f | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/upper-shriek-base-change — Proposition 4.2.5.1 (1): base change of f^!O_Y | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/upper-shriek-for-embeddable-morphisms — The functor f^! for embeddable morphisms (Hartshorne) | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/upper-shriek-of-lci-structure-sheaf — Proposition 4.1.3.1: h^!O_S = ω_{X/S}[n] for lci h | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-PILLONI-20/upper-shriek-projection-formula — Proposition 4.1.2.1: f^!F ⊗^L Lf^*G = f^!(F ⊗^L G) | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/47 — §3.8.8 and Lemma 3.8.9: coherent duality for embeddable morphisms and f^!O_Y between local complete intersections | imported | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category, SchemeAndStackFoundations:SF.2/relative-dualizing-complex |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/215 — Lemma 3.8.10: f^! commutes with restriction to the zero locus of a non-zero-divisor | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/cartier-duality-restriction |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/216 — §§3.8.11–3.8.15: fundamental classes, their agreement, base change and boundary divisors | imported-with-contract | SchemeAndStackFoundations:key/coherent-duality, SchemeAndStackFoundations:SF.2 |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/217 — Proposition 3.8.17: traces on canonical bundles and restriction to a divisor with ramification | planned | AlgebraicModuliForArithmeticGeometry:A0-extension/ramified-divisor-trace |

## Bibliography

Page numbers refer to the inspected files. Stacks chapter PDFs were the July 14, 2026 snapshot, read October 9, 2026. The individual targets give precise theorem and section locators.

- **The Stacks Project authors.** [The Stacks Project: Artin axioms](https://stacks.math.columbia.edu/download/artin.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `c90df80ae07d0b1a1bc5a886c5deea52fe07dcc2623e5903099333a144628bb2`.
- **The Stacks Project authors.** [The Stacks Project: More on Algebra](https://stacks.math.columbia.edu/download/more-algebra.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `ab69179738e642603ddbde651f2838e1cb5d8711e8bcd7c447cbf02a8bb6a5d2`.
- **The Stacks Project authors.** [The Stacks Project: Smoothing Ring Maps](https://stacks.math.columbia.edu/download/smoothing.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `7d2564c4b687ecb73aaf4dbde5fa991a92d638933d2858ee927f600b3564c884`.
- **The Stacks Project authors.** [The Stacks Project: Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `99304b1a36799044a20cb7c74ad12e1a73e06ca2cd3b132b6c37a9b869a41a29`.
- **The Stacks Project authors.** [The Stacks Project: Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `12b0c4526935a1e2cfc417063416648a15cf4d84a0976b53274ae5f644487eb0`.
- **The Stacks Project authors.** [The Stacks Project: Moduli Stacks](https://stacks.math.columbia.edu/download/moduli.pdf). Downloaded author version; Stacks chapter snapshot dated July 14, 2026. Read 2026-10-09; SHA-256 `0d0e7ceba8b729155aba23756c211601f5ec2004dfb8b911ebd4e6cdb810a656`.
- **Steven L. Kleiman.** [The Picard scheme](https://arxiv.org/pdf/math/0504020). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `cc14e62f0ebebb8617777651bbcd08bb7548cb9fe955f3a25bb6491c5f3beeaa`.
- **Brian Conrad and Michael Temkin.** [Non-archimedean analytification of algebraic spaces](https://math.stanford.edu/~conrad/papers/analgpaper.pdf). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `ecfb9dad9c7e27ec36e3a40111ea140fc3bf2589f41b58f97e036e4e2ce6394e`.
- **Michael Artin.** [Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434`.
- **Michel Raynaud.** [Spécialisation du foncteur de Picard](https://www.numdam.org/article/PMIHES_1970__38__27_0.pdf). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `fdba4b96e9f3fa3eeb158868217b95ffd4172f128148a70013115666cf04cf92`.
- **Stefan Schröer.** [Enriques surfaces over the integers](https://arxiv.org/pdf/2004.07025). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61`.
- **Philip Dittmann and Florian Pop.** [Characterizing finitely generated fields by a single field axiom](https://arxiv.org/pdf/2012.01307). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`.
- **George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni.** [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
- **Frank Calegari and David Geraghty.** [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`.
- **Vincent Pilloni.** [Higher coherent cohomology and p-adic modular forms of singular weight](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.
- **Najmuddin Fakhruddin and Vincent Pilloni.** [Hecke operators and the coherent cohomology of Shimura varieties](https://www.imo.universite-paris-saclay.fr/~pilloni/heckeoperators.pdf). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `db004b2e685bd27001bd1fb719b9f7908a08ca39da9b5e0cd56914855ad9d7b6`.
- **Bogdan Zavyalov.** [Some foundational results in adic geometry](https://arxiv.org/pdf/2111.01830). Public author PDF identified by SHA-256. Read 2026-10-09; SHA-256 `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951`.
- **Tau Ceti roadmap contributors.** [Existing complex analytification and Artin comparison proposal](https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/ComplexComparison/README.md). PR 196 head 4bd72379658126cbe9be935656396f0c9dac4de0. Read 2026-10-09; SHA-256 `1c58d7db30b9acbe8656b29345d1c92cd334ef5b14cb35d644967b7adb96477c`.
