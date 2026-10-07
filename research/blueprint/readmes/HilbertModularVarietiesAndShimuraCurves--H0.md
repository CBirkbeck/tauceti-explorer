# Hilbert modular varieties and Shimura curves: H0–H6 and R18.1

This part constructs the Hilbert and quaternionic specializations of the general
Shimura and PEL libraries. It keeps the geometric scalar-determinant group and
the arithmetic restriction-of-scalars group distinct, accepts nonprincipal
polarization ideals, and plans Deligne–Pappas geometry at every rational prime.
It also supplies the actual paired torsion twists and local witnesses required
as inputs to potential modularity, including the elliptic spaces in Allen et al.
The quaternionic strand constructs the one-real-split canonical curve and its
auxiliary Yuan–Zhang PEL comparisons.

The [packet](../packets/HilbertModularVarietiesAndShimuraCurves--H0.json) is a
target-level dependency plan. All eight stages are **planned**; none is certified
closed. Its supplier requests and source-proof gaps specify the exact work
needed for closure. Every declaration has implementation status unchecked. The
[suggested file](../suggested/HilbertModularVarietiesAndShimuraCurves--H0.lean)
prototypes signatures on available library carriers and records the contracts
that cannot yet be typed. It is not a proof of the advanced moduli theory.

Its executable Mathlib core has 66 named declarations and 22 named test examples.
The complete contract ledger lists all 137 API items and 108 tests, distinguishing
typed cores from omitted supplier interfaces. Positive-unit formulas use an
explicit subgroup parameter P. Their arithmetic specialization is the existing
Tau Ceti positive-unit subgroup, whose compiled module is absent from the shared
build; no replacement positivity predicate is introduced. The handoff states
exactly which portion was elaborated.

## Ownership and conventions

The accepted [RS-23 restructuring](../restructure/RS-23.result.json) fixes the
boundaries. ShimuraData D5 supplies the rational Hilbert groups, homomorphisms,
domains, reflex fields and trace embedding. This part adds their derived/centre
comparisons, integral lattice refinements and checks of the actual type
witnesses. PELModuli M0–M3 supplies the generic engine; AbelianSchemesAndArithmeticModuli
A1–A5 supplies the relative abelian constructions. H2 proves its bad-prime
specialization rather than applying a good-prime PEL theorem there.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 owns the intrinsic BT₁ Hasse
invariant, Fargues LF and intrinsic BT₁ Hodge–Tate map, as required by accepted
RT-AREA-padic-1/26. H2 constructs the Hilbert Hasse ideal and formal domains from
that invariant. HodgeTateAndCanonicalSubgroups T0 receives the boundary-extension
problem downstream. It is not a prerequisite of H2. The packet records the
corrected owner and a rescoping proposal to repoint the four outstanding source
briefs through their own jobs, including the R07.2 → R15.3 edge. S5 owns the perfectoid
limit, O4 the overconvergent forms, and R23.1–R23.2 the Moret–Bailly application.

Write F for a totally real number field, g=[F:ℚ], O=𝒪_F and d for the absolute
different. The rational groups imported from D5 are

\[
 G=\operatorname{Res}_{F/\mathbf Q}GL_2,\qquad
 G^*=G\times_{\operatorname{Res}_{F/\mathbf Q}\mathbf G_m}\mathbf G_m.
\]

The second map is scalar inclusion. The star on G* denotes this group; it never
denotes a minimal compactification. Fix the homological convention of D5: its h
and the sign of the trace form are checked together. Lattices use **row** vectors.
The full G domain is (H^±)^Σ; the G* domain has the two common-sign components.
A chosen connected positive component is H^Σ in both cases. All determinant,
pairing and component computations below use these conventions.

Let c be a nonzero invertible fractional ideal with its standard ordered cone,
or an explicitly ordered invertible O-module. The trace-dual ideal is
D=FractionalIdeal.dual ℤ ℚ (1)=d⁻¹. The lattice and its alternating trace dual are

\[
 L_c=O\oplus c^{-1}d^{-1},\qquad L_c^{\#}=c\oplus d^{-1}=cL_c.
\]

Thus a nonprincipal c remains visible. The integral polarization is a family
ψ_{c,a}(x,y)=Tr(a(x₁y₂−x₂y₁)), a∈c. Choosing a positive a can give a rational
polarizing form; it does not make c principal or canonically choose a generator.

For the BHW tame convention use N≥4, the O-linear μ_N marking on A, and full
p-level frames on A∨. Choose p with p∤N; neither p∤disc(F) nor p>2 is a global
hypothesis. When an integral representative c is chosen prime to pN, record the
ordered ideal comparison that makes the choice independent. A full constant
torsion basis is a characteristic-zero condition. Integral Γ₀ levels use finite
locally free subgroup schemes.

Put U=O×, U+=NumberField.totallyPositiveIntegerUnits F, U_M={η∈U:η≡1 mod MO}
and S_M={η²:η∈U_M}. Then

\[
 \Delta(N)=U^+/S_N,\quad
 \Delta_n(N)=(U_{p^n}\cap U^+)/U_{p^nN}^{,2},\quad
 \mathcal U_n=(O/p^nO)^\times/\operatorname{image}(U^+).
\]

The congruence applies to the **square root**. Connected Δ_n groups, whole-space
Δ(p^nN) groups and residue component groups are different objects. In particular,
the corrected inverse-limit statement uses the eventual stable images of Δ_∞
in Δ_n; the full projection stabilization printed in BHW fails at p=2.

## Pinned baseline and imported interfaces

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit classifies these
eight advanced stages as not built. This does not erase the existing trace,
fractional-ideal, matrix, quotient-group, unit or narrow-class declarations.
Each baseline statement below was read at its pin; the plan reuses it.

- **mathlib:Algebra.trace** (def; `Mathlib/RingTheory/Trace/Defs.lean`): The trace linear map of a finite algebra; here Tr_{F/ℚ}.
- **mathlib:Submodule.mem_traceDual** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Membership in traceDual A K I iff every trace-form pairing with I lies in the image of A→K.
- **mathlib:FractionalIdeal.dual** (def; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Trace dual fractional ideal; sends zero to zero and nonzero I to the trace-dual submodule.
- **mathlib:FractionalIdeal.dual_eq_mul_inv** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): For the separable integral-closure Dedekind setting, dual A K I=dual A K 1*I⁻¹.
- **mathlib:FractionalIdeal.dual_dual** (lemma; `Mathlib/RingTheory/DedekindDomain/Different.lean`): Trace dual is involutive in the separable integral-closure Dedekind setting.
- **mathlib:Matrix.adjugate_mul_distrib** (theorem; `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`): Over a commutative ring, adjugate(M*N)=adjugate N*adjugate M, with reversed order.
- **mathlib:Matrix.det_adjugate** (theorem; `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`): For a finite matrix of cardinality k, det(adjugate M)=det(M)^(k−1); in dimension2 it equals det M.
- **mathlib:QuotientGroup.mk'** (def; `Mathlib/GroupTheory/QuotientGroup/Defs.lean`): The quotient homomorphism G→G/N for a normal subgroup, on the native quotient-group carrier.
- **tauceti:NumberField.IsTotallyPositive** (def; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): Strict positivity under each real infinite-place embedding.
- **tauceti:NumberField.totallyPositiveIntegerUnits** (def; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): The preimage subgroup of positive field units in the arithmetic unit group (𝒪_F)×.
- **tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits** (theorem; `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`): Every arithmetic unit square belongs to totallyPositiveIntegerUnits.
- **tauceti:NumberField.units_sq_index_eq** (theorem; `TauCeti/NumberTheory/NumberField/Units/ElementaryTwoQuotient.lean`): Index of the square subgroup of arithmetic units equals 2^(NumberField.Units.rank F+1).
- **tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative** (def; `TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean`): Multiplicative equivalence from arithmetic units to torsion(F)×Multiplicative(Fin(rank F)→ℤ).
- **tauceti:NumberField.NarrowClassGroup.instFinite** (instance; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean`): The narrow ideal class group of a number field is finite.
- **tauceti:NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm** (theorem; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/CoprimeRepresentative.lean`): For a narrow class C and nonzero m∈ℤ, an integral ideal J represents C and has absolute norm coprime to m.
- **mathlib:AlgebraicGeometry.Scheme** (structure; `Mathlib/AlgebraicGeometry/Scheme.lean`): The existing locally affine locally ringed space carrier; not a fresh Hilbert-specific definition of scheme.

The following requests are exact stage-only inputs. Finer existing nodes are
cited directly in each declaration and are not repackaged as new objects. A
request describes a producer contract, without claiming it has been proved.

- **AbelianSchemesAndArithmeticModuliPartII:F3**: Import the reviewed honda-tate node for the underlying finite-field isogeny class. Extend its realization contract to the specified O-action, ordinary slopes and ordered polarization used by Taylor Lemma1.3; the unpolarized simple-class classification alone does not supply this structured witness. Keep Honda existence proof with this owner.
- **AbelianSchemesAndArithmeticModuli:A1**: Relative abelian-scheme/group-over-base carrier, endomorphism sheaf and real-multiplication action, base change and rigidity for the N≥4 Hilbert tame marking. Reuse the pinned Scheme and Tau Ceti group-object/abelian-variety carriers; an abelian variety over a field is not yet this relative object.
- **AbelianSchemesAndArithmeticModuli:A2**: Dual abelian scheme with biduality, symmetric O-linear Hom sheaf, positive polarizations from ample bundles, Rosati fixing O, and pullback compatibility. The existing rosati-involution node is imported, but alone does not provide this relative dual/polarization package.
- **AbelianSchemesAndArithmeticModuli:A3**: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- **AbelianSchemesAndArithmeticModuli:A4**: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.
- **AlgebraicModuliForArithmeticGeometry:R09.1**: Relative rank-g Grassmannian and invariant-subbundle equations: closed representability of O-stability and the self-orthogonal wedge condition, with universal subbundle and arbitrary base change. No abelian moduli construction is requested here.
- **AlgebraicModuliForArithmeticGeometry:R09.3**: Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6**: Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2**: Per accepted RT-AREA-padic-1/26, generic BT₁ Ha=det(V*) in (detω)^(p−1), its base-change law and intrinsic ordinary criterion at EVERY p including2; polarized O-linear ordinary decomposition sufficient for ω to be rank one over O⊗k. Generic Fargues LF and intrinsic BT₁ Hodge–Tate map remain here; H2 only specializes Ha and its ideal, and T0 owns the boundary extension downstream.
- **AlgebraicModuliForArithmeticGeometry:R09.5**: Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1**: General finite locally free subgroup-scheme/Cartier-dual carrier with rank, O-action, isotropy and base change used for integral Γ₀ levels. The p-divisible-group and Raynaud specialized nodes do not by themselves supply this subgroup parameter functor.
- **ModularCurvesPartII:R12.2**: The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.
- **AbelianSchemesAndArithmeticModuli:A5**: Algebraization of the trace-polarized complex/real Hilbert torus, the homological lattice period map and its compatibility with dual/tame/pairing levels. Supply the real involution and polarization-sign computation used to identify paired torsion frames.
- **ReductiveGroupsPartII:RG2.0a**: Restriction of scalars, central algebraic-group quotients and fibre products on existing carriers, including Res B×, its norm-one derived group and the quotient (B××E×)/{(a⁻¹,a)} with descended norm/conjugation maps.
- **tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion**: Existing quaternion algebra, conjugation, reduced norm/trace, real matrix splitting and CM scalar extension comparison used for the quaternionic datum and PEL bridge. Import upstream rather than proposing another quaternion algebra.
- **ShimuraVarieties:V8**: Canonical finite-level models and complex uniformization over the D3 reflex field for the D4 SV1–SV3 quaternionic datum, whose central weight need not be Q-rational; small-level effective quotient, properness and datum-map descent. Existing finite-level-maps/datum-functoriality nodes are used, but do not alone state this canonical-model endpoint.
- **ReductiveGroupsPartII:RG2.0**: Real/local points and their topology on the imported quaternion and restriction-of-scalars algebraic groups, including arithmetic subgroup actions and their scalar kernels.
- **ReductiveGroupsPartII:RG2.3**: Integral quaternion order levels (1+NÔ_B)×, their compact openness and nested-level comparison, with effective rational scalar stabilizers computed separately.

## Source route

Birkbeck–Heuer–Williams §§5.1–5.2 and 8.1–8.4 fix the Hilbert group, pairing,
level, unit and component conventions. Deligne–Pappas §§1–4 supplies the
polarization evaluation condition and the ramified local-model proof, including
flatness, complete-intersection structure and normal geometric fibres.
Andreatta–Iovita–Pilloni §§3.1–3.2 and 5.2.4 supplies the ordinary/Rapoport and
Hasse-neighborhood comparisons. Hida §9.1 corroborates the ordinary discussion
under its own unramified assumptions and is not used to discard ramified primes.

Taylor's Fontaine–Mazur paper §1 supplies the Hilbert torsion moduli and the
ordinary/multiplicative/real constructions. Allen et al. §7.2.5 supplies the
elliptic Y_i and its CM restriction of scalars X_i, the dual second residual
module and the finite local construction. Its published pp.1103–1106 were
collated with the accepted author copy. Yuan–Zhang §§3.1, 4.1 and 5.1 supplies
the quaternionic datum, auxiliary PEL group and reflex field, effective small
levels, and the connected/torus bridge comparisons.

These are the target-relevant passages, not claims to have extracted every
result of each paper. Lan's generic PEL arguments are imported through the actual
M0–M3 nodes. The missing Kisin–Lai and Carayol proof interiors are explicit gaps.
R18.2's integral models and p-divisible comparisons and R18.5's bad-prime
uniformization are outside this part. Added CDN and KW II sources belong to
those excluded strands. The Yuan–Zhang height erratum and extraction findings
about height/p-divisible assertions are screened without reusing those results.

## Declaration plan

The default hypotheses in every layer are the F,O,g,d conventions above.
Additional hypotheses occur in the statements. Each heading carries its stable
node id. Definitions and constructions list the API derived from their actual
uses, and three tests that distinguish them from plausible wrong definitions.
Other nodes give the statement, proof route and acceptance checks.

### H0. The two data and their domains

Reuse D5’s rational data. Compute their derived groups and full algebraic centres, then refine the trace representation by the actual ordered lattice. The centre of G* can be disconnected; its identity component alone is not the centre. The abelian-type comparison uses the derived group, while the Hodge-type assertion uses the actual G* trace embedding.

#### Derived groups and algebraic centres

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/derived-centres` · theorem.

On D5’s groups G and G*, both derived groups are Res_{F/ℚ}SL₂ and their inclusion is the identity there. Z(G)=Res_{F/ℚ}G_m. Z(G*) is the subgroup of scalar matrices t I₂ with t² in the diagonal G_m, including its finite geometric components; its identity component is diagonal G_m. Dimensions are 4g and 3g+1. No connectedness of the full centre of G* is assumed.

**Proof or construction.**

1. Base change the imported groups to a splitting field: G becomes ∏GL₂ and G* the common-determinant subgroup.
2. Compute commutators and centralizers factor by factor; preserve the equations t_τ²=t_σ² as scheme equations, not merely real points.
3. Descend the comparisons along the imported restriction-of-scalars and fibre-product maps.

**Direct prerequisites:** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`.

**Acceptance.** For F=ℚ both groups and centres coincide. For g=2, the centre of G* over an algebraic closure has two components.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H0, first paragraph; RS-23 H0 keeps. The packet stores the short literal anchor “derived-group and centre descriptions”.

**Atlas planet:** Hilbert derived groups.

#### Independent signs and common signs

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison` · comparison.

The map of D5 data identifies the common-sign G* domain H^Σ ⊔ (H⁻)^Σ with the corresponding two components of the G domain (H^±)^Σ. The latter has 2^g components; both have complex dimension g and reflex field ℚ. The connected positive domains are equal, but the full conjugacy classes differ for g>1.

**Proof or construction.**

1. Use the imported real group identifications and the signs of the determinants acting on each half-plane.
2. A common determinant forces a common sign; arbitrary G determinants allow independent signs.
3. Compare the imported cocharacter Galois orbits to their already computed reflex fields.

**Direct prerequisites:** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`, `HilbertModularVarietiesAndShimuraCurves:H0/derived-centres`.

**Acceptance.** For a real quadratic field the component counts are 4 and 2. The mixed upper/lower point does not lie in the G* conjugacy class.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H0, domain comparison. The packet stores the short literal anchor “common-sign components”.

#### Polarization lattice

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice` · definition.

For a nonzero invertible fractional ideal c of O, let D=Fractional Ideal.dual ℤ ℚ O=d⁻¹ and L_c=O⊕c⁻¹D⊂F², with row-vector convention. This is the integral lattice refining D5’s rational representation. For an integral ideal c, K_c is its finite adelic stabilizer; a column convention uses the transpose-conjugate lattice.

**Proof or construction.**

1. Reuse the pinned fractional ideal and trace-dual carriers; define only this Hilbert lattice.
2. Use invertibility of c and the trace-dual formula to identify the second summand.
3. Fix the row convention before calculating stabilizers.

**Direct prerequisites:** `mathlib:FractionalIdeal.dual`, `mathlib:FractionalIdeal.dual_eq_mul_inv`, `ShimuraData:D5/hilbert-trace-embedding`.

**Uses.** BHW Definition 5.2: Determine the actual adelic level stabilizer. H1 trace PEL instance: Retain the polarization module in the integral lattice.

**API.**

- `TauCeti.HilbertModular.polarizationLattice` (constructor): Construct L_c as the O-submodule O×c⁻¹d⁻¹ of F×F.
- `TauCeti.HilbertModular.mem_polarizationLattice` (characterisation): (x,y)∈L_c iff x∈O and y∈c⁻¹d⁻¹.
- `TauCeti.HilbertModular.polarizationLattice_rank` (structure): L_c is projective of rank 2 over O and free of rank 2g over ℤ.
- `TauCeti.HilbertModular.polarizationLattice_rescale` (functoriality): For a∈F×, diag(1,a⁻¹) carries L_c to L_{ac} in the row convention.

**Unit tests.**

- `TauCeti.HilbertModular.lattice_Q` (computation): For F=ℚ,c=ℤ, L_c=ℤ².
- `TauCeti.HilbertModular.lattice_nonprincipal` (non-example): L_c is defined for a nonprincipal c without choosing a generator.
- `TauCeti.HilbertModular.lattice_different` (compatibility): For c=O the second summand is the pinned trace dual of O, not O unless d is trivial.

**Acceptance.** Its ℤ-rank is 2g; the zero ideal is excluded.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Notation 5.1(3) and Definition 5.2(1), pp.1740–1741. The packet stores the short literal anchor “Definition 5.2.”.

**Atlas planet:** Polarization lattice.

#### Integral trace polarization family

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family` · definition.

For a∈c and x,y∈L_c set ψ_{c,a}(x,y)=Tr_{F/ℚ}(a(x₁y₂−x₂y₁))∈ℤ. This is a family parametrized O-linearly by c, rather than a canonical principal symplectic form. Nonzero a gives a nondegenerate rational alternating form; totally positive a has the polarization sign prescribed by D5 (negate the form if the positive h(i) convention is used).

**Proof or construction.**

1. Multiply the wedge in c⁻¹d⁻¹ by a∈c, obtaining d⁻¹.
2. Apply the pinned trace-dual membership criterion to obtain an integer.
3. Restrict the imported rational trace form, recording its sign and parameter.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice`, `mathlib:Submodule.mem_traceDual`, `mathlib:Algebra.trace`, `ShimuraData:D5/hilbert-trace-form`.

**Uses.** H1 c-polarization: Encode the whole ordered polarization module. H6 real points: Fix the trace polarization sign at every embedding.

**API.**

- `TauCeti.HilbertModular.integralTraceFamily` (constructor): Map c to the alternating ℤ-bilinear forms on L_c by a↦ψ_{c,a}.
- `TauCeti.HilbertModular.integralTraceFamily_apply` (simp): Evaluation is Tr(a(x₁y₂−x₂y₁)).
- `TauCeti.HilbertModular.integralTraceFamily_parameter_add` (functoriality): ψ_{a+b}=ψ_a+ψ_b and ψ_0=0.
- `TauCeti.HilbertModular.integralTraceFamily_integral` (compatibility): Its rational image agrees with D5’s trace representation multiplied by a.

**Unit tests.**

- `TauCeti.HilbertModular.traceFamily_Q` (computation): Over ℚ,c=ℤ,a=1 its value on the two standard basis vectors is 1.
- `TauCeti.HilbertModular.traceFamily_zero` (degenerate): The a=0 form is zero, hence is not declared nondegenerate.
- `TauCeti.HilbertModular.traceFamily_ramified` (non-example): For F=ℚ(√2), the second summand uses d⁻¹=(2√2)⁻¹O, preventing a false O² self-duality assertion.

**Acceptance.** No generator of c is part of the definition.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Notation 5.1(3), p.1740; compare DP§2.12. The packet stores the short literal anchor “trace pairing”.

**Atlas planet:** Trace polarization.

#### Trace-dual lattice and its stabilizer

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality` · theorem.

For ψ(x,y)=Tr(x₁y₂−x₂y₁), the ℤ-dual lattice of L_c is c⊕d⁻¹=c L_c. Its finite adelic row stabilizer is K_c=GL₂(A_{F,f})∩[[Ô,(cd)⁻¹Ô],[cdÔ,Ô]]. Intersecting with G*(A_f) imposes rational scalar determinant. These are equalities of lattices and groups, including nonprincipal c.

**Proof or construction.**

1. Dualize the two summands using the pinned fractional-ideal trace-dual formula.
2. Use the row action: L_c γ=L_c determines the four entry ideals and invertibility of γ.
3. Apply the calculation locally, then take restricted products.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/polarization-lattice`, `HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family`, `mathlib:FractionalIdeal.dual_eq_mul_inv`, `mathlib:FractionalIdeal.dual_dual`.

**Acceptance.** For c=O the trace lattice is unimodular. In a nonprincipal class the equality c L_c=L_c^# does not manufacture a principal polarization.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Notation 5.1(3) and Definition 5.2(1), pp.1740–1741. The packet stores the short literal anchor “Definition 5.2.”.

**Atlas planet:** Trace-dual lattice.

#### Hodge and abelian type witnesses

**Node:** `HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses` · theorem.

D5’s actual trace embedding of (G*,X*) into the Siegel datum, with the sign fixed by integral Trace Family, is a D4 Hodge-type witness. The identity Res SL₂→Res SL₂ on the derived groups induces the common connected adjoint datum, and is a D4 abelian-type witness for (G,X). It does not assert a Hodge-type embedding of the exact group G.

**Proof or construction.**

1. Verify closed immersion and compatibility with h for D5’s map, not just faithfulness of a real representation.
2. Use the common derived group and connected adjoint domains for the central-isogeny condition.
3. Separate the integral lattice refinement from the rational type assertion.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/derived-centres`, `HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison`, `HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family`, `ShimuraData:D5/hilbert-trace-embedding`, `ShimuraData:D4/hodge-type`, `ShimuraData:D4/abelian-type`.

**Acceptance.** The witness for G is a derived comparison, with no forced similitude for independent determinants.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Notation 5.1, continuation p.1741. The packet stores the short literal anchor “of abelian type”.

**Atlas planet:** Hilbert type witnesses.

**Layer closure obligations.**

- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.

### H1. Polarization modules and Hilbert–Blumenthal moduli

A symmetric homomorphism, a positive polarization and an ordered c-polarization are three levels of structure. The DP evaluation isomorphism is essential. Match the μ_N marking and the row stabilizer before applying the PEL complex comparison. The norm characteristic polynomial is stored in full. A local pairing generator changes the multiplier and is never called canonical.

#### Ordered polarization module

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module` · definition.

An ordered invertible O-module is a projective rank-one O-module c with, for each real embedding τ, a chosen component c_τ^+ of (c⊗_{O,τ}ℝ)\{0}. Its positive cone is the set of elements whose images lie in all selected components. Fractional ideals have the standard embedding order, and ordered isomorphisms preserve each component.

**Proof or construction.**

1. Transport the projective rank-one module to a fractional ideal; retain the ordering as part of the object.
2. Define positivity using real scalar extension, agreeing with the pinned totally-positive predicate for the standard O object.

**Direct prerequisites:** `mathlib:FractionalIdeal.dual`, `tauceti:NumberField.IsTotallyPositive`.

**Uses.** Taylor§1, pp.9–13: Define the HBAV polarization and its real signature. H3 ideal comparisons: Distinguish ordinary from narrow ideal classes.

**API.**

- `TauCeti.HilbertModular.OrderedPolarizationModule` (constructor): Package the invertible O-module with the chosen real half-lines.
- `TauCeti.HilbertModular.positiveCone` (data): The intersection of their inverse images in c.
- `TauCeti.HilbertModular.orderedModule_iso` (characterisation): A module isomorphism is ordered iff it sends each selected real half-line to the selected half-line.
- `TauCeti.HilbertModular.standard_positiveCone` (compatibility): For standard c=O, its cone equals {a∈O | Number Field.Is Totally Positive(a:F)}.

**Unit tests.**

- `TauCeti.HilbertModular.ordered_Q` (computation): For O=ℤ the standard cone consists of positive integers.
- `TauCeti.HilbertModular.ordered_negative` (non-example): Multiplication by−1 is not an automorphism of the standard ordered module.
- `TauCeti.HilbertModular.ordered_nonprincipal` (compatibility): An invertible nonprincipal ideal with its embedding cones is admitted without a basis.

**Acceptance.** An unordered module is not sufficient to specify a polarization cone.

**Source:** [TAYLOR02](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf), §1, p.9, ordered invertible OM-module. The packet stores the short literal anchor “ordered invertible”.

**Atlas planet:** Ordered polarization module.

#### Symmetric real multiplication polarizations

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations` · definition.

For an A1 abelian scheme A/S of relative dimension g with unital injective real multiplication ι:O→End_S(A), P(A,ι) is the étale sheaf of O-linear maps f:A→A∨ satisfying f=f∨ under A2 biduality. P(A,ι)^+ is the subsheaf of polarizations, defined by A2 ampleness. On the Hilbert locus the sheaf is an invertible O-module with its embedding-wise order; the evaluation condition is imposed by the separate c-polarization definition.

**Proof or construction.**

1. Use the imported dual and Hom sheaf to equalize f and f∨ and impose O-linearity.
2. The positive cone comes from ample line bundles via A2; define the DP evaluation condition separately from a single positive homomorphism.
3. Use Serre tensor and étale localization to interpret c as an ordered locally constant sheaf.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module`, `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`.

**Uses.** BHW Definition 5.3: Provide the HBAV family on M1 carriers. DP2.1 and H2: Define the integral DP moduli condition.

**API.**

- `TauCeti.HilbertModular.HilbertPolarizationModule` (constructor): The symmetric O-linear Hom sheaf P(A,ι).
- `TauCeti.HilbertModular.hilbertPolarizationModule_positive` (projection): The subsheaf of positive homomorphisms from A2 ampleness.
- `TauCeti.HilbertModular.hilbertPolarizationModule_mem` (characterisation): A section is an O-linear map equal to its bidual transpose.
- `TauCeti.HilbertModular.hilbertPolarizationModule_pullback` (functoriality): Pullback is the A2 Hom/duality base-change map on the stipulated Hilbert locus.

**Unit tests.**

- `TauCeti.HilbertModular.polModule_Q` (compatibility): For a geometric elliptic curve the symmetric Hom group is ℤ, with its degree-positive ray.
- `TauCeti.HilbertModular.polModule_zero` (degenerate): Zero is symmetric and is excluded from the positive cone.
- `TauCeti.HilbertModular.polModule_negative` (non-example): If λ is a polarization, −λ is symmetric but not positive.

**Acceptance.** Symmetry and positivity are separate conditions.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), §§1.1–1.5 and 2.1, pp.60–63. The packet stores the short literal anchor “polarisation”.

#### Ordered c-polarization

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization` · definition.

For an ordered invertible O-module c and a real-multiplication abelian scheme A/S, a c-polarization is an ordered isomorphism c_S≅P(A,ι), preserving the positive cones, whose evaluation A⊗_O c→A∨ is an isomorphism. The Serre tensor, duality and positivity are A2/A3 imports. This is the DP condition, including nonprincipal c.

**Proof or construction.**

1. Use the imported dual and Hom sheaf to equalize f and f∨ and impose O-linearity.
2. The positive cone comes from ample line bundles via A2; define the DP evaluation condition separately from a single positive homomorphism.
3. Use Serre tensor and étale localization to interpret c as an ordered locally constant sheaf.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations`, `HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**Uses.** BHW Definition 5.3: Provide the HBAV family on M1 carriers. DP2.1 and H2: Define the integral DP moduli condition.

**API.**

- `TauCeti.HilbertModular.CPolarization` (constructor): The ordered isomorphism with the DP evaluation condition.
- `TauCeti.HilbertModular.cPolarization_eval` (projection): The induced evaluation isomorphism A⊗_O c≅A∨.
- `TauCeti.HilbertModular.cPolarization_baseChange` (functoriality): Evaluation and positivity commute with arbitrary base change.
- `TauCeti.HilbertModular.cPolarization_rosati` (compatibility): Every positive section gives a polarization whose Rosati involution fixes O.

**Unit tests.**

- `TauCeti.HilbertModular.cPol_elliptic` (compatibility): For F=ℚ,c=ℤ this is the principal elliptic polarization.
- `TauCeti.HilbertModular.cPol_negative` (non-example): The negative symmetric map reverses the cone and is not a c-polarization.
- `TauCeti.HilbertModular.cPol_nonprincipal` (non-example): No global generator of c is required.

**Acceptance.** Symmetry and positivity are separate conditions.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), §§1.1–1.5 and 2.1, pp.60–63. The packet stores the short literal anchor “polarisation”.

**Atlas planet:** Hilbert–Blumenthal polarization.

#### Hilbert PEL instance

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance` · construction.

For c as in H1, specialize M0/M1 with B=F, *=id, V=F², L=L_c and the c-indexed integral trace polarization family. At primes where a chosen positive a∈c and d give the good PEL lattice hypotheses, this is the usual trace-pairing PEL datum; the homological h and positivity sign agree with H0. At other primes it is a generic-fibre datum with a DP integral extension constructed in H2, not an application of M2 smoothness.

**Proof or construction.**

1. Insert the actual lattice and scalar involution into M0; verify ψ(ax,y)=ψ(x,ay).
2. Use H0 type witnesses and A2 positivity to match M1’s homological convention.
3. List every inverted prime of the chosen good lattice; do not propagate that list to H2.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses`, `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality`, `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `PELModuli:M0/integral-pel-datum`, `PELModuli:M1/pel-abelian-scheme`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** PELModuli M2/M3: Apply general representability and complex comparison to checked inputs. H2: Identify the canonical characteristic-zero fibre of the DP model.

**API.**

- `TauCeti.HilbertModular.hilbertPELInstance` (constructor): The specialization map from the ordered c-polarization data to M0/M1.
- `TauCeti.HilbertModular.hilbertPEL_involution` (simp): The adjoint action of every a∈F is the identity involution a↦a.
- `TauCeti.HilbertModular.hilbertPEL_lattice` (data): The integral lattice is L_c and its trace dual is c L_c.
- `TauCeti.HilbertModular.hilbertPEL_moduli_equiv` (equivalence): The specialized M1 objects are exactly H1’s HBAV objects with the listed level and determinant conditions.

**Unit tests.**

- `TauCeti.HilbertModular.pel_Q` (compatibility): For F=ℚ,c=ℤ obtain the genus-one PEL object.
- `TauCeti.HilbertModular.pel_nonprincipal` (non-example): For nonprincipal c the lattice comparison retains c rather than replacing it by O.
- `TauCeti.HilbertModular.pel_ramified` (non-example): A ramified prime failing the perfect-lattice condition cannot be declared smooth by M2.

**Acceptance.** A good-prime M2 invocation carries its actual perfect-lattice hypothesis.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Notation 5.1 and Definition 5.3, pp.1740–1741. The packet stores the short literal anchor “Definition 5.3.”.

**Atlas planet:** Hilbert PEL datum.

#### Full Hilbert determinant condition

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant` · theorem.

In characteristic zero, and on the integral Rapoport locus, Lie(A) is rank one over O⊗𝒪_S and for every a∈O its characteristic polynomial is Norm_{F/ℚ}(T−a). This full polynomial is the M0 determinant condition; equality of traces alone is insufficient in ramified characteristic. The all-base DP implication is proved in H2 from flatness of the universal model and pullback, not from equality on geometric points.

**Proof or construction.**

1. Use the characteristic-zero Hilbert multiplicities and the free rank-one module on the Rapoport locus to compute the regular-representation norm polynomial.
2. Store all characteristic-polynomial coefficients in M0’s determinant interface and its base-change compatibility.
3. For the ramified non-Rapoport locus use H2’s universal-flatness argument. A DP⇔Kottwitz converse is neither used nor asserted.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `PELModuli:M0/determinant-condition`, `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance.** At ramified p a trace equality alone is not accepted. No equality of morphisms on a nonreduced base is inferred solely from geometric points.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), Proposition 2.7 and Corollary 2.9, pp.65–66. The packet stores the short literal anchor “PROPOSITION 2.7.”.

#### Hilbert tame level functors

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors` · definition.

Over ℤ[1/N], N≥4, the tame μ_N level is an O-linear closed immersion d⁻¹⊗_ℤμ_N→A[N]. Define the K₀(c,N), K₁(c,N) and K(c,N) variants through the corresponding finite-flat subgroup, marked quotient/Cartier-dual generator, and full lattice-level conditions. Their adelic groups are the row stabilizers of H0 with reductions respectively [[*,*],[0,*]], [[*,*],[0,1]], and I₂. The μ_N functor matches this K₁ convention, not an unexplained e₁ convention.

**Proof or construction.**

1. Specialize the imported finite-flat torsion and M1 level functors with d⁻¹ visible.
2. Use Cartier duality and the chosen row convention to identify the marked quotient and lower-right 1 subgroup.
3. Define isomorphisms and base change through M1, retaining rigidity N≥4.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality`, `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**Uses.** BHW§5.1.2: Identify the tame moduli fibre with its canonical Shimura variety. H3 unit action: Compute the stabilizer using this exact marking.

**API.**

- `TauCeti.HilbertModular.HilbertTameLevel` (constructor): An O-linear closed immersion d⁻¹⊗μ_N→A[N], N invertible.
- `TauCeti.HilbertModular.hilbertTameLevel_pullback` (functoriality): Pullback preserves the level and closed immersion.
- `TauCeti.HilbertModular.hilbertTameLevel_K1` (compatibility): The complex lattice stabilizer is K₁(c,N) with lower-right entry 1.
- `TauCeti.HilbertModular.hilbertTameLevel_forget` (projection): The full-level, marked-quotient and subgroup levels have their compatible forgetful maps.

**Unit tests.**

- `TauCeti.HilbertModular.tame_Q` (compatibility): For F=ℚ the μ_N inclusion is the Cartier-dual version of the usual Y₁(N) marking after the stated isogeny/convention comparison.
- `TauCeti.HilbertModular.tame_badN` (non-example): If N is not invertible, the same level is not silently treated as an étale constant basis.
- `TauCeti.HilbertModular.tame_transpose` (computation): Conjugating the row convention by the standard symplectic matrix converts the marked e₂ quotient stabilizer to the e₁ stabilizer.

**Acceptance.** Every variant has its own kernel calculation and does not inherit Δ(N) automatically.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definitions 5.2 and 5.4(1), pp.1741–1742. The packet stores the short literal anchor “Definition 5.4”.

**Atlas planet:** Hilbert tame level.

#### Good-prime representability and universal family

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/good-representability` · theorem.

For the H1 PEL instance with M2’s good-prime hypotheses, the specialized moduli is a smooth separated finite-type algebraic stack. If N≥4 rigidifies all automorphisms it is an algebraic space with its descended universal HBAV. Scheme and quasi-projective assertions require the DP representability/ample hypotheses used in H2 or the later compactification supplier; they are not inferred merely from trivial inertia. The μ_N DP scheme over ℤ[1/N] is constructed in H2 at arbitrary primes.

**Proof or construction.**

1. Apply M2 only after checking the integral lattice and determinant hypotheses.
2. Check that an automorphism fixing the μ_N marking and polarization is trivial at the stipulated tame level.
3. Distinguish the representable algebraic-space statement from the stronger DP scheme statement.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `PELModuli:M2/representability`, `PELModuli:M2/universal-family`.

**Acceptance.** No universal family is pushed through an arbitrary coarse arithmetic quotient.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), §5.1.2, pp.1744–1745. The packet stores the short literal anchor “represented by the Hilbert moduli scheme”.

#### Linearized Hilbert Weil pairing

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing` · construction.

For m invertible on S and a c-polarized HBAV, define ẽ_m:A[m]×A∨[m]→d⁻¹⊗_ℤμ_m by ẽ_m(x,y)(a)=e_m(ax,y). Under the trace identification d⁻¹≅Hom_ℤ(O,ℤ), it is perfect O-bilinear and Tr∘ẽ_m=e_m. Combining λ⁻¹ with it gives an alternating pairing on A∨[m] with target c d⁻¹⊗μ_m; equivalently its first argument is twisted by c⁻¹ and the target is d⁻¹⊗μ_m. The pairing on integral finite-flat torsion is an fppf pairing, not a pairing just of geometric points.

**Proof or construction.**

1. Use the A3 Weil pairing and its Rosati adjointness to make a↦e_m(ax,y) O-linear.
2. Apply the trace-dual identification; prove perfectness by the imported Cartier-dual Weil perfectness.
3. Transport through the actual λ and retain the c⁻¹ twist.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality`, `mathlib:Submodule.mem_traceDual`, `AbelianSchemesAndArithmeticModuli:A3`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** BHW Definitions 5.7 and 8.8: Detect rational scalar pairing multipliers at full level. H6 torsion twists: Specify determinant and pairing compatibility.

**API.**

- `TauCeti.HilbertModular.linearWeilPairing` (constructor): The O-linearized pairing on A[m]×A∨[m].
- `TauCeti.HilbertModular.linearWeilPairing_trace` (compatibility): Tr(ẽ_m(x,y))=e_m(x,y).
- `TauCeti.HilbertModular.linearWeilPairing_Olinear` (structure): ẽ_m(ax,y)=a·ẽ_m(x,y)=ẽ_m(x,ay).
- `TauCeti.HilbertModular.linearWeilPairing_baseChange` (functoriality): The construction commutes with base change and compatible torsion transition maps.

**Unit tests.**

- `TauCeti.HilbertModular.weil_Q` (compatibility): For O=ℤ,d=ℤ the linearized and original Weil pairings agree.
- `TauCeti.HilbertModular.weil_codifferent` (non-example): For ramified F the target is d⁻¹⊗μ_m, rather than a canonically identified O⊗μ_m.
- `TauCeti.HilbertModular.weil_zero` (degenerate): Pairing either zero torsion section gives the identity section of μ_m and the zero additive linearization.

**Acceptance.** Trace recovers the original Weil pairing with its Tate twist.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.6 and equation(5.1), p.1743. The packet stores the short literal anchor “Definition 5.6.”.

**Atlas planet:** Linearized Weil pairing.

#### Pairing and ideal change laws

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws` · theorem.

At p, choose β:c⁻¹O_p≅d⁻¹(1). If β′=u β with u∈O_p× and the pulled-back pairing is b·⟨ , ⟩_β, then b′=u⁻¹b. Rescaling a c-polarization by η∈O×,+ while fixing the A∨ basis changes b to η⁻¹b. An ordered isomorphism c→c′ transports both λ and β and yields a comparison functor; totally positive multiplication and changes of roots of unity satisfy the corresponding multiplicative cocycle laws. The μ_N comparison does not make c d⁻¹(1) canonically trivial.

**Proof or construction.**

1. Compare β and u β in the determinant pairing to get b′=u⁻¹b.
2. Replace λ⁻¹ by η⁻¹λ⁻¹ to calculate polarization rescaling.
3. Use Serre tensor functoriality and multiply the scalar changes to prove the cocycle identities.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`.

**Acceptance.** For u outside scalar ℤ_p×, the set of G* bases relative to a fixed β changes; the two descriptions have an explicit comparison.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.6, equation(5.2), footnote(2), pp.1743–1744; Lemma 8.9, p.1769. The packet stores the short literal anchor “Lemma 8.9.”.

#### Complex Hilbert moduli comparison

**Node:** `HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison` · comparison.

For N≥4 and the selected ideal/lattice data, X(c,μ_N)_ℂ identifies with Sh_{K₁*(c,N)}(G*,X*), and the variants identify with their matching K,K₀,K₁ levels. The isomorphism is induced by polarized homology with the trace lattice and the H0 datum. It includes M3’s actual component decomposition; changing ideal representatives or β/root choices changes the displayed moduli trivialization by the H1 comparison laws.

**Proof or construction.**

1. Apply M3 to the checked Hilbert instance, using A5’s homological polarization convention.
2. Identify the lattice stabilizers through H0 and the tame marking through H1.
3. Keep the ker¹/component labels unless their vanishing is separately proved; verify every level and ideal-change map.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws`, `PELModuli:M3/complex-points`, `PELModuli:M3/algebraization-of-components`.

**Acceptance.** This is a comparison of functors and maps, not merely a bijection of unlabelled complex points.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), §5.1.2, pp.1744–1745. The packet stores the short literal anchor “OF”.

**Layer closure obligations.**

- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A1: Relative abelian-scheme/group-over-base carrier, endomorphism sheaf and real-multiplication action, base change and rigidity for the N≥4 Hilbert tame marking. Reuse the pinned Scheme and Tau Ceti group-object/abelian-variety carriers; an abelian variety over a field is not yet this relative object.
- AbelianSchemesAndArithmeticModuli:A2: Dual abelian scheme with biduality, symmetric O-linear Hom sheaf, positive polarizations from ample bundles, Rosati fixing O, and pullback compatibility. The existing rosati-involution node is imported, but alone does not provide this relative dual/polarization package.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.

### H2. Integral models at arbitrary primes

The all-prime proof comes from the polarized O-linear local model. On each Eisenstein factor, graph charts give the flat complete-intersection equations; the singular locus has codimension at least two. Good-prime PEL smoothness does not replace this argument. The global object currently has an algebraic-space construction; the schematic refinement is an explicit closure obligation. Ordinary completion stays inside the smooth Rapoport locus.

#### Hilbert self-orthogonal local model

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model` · definition.

For a base S, the Hilbert local model LM_O/S classifies (O⊗𝒪_T)-submodules W⊂(O⊗𝒪_T)² which are locally direct summands of rank g as 𝒪_T-modules and satisfy W=W^⊥ for the O⊗𝒪_T-valued wedge pairing. It is the corresponding closed subscheme of the rank-g Grassmannian. Rank-one freeness over O⊗𝒪_T is an open condition, not part of the whole local model at ramified primes.

**Proof or construction.**

1. Use the imported Grassmannian to impose O-stability and self-orthogonality as closed conditions.
2. Use a local trivialization of the c-polarization module to identify the pairing with the standard wedge.
3. Define the open rank-one locus separately.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Uses.** DP Theorem 3.3: Model the Hilbert deformation space étale locally. H2 normality: Use explicit ramified charts and their codimension-two singular locus.

**API.**

- `TauCeti.HilbertModular.HilbertLocalModel` (constructor): The closed self-orthogonal O-stable Grassmannian model.
- `TauCeti.HilbertModular.hilbertLocalModel_points` (characterisation): T-points are exactly the specified rank-g self-orthogonal direct summands.
- `TauCeti.HilbertModular.hilbertLocalModel_baseChange` (functoriality): Construction commutes with arbitrary base change.
- `TauCeti.HilbertModular.hilbertLocalModel_rapoport` (projection): The open rank-one O⊗𝒪_T submodule locus is the Rapoport local-model locus.

**Unit tests.**

- `TauCeti.HilbertModular.localModel_Q` (computation): For O=ℤ obtain ℙ¹_S, the space of lines in 𝒪_S².
- `TauCeti.HilbertModular.localModel_unramified` (compatibility): After an étale splitting of O at an unramified prime obtain a product ofg projective lines.
- `TauCeti.HilbertModular.localModel_ramified` (non-example): For k[T]/T², the submodule generated by Te₁ and Te₂ is self-orthogonal of k-dimension 2 but not free of rank-one over k[T]/T².

**Acceptance.** The model includes nonfree O⊗k Hodge submodules at ramified primes.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), §3.2, p.68, and§4.1, pp.70–71. The packet stores the short literal anchor “3.2”.

#### Deligne–Pappas integral Hilbert model

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model` · construction.

Fix a nonzero ordered invertible integral ideal c, N≥4 with (N,Norm(c))=1, and p∤N. The DP μ_N functor of H1, including the evaluation isomorphism, has a separated finite-type algebraic-space model over ℤ_(p), with its universal HBAV; an auxiliary sufficiently fine full tame level gives an étale presentation. Its ℚ-fibre is H1’s canonical geometric Hilbert variety. BHW’s stronger scheme formulation requires the stated scheme-representability refinement, recorded as a gap rather than attributed to good-prime M2 at ramified p.

**Proof or construction.**

1. Construct the DP functor using the imported abelian and level objects, and use DP2.1’s full-level representability.
2. Pass from a fine full tame presentation to the μ_N functor by the matching finite level quotient and effective descent.
3. Compare the generic fibre via H1; do not use M2’s good-prime smoothness to prove an arbitrary-prime statement.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison`, `PELModuli:M1/change-of-lattice-and-primes`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Uses.** H2 formal neighborhoods: Supply the arbitrary-prime base for the ordinary completion. H3 unit quotient: Carry the actual c-polarization and universal family before quotient.

**API.**

- `TauCeti.HilbertModular.DelignePappasHilbertModel` (constructor): The integral algebraic-space moduli object with universal HBAV.
- `TauCeti.HilbertModular.dpHilbertModel_moduli` (universal-property): Morphisms T→X_DP correspond functorially to DP c-polarized HBAVs with μ_N level over T.
- `TauCeti.HilbertModular.dpHilbertModel_genericFibre` (compatibility): Its ℚ-fibre identifies with the H1 canonical moduli variety with matching level.
- `TauCeti.HilbertModular.dpHilbertModel_changeLevel` (functoriality): Prime-to-p tame level forgetful maps and the universal family commute with pullback.

**Unit tests.**

- `TauCeti.HilbertModular.dp_Q` (compatibility): For F=ℚ,c=ℤ recover the good integral Y₁(N) moduli problem in the μ_N convention.
- `TauCeti.HilbertModular.dp_dyadic` (non-example): For F=ℚ(√2),p=2,N=5 the DP evaluation functor is allowed; the whole model is not declared smooth.
- `TauCeti.HilbertModular.dp_badTame` (non-example): N divisible byp is excluded from this prime-to-p tame construction.

**Acceptance.** Construction admits p=2 and p|disc(F). The scheme refinement must be proved before a scheme-only consumer executes.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), §2.1, p.64; BHW§5.1.2, p.1744. The packet stores the short literal anchor “2.1”.

**Atlas planet:** Deligne–Pappas model.

#### Flatness and normality at every prime

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal` · theorem.

For the DP model at p∤N, its structure map is flat and locally a complete intersection of relative dimension g; each geometric special fibre is normal, and its nonsmooth locus has codimension at least 2. The total space over ℤ_(p) is normal. If p∤disc(F) the whole model is smooth. These assertions hold at p=2; ramified p may have singular points.

**Proof or construction.**

1. Apply Grothendieck–Messing to identify the polarized O-linear deformation functor with LM: DP3.3, including square-zero and nonreduced bases.
2. For each Eisenstein factor, use the DP4.3 graph chart with N equations in 2 N variables and special fibre dimension N to prove flat local-complete-intersection structure.
3. Use DP4.2 strata dimensions to obtain regularity in codimension-one, combine with Cohen–Macaulay S₂, and descend through the étale charts.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.

**Acceptance.** The rank-one local-model stratum is smooth. The ramified nonfree stratum in local Model_ramified is not accidentally deleted.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), Theorem 2.2, Corollary 2.3, Theorem 3.3, Proposition 4.4 and§4.5, pp.64–73. The packet stores the short literal anchor “THÉORÈME 3.3.”.

**Atlas planet:** Deligne–Pappas flatness.

#### DP determinant identity on arbitrary bases

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-determinant-all-bases` · lemma.

The universal DP HBAV satisfies the full norm characteristic-polynomial identity for every a∈O on Lie(A). Therefore so does every pullback, including nonreduced bases. Proof uses H2 flatness and the generic H1 determinant identity; it does not infer a sheaf identity merely from field-valued points. Equivalence with a determinant-only moduli definition is a separate unresolved converse and is not needed here.

**Proof or construction.**

1. On an étale affine presentation, write the characteristic-polynomial coefficients of the locally free Lie bundle.
2. They agree with the norm coefficients after invertingp by H1; flatness makes the coordinate ring p-torsion-free.
3. The coefficient identities descend and pull back to every test scheme.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance.** The argument remains valid for a test scheme with nilpotents.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), Proposition 2.7, p.65, and Theorem 2.2, p.64. The packet stores the short literal anchor “PROPOSITION 2.7.”.

#### Rapoport locus

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus` · definition.

X_R⊂X_DP is the open locus where ω_A (equivalently, via the polarized Hodge sequence, the relevant Lie module) is locally free of rank-one over O⊗𝒪_S. It has smooth structure map of relative dimension g. At unramified p it is all of X_DP; at ramified p its complement in each special fibre has codimension at least 2. No characteristic-zero embedding decomposition is imposed on a ramified integral base.

**Proof or construction.**

1. Use the open rank-one freeness condition on the imported differential bundle.
2. Match it to the smooth local-model stratum and use H2 étale charts.
3. Use the unramified factor splitting only where O⊗𝒪_S is étale.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal`, `AbelianSchemesAndArithmeticModuli:A4`.

**Uses.** H2 ordinary completion: Locate the smooth formal neighborhood. C6 conormal comparison: Supply the unsplit O⊗𝒪 module before splitting.

**API.**

- `TauCeti.HilbertModular.HilbertRapoportLocus` (constructor): The open rank-one O⊗𝒪_S locus of the DP model.
- `TauCeti.HilbertModular.mem_rapoportLocus` (characterisation): Membership is local rank-one freeness of ω_A over O⊗𝒪_S.
- `TauCeti.HilbertModular.rapoportLocus_baseChange` (functoriality): The open subspace and ω commute with pullback.
- `TauCeti.HilbertModular.rapoportLocus_smooth` (structure): Its structure map is smooth of relative dimension g.

**Unit tests.**

- `TauCeti.HilbertModular.rapoport_Q` (compatibility): For F=ℚ the differential bundle is a line and X_R=X_DP.
- `TauCeti.HilbertModular.rapoport_unramified` (computation): For p∤disc(F), X_R is the whole model.
- `TauCeti.HilbertModular.rapoport_nonfree` (non-example): The k[T]/T² local-model module ⟨Te₁,Te₂⟩ fails the rank-one freeness test.

**Acceptance.** Smoothness is an assertion about this open locus.

**Source:** [AIP16](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §3.1, paragraph defining the Rapoport locus. The packet stores the short literal anchor “Rapoport”.

**Atlas planet:** Rapoport locus.

#### Ordinary locus and its Rapoport inclusion

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport` · theorem.

Define the ordinary locus by A[p^∞] having ordinary slopes 0 and 1 (height 2g, dimension g), or equivalently invertible determinant Verschiebung on ω in characteristicp, using R07.2. For every rationalp, this open lies in X_R, so its completed neighborhood has the smooth Rapoport geometry. At a ramified prime, ω is rank-one over O⊗k on this locus; it need not split into embedding lines over the integral base.

**Proof or construction.**

1. Import the intrinsic ordinary BT criterion from R07.2.
2. Apply the O-linear multiplicative/étale decomposition and the polarized ordinary deformation calculation as in AIP5.2.4 to identify ω as the rank-one O⊗k module.
3. Use openness of X_R and complete along the ordinary special-fibre open. Hida 9.1 is corroboration only under its own unramified hypotheses.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `AbelianSchemesAndArithmeticModuli:A4`.

**Acceptance.** F=ℚ(√2),p=2 is not excluded by the statement.

**Source:** [AIP16](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §5.2.4, ordinary/Rapoport inclusion. The packet stores the short literal anchor “ordinary locus”.

**Atlas planet:** Ordinary Hilbert locus.

#### Hilbert Hasse ideal

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal` · definition.

On the special fibre, specialize the generic R07.2 invariant Ha(A[p])=det(V*)∈(det ω_A)^{⊗(p−1)}. On an integral formal trivializing chart define I_Ha=(p,Ĥa), where Ĥa is any lift of that section. Changes of trivialization multiply the reduction by a unit, and changes of lift addp times a section, so these ideals glue. It defines the ordinary open by invertibility of Ha; the generic BT₁ invariant and Fargues LF remain owned by R07.2.

**Proof or construction.**

1. Import det(V*) and its base-change/ordinary criterion from R07.2.
2. Trivialize its actual determinant line, lift locally, and compare two lifts modulo p.
3. Glue the ideals using unit transition functions, retaining p=2 where the exponentp−1 is 1.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Uses.** Adic Spaces Part II R2 specialization: Define rational Hasse domains and formal blowups. Hodge Tate And Canonical Subgroups T0: Only the later boundary extension is passed downstream.

**API.**

- `TauCeti.HilbertModular.HilbertHasseIdeal` (constructor): The coherent chartwise ideal (p,Ĥa) on the Hilbert formal model.
- `TauCeti.HilbertModular.hilbertHasseIdeal_lift` (characterisation): Replacing Ĥa by Ĥa+pf leaves the ideal unchanged.
- `TauCeti.HilbertModular.hilbertHasseIdeal_trivialization` (functoriality): Changing a line trivialization by a unit gives the same glued ideal.
- `TauCeti.HilbertModular.hilbertHasseIdeal_ordinary` (compatibility): Ha is invertible exactly on the intrinsic ordinary locus supplied by R07.2.

**Unit tests.**

- `TauCeti.HilbertModular.hasse_p2` (computation): At p=2 the line is det ω, with exponent 1.
- `TauCeti.HilbertModular.hasse_lift` (compatibility): The generators (p,Ĥa) and(p,Ĥa+pf) define equal ideals.
- `TauCeti.HilbertModular.hasse_supersingular` (non-example): For a supersingular elliptic fibre the invariant vanishes and the point is not ordinary.

**Acceptance.** RT-AREA-padic-1/26 is resolved by an R07.2 import, with no T0 dependency.

**Source:** [AIP16](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §3.1, Hasse invariant and formal-model paragraphs. The packet stores the short literal anchor “Hasse”.

**Atlas planet:** Hilbert Hasse ideal.

#### Formal Hasse neighborhoods and lift independence

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/hasse-formal-domains` · construction.

For a complete p-adic base and a rational 0≤ε=a/b<1, specialize R2’s section-domain construction to det ω and Ha. On each trivializing chart take the admissible blowup chart for (Ĥa^b,p^a) in which Ĥa^b generates, with p-torsion removed; its generic fibre is |Ĥa|≥|p|^{a/b}. The chartwise models glue and the rational domain is independent of the lift. The strictε<1 is essential; no identical lift-independence assertion is made atε=1.

**Proof or construction.**

1. Apply the exact R2 construction to the Hilbert line and the ordinary formal base.
2. Compare Ĥa andĤa+pf using |p|<|p|^ε, and use the nonarchimedean triangle inequality to equate the rational subsets.
3. Use R2’s blowup/gluing result; distinguish any AIP indexed-thickening convention from the chosen ε convention.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`, `AdicSpacesPartII:R2/section-domain-formal-model`, `AdicSpacesPartII:R2/hasse-domain`.

**Uses.** O4 overconvergent Hilbert forms: Supply Hasse neighborhoods without an unramified-prime assumption. S5 Hilbert perfectoid specialization: Supply the finite-level ordinary neighborhoods; limit geometry is S5’s responsibility.

**API.**

- `TauCeti.HilbertModular.hilbertHasseDomain` (constructor): The formal model and adic rational domain for a/b<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_genericFibre` (compatibility): Generic fibre is the inequality |Ĥa|^b≥|p|^a on each chart.
- `TauCeti.HilbertModular.hilbertHasseDomain_lift` (equivalence): Two lifts congruent modulo p determine equal rational domains forε<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_monotone` (functoriality): Forε≤ε′<1 the ε-domain embeds into the ε′-domain.

**Unit tests.**

- `TauCeti.HilbertModular.hasseDomain_zero` (degenerate): ε=0 means|Ĥa|=1 on the integral generic fibre.
- `TauCeti.HilbertModular.hasseDomain_dyadic` (compatibility): The same rational inequality and lift comparison works at p=2.
- `TauCeti.HilbertModular.hasseDomain_endpoint` (non-example): Atε=1 the lifts 0 andp of the zero special-fibre section give respectively empty and whole inequality domains.

**Acceptance.** ε=0 is the ordinary unit domain. The ε=1 counterexample is retained.

**Source:** [AIP16](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf), §3.2, formal thickenings; compare §3.1. The packet stores the short literal anchor “3.2”.

**Atlas planet:** Hasse neighborhoods.

#### Polarization representatives at bad primes

**Node:** `HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p` · comparison.

For any narrow ideal class and m=p N≠0, the pinned coprime-representative theorem supplies an integral representative c with gcd(Norm(c),p N)=1. Ordered isomorphisms and H1 pairing-choice laws identify the corresponding generic and DP moduli descriptions, and composition obeys the comparison cocycle. Choosing this representative simplifies the integral lattice; it does not remove ramification of F at p or identify different narrow classes.

**Proof or construction.**

1. Use the pinned theorem instead of reproving approximation for narrow classes.
2. Transport the ordered polarization and tame marking along the positive ideal isomorphism.
3. Check the evaluation and local-pairing diagrams under that transport.

**Direct prerequisites:** `tauceti:NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`, `HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`.

**Acceptance.** For a nontrivial narrow class, the representative can be prime to p N without becoming principal.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.2 and footnote(2), pp.1741,1744. The packet stores the short literal anchor “choices”.

**Layer closure obligations.**

- Arbitrary-prime DP scheme refinement: DP2.1 constructs an algebraic space at full level; BHW§5.1.2 uses a μ_N scheme. The passage to μ_N fine moduli and a schematic arbitrary-prime model needs a precise representability/ample argument over ℤ_(p), with p=2 and ramified p retained. Good-prime M2 or C5 open-quasiprojectivity does not prove it at bad primes. Until this is supplied H2’s global object is an algebraic space, and scheme-only formal/adic consumers use étale scheme charts with explicit descent.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.
- AlgebraicModuliForArithmeticGeometry:R09.1: Relative rank-g Grassmannian and invariant-subbundle equations: closed representability of O-stability and the self-orthogonal wedge condition, with universal subbundle and arbitrary base change. No abelian moduli construction is requested here.
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2: Per accepted RT-AREA-padic-1/26, generic BT₁ Ha=det(V*) in (detω)^(p−1), its base-change law and intrinsic ordinary criterion at EVERY p including2; polarized O-linear ordinary decomposition sufficient for ω to be rank one over O⊗k. Generic Fargues LF and intrinsic BT₁ Hodge–Tate map remain here; H2 only specializes Ha and its ideal, and T0 owns the boundary extension downstream.

### H3. Arithmetic quotient and unit actions

Calculate the positive-unit action with the exact tame marking. Its kernel is the square image of tame congruence units. Ideal comparisons retain the ordered isomorphisms and their cocycles; arithmetic descent removes the positive-unit ambiguity, while Hecke correspondences can move to a different polarization class.

#### Tame congruence units

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-units` · definition.

Let U=O× and U+=Number Field.totally Positive Integer Units F. For a nonzero integral ideal a, define U_a=ker(U→(O/a)×); for an integer M>0 write U_M=U_{MO}. Only the congruence subgroup is new; total positivity and subgroup kernels use the pinned carriers.

**Proof or construction.**

1. Use reduction of units and its kernel for U_a.
2. Use the square homomorphism on the abelian unit group and the pinned positivity-of-squares theorem to construct S_M in U+.

**Direct prerequisites:** `tauceti:NumberField.totallyPositiveIntegerUnits`, `tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.4: Compute Δ(N) at tame level. H4 connected quotients: Keep bothp-power and tame congruences on square roots.

**API.**

- `TauCeti.HilbertModular.congruenceUnits` (constructor): The subgroup η≡1 moduloa.
- `TauCeti.HilbertModular.mem_congruenceUnits` (characterisation): η∈U_a iff(η−1)∈a.
- `TauCeti.HilbertModular.congruenceUnits_mono` (functoriality): Ifa⊂b then U_a⊂U_b.

**Unit tests.**

- `TauCeti.HilbertModular.units_Q_tame` (computation): For O=ℤ,N≥3, U_N={1} and S_N={1}.
- `TauCeti.HilbertModular.units_sign` (compatibility): Both η and−η have totally positive square, but only those congruent 1 modulo N contribute to S_N.
- `TauCeti.HilbertModular.units_squareRoot` (non-example): Congruence of η² to 1 modulo N alone does not imply η∈U_N.

**Acceptance.** The tame congruence condition applies to the square root η, not only to η².

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4 and Lemma 8.12, pp.1766,1771. The packet stores the short literal anchor “Proposition 8.4”.

**Atlas planet:** Congruence units.

#### Congruence square image

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image` · definition.

For M>0 let S_M be the image of U_M under η↦η² in the pinned subgroup U+ of totally positive units. The square-root congruence is part of this definition. The image is a normal subgroup since U+ is abelian.

**Proof or construction.**

1. Use reduction of units and its kernel for U_a.
2. Use the square homomorphism on the abelian unit group and the pinned positivity-of-squares theorem to construct S_M in U+.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-units`, `tauceti:NumberField.sq_mem_totallyPositiveIntegerUnits`.

**Uses.** BHW8.4: Compute Δ(N) at tame level. H4 connected quotients: Keep bothp-power and tame congruences on square roots.

**API.**

- `TauCeti.HilbertModular.congruenceUnitSquares` (constructor): The image S_M≤U+ of the square homomorphism on U_M.
- `TauCeti.HilbertModular.mem_congruenceUnitSquares` (characterisation): u∈S_M iff u=η² for some η∈U_M.
- `TauCeti.HilbertModular.congruenceUnitSquares_mono` (functoriality): If M divides M′, then S_{M′}≤S_M.

**Unit tests.**

- `TauCeti.HilbertModular.squareImage_Q` (computation): For F=ℚ,M≥3 the image is the trivial subgroup.
- `TauCeti.HilbertModular.squareImage_positive` (compatibility): Every image element lies in Number Field.totally Positive Integer Units F by the pinned square-positivity theorem.
- `TauCeti.HilbertModular.squareImage_root` (non-example): For F=ℚ(√2), M=12, ε⁸ is not in S_12 although ε⁸≡1 modulo 12: its only roots ±ε⁴ both fail the congruence.

**Acceptance.** The tame congruence condition applies to the square root η, not only to η².

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4 and Lemma 8.12, pp.1766,1771. The packet stores the short literal anchor “Proposition 8.4”.

#### Positive unit action on polarizations

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action` · construction.

For the fine DP μ_N object, η∈U+ sends(A,ι,λ,μ_N) to(A,ι,ηλ,μ_N). This gives an action compatible with base change and the H1 moduli comparisons. The O-linear automorphism[η] gives(A,ι,η²λ,η⁻¹μ_N,ηα)≅(A,ι,λ,μ_N,α), with the last marking on A∨. Its tame kernel is exactly S_N under this level convention.

**Proof or construction.**

1. Scale the ordered identification by a positive unit; evaluation remains an isomorphism.
2. Use Rosati adjointness and the actual dual level convention to verify the three isomorphism diagrams.
3. Prove the stabilizer in the fine μ_N functor by rigidity, obtaining squares of U_N.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`.

**Uses.** H3 arithmetic quotient: Forget the chosen ordered polarization through its actual action. BHW8.12 and H4: Calculate its interaction with the adjugate level action.

**API.**

- `TauCeti.HilbertModular.polarizationUnitAction` (constructor): The U+ action on the c-polarized fine moduli functor.
- `TauCeti.HilbertModular.polarizationUnitAction_one` (simp): The unit 1 acts identically.
- `TauCeti.HilbertModular.polarizationUnitAction_mul` (relation): ηθ acts as η after θ.
- `TauCeti.HilbertModular.polarizationUnitAction_square` (compatibility): The displayed[η] isomorphism identifies square polarization changes with tame/dual-level scalar changes.

**Unit tests.**

- `TauCeti.HilbertModular.unitAction_Q` (degenerate): For F=ℚ the positive unit group is trivial.
- `TauCeti.HilbertModular.unitAction_negative` (non-example): −1 is not an allowed polarization-scaling unit for the standard positive cone.
- `TauCeti.HilbertModular.unitAction_level` (compatibility): η² acts trivially at tame level precisely when a root η with η≡1 modulo N supplies the moduli isomorphism.

**Acceptance.** At another tame marking, recompute the stabilizer.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.2, Definition 8.3 and Proposition 8.4, pp.1765–1766. The packet stores the short literal anchor “Definition 8.3.”.

**Atlas planet:** Polarization unit action.

#### Finite tame polarization group

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/tame-delta` · definition.

For N≥4, define Δ(N)=U+/S_N with S_N=U_N² as in congruence Units. The quotient uses the normal subgroup inside U+, with its natural projection. It is not U+/((U+∩U_N)²), nor a quotient by units merely congruent 1 after squaring.

**Proof or construction.**

1. Form the quotient in the pinned normal-subgroup carrier.
2. Keep the square-root congruence subgroup before taking its square image.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.4: The finite torsor group for X→X_G. H4 effective groups: The tame quotient appears in the extension E.

**API.**

- `TauCeti.HilbertModular.TamePolarizationGroup` (constructor): The quotient U+/S_N.
- `TauCeti.HilbertModular.tameDelta_mk` (projection): The projection U+→Δ(N).
- `TauCeti.HilbertModular.tameDelta_eq` (characterisation): η and θ have the same class iff ηθ⁻¹=ν² for some ν∈U_N.
- `TauCeti.HilbertModular.tameDelta_changeLevel` (functoriality): For N|M the inclusion S_M⊂S_N induces Δ(M)→Δ(N).

**Unit tests.**

- `TauCeti.HilbertModular.delta_Q` (computation): For F=ℚ,N≥4, Δ(N) is trivial.
- `TauCeti.HilbertModular.delta_square` (compatibility): Every ν∈U_N maps ν² to 1 in Δ(N).
- `TauCeti.HilbertModular.delta_notPositiveRoot` (non-example): The denominator permits square roots that are not totally positive; replacing it by positive-root squares can change the quotient.

**Acceptance.** The quotient corresponds to the kernel of polarization Unit Action.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4, p.1766. The packet stores the short literal anchor “∆(N )”.

**Atlas planet:** Tame polarization group.

#### Finiteness of the tame quotient

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness` · theorem.

For every M>0, Δ(M) is finite. More precisely, [U:U_M]<∞ because O/MO is finite, and finite generation of U plus the pinned square-class/unit theorem gives [U+:U_M²]<∞. For totally real F of degreeg, every subgroup of U has square-class size at most 2^g; this bound will also be used for the connected groups in H4.

**Proof or construction.**

1. Use the finite residue-unit target to bound the congruence index.
2. Apply the pinned Dirichlet structure theorem to U_M and its finite torsion subgroup; do not repeat that theorem as a node.
3. Combine subgroup indices with positivity of unit squares.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/tame-delta`, `tauceti:NumberField.units_sq_index_eq`, `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Acceptance.** Finiteness does not prove an arbitrary natural map between two square quotients is injective.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4, p.1766. The packet stores the short literal anchor “finite group”.

**Atlas planet:** Finite polarization quotient.

#### Arithmetic Hilbert quotient

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient` · theorem.

With the exact μ_N convention, X(c,μ_N)→X_G(c,μ_N) is a finite étale Δ(N)-torsor, and its quotient identifies with the G canonical Hilbert variety through V8. For the integral model the quotient exists in the stated category and has the characteristic-zero comparison. A universal HBAV on the fine source descends only when its descent datum is verified; no universal HBAV is asserted on an arbitrary coarse arithmetic quotient.

**Proof or construction.**

1. Use the exact stabilizer calculation to factor the action through Δ(N).
2. Prove the quotient-moduli and torsor diagrams on test objects, including rigidifying tame marking.
3. Apply the imported effective finite quotient and V8 comparison with the G datum; keep stack/coarse and fine-family claims distinct.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action`, `HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness`, `HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison`, `ShimuraVarieties:V8/finite-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Acceptance.** For F=ℚ the quotient map is an isomorphism.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.4, p.1766. The packet stores the short literal anchor “finite étale”.

**Atlas planet:** Arithmetic Hilbert quotient.

#### Polarization ideal representative comparisons

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons` · comparison.

The disjoint union of Hilbert moduli over a list of narrow ideal-class representatives has explicit comparison isomorphisms for a new list: choose ordered ideal isomorphisms and transport λ, lattices and β. Their composites obey H1’s cocycle; changing the comparison by a totally positive unit acts on the G* description and disappears after the G polarization-class quotient. Different ideal classes remain different labels.

**Proof or construction.**

1. Use the pinned narrow-class finiteness to form the finite list.
2. Apply the ordered ideal isomorphism comparison on each class and verify pairings and marking.
3. Track the unit ambiguity explicitly before and after the arithmetic quotient.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws`, `HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p`, `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `tauceti:NumberField.NarrowClassGroup.instFinite`.

**Acceptance.** Class number one is not a standing hypothesis.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), §8.4.1, pp.1777–1778, ideal dependence before Lemma 8.22. The packet stores the short literal anchor “polarisation ideals”.

#### Hecke isogenies between polarization components

**Node:** `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies` · theorem.

For an O-linear finite locally free subgroup D⊂A[a], witha prime to N and the required isotropy/polarization descent conditions, the quotientφ:A→B=A/D has the induced HBAV structure and tame marking. If D has O-module elementary divisors O/b_i, putb=∏b_i; the descended polarization module iscb and the dual-isogeny diagram of BHW(8.7) characterizes λ′. These correspondences act on the union ofc-components, not necessarily on onec-component, and have representative-independent arithmetic descent.

**Proof or construction.**

1. Use A3’s quotient and dual isogeny; carry μ_N throughφ since(a,N)=1.
2. Prove the polarization descent and the cb evaluation diagram for a cyclic elementary divisor, then compose the factors.
3. Transport representative changes through that diagram and descend the unit ambiguity using H3. The source’s Kisin–Lai§1.9 descent argument needs a precise transcription, recorded as a source-proof gap.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A3`.

**Acceptance.** A correspondence with nontrivial narrow class[b] moves the polarization component. The quotient of geometric torsion points alone is not an integral subgroup-scheme construction.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.22 and diagram(8.7), pp.1777–1778. The packet stores the short literal anchor “Lemma 8.22.”.

**Layer closure obligations.**

- Hecke polarization descent proof interior: BHW Lemma8.22 invokes Kisin–Lai§1.9. The cb polarization module and dual-isogeny diagram have been transcribed, but the integral isotropy/elementary-divisor argument and its exact finite-flat hypotheses still need that proof. Supply it before using a general O-stable subgroup in the Hecke construction.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AlgebraicModuliForArithmeticGeometry:R09.5: Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.

### H4. Finite p-level structures and effective groups

Use paired scalar-multiplier G* frames, unrestricted hybrid frames and polarization-class G frames as separate generic moduli. Adjugation reverses composition and produces the BHW left action. Finite scalar kernels determine PΓ and the joint diagonal group E. The whole-space and connected torsors have different groups. The connected inverse limit is finite, but the correct eventual description is by stable images.

#### Hybrid full Hilbert level

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level` · definition.

Over characteristic-zero S with a fixed c-polarization and μ_N marking, a hybrid fullp^n level is an O/p^n O-linear isomorphism α_n:(O/p^n O)²≅A∨[p^n], n≥1. Denote its fine moduli by X_Γ(p^n). It retains λ and allows an arbitrary O-unit Weil multiplier. This is a generic-fibre basis; no such constant étale basis is imposed on characteristicp torsion.

**Proof or construction.**

1. Specialize the M1 finite étale frame functor to A∨[p^n].
2. Keep the c-polarization and μ_N marking on each object.
3. Use H1’s good characteristic-zero comparison for representability.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**Uses.** BHW§8.2: The intermediate space separates scalar pairing restriction from polarization-class descent. S5/O4: Provide the finite-level frame data on T_p A∨.

**API.**

- `TauCeti.HilbertModular.HilbertHybridLevel` (constructor): A full O/p^n O basis of A∨[p^n] on the geometric c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_forget` (projection): Forgetα_n to the fine tame c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_reduce` (functoriality): Forr≤n use[p^{n−r}] on torsion and reduction of the basis to obtainα_r.
- `TauCeti.HilbertModular.hybridLevel_dualConvention` (compatibility): λ⁻¹∘(α_n⊗c⁻¹) identifies the corresponding basis of A[p^n] only after the c⁻¹ twist.

**Unit tests.**

- `TauCeti.HilbertModular.hybrid_Q` (compatibility): For F=ℚ,c=ℤ obtain the usual full generic elliptic level on the dual curve.
- `TauCeti.HilbertModular.hybrid_twist` (non-example): For nonprincipal c a basis of A∨[p^n] does not canonically give an untwisted basis of A[p^n].
- `TauCeti.HilbertModular.hybrid_charp` (non-example): For an ordinary elliptic curve in characteristicp, E[p] includes μ_p and is not a constant étale rank p² group.

**Acceptance.** The target of the basis is A∨, matching the downstream Hodge–Tate map.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.4(4), Remark 5.5 and§8.2, pp.1742,1768. The packet stores the short literal anchor “Remark 5.5.”.

#### Hilbert full-level pairing multiplier

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier` · construction.

For a compatible local generator β:c⁻¹O_p≅d⁻¹(1), pull backẽ_{p^n} using λ⁻¹(α_n⊗c⁻¹) andα_n. There is a unique b_n∈(O/p^n O)× such that this pairing is b_n times the β-determinant pairing. The construction is a mape_{n,β}:X_Γ(p^n)→(O/p^n O)×, compatible with torsion reduction. β is an auxiliary trivialization, with the exact change law of H1.

**Proof or construction.**

1. Use perfect alternating O-linear forms on a rank-two free residue module to obtain a unique unit ratio.
2. Use β to express that ratio and H1’s law to compare choices.
3. Check the ratio under every reduction map, rather than choosing β independently at each n.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level`, `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `HilbertModularVarietiesAndShimuraCurves:H1/pairing-choice-laws`.

**Uses.** BHW Lemma 8.10: Cut out the G* full-level subspace. H4 components: Label connected components by the actual pairing ratio.

**API.**

- `TauCeti.HilbertModular.hilbertPairingMultiplier` (constructor): The unique unit ratio of the pulled-back pairing to the β pairing.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_eq` (characterisation): e_{n,β}(α)=b iff the two forms differ by multiplication byb.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_reduce` (functoriality): The multiplier reduces compatibly fromp^n top^r.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_changeBeta` (compatibility): Replacing β byu β replaces the multiplier byu⁻¹b.

**Unit tests.**

- `TauCeti.HilbertModular.multiplier_identity` (computation): A basis carrying the β form to the actual pairing has multiplier 1.
- `TauCeti.HilbertModular.multiplier_change` (compatibility): β′=u β givesb′=u⁻¹b.
- `TauCeti.HilbertModular.multiplier_nonscalar` (non-example): For a nonscalar residue unitu the multiplieru is not a G* multiplier relative to the fixed β.

**Acceptance.** The multiplier is an O-unit; rational scalar units are a separate restriction.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.6, equation(5.2), p.1743; equation(8.4), p.1769. The packet stores the short literal anchor “(8.4)”.

#### Scalar-similitude geometric full level

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level` · definition.

Let S_n be the image of(ℤ/p^n ℤ)× in(O/p^n O)×. Define X_Γ*(p^n)=e_{n,β}^{−1}(S_n) inside the hybrid moduli. Its bases are the G* full-level structures of BHW Definition 5.7, and its acting level group is{γ∈GL₂(O/p^n O):det γ∈S_n}. A choice of one root/multiplier component is further data and is not folded into this definition.

**Proof or construction.**

1. Take the inverse image of the scalar residue-unit subgroup under the actual multiplier map.
2. Use the trace dictionary to check agreement with the rational-similitude definition.
3. Keep the union of scalar multiplier components until a component is explicitly selected.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier`, `HilbertModularVarietiesAndShimuraCurves:H0/type-witnesses`.

**Uses.** BHW8.10–8.11: Describe β₁ and reconstruct the hybrid space by scalar induction. S5 geometric tower: Supply precisely the G* finite-level moduli.

**API.**

- `TauCeti.HilbertModular.HilbertGeometricFullLevel` (constructor): The scalar-multiplier subfunctor of hybrid full level.
- `TauCeti.HilbertModular.geometricFullLevel_mem` (characterisation): A basis is geometric full level iff its multiplier belongs to S_n.
- `TauCeti.HilbertModular.geometricFullLevel_inclusion` (projection): The natural inclusion β₁ into the hybrid space.
- `TauCeti.HilbertModular.geometricFullLevel_betaTransport` (equivalence): H1’s comparison identifies the subfunctors for two compatible β choices after the stated basis transport.

**Unit tests.**

- `TauCeti.HilbertModular.starLevel_Q` (compatibility): For F=ℚ,S_n=(O/p^n O)×, so geometric and hybrid full levels coincide.
- `TauCeti.HilbertModular.starLevel_missing` (non-example): For g>1 with nonscalar residue units,β₁ misses their multiplier fibres and is not surjective.
- `TauCeti.HilbertModular.starLevel_root` (non-example): Fixing one primitive root picks one scalar multiplier component; the entire G* definition does not fix that root.

**Acceptance.** The G* space is an open-and-closed subspace of the hybrid generic space.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.7, p.1743; Lemma 8.10, p.1770. The packet stores the short literal anchor “Lemma 8.10.”.

**Atlas planet:** Geometric full level.

#### Adjugate action on dual levels

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action` · theorem.

For γ∈GL₂(O/p^n O), let γ∨=adj(γ)=det γ·γ⁻¹. The rule γ·α=α∘γ∨ gives a left action on hybrid levels because adj(γδ)=adj δ·adj γ. It changes the pairing multiplier bydet γ, since det(adj γ)=det γ in rank-two. Scaling λ by η∈U+ changes that multiplier by η⁻¹. The actions commute; the G* action is obtained by the scalar determinant restriction.

**Proof or construction.**

1. Reuse the pinned adjugate anti-multiplicativity and rank-two determinant formula.
2. Compute the pulled-back alternating form underα∘adj γ.
3. Apply H1’s λ-rescaling law to obtain η⁻¹ and verify commuting actions.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier`, `HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action`, `mathlib:Matrix.adjugate_mul_distrib`, `mathlib:Matrix.det_adjugate`.

**Acceptance.** Composition order is checked with two noncommuting matrices. A determinantp matrix acts on Tate modules through the isogeny correspondence, not an invertible finite-level frame action.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Remark 5.8 and Lemma 8.9, pp.1744,1769–1770. The packet stores the short literal anchor “Lemma 8.9.”.

**Atlas planet:** Adjugate level action.

#### Unit squares versus scalar levels

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level` · lemma.

For η∈U_N, its polarization action by η² on the hybrid full-level space equals the level action of the scalar matrix η⁻¹I₂. Consequently the kernel at fullp^n level is S_{p^n N}=U_{p^n N}². This statement uses the dual-level action and the fixed tame μ_N convention; it is recalculated for another tame level.

**Proof or construction.**

1. Insert η into the H3 HBAV isomorphism diagrams.
2. Because η∈U_N the tame marking is unchanged; for a scalar rank-two matrix adj(ηI)=ηI.
3. The scalar acts trivially onα_n exactly when η≡1 modulo p^n, andp∤N combines the congruences.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action`, `HilbertModularVarietiesAndShimuraCurves:H3/polarization-unit-action`, `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`.

**Acceptance.** The exponent 2 belongs to the polarization change, while the scalar-level action uses η⁻¹.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.12, p.1771. The packet stores the short literal anchor “Lemma 8.12.”.

#### Arithmetic full Hilbert level

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level` · definition.

Define X_{G,Γ(p^n)} as the polarization-class quotient of the hybrid fine moduli by Δ(p^n N)=U+/U_{p^n N}². Its coarse moduli interpretation retains(A,ι,[λ],μ_N,α_n), with isomorphisms acting on the dual basis. Denote β₂ the quotient map. A local HBAV representative may be used for this interpretation; no universal HBAV on the whole arithmetic quotient is part of this definition.

**Proof or construction.**

1. Use the exact full-level kernel and the finite quotient supplied by R09.5.
2. Check the polarization-class coarse interpretation with its dual-level isomorphism convention.
3. Compare β₂ to the G canonical finite-level map by V8.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level`, `HilbertModularVarietiesAndShimuraCurves:H3/tame-delta`, `HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Uses.** BHW8.16 and 8.18: Compute the arithmetic level torsor and its effective group. S5/O4: Separate full-tower and connected-component polarization quotients.

**API.**

- `TauCeti.HilbertModular.HilbertArithmeticFullLevel` (constructor): The quotient X_Γ(p^n)/Δ(p^n N).
- `TauCeti.HilbertModular.arithmeticFullLevel_quotient` (universal-property): Invariant maps from the hybrid space factor uniquely through β₂.
- `TauCeti.HilbertModular.arithmeticFullLevel_reduce` (functoriality): The level reductions commute with the corresponding Δ quotient maps.
- `TauCeti.HilbertModular.arithmeticFullLevel_coarse` (compatibility): Geometric points have the stated polarization-class and dual-basis interpretation.

**Unit tests.**

- `TauCeti.HilbertModular.arithmeticLevel_Q` (compatibility): For F=ℚ the positive-unit quotient is trivial and all three full levels agree.
- `TauCeti.HilbertModular.arithmeticLevel_beta1` (non-example): The composite β₂β₁ need not be surjective and is not called a torsor merely because β₂ is one.
- `TauCeti.HilbertModular.arithmeticLevel_universal` (non-example): The coarse interpretation supplies no automatic descended universal abelian scheme.

**Acceptance.** β₂ is a finite étale torsor for Δ(p^n N) under the fine tame hypotheses.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.16(1), p.1772. The packet stores the short literal anchor “Lemma 8.16.”.

#### Induction from scalar pairing components

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-comparison-map` · comparison.

For fixed β, X_Γ(p^n)≅[(O/p^n O)××X_Γ*(p^n)]/S_n, where a residue unitu acts throughdiag(u,1) and S_n acts antidiagonally. Thus β₁ is the scalar-multiplier inclusion and β₂ is the unit polarization quotient; their distinct images and groups are visible. The assertion is on the generic fibre with compatible pairings.

**Proof or construction.**

1. Translate a multiplierb to a scalar multiplier usingdiag(b,1).
2. Compute the ambiguity as S_n using the H4 determinant action.
3. Check the induced quotient isomorphism on finite étale frame functors and after base change.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action`, `HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level`.

**Acceptance.** Over ℚ induction by equal residue/scalar unit groups adds no extra components.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Corollary 8.11, p.1771. The packet stores the short literal anchor “Corollary 8.11.”.

#### Integral Iwahori and higher subgroup levels

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0` · definition.

An integral Γ₀(p^n) level is a finite locally free O-stable subgroup C⊂A[p^n] of rank p^{ng}, such that every c-indexed polarized Weil pairing vanishes on C×C. Require its generic fibre C[1/p] to be étale locally O/p^n O of rank one. The inclusion C⊂A[p^n] imposes p^n-annihilation; any stronger ideal-annihilator or flat-closure refinement is the recorded comparison gap. For a naive integral functor retain precisely these conditions; any flat closure or refined local-model variant is separately stated.Γ₁ is an integral generator condition only when its group-scheme formulation has been specified; a full constant basis is restricted to the generic fibre.

**Proof or construction.**

1. Use the imported finite-flat subgroup and pairing carriers to state rank, O-stability and isotropy.
2. Check the rank-one residue-module type after invertingp.
3. Keep the integral naive functor separate from any claim of flatness or a splitting-model identification.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**Uses.** H2/R18.2 integral level consumers: Provide actual subgroup-scheme data at bad primes. BHW8.5 and 8.18: Compare generic Γ₀ levels for G* and G.

**API.**

- `TauCeti.HilbertModular.HilbertIntegralGamma0` (constructor): The finite locally free O-stable isotropic subgroup-scheme level.
- `TauCeti.HilbertModular.integralGamma0_baseChange` (functoriality): Subgroup, rank and isotropy pull back to any base.
- `TauCeti.HilbertModular.integralGamma0_generic` (compatibility): On the generic fibre it is the stated O/p^n O rank-one subgroup level.
- `TauCeti.HilbertModular.integralGamma0_forget` (projection): The nested subgroup levels have forgetful maps, with their actual subgroup intersections.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_ordinary` (computation): For an ordinary elliptic curve, the multiplicative μ_{p^n} subgroup is a valid rank p^n integral Γ₀ level.
- `TauCeti.HilbertModular.gamma0_zero` (non-example): The zero subgroup has the wrong rank for n≥1.
- `TauCeti.HilbertModular.gamma0_points` (non-example): Replacing μ_p by its geometric points loses its scheme rank and fails the test.

**Acceptance.** Atp=2 or a ramified prime subgroup schemes remain meaningful.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 5.4(2–3), p.1742; integral refinement required by roadmap H4. The packet stores the short literal anchor “Definition 5.4”.

#### Polarization quotient at subgroup level

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/gamma0-cartesian` · comparison.

On the generic fibre, the Γ₀(p^n) subgroup-level squares over X→X_G are Cartesian: units preserve O-stable C, so the same Δ(N) torsor acts before and after adjoining C. Any invariant rational Hasse neighborhood restricts this finite-level Cartesian diagram. No perfectoid limit theorem is proved or imported here.

**Proof or construction.**

1. Use ηC=C for O-stable subgroups in the H3 moduli isomorphism.
2. Check the quotient functor Cartesian square.
3. Restrict to the Hasse domain after verifying invariance of Ha under polarization changes.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`, `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H2/hasse-formal-domains`.

**Acceptance.** This is a finite-level input to S5, with no backward dependence on S5.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.5, p.1766. The packet stores the short literal anchor “Lemma 8.5.”.

#### Connected polarization and residue component groups

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups` · definition.

For n≥1 put A_n=U_{p^n}∩U+, B_n=U_{p^n N}, and Δ_n(N)=A_n/B_n². For r≤n inclusion induces Δ_n→Δ_r; these maps need be neither injective nor surjective. This group preserves a selected paired component and differs from the whole-space quotient Δ(p^n N)=U+/B_n².

**Proof or construction.**

1. Use B_n²⊂A_n and form its normal-subgroup quotient.
2. Use the nested congruence subgroups to define and compose transition homomorphisms.
3. Keep the connected numerator A_n separate from the full positive-unit numerator.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`, `HilbertModularVarietiesAndShimuraCurves:H3/tame-delta`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.15–8.16: Identify the arithmetic component labels and the torsor on a chosen component. S5/O4: Receive the correct finite connected limit rather than the full profinite quotient.

**API.**

- `TauCeti.HilbertModular.ConnectedPolarizationGroup` (constructor): A_n/B_n² with the indicated level transitions.
- `TauCeti.HilbertModular.connectedDelta_eq` (characterisation): Classes of η,θ∈A_n agree iff ηθ⁻¹=ν² for ν∈B_n.
- `TauCeti.HilbertModular.connectedDelta_transition` (functoriality): Reduction fromn tor is induced by inclusion and satisfies identity/composition laws.

**Unit tests.**

- `TauCeti.HilbertModular.connectedDelta_Q` (computation): For F=ℚ all Δ_n(N) are trivial.
- `TauCeti.HilbertModular.connectedDelta_noninjective` (non-example): For F=ℚ(√2),p=3,N=4 the inclusion-induced Δ₁(4)→Δ(4) is not injective, as demonstrated in the counterexample node.
- `TauCeti.HilbertModular.connectedDelta_square` (compatibility): For η∈U_{p^n N}, the class of η² is trivial in Δ_n(N).

**Acceptance.** Definitions acceptp=2 and keep the fullp^n N square-root congruence.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.14 and Lemma 8.16, pp.1771–1773. The packet stores the short literal anchor “Definition 8.14.”.

**Atlas planet:** Connected polarization groups.

#### Residue polarization components

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/residue-component-group` · definition.

For n≥1 define 𝒰_n=(O/p^n O)×/image(U+), using reduction of the pinned totally positive units. This is the fixed-c arithmetic multiplier-component group; over all polarization classes it occurs as the kernel in the narrow ray-class extension.

**Proof or construction.**

1. Form the two quotients on their explicit subgroup carriers.
2. Use B_n²⊂A_n and the nested subgroup inclusions to define level transition maps.
3. Keep the inclusion A_n⊂U+ separate from any injectivity claim after quotienting.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H3/congruence-units`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.15–8.16: Identify the arithmetic component labels and the torsor on a chosen component. S5/O4: Receive the correct finite connected limit rather than the full profinite quotient.

**API.**

- `TauCeti.HilbertModular.ResiduePolarizationComponents` (constructor): The quotient of residue units by the positive-unit image.
- `TauCeti.HilbertModular.residueComponents_mk` (projection): The residue-unit projection to 𝒰_n.
- `TauCeti.HilbertModular.residueComponents_eq` (characterisation): Two units have equal classes iff their ratio is the reduction of a totally positive global unit.
- `TauCeti.HilbertModular.residueComponents_reduce` (functoriality): Residue reduction induces compatible maps 𝒰_n→𝒰_r for r≤n.

**Unit tests.**

- `TauCeti.HilbertModular.residueComponents_Q` (computation): For F=ℚ the image is {1}, so 𝒰_n=(ℤ/p^n ℤ)×.
- `TauCeti.HilbertModular.residueComponents_unit` (compatibility): Reduction of every positive global unit has trivial class.
- `TauCeti.HilbertModular.residueComponents_narrow` (non-example): The group for fixed c omits nontrivial narrow ideal classes and is not the whole arithmetic component set.

**Acceptance.** Definitions acceptp=2 and keep the fullp^n N square-root congruence.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.14 and Lemma 8.16, pp.1771–1773. The packet stores the short literal anchor “Definition 8.14.”.

#### Full and connected component comparisons

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison` · theorem.

With BHW’s fixedc and tame μ_N convention, after a splitting/cyclotomic base and the required component choice, π₀(X_Γ*(p^n))=(ℤ/p^n ℤ)×, π₀(X_Γ(p^n))=(O/p^n O)×, and π₀(X_{G,Γ(p^n)})=𝒰_n for thatc-fibre. Over allc classes the arithmetic labels form the narrow ray-class extension by Cl⁺(O).β₂ is a Δ(p^n N) torsor on the whole space and a Δ_n(N) torsor on paired chosen components. Base-field Galois actions on the labels are retained.

**Proof or construction.**

1. Use strong approximation for the imported derived Res SL₂ group and compute determinant double cosets at this exact tame level.
2. Use the multiplier induction comparison to pass from scalar to O-unit labels.
3. Compute the subgroup preserving the selected multiplier component and divide its scalar kernel, giving A_n/B_n².

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-comparison-map`, `HilbertModularVarietiesAndShimuraCurves:H3/ideal-class-comparisons`, `HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level`, `ShimuraVarieties:V8/finite-level-maps`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `HilbertModularVarietiesAndShimuraCurves:H4/residue-component-group`.

**Acceptance.** The geometric G* full space may have several scalar multiplier components even when the tame source is connected. Only the fixed[c] fibre has labels 𝒰_n; the full arithmetic variety also sees Cl⁺(O).

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemmas 8.15–8.16, pp.1771–1773. The packet stores the short literal anchor “Lemma 8.15.”.

#### Effective finite level groups

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups` · definition.

For 0≤m≤n, n≥1, define Γ₀(p^m,p^n)={γ∈GL₂(O/p^n O): γ₂₁∈p^m O/p^n O}. Its Γ₀* subgroup imposes determinant in the scalar image of (ℤ/p^n ℤ)×. These act on generic full-level frames and forget to the stipulated subgroup level.

**Proof or construction.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/adjugate-level-action`, `HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level`, `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.18–8.19: State the finite étale torsors over subgroup level. O4 descent: Use an effective arithmetic finite-level group.

**API.**

- `TauCeti.HilbertModular.HilbertFiniteGamma0` (constructor): The lower-left congruence subgroup of GL₂(O/p^n O).
- `TauCeti.HilbertModular.finiteGamma0_mem` (characterisation): Membership is exactly the lower-left ideal condition.
- `TauCeti.HilbertModular.finiteGamma0_star` (constructor): The scalar-determinant subgroup Γ₀*≤Γ₀.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_m0` (degenerate): For m=0 the lower-left condition is void and Γ₀=GL₂(O/p^n O).
- `TauCeti.HilbertModular.gamma0_mn` (computation): For m=n the lower-left entry is 0 in O/p^n O.
- `TauCeti.HilbertModular.effective_Q` (compatibility): For F=ℚ,N≥4, U_N={1}; hence Z_n is trivial and PΓ₀=Γ₀.

**Acceptance.** Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.17 and§8.3.1, pp.1773–1775. The packet stores the short literal anchor “Definition 8.17.”.

#### Diagonal level and polarization group

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/diagonal-level-group` · definition.

Define E(p^m,p^n)=(Γ₀(p^m,p^n)×U+)/image(η↦(ηI₂,η²), η∈U_N). The subgroup is central. For the left adjugate frame action and positive polarization action this is exactly the joint ineffective subgroup.

**Proof or construction.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/unit-square-level`, `HilbertModularVarietiesAndShimuraCurves:H3/congruence-square-image`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.18–8.19: State the finite étale torsors over subgroup level. O4 descent: Use an effective arithmetic finite-level group.

**API.**

- `TauCeti.HilbertModular.HilbertDiagonalLevelGroup` (constructor): The central quotient E by the square relation.
- `TauCeti.HilbertModular.diagonalLevel_mk` (projection): The product-group projection to E.
- `TauCeti.HilbertModular.diagonalLevel_relation` (characterisation): (ηI₂,η²) maps to 1 for η∈U_N; these generate exactly the kernel.
- `TauCeti.HilbertModular.diagonalLevel_action` (compatibility): The joint level/polarization action factors through E using H4’s unit-square calculation.

**Unit tests.**

- `TauCeti.HilbertModular.diagonal_Q` (computation): For F=ℚ,N≥4, E=Γ₀.
- `TauCeti.HilbertModular.diagonal_square` (compatibility): Its second coordinate is η², matching Rosati polarization scaling.
- `TauCeti.HilbertModular.diagonal_notLinear` (non-example): The relation (ηI₂,η) generally changes the paired moduli and is not substituted.

**Acceptance.** Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.17 and§8.3.1, pp.1773–1775. The packet stores the short literal anchor “Definition 8.17.”.

#### Effective projective level group

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group` · definition.

Define PΓ₀(p^m,p^n)=Γ₀(p^m,p^n)/Z_n using the actual ineffective scalar subgroup, not all residue scalar matrices. It acts effectively on the arithmetic full-level moduli over Γ₀ subgroup level.

**Proof or construction.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel`, `mathlib:QuotientGroup.mk'`.

**Uses.** BHW8.18–8.19: State the finite étale torsors over subgroup level. O4 descent: Use an effective arithmetic finite-level group.

**API.**

- `TauCeti.HilbertModular.HilbertEffectiveGamma0` (constructor): The quotient PΓ₀=Γ₀/Z_n.
- `TauCeti.HilbertModular.effectiveLevel_mk` (projection): The normal-subgroup quotient projection.
- `TauCeti.HilbertModular.effectiveLevel_quotient` (universal-property): An action trivial on Z_n factors uniquely through PΓ₀.

**Unit tests.**

- `TauCeti.HilbertModular.effective_Q` (compatibility): For F=ℚ,N≥4, PΓ₀=Γ₀.
- `TauCeti.HilbertModular.effective_kernel` (characterisation): The projection kills exactly Z_n.
- `TauCeti.HilbertModular.effective_notPGL` (non-example): For F=ℚ and p odd the scalar −I₂ survives; this quotient is not PGL₂.

**Acceptance.** Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.17 and§8.3.1, pp.1773–1775. The packet stores the short literal anchor “Definition 8.17.”.

**Atlas planet:** Effective Hilbert level groups.

#### Ineffective scalar level subgroup

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/level-scalar-kernel` · definition.

Let Z_n be the image of U_N under scalar reduction η↦ηI₂ in Γ₀(p^m,p^n). It is central and its kernel is U_{p^n N}, because p and N are coprime. Thus Z_n≅U_N/U_{p^n N}; the tame congruence is not dropped.

**Proof or construction.**

1. Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups.
2. Identify the image of U_N by its kernel U_{p^n N}.
3. Form the two central quotients with the exact combined action relation.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H3/congruence-units`.

**Uses.** BHW8.18–8.19: State the finite étale torsors over subgroup level. O4 descent: Use an effective arithmetic finite-level group.

**API.**

- `TauCeti.HilbertModular.hilbertLevelScalarKernel` (constructor): The central image Z_n of U_N in Γ₀.
- `TauCeti.HilbertModular.levelScalarKernel_mem` (characterisation): γ∈Z_n iff γ=ηI₂ for η∈U_N.
- `TauCeti.HilbertModular.levelScalarKernel_quotient` (equivalence): Z_n≅U_N/U_{p^n N}.

**Unit tests.**

- `TauCeti.HilbertModular.scalarKernel_Q` (computation): For F=ℚ,N≥4, Z_n={I₂}.
- `TauCeti.HilbertModular.scalarKernel_central` (compatibility): Every scalar image commutes with Γ₀.
- `TauCeti.HilbertModular.scalarKernel_tame` (non-example): A scalar global unit failing the N-congruence is not inserted into this image.

**Acceptance.** Γ₀ has an ineffective scalar subgroup on the arithmetic quotient, while the hybrid frame action is effective.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Definition 8.17 and§8.3.1, pp.1773–1775. The packet stores the short literal anchor “Definition 8.17.”.

#### Finite-level torsors and diagonal exact sequences

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/finite-level-torsors` · theorem.

In characteristic-zero with the stated fine tame level, X_Γ*→X_Γ₀* is a Γ₀* torsor, X_Γ→X_Γ₀* a Γ₀ torsor, and X_{G,Γ}→X_{G,Γ₀} a PΓ₀ torsor. The diagonal hybrid-to-arithmetic-subgroup map is an E torsor with exact sequences 1→Γ₀→E→Δ(N)→1 and 1→Δ(p^n N)→E→PΓ₀→1. No universal nonsplitting assertion is imposed on these extensions.

**Proof or construction.**

1. Use finite étale frame moduli to prove the first two torsor diagrams.
2. Calculate the two central quotient kernels directly from the H4 square relation.
3. Obtain the arithmetic and diagonal torsor diagrams by the finite Cartesian quotient squares, using the already proved first sequences, so the proof is not circular.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/effective-level-groups`, `HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison`, `HilbertModularVarietiesAndShimuraCurves:H4/gamma0-cartesian`, `HilbertModularVarietiesAndShimuraCurves:H4/projective-level-group`, `HilbertModularVarietiesAndShimuraCurves:H4/diagonal-level-group`.

**Acceptance.** For F=ℚ the extensions split, contrary to a blanket nonsplitting sentence in§8.3.1.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Proposition 8.18, diagram(8.6), Lemma 8.19, pp.1773–1775. The packet stores the short literal anchor “Lemma 8.19.”.

**Atlas planet:** Finite Hilbert torsors.

#### Finite connected unit limit and stable images

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/connected-limit-finiteness` · theorem.

For everyp including 2, the finite groups Δ_n(N) have the uniform bound|Δ_n(N)|≤[U:U_N]·2^g. Their inverse limit Δ_∞(N) is finite. Let I_n be the image of Δ_∞→Δ_n; the surjective transition maps I_{n+1}→I_n are isomorphisms for n≫0, so Δ_∞≅I_n eventually. The literal assertion Δ_∞≅Δ_n via projection for all large n is false at p=2. The whole-space inverse limit lim Δ(p^n N) is a separate profinite group and is not covered by this bound.

**Proof or construction.**

1. Write B_n=U_{p^n}∩U_N and A_n=U_{p^n}∩U+. Bound[A_n:B_n²] by[A_n:A_n∩B_n]·[B_n:B_n²]≤[U:U_N]·2^g using the pinned unit structure.
2. If an inverse limit had more than that bound many distinct elements, a common finite level would separate them, contradicting the bound; thus the limit is finite.
3. The projections onto I_n have surjective transitions; their bounded nondecreasing cardinalities eventually stabilize, hence those transitions become isomorphisms. Do not replace I_n by Δ_n without an additional proof.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups`, `HilbertModularVarietiesAndShimuraCurves:H3/delta-finiteness`, `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Acceptance.** The p=2,N=5 counterexample has|Δ_n|=6 and|Δ_∞|=3. S5/O4 must recheck any geometric quotient argument using the original stronger stabilization assertion.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.20, p.1775, corrected statement; source Issues E1–E2. The packet stores the short literal anchor “Lemma 8.20.”.

**Atlas planet:** Connected unit limit.

#### Counterexamples to the printed unit stabilization proof

**Node:** `HilbertModularVarietiesAndShimuraCurves:H4/stabilization-counterexamples` · application.

For F=ℚ(√2),ε=1+√2: (i)p=3,N=4,η=ε⁴=17+12√2 lies in U_4 and η≡−1 modulo 3, so η² defines a nonzero class in Δ₁(4) which is zero in Δ(4); neither root±η lies in U_12. (ii)p=2,N=5 andn≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n 5}=⟨ε^{3·2^n}⟩, hence Δ_n(5)≅ℤ/6 with transition multiplication by 2. Its inverse limit is ℤ/3; the original maps never stabilize to isomorphisms.

**Proof or construction.**

1. For(i), compute η mod 4 and 3 and use that the only field square roots of η² are±η.
2. For(ii), verify O×={±ε^k} by reducing a positive unit to the interval[1,ε) and using the Pell norm equation. Recurrence forε^{2^m}=a_m+b_m√2 givesv₂(b_m)=m; negative signs fail mod 4.
3. Compute the order ofε mod 5 as 12. Combine the congruence orders and positive-unit condition, obtaining the cyclic quotients and multiplication-by 2 transitions.
4. The 2-primary factor dies in the inverse limit and the 3-primary factor survives.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H4/connected-unit-groups`, `HilbertModularVarietiesAndShimuraCurves:H3/tame-delta`.

**Acceptance.** η²=577+408√2 has norm 1 and is totally positive. Multiplication by 2 on ℤ/6 is not injective or surjective. These calculations invalidate the printed proof even at an oddp, and the full eventual projection assertion at p=2.

**Source:** [BHW23](https://www.numdam.org/item/10.5802/aif.3560.pdf), Lemma 8.20 proof, p.1775; explicit countercalculation. The packet stores the short literal anchor “injective map”.

**Layer closure obligations.**

- Integral Γ₀ annihilator and closure comparison: The finite-flat O-stable isotropic rank condition defines the naive integral level functor. Transcribe the precise ideal-annihilator/local-model condition for the chosen ramified polarization class and prove which flat closure, if any, agrees on the ordinary locus used downstream. A generic free O/p^n basis and the rank count alone do not identify this integral model. The source’s Definition5.4 is generic and does not close this integral refinement.
- Consumers of the corrected connected unit limit: BHW Lemma8.20 has a false injection step and false projection stabilization at p=2, exhibited here. The finite inverse limit and eventual stable IMAGE groups are proved by the corrected uniform-bound argument. S5/O4 must use those images or prove a separate geometric replacement before treating Δ_∞ as the full finite group Δ_n. This packet does not edit their nodes or infer a full-tower finite quotient.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuli:A3: Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.
- AlgebraicModuliForArithmeticGeometry:R09.5: Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1: General finite locally free subgroup-scheme/Cartier-dual carrier with rank, O-action, isotropy and base change used for integral Γ₀ levels. The p-divisible-group and Raynaud specialized nodes do not by themselves supply this subgroup parameter functor.

### H5. Classical geometry and comparison tests

Require the rational modular comparison at every level, with the μ_N-to-point isogeny convention and cyclotomic component fields retained. Real quadratic minimal cusps have codimension two; they are not product boundary divisors. Split the Hodge bundle over a characteristic-zero coefficient field and descend the unsplit object before imposing algebraic weight conditions.

#### Rational modular-curve comparison

**Node:** `HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison` · comparison.

For F=ℚ both imported Hilbert groups are GL₂, d=ℤ, and a c-polarization becomes the elliptic principal polarization after the positive generator ofc is fixed. Match μ_N⊂E[N] to the marked-point Y₁(N) convention by quotienting E by its μ_N image and using the Cartier-dual kernel of the dual isogeny; match full and Γ₀ levels through the explicit dual/polarization maps. Then all three full-level spaces and their quotients agree with V8/R12.2 modular curves, with compatible level and Hecke maps. A fixed-root full pairing component has its actual cyclotomic field.

**Proof or construction.**

1. Use the imported rational group equalities and identify the c lattice by its chosen positive generator.
2. Construct the μ_N-to-point comparison by A3 quotient/Cartier duality, checking the marked e₁ versus e₂ convention rather than dropping it.
3. Compare every p-level forgetful/isogeny map with V8 and R12.2; retain the field of a selected root component.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ModularCurvesPartII:R12.2`.

**Acceptance.** Δ(N),Δ_n(N),Z_n are trivial for F=ℚ,N≥4. The comparison works over ℤ[1/N] in the appropriate finite-flat category, with fullp-level only generically.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H5, first paragraph. The packet stores the short literal anchor “For `F=ℚ`”.

#### Real quadratic domains and minimal cusps

**Node:** `HilbertModularVarietiesAndShimuraCurves:H5/quadratic-domain-boundary` · theorem.

For real quadratic F the Hilbert domains have complex dimension 2, with 4 independent-sign G components and 2 common-sign G* components. C6’s rational minimal boundary consists of finite zero-dimensional cusps on a chosen finite-level quotient, of codimension 2. This is not the boundary of a product of two compactified modular curves, whose divisor components are one-dimensional. Toroidal boundary divisors are a separate compactification.

**Proof or construction.**

1. Specialize H0 to two real embeddings.
2. Apply C6’s actual Hilbert minimal-cusp classification, not a product compactification.
3. Compare dimensions of the minimal cusp boundary and of a product’s boundary divisors.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/domain-comparison`, `ShimuraCompactifications:C6/hilbert-minimal-cusps`.

**Acceptance.** Minimal cusps and toroidal exceptional curves are not identified.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H5, quadratic comparison. The packet stores the short literal anchor “zero-dimensional rational boundary components”.

**Atlas planet:** Hilbert minimal cusps.

#### Hilbert Hodge splitting and descent

**Node:** `HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent` · comparison.

In characteristic-zero,ω_A is a rank-one O⊗𝒪 module. After extending coefficients to a field L containing all embeddings F→L, it decomposes canonically as⊕_τω_τ via the idempotents of F⊗L, with each ω_τ a line. The original unsplit O⊗𝒪 bundle and its descent datum recover ω_A; automorphic line construction and central descent agree with B4 and C6 on their stated loci. At a ramified integral prime there is no corresponding family of orthogonal embedding idempotents without extra structure.

**Proof or construction.**

1. Use rank-one freeness on the generic fibre and split the coefficient algebra F⊗L.
2. Identify the embedding components with B4’s actual weight-bundle construction.
3. Use the imported descent before splitting; contrast this with non-étale O⊗k at a ramified prime.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus`, `AutomorphicBundles:B4/unsplit-hilbert-descent`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`.

**Acceptance.** For F=ℚ the decomposition has one summand. For F=ℚ(√2),p=2, O⊗𝔽₂≅𝔽₂[T]/T² and the integral splitting assertion fails.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H5, Hodge bundle paragraph. The packet stores the short literal anchor “splitting coefficient field”.

#### Algebraic Hilbert weights and central units

**Node:** `HilbertModularVarietiesAndShimuraCurves:H5/algebraic-weights-units` · theorem.

For a coefficient field splitting F, an algebraic weight is(k_τ,w) withk_τ≡w modulo 2; putm_τ=(w−k_τ)/2. The tensor product of embedding Hodge/determinant factors is the B4 Hilbert arithmetic weight bundle, descended through the actual central kernel. Its scalar coefficient character is Norm_{F/ℚ}(t)^w in B4’s convention; totally positive units have norm 1, and any remaining sign character must be checked on the finite residual stabilizer. Nonalgebraic p-adic weights and integral ramified splitting are outside this assertion.

**Proof or construction.**

1. Apply B4’s precise parity and determinant-exponent convention.
2. Check the action of each central scalar on the descended coefficient line, not just on the domain.
3. Use positivity and Norm(η)=1 for positive units; check finite signs rather than declaring every central action trivial.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent`, `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `AutomorphicBundles:B4/hilbert-arithmetic-weight`, `AutomorphicBundles:B4/hilbert-central-descent`.

**Acceptance.** If somek_τ−w is odd, an integral algebraic determinant exponent is unavailable. A nontrivial sign character prevents descent through that stabilizer.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H5, weight and central-unit comparison. The packet stores the short literal anchor “central-unit conditions”.

**Atlas planet:** Algebraic Hilbert weights.

#### Nonprincipal and ramified comparison example

**Node:** `HilbertModularVarietiesAndShimuraCurves:H5/nonprincipal-ramified-test` · application.

Take F=ℚ(√10),O=ℤ[√10],c=(2,√10),N=7,p=5. The idealc has norm 2 and is not principal: a generator would have norm±2, impossible modulo 5. The primep ramifies since disc(F)=40, whilec and N are prime to p. Construct L_c and its dualc L_c, the DP model and its Rapoport/ordinary locus with this label. Over a splitting field ω has two lines; over the ramified residue base this splitting is not imposed.

**Proof or construction.**

1. Compute O,disc(F), the quotient O/c and the norm-form congruencea²−10b²=±2.
2. Apply H0’s trace-dual formula with the genuine nonprincipal ideal.
3. Apply the arbitrary-prime H2 model with 5∤7 and verify that it does not assert global smoothness or integral embedding splitting.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H0/lattice-duality`, `HilbertModularVarietiesAndShimuraCurves:H2/polarization-representatives-at-p`, `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `HilbertModularVarietiesAndShimuraCurves:H5/hodge-splitting-descent`.

**Acceptance.** The ideal’s nonprincipality andp ramification are checked independently. The example does not claim every fibre is ordinary.

**Source:** [ROADMAP](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), H5, final sentence. The packet stores the short literal anchor “nontrivial polarization ideal class”.

**Layer closure obligations.**

- ModularCurvesPartII:R12.2: The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.

### H6. Twisted torsion moduli and arithmetic points

The twist is the descent of an actual paired finite Isom-torsor, possibly with noncommutative structure group. Select a component and compute its field of definition before asking for real or finite local points. Local nonemptiness is a construction with exact residual types, not a consequence of Moret–Bailly. In Allen’s CM elliptic case the dual second module fixes the determinant and restriction of scalars makes X_i two-dimensional.

#### Simultaneous torsion Isom torsor

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor` · definition.

Let K be a characteristic-zero field and ℓ₁≠ℓ₂ distinct odd primes, with chosen fine tame level prime to ℓ₁ℓ₂. Fori=1,2 let V_i be a finite étale G_K-module locally free of rank 2 over O/ℓ_i O, equipped with a perfect alternating pairing∧²V_i≅(c d⁻¹/ℓ_ic d⁻¹)⊗μ_{ℓ_i}. Define the symplectic O-linear Isom torsor from the standard torsion module with its matching pairing to V_i, and take their product. Its finite structural group is the product of the two symplectic automorphism groups; it need not be commutative.

**Proof or construction.**

1. Construct the finite étale sheaf of actual pairing-preserving O-module isomorphisms.
2. Use the given determinant/pairing identity to ensure the torsor exists locally and identify its structural group.
3. Keep the product cocycle and its pairing target, rather than only the abstract representation dimensions.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `HilbertModularVarietiesAndShimuraCurves:H4/pairing-multiplier`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Uses.** Taylor simultaneous levels: Twist the fine Hilbert moduli by the residual Galois modules. Allen§7.2.5: Specialize to paired elliptic ℓ₁/ℓ₂ modules.

**API.**

- `TauCeti.HilbertModular.HilbertTorsionIsomTorsor` (constructor): The product of the actual finite pairing-preserving Isom torsors.
- `TauCeti.HilbertModular.torsionIsomTorsor_points` (characterisation): Sections are precisely the two O-linear symplectic identifications.
- `TauCeti.HilbertModular.torsionIsomTorsor_baseChange` (functoriality): The torsor pulls back with V_i and their actual pairing targets.
- `TauCeti.HilbertModular.torsionIsomTorsor_cocycle` (compatibility): A splitting-field frame gives the cocycleσ↦frame⁻¹σ(frame), and changing the frame gives a cohomologous cocycle.

**Unit tests.**

- `TauCeti.HilbertModular.torsionTorsor_trivial` (degenerate): For the standard paired modules with fixed frames, the torsor has a rational section and the twist is untwisted.
- `TauCeti.HilbertModular.torsionTorsor_determinant` (non-example): A two-dimensional representation whose determinant is not the required cyclotomic pairing character has no equivariant paired Isom section.
- `TauCeti.HilbertModular.torsionTorsor_coboundary` (compatibility): Changing both splitting frames by group elements leaves the descended twist canonically isomorphic.

**Acceptance.** A determinant-incompatible module is not an allowed input.

**Source:** [TAYLOR02](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf), §1, p.13, simultaneous torsion moduli. The packet stores the short literal anchor “moduli”.

**Atlas planet:** Torsion Isom torsor.

#### Twisted Hilbert torsion moduli

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist` · construction.

Twist the fine paired full ℓ₁/ℓ₂ Hilbert moduli and its universal HBAV by the inverse action of the actual Hilbert Torsion Isom Torsor. The descended K-space classifies(A,ι,λ,μ_N,α₁,α₂) withα_i:V_i≅A∨[ℓ_i] preserving the c d⁻¹-valued pairing. Over a splitting field it is isomorphic to the untwisted paired full-level space. This construction uses effective finite noncommutative descent, not the commutative Γ-only torsor-twist node of R09.4.

**Proof or construction.**

1. Form the contracted product with the actual finite level action, checking inverse/right-versus-left conventions.
2. Descend the scheme and its universal family from the splitting-field fine cover using R09.3.
3. Verify the moduli universal property by twisting the paired frames in both directions.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor`, `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/geometric-full-level`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** Potential Modularity And Compatible Systems R23.1–R23.2: Supply the actual twisted fine arithmetic variety. H6 local points: Turn explicit paired local HBAVs into local points.

**API.**

- `TauCeti.HilbertModular.TwistedHilbertTorsionModuli` (constructor): The descended simultaneous paired torsion moduli space.
- `TauCeti.HilbertModular.twistedHilbertModuli_points` (universal-property): T-points correspond to the stipulated HBAV and pairedα_i data.
- `TauCeti.HilbertModular.twistedHilbertModuli_split` (equivalence): A splitting field and chosen paired frames identify the twist with the untwisted full-level moduli.
- `TauCeti.HilbertModular.twistedHilbertModuli_universal` (data): The fine universal HBAV descends through the verified cocycle and pulls back to the untwisted family.

**Unit tests.**

- `TauCeti.HilbertModular.twist_trivial` (compatibility): The trivial framed torsor yields the original fine moduli and family.
- `TauCeti.HilbertModular.twist_pairing` (non-example): An unpaired abstract GL₂ torsor can mix Weil-pairing components and is not accepted as this twist.
- `TauCeti.HilbertModular.twist_frame_change` (compatibility): A cohomologous frame cocycle yields an isomorphism preserving the universal moduli interpretation.

**Acceptance.** No global rational frame for V_i is assumed.

**Source:** [TAYLOR02](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf), §1, p.13, moduli quintuple and smoothness. The packet stores the short literal anchor “smooth”.

**Atlas planet:** Twisted Hilbert torsion moduli.

#### Selected component descent and irreducibility

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent` · theorem.

Choose a geometric paired-multiplier and narrow-class component of the twisted full-level space. It descends over its finite field of definition K_C, or over K if its component label is G_K-fixed. The descended component is smooth of dimension g and geometrically irreducible; it is quasi-projective after applying the characteristic-zero PEL ample/compactification supplier and the finite descent of an ample bundle. The fine universal HBAV restricts to it. No component is declared G_K-fixed solely from a chosen splitting-field point.

**Proof or construction.**

1. Use the exact multiplier/component labels and their Galois action to compute the stabilizer field.
2. Use the complex quotient by the connected symmetric domain and DP’s normal connected-fibre result to obtain geometric irreducibility of the chosen component.
3. Descend smoothness and the fine universal family; obtain quasi-projectivity through the actual ample-line supplier and norm/descent along K_C.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist`, `HilbertModularVarietiesAndShimuraCurves:H4/component-and-torsor-comparison`, `HilbertModularVarietiesAndShimuraCurves:H1/complex-hilbert-comparison`, `ShimuraCompactifications:C5/open-quasiprojectivity`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Acceptance.** The dimension isg; in the elliptic specialization it is 1. A noninvariant component is exported over K_C, not silently over K.

**Source:** [DP94](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf), Corollary 2.4, p.64; Taylor§1, p.13. The packet stores the short literal anchor “2.4”.

**Atlas planet:** Twisted component descent.

#### Real torsion points with polarization signature

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points` · theorem.

At a real place of K_C, require the prescribed V_i to have the polarization-compatible odd involution: in a real split O/ℓ_i frame, complex conjugation has one+ and one− eigendirection and reverses the cyclotomic pairing. If the chosen component’s real signature is compatible, the real HBAV obtained from the ordered trace-polarized real analytic lattice gives paired torsion identifications and a real point on that component. The real local locus is a nonempty open around it. Even residual modules or a mismatched component are not covered.

**Proof or construction.**

1. Use the ordered module and trace sign to construct the real polarized complex torus with its real involution.
2. Apply A5 algebraicity and compute the torsion conjugation eigenspaces and alternating pairing.
3. Match the prescribed paired frames and the selected component label; use smoothness for the real open.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent`, `HilbertModularVarietiesAndShimuraCurves:H0/integral-trace-family`, `HilbertModularVarietiesAndShimuraCurves:H1/ordered-polarization-module`, `AbelianSchemesAndArithmeticModuli:A5`.

**Acceptance.** For F=ℚ the real elliptic torsion involution has eigenvalues+1 and−1 at odd ℓ. Determinant+1 on complex conjugation fails the required cyclotomic oddness.

**Source:** [TAYLOR02](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf), Lemma 1.4, p.12, real HBAV construction. The packet stores the short literal anchor “Lemma 1.4”.

#### Finite local Hilbert torsion points

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points` · theorem.

For a finite placev of K_C, local nonemptiness is asserted only for explicitly constructed paired HBAVs in the selected component. Under Taylor§1’s ordinary-extension/CM-character hypotheses, construct them by the trace-polarized Tate lattice in the multiplicative case, or by the ordinary Honda–Tate HBAV followed by O-linear Serre–Tate lifting in the finite H_f extension class. At the second auxiliary characteristic use the separately specified ordinary construction. Matching both auxiliary torsion modules, pairing multipliers and component labels is part of the conclusion; arbitrary local Galois modules are not claimed realizable.

**Proof or construction.**

1. For the multiplicative case choose the lattice parameter in the stated Kummer class and adjust its valuation by an auxiliary-divisible positive element to ensure trace polarization.
2. For the ordinary case import Honda–Tate, construct the O-action and ordered polarization class, then lift the exact finite extension class by Serre–Tate with its endomorphism/polarization constraints.
3. Check the two paired torsion identifications and the component label, then take the specified nonempty smooth local open. The exact Taylor input data and Honda–Tate supplier are recorded as prerequisites/gaps, not an unconditional realization theorem.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent`, `HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`, `AbelianSchemesAndArithmeticModuliPartII:F3`.

**Acceptance.** A residual extension outside the finite H_f condition is not declared to have an ordinary good-reduction lift. Local opens carry their place, extension field and component label.

**Source:** [TAYLOR02](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf), Lemmas 1.2–1.3, pp.9–12. The packet stores the short literal anchor “Lemma 1.2”.

#### Allen elliptic twists and Weil restriction

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists` · construction.

Under Allen Assumption 7.2.6 (ℓ₂ splitting in the coefficient fields; the two residual images containing SL₂; ℓ₁,ℓ₂ unramified in F, outside each S_i, of good reduction for E, and >2m_i+3), put K=FF₁⁺ and fix r_i′ with determinant ε_{ℓ₂}^{−1}. Define Y_i/K to classify elliptic D with symplectic α₁:E[ℓ₁]≅D[ℓ₁] and α₂:V_{r_i′}∨≅D[ℓ₂]. This is the paired elliptic specialization of the simultaneous Isom-torsor twist; its selected geometric component is a smooth geometrically irreducible curve. The second residual module is dualized so its pairing has cyclotomic multiplier.

**Proof or construction.**

1. Specialize the actual paired torsion twist to F=ℚ and use V_{r_i′}∨ so its determinant isε_{ℓ₂}.
2. Use A6 finite-separable Weil restriction of the quasi-projective scheme Y_i.
3. Use the splitting-product comparison to compute smoothness, dimension and geometric irreducibility; do not repeat the generic Weil-restriction theorem.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist`, `HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent`, `HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** Allen proof of Theorem 7.1.11: Supply the actual Y_i/X_i variety for the Moret–Bailly application. Potential Modularity And Compatible Systems R23.1: Export its dimension, real loci and finite local opens.

**API.**

- `TauCeti.HilbertModular.AllenEllipticTwist` (constructor): The symplectic elliptic moduli Y_i.
- `TauCeti.HilbertModular.allenElliptic_points` (universal-property): Points are D with the two stipulated paired torsion isomorphisms.
- `TauCeti.HilbertModular.allenElliptic_split` (equivalence): Over a splitting field it is the compatible Weil-multiplier component of the full elliptic level moduli.

**Unit tests.**

- `TauCeti.HilbertModular.allen_dual` (non-example): The undualized second module has inverse cyclotomic determinant and generally fails the pairing condition.
- `TauCeti.HilbertModular.allenElliptic_dimension` (computation): Y_i has dimension 1.
- `TauCeti.HilbertModular.allenElliptic_trivial` (compatibility): When both paired modules are torsion of one elliptic curve, that curve with identity maps gives a point.

**Acceptance.** X_i is not an elliptic moduli curve when[K:k]=2.

**Source:** [ALLEN23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.2.5, author p.209, defining Y_i and X_i; collated with published §7.2.5, pp.1103–1106. The packet stores the short literal anchor “Let Yi”.

**Atlas planet:** Allen elliptic torsion twists.

#### Allen restriction of torsion moduli

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli` · construction.

For K=FF₁⁺, k=F⁺F₁⁺ in Allen §7.2.5, define X_i=Res_{K/k}Y_i using A6’s quasi-projective finite-separable restriction of scalars. It is smooth and geometrically irreducible of dimension [K:k]=2. The universal family on Y_i gives an abelian-family restriction comparison over X_i. At a real place, X_i(ℝ)=Y_i(ℂ), so this CM case requires no real odd involution.

**Proof or construction.**

1. Specialize the actual paired torsion twist to F=ℚ and use V_{r_i′}∨ so its determinant isε_{ℓ₂}.
2. Use A6 finite-separable Weil restriction of the quasi-projective scheme Y_i.
3. Use the splitting-product comparison to compute smoothness, dimension and geometric irreducibility; do not repeat the generic Weil-restriction theorem.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** Allen proof of Theorem 7.1.11: Supply the actual Y_i/X_i variety for the Moret–Bailly application. Potential Modularity And Compatible Systems R23.1: Export its dimension, real loci and finite local opens.

**API.**

- `TauCeti.HilbertModular.AllenRestrictionModuli` (constructor): X_i=Res_{K/k}Y_i.
- `TauCeti.HilbertModular.allenTwist_points` (characterisation): X_i(L)=Y_i(K⊗_k L).
- `TauCeti.HilbertModular.allenTwist_split` (compatibility): Its geometric base change is the product of the conjugate Y_i.
- `TauCeti.HilbertModular.allenRestriction_family` (data): The finite-étale A6 restriction of the pulled-back elliptic family has relative dimension [K:k].

**Unit tests.**

- `TauCeti.HilbertModular.allen_dimension` (computation): For the quadratic CM extension, X_i has dimension 2.
- `TauCeti.HilbertModular.allen_real` (compatibility): For a real place of k, K⊗_k ℝ≅ℂ and X_i(ℝ)=Y_i(ℂ).
- `TauCeti.HilbertModular.allen_restriction_split` (compatibility): For K=k the restriction is Y_i itself.

**Acceptance.** X_i is not an elliptic moduli curve when[K:k]=2.

**Source:** [ALLEN23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.2.5, author p.209, defining Y_i and X_i; collated with published §7.2.5, pp.1103–1106. The packet stores the short literal anchor “Let Yi”.

#### Allen finite local elliptic points

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points` · theorem.

Retain Allen’s auxiliary-prime and local finite-flat hypotheses. Above L₀∪{ℓ₁}, use E after a finite unramified extension whose Frobenius powers match the two paired residual modules. Above ℓ₂, when the residual dual is the prescribed supersingular finite-flat type or a peu-ramifié ordinary extension, construct a good-reduction D after a finite unramified extension and pair both torsion identifications. In the ordinary case lift the negative residual extension class using Lemma 7.2.2 and Serre–Tate. For supersingular D descended from𝔽_{ℓ₂}, Frobenius overk(w) uses its residue degree: its squared scalar is(−ℓ₂)^{[k(w):𝔽_{ℓ₂}]}, not universally−ℓ₂.

**Proof or construction.**

1. At places away from ℓ₂ choose a common finite unramified extension killing the finite Frobenius discrepancies while preserving the pairing determinant.
2. In the supersingular case choose the compatible finite-flat local type and compute the Frobenius scalar with the actual residue degree; enlarge the unramified degree until the prime-to-ℓ₂ torsion matches.
3. In the ordinary case choose an ordinary reduction and kill its finite residual unramified characters; use the H_f lift surjectivity and the negative class to obtain the dual residual extension.
4. Check the component/pairing and good reduction at every place; request the precise local finite-flat classification and Serre–Tate input rather than assuming every residual module is realized.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/allen-elliptic-twists`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, `HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli`.

**Acceptance.** An arbitrary non-finite-flat residual module is excluded. The ordinary residual extension lives over𝔽_{ℓ₂}, not the unrelated residue fieldk(w). The Frobenius check includes residue degree greater than 1.

**Source:** [ALLEN23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.2.5, author pp.209–210, and Lemma 7.2.2, pp.203–204; collated with published §7.2.5, pp.1103–1106. The packet stores the short literal anchor “Lemma 7.2.2”.

#### Geometric and local input export

**Node:** `HilbertModularVarietiesAndShimuraCurves:H6/moret-bailly-input-export` · application.

Export to R23.1–R23.2 the selected smooth geometrically irreducible quasi-projective K_C-scheme, its dimension, field of definition, fine universal family and all constructed nonempty real/finite local opens with their exact local extension and reduction conditions. In the Allen case export X_i overk and the corresponding Weil-restriction family, with dimension[K:k]. Moret–Bailly is a downstream theorem consuming these witnesses; it is not a prerequisite proving their existence.

**Proof or construction.**

1. Assemble the verified component and local constructions into one typed export with all fields and opens.
2. Check every local open refers to that component and base field, not a point on an unrelated split component.
3. Pass the bundle of inputs to the potential-modularity owner; no edge returns from its modularity theorem.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points`, `HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points`, `HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points`, `HilbertModularVarietiesAndShimuraCurves:H6/allen-restriction-moduli`.

**Acceptance.** The export records unresolved supplier/source-proof leaves before an implementation ticket is ready.

**Source:** [ALLEN23](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.2.5, author pp.210–211, Moret–Bailly step; collated with published §7.2.5, pp.1103–1106. The packet stores the short literal anchor “It follows”.

**Layer closure obligations.**

- Taylor local input and structured Honda–Tate realization: Taylor Lemmas1.2–1.3 are read, but their previously chosen CM characters, auxiliary-prime data and precise ordinary/multiplicative local hypotheses are not yet a closed typed input list. The ordinary construction also uses Honda–Tate with O-action and an ordered polarization. The reviewed AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate node supplies the underlying simple isogeny class, with its own Honda existence proof gap. Request its structured ordinary realization with O-action and ordered polarization from F3 and the A2/A3 interfaces; H6 only specializes that output. No unconditional realization of arbitrary residual modules is claimed.
- Allen supersingular and ordinary local pairing checks: Published pp.1104–1105 reduce the second residual representation to the two finite-flat types. Close the use of Lemma7.1.8 and its connected–étale orientation, choose a compatible good supersingular D and track its actual Frobenius polynomial over k(w), and verify that unramified extensions preserve the selected paired component. The printed supersingular scalar is insufficient for an arbitrary D and residue degree; the ordinary residual extension uses 𝔽_ℓ₂. The negative extension-class lift must be the exact Lemma7.2.2/A4 lift, not a generic torsion realization hypothesis.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- AbelianSchemesAndArithmeticModuliPartII:F3: Import the reviewed honda-tate node for the underlying finite-field isogeny class. Extend its realization contract to the specified O-action, ordinary slopes and ordered polarization used by Taylor Lemma1.3; the unpolarized simple-class classification alone does not supply this structured witness. Keep Honda existence proof with this owner.
- AbelianSchemesAndArithmeticModuli:A4: Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.
- AbelianSchemesAndArithmeticModuli:A5: Algebraization of the trace-polarized complex/real Hilbert torus, the homological lattice period map and its compatibility with dual/tame/pairing levels. Supply the real involution and polarization-sign computation used to identify paired torsion frames.

### R18.1. Quaternionic Shimura curves and the PEL bridge

One specified split real embedding gives the quaternionic curve domain H^±, dimension one and reflex field τ(F). The exact B× datum need not have a PEL interpretation. Yuan–Zhang’s G′/G″ bridge supplies an auxiliary PEL curve over its weighted CM reflex field F′⊇τ(F). Connected finite-level comparisons retain their prime-to-discriminant condition and field-of-definition obligation.

#### One-real-split quaternionic datum

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum` · construction.

Given a quaternion F-algebra B split at the specified real embedding τ and ramified at all other real embeddings, form G_B=Res_{F/ℚ}B× on the existing quaternion and restriction-of-scalars carriers. Set h_B(z)=([[x,y],[−y,x]]⁻¹,1,…,1) forz=x+iy under B_τ≅M₂(ℝ). Its full conjugacy class is H^±. Verify D4’s SV1–SV3; its real central weight need not be ℚ-rational when[F:ℚ]>1, which D4 treats as a separate predicate. A totally definite B yields a finite class set in R18.3 instead.

**Proof or construction.**

1. Use the existing quaternion conjugation/norm and restriction-of-scalars group, with the chosen real splitting.
2. Compute the three adjoint Hodge types at τ and type(0,0) at compact real factors.
3. At τ the induced involution is Cartan on PGL₂; at the other factors the identity is Cartan because they are compact. The rational adjoint group is ℚ-simple andh is nontrivial on it.

**Direct prerequisites:** `ShimuraData:D4/shimura-datum`, `ShimuraData:D2/cartan-adjoint-criterion`, `ReductiveGroupsPartII:RG2.0a`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** V8 specialization: Construct the canonical quaternionic curve. YZ§§3–5: Compare its connected geometry with the PEL bridge.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraDatum` (constructor): The D4 datum with one specified real split factor and the displayedh.
- `TauCeti.HilbertModular.quaternionicDatum_domain` (data): Its conjugacy domain is H^± and its connected domain is H.
- `TauCeti.HilbertModular.quaternionicDatum_splittingChange` (equivalence): Changing the real matrix splitting conjugatesh and yields the same datum class.
- `TauCeti.HilbertModular.quaternionicDatum_adjoint` (compatibility): The adjoint real group is PGL₂(ℝ) times compact quaternionic projective groups.

**Unit tests.**

- `TauCeti.HilbertModular.quaternion_Q_split` (compatibility): For B=M₂(ℚ), the complex domain is the modular H^± domain.
- `TauCeti.HilbertModular.quaternion_definite` (non-example): A totally definite algebra with no chosen split real place does not produce this curve datum.
- `TauCeti.HilbertModular.quaternion_dimension` (computation): For degreeg>1 with exactly one real split factor the domain is still one-dimensional.

**Acceptance.** For F=ℚ,B=M₂(ℚ), recover the inverse homological GL₂ datum. The full central weight is not falsely declared rational for a single active embedding.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, p.561, displayedh and uniformization. The packet stores the short literal anchor “4.1. Shimura curve X.”.

**Atlas planet:** Quaternionic Shimura datum.

#### Quaternionic reflex field and dimension

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension` · theorem.

For the one-real-split quaternionic datum, the reflex field is τ(F)⊂ℂ and the Shimura variety has complex dimension 1. The cocharacter type is nontrivial only at τ, so its Galois stabilizer fixes that embedding. This differs from the Hilbert datum’s reflex field ℚ and from the auxiliary PEL bridge field F′, which generally only contains τ(F).

**Proof or construction.**

1. Compute the geometric cocharacter class factor by factor, using its unique active real embedding.
2. Apply the imported reflex-stabilizer definition to identify τ(F).
3. Use the H^± domain identification for dimension 1.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`, `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`.

**Acceptance.** For F=ℚ the reflex field is ℚ. A Hilbert group comparison cannot be used to set this reflex field to ℚ forg>1.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, p.561, canonical curves over F; compare Proposition 3.1, p.551. The packet stores the short literal anchor “over F”.

**Atlas planet:** Quaternionic reflex field.

#### Canonical quaternionic curve and uniformization

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve` · construction.

For compact open U⊂G_B(A_f), apply the general canonical-model theory at the datum’s reflex field τ(F), obtaining Sh_U(G_B,X_B). Its complex points are G_B(ℚ)\(H^±×G_B(A_f)/U). Level and datum maps are the V8 maps with their effective-kernel hypotheses. The curve is proper when B is division; the split rational case is the nonproper modular curve and obtains cusps from R12.2. No general abelian moduli interpretation of this exact G_B is asserted.

**Proof or construction.**

1. Apply V8’s canonical-model output for this exact datum and field; request the explicit non-rational-central-weight coverage if absent.
2. Compare the complex double cosets with the displayed real splitting and reflex embedding.
3. Use quaternionic anisotropy/properness in the division case and the imported modular case when B=M₂(ℚ).

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8`, `ModularCurvesPartII:R12.2`, `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** R18.2: Provide the canonical generic fibre of quaternionic integral models. R18.4/R18.5: Supply exact level and reflex-field inputs to cohomology and bad-prime uniformization.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraCurve` (constructor): The canonical finite-level curve over τ(F).
- `TauCeti.HilbertModular.quaternionicCurve_complex` (compatibility): Its complex analytic space is the displayed double-coset quotient.
- `TauCeti.HilbertModular.quaternionicCurve_changeLevel` (functoriality): For U′⊂U the canonical level map commutes with Hecke maps and complex uniformization.
- `TauCeti.HilbertModular.quaternionicCurve_splitQ` (equivalence): For F=ℚ,B=M₂(ℚ), matching levels identify it with R12.2’s modular curve.

**Unit tests.**

- `TauCeti.HilbertModular.curve_Q_split` (compatibility): The split rational curve is noncompact before modular compactification.
- `TauCeti.HilbertModular.curve_Q_division` (computation): An indefinite quaternion algebra over ℚ ramified at two finite primes yields a compact curve.
- `TauCeti.HilbertModular.curve_definite` (non-example): The totally definite datum is not passed to this one-dimensional constructor.

**Acceptance.** Compact quaternionic curves have no Hilbert cusp boundary. Every level-map statement carries effective stabilizer conditions.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, p.561, complex uniformization and compactness. The packet stores the short literal anchor “uniformization”.

**Atlas planet:** Canonical quaternionic curve.

#### Quaternionic central kernel and small levels

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers` · theorem.

At finite complex level, quotient Γ_g=B_+×∩g Ug⁻¹ by its rational scalar subgroup before measuring freeness on H. On the adelic inverse tower the ineffective central subgroup is the closure of F× in B_f×; it is not in general the discrete subgroup F×. For the compact division case and U⊂(1+NÔ_B)× with N≥3, the effective Γ_g acts freely and each compact connected component has genus≥2. No genus≥2 conclusion is applied to the noncompact split rational curve.

**Proof or construction.**

1. Separate the rational archimedean stabilizer from the adelic closure kernel of the entire tower.
2. For a noncentral fixed-point γ, its generated field is CM and γ/γ̄ is a root of unity congruent 1 modulo N;N≥3 forces it to be 1, hence γ central.
3. After removing those scalars, obtain a free H uniformization; compactness and hyperbolic area give genus≥2.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.3`, `ShimuraVarieties:V8/finite-level-maps`.

**Acceptance.** At small levels elliptic stabilizers are retained. For F≠ℚ the closure distinction is carried through every tower quotient.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, pp.561–562 and Proposition 4.1. The packet stores the short literal anchor “Proposition 4.1.”.

**Atlas planet:** Quaternionic effective levels.

#### Yuan–Zhang PEL bridge groups

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups` · definition.

Choose a quadratic CM extension E/F and nearby CM types Φ₁,Φ₂ differing at τ. Define G″=Res_{F/ℚ}(B××_{F×}E×), quotienting by(a⁻¹,a). Its derived group is Res B¹;ν(b,e)=(Nrd(b)eē,e/ē) identifies its derived quotient with Res F××Res E¹. Define G′ by ν₁ lying in diagonal G_m. Lift the datum withh_E(z)=(1,z⁻¹,…,z⁻¹). The bridge is auxiliary; it does not redefine the quaternionic datum.

**Proof or construction.**

1. Use the imported central quotient and restriction-of-scalars constructions with the specified(a⁻¹,a) kernel.
2. Compute ν and its kernel from the quaternion reduced norm and CM conjugation.
3. Combineh_B andh_E and verify that ν₁ is rational scalar onh′.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`, `ShimuraData:D4/datum-morphism`, `ReductiveGroupsPartII:RG2.0a`.

**Uses.** YZ§3.1: Construct a Hodge/PEL realization for comparison with the quaternionic curve. R18.2: Retain the exact auxiliary groups used for integral andp-divisible comparisons.

**API.**

- `TauCeti.HilbertModular.YuanZhangBridgeGroups` (constructor): The central quotient G″ and scalar ν₁ subgroup G′ on imported group carriers.
- `TauCeti.HilbertModular.yzBridge_norm` (data): ν₁=Nrd(b)eē and ν₂=e/ē.
- `TauCeti.HilbertModular.yzBridge_derived` (compatibility): Both bridge groups have derived group Res B¹.
- `TauCeti.HilbertModular.yzBridge_datum` (constructor): The liftedh′ is induced by(h_B,h_E) with the displayed CM-type convention.

**Unit tests.**

- `TauCeti.HilbertModular.bridge_kernel` (computation): The pair(a⁻¹,a) has ν₁=1 and ν₂=1 for everya∈F×.
- `TauCeti.HilbertModular.bridge_scalar` (non-example): An arbitrary ν₁∈F× is allowed in G″ but not in G′ unless it is rational scalar.
- `TauCeti.HilbertModular.bridge_active` (compatibility): At τ theh_E factor is 1; at all other CM factors it isz⁻¹.

**Acceptance.** The bridge has the same connected adjoint curve geometry but a different centre and reflex field.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §3.1, pp.550–551, defining G″,ν and G′. The packet stores the short literal anchor “3.1. Moduli interpretations.”.

**Atlas planet:** Quaternionic PEL bridge.

#### Weighted CM reflex field of the bridge

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex` · theorem.

The reflex field F′ of(G′,h′), and likewise(G″,h″), is the field fixing the weighted CM type Φ₁+Φ₂=2(Φ₁∩Φ₂)+τ₁+τ₂. It contains τ(F), because a stabilizer fixes the unique weight-one pair and hence its restriction to F. Equality F′=F is not asserted. In Carayol’s special E=F(√λ), λ∈ℚ<0, with the displayed nearby types,F′=E in the chosen embedding.

**Proof or construction.**

1. Compute the cocharacter multiplicities on E through the two nearby types.
2. Identify the Galois stabilizer of the weighted set and its unique weight-one restriction.
3. Compute the special quadratic-over ℚ case separately; preserve the inclusion τ(F)⊂F′ in the comparison maps.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups`, `ShimuraData:D3/reflex-field`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension`.

**Acceptance.** Comparison with the quaternionic curve requires base change to F′.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 3.1, p.551; special case§3.2, p.552; §5.1, p.571. The packet stores the short literal anchor “Proposition 3.1.”.

#### Quaternionic PEL bridge instance

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance` · construction.

Let B′=B⊗_FE, V′=B′ with its left B′ module structure. Choose invertible γ′ with γ̄′=−γ′ and with the required archimedean positivity. Set ψ′(v,w)=Tr_{E/ℚ}Trd_{B′/E}(γ′v w̄), and*=γ′⁻¹ℓ̄γ′. Specialize M0/M1 to obtain the G′ PEL moduli over F′: abelian schemes up to isogeny, B′ action with the full determinant condition determined by Φ₁+Φ₂, polarization with this Rosati involution, and U′-orbit of rational adelic similitude frames. An arbitrary anti-fixed γ′ need not be polarizing.

**Proof or construction.**

1. Compute alternation, nondegeneracy and the adjoint involution from γ̄′=−γ′.
2. Check the positivity of γ′ againsth′ rather than inferring it from anti-fixity.
3. Apply the imported rational PEL moduli construction and identify the weighted characteristic polynomial; characteristic-zero trace data here determines the semisimple multiplicities, but the full determinant condition remains the stored interface.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex`, `PELModuli:M0/integral-pel-datum`, `PELModuli:M0/determinant-condition`, `PELModuli:M1/char-zero-adelic-moduli`, `PELModuli:M3/complex-points`, `mathlib:AlgebraicGeometry.Scheme`.

**Uses.** YZPropositions 4.2–4.4: Supply the auxiliary canonical PEL curve for component comparison. R18.2: Provide its exact generic datum before constructing an integral model.

**API.**

- `TauCeti.HilbertModular.quaternionicPELInstance` (constructor): The M0/M1 specialization with B′,ψ′,* andh′.
- `TauCeti.HilbertModular.quaternionicPEL_form` (data): The exact reduced-trace formula for ψ′.
- `TauCeti.HilbertModular.quaternionicPEL_adjoint` (compatibility): ψ′(ℓv,w)=ψ′(v,ℓ*w) with*=γ′⁻¹ℓ̄γ′.
- `TauCeti.HilbertModular.quaternionicPEL_moduli` (equivalence): The four data of YZ p.552 are the corresponding rational PEL moduli objects at sufficiently small U′.

**Unit tests.**

- `TauCeti.HilbertModular.qpel_nonzero` (non-example): γ′=0 is excluded: it would make ψ′ degenerate.
- `TauCeti.HilbertModular.qpel_positive` (non-example): Replacing a polarizing γ′ by−γ′ reverses the archimedean sign and cannot pass the same positivity test.
- `TauCeti.HilbertModular.qpel_adjoint` (compatibility): The left B′ action has exactly the stated Rosati involution, including the γ′ conjugation.

**Acceptance.** No generic PEL engine or abelian dual theory is rebuilt.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §3.1, p.552, equations(3.1.1)–(3.1.2) and four moduli conditions. The packet stores the short literal anchor “(3.1.1)”.

#### Quaternionic and PEL connected comparisons

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison` · comparison.

After base change to an algebraic closure containing F′ and choosing compatible identity components, the quaternionic tower component X⁰ and the PEL component X′⁰ have the YZ Proposition 4.2 isomorphism, intertwining the identified effective positive-norm stabilizers through G_B→G″. For idealsn supported at p and prime tod_B, and sufficiently small U^p depending onn, there is a matching U′^p and a finite-level connected comparison X_{n,U^p}⁰≅X′_{n,U′^p}⁰. Its field and descent maps must be specified: the printed Proposition 4.4 says “over K” without defining K in this passage; restoration from Carayol is a recorded gap.

**Proof or construction.**

1. Identify the connected adjoint domains and the effective positive-norm arithmetic actions, preserving all central quotients.
2. Apply the finite-level subgroup comparison with n prime tod_B and choose U^p small enough for thatn.
3. Descend a finite-type comparison only after choosing its actual field of definition and checking the required local/unramified field used by R18.2; do not invent K from the notation.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance`, `ShimuraVarieties:V8/finite-level-maps`.

**Acceptance.** U^p is allowed to depend onn. No ramified-quaternion prime level comparison is inferred from this prime-to-d_B theorem.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Propositions 4.2 and 4.4, p.563. The packet stores the short literal anchor “Proposition 4.4.”.

#### Torus bridge for quaternionic towers

**Node:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-torus-bridge` · comparison.

Let Ψ=Φ₁∩Φ₂ and Y/F′ be the zero-dimensional CM torus Shimura tower for Res_{E/ℚ}G_m withh_Ψ(z)=(1,z⁻¹,…,z⁻¹). The product datum map induces X×_FY→X″ over F′, and the tower comparison(X×_FY)/Δ(A_{F,f}×)≅X″ uses the twisted diagonalz↦(z,z⁻¹). At finite levels use the image U″ of U×J and the induced surjective map; an identical finite quotient description at all levels is not automatic. The Tate-module tensor and integral extensions belong to R18.2.

**Proof or construction.**

1. Apply the generic torus datum/canonical-model supplier to Ψ and form the product over the common reflex field.
2. Compute the kernel of B××E×→G″ as the twisted diagonal F× and compare the complex tower quotients including central closures.
3. Check finite-level image groups separately; export the specific map to the R18.2 owner for the Tate/p-divisible tensor comparison.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-reflex`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `ShimuraData:D4/product-datum`, `ShimuraVarieties:V8/datum-functoriality`.

**Acceptance.** Y is zero-dimensional, so the bridge still has curve dimension 1. The inverse in(z,z⁻¹) is essential.

**Source:** [YZ18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §5.1, pp.571–572, product map and twisted diagonal quotient. The packet stores the short literal anchor “twisted diagonal”.

**Layer closure obligations.**

- Carayol descent field in the finite-level bridge: YZ Proposition4.4 states a connected comparison “over K”; K is not identified in the immediately preceding passage. Restore its precise definition and finite/unramified field, descent cocycle and U^p dependence from Carayol before exporting an integral comparison to R18.2. The present R18.1 geometric connected comparison is over a common algebraic closure, with n supported at p and prime to d_B.
- Prototype signatures requiring unavailable supplier carriers: The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.
- ModularCurvesPartII:R12.2: The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.
- ReductiveGroupsPartII:RG2.0a: Restriction of scalars, central algebraic-group quotients and fibre products on existing carriers, including Res B×, its norm-one derived group and the quotient (B××E×)/{(a⁻¹,a)} with descended norm/conjugation maps.
- tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion: Existing quaternion algebra, conjugation, reduced norm/trace, real matrix splitting and CM scalar extension comparison used for the quaternionic datum and PEL bridge. Import upstream rather than proposing another quaternion algebra.
- ShimuraVarieties:V8: Canonical finite-level models and complex uniformization over the D3 reflex field for the D4 SV1–SV3 quaternionic datum, whose central weight need not be Q-rational; small-level effective quotient, properness and datum-map descent. Existing finite-level-maps/datum-functoriality nodes are used, but do not alone state this canonical-model endpoint.
- ReductiveGroupsPartII:RG2.0: Real/local points and their topology on the imported quaternion and restriction-of-scalars algebraic groups, including arithmetic subgroup actions and their scalar kernels.
- ReductiveGroupsPartII:RG2.3: Integral quaternion order levels (1+NÔ_B)×, their compact openness and nested-level comparison, with effective rational scalar stabilizers computed separately.

## Source corrections

These findings await independent review. “New” means that no correction was
found in the recorded publisher, arXiv and author-page checks; it is not a claim
of exhaustive novelty. Nodes use the corrected assertions.

### HilbertModularVarietiesAndShimuraCurves/E1: error

**Locator:** BHW23, Lemma8.20 proof, published p.1775.

The printed anchor is “injective map”. The inclusion-induced Δ_n(N)→Δ(N) need not be injective. Replace the cardinality argument by |Δ_n|≤[U:U_N]2^g.

In O=ℤ[√2], ε=1+√2, N=4,p=3, η=ε⁴=17+12√2 is1 modulo4 and−1 modulo3. Its square belongs to A_1 and is killed in Δ(4), but neither root ±η belongs to U_12, so its class in Δ_1(4) is nontrivial. This affects the proof.

Correction search: 2026-10-07: publisher article/errata search at https://aif.centre-mersenne.org/articles/10.5802/aif.3560/; no linked correction located. 2026-10-07: arXiv1902.03985 version history (latest v4,10May2021) and Heuer author OCHMF.pdf; Lemma8.20 retained the same stabilization assertion. 2026-10-07: targeted primary-source searches for Birkbeck–Heuer–Williams erratum and Lemma8.20 correction; none located. New means no correction found in these checks, not exhaustive novelty.

### HilbertModularVarietiesAndShimuraCurves/E2: error

**Locator:** BHW23, Lemma8.20 statement, published p.1775.

The printed anchor is “for all large n”. The inverse limit is finite, but projection identifies it eventually with its stable image I_n, not necessarily with all Δ_n. Retain all p and the corrected stable-image statement.

For F=ℚ(√2),p=2,N=5,n≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n5}=⟨ε^{3·2^n}⟩. Thus Δ_n=ℤ/6 with transition ×2; its inverse limit is ℤ/3, so every projection has proper image. The Pell recurrence and order12 of ε mod5 are checked explicitly. This affects a stated result.

Correction search: 2026-10-07: publisher article/errata search at https://aif.centre-mersenne.org/articles/10.5802/aif.3560/; no linked correction located. 2026-10-07: arXiv1902.03985 version history (latest v4,10May2021) and Heuer author OCHMF.pdf; Lemma8.20 retained the same stabilization assertion. 2026-10-07: targeted primary-source searches for Birkbeck–Heuer–Williams erratum and Lemma8.20 correction; none located. New means no correction found in these checks, not exhaustive novelty.

### HilbertModularVarietiesAndShimuraCurves/E3: error

**Locator:** BHW23, §8.3.1, published p.1774.

The printed anchor is “both extensions are non-split”. Nonsplitting requires additional hypotheses; keep the two exact sequences without a blanket nonsplitting conclusion.

For F=ℚ,N≥4 the positive unit group is trivial, U_N={1}, E=Γ₀ and the polarization quotients are trivial. The displayed extensions split. This affects a stated result.

Correction search: 2026-10-07: publisher article/errata search at https://aif.centre-mersenne.org/articles/10.5802/aif.3560/; no linked correction located. 2026-10-07: arXiv1902.03985 version history (latest v4,10May2021) and Heuer author OCHMF.pdf; Lemma8.20 retained the same stabilization assertion. 2026-10-07: targeted primary-source searches for Birkbeck–Heuer–Williams erratum and Lemma8.20 correction; none located. New means no correction found in these checks, not exhaustive novelty.

### HilbertModularVarietiesAndShimuraCurves/E4: gap

**Locator:** ALLEN23, §7.2.5 proof of Theorem7.1.11, published p.1105; author p.210.

The printed anchor is “(−l₂)^f”. Choose D with the required local finite-flat type and match its actual Frobenius polynomial. If D is the base change of a trace-zero supersingular curve over 𝔽_l₂, over k(w) the scalar after squaring is (−l₂)^[k(w):𝔽_l₂]. Then choose a common sufficiently divisible unramified degree.

The preceding passage permits a general unramified local field. Squaring Frobenius over residue degree h gives (−l₂)^h, and an arbitrary supersingular D was not shown to have the required scalar at that exact power. The missing residue-degree/choice check affects the presented local proof; a sufficiently divisible unramified extension repairs it once the finite-flat type is matched. This affects the proof.

Correction search: 2026-10-07: https://annals.math.princeton.edu/2023/197-3/p02 and targeted publisher correction/erratum searches; no correction to §7.2.5 located. 2026-10-07: arXiv1812.09999 and Taylor/Calegari author versions, including the published Calegari-hosted PDF; the two expressions remain in published p.1105. 2026-10-07: targeted primary-source searches for §7.2.5 correction; none located. No assertion of exhaustive novelty.

### HilbertModularVarietiesAndShimuraCurves/E5: misprint

**Locator:** ALLEN23, §7.2.5 ordinary case, published p.1105; author p.210.

The printed anchor is “k(w)(ε_l₂ χ²)”. Use the residual coefficient module 𝔽_l₂(ε_l₂χ²) in the H_f extension class.

The two-dimensional residual representation and the preceding ordinary extension class are over 𝔽_l₂; k(w) is the unrelated residue field of the local place. Lemma7.2.2 lifts the residual coefficient module used there. This affects nothing.

Correction search: 2026-10-07: https://annals.math.princeton.edu/2023/197-3/p02 and targeted publisher correction/erratum searches; no correction to §7.2.5 located. 2026-10-07: arXiv1812.09999 and Taylor/Calegari author versions, including the published Calegari-hosted PDF; the two expressions remain in published p.1105. 2026-10-07: targeted primary-source searches for §7.2.5 correction; none located. No assertion of exhaustive novelty.


The BHW unit counterexamples are concrete. For ε=1+√2, ε⁴=17+12√2 is 1
modulo4 and −1 modulo3, so its square gives a nontrivial connected kernel class.
For p=2,N=5 and n≥2, the dyadic congruence order is 2^n and the mod5 order is12.
The resulting Δ_n=ℤ/6 transitions are multiplication by2. Their inverse limit
has three elements, and its image at every level is the order-three subgroup.
Bounded cardinality proves finiteness and stabilization of those images without
the false injection into Δ(N). Consumers S5/O4 must reconcile this correction
with their geometric quotient argument.

## Closure ledger and acceptance

The graph has no intended dependence on the Moret–Bailly theorem, perfectoid
limit theorem or boundary Hodge–Tate construction to establish their finite-level
inputs. A planned supplier node is a dependency, not a verified implementation.
Closure requires the following eight precise refinements in addition to the
producer requests above.

- **Arbitrary-prime DP scheme refinement:** DP2.1 constructs an algebraic space at full level; BHW§5.1.2 uses a μ_N scheme. The passage to μ_N fine moduli and a schematic arbitrary-prime model needs a precise representability/ample argument over ℤ_(p), with p=2 and ramified p retained. Good-prime M2 or C5 open-quasiprojectivity does not prove it at bad primes. Until this is supplied H2’s global object is an algebraic space, and scheme-only formal/adic consumers use étale scheme charts with explicit descent.
- **Integral Γ₀ annihilator and closure comparison:** The finite-flat O-stable isotropic rank condition defines the naive integral level functor. Transcribe the precise ideal-annihilator/local-model condition for the chosen ramified polarization class and prove which flat closure, if any, agrees on the ordinary locus used downstream. A generic free O/p^n basis and the rank count alone do not identify this integral model. The source’s Definition5.4 is generic and does not close this integral refinement.
- **Hecke polarization descent proof interior:** BHW Lemma8.22 invokes Kisin–Lai§1.9. The cb polarization module and dual-isogeny diagram have been transcribed, but the integral isotropy/elementary-divisor argument and its exact finite-flat hypotheses still need that proof. Supply it before using a general O-stable subgroup in the Hecke construction.
- **Taylor local input and structured Honda–Tate realization:** Taylor Lemmas1.2–1.3 are read, but their previously chosen CM characters, auxiliary-prime data and precise ordinary/multiplicative local hypotheses are not yet a closed typed input list. The ordinary construction also uses Honda–Tate with O-action and an ordered polarization. The reviewed AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate node supplies the underlying simple isogeny class, with its own Honda existence proof gap. Request its structured ordinary realization with O-action and ordered polarization from F3 and the A2/A3 interfaces; H6 only specializes that output. No unconditional realization of arbitrary residual modules is claimed.
- **Allen supersingular and ordinary local pairing checks:** Published pp.1104–1105 reduce the second residual representation to the two finite-flat types. Close the use of Lemma7.1.8 and its connected–étale orientation, choose a compatible good supersingular D and track its actual Frobenius polynomial over k(w), and verify that unramified extensions preserve the selected paired component. The printed supersingular scalar is insufficient for an arbitrary D and residue degree; the ordinary residual extension uses 𝔽_ℓ₂. The negative extension-class lift must be the exact Lemma7.2.2/A4 lift, not a generic torsion realization hypothesis.
- **Carayol descent field in the finite-level bridge:** YZ Proposition4.4 states a connected comparison “over K”; K is not identified in the immediately preceding passage. Restore its precise definition and finite/unramified field, descent cocycle and U^p dependence from Carayol before exporting an integral comparison to R18.2. The present R18.1 geometric connected comparison is over a common algebraic closure, with n supported at p and prime to d_B.
- **Consumers of the corrected connected unit limit:** BHW Lemma8.20 has a false injection step and false projection stabilization at p=2, exhibited here. The finite inverse limit and eventual stable IMAGE groups are proved by the corrected uniform-bound argument. S5/O4 must use those images or prove a separate geometric replacement before treating Δ_∞ as the full finite group Δ_n. This packet does not edit their nodes or infer a full-tower finite quotient.
- **Prototype signatures requiring unavailable supplier carriers:** The suggested file gives native fractional-ideal, trace, congruence-unit, residue-matrix and quotient signatures. Relative abelian schemes/duals, ordered sheaves, algebraic-group Shimura data/canonical models, algebraic spaces and finite-flat moduli have no located pinned carrier matching the requested suppliers. Their exact API/test names and mathematical contracts are listed in the file’s omission ledger, without assumed theorem fields or dummy objects. Replace each omitted contract with its actual supplier-carrier signature as those interfaces become available.


Acceptance includes F=ℚ at all levels, a real quadratic four/two-domain comparison,
the ramified nonfree local-model submodule over k[T]/T², p=2 Hasse lift independence,
the nonprincipal c=(2,√10) in ℚ(√10) at p=5,N=7, the two explicit unit-quotient
counterexamples, and the split-rational/compact-division quaternionic curves.
Every definition's three tests above specify how it must agree with a nearby
library object and which tempting simplification fails.

## Bibliography and inspected passages

- **BHW23.** Christopher Birkbeck, Ben Heuer and Chris Williams. [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://www.numdam.org/item/10.5802/aif.3560.pdf). Annales de l’Institut Fourier 73 (2023), 1709–1794; published PDF. Read: §§5.1–5.2, pp.1740–1747; §§8.1–8.4, pp.1765–1779; §8.5 and §9.1–9.2: consumer conventions only.
- **DP94.** Pierre Deligne and Georg Pappas. [Singularités des espaces de modules de Hilbert, en les caractéristiques divisant le discriminant](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf). Compositio Mathematica 90 (1994), 59–79. Read: §§1–2, pp.59–67; §§3–4, pp.67–73; §5.1–5.12, pp.73–78: comparison context.
- **AIP16.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni. [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Author version dated 16 May 2016. Read: §§3.1–3.2; §5.2.4: ordinary locus lies in the Rapoport locus.
- **HIDA05.** Haruzo Hida. [p-adic automorphic forms on reductive groups](https://numdam.org/item/AST_2005__298__147_0.pdf). Astérisque 298 (2005), 147–254; public lectures. Read: §9.1, pp.230–234: polarized Hilbert moduli and ordinary comparison; its unramified hypotheses retained.
- **TAYLOR02.** Richard Taylor. [Remarks on a conjecture of Fontaine and Mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf). Journal of the Institute of Mathematics of Jussieu 1 (2002), 1–19; author PDF. Read: §1, pp.9–13: ordered modules, Lemmas1.2–1.4, simultaneous torsion moduli.
- **ALLEN23.** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. [Potential automorphy over CM fields](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; published PDF, collated with accepted author copy. Read: §7.2.1, Lemma7.2.2 (author pp.203–204); §7.2.5, Assumption7.2.6 and proof of Theorem7.1.11, published pp.1103–1106 (author pp.209–211).
- **YZ18.** Xinyi Yuan and Shou-Wu Zhang. [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics 187 (2018), 533–638; published PDF. Read: §3.1, pp.550–552: PEL bridge groups and reflex field; §4.1, pp.561–564: quaternionic curve, stabilizers, Propositions4.1–4.4; §5.1, pp.571–573: torus bridge and tower comparison; Collated with author version of17August2017, §§3.1,4.1,5.1; height/integral results outside this part.
- **ROADMAP.** Tau Ceti Atlas maintainers. [Hilbert Modular Varieties And Shimura Curves: source targets](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md). Campaign document and accepted RS-23, read2026-10-07. Read: H0–H6 and R18.1; Accepted RS-23 keeps for these eight stages.

Source versions and PDF hashes are recorded in the packet. The [handoff](../handoff/BP-HilbertModularVarietiesAndShimuraCurves--H0.md) records validation, prototype coverage and the precise supplier/source work needed for closure.
