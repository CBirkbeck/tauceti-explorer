# Exceptional theta correspondences for G₂

This target-level plan constructs the exceptional local theta correspondences from concrete octonion and minimal-representation models, proves the independent finiteness and period inputs in an acyclic order, and accounts for all 112 routed items from the two Gan–Savin extractions. It also supplies quaternion relative models and the exceptional global lifting inputs used by the sequel. All eleven stages are planned; explicit proof and source obligations prevent any closure or implementation claim.

## Conventions and boundaries

Unless explicitly stated otherwise, F is a nonarchimedean local field of characteristic zero, p is its residue characteristic, representations are smooth complex representations, and ψ is a fixed nontrivial unitary additive character. Algebraic constructions specify their field separately. Induction and Jacquet functors are normalized by the positive square root of the modulus; c-Ind denotes locally constant functions with support compact modulo the subgroup. Tempered and square-integrable representations use unitary central characters. A full algebraic dual and a smooth contragredient are distinguished.

Write G=G₂(F), H=PGSp₆(F), and H₃=PGL₃(F)⋊C₂. The cubic division algebra D in the E₆ correspondence has degree three. In the quaternion relative-model layer D instead has degree two; its pointwise stabilizer is denoted GD. Characters on maximal unipotents are denoted ψV for G and ψV′ for H, to avoid confusing either with the nonmaximal radicals N and U of the two G parabolics.

The standard G₂ roots are α short and β long. P stabilizes a null plane and Q a null line. Opposite radicals carry a bar. For GL₂ data, `I_P(s,τ) = Ind_P^G(|det|^s τ)`, and similarly for Q and the indexed H parabolics; a one-dimensional input χ means χ∘det. A standard Langlands quotient is denoted J and a discrete-series submodule δ. In the PGSp₆ Siegel Levi the GL₃ coordinate acts on the three exterior-square basis vectors; its lattice is not the unmodified standard GL₃ block lattice.

The roadmap constructs the three exceptional correspondences and the inputs for globalization. It does not assume the downstream local Langlands correspondence for G₂, which belongs to the roadmap LocalLanglandsCorrespondenceForG2 (not yet designed) and consumes this one. A complete packet is a complete planning pass: every stage below is planned and remains open for the precise obligations listed at the end.

Boundaries with the neighbouring roadmaps, all of which are TauCetiRoadmap pull requests or Tau Ceti roadmaps:

- **SmoothRepresentationsOfLocalGroups** (pull request #785) supplies the smooth category, induction, Jacquet functors, second adjointness, the Langlands classification, cuspidal splitting and Whittaker functionals, with Whittaker multiplicity one only for GL₂. Whittaker multiplicity one for quasi-split groups, Prasad’s GL₃ ↓ GL₂ theorem, the Mœglin–Waldspurger degenerate-Whittaker comparison, the Harish-Chandra–Silberger reducibility criterion and two isotypic-quotient identities are requested from its undesigned Part II. The Schwartz-algebra Ext comparison and discrete-series projectivity used in EX.4 are the SR packet’s own Part II nodes. Its accepted Part II on the unitary dual (SmoothRepresentationsOfLocalGroupsPartII) owns the Fell-topology results of Gan–Savin’s Appendix B, which this roadmap does not use.
- **MetaplecticAutomorphicForms** (pull request #1063) owns the classical inputs of Gan–Savin’s proof: the rank-one oscillator constituents (§3.37, GS §8.4), the GL₂–GSO₄ correspondence (§3.38, GS Lemma 13.2), the restricted Mp₂ × G₂ oscillator with its Jacquet sequence and cuspidal injectivity (§3.38a, Gan–Gurevich), the minimal orthogonal lift (§3.39, GS Proposition 14.2) and the division ternary lift σ\_ρ (§3.40). They are imported here and never planned again; EX.6 plans only the description of the supercuspidal lifts through the restricted oscillator. The Saito–Kurokawa lift τ\_ρ and Howe–Li low rank are requested from its undesigned Part II.
- **ModularityAndLanglandsExtensions** (pull request #1180) §3.5 supplies the Gan–Takeda correspondence for GSp₄, whose part (vi) on Plancherel measures handles the nongeneric τ\_ρ in EX.1.
- **AutomorphicLFunctionsAndLocalFactors**, **AutomorphicFormsOnReductiveGroups**, **AutomorphicSpectralTheory**, **EndoscopicTransferAndUnitaryTraceComparison** and **ReductiveGroupsPartII** supply local factors, automorphic forms, Eisenstein series, the GLₙ correspondence and dual groups; the Langlands–Shahidi spin factor of PGSp₆ and Salamanca-Riba’s range theorem are requested from undesigned Part IIs.
- The Tau Ceti roadmaps **ReductiveGroups**, **RepresentationTheory/LieHighestWeight**, **RepresentationTheory/SpinRepresentations**, **RepresentationTheory/ClassicalGroups** and **ClassFieldTheory** supply group schemes, the split exceptional Lie algebras, triality, branching and the Weil group.

The complex L-parameters and component groups of EX.0 are general notions; the packet’s restructure proposal records that they should move to their most foundational owner once one is planned.

## Baseline and dependency audit

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The actual octonion and Albert-algebra declarations were read at these pins. Tau Ceti supplies the Zorn carrier, multiplicative norm, quadratic identity and seven-dimensional imaginary submodule, and the split Albert algebra carrier without its Jordan identity. Its associative algebra-equivalence carrier is unsuitable for octonion automorphisms; the suggested file uses a multiplication-preservation predicate on an existing linear equivalence.

The reviewed atlas library audit and current upstream main were also checked. The upstream roadmap commit is `0d144d044dacebca17b654695b6f1ad58f159b27`; the current library commit is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmaps absent from the old snapshot were inspected for overlaps. The supplier pull requests were read at their current heads: #785 at `1e875b1`, #1063 at `f91c5dd`, #1180 at `c316a1b`, #924 at `4ed76a2`, #1037 at `dc45964`, #925 at `b34d8a7` and #999 at `080ed77`.

| Baseline reference | Verified contribution |
|---|---|
| tauceti:TauCeti.Octonion | The split Zorn octonion carrier with its nonassociative multiplication, trace, norm and imaginary submodule. |
| tauceti:TauCeti.Octonion.norm_mul | The octonion norm is multiplicative. |
| tauceti:TauCeti.Octonion.mul_self | The octonion quadratic identity x² = trace(x)·x − norm(x)·1. |
| tauceti:TauCeti.Octonion.finrank_imaginary | The trace-zero submodule has finrank seven over every commutative ring with the strong rank condition. |
| tauceti:TauCeti.AlbertAlgebra | The split Albert algebra over a commutative ring with 2 invertible, with its symmetrized product, unit, trace and dimension 27; the Jordan identity is not proved there. |

The algebraic `Representation` carrier in Mathlib has no smoothness or admissibility condition. It is therefore not cited as supplying p-adic representation theory. The cited statements were checked in source and also resolved against the supplied baseline declaration index. No declaration is claimed implemented by this plan.

## EX.0. Octonion geometry and complex parameters

Identify the existing split octonion carrier with the pinned G₂ group; construct null-space parabolics, cubic Fourier data, the PGSp₆ Jordan coordinates and complex local parameters with raw versus fixed-split component groups.

Dependencies: MetaplecticAutomorphicForms:MP.3; ReductiveGroupsPartII:RG2.5; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.5; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈.

### The octonion model of G₂

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group` (definition).

For a characteristic-zero field F, define Aut(O) on the existing split Octonion F by F-linear equivalences fixing 1 and preserving the ordered product. Represent this functor by an affine smooth connected group and identify it, with a chosen pinning, with the split Chevalley group of type G₂. It is simultaneously simply connected and adjoint; its 7-dimensional module is ker(trace).

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: tauceti:TauCeti.Octonion; tauceti:TauCeti.Octonion.norm\_mul; tauceti:TauCeti.Octonion.mul\_self; tauceti:TauCeti.Octonion.finrank\_imaginary; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly.

Proof or construction:

1. Use polynomial multiplication-preservation equations in GL₈; derive preservation of trace and norm from the quadratic identity x²=tr(x)x−N(x)1.
2. Compare the torus and six positive root subgroups in the Zorn model with the Chevalley pinning; prove the map on groups, rather than infer a group isomorphism only from Der(O).

API:

- `IsOctonionAutomorphism`: The predicate on an F-linear equivalence g of Octonion F: g fixes 1 and g(xy) = g(x)g(y) for all x, y. The group of F-points of Aut(O) is the set of linear equivalences satisfying it.
- `IsOctonionAutomorphism.comp`: The composite of two octonion automorphisms is an octonion automorphism, and the identity is one.
- `IsOctonionAutomorphism.symm`: The inverse of an octonion automorphism is an octonion automorphism.
- `automorphism_preserves_trace`: An octonion automorphism preserves TauCeti.Octonion.trace.
- `automorphism_preserves_norm`: An octonion automorphism preserves TauCeti.Octonion.norm.
- `automorphism_preserves_imaginary`: An octonion automorphism maps TauCeti.Octonion.imaginary onto itself.
- `octonionAut_ext`: Two octonion automorphisms that agree on a spanning set of Octonion F are equal.
- `octonionAut_chevalley`: The pinned comparison of the represented group Aut(O) with the split Chevalley group of type G₂ identifies its torus, root subgroups and the 7-dimensional representation on the imaginary octonions (a README target: the group scheme is not available at the pins).

Discriminating tests:

- `octonionAut_refl` (degenerate): The identity linear equivalence is an octonion automorphism.
- `octonionAut_conj_not` (non-example): The linear involution conjugation fixes 1 and N but fails multiplicativity on two noncommuting Zorn basis elements.
- `octonionAut_longRootDiagonal` (computation): The long-root SL₃ element diag(2,1/2,1) sends the top-right vector e₁ to 2e₁ and is an automorphism.

Uses:

- GS §2.4; HKT A.1: Realise parabolics and null-space orbits in an existing concrete carrier.
- LL §10.1: Define quaternion stabilizers without confusing pointwise and setwise stabilizers.

Check: Check that conjugation is not an automorphism although it preserves the norm.

Source: GS, §§2.1–2.3, pp. 6–7. GS introduces the split octonion algebra with its conjugation, norm and trace, defines G₂ as its automorphism group, records that this group is split of rank two and both simply connected and adjoint, and fixes simple roots and a torus coordinate. The representability, the pinned comparison with the Chevalley group and the identification of the 7-dimensional module with the trace-zero part are the construction this node adds on the Tau Ceti carrier.

Planet: G₂ as octonion automorphisms.

### Null subspaces of the imaginary octonions

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces` (definition).

A null subspace W of O means W≤ker(trace) and xy=0 for every ordered pair x,y∈W. Every such W has dimension at most two. G₂(F) is transitive on null lines, null planes and incident line-plane flags in the split algebra.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group.

Proof or construction:

1. Use the Zorn multiplication and the polar form of N to classify mutually annihilating trace-zero vectors.
2. Reduce a nonzero null vector to a standard Zorn vector using elementary long and short root operations, then compute its annihilator to classify planes.

API:

- `IsNullSubspace`: A submodule W of Octonion F is null when W ≤ imaginary F and xy = 0 for all x, y in W.
- `null_le_imaginary`: A null subspace lies in the imaginary octonions.
- `null_mul_eq_zero`: The product of two elements of a null subspace is zero.
- `null_norm_eq_zero`: Every element of a null subspace has norm zero (by TauCeti.Octonion.mul\_self with trace zero).
- `null_finrank_le_two`: A null subspace has dimension at most two.
- `null_map_automorphism`: The image of a null subspace under an octonion automorphism is null.
- `null_subspace_transitive`: Two null subspaces of the same positive dimension are conjugate by an octonion automorphism; null lines and null planes therefore form single G₂(F)-orbits.

Discriminating tests:

- `isNullSubspace_bot` (degenerate): The zero subspace is null.
- `isNullSubspace_plane` (computation): The span of top-right e₁ and bottom-left e₂ is a two-dimensional null subspace.
- `not_isNullSubspace_unit` (non-example): The line F·1 is not null.
- `not_isNullSubspace_idempotent` (non-example): The Zorn idempotent with diagonal (1,0) has norm zero, but its line is not null because its trace is 1.
- `isNullSubspace_line` (computation): The line spanned by the Zorn vector with top-right entry e₁ and all other entries zero is a null subspace.

Uses:

- GS §2.4 and §13.4: Construct the G₂ parabolics and the orbit strata producing Jacquet filtrations.

Check: A norm-isotropic subspace containing an idempotent is rejected.

Sources:

- GS, §2.4, p. 7; §13.4, p. 44: GS takes subspaces of the trace-zero octonions on which multiplication vanishes identically, of dimensions one and two, and on p. 44 notes that such nonzero null spaces have dimension one or two.
- HKT, Appendix A.1, pp. 22–23: Savin's appendix shows from the multiplication table that a trace-zero subspace with trivial multiplication has dimension at most two, describes the null planes containing a given null vector, and notes that G₂ is transitive on nonzero trace-zero norm-zero vectors; transitivity on null planes and flags follows from their description as G₂/P and G₂/Q.

Planet: Null octonion subspaces.

### The two G₂ parabolics and their radicals

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/parabolics` (theorem).

Choose simple roots α short and β long. Put P=MN for the stabilizer of a null plane and Q=LU for a null line in an incident flag, so P∩Q=B. Both Levis are GL₂; δP=|det|³ and δQ=|det|⁵. N is Heisenberg of dimension 5 with center U₍₃α₊₂β₎ and N/Z=Sym³(F²)⊗det⁻¹. U has graded pieces F², det, F²⊗det and nilpotency class 3. Its center is U₍₃α₊β₎U₍₃α₊₂β₎; U/Z(U), rather than U/[U,U], is Heisenberg.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group; ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Proof or construction:

1. Compute radicals as products of positive root groups and their commutators.
2. Sum radical weights: 2ρP=3(3α+2β), 2ρQ=5(2α+β); identify Levi modules by highest weights.

Check: Verify the central layer has dimension 2 for U and dimension 1 for N.

Source: GS, §2.4, pp. 7–8; §11.2, p. 34. GS defines P and Q as the stabilizers of a null plane and a null line, with Borel intersection, Levi factors GL₂, modulus characters det³ and det⁵, the 5-dimensional Heisenberg radical of P with centre the highest root group and quotient Sym³ twisted by det⁻¹, and the three-step filtration of the radical of Q with its graded pieces. The node adds the centre of U and the correction that U/Z(U) is the Heisenberg quotient (packet E12).

Planet: G₂ parabolic geometry.

### Cubic étale Fourier data

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/cubic-characters` (definition).

Identify generic characters of N(F) trivial on its center with nonzero-discriminant binary cubics using ψ and the dual of Sym³(F²)⊗det⁻¹. Their M(F)-orbits correspond to cubic étale F-algebras E. Choose ψE in each orbit; π\_(N,ψE) is the existing twisted coinvariant quotient and W\_E(π)=Hom\_N(π,ψE). The choice is transported by conjugation, not made into a canonical basis.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; SmoothRepresentationsOfLocalGroups:SR.5/twisted-coinvariants; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals.

Proof or construction:

1. Use the binary-cubic orbit correspondence and equivariance of twisted coinvariants. Pin the trace pairing and ψ so that ψ and its conjugate cannot be exchanged silently.

API:

- `cubicCoeff_conjugate`: M-conjugate characters give naturally transported coinvariant and functional spaces.
- `cubicCoeff_dual`: The full algebraic dual of π\_(N,ψE) identifies with W\_E(π).
- `cubicCoeff_exact`: Twisted coinvariants are exact for these unipotent groups over C.

Discriminating tests:

- `cubicCoeff_split` (computation): The algebra F³ gives a nondegenerate split binary-cubic orbit.
- `cubicCoeff_partialSplit` (characterisation): F×K for quadratic field K is distinct from a cubic field and from F³.
- `cubicCoeff_trivial_not` (non-example): The trivial character has discriminant zero and is not indexed by a cubic étale E.

Uses:

- GS Lemma 6.4: Compare finite-dimensional cubic functionals with HJ,E-periods.
- GS §7: Nonfield E cannot embed in a cubic division algebra, forcing a zero coefficient.

Check: Check the three cubic splitting types and the contragredient character.

Source: GS, §2.4, p. 7; §3.5, p. 14; §5.4, p. 18. GS states that the generic M-orbits on characters of N trivial on its centre are indexed by cubic étale algebras E, fixes a representative character for each, and uses the twisted Jacquet modules along N and their duals Hom\_N(π, ψ\_E) in the restriction formula of §5.4.

Planet: Cubic Fourier coefficients.

### Long-root SL₃ and unitary stabilizers

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers` (theorem).

The long-root subgroup in G₂ is SL₃, the pointwise stabilizer of the split quadratic subalgebra F×F⊂O. Its setwise stabilizer is SL₃⋊C₂ with pinned outer action. A quadratic field K⊂O has pointwise stabilizer the quasi-split SU₃(K/F) and setwise stabilizer SU₃(K/F)⋊C₂.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components.

Proof or construction:

1. Use the decomposition O=K⊕K⊥ and the induced 3-dimensional K-hermitian space; compute the determinant condition and the normalizing conjugation.

Check: Separate pointwise from setwise stabilizers and the split from nonsplit quadratic algebra.

Source: GS, §2.5, p. 8. GS identifies the long-root subgroup with SL₃, the pointwise stabilizer of a split quadratic subalgebra, with normalizer SL₃ ⋊ Z/2Z acting by a pinned outer automorphism; for a quadratic field it gives the quasi-split SU₃ and its semidirect product with Z/2Z.

### Exceptional inclusions of complex dual groups

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings` (theorem).

Using the existing dual root datum construction, identify G₂∨=G₂(C), PGL₃∨=SL₃(C), and PGSp₆∨=Spin₇(C). Construct SL₃→G₂→Spin₇ compatibly with the octonion 7-module and spin 8-module. In G₂, the centralizers Z\_G₂(SL₃)=μ₃ and Z\_G₂(SO₃)=μ₃⋊C₂=S₃; the commuting long- and short-root SL₂ factors give (SL₂,l×SL₂,s)/μ₂=SO₄.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group; ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers; ReductiveGroupsPartII:RG2.5/langlands-dual-group; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations.

Proof or construction:

1. Compare weight lattices and root subgroups, compute centralizers on the octonion decomposition, and identify G₂ as a nonisotropic spinor stabilizer.

Check: The dual of PGSp₆ is Spin₇, so its center μ₂ must remain visible.

Source: GS, §2.6, p. 8; §15.1, p. 52. GS records the subgroups SO₃ ⊂ SL₃ ⊂ SL₃ ⋊ Z/2Z ⊂ G₂(ℂ), the centralizers μ₃ and S₃, the mutually centralizing long- and short-root SL₂ subgroups and the resulting SO₄; on p. 52 it composes parameters with G₂(ℂ) ⊂ Spin₇(ℂ). The node uses the corrected SO₄ statement (packet E1).

Planet: Exceptional dual-group embeddings.

### Complex local parameters

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters` (definition).

For a split connected reductive group with pinned dual Ĝ, a complex L-parameter is a Ĝ-conjugacy class of homomorphisms W\_F×SL₂(C)→Ĝ(C), continuous on W\_F with finite inertia image, semisimple on Frobenius and algebraic on SL₂; the two restrictions commute. Tempered means bounded Weil image; discrete means not contained in any proper Levi. Use the existing topological Weil group; |w|=q^(−deg w) for arithmetic Frobenius degree 1. This is not an integral parameter stack and is not a proof of LLC.

Hypotheses: F is a nonarchimedean characteristic-zero local field and the dual algebraic group is over C; the topological local Weil group is the imported one.

Inputs: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; ReductiveGroupsPartII:RG2.5/langlands-dual-group.

Proof or construction:

1. Form the representation type on the imported Weil carrier and complex dual group.
2. Prove the dictionary with Frobenius-semisimple Weil–Deligne pairs, including r(w)Nr(w)⁻¹=|w|N after fixing the SL₂-to-WD twist.

API:

- `lParameter_conjugate`: Temperedness and discreteness descend to Ĝ-conjugacy classes.
- `lParameter_comp`: An algebraic dual-group homomorphism transports a parameter when its image is Frobenius-semisimple; boundedness is preserved.
- `lParameter_wd`: The chosen geometric-reciprocity WD dictionary preserves inertia, Frobenius semisimplicity and monodromy.
- `lParameter_wd_compat_stack`: After a field isomorphism of ℂ with an algebraic closure of ℚ\_ℓ, the Weil–Deligne form of a complex parameter is a Weil–Deligne parameter in the sense of LanglandsParameterStacks:LP1/weil-deligne-parameters with the same Frobenius normalization; the two definitions are compared, not merged.

Discriminating tests:

- `lParameter_trivial` (degenerate): The trivial parameter is tempered but is not discrete for a split group of positive semisimple rank; for a torus the discreteness condition is vacuous.
- `lParameter_principal_discrete` (computation): The principal SL₂ parameter is discrete; erasing SL₂ destroys that property.
- `lParameter_abs_not_tempered` (non-example): The GL₁ character w↦|w| is not tempered, unlike the trivial character.

Uses:

- LL Main Theorem and §3.5: Supply a common parameter convention for GLₙ, PGL₃, PGSp₆ and G₂.
- GS Theorem 15.1(v): State functoriality for nontempered theta lifts without importing downstream G₂ LLC.

Check: Steinberg parameters have nontrivial Deligne SL₂ even when their Weil part is unramified.

Sources:

- LL, §1, p. 2: Gan–Savin define, for a split group, L-parameters as G∨-conjugacy classes of homomorphisms from W\_F × SL₂(ℂ) to the dual group and state the shape of the local Langlands conjecture.
- GS, §3.4, pp. 12–14: GS recalls L-parameters of G₂ as admissible homomorphisms of the Weil–Deligne group to G₂(ℂ) up to conjugacy, together with tempered and discrete parameters and their component groups.

Planet: Complex L-parameters.

### Raw and fixed-split component groups

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/component-groups` (definition).

For a complex parameter φ put Sraw(φ)=π₀Z\_Ĝ(im φ) and Ssplit(φ)=π₀(Z\_Ĝ(im φ)/Z(Ĝ)). Retain the raw group and the map to the quotient. Enhancements for the split form have trivial action on the image of the dual center; a specified inner form instead imposes its Kottwitz central character on the appropriate refined centralizer. For G₂ the center is trivial; for PGSp₆ explicitly divide by Z(Spin₇)=μ₂. This definition fixes bookkeeping, not an unproved parametrization of packets for all groups.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters; ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components.

Proof or construction:

1. Take scheme-theoretic centralizers, then components over C; distinguish quotienting the algebraic group before taking components from an unsupported quotient of finite groups.

API:

- `component_raw_to_split`: The central quotient induces a homomorphism Sraw→Ssplit with its kernel explicitly computed in each use.
- `component_g2`: For G₂ the raw and split component groups agree.
- `component_inner_character`: A raw enhancement descends to the split quotient exactly when it is trivial on the image of the dual center.

Discriminating tests:

- `component_pgl3_principal` (computation): The principal SL₂ in SL₃ has raw centralizer μ₃, while the fixed-split component group is trivial.
- `component_g2_subregular` (computation): The subregular SL₂ in G₂ has component group S₃, with all three irreducible enhancements available.
- `component_pgsp6_principal` (non-example): For the principal parameter in Spin₇, the raw μ₂ disappears in the split quotient; counting two split Steinberg representations is rejected.

Uses:

- LL §§3.5 and 9: Track centralizer maps across exceptional inclusions while separating inner forms.

Check: Do not assign every raw character to a fixed split PGL₃ packet.

Sources:

- LL, Main Theorem (vii), p. 4: Gan–Savin index the fibre of their correspondence for G₂ over a parameter φ by the irreducible characters of the component group of the centralizer of φ in G₂(ℂ), for p ≠ 3 and, for p = 3, outside the parameters coming from discrete parameters of PGL₃.
- GS, §3.4(2), pp. 12–13: GS computes the component group S₃ of the subregular parameter with trivial Weil restriction and lists the three members of its packet.

### The 15-dimensional PGSp₆ Jordan model

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry` (theorem).

Let V=F⁶ with symplectic pairs (1,6),(2,5),(3,4). Put J=∧²V⊗ν⁻¹ with its Pfaffian cubic, unit e=x16+x25+x34, and structure group SL₆/μ₂. The unit stabilizer is PGSp₆. The stabilizers P\_i of standard isotropic i-planes have M₃≅GL₃ via its action on ⟨x12,x13,x23⟩, M₂≅(GL₂×GL₂)/{(z,z⁻¹)}, M₁≅GSp₄, M₁₃≅GL₂×GL₁. Their moduli are |det|², |det α det β|⁵ and |ν|³ respectively.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair.

Proof or construction:

1. Compute the wedge-cubic and unit stabilizers; determine Levi weights on radicals using the actual quotient torus. On V₄ identify the M₂ action as x↦αx βᵗ with multiplier det α det β.

Check: Scalar z on V acts on ∧²V by z² and ν⁻¹ by z⁻², so the action descends to PGSp₆.

Sources:

- GS, §9, pp. 29–31: GS fixes the symplectic basis pairs, realises PGSp₆ inside SL₆/μ₂ as the stabilizer of the unit of the 15-dimensional space of 2-vectors with its trilinear form, identifies the Levi factors of P₃, P₁₃ and P₂ with their actions and records the moduli |det|² and |det(αβ)|⁵. The node uses the ν⁻¹ twist and similitude corrections of packet E10.
- GS, §13.4, p. 44: GS gives the Levi GSp₄ of P₁ with its similitude character and modulus |ν|³.

### The PGSp₆ Weyl chamber

Target: `ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates` (theorem).

On the M₃ torus, simple coroots are (1,t,t⁻¹),(t,t⁻¹,1),(1,t,t). On real characters s=(s₁,s₂,s₃), the third simple reflection is (s₁+s₂+s₃,−s₃,−s₂); the other two permute adjacent coordinates. The invariant quadratic form on characters is Σsᵢ²+(Σsᵢ)². The nine root hyperplanes are sᵢ−sⱼ=0 (i<j), sᵢ+sⱼ=0 (i<j), and sᵢ+Σsⱼ=0 (i=1,2,3); the positive chamber is s₁>s₂>|s₃|.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry.

Proof or construction:

1. Generate all coroots from the three displayed simple coroots under their reflections; distinguish characters from cocharacters and verify the quadratic form by substitution.

Check: Check all nine hyperplanes, including 2s₁+s₂+s₃=0, and invariance under the third reflection.

Source: GS, §9, p. 30. GS gives the three simple coroots on the GL₃ torus, the Weyl action on characters including the non-permutation third reflection, and the positive chamber; its displayed invariant form and root-hyperplane list are corrected in the node (packet E10, checked by applying the third reflection).

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G1: Octonion algebraic comparison and rational descent Discharge the exact supplier contracts and inherited open obligations before closing this stage.

## EX.1. The local inducing data and reducibility tables

Establish the complete rank-one G₂ and PGSp₆ reducibility tables, dominant nontempered normal forms, the specific parameter labels and finite cubic-model theorem used by the theta proofs.

Dependencies: EndoscopicTransferAndUnitaryTraceComparison:ET.6; ExceptionalThetaCorrespondencesForG2:EX.0; ModularityAndLanglandsExtensions:ML.4; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.3; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

### P-series with supercuspidal inducing data

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal` (theorem).

For unitary supercuspidal τ of GL₂ and real s, I\_P(s,τ) reduces precisely when τ≅τ∨ and either ωτ=1, s=±1/2, or ωτ≠1, s=0. At +1/2 there is a nonsplit sequence δP(τ)→I\_P→JP with δP generic discrete series. At 0 the two constituents are a direct sum, exactly one generic.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Compute the normalized rank-one intertwiner and its Plancherel scalar on the two dual-radical representations; identify the generic constituent using Whittaker exactness. Negative points follow by duality.

Check: The negative point −1/2 must not be omitted; a nonselfdual τ has no reducibility point.

Source: GS, Proposition 3.1(i), pp. 8–9. GS lists the reducibility of P-induction from unitary supercuspidal GL₂ data: only for self-dual τ, at s = 1/2 with a nonsplit sequence whose submodule is a generic discrete series when the central character is trivial, and at s = 0 as a generic plus nongeneric sum otherwise. The source omits the point −1/2, which the node includes (packet E2).

### P-series with Steinberg inducing data

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg` (theorem).

For τ=st⊗χ∘det and unitary χ, reducibility occurs only as follows: χ=1 at s=±3/2,±1/2; nontrivial χ²=1 or χ³=1 at s=±1/2. At +3/2 for χ=1 the submodule is St\_G and quotient JP(3/2,st). At +1/2 for χ=1 the length-three series has bottom πgen[1], middle JQ(1/2,st), top JP(1/2,st). For nontrivial quadratic or cubic χ the length-two sequence has bottom generic discrete series πgen[χ] and top JP(1/2,stχ); cubic inversion gives πgen[χ]=πgen[χ⁻¹].

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma.

Proof or construction:

1. Resolve the GL₂ Steinberg segment in its principal series, use induction in stages and compare normalized intertwining operators and Jacquet exponents.

Check: At χ=1,s=1/2 the length is 3, not 2; the cubic DS label is invariant under χ↦χ⁻¹.

Source: GS, Proposition 3.1(ii), p. 9. GS gives the reducibility points and composition series of P-induction from twisted Steinberg data: the Steinberg submodule at 3/2, length three at 1/2 for trivial twist, and generic discrete-series submodules for nontrivial quadratic and cubic twists.

### P-series with one-dimensional inducing data

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters` (theorem).

For unitary χ, I\_P(s,χ∘det) is reducible only at χ=1,s=±3/2,±1/2 and nontrivial χ²=1 or χ³=1,s=±1/2. At +3/2 the sequence is JQ(5/2,st)→I\_P→1. At +1/2 and χ=1 its bottom is πdeg[1], middle JQ(1/2,st), top JQ(1,π(1,1)). For quadratic χ the sequence is JQ(1/2,stχ)→I\_P→JQ(1,π(1,χ)); for cubic χ it is JP(1/2,stχ⁻¹)→I\_P→JQ(1,π(χ,χ⁻¹)). Here π(a,b) denotes normalized GL₂ principal series, and negative parameters are dual statements.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma.

Proof or construction:

1. Use the other constituent of the reducible GL₂ segment, track its Borel support, and move the exponent to the dominant Q chamber.

Check: All the final Q quotients in this node have exponent 1, not 1/2; the cubic middle term is induced from a character, not stχ.

Source: GS, Proposition 3.1(iii), p. 9. GS gives the reducibility of P-induction from characters and the composition series at 3/2 and 1/2. The node uses the corrected quotient exponent 1 and the corrected cubic middle term (packet E2).

### Q-series with supercuspidal inducing data

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal` (theorem).

For unitary supercuspidal τ, I\_Q(s,τ) reduces precisely when τ≅τ∨ and one of: ωτ=1,s=±1/2; ωτ≠1 with im φτ≅S₃,s=±1; ωτ≠1 with im φτ not S₃,s=0. At positive nonzero s it has generic discrete-series submodule δQ(τ) or πgen[τ] respectively, and Langlands quotient JQ. At 0 it is the direct sum of generic and nongeneric irreducibles.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Evaluate the standard and symmetric-cube factors in the dual Q radical, distinguish the S₃ dihedral parameter, and apply the rank-one reducibility criterion.

Check: The S₃ point is 1, unlike the determinant-trivial point 1/2.

Source: GS, Proposition 3.2(i), pp. 10–11. GS lists the reducibility of Q-induction from unitary supercuspidal data: ±1/2 for trivial central character, ±1 when the parameter has image S₃, and 0 otherwise for self-dual τ, with generic discrete-series submodules at the nonzero points.

### Q-series with Steinberg or character data

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments` (theorem).

For stχ, reducibility occurs at χ=1,s=±5/2,±1/2 and nontrivial quadratic χ,s=±1/2. At χ=1,+5/2 the bottom is St\_G; at +1/2 the bottom is πgen[1]⊕πdeg[1] and top JQ(1/2,st). For quadratic χ the bottom is πgen[χ] and top JQ(1/2,stχ). For χ∘det the same χ,s list applies: at χ=1,+5/2 the sequence is JP(3/2,st)→I\_Q→1; at χ=1,+1/2 the length-three bottom, middle and top are JQ(1/2,st), JP(1/2,st), JQ(1,π(1,1)); for quadratic χ the sequence is JP(1/2,stχ)→I\_Q→JQ(1,π(1,χ)).

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma.

Proof or construction:

1. Compare Borel induction in stages through P and Q and use the segment resolution; determine submodule versus quotient using positive normalized exponents.

Check: The Q-induced st at 1/2 has two discrete-series submodules; its character-induced counterpart does not.

Source: GS, Proposition 3.2(ii)–(iii), pp. 10–11. GS gives the composition series of Q-induction from twisted Steinberg and from characters, including the two discrete-series submodules at 1/2 for the Steinberg case and the length-three series for the trivial character; the node uses the corrected quotient exponent for quadratic χ (packet E2).

### Borel series and opposite embeddings

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel` (theorem).

Write χᵢ for the character values on the three long coroots with χ₁χ₂χ₃=1. Borel induction is irreducible unless some χᵢ=|·|^±1, some χᵢ/χⱼ=|·|^±1, or χ₁,χ₂,χ₃ are the three distinct nontrivial quadratics. In the last case it is generic⊕nongeneric. A Langlands quotient attached to exponents s₁≥s₂≥0 embeds in the opposite principal series; if χ₁=χ₂ and s₁=s₂+1≥1 its smaller P embedding is I\_P(−s₁+1/2,χ₁⁻¹).

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. Use the coroot criterion and the rank-two R-group; take the contragredient of the defining Langlands quotient and the one-dimensional GL₂ submodule in the exceptional embedding.

Check: The exceptional quadratic triple splits; the formula contains s₁, not an unbound s.

Source: GS, §3.3 and Proposition 3.3, p. 11. GS embeds a Borel Langlands quotient into the opposite principal series, identifies the exceptional P-embedding when the two exponents differ by one, and states the irreducibility criterion for Borel induction in terms of the three long-coroot characters, with the generic plus nongeneric splitting for three distinct quadratic characters. The node uses s₁ in the exceptional embedding (packet E2).

### Nontempered G₂ normal forms

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-nontempered-normal-forms` (theorem).

Every nontempered irreducible G₂ representation is uniquely a standard quotient of one of three disjoint normalized families: JQ(τ), with τ a positive unramified twist of tempered GL₂; JP(τ) with the same condition; or JP(τ) where τ is the GL₂ quotient of χ₁×χ₂, |χᵢ|=|·|^sᵢ and s₁>s₂>0. The first two families have positive central real exponent; the third uses the stated strictly ordered Borel chamber.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. Specialize the general Langlands classification to the two maximal parabolics and Borel; translate Borel dominance through the chosen torus coordinates.

Check: Boundary s₂=0 belongs to a tempered-Levi family, not the third family.

Source: GS, §13.2, pp. 41–42. GS enumerates the irreducible nontempered representations of G₂ as the unique quotients of three families of induced representations: from Q and from P with positive twists of tempered GL₂ data, and from P with the quotient of a strictly ordered pair of characters.

Planet: G₂ Langlands normal forms.

### Unipotent depth-zero supercuspidals

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent` (theorem).

Construct the G₂ depth-zero supercuspidals denoted πsc[1], πsc[ω], πsc[ω²] from cuspidal unipotent representations of the reductive quotient at a hyperspecial vertex and compact induction. Identify their Hecke eigenvalues and distinguish the three labels; the two nontrivial cubic labels are an unordered pair until an eigenvalue convention is chosen. Supply the exceptional finite-field character calculations needed to connect these labels with the subregular packet.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Use the parahoric quotient and cuspidal type criterion, compute the three unipotent cuspidal characters, and lift their matrix coefficients. Residue-characteristic restrictions of any finite-field calculation must be checked individually.

Check: Do not identify πsc[1] with the two nontrivial-cubic lifts or silently choose an ordering of ω,ω².

Source: GS, §3.4(2), pp. 12–13; Proposition 7.1(iii), p. 23. GS describes π\_sc[1], π\_sc[ω] and π\_sc[ω²] as depth-zero supercuspidals induced from cuspidal unipotent representations of G₂(F\_q) inflated to a hyperspecial subgroup, and Proposition 7.1(iii) identifies the lifts of the nontrivial unramified cubic characters with the latter two. The node keeps the two cubic labels unordered (packet E9).

### The parameter labels needed by theta

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/partial-g2-packets` (theorem).

Record only the established labels used here: Levi parameters for noncuspidal series; nondiscrete tempered packets of size one or two with unique generic member; principal-SL₂ Steinberg; subregular component group S₃ with πgen[1],πdeg[1],πsc[1]; and the quadratic/cubic or dihedral labels of the reducibility nodes. A discrete parameter trivial on the Deligne SL₂ has only supercuspidal members. The completed bijection and all endoscopic identities for G₂ belong to LocalLanglandsCorrespondenceForG2, which consumes this roadmap and is never an input.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters; ExceptionalThetaCorrespondencesForG2:EX.0/component-groups; ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings; ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments; ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Compare the long/short-root centralizers with the explicitly constructed representations and the GL₂/GL₃ parameter maps; distinguish desiderata of a full LLC from identities actually used by the theta calculations.

Check: A conjectural full G₂ LLC is not used to prove its own theta input.

Source: GS, §3.4, pp. 12–14. GS explains how the local Langlands correspondences of the Levi factors assign parameters to nontempered and to tempered non-discrete representations, notes that the tempered packets have size one or two with a unique generic member, and lists the non-supercuspidal members of the discrete packets by the image of SL₂.

### Finite cubic models for nongeneric G₂

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness` (theorem).

If π is irreducible, infinite-dimensional and nongeneric, W\_E(π) is finite-dimensional for every cubic étale E and nonzero for at least one E. No such nonzero assertion is made for the trivial representation. The proof must include the nilpotent-wavefront reduction to the subregular orbit and the p-adic local character-expansion/degenerate-Whittaker comparison, including residual characteristic 2 and 3.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/cubic-characters; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. For nongeneric infinite-dimensional G₂ representations, eliminate the regular wavefront orbit, show the maximal remaining orbit is subregular, and apply the multiplicity comparison to its rational cubic forms.

Check: The trivial representation is an excluded degenerate case; finite dimension is required before comparing period dimensions.

Source: GS, Lemma 3.4 and proof, p. 14. GS states that a nongeneric infinite-dimensional irreducible representation has a nonzero, and always finite-dimensional, twisted Jacquet module along N for some cubic étale E, deducing it from the subregular support of the wave-front set and the results of Mœglin–Waldspurger and of Varma in residue characteristic 2, which it cites.

Planet: Finite cubic models.

### PGSp₆ P₂ and P₁₃ series

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13` (theorem).

For unitary supercuspidal τ of GL₂, I₂(s,τ⊗τ) has the same reducibility cases as I\_Q(s,τ): determinant-trivial at ±1/2 with generic DS δ₂(τ), S₃ dihedral at ±1 with generic DS σgen[τ], and other selfdual determinant-nontrivial at 0 with generic⊕nongeneric splitting. For τ=stχ, I₂ reduces only for χ=1 at ±5/2,±1/2 and nontrivial quadratic χ at ±1/2. At +5/2 the bottom is St\_H; at χ=1,+1/2 it is I₃(St)gen; at quadratic χ,+1/2 it is DS σgen[χ], always with standard quotient on top. I₁₃(s,τ⊗1) for supercuspidal τ reduces only for selfdual τ with ωτ=1,s=±1/2 (length four, unique generic DS submodule δ₁₃(τ)), or ωτ≠1,im φτ≠S₃,s=0 (two summands).

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Calculate the dual radical factors and rank-one intertwining scalars; resolve the Steinberg segment and compare Jacquet exponents. Keep the anti-diagonal central quotient on M₂ explicit.

Check: Length four at I₁₃(1/2,τ⊗1) is not replaced by a length-two sequence.

Source: GS, Propositions 10.1–10.2, pp. 31–32. GS gives the reducibility points and constituents of P₂-induction from τ⊗τ (supercuspidal and Steinberg τ) and of P₁₃-induction from τ⊗1 for supercuspidal τ, with the discrete-series constituents δ₂(τ), σ\_gen[τ], σ\_gen[χ] and δ₁₃(τ).

### Siegel induction on PGSp₆

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p3` (theorem).

For a GL₃ discrete-series τ with trivial central character, I₃(τ)=I₃(τ∨) is irreducible if τ is not selfdual; for selfdual τ it is the direct sum of generic and nongeneric tempered irreducibles. For GL₃ Borel series χ₁×χ₂×χ₃ with product 1 the irreducibility exceptions are χᵢ=|·|^±1 or χᵢ/χⱼ=|·|^±1 and the distinct nontrivial quadratic triple, in which last case I₃ is generic⊕nongeneric.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Compute the Siegel R-group and normalized intertwiners; compare Tadić’s classification with the GL₃/μ₂ coordinate convention.

Check: Selfdual discrete-series induction splits even though nonselfdual induction is irreducible.

Source: GS, Proposition 10.3, pp. 32–33. GS states that Siegel induction from a discrete-series GL₃ representation with trivial central character is irreducible unless τ is self-dual, when it splits as a generic plus a nongeneric summand, and gives the corresponding statements for Borel data.

### P₁ reducibility including the nongeneric SK case

Target: `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1` (theorem).

Let τ be a supercuspidal representation of GSp₄ with trivial central character and parameter whose 5-dimensional standard composition contains 1. Then I₁(s,τ) reduces exactly at real s=±1/2 and at +1/2 has DS submodule δ₁(τ) and Langlands quotient J₁(1/2,τ). Prove this first for generic τ, then prove it for the nongeneric Saito–Kurokawa τρ used in EX.8. The latter is a separate obligation: Shahidi’s generic theorem alone does not imply it.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; ModularityAndLanglandsExtensions:ML.4; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. For generic τ compute the rank-one Plancherel measure of I₁(s, τ) from the standard and twisted factors of its parameter and apply the Harish-Chandra–Silberger criterion for reducibility of rank-one supercuspidal induction.
2. For the nongeneric τ\_ρ use part (vi) of the Gan–Takeda correspondence (ModularityAndLanglandsExtensions §3.5): the Plancherel measures of a nongeneric supercuspidal agree with those attached to its parameter, hence with those of the generic member of its packet; the same criterion then gives reducibility exactly at ±1/2. Shahidi’s generic local-coefficient theorem is not applied to τ\_ρ directly.
3. Apply the square-integrability criterion to the submodule at +1/2.

Check: A proof accepting nongeneric τ directly into Shahidi’s generic local coefficient is rejected; the Plancherel comparison of Gan–Takeda (vi) is the route.

Source: GS, Proposition 10.4, p. 33; Proposition 15.6 and proof, pp. 54–55. GS states that P₁-induction from a supercuspidal GSp₄ representation whose standard parameter contains 1 reduces exactly at ±1/2, with a discrete-series submodule δ₁(τ), and applies this to the nongeneric τ\_ρ in Proposition 15.6. The node separates the nongeneric case, which GS justifies by generic reducibility theory (packet E11).

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G3: Residual-characteristic wavefront argument ExceptionalThetaCorrespondencesForG2/G4: Rank-one reducibility source chain ExceptionalThetaCorrespondencesForG2/G5: Finite-field cuspidal labels and examples Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0 Requests to the undesigned Part II of SmoothRepresentationsOfLocalGroups (Whittaker multiplicity one for quasi-split groups, Mœglin–Waldspurger comparison, Harish-Chandra–Silberger criterion).

## EX.2. Exceptional ambient groups and minimal models

Specialize existing exceptional algebraic constructions to the cubic Jordan family, integrate and descend the three dual pairs and triality square, construct the minimal representations and fix the outer extension and theta dual conventions.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.3; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈.

### Freudenthal–Jordan exceptional data

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal` (construction).

For J = F, a cubic étale algebra E, the Jordan algebra D⁺ of a degree-three central simple algebra D (or its split form M₃(F)⁺), or the 15-dimensional algebra H₃(B) of Hermitian 3 × 3 matrices over a quaternion algebra B, equip J with its cubic norm, adjoint and trace form; these cubic norm structures are constructed here. Form g\_J = sl₃ ⊕ Lie(M\_J) ⊕ (F³ ⊗ J) ⊕ (F³ ⊗ J)\* with the Freudenthal bracket, and identify its type as G₂, D₄, E₆ or E₇ for dim J = 1, 3, 9, 15, compatibly with the split exceptional Lie algebras of LieHighestWeight Layer 8; the embedded g₂ is sl₃ ⊕ (F³ ⊗ 1\_J) ⊕ (F³ ⊗ 1\_J)\*.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

Proof or construction:

1. Construct the cubic norm, adjoint and trace of each J from the norm of E, the reduced norm of D and the quaternion norm of B, and check the Jordan adjoint identities.
2. Define the bracket on g\_J, verify the Jacobi identity from those identities, and compare root systems and dimensions with the LieHighestWeight Layer 8 models after extending scalars to an algebraic closure.

API:

- `freudenthal_type`: Dimensions 1,3,9,15 yield the stated four absolute types.
- `freudenthal_unit_g2`: The summands sl₃,(F³⊗1\_J),(F³⊗1\_J)\* give the already fixed g₂ embedding.
- `freudenthal_baseChange`: Jordan isomorphisms and scalar extension transport the Lie bracket and both commuting factors.

Discriminating tests:

- `freudenthal_dim_one` (degenerate): J=F yields g₂ of dimension 14, with trivial connected HJ.
- `freudenthal_matrix` (computation): J=M₃(F)⁺ gives split E₆ and connected automorphism factor PGL₃.
- `freudenthal_dim_fifteen` (computation): J=Herm₃(Bsplit) yields E₇ and HJ=PGSp₆, not a 27-dimensional Albert module.

Uses:

- GS §4 and §13: Produce the exceptional dual pairs and weight gradings for their Jacquet computations.

Check: An arbitrary cubic polynomial without the Jordan adjoint identities is not admissible input.

Source: GS, §§4.1–4.2, pp. 15–16. GS attaches to a Freudenthal–Jordan algebra J the Lie algebra sl₃ ⊕ Lie(M\_J) ⊕ (F³⊗J) ⊕ (F³⊗J)\* of type G₂, D₄, E₆ or E₇ for dim J = 1, 3, 9, 15, describes J in each case (cubic étale, 9-dimensional from a central simple algebra with involution of the second kind, Hermitian 3×3 matrices over a quaternion algebra), and identifies the centralizer of Aut(J) with the J = F algebra g₂ (with the dual summand of packet E3).

Planet: Freudenthal–Jordan dual pairs.

### The three exceptional group dual pairs

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs` (theorem).

Integrate the commuting Lie embeddings to G₂×HJ in the adjoint group GJ, and identify their mutual centralizers. For J=D⁺, HJ(F)=PD×; for J=M₃⁺, HJ=PGL₃⋊C₂ in E₆⋊C₂; for the 15-dimensional J, HJ=PGSp₆ in E₇. Construct the E₆ form attached to either cubic division algebra and the chosen split G₂ subgroup. Group embeddings and central quotients are part of this target, not consequences assumed from a Lie inclusion alone.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal; ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components.

Proof or construction:

1. Use root group integration, Jordan descent and the lattice maps of the adjoint forms; verify centralizers after algebraic closure and descend them.

Check: For a division D, an outer automorphism of geometric E₆ does not automatically provide an F-rational outer automorphism of D.

Source: GS, §§4.2–4.4, pp. 15–16. GS forms the dual pairs G₂ × Aut(J) in Aut(G\_J), notes the disconnected Aut(J) when dim J = 9, and tabulates H\_J = PD×, PGL₃ ⋊ Z/2Z and PGSp₆ for the three J used.

### Cubic triality and the exceptional see-saw

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw` (theorem).

A cubic étale E with its permutation Galois action on three embeddings defines the trialitarian Spin₈^E. For an embedding i:E→J construct HJ,E=Aut(i) and the commuting pair HJ,E×Spin₈^E inside GJ. Identify HJ,E as PE× for division D, PE×⋊C₂ for M₃, and the algebraic quotient Res\_E/F SL₂/μ₂ for J of dimension 15. The resulting square with G₂×HJ gives the see-saw on the same minimal representation. Do not replace rational points of a central quotient by a quotient of rational points without checking its H¹ obstruction.

Hypotheses: The algebraic construction is over a characteristic-zero field unless a complex dual group is specified; orbit statements use the split octonion algebra. Local absolute values and smooth modules refer to the fixed p-adic convention.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components.

Proof or construction:

1. Descend the pinned D₄ triality action along the étale S₃ torsor; compute centralizers of E and match the two restrictions of GJ.

Check: For E=F³ recover split Spin₈; for E a cubic field the division centralizer is the anisotropic torus PE×.

Source: GS, §§4.3–4.4 and diagram (4.1), p. 16. GS fixes an embedding of a cubic étale algebra E in J, forms Aut(i: E → J) commuting with the quasi-split Spin₈ attached to E, draws the see-saw with G₂ × Aut(J), and tabulates the groups H\_{J,E} for the three J. The node uses Spin₈^E for the misprinted group symbol (packet E3).

Planet: The triality see-saw.

### Local minimal representations

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models` (construction).

Construct the nonzero irreducible unitarizable minimal representations ΠJ of the required split D/E groups and E₆^D forms, with their chosen central character. For split simply-laced groups select the spherical representation with the subregular-dual Satake parameter and prove its minimality; for E₆^D construct the smooth model of Savin §3. Supply Schrödinger/rank-one models, the exact evaluation-at-zero sequence and ambient-radical Jacquet action needed below. Existence, irreducibility, unitarity and model comparison are proof targets, not axioms on a user-supplied representation.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered.

Proof or construction:

1. Build each smooth model and its intertwining operators from the highest-weight orbit; prove the Weyl relations, irreducibility and the unitary completion, then compare normalized Jacquet exponents.

API:

- `minimal_model_equiv`: The induced/orbit and Schrödinger models identify as smooth representations with the stated central character.
- `minimal_radical_sequence`: Evaluation at zero gives the exact sequence whose kernel is the compact-function highest-weight orbit model.
- `minimal_unitary_dual`: Complex conjugation identifies ΠJ with its smooth contragredient under the chosen invariant Hermitian structure.

Discriminating tests:

- `minimal_spherical_line` (characterisation): For split E₆/E₇ the chosen hyperspecial fixed line is one-dimensional with the specified Satake parameter.
- `minimal_division_not_split` (non-example): The E₆^D model has no isotropic nilpotent vectors coming from D; its G₂ Jacquet modules differ from split E₆.
- `minimal_evaluation_zero_ne` (non-example): The evaluation-at-zero quotient is nonzero, so replacing the model by only its open-orbit compact functions fails.

Uses:

- All local Howe targets: Theta modules are restrictions of this actual representation.
- EX.3 and EX.7: Orbit kernels and twisted coefficients require compatible concrete realizations.

Check: The model is a constructed representation, rather than an arbitrary representation declared to satisfy desired Jacquet formulas.

Sources:

- GS, §1, p. 1; §§4–5, pp. 15–17: GS restricts the minimal representation of the adjoint exceptional group (cited from Gan–Savin 2005) to the three dual pairs and uses its Jacquet modules throughout.
- Sav, §3, pp. 396–397 (Theorem 3.4): Savin constructs the minimal representation of the E₆ form attached to a cubic division algebra and records, after Rumelhart, that it is minimal.
- GS04, §5, pp. 797–798: Gan–Savin 2004 recall the minimal representation of split E₆ used for the pair PGL₃ × G₂.
- MS, Theorem 1.1, pp. 3–4: Magaard–Savin give, for the minimal representation of a group of type D, E₆ or E₇ and a maximal parabolic with commutative unipotent radical N, an exact sequence with the compactly supported functions on the open orbit as submodule and the N-coinvariants, a twisted minimal representation of the Levi plus a character, as quotient.

Planet: Minimal representations.

### Exceptional big and small theta modules

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules` (construction).

Specialize the imported commuting-action theta construction to ΠJ. For irreducible π of G₂, the maximal π-isotypic quotient is π⊗ΘJ(π), equivalently the appropriate smooth coinvariant model with π∨; use the same convention for HJ input. Define θJ(π) as the maximal semisimple quotient only once finite length is proved. Use full algebraic duals in Hom descriptions and smooth contragredients only where admissibility justifies them.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; MetaplecticAutomorphicForms:MP.3/big-theta-module; MetaplecticAutomorphicForms:MP.3/small-theta-module; ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw.

Proof or construction:

1. Apply the universal isotypic quotient to the commuting exceptional actions and prove the exceptional see-saw by the two Hom adjunctions on ΠJ; no classical oscillator Howe theorem is asserted for this restriction.

API:

- `exceptionalTheta_hom`: Hom\_H(ΘJ(π),τ) identifies with Hom\_G×H(ΠJ,π⊗τ) for irreducible admissible π,τ with the fixed dual convention.
- `exceptionalTheta_seesaw`: The triality square identifies HJ,E-periods on ΘJ(π) with Hom\_G₂(RJ(E),π∨), with both duals recorded.
- `exceptionalTheta_conjugate`: Unitarity gives conjugation compatibility; for tempered irreducibles conjugation is smooth contragredience.

Discriminating tests:

- `exceptionalTheta_zero` (degenerate): If Hom\_G×H(ΠJ,π⊗τ)=0 for every τ, no nonzero finite-length small lift can be assigned.
- `exceptionalTheta_trivial_hj` (degenerate): For J=F, specializing the construction recovers restriction to G₂ rather than a classical symplectic oscillator.
- `exceptionalTheta_dual_character` (non-example): Twisted ψE coefficients of a contragredient use conjugate ψE; replacing ψE by itself without transport fails for general ψ.

Uses:

- GS Theorems 1.1–1.3: State finite length, multiplicity one and the theta injections.
- GS Lemmas 6.4 and 12.1: Relate successive period spaces on both sides.

Check: A nonzero big module need not be declared irreducible before the finite-length and uniqueness targets.

Source: GS, §1, p. 1; §5.1, p. 16; §6.4, pp. 20–21. GS writes the maximal π-isotypic quotient of the minimal representation as π ⊗ Θ(π), takes θ(π) as its cosocle, states the see-saw identity between H\_{J,E}-periods of Θ(π) and Hom\_{G₂}(R\_J(E), π), and uses complex conjugation of the real-defined minimal representation to compare Θ of conjugate and contragredient representations.

Planet: Exceptional theta modules.

### The spherical extension across the E₆ involution

Target: `ExceptionalThetaCorrespondencesForG2:EX.2/e6-outer-extension` (theorem).

Extend the split E₆ minimal representation to E₆⋊C₂ by requiring the pinned involution to fix its spherical vector. On PGL₃ the involution is g↦w₀(gᵗ)⁻¹w₀⁻¹ with antidiagonal entries (1,−1,1); it fixes G₂ pointwise. Prove its square is 1 on Π and compatibility with the orbit model, not only invariance of its isomorphism class.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs.

Proof or construction:

1. Normalize the intertwiner by the spherical vector and then evaluate it on the explicit model to determine the stabilizer characters on coefficient orbits.

Check: Changing the extension by the sign character interchanges plus/minus labels and is detected by the Whittaker coefficient.

Source: GS, §8 introduction and §8.1, p. 24. GS extends the split E₆ minimal representation to E₆ ⋊ Z/2Z so that Z/2Z fixes the spherical vector, and realises the outer involution on GL₃ as transpose-inverse conjugated by the antidiagonal matrix with entries 1, −1, 1.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G1: Octonion algebraic comparison and rational descent ExceptionalThetaCorrespondencesForG2/G2: Primary minimal-model inputs not obtained Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0

## EX.3. Raw exceptional Jacquet modules and positive exponents

Compute every raw E₆/E₇ maximal-parabolic filtration by orbit stabilizers and density characters; determine forward and all seven reverse nontempered chamber cases before using any Howe theorem.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.1; ExceptionalThetaCorrespondencesForG2:EX.2; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.2a; SmoothRepresentationsOfLocalGroups:SR.3; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations.

### Ambient E₆/E₇ gradings

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics` (theorem).

The two fundamental G₂ cocharacters define E₇ parabolics with derived Levi types D₆ and A₁A₅. The three PGSp₆ cocharacters define ambient derived Levi types E₆,D₆,A₁D₅ for P₃,P₁,P₂ respectively. Construct their intersections with both dual-pair factors, opposite radicals, central characters and projections Π\_Nsmall→Π\_𝒩ambient. In every top-piece formula it is the ambient-radical quotient Π\_𝒩 that occurs, not a second copy of the small-radical quotient.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly.

Proof or construction:

1. Compute all weights of the Freudenthal bracket under each cocharacter and group the positive weights; compare the zero-weight subgroup and its central lattice.

Check: Verify the five derived Levi types and the inclusions of small radicals into ambient radicals.

Source: GS, §13.1, p. 40; §13.4, p. 43. GS obtains parabolics of E₇ from the fundamental cocharacters of G₂ with Levi types D₆ and A₁ × A₅, and from those of PGSp₆ maximal parabolics with Levi types D₆, A₁ × D₅ and E₆.

Planet: Exceptional Jacquet gradings.

### Rank-one and rank-two octonion orbit kernels

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels` (theorem).

Identify the kernels of the small-to-ambient Jacquet projections with compact-function modules on highest-weight orbit intersections. For P₁ the null octonion quadruples x,x′,y,y′ satisfy all pairwise products zero and x∧x′+y∧y′=0, giving strata of span dimension 1 and 2. For P₂ impose dependent spinor columns as well as trace zero, then compute the two span strata. Determine stabilizers and modular-density actions separately on each stratum; no single unknown character is assumed to normalize both.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction; tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations.

Proof or construction:

1. Use the half-spin highest-weight equations and the null-space classification. Compute the tangent action on each stabilizer quotient to determine its density character before applying normalized induction.

Check: The split P₂ calculation contains an extra middle piece; omitting it gives the nonsplit answer.

Source: GS, §13.4, Cases P₁ and P₂, pp. 44–47. GS describes the kernel of the projection to the ambient Jacquet module by null octonion quadruples with x ∧ x′ + y ∧ y′ = 0, splits them by span dimension, and for P₂ introduces an undetermined twist δ′; the node computes each stratum separately (packet E15).

### Raw E₆ Jacquet input and noncuspidal finiteness

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness` (theorem).

Construct the two outer-related PGL₃ maximal-parabolic Jacquet filtrations of Π\_E6 with bottom regular GL₂ piece, middle regular GL₁ piece, and top D₅-minimal plus trivial pieces, and the G₂-P filtration with two GL₂ regular pieces, a GL₁ piece and A₅-minimal plus trivial top. In GS04 notation P₂=our P and P₁=our Q; retain its normalized determinant factors. Deduce finite length of the noncuspidal part of every theta lift in either direction without invoking full E₆ Howe duality.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.2/e6-outer-extension; ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma; SmoothRepresentationsOfLocalGroups:SR.3/isotypic-quotient-regular; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

Proof or construction:

1. For PGL₃→G₂, normalize the bottom and middle terms by |det|^(3/2), the top by |det|^(1/2)Π\_D5⊕|det|^(3/2). For G₂-P, use |det|^(1/2) on both regular strata and Π\_A5⊕|det|^(1/2) on top.
2. Apply second adjointness to finite-length Jacquet modules, regular-isotypic quotients and finite-length parabolic induction; retain the torus characters of every boundary stratum.

Check: Noncuspidal finiteness is available before the uniqueness proof, rather than inferred from that proof.

Sources:

- GS04, Propositions 4–6, pp. 798–799: Gan–Savin 2004 give three-step filtrations of the Jacquet modules of the split E₆ minimal representation along a maximal parabolic of PGL₃ (Proposition 4) and along the parabolic of G₂ stabilizing a 2-dimensional null subalgebra (Proposition 6), with their minimal, trivial and regular pieces and determinant twists; Proposition 5 describes a quotient of the Jacquet module along the Borel of PGL₃.
- GS, Lemma 6.2 and proof, p. 19: GS deduces from these computations, citing Gan–Savin 2004 for the split E₆ case, that the noncuspidal part of each big theta lift has finite length.

### The G₂-P Jacquet filtration

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-p-jacquet` (theorem).

The normalized rP(Π\_E7) has three graded pieces, from top to bottom: |det|^(1/2)Π\_D6⊕|det|^(3/2)1; Ind\_(Bbar×P₂)^(GL₂×H)(δ⊗Cc(GL₁)), δ=|·|^(−1/2)×|·|; and Ind\_P₁₃^H Cc(GL₂). The central GL₂ acts trivially on the untwisted minimal/trivial top factors. Regular GL₂ spaces have left translation by the G₂ Levi and right translation by the partner Levi; GL₁ uses determinant on the G₂ factor and the indicated (1,1) entry on a lower Borel. All inductions in these filtrations are normalized.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Apply the ambient D₆ evaluation sequence, intersect the highest-weight orbit with trace-zero octonions, then compute stabilizers and all half-modulus corrections.

Check: The top uses Π\_𝒩ambient; scalar z in M acts on N/[N,N] by z.

Source: GS, Proposition 13.1, p. 40. GS states, after Magaard–Savin, the three-step filtration of the normalized P-Jacquet module of the E₇ minimal representation: the twisted D₆-minimal and trivial top, the middle induced from the lower Borel with the displayed character, and the bottom induced from P₁₃.

### The G₂-Q Jacquet filtration

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-q-jacquet` (theorem).

The normalized rQ(Π\_E7) has top |det|^(3/2)Π\_A5⊕|det|²Π\_A1; middle Ind\_(Bbar×P₂)^(GL₂×H)(δ⊗Cc(GL₁)) with δ=|·|^(1/2)×|·|; bottom Ind\_P₂^H W, where W is the imported GL₂×GSO₄ similitude Weil representation. Top factors are trivial on the central GL₂ before twisting. Regular GL₂ spaces have left translation by the G₂ Levi and right translation by the partner Levi; GL₁ uses determinant on the G₂ factor and the indicated (1,1) entry on a lower Borel. All inductions in these filtrations are normalized.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; MetaplecticAutomorphicForms:MP.3/similitude-theta-howe; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module.

Proof or construction:

1. Compute the split highest-weight orbits directly, not by citing the nonsplit calculation as identical.
2. Determine the middle twist from stabilizer densities; verify it against generic-character induction using only the bottom Weil quotient, independently of the final nontempered lift theorem.

Check: The middle exponents are 1/2 and 1; the comparison must not depend on the theorem it is used to prove.

Source: GS, Proposition 13.3 and proof, p. 41. GS states the three-step filtration of the normalized Q-Jacquet module, with A₅-minimal and A₁ principal-series top, the middle with the displayed lower-Borel character and the bottom induced from P₂ of the GL₂ × GSO₄ similitude Weil representation, and determines the middle character by an exercise (packet E15 for the missing orbit calculation).

### The PGSp₆-P₃ Jacquet filtration

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet` (theorem).

The normalized rP₃(Π\_E7), as G₂×GL₃ module, has top Π\_E6⊕|det|1, middle Ind\_(Q×Q₁)^(G₂×GL₃)(δ⊗Cc(GL₁)), δ(g₁,g₂)=|g₁|^(−1/2)|det g₂|^(1/2), and bottom Ind\_(P×Q₂)^(G₂×GL₃) Cc(GL₂). Here Qᵢ are the row-subspace stabilizers in GL₃, with Levi factor GLᵢ acting by right translation on Cc(GLᵢ).

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Use the E₆ ambient-radical quotient and classify rank-one/rank-two pairs of trace-zero octonions. Compute the row-stabilizer moduli and subtract δP₃^(1/2).

Check: The quotient is the full E₆ minimal representation on the top; the middle and bottom pieces remain present.

Source: GS, Proposition 13.5, pp. 43–44. GS gives the filtration of the P₃-Jacquet module as a G₂ × GL₃-module: E₆-minimal plus twisted trivial top, a middle piece induced from Q × Q₁ with the displayed character, and a bottom piece induced from P × Q₂.

### The PGSp₆-P₁ Jacquet filtration

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet` (theorem).

The normalized rP₁(Π\_E7), as G₂×GSp₄ module, has top |ν|^(1/2)Π\_D6⊕|ν|^(3/2)1, middle Ind\_(Q×Q₁)(δ⊗Cc(GL₁)) with δ(g₁,g₂)=|g₁|^(−1/2)|det g₂|^(1/2), and bottom Ind\_(P×Q₂) Cc(GL₂). On the row-stabilizer Levis of GSp₄, Q₁ has coordinates (g₁,g₂)∈GL₁×GL₂ with ν=det g₂ and δQ₁=|g₁|^(−4)|det g₂|²; Q₂ has (g₂,g₁) with ν=g₁ and δQ₂=|det g₂|^(−3)|g₁|³.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. For each of the two null-quadruple strata compute an explicit orbit representative, stabilizer and density; induce its compact functions and normalize. This supplies the proof omitted by the source.

Check: Check ν on both row Levis: it is not the GL₁ coordinate in the Q₁ convention.

Source: GS, Proposition 13.6 and the preceding Case P₁, pp. 44–45. GS gives the three-step filtration of the P₁-Jacquet module as a G₂ × GSp₄-module with the row-stabilizer moduli δ\_{Q₁} and δ\_{Q₂}, noting that the computation is not in the literature (packet E15).

### The PGSp₆-P₂ Jacquet filtration

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p2-jacquet` (theorem).

The normalized rP₂(Π\_E7), as G₂×M₂ module, has four pieces from top down: |det|^(1/2)Π\_D5⊕|det|^(3/2)Π\_A1; Ind\_(Q×(Bbar×Bbar)/Gm)(δ⊗Cc(GL₁)), where δ on each Bbar is |·|^(1/2)×|·|; Ind\_(P×Bbar₂) Cc(GL₂), where GL₂,1 acts by right regular translation and Bbar₂ by right scalar (1,1)-translation; and Ind\_Q^G₂ W. In the top each semisimple factor acts trivially on the other factor’s summand.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; MetaplecticAutomorphicForms:MP.3/similitude-theta-howe; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module.

Proof or construction:

1. Compute dependent highest-weight spinor columns and both null-span strata.
2. Use separate orbit-density calculations for pieces two and three; derive their twists rather than assume the displayed uniform δ′ action is correct. Confirm the anti-diagonal center acts trivially.

Check: The Bbar in piece three belongs to the second GL₂ factor, a distinction essential in the reverse exponent calculation.

Source: GS, Proposition 13.7 and notes, pp. 46–47. GS gives the four-piece filtration of the P₂-Jacquet module as a G₂ × M₂-module, with D₅-minimal and A₁ top, two regular middle pieces and the Weil-representation bottom; the node derives the twists of the middle pieces separately and places the lower Borel of piece three in the second GL₂ factor (packet E15, E16).

Planet: Exceptional Jacquet filtrations.

### Forward positive-exponent lift control

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward` (theorem).

For π=JQ(τ) in EX.1, Θ\_H(π) is a nonzero quotient of I₂(τ⊗τ). For π=JP(τ) in either P family, it is a nonzero quotient of I₁₃(τ⊗1). These statements concern full big modules. Prove their nonvanishing from the appropriate bottom piece and the induced-module universal property.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-nontempered-normal-forms; ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-p-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-q-jacquet; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.3/isotypic-quotient-regular; MetaplecticAutomorphicForms:MP.3/gl2-gso4-theta; SmoothRepresentationsOfLocalGroups:SR.2a.

Proof or construction:

1. Use positive central exponents to kill all unwanted graded pieces, including Ext¹ obstructions, with second adjointness.
2. For the Weil piece import the exact GL₂–GSO₄ big theta computation. Commute maximal isotypic quotient with normalized parabolic induction by GG Lemma 9.4 (second adjointness), not by the compact-induction lemma requiring Ext¹(τ,τ)=0.

Check: Do not apply a semisimplicity argument to arbitrary GL₂ isotypic quotients.

Source: GS, Lemma 13.4 and proof, pp. 42–43; Theorem 14.1(a)–(b), p. 48. GS shows that for nontempered π contained in I\_Q(τ∨) or I\_P(τ∨) the big lift is a quotient of I₂(τ⊗τ) or I₁₃(τ⊗1), and Theorem 14.1 records the nonvanishing of these big lifts.

### All reverse Langlands-chamber cases

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse` (theorem).

For a nontempered σ of H, Θ\_G₂(σ)=0 unless σ is J₂(τ⊗τ) or J₁₃(τ⊗1) attached to the EX.1 families. In these cases Θ\_G₂(σ) is a nonzero quotient of IQ(τ) or IP(τ), respectively. Prove this for all seven proper standard Levi types P₁,P₂,P₃,P₁₂,P₁₃,P₂₃,P₁₂₃, with strictly positive real Langlands exponents and the actual M₂ coordinate order.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p2-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma.

Proof or construction:

1. Write the full exponent table for every standard Levi using s₁>s₂>|s₃| and its boundary chambers.
2. In the P₂ case use r\_B on the second GL₂ in piece three. For P₂₃ kill that piece by the second-torus exponent; for P₁₂ exchange the two inducing factors before using the same argument.
3. For P₁,P₃,P₁₃ and Borel cases use the D₆/E₆ top factors and regular lower factors explicitly; identify surviving supports and compare them with the forward result.

Check: A proof with only the P₂ case and a claim that the other cases are similar does not close this target.

Source: GS, Lemma 13.8 and proof, pp. 47–48. GS shows that a nontempered σ of PGSp₆ has zero G₂ lift unless it is one of the representations of Lemma 13.4, treating the P₂ case and leaving the other standard Levis to the reader; the node requires every case and the corrected GL₂ factor (packet E16).

### Temperedness and the positive-exponent correspondence

Target: `ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility` (theorem).

For any irreducible pair π⊗σ occurring as a quotient of Π\_E7, π is nontempered exactly when σ is nontempered. Nontempered π has a nonzero H lift. For the E₆ pairs, positive-exponent Jacquet analysis likewise preserves temperedness on nonzero irreducible theta quotients. These implications are available before the global finite-length theorem.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward; ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse; ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness; ExceptionalThetaCorrespondencesForG2:EX.1/g2-nontempered-normal-forms; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. Combine the forward and reverse support computations and the E₆ analogue; a tempered/nontempered mixed pair would violate one of those support conditions.

Check: Use this result in preliminary uniqueness without importing final Howe duality.

Source: GS, Lemma 6.3 and proof, p. 20; Theorem 14.1, pp. 48–49. GS states that in each pair π is tempered exactly when its partner is and that nontempered π lift nontrivially to PGSp₆, citing Savin and Gan–Savin 2004 for the E₆ pairs and Theorem 14.1 for E₇.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G2: Primary minimal-model inputs not obtained ExceptionalThetaCorrespondencesForG2/G9: Split Jacquet orbit twists ExceptionalThetaCorrespondencesForG2/G10: Reverse exponent cases and both finiteness directions Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.1, ExceptionalThetaCorrespondencesForG2:EX.2 The isotypic-quotient identity for parabolic induction (Gan–Gurevich Lemma 9.4), requested from the SmoothRepresentationsOfLocalGroups Part II.

## EX.4. Triality periods and preliminary uniqueness

Construct the trialitarian degenerate series and both exact sequences; prove the smooth-category Ext vanishing and Mackey restriction; obtain finite cubic period chains, weak existence and preliminary uniqueness without assuming full theta finite length.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.1; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.2a; SmoothRepresentationsOfLocalGroups:SR.3.

### Trialitarian degenerate principal series

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/spin8-degenerate-series` (construction).

For cubic étale E let P\_E be the Heisenberg parabolic of Spin₈^E with Levi GL₂(E)^0 (the three determinant coordinates descend to one F× value). Define I\_E(s)=Ind\_P\_E^Spin₈^E |det|^s by normalized induction. For each embedding E→J set RJ(E)=Θ\_J(1\_HJ,E) on Spin₈^E. Identify it with its natural image in I\_E(sJ), with sJ=−1/2 for dim J=9 and +1/2 for dim J=15.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

Proof or construction:

1. Apply the trivial-isotypic quotient in the exceptional see-saw and compare the spherical vector and exponents with the degenerate induced module.

API:

- `spin8_series_equivariance`: The induced module has the normalized smooth Spin₈^E action and commutes with cubic-algebra isomorphism.
- `rj_period_hom`: Hom\_G₂(RJ(E),π∨) is the HJ,E-invariant period on the corresponding exceptional theta module.
- `rj_induced_embedding`: The embedding of RJ(E) in I\_E(sJ) respects both the group action and the chosen normalization.

Discriminating tests:

- `spin8_split_levi` (computation): For E=F³ the Levi consists of triples of GL₂ matrices with equal determinants.
- `rj_division_nonfield` (degenerate): If E is not a field there is no embedding in cubic division D and RD(E)=0.
- `rj_parameter_sign` (non-example): The division and split-matrix images occur at −1/2, while the 15-dimensional image occurs at +1/2; interchanging these signs fails the exact sequences.

Uses:

- GS Propositions 5.2–5.5: Control quotient periods and Ext groups.
- GS §6.5: Obtain weak existence and rule out simultaneous lifts by a dimension count.

Check: Use a common determinant in GL₂(E)^0; ordinary Res GL₂ has too large a center.

Source: GS, §§5.1–5.2 and Proposition 5.2, pp. 16–17. GS defines R\_J(E) as the big theta lift of the trivial representation of H\_{J,E}, the Heisenberg parabolic of Spin₈^E with Levi GL₂(E)⁰ and the degenerate series I\_E(s), and states that R\_J(E) embeds in I\_E(s\_J) with s\_J = −1/2 for D⁺ and M₃(F)⁺ and 1/2 for H₃(M₂(F)).

Planet: Trialitarian degenerate series.

### The triality exact sequences

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/spin8-constituents` (theorem).

I\_E(1/2) has length three for E a field and length two otherwise, with irreducible socle V. There are exact sequences 0→R15(E)→I\_E(1/2)→RD(E)→0 and 0→V→R15(E)→RM3(E)→0. RD(E)=0 if E is not a field. Every constituent is tracked as a smooth G₂ module after restriction, while its Spin₈^E structure controls the extensions.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/spin8-degenerate-series; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models.

Proof or construction:

1. Compute the degenerate intertwiner image and kernel, identify the Jordan-rank orbit pieces and spherical quotient, and check the field/nonfield length distinction.

Check: For nonfield E the first exact sequence identifies R15 with all of I\_E(1/2).

Source: GS, Proposition 5.2, p. 17. GS states that I\_E(1/2) has length three when E is a field and two otherwise, with unique irreducible submodule V and the two exact sequences relating R\_{H₃(M₂(F))}(E), R\_{M₃(F)}(E) and R\_D(E).

### The division-period Ext obstruction

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/division-ext-vanishing` (theorem).

For a cubic field E, Ext¹\_G₂(RD(E),π)=0 when π is tempered or when π has supercuspidal support other than that of πdeg[1]. The ambient Ext is in the full smooth category. In the tempered case use the exact supplier comparison between smooth Ext and Schwartz Ext and discrete-series projectivity in the tempered Schwartz category; never assert that every discrete series is projective among all smooth representations.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/spin8-constituents; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; SmoothRepresentationsOfLocalGroups:SR.3/part-ii-schwartz-ext-comparison; SmoothRepresentationsOfLocalGroups:SR.3/part-ii-discrete-series-tempered-projectivity.

Proof or construction:

1. Separate Bernstein blocks, identify the relevant quotient as a discrete-series module in the tempered category, and transport the vanishing across the supplier’s exact Ext comparison. Treat nonmatching cuspidal support by block splitting.

Check: The proof must name the category of each Ext and the direction of the comparison.

Source: GS, Proposition 5.3 and proof, pp. 17–18. GS shows that Ext¹\_{G₂}(R\_D(E), π) vanishes for E a field and π tempered or with cuspidal support different from that of π\_deg[1], using the decomposition of R\_D(E) from Savin and the projectivity of discrete series in the tempered category.

### The G₂ restriction of I\_E(s)

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/triality-mackey` (theorem).

I\_E(s)|G₂ has an open piece c-Ind\_N^G₂ conjugate(ψE) and four boundary pieces J₁=IP(s/2+1/4,Cc(PGL₂)), J₂=mE·IP(s/2+1/4,c-Ind\_N₂^PGL₂ ψ), J₃=mE·IQ(s+1,1), J₄=IP(s+1,1), with mE=3,1,0 for E=F³,F×K,cubic field. J₁,J₂ form a submodule and J₃,J₄ the remaining quotient of the boundary module; the filtration order and extension data must be proved.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/spin8-degenerate-series; ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; ExceptionalThetaCorrespondencesForG2:EX.0/cubic-characters; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Classify G₂ orbits on Spin₈^E/P\_E via cubic flags, choose representatives and calculate stabilizers.
2. Compute restrictions of |det|^s and relative half-moduli on each orbit; prove the open embedding and the boundary exact sequence.

Check: The multiplicity mE counts F factors of E, rather than its total dimension.

Source: GS, Proposition 5.4, p. 18. GS states, without proof, a five-step G₂-filtration of I\_E(s): the compact induction of the conjugate cubic character at the bottom and four induced pieces, the second and third occurring with multiplicity m\_E = 3, 1, 0 according as E = F³, F × K or a field (packet E4 records the missing proof).

### Restriction to the open cubic orbit

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/triality-restriction-hom` (theorem).

For tempered π and s=1/2, restriction induces Hom\_G₂(I\_E(1/2),π)≅Hom\_N(π∨,ψE). The same conclusion holds for π with Q-supercuspidal support. Prove vanishing of the required Hom and Ext groups of all four boundary pieces. In the Q-support case use nonassociation of P and Q and Bernstein separation of the toral J₃ piece.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/triality-mackey; ExceptionalThetaCorrespondencesForG2:EX.4/division-ext-vanishing; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition; SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered.

Proof or construction:

1. Compute opposite Jacquet exponents of tempered π against the four explicit boundary twists.
2. Apply second adjointness to all Ext degrees needed by the filtration exact sequences; add the Q-cuspidal-support case explicitly.

Check: The Q-supercuspidal-support case cannot be inferred from a genericity assertion.

Source: GS, Proposition 5.5 and Lemma 5.6 with proofs, pp. 18–19. GS proves that for tempered π, or π with cuspidal support along Q, Hom\_{G₂}(I\_E(1/2), π) is Hom\_N(π∨, ψ\_E), by showing that all Ext groups from the four boundary pieces vanish through central-exponent comparisons; the Q-support case is completed in the node (packet E4).

### Cubic coefficients of exceptional minimal models

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/cubic-minimal-coefficients` (theorem).

For E embedded in J, (ΠJ)\_(N,ψE) is c-Ind\_HJ,E^HJ 1 with the chosen period convention. If E has no embedding in J the coefficient is zero. In particular a division E₆ lift has no nonfield cubic coefficients. The isomorphism is constructed on the rank-one orbit fiber and commutes with HJ.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.0/cubic-characters; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Take the twisted coinvariant of the rank-one model; identify its fiber as the homogeneous space of embeddings E→J and calculate its stabilizer and density.

Check: An E selected for a nonzero division lift is automatically a field; the Ext theorem is never applied to nonfield E.

Sources:

- GS, proof of Lemma 6.4, p. 21; Proposition 7.1(iv), p. 23: GS uses that the twisted Jacquet module of the minimal representation along N for ψ\_E is compactly induced from H\_{J,E} to H\_J, and records the division-algebra case as Hom\_N(Θ(τ), ψ\_E) ≅ Hom\_{PE×}(τ, ℂ).
- GrS, Chapter 6, §2, Lemma 2.9, p. 213: Gross–Savin compute a twisted Jacquet module of the minimal representation along the Heisenberg radical as a compactly induced module; GS cites this lemma for the identification in Lemma 6.4.

### The finite cubic period chain

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/cubic-period-chain` (theorem).

Suppose tempered π⊗τ is a quotient of ΠJ and E embeds in J. There are natural injections W\_E(π)→W\_E(ΘJ(τ))≅Hom\_HJ,E(τ∨,1)→Hom\_HJ,E(ΘJ(π∨),1)≅Hom\_G₂(RJ(E),π∨). If any one of these spaces is finite-dimensional, all have that finite dimension, by comparison with Hom(I\_E(1/2),π∨) and the triality exact sequences. The statement retains the conjugate character when replacing π by π∨.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/cubic-minimal-coefficients; ExceptionalThetaCorrespondencesForG2:EX.4/triality-restriction-hom; ExceptionalThetaCorrespondencesForG2:EX.4/division-ext-vanishing; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules; ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness.

Proof or construction:

1. Construct the two injections from theta quotient maps and the two identifications from coefficient and see-saw universal properties.
2. Use the triality Hom bound to close the chain; never infer equality merely from the existence of injections.

Check: The finite-dimensional hypothesis is checked via nongeneric cubic finiteness, not assumed for arbitrary irreducibles.

Source: GS, Lemma 6.4 and proof, p. 21. GS gives the chain of inclusions from Hom\_N(π, ψ\_E) through the cubic coefficients of Θ(τ) and the H\_{J,E}-periods to Hom\_{G₂}(R\_J(E), π∨), and shows they are equalities when one space is finite-dimensional, using Propositions 5.3 and 5.5.

Planet: Cubic period comparison.

### Preliminary nongeneric uniqueness

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness` (theorem).

If τ is tempered and ΘJ(τ) has a nongeneric tempered irreducible quotient π, then π is its unique tempered irreducible quotient. If π is nongeneric tempered, ΘJ(π) has at most one tempered irreducible quotient; its supercuspidal part is therefore zero or irreducible. These assertions precede any general finite-length claim.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/cubic-period-chain; ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness; ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting.

Proof or construction:

1. Choose a nonzero finite cubic model of the alleged quotient; use the period-chain equalities to make two quotients force a strict dimension increase. For the division pair first use the vanishing of nonfield cubic coefficients.

Check: No hypothesis that the full big theta module already has finite length enters this argument.

Source: GS, Propositions 6.6–6.7, p. 22. GS proves that a tempered nongeneric quotient of Θ\_J(τ) is its unique irreducible tempered quotient, and that Θ\_J(π) for nongeneric tempered π has at most one tempered irreducible quotient, by counting cubic period dimensions.

Planet: Nongeneric tempered uniqueness.

### Existence before exclusion

Target: `ExceptionalThetaCorrespondencesForG2:EX.4/weak-existence` (theorem).

Every nongeneric infinite-dimensional tempered π has at least one nonzero theta lift to PD× or PGSp₆. Choose a nonzero cubic coefficient, use the open-orbit restriction and 0→R15→I\_E→RD→0 to obtain a nonzero map from one of the two RJ modules, then apply the see-saw. This gives existence only; mutual exclusion is proved after noncuspidal finiteness.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness; ExceptionalThetaCorrespondencesForG2:EX.4/triality-restriction-hom; ExceptionalThetaCorrespondencesForG2:EX.4/spin8-constituents; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules.

Proof or construction:

1. Apply Hom\_G₂(−,π) to the exact sequence and use the nonzero Hom of I\_E provided by the chosen coefficient.

Check: When E is not a field, RD=0 and the surviving lift is necessarily the 15-dimensional one.

Source: GS, §6.3, p. 20. GS shows that a nongeneric tempered π lifts to PD× or PGSp₆ by choosing a nonzero cubic coefficient, applying Propositions 5.5 and 5.3 and then the see-saw identity.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G3: Residual-characteristic wavefront argument ExceptionalThetaCorrespondencesForG2/G6: Triality structure and omitted Mackey proof ExceptionalThetaCorrespondencesForG2/G7: Schwartz Ext supplier obligations Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.1, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.3

## EX.5. The two E₆ correspondences

Prove division and disconnected split-E₆ Howe duality, retaining the prime-to-three nonvanishing bound, outer signs, all explicit E₆ constituents and the opposite-division/Jacquet–Langlands compatibility.

Dependencies: EndoscopicTransferAndUnitaryTraceComparison:ET.6; ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.1; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.3; ExceptionalThetaCorrespondencesForG2:EX.4; MetaplecticAutomorphicForms:MP.2; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.3.

### Howe duality for the cubic division pair

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence` (theorem).

For every τ∈Irr(PD×), ΘD(τ) is finite length, is nongeneric, and is either zero or irreducible; distinct nonzero lifts are inequivalent. ΘD(1)=πdeg[1]. If τ≠1 its nonzero lift is supercuspidal. It is nonzero exactly when τ has a nonzero PE×-fixed vector for some cubic field E embedded in D. Thus the G₂-to-PD× small lift is injective on its domain, which consists of discrete series.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.4/cubic-minimal-coefficients; ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters.

Proof or construction:

1. Use compactness of PD×, the division minimal model and the Jacquet calculation to isolate πdeg[1]; all other lifts have zero proper Jacquet modules.
2. Use a nonzero cubic coefficient to obtain the torus criterion, then the preliminary uniqueness theorem to prove irreducibility and injectivity.

Check: Nonvanishing for every τ is not asserted here at residue characteristic 3.

Sources:

- GS, Proposition 7.1 and Theorem 7.2 with proof, p. 23: GS recalls Savin's results for PD× × G₂ (the lift of the trivial representation is π\_deg[1], other lifts are nongeneric supercuspidal of finite length, and cubic coefficients are PE×-periods) and proves that nonzero lifts are irreducible and determine τ; the injection of all of Irr(PD×) needs p ≠ 3 (see EX.5/division-nonvanishing).
- Sav, §5, pp. 398–399: Savin computes the Jacquet modules of the minimal representation of the division E₆ form along the G₂ parabolics, giving the supercuspidality of Θ(τ) for nontrivial τ.

Planet: The division correspondence.

### The residue-characteristic bound for division nonvanishing

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing` (theorem).

If the residue characteristic p is not 3, every irreducible representation of PD× has a fixed vector for the image PE× of some cubic field E⊂D; consequently ΘD(τ)≠0 for every τ. Independently of this bound, the trivial τ and the unramified nontrivial cubic norm characters lift nontrivially; for such a character ω, ΘD(ω∘Nrd)=πsc[ω], with the two inverse characters giving two distinct supercuspidals; matching their individual eigenvalue labels requires a fixed convention.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence; ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent.

Proof or construction:

1. Apply the prime-degree torus-distinction theorem with degree 3 and p≠3.
2. For the two nontrivial unramified cubic norm characters compute the division-model coefficients and identify the unordered pair of two distinct depth-zero representations; fix an eigenvalue convention before ordering it.

Check: The prime-degree theorem needs a primary proof audit; its stated coprimality hypothesis is retained.

Sources:

- GS, Proposition 7.1(iii) and Theorem 7.2(iii) with proof, p. 23: GS identifies the lifts of the nontrivial unramified cubic characters with π\_sc[ω] and π\_sc[ω²] and, for p ≠ 3, deduces nonvanishing of every lift from the theorem of Lonka–Tandon that every irreducible τ has a PE×-period for some cubic field E. The third part is misprinted as (ii) (packet E6).
- Sav, §6, pp. 399–400: Savin proves supercuspidality and identifies the depth-zero lifts of the unramified cubic characters through minimal types.

### Opposite division algebras and contragredients

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/opposite-division-compatibility` (theorem).

For degree-three central simple D, the identity on its vector space identifies the Jordan algebras D⁺ and (Dop)⁺, while x↦x⁻¹ identifies PD× with P(Dop)×. Under this identification and the imported Jacquet–Langlands normalization, θ(JL\_D(τ))≅θ(JL\_Dop(τ∨)). In the sequel’s enhancement construction, nonvanishing is available for all enhancements at p≠3; at p=3 use only the trivial enhancement or subregular-SL₂ cases proved there.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal; ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence; ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing; EndoscopicTransferAndUnitaryTraceComparison:ET.6/esi-jacquet-langlands; ExceptionalThetaCorrespondencesForG2:EX.0/component-groups.

Proof or construction:

1. Check the Jordan product directly, transport the minimal representation through its Jordan isomorphism, and compare the JL character identity after inversion.

Check: This target compares already defined local theta modules; it does not construct G₂ LLC.

Source: LL, §3.5, pp. 14–15. Gan–Savin note that the Jordan algebras of D\_j and D\_{−j} are isomorphic, with x ↦ x⁻¹ inducing PD\_j× ≅ PD\_{−j}×, so that the theta lift of a Jacquet–Langlands transfer through D\_j agrees with that of the contragredient through D\_{−j}; nonvanishing uses p ≠ 3.

### PGL₃ outer extensions and their signs

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels` (definition).

Put H₃=PGL₃⋊⟨ι⟩ with the pinned involution in EX.2. For nonselfdual irreducible τ, τ+=Ind\_PGL₃^H₃ τ is irreducible and is unchanged by τ↦τ∨. For selfdual τ there are two extensions τ±. If τ is generic, τ+ is the unique extension supporting ψ\_U⊗1 on U⋊C₂. For nongeneric selfdual τ (including 1 and the quadratic Borel Langlands quotients), choose the unique extension occurring in Π\_E6 as plus, using the independent E₆ model classification; minus has zero lift.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/e6-outer-extension; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals; ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. Apply index-two Clifford theory and compute the involution on the Whittaker fiber and on the nongeneric Jacquet quotient. The nongeneric plus convention is justified by the model calculation, not used as a proof of occurrence.

API:

- `pgl3_outer_restrict`: Restriction of τ+ is τ⊕τ∨ in the nonselfdual case and τ in either selfdual extension.
- `pgl3_outer_generic_plus`: For generic selfdual τ the plus extension has a one-dimensional ψ\_U⊗1 space and the minus extension has none.
- `pgl3_outer_dual`: Transport by ι matches the contragredient and identifies the nonselfdual induced labels.

Discriminating tests:

- `pgl3_outer_nonselfdual` (computation): A GL₃ parameter not isomorphic to its dual yields only one H₃ irreducible above its two-element orbit.
- `pgl3_outer_steinberg` (characterisation): The two extensions of St\_PGL₃ are distinct and only plus has the trivial C₂ action on its Whittaker line.
- `pgl3_outer_trivial` (non-example): The plus extension of the trivial PGL₃ module must be determined by the E₆ model; a Whittaker-based definition alone cannot label it.

Uses:

- GS Theorem 8.2: State exactly which split-E₆ lifts occur.
- GS Theorem 15.2: Match plus/minus to generic/nongeneric Siegel constituents.

Check: For nonselfdual τ there is one induced representation, not two arbitrarily signed extensions.

Sources:

- GS, §8.1, p. 24: GS realises the outer Z/2Z on PGL₃ by a pinned automorphism, distinguishes the two extensions of a Whittaker character, defines τ⁺ for nonself-dual τ and, for self-dual generic τ, as the extension with a Z/2Z-trivial Whittaker functional, and defines the plus extension of the nongeneric self-dual Langlands quotients through their lift. The node adds the trivial representation to that list (packet E7).
- GS, Theorem 8.2, pp. 25–26: GS records which extensions lift nontrivially.
- GS04, §8, Theorem 11, pp. 799–801: Gan–Savin 2004 determine the lifts of the non-square-integrable representations of PGL₃, which include the nongeneric self-dual Langlands quotients whose lifts GS §8.1 uses to define their plus extensions.

Planet: The PGL₃ outer signs.

### E₆ Whittaker, cubic and oscillator fibers

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models` (theorem).

For the fixed outer extension, Π\_(V,ψV)=c-Ind\_(U⋊C₂)^H₃(ψU⊗1); its cubic coefficients are c-Ind\_(PE×⋊C₂)^H₃ 1. The [U,U]-twisted quotient with nontrivial central character is the oscillator module c-Ind\_(GL₂⋊C₂)^H₃ Cc(M₂(F)), where GL₂ occupies the first and third coordinates and C₂ acts by the orthogonal involution prescribed by the model. Prove that each indicated disconnected stabilizer has trivial fiber character.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/e6-outer-extension; ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels; ExceptionalThetaCorrespondencesForG2:EX.4/cubic-minimal-coefficients; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction; MetaplecticAutomorphicForms:MP.2.

Proof or construction:

1. Compute each fiber of the concrete minimal orbit model and its connected stabilizer.
2. Evaluate the normalized outer intertwiner on one nonzero fiber vector to determine its C₂ character, then use transitivity.

Check: Knowing the connected coefficient is insufficient to determine the sign of the disconnected extension.

Source: GS, Lemma 8.1, pp. 24–25; Lemma 8.3, p. 26. GS states, as a summary of elementary computations, that the G₂-Whittaker coefficient of the E₆ ⋊ Z/2Z minimal representation is compactly induced from the trivial-sign extension of the PGL₃ Whittaker character, gives the cubic coefficients as PE× ⋊ Z/2Z-periods, and computes the [U,U]-twisted coefficient as an induced Weil representation on C\_c(M₂(F)). Packet E8 records the missing proofs of the outer signs.

### The generic supercuspidal precursor

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor` (theorem).

A generic supercuspidal π of G₂ has a nonzero generic supercuspidal exceptional lift to exactly one of PGL₃ and PGSp₆; the nonzero lift determines π. A generic supercuspidal σ of PGSp₆ has a nonzero G₂ lift exactly when it has a Shalika functional, and that lift is irreducible, generic and supercuspidal. This precursor is an input to the E₆ uniqueness argument and is independent of the all-representation E₇ Howe theorem.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting.

Proof or construction:

1. Use the generic twisted fibers, first occurrence and supercuspidal Jacquet vanishing; establish multiplicity one through the Shalika comparison in the supercuspidal setting.

Check: Do not cite the final E₇ Howe theorem to supply this earlier injectivity input.

Source: SW, Introduction, pp. 1–2; §3 (construction of the dichotomy map), pp. 16–27; Proposition 4.6, p. 37. Savin–Weissman attach to each generic supercuspidal of G₂ either a generic supercuspidal of PGSp₆ whose spin L-function has a pole at 0 or a contragredient pair of generic supercuspidals of PGL₃, prove injectivity for all p, and in Proposition 4.6 show that a generic supercuspidal of PGSp₆ lifts to G₂ exactly when it has a Shalika functional, the lift being generic supercuspidal.

### Nonzero minus lift for selfdual supercuspidals

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-minus-supercuspidal` (theorem).

For selfdual supercuspidal τ of PGL₃, Θ(τ−) is nonzero, nongeneric and supercuspidal. Produce a nonzero oscillator-model Hom from τ|GL₂ using a generic GL₂ quotient and classical theta, then split the resulting map by supercuspidal projectivity in its compact-center block. Self-dual supercuspidal representations of PGL₃ exist only in residue characteristic 2.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels; ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; MetaplecticAutomorphicForms:MP.3/rank-one-oscillator-constituents; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. Use the generic restriction theorem for GL₃↓GL₂ with its exact central-character convention.
2. Apply the rank-one oscillator decomposition with conjugate ψ, and keep track of the disconnected sign to obtain the minus lift.
3. The E₆ Jacquet computation and Whittaker coefficient imply supercuspidality and nongenericity.

Check: Finite-dimensional algebraic GL₃ branching is not a substitute for the smooth p-adic restriction theorem.

Sources:

- GS, Proposition 8.4 and proof, pp. 26–27: GS proves that the minus extension of a self-dual supercuspidal of PGL₃ (which exists only when p = 2) has nonzero lift, using Lemma 8.3, a generic GL₂ quotient of the restriction of τ and the rank-one O₃ theta lifts with conjugate character (packet E9).
- Pra, Theorem 3, p. 174 (as cited by GS in the proof of Proposition 8.4): Prasad's theorem on generic GL₂ quotients of the restriction of a generic GL₃ representation; the file could not be fetched for this review, so the statement is taken as GS cite it.

### The split-E₆ lift table

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-explicit-lifts` (theorem).

For nonselfdual τ of PGL₃, θ(τ+) is nonzero and has the same tempered/discrete-series status as τ. For selfdual τ: a parameter containing 1 has only a nonzero plus lift, which is not discrete series; St\_PGL₃ has plus lift πgen[1] and minus lift πsc[1]; a selfdual supercuspidal has generic supercuspidal plus lift and nongeneric supercuspidal minus lift; a tempered GL₂-induced selfdual parameter with nontrivial determinant gives the generic/degenerate pair in the P-series; the distinct nontrivial quadratic triple gives πgen[χ₁,χ₂] and πdeg[χ₁,χ₂]. For nongeneric selfdual τ only the plus extension lifts. State genericity of the small lift of a generic input only in the tempered cases of this table.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels; ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-minus-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments; ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel; ExceptionalThetaCorrespondencesForG2:EX.1/partial-g2-packets; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence.

Proof or construction:

1. Calculate the non-supercuspidal entries by normalized E₆ Jacquet filtrations and standard-module quotients.
2. For selfdual supercuspidals combine the plus Whittaker fiber and the minus nonvanishing argument.
3. For nontempered input distinguish the generic constituent of the big lift from the potentially nongeneric small quotient.

Check: The nontempered generic-input assertion in the v1 prose must not be used without this distinction.

Sources:

- GS, Theorem 8.2, pp. 25–26; Theorem 8.5(i) and proof, pp. 27–28: GS lists the lifts from PGL₃ ⋊ Z/2Z: nonself-dual τ⁺ lifts irreducibly preserving its type, self-dual parameters containing 1 give only a plus lift which is not discrete series, and the self-dual cases without 1 split into a generic and a nongeneric lift (St⁺ ↦ π\_gen[1], St⁻ ↦ π\_sc[1] on p. 28). The node restricts genericity preservation to the tempered cases (packet E7).
- GS04, §§8–9 and 11 (Theorems 11, 14, 15 and 21), pp. 799–807: Gan–Savin 2004 determine the lifts of the non-square-integrable representations, the twisted Steinberg representations and the Steinberg representation of PGL₃, and show that the lift of a supercuspidal is supercuspidal with a unique generic summand, irreducible when the input is not self-dual; they leave its explicit identification open.

Planet: The split-E₆ lift table.

### Howe duality for split E₆

Target: `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality` (theorem).

For H₃×G₂ the big lifts in both directions have finite length, each nonzero small lift is irreducible, and distinct inputs have distinct nonzero small lifts. The image on H₃ is exactly the extensions listed in the E₆ table. Tempered and discrete-series representations are preserved on nonzero lifts. The generic supercuspidal case uses the precursor, while nongeneric tempered uniqueness uses cubic periods.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-explicit-lifts; ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor; ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness; ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting.

Proof or construction:

1. Separate supercuspidal and noncuspidal parts using the compact-center block decomposition; use preliminary period uniqueness for the nongeneric supercuspidal part.
2. For possible generic quotients use the Whittaker fiber and the earlier supercuspidal injectivity theorem.
3. Use the P₃ Jacquet top piece, not the all-representation E₇ Howe theorem, when ruling out conflicting E₆ quotients.

Check: The dependency graph must not return from this theorem to final E₇ finiteness.

Source: GS, Theorem 8.5 and proof, pp. 27–29. GS proves that for every irreducible τ^ε the big lift has finite length with unique irreducible quotient if nonzero, completes the nonvanishing cases, and deduces Howe duality for the pair, using Savin–Weissman for generic supercuspidals and Proposition 6.6 for nongeneric tempered inputs.

Planet: Howe duality for split E₆.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G5: Finite-field cuspidal labels and examples ExceptionalThetaCorrespondencesForG2/G8: Exceptional raw coefficient proofs ExceptionalThetaCorrespondencesForG2/G11: Prime-degree torus distinction primary proof ExceptionalThetaCorrespondencesForG2/G12: Savin–Weissman supercuspidal and spin-factor proof audit Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.1, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.3, ExceptionalThetaCorrespondencesForG2:EX.4 Prasad’s GL₃ ↓ GL₂ theorem, requested from the SmoothRepresentationsOfLocalGroups Part II.

## EX.6. Auxiliary restrictions, finiteness and dichotomy

Import the orthogonal-minimal lift and the restricted Mp₂ × G₂ oscillator owned by MetaplecticAutomorphicForms (§§3.38a–3.39); identify their exceptional comparison and the supercuspidal lifts through that oscillator, prove noncuspidal finiteness in both E₇ directions and establish the division/PGSp₆ dichotomy.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.3; ExceptionalThetaCorrespondencesForG2:EX.4; ExceptionalThetaCorrespondencesForG2:EX.5; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.2a; SmoothRepresentationsOfLocalGroups:SR.3.

### Supercuspidal lifts through the restricted Mp₂ × G₂ oscillator

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/mixed-mp2-g2-module` (theorem).

Let Ω be the restriction to Mp₂ × G₂ of the oscillator representation of Mp₂ × SO₇, as constructed in MetaplecticAutomorphicForms §3.38a with its Jacquet sequence along the unipotent radical of Mp₂ and its cuspidal injectivity. For a genuine supercuspidal σ of Mp₂ that is not an odd Weil representation and whose lift to the split SO₃ vanishes, the small lift θ\_Ω(σ) to G₂ is an irreducible nongeneric supercuspidal representation and its Fourier–Jacobi model FJ\_ψ(θ\_Ω(σ)) is σ∨; in particular σ is determined by θ\_Ω(σ).

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; MetaplecticAutomorphicForms:MP.3; MetaplecticAutomorphicForms:MP.3/division-ternary-theta; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module.

Proof or construction:

1. Import the restricted oscillator, its Jacquet exact sequence and the cuspidal injectivity of MetaplecticAutomorphicForms §3.38a (Gan–Gurevich Proposition 8.1 and Theorem 9.1(c,d)); do not construct them again.
2. Follow Gan–Gurevich §9.5: their Proposition 8.3 gives FJ\_ψ(θ(σ)) = σ∨ when the SO₃ lift vanishes; Proposition 8.3(i) with Proposition 6.9(iv) shows the centre coinvariants vanish, so θ(σ) is nongeneric and supercuspidal; irreducibility of the Fourier–Jacobi module with Propositions 7.5, 7.7 and Corollary 8.2 excludes a second summand.
3. Keep the odd Weil case and the case of nonzero SO₃ lift separate; they contribute a Langlands quotient from P₂.

Check: The theorem is stated for the restricted oscillator, which is not a type-I dual pair; the module itself is MetaplecticAutomorphicForms §3.38a.

Sources:

- GG, Theorem 9.1(d), p. 33, and its proof in §9.5, pp. 36–37: Gan–Gurevich show that for a genuine supercuspidal σ of the metaplectic SL₂ other than an odd Weil representation, with vanishing lift to the split SO₃, the lift θ(σ) to G₂ through the restricted 7-dimensional oscillator is an irreducible nongeneric supercuspidal whose Fourier–Jacobi model recovers σ∨, so that σ is determined by θ(σ).
- GG, Propositions 8.1, 8.3–8.4, pp. 27–28: Gan–Gurevich compute the Jacquet module of the restricted oscillator along the unipotent radical of the metaplectic Borel and its Fourier–Jacobi coefficients; these inputs are owned by MetaplecticAutomorphicForms §3.38a.

Planet: Metaplectic lifts to G₂.

### Comparison with the owned orthogonal theta input

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/orthogonal-restriction-comparison` (theorem).

Identify the D₅,D₆ minimal factors in the E₇ Jacquet modules with the exact orthogonal-minimal theta models imported from Metaplectic MP.3. In particular use its finite-length lifts between G₂ and the relevant SO₁₀/SO₁₂ restrictions and between Sp₂ and Sp₆ in SO₁₂. Derive the exceptional comparison maps with the full algebraic dual on one side and the conjugate ψ on its rank-one oscillator; do not replan the owned finiteness theorem.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics; ExceptionalThetaCorrespondencesForG2:EX.6/mixed-mp2-g2-module; MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta; MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair.

Proof or construction:

1. Match spinor/orthogonal embeddings and central quotients before applying the supplier.
2. Apply the mixed-module Fourier–Jacobi comparison to identify the G₂ factor and check all contragredients.

Check: A map into a full algebraic dual is not an isomorphism with a smooth contragredient by default.

Source: GS, Proposition 14.2 and identity (14.3), pp. 50–51; §14.3, pp. 51–52. GS shows that for tempered π of G₂ the lift through the minimal representation of SO(2n), n = 5, 6, to SO(2n−7) has finite length, using the see-saw (14.3) with the metaplectic SL₂ and the Weil representation of the metaplectic SL₂ × SO₇ restricted to G₂ (for which it cites Gan–Gurevich), and in §14.3 uses these minimal factors to bound the noncuspidal part on the PGSp₆ side.

### The A₅ minimal restriction to Sp₆

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/a5-sp6-restriction` (theorem).

The A₅ minimal factor restricted to Sp₆ has finite length. Realize it as the appropriate homogeneous-function degenerate principal-series model on F⁶ minus {0}, then use transitivity of Sp₆ on nonzero vectors and on projective lines to identify its restriction with a finite-length induction from the line parabolic; retain the exact inducing character fixed by the minimal model.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. Compute the scalar homogeneity of the A₅ model, apply transitivity and normalized induction, and include any evaluation-at-zero constituent.

Check: The inducing character is a calculation to supply; finite length cannot be asserted from transitivity alone.

Source: GS, §14.3, second case, p. 52. GS observes that Sp₆ acts transitively on the relevant lines, so that the restriction of the A₅-minimal factor to Sp₆ is a degenerate principal series and hence of finite length.

### Noncuspidal finiteness in both E₇ directions

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness` (theorem).

For every irreducible representation on either side of G₂×PGSp₆, the noncuspidal part of its big theta lift has finite length. This includes every graded piece of every relevant Jacquet filtration, not just its regular bottom piece.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-p-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-q-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p2-jacquet; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet; ExceptionalThetaCorrespondencesForG2:EX.6/orthogonal-restriction-comparison; ExceptionalThetaCorrespondencesForG2:EX.6/a5-sp6-restriction; ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality; SmoothRepresentationsOfLocalGroups:SR.3/isotypic-quotient-regular; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma.

Proof or construction:

1. For each of the five maximal parabolics tabulate Hom into the finite-length Jacquet module of the input.
2. Use regular GL₁/GL₂ isotypic quotients for lower pieces, classical similitude theta for the Weil piece, and E₆/D₅/D₆/A₅ finiteness for top pieces.
3. For induction through a middle Levi use second adjointness and the general isotypic–parabolic-induction identity; check all Ext terms in the filtration.

Check: No proof may replace the top-piece checks with an unproved assertion of finite multiplicities.

Source: GS, Lemma 6.2, p. 19; §§14.2–14.3, pp. 49–52. GS states that the noncuspidal part of each big theta lift has finite length and proves the E₇ case in §14 from the Jacquet filtrations of §13 and the finiteness of the minimal-factor lifts; packet E16 records the compressed non-top pieces.

Planet: Noncuspidal theta finiteness.

### Finite length for nongeneric inputs

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/nongeneric-full-finiteness` (theorem).

For nongeneric tempered π of G₂, ΘH(π) has finite length with zero or irreducible supercuspidal part. For tempered τ of H having a nongeneric quotient π, ΘG₂(τ) has finite length and unique irreducible quotient π. Combine noncuspidal finiteness with preliminary supercuspidal uniqueness, rather than using that uniqueness to assume finite length of the entire module.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness; ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting.

Proof or construction:

1. Split off the supercuspidal part in the appropriate compact-center category, bound it by the cubic-period dimension argument and combine it with the noncuspidal length bound.

Check: The splitting supplier is used only for the supercuspidal summand.

Sources:

- GS, Proposition 6.6 and Corollary 6.8, p. 22: GS combines the noncuspidal finiteness with the uniqueness of tempered quotients to show that Θ\_J(π) has finite length with a unique, tempered, irreducible quotient for nongeneric tempered π, and that such quotients determine π; the τ-side statement follows from Proposition 6.6 with Lemma 6.3(i).
- GS, §§14.2–14.3, pp. 49–52: GS supplies the E₇ noncuspidal finiteness used in this deduction.

### The exceptional theta dichotomy

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy` (theorem).

Every irreducible π of G₂ has nonzero big theta lift to exactly one of PD× and PGSp₆. Let Irr♠ and Irr♥ denote these disjoint domains. Nongeneric tempered existence comes from the triality exact sequence; generic representations cannot occur in the division pair and have a nonzero PGSp₆ lift; all nontempered representations have their nonzero PGSp₆ lift from positive-exponent analysis.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.4/weak-existence; ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence; ExceptionalThetaCorrespondencesForG2:EX.6/nongeneric-full-finiteness; ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward; ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules; ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers.

Proof or construction:

1. For a hypothetical nongeneric tempered lift to both targets choose a nonzero cubic field model of dimension d. The exact sequence for I\_E and the Ext vanishing identify the two terminal period contributions with d+d, while the open-orbit Hom space has dimension d; deduce d=0, a contradiction.
2. Prove the generic PGSp₆ occurrence from the minimal Whittaker fiber, independently of its full Howe theorem.
3. Use the full nontempered quotient result and the division discrete-series property for the other cases.

Check: Explicitly construct the dimension identity; an inequality coming only from two separate injections does not prove exclusion.

Source: GS, Theorem 1.1, p. 2; Theorem 6.1 and §§6.2–6.5, pp. 19–21. GS states that every irreducible representation of G₂ lifts nontrivially to exactly one of PD× and PGSp₆, reduces to nongeneric tempered π (nontempered and generic π lift only to PGSp₆), proves existence by the triality sequence and excludes double lifting by the period-dimension count 2d = d.

Planet: Exceptional theta dichotomy.

### The two E₇ Whittaker fibers

Target: `ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers` (theorem).

For the fixed minimal representation Π, its generic G₂ coinvariant is c-Ind\_S^H ψS and its generic H coinvariant is c-Ind\_V^G₂ ψV. Consequently a generic G₂ representation has a nonzero H lift and a nongeneric G₂ input cannot pair with a generic H quotient. These are concrete fiber computations before full Howe duality.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals.

Proof or construction:

1. Compute the two generic-character fibers in the minimal orbit model and their stabilizers and density actions, independently of the final multiplicity-one argument.

Check: Identify which group’s character is taken on each side of the two identities.

Sources:

- GS, Proposition 11.1 and Corollary 11.2, p. 34; Proposition 11.5, p. 37: GS recalls from Gan–Savin 2004 that the PGSp₆-Whittaker coefficient of the E₇ minimal representation is the G₂ Gelfand–Graev module, deduces that a generic π has a big lift with one-dimensional Whittaker space and that nongeneric π cannot pair with generic τ, and states that the G₂-Whittaker coefficient is the Shalika-induced module of PGSp₆.
- HKT, Theorem A.7 and proof, pp. 25–27: Savin's appendix computes the twisted Jacquet module of the E₇ minimal representation for the PGSp₆ Whittaker character as the G₂ Gelfand–Graev representation.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G7: Schwartz Ext supplier obligations ExceptionalThetaCorrespondencesForG2/G10: Reverse exponent cases and both finiteness directions Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.3, ExceptionalThetaCorrespondencesForG2:EX.4, ExceptionalThetaCorrespondencesForG2:EX.5

## EX.7. Fourier–Jacobi and Shalika multiplicity one

Define the Fourier–Jacobi and Shalika modules, prove root exchange and enhanced multiplicity one, compute the actual minimal fibers and close the one-dimensional generic period chain and tempered Howe theorem.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.1; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.3; ExceptionalThetaCorrespondencesForG2:EX.4; ExceptionalThetaCorrespondencesForG2:EX.5; ExceptionalThetaCorrespondencesForG2:EX.6; MetaplecticAutomorphicForms:MP.2; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.2a; SmoothRepresentationsOfLocalGroups:SR.3; SmoothRepresentationsOfLocalGroups:SR.5.

### The enhanced Fourier–Jacobi period

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period` (definition).

For Q=LU in G₂ put Z=Z(U), let U/Z be its three-dimensional Heisenberg quotient, and let Lder≅SL₂. Set J=Lder⋉U. The oscillator representation ρψ of U/Z extends to Mp₂⋉U; for a genuine Mp₂ module Iψ(s) form I\_conjugateψ(s)⊗ρψ, whose two genuine signs cancel so it descends to J. Define its Fourier–Jacobi period on π by Hom\_J(π,I\_conjugateψ(s)⊗ρψ), with the normalized genuine principal series and the stated additive-character convention.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/parabolics; MetaplecticAutomorphicForms:MP.2; MetaplecticAutomorphicForms:MP.3/orthogonal-symplectic-dual-pair; SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

Proof or construction:

1. Construct the Heisenberg quotient from the root commutator pairing and restrict the imported Schrödinger representation; calculate the metaplectic cocycle on Lder.

API:

- `fj_sign_descent`: The tensor of the two genuine factors has trivial central μ₂ and therefore defines a J action.
- `fj_intertwining`: The normalized Mp₂ standard intertwiner induces the corresponding map of enhanced period modules.
- `fj_root_model`: The root-coordinate and Schrödinger definitions identify with the same ψ and selfdual Haar measure.

Discriminating tests:

- `fj_genuine_descent` (characterisation): Either genuine factor alone fails to descend to SL₂; their tensor descends.
- `fj_wrong_quotient` (non-example): For nontrivial ψ the oscillator has nontrivial center on U/Z and cannot be a representation of U/[U,U].
- `fj_conjugate_character` (non-example): Replacing ψ by conjugate ψ dualizes the oscillator and conjugates the principal-series character; retaining only one change gives a different period.

Uses:

- GS Proposition 11.1: Prove enhanced multiplicity one.
- GS Lemma 12.1: Close the generic Shalika–Whittaker period chain.

Check: The oscillator does not factor through U/[U,U], which is abelian.

Source: GS, §11.2, p. 34. GS introduces the Jacobi group J = [L,L]U for the three-step parabolic, the representation ρ\_ψ of its two-fold cover, the genuine principal series I\_ψ(s) of the metaplectic SL₂, and defines the Fourier–Jacobi period of π with respect to σ as Hom\_J(π, σ ⊗ ρ\_ψ). The node uses the centre of U/Z(U) (packet E12).

Planet: Fourier–Jacobi periods.

### The PGSp₆ Shalika period

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/shalika-period` (definition).

Let N₂ be the radical of P₂ in H and choose the generic ψ₂ whose stabilizer in M₂ is diagonal PGL₂. Set S=PGL₂^Δ⋉N₂ and extend ψ₂ trivially to ψS on the diagonal factor. Define the Shalika coinvariant π\_(S,ψS) and its algebraic-dual functional space Hom\_S(π,ψS). Distinguish these dual spaces in every period identity.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates; SmoothRepresentationsOfLocalGroups:SR.5/twisted-coinvariants; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals.

Proof or construction:

1. Compute the M₂ action on the generic radical character and its stabilizer, then apply the imported twisted coinvariant construction to the semidirect product.

API:

- `shalika_character`: The extension ψS is a character because diagonal PGL₂ stabilizes ψ₂.
- `shalika_dual`: The algebraic dual of the Shalika coinvariant identifies with the functional space.
- `shalika_transport`: Conjugating ψ₂ by M₂ transports the subgroup and its period without changing dimensions.

Discriminating tests:

- `shalika_stabilizer` (computation): The anti-diagonal central Gm quotient in M₂ acts trivially and the stabilizer is PGL₂, not an extra GL₂ center.
- `shalika_trivial` (degenerate): A trivial H module has zero Shalika period because ψS is nontrivial.
- `shalika_conjugate` (non-example): Contragredient period identities use conjugate ψS; an assertion with an unchanged arbitrary unitary ψS fails.

Uses:

- GS Proposition 11.7: Identify the minimal representation’s S coefficient.
- SW Proposition 4.6: Detect nonzero reverse theta for generic supercuspidals.

Check: This is the P₂ Shalika subgroup of PGSp₆, not the Siegel Shalika subgroup of GL₆.

Source: GS, §11.3, pp. 36–37. GS defines the Shalika subgroup S of PGSp₆ from the radical of P₂ and the diagonal PGL₂ stabilizing a generic character ψ₂, extends ψ₂ trivially to ψ\_S, and takes the Shalika period as the (S, ψ\_S)-coinvariants.

Planet: The PGSp₆ Shalika model.

### Root exchange with compact integration

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/root-exchange` (theorem).

For a smooth Heisenberg module with fixed nontrivial central character, integration along one of two complementary isotropic subgroups induces an isomorphism between the corresponding twisted coinvariant spaces. Use dual selfdual Haar measures so the inverse map is Fourier inversion. For each smooth vector prove compact support of the integrand modulo the relevant stabilizer; integration of an arbitrary constant along a whole noncompact root group is not defined.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period; SmoothRepresentationsOfLocalGroups:SR.5/twisted-coinvariants; MetaplecticAutomorphicForms:MP.2.

Proof or construction:

1. Use the nondegenerate commutator pairing to identify opposite root groups as Pontryagin duals. Smoothness provides an open stabilizer; the central character forces support inside its compact annihilator. Apply finite-level Fourier inversion and pass to coinvariants.

Check: State and verify the fixed-central-character and support hypotheses each time root exchange is used.

Source: GS, Lemma 11.4 and proof, pp. 35–36. GS proves that for a smooth module of a Heisenberg group with nontrivial central character and two maximal abelian subgroups X, Y, integration over the complementary root group gives an isomorphism Hom\_X(π, ψ\_X) ≅ Hom\_Y(π, ψ\_Y), and uses it with root groups of G₂ (packet E12 for the lower-central filtration).

### Enhanced Fourier–Jacobi multiplicity one

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-uniqueness` (theorem).

If π is generic irreducible and either tempered or supported on a Q-supercuspidal Bernstein component, then for real s<1/2 the space Hom\_J(π,I\_conjugateψ(s)⊗ρψ) has dimension one. In particular the value at s=−1/2 needed by the period chain is one-dimensional. This includes the Q-support case independently of temperedness.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period; ExceptionalThetaCorrespondencesForG2:EX.7/root-exchange; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. Use root exchange to replace the enhanced period by the appropriate mirabolic/Whittaker functional.
2. Analyze the normalized Mp₂ intertwiner and G₂ Jacquet exponents; show boundary terms vanish for s<1/2 in the tempered case.
3. Use Bernstein support separation for the Q-supercuspidal case and the supplier’s generic Whittaker uniqueness.

Check: The strict inequality s<1/2 and the second support case must both remain visible.

Source: GS, Lemma 11.3 and proof, pp. 34–36. GS proves that for generic π which is tempered or has cuspidal support on Q the enhanced Fourier–Jacobi space Hom\_G₂(π, Ind\_J(I\_ψ̄(s) ⊗ ρ\_ψ)) is one-dimensional for every s < 1/2, by reducing to a twisted Jacquet functional on T\_β N and exchanging roots.

### The Shalika fiber of the minimal representation

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber` (theorem).

With J and S as above, Π\_(N₂,ψ₂) is c-Ind\_J^G₂(Cc(M₂(F)^0)⊗ρψ) with the commuting diagonal PGL₂ action, and Π\_(S,ψS) is c-Ind\_J^G₂(I\_conjugateψ(1/2)⊗ρψ). In the second formula determine the genuine principal-series normalization by the PGL₂-trivial isotypic quotient of the classical oscillator. The underlying coefficient spaces and actions must be constructed explicitly.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.7/shalika-period; ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period; ExceptionalThetaCorrespondencesForG2:EX.7/root-exchange; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction; MetaplecticAutomorphicForms:MP.2; SmoothRepresentationsOfLocalGroups:SR.2.

Proof or construction:

1. Compute the N₂ character fiber in the E₇ rank-one model, identify its stabilizer and verify the action on the traceless-matrix Schrödinger space.
2. Take diagonal PGL₂ coinvariants using the classical oscillator’s exact sequence and the required Ext¹\_PGL₂(1,1)=0; commute this particular quotient with compact induction by the appropriate supplier lemma.

Check: The compact-induction step needs its own hypotheses and is not justified by the different general parabolic-induction identity.

Source: GS, §11.4, Lemma 11.6 and Proposition 11.7, pp. 37–38. GS states the N₂-twisted coefficient of the E₇ minimal representation as a compact induction from J of C\_c(M₂°(F)) ⊗ ρ\_ψ (without proof, packet E13), proves that compact induction commutes with maximal isotypic quotients when Ext¹(τ, τ) = 0, and deduces that the Shalika coefficient is compactly induced from I\_ψ̄(1/2) ⊗ ρ\_ψ.

### The one-dimensional generic period chain

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/generic-period-chain` (theorem).

For tempered π and τ with π⊗τ a quotient of Π, if π is generic then all spaces in the Whittaker–Shalika–Fourier–Jacobi chain of Lemma 12.1 have dimension one. Use Π\_(V,ψV)=c-Ind\_S ψS and Π\_(U,ψU)=c-Ind\_V ψV, the Shalika fiber at +1/2, the contragredient/intertwiner to the enhanced period at −1/2, and enhanced multiplicity one. Include the Q-support variant used for generic supercuspidal first occurrence.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers; ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber; ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules; SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals.

Proof or construction:

1. Write each injection and identification with its source and target, then use the nonzero end maps and the one-dimensional enhanced period bound. Match ψ and conjugate ψ on both sides.

Check: A chain of injections without the nonzero endpoint and the upper dimension bound is insufficient.

Source: GS, Lemma 12.1 and proof, pp. 38–39. GS forms the chain of Whittaker, Shalika and Fourier–Jacobi period spaces for a tempered pair π ⊗ τ in the minimal representation and shows they are all one-dimensional when π is generic, using Propositions 11.5 and 11.7 and Lemma 11.3 at s = −1/2.

Planet: The generic period comparison.

### Uniqueness for generic tempered quotients

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/generic-tempered-uniqueness` (theorem).

For tempered τ of H, ΘG₂(τ) has at most one tempered generic irreducible quotient. For tempered generic π of G₂, ΘH(π) has a unique irreducible quotient, which has the genericity specified by the explicit lift table. Multiplicity is one and the resulting assignment is injective on these nonzero lifts.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.7/generic-period-chain; ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness; ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor.

Proof or construction:

1. If two generic quotients occur, their independent Whittaker lines contradict the one-dimensional period chain; treat supercuspidal quotients through the earlier precursor and noncuspidal quotients through finite-length Jacquet support.

Check: The uniqueness proof must bound the supercuspidal part as well as the noncuspidal part.

Source: GS, Propositions 12.2–12.3 and the remark after 12.2, p. 39. GS deduces that Θ(τ) for tempered τ cannot have two tempered generic irreducible quotients and that Θ(π) for tempered generic π cannot have two tempered irreducible quotients; the remark attributing the result to Savin–Weissman is limited to supercuspidal τ (packet E14).

### Tempered Howe duality in E₇

Target: `ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe` (theorem).

For every tempered irreducible on either side of G₂×H, the big theta lift has finite length and zero or irreducible maximal semisimple quotient, with multiplicity one; two inputs cannot have the same nonzero small lift. The nonzero lifts are tempered. Combine generic period uniqueness and nongeneric cubic uniqueness, and include generic/noncuspidal and nongeneric/supercuspidal mixed possibilities.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.7/generic-tempered-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.6/nongeneric-full-finiteness; ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness; ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness; ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility; ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules.

Proof or construction:

1. Use compact-center supercuspidal splitting and the two independent period bounds to bound the full big module. Distinguish generic and nongeneric quotients with the raw Whittaker fiber; apply reciprocity to obtain injectivity.

Check: Neither an unproved finite-length hypothesis nor a classical oscillator Howe theorem can replace the exceptional argument.

Source: GS, Theorem 12.4 and proof, p. 39; §§14.2–14.3, pp. 49–52. GS concludes Howe duality for tempered representations of G₂ in G₂ × PGSp₆ (finite length, unique tempered quotient, injectivity) from the uniqueness results and the noncuspidal finiteness of §14; the node also records the PGSp₆ side.

Planet: Tempered exceptional Howe duality.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G8: Exceptional raw coefficient proofs Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.1, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.3, ExceptionalThetaCorrespondencesForG2:EX.4, ExceptionalThetaCorrespondencesForG2:EX.5, ExceptionalThetaCorrespondencesForG2:EX.6 The compact-induction isotypic lemma (GS Lemma 11.6), requested from the SmoothRepresentationsOfLocalGroups Part II.

## EX.8. Full Howe duality and explicit lift tables

Identify the nontempered quotients and every tempered lift-table entry, including πρ and nongeneric SK cases; combine them into the three full Howe theorems, discrete-series trichotomy and generic supercuspidal spin-pole criterion.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.4; EndoscopicTransferAndUnitaryTraceComparison:ET.6; ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.1; ExceptionalThetaCorrespondencesForG2:EX.3; ExceptionalThetaCorrespondencesForG2:EX.5; ExceptionalThetaCorrespondencesForG2:EX.6; ExceptionalThetaCorrespondencesForG2:EX.7; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.3; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

### Explicit nontempered lifts

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts` (theorem).

If π=JQ(τ), then θH(π)=J₂(τ⊗τ); if π=JP(τ) in either allowed P family, θH(π)=J₁₃(τ⊗1). These big lifts have finite length. Conversely these are exactly the nontempered H representations with nonzero G₂ lift. Under the fixed GL₂ LLC and exceptional dual-group embedding, the two parameters match.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward; ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse; ExceptionalThetaCorrespondencesForG2:EX.1/g2-nontempered-normal-forms; ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13; ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe; ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings; ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters; EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-correspondence; SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification.

Proof or construction:

1. The positive-exponent comparison identifies the full module as a quotient of a finite-length induction, so its Langlands quotient is unique. Read its dual-Levi parameter through the fixed lattice coordinates.

Check: Use positive real exponents and the correct P₁₃/P₂ Levi conventions, including the character-induction P cases.

Source: GS, Theorem 14.1, pp. 48–49; Theorem 15.1, p. 52. GS determines the lifts of nontempered representations: J\_Q(τ) ↦ J₂(τ⊗τ) and J\_P(τ) ↦ J₁₃(τ⊗1), with finite-length big lifts, and these are the only nontempered PGSp₆ representations with nonzero lift.

### Howe duality for all three exceptional pairs

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems` (theorem).

For each of PD××G₂, H₃×G₂ and G₂×H, every irreducible input has a finite-length big theta lift and zero or irreducible small theta lift; the nonzero small assignment is injective. Irr♣, the G₂ domain of the H₃ correspondence, is contained in Irr♥. PD× nonzero lifts are discrete series, H₃ lifts preserve temperedness and discreteness, and H lifts preserve temperedness. PD× is fully hit when p≠3.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence; ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing; ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality; ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe; ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts; ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy; ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table.

Proof or construction:

1. Combine the three independent proofs and nontempered classification; use the explicitly computed E₆-to-E₇ table to prove Irr♣⊂Irr♥ rather than regard three nonzero domains as disjoint.

Check: This does not assert surjectivity onto Irr(H), and it does not assert PD× surjectivity at p=3.

Sources:

- GS, Theorems 1.2–1.3, pp. 2–3; Theorem 7.2, p. 23; Theorem 8.5, p. 27; Theorem 15.1, p. 52: GS states Howe duality for the three dual pairs, the preservation of temperedness and the inclusion of the PGL₃ domain in the PGSp₆ domain, and the injection of Irr(PD×) for p ≠ 3.
- LL, Theorem 2.1, p. 8: Gan–Savin restate these results as the input of the local Langlands correspondence for G₂.

Planet: Exceptional Howe duality.

### The E₆-to-E₇ tempered Siegel table

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table` (theorem).

For tempered τ of PGL₃ and π=θM₃(τ±) nonzero, θH(π) is I₃(τ) if τ is nonselfdual or if its selfdual parameter contains 1. In the remaining selfdual cases, θH(θM₃(τ+))=I₃(τ)gen and θH(θM₃(τ−))=I₃(τ)deg. In the contains-1 case I₃(τ) is irreducible by the applicable non-discrete-series criterion; do not apply the discrete-series splitting rule outside its hypothesis.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-explicit-lifts; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet; ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe; ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p3; ExceptionalThetaCorrespondencesForG2:EX.1/partial-g2-packets.

Proof or construction:

1. Use the P₃ Jacquet top E₆ term to produce the quotient, compare genericity and finite length, then use the PGSp₆ reducibility table to distinguish the two signs.

Check: The parameter-contains-1 case has only the plus E₆ lift; it is not a two-sign splitting.

Source: GS, Theorem 15.2, pp. 52–53. GS gives the PGSp₆ lifts of the tempered lifts from PGL₃: the irreducible Siegel induction I₃(τ) for nonself-dual τ and for self-dual parameters containing 1, and the generic and nongeneric summands of I₃(τ) for the other self-dual cases.

Planet: The tempered Siegel lift table.

### The remaining tempered non-supercuspidal lifts

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table` (theorem).

For unitary discrete-series GL₂ τ, θH(IQ(τ))=I₂(τ⊗τ), matching generic/degenerate summands where these split; θH(δQ(τ))=δ₂(τ) when ωτ=1; θH(δP(τ))=δ₁₃(τ) in the selfdual determinant-trivial case. The S₃-dihedral, nontrivial quadratic and Steinberg entries are πgen[τ]↦σgen[τ], πgen[χ]↦σgen[χ], and StG₂↦StH. Together with the E₆ table and πdeg[1] on the division side this covers every tempered non-supercuspidal π.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg; ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal; ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments; ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13; ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p3; ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe; ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table; ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence.

Proof or construction:

1. Construct maps using the two G₂ Jacquet bottom pieces and follow their discrete-series submodules under the known reducibility filtrations; use genericity to select the correct member.

Check: Both supercuspidal and Steinberg-twist GL₂ input families, including the exceptional quadratic entries, are accounted for.

Source: GS, Theorem 15.3, p. 53. GS lists the lifts of the remaining tempered non-supercuspidal representations: I\_Q(τ) ↦ I₂(τ⊗τ) with matching summands, δ\_Q(τ) ↦ δ₂(τ), δ\_P(τ) ↦ δ₁₃(τ), π\_gen[τ] ↦ σ\_gen[τ], π\_gen[χ] ↦ σ\_gen[χ] and Steinberg to Steinberg (packet E18 for the missing derivations).

### The nongeneric πρ family

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/rho-supercuspidal-family` (theorem).

For a supercuspidal ρ of PGL₂ let σρ be its classical theta lift on Mp₂ through the anisotropic ternary group using JL(ρ). Its mixed Mp₂×G₂ lift πρ is irreducible nongeneric supercuspidal and determines ρ. These πρ exhaust the supercuspidals outside the PD× and PGL₃ images which have a nonzero reverse Mp₂ mixed lift. The odd-Weil case is excluded by this ternary-first-occurrence construction.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.6/mixed-mp2-g2-module; MetaplecticAutomorphicForms:MP.3/division-ternary-theta; ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence; ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality; MetaplecticAutomorphicForms:MP.3.

Proof or construction:

1. Use the imported division-ternary theta theorem and the mixed-module first-occurrence criterion, then recover σρ from the Fourier–Jacobi module and ρ from the classical inverse correspondence.
2. Nonvanishing, irreducibility and injectivity of σ ↦ θ(σ) on genuine supercuspidals are MetaplecticAutomorphicForms §3.38a; this node adds the description of the family π\_ρ and its exhaustion property (GS Lemma 15.4(iii)).

Check: Do not infer irreducibility for the excluded odd Weil module from the supercuspidal case.

Sources:

- GS, §15.1 and Lemma 15.4, p. 54: GS defines σ\_ρ as the metaplectic lift of the Jacquet–Langlands transfer of ρ to the anisotropic PB× and π\_ρ as its lift to G₂, and recalls from Gan–Gurevich that π\_ρ is irreducible supercuspidal, that ρ ↦ π\_ρ is injective, and that these exhaust the supercuspidals lifting to the metaplectic SL₂ but not from PGL₃ or PD×. The node reads "anisotropic" for the misprinted "isotropic" (packet E6).
- GG, Theorem 9.1(d), p. 33: Gan–Gurevich give the nongenericity of these lifts.

Planet: The πρ family.

### The πρ lift to the D₆ factor

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison` (theorem).

Let τρ be the nongeneric supercuspidal Saito–Kurokawa representation of PGSp₄ attached by classical theta to σρ. Then Θ\_D6(πρ)=τρ under the orthogonal-minimal comparison. Specify the same additive character and dual convention throughout.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.8/rho-supercuspidal-family; ExceptionalThetaCorrespondencesForG2:EX.6/orthogonal-restriction-comparison; MetaplecticAutomorphicForms:MP.3.

Proof or construction:

1. Use the orthogonal-minimal see-saw comparison with full algebraic duals; the classical rank-one theta result identifies the only nonzero quotient and its multiplicity.

Check: An equality of semisimplified small modules is not silently promoted to equality of big modules.

Source: GS, Lemma 15.4 (definition of τ\_ρ) and Lemma 15.5 with proof, p. 54. GS defines τ\_ρ as the lift of σ\_ρ to SO₅, a nongeneric supercuspidal in a Saito–Kurokawa packet, and proves through the see-saw (14.3) that the SO₁₂-minimal lift of π\_ρ to SO₅ is τ\_ρ.

### The remaining PGSp₆ supercuspidal-input table

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts` (theorem).

For the πρ family, θH(πρ)=δ₁(τρ), the discrete-series submodule of I₁(1/2,τρ). For every other supercuspidal π of G₂ outside the division and split-E₆ images, θH(π) is supercuspidal. For generic such π the lift is generic supercuspidal. Include p=2,3 in the local theta theorem, while preserving any source-specific restrictions on the separate depth-zero examples.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.8/rho-supercuspidal-family; ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison; ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1; ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet; ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness; ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe; ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor; ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy.

Proof or construction:

1. Analyze every proper H Jacquet module of the supercuspidal input using the raw filtrations; only the D₆ top term can survive, and the comparison identifies exactly the πρ family. Use nongeneric SK reducibility to select δ₁(τρ).

Check: The nongeneric rank-one Plancherel calculation is a named unresolved obligation, not an application of the generic Shahidi theorem.

Source: GS, Proposition 15.6 and proof, pp. 54–55. GS shows that for supercuspidal π not lifted from PGL₃ or PD× the PGSp₆ lift is the discrete-series submodule δ₁(τ\_ρ) of I₁(1/2, τ\_ρ) when π = π\_ρ and is supercuspidal otherwise, using the P₁ Jacquet filtration and Lemma 15.5.

### The discrete-series trichotomy

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/discrete-series-trichotomy` (theorem).

Every discrete-series representation of G₂ has a nonzero discrete-series theta lift to exactly one of PD×, H₃ and PGSp₆. The PD× and H₃ domains, and their complement inside the PGSp₆ domain, give the three subsets. Whenever θH(π) is discrete series, it is generic exactly when π is generic. A representation in the H₃ branch can also have a nonzero H lift, but that H lift is not discrete series.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems; ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts; ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers.

Proof or construction:

1. Read discreteness and genericity from every explicit table entry and the supercuspidal classification.

Check: The three alternatives count discrete-series target lifts, not all nonzero lifts to all three groups.

Sources:

- GS, Theorem 1.3, p. 3; Corollary 15.7, p. 55: GS states that every discrete series of G₂ lifts to a discrete series of exactly one of PD×, PGL₃ ⋊ Z/2Z and PGSp₆, the PGSp₆ lift being generic exactly when π is (packet E6 for the group name).
- LL, Proposition 2.3, p. 8; §5.2, p. 20: Gan–Savin restate the trichotomy and use the generic discrete-series lifts to PGSp₆ in their spin-lifting argument.

Planet: Discrete-series theta trichotomy.

### The supercuspidal spin-pole criterion

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/spin-pole-criterion` (theorem).

For generic supercuspidal σ of PGSp₆, the following are equivalent: a nonzero Shalika functional; a nonzero exceptional lift to G₂; a pole at s=0 of the Shahidi degree-eight spin L-factor. In this event its G₂ lift is irreducible generic supercuspidal. The generic G₂ supercuspidal dichotomy is the precursor already imported in EX.5.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor; ExceptionalThetaCorrespondencesForG2:EX.7/shalika-period; ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems; AutomorphicLFunctionsAndLocalFactors:AL.4.

Proof or construction:

1. Combine the supercuspidal theta–Shalika calculation with the Langlands–Shahidi local coefficient pole calculation, after fixing the Spin₇ eight-dimensional spin representation.

Check: Only Shahidi’s supercuspidal generic factor is used; do not replace it with an unconstructed G₂ LLC factor.

Source: SW, Proposition 4.6, p. 37; Theorem 5.3, pp. 37–38. Savin–Weissman prove that a generic supercuspidal σ of PGSp₆ with trivial central character lifts to G₂ exactly when it has a Shalika functional, the lift then being generic supercuspidal, and that the Shalika functional exists exactly when the spin L-function of σ has a pole at s = 0.

### A generic depth-zero lift example

Target: `ExceptionalThetaCorrespondencesForG2:EX.8/depth-zero-spherical-example` (theorem).

Construct the specific generic depth-zero supercuspidal G₂ representations used in LL §§8.4 and 10.3 whose H lifts are supercuspidal; relate their finite-reductive cuspidal type and first-occurrence calculation. Record the precise residue-field and regular-character conditions of the finite-group calculation before using this as a local globalization input.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. Pass from a regular finite-group cuspidal type to compact induction, compute its exceptional first occurrence and use generic supercuspidal injectivity to identify the H lift.

Check: This example is a target with a finite-group source-verification gap; the p≥5 hypothesis of the different GS04 example cannot supply an all-primes theorem.

Sources:

- LL, §8.4, pp. 24–25; §10.3, pp. 29–30: Gan–Savin use generic depth-zero supercuspidals of G₂ whose lifts to PGSp₆ are generic supercuspidal, citing Gan's exceptional correspondence over finite fields for their existence.
- GS04, §12, p. 807: Gan–Savin 2004 give a separate depth-zero example under p ≥ 5, which does not supply the representations used here (gap G5).

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G4: Rank-one reducibility source chain ExceptionalThetaCorrespondencesForG2/G5: Finite-field cuspidal labels and examples ExceptionalThetaCorrespondencesForG2/G12: Savin–Weissman supercuspidal and spin-factor proof audit Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.1, ExceptionalThetaCorrespondencesForG2:EX.3, ExceptionalThetaCorrespondencesForG2:EX.5, ExceptionalThetaCorrespondencesForG2:EX.6, ExceptionalThetaCorrespondencesForG2:EX.7 The Langlands–Shahidi spin factor of PGSp₆ and the Saito–Kurokawa lift τ\_ρ, requested from Part IIs of AutomorphicLFunctionsAndLocalFactors and MetaplecticAutomorphicForms.

## EX.9. Quaternion relative models

Construct pointwise quaternion stabilizers and full-rank Siegel coefficients; deduce relative quotients, supercuspidal embeddings, the Steinberg relative discrete summand and compact-real SU₂ fixed vectors.

Dependencies: ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.8; MetaplecticAutomorphicForms:MP.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.3; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components; tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-6-branching-rules-and-gelfand-tsetlin-bases; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly.

### Quaternion pointwise stabilizers

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer` (definition).

For a characteristic-zero local field and an octonion algebra O, let D⊂O be a quaternion subalgebra. Define GD as its pointwise stabilizer in Aut(O); the Cayley–Dickson decomposition identifies GD with SL₁(D). All embeddings of a fixed D in O are conjugate. Its setwise stabilizer is the larger SO₄ form; never use that group in place of GD.

Hypotheses: F is a characteristic-zero local field, including R; O is an octonion algebra over F and D⊂O a quaternion algebra.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components.

Proof or construction:

1. Use O=D⊕D·u with its Cayley–Dickson multiplication to calculate automorphisms fixing D pointwise; apply the extension theorem for quaternion embeddings.

API:

- `quaternion_stabilizer_equiv`: GD≅SL₁(D), with its action on D⊥ given by the norm-one parameter in Cayley–Dickson coordinates.
- `quaternion_stabilizer_conjugate`: Conjugate embeddings give conjugate subgroups and equivalent relative regular representations.
- `quaternion_stabilizer_setwise`: GD is the kernel of restriction from the setwise stabilizer to Aut(D).

Discriminating tests:

- `quaternionStabilizer_split` (computation): For D=M₂(F), GD≅SL₂(F), which is noncompact for nonarchimedean F.
- `quaternionStabilizer_division_compact` (characterisation): For division D over a nonarchimedean F, GD is compact.
- `quaternionStabilizer_real` (non-example): For the real division octonions and D=Hamilton quaternions, GD is SU₂, not SO₄.

Uses:

- LL Lemmas 10.1–10.4: Produce local relative models for the period globalization input.
- LL Corollary 10.6: Unfold the global GD period in the exceptional theta integral.

Check: D is quaternion here; it is unrelated to the degree-three division algebra of EX.5.

Source: LL, §10.1, p. 27. Gan–Savin take the pointwise stabilizer G\_D of a quaternion subalgebra D of the octonions and identify it with the norm-one group of D.

Planet: Quaternion stabilizers.

### Siegel character orbits and quaternion coefficients

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients` (theorem).

For H=PGSp₆, the open orbits of its Siegel Levi M₃ on the character space of N₃ are indexed by quaternion F-algebras D. The stabilizer of a representative ψD is Aut(D). For Π\_E7 restricted to Aut(O)×H, Π\_(N₃,ψD)=c-Ind\_GD^Aut(O)1 when D embeds in O and is zero otherwise.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer; ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; SmoothRepresentationsOfLocalGroups:SR.2/compact-induction.

Proof or construction:

1. Classify nondegenerate ternary symmetric forms up to the actual M₃ similitude action and identify their even Clifford quaternion algebra.
2. In the rank-one Albert model identify the ψD fiber with embeddings of D in O; use the pointwise stabilizer, not Aut(D), on the G₂ side.

Check: The Levi stabilizer and the G₂ coefficient stabilizer are different groups.

Sources:

- LL, §10.1, p. 27: Gan–Savin state that the Siegel Levi of PGSp₆ has open orbits on characters of the Siegel radical indexed by quaternion algebras D, with stabilizer Aut(D), and that the corresponding twisted Jacquet module of the E₇ minimal representation is compactly induced from G\_D (packet E19 for the omitted orbit label).
- GrS, Chapter 5, §3, Lemma 3.4 and case (4) of its proof, pp. 197–198: Gross–Savin show that the rational points of G act transitively on the rank-one elements of the relevant type with stabilizer the norm-one group of D; Gan–Savin cite case (4) of the proof for the local identification of the twisted Jacquet module with compact induction from G\_D.

Planet: Quaternion Fourier coefficients.

### Tempered lifts have quaternion relative models

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/tempered-relative-quotient` (theorem).

If θH(π) is nonzero tempered, then for some quaternion D⊂O the representation π is a quotient of c-Ind\_GD^G1. A tempered H representation has a nonzero full-rank Siegel coefficient: otherwise its restriction to Sp₆ has rank at most two and belongs to a classical O(m) theta image with m≤2, which is non-tempered.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients; ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems; MetaplecticAutomorphicForms:MP.3.

Proof or construction:

1. Import the full low-rank unitary classification including ranks zero and one, obtain a nonzero open-orbit coefficient, then take the corresponding coefficient of the theta quotient and apply the explicit minimal fiber.

Check: The rank-at-most-two argument must not assume exact rank two.

Sources:

- LL, Lemma 10.1 and proof, p. 27: Gan–Savin prove that if θ(π) is tempered then π is a quotient of compact induction from G\_D for some quaternion D, because a tempered PGSp₆ representation with no full-rank Siegel coefficient would have Howe N-rank at most two and come from a small orthogonal group by Li's classification (packet E20 for 'at most two').
- GrS, Chapter 5, §3, Lemma 3.4 and case (4) of its proof, pp. 197–198: The orbit and stabilizer computation that Gan–Savin cite for the twisted Jacquet module used in the proof.

### Supercuspidal relative embeddings

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/supercuspidal-relative-submodule` (theorem).

If π is supercuspidal with θH(π)≠0, then π embeds in c-Ind\_GD^G1 for a suitable quaternion D⊂O. Tempered compatibility supplies the relative quotient and supercuspidal projectivity for the compact-center group splits it.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.9/tempered-relative-quotient; SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting; ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems.

Proof or construction:

1. Use the quotient theorem and split in the relevant supercuspidal block; record the central-character category in which projectivity is used.

Check: This splitting does not claim projectivity for arbitrary discrete series.

Source: LL, Corollary 10.2 and proof, p. 27. Gan–Savin deduce, by projectivity of supercuspidals, that a supercuspidal π with nonzero lift is a submodule of compact induction from G\_D for some D.

### The Steinberg relative discrete summand

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/steinberg-relative-square-integrability` (theorem).

For split p-adic G₂ and division quaternion D, St\_G₂ is a Hilbert direct summand of L²(GD∖G₂). Its H lift is St\_H, whose restriction to a maximal unipotent has the required regular model; hence its ψD Siegel coefficient is nonzero. Since GD is compact, a GD-fixed vector and square-integrable matrix coefficients give the closed relative embedding.

Hypotheses: Local convention: F is a nonarchimedean local field of characteristic zero, coefficients are complex, and ψ is a fixed nontrivial unitary additive character, unless a different field is specified.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table; SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered; SmoothRepresentationsOfLocalGroups:SR.3.

Proof or construction:

1. Import the precise Steinberg-unipotent regular restriction, obtain a nonzero GD period from the minimal coefficient, and realize the relative embedding by matrix coefficients; use square integrability and unitarity to split it.

Check: Compactness of GD is essential to the displayed Hilbert argument.

Source: LL, Lemma 10.3 and proof, pp. 27–28. Gan–Savin show that for a division quaternion D the Steinberg representation is a direct summand of L²(G\_D∖G), using that its lift is the Steinberg representation of PGSp₆, the restriction of Steinberg to a maximal unipotent subgroup, and the anisotropy of G\_D.

Planet: The relative Steinberg summand.

### Every compact real G₂ representation has an SU₂ period

Target: `ExceptionalThetaCorrespondencesForG2:EX.9/compact-real-relative-model` (theorem).

For the compact real G₂ and a Hamilton quaternion subalgebra, every irreducible finite-dimensional representation has a nonzero GD≅SU₂-fixed vector and embeds in L²(GD∖G₂).

Hypotheses: The field is R and O is the division octonion algebra.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer; tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-6-branching-rules-and-gelfand-tsetlin-bases.

Proof or construction:

1. Restrict to the compact long-root SU₃. For a highest weight λ₁≥λ₂≥λ₃, the U₂ interlacing weight (λ₂,λ₂) occurs; its restriction to SU₂ is trivial. Apply Peter–Weyl to the resulting fixed vector.

Check: This imports the algebraic/compact Gelfand–Tsetlin rule and is distinct from p-adic GL₃↓GL₂ generic restriction.

Source: LL, Lemma 10.4 and proof, p. 28. Gan–Savin show that every irreducible representation of the compact real G₂ has nonzero vectors fixed by the stabilizer of the real quaternion division algebra, hence embeds in L² of the quotient, by branching through SU₃ and SU₂.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G1: Octonion algebraic comparison and rational descent Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.8 Howe’s N-rank and Li’s low-rank classification for Sp₆ and the Steinberg restriction to a maximal unipotent, requested from Part IIs of MetaplecticAutomorphicForms and SmoothRepresentationsOfLocalGroups.

## EX.10. Global exceptional lifts and real matching

Construct the exceptional global pair and minimal Eisenstein residue, define the convergent global kernel, prove period and generic nonvanishing with the stated cuspidality conditions, and specify the real central-character matching needed downstream.

Dependencies: AutomorphicFormsOnReductiveGroups:AF.1; AutomorphicFormsOnReductiveGroups:AF.2; AutomorphicFormsOnReductiveGroups:AF.3; AutomorphicSpectralTheory:AS.1; AutomorphicSpectralTheory:AS.2; ExceptionalThetaCorrespondencesForG2:EX.0; ExceptionalThetaCorrespondencesForG2:EX.2; ExceptionalThetaCorrespondencesForG2:EX.6; ExceptionalThetaCorrespondencesForG2:EX.8; ExceptionalThetaCorrespondencesForG2:EX.9; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly.

### The global Albert E₇ pair

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair` (theorem).

For a number field k and octonion O/k, use the existing Albert algebra J₃(O) and Koecher–Tits construction to form the adjoint group E(O) of absolute type E₇, containing Aut(O)×PGSp₆. For totally real k and totally definite O it has k-rank 3 and compact G at every real place; for split O the ambient group is split E₇ of rank 7. Construct the global embeddings and their compatibility with every local model.

Hypotheses: k is a number field; O/k is an octonion algebra.

Inputs: tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly; tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ; ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs; AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product; tauceti:TauCeti.AlbertAlgebra.

Proof or construction:

1. For split O start from the split Albert algebra carrier TauCeti.AlbertAlgebra (its Jordan identity is a LieHighestWeight Layer 8 target) and the split E₇ Lie algebra of that layer; for a totally definite O over a totally real k construct J₃(O), its Koecher–Tits group and the commuting action of Aut(O) × PGSp₆ here.
2. Determine the commuting action on the off-diagonal entries, compare root lattices and localizations, and compute the k-rank from the definite octonion norm.

Check: The rank-three assertion belongs to the totally definite case; it is not asserted for the split global pair.

Sources:

- LL, §10.2, pp. 28–29: Gan–Savin take a totally real field and a totally definite octonion algebra, form the adjoint group of type E₇ and k-rank 3 attached to J₃(O) by the Koecher–Tits construction, and use the dual pair G × PGSp₆ inside it (packet E19 for the definiteness hypothesis).
- HKT, Appendix A.2, p. 24: Savin's appendix constructs split adjoint E₇ from the split Albert algebra by the Koecher–Tits construction and describes its Siegel parabolic.

Planet: The global exceptional pair.

### The global minimal residual representation

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-minimal-residue` (theorem).

For the rank-three Jordan E₇ family with r=3,d=8 in Hanzer–Savin normalization, the spherical degenerate Eisenstein family has simple poles at s=1,5,9; the residue at s=5 gives the nonzero square-integrable minimal automorphic representation, while s=9 gives the trivial constituent. Construct its adelic realization and identify its local components with the chosen minimal representations, including ramified and real forms.

Hypotheses: k is a number field and the Jordan rank-three E₇ family is as in HS §6.2; use its normalized induction parameter.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; AutomorphicSpectralTheory:AS.1/eisenstein-convergence; AutomorphicSpectralTheory:AS.2/eisenstein-continuation; AutomorphicSpectralTheory:AS.2/residue-calculus; AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation.

Proof or construction:

1. Use the Jordan Gindikin–Karpelevich calculation for all constant terms and the cancellation analysis in Theorem 6.4 to prove nonzero simple residue at 5.
2. Apply the residual square-integrability criterion and identify the local spherical subquotients; verify the non-spherical local realization required by the kernel.

Check: The minimal residue is at 5 in this normalization; calling the last pole 9 minimal is incorrect.

Sources:

- HS, §6.2, Theorem 6.4 and proof, pp. 198–200: Hanzer–Savin show that for J\_r(D) with d ≡ 0 mod 4 (automatic for r ≥ 3) the degenerate Eisenstein series has simple poles at 1, 1 + d/2, …, 1 + (r−1)d/2 with square-integrable residues equal to the co-socle of the degenerate principal series; for r = 3, d = 8 these are 1, 5, 9.
- HS, §4.1, Lemma 4.1, Corollary 4.2 and Proposition 4.3, pp. 190–191; remark after Corollary 4.6, p. 192; proof of Proposition 6.3, p. 197: Hanzer–Savin compute the local c-function and reducibility points of the degenerate series, describe the spherical quotients, identify the quotient at 1 + (r−2)d/2 as a minimal representation in the quaternion case d = 4, and identify the trivial representation as the residue at the last pole. The identification of the minimal residue at 5 for d = 8 is part of gap G13.
- LL, §10.2, p. 29: Gan–Savin take the global minimal representation of the rank-three E₇ from Hanzer–Savin Theorem 6.4.

Planet: The minimal Eisenstein residue.

### The global exceptional theta lift

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-theta-kernel` (construction).

For a cusp form φ on G=Aut(O) and f in the global minimal automorphic representation, define Θ(f,φ)(h)=∫\_[G] f(gh)overline(φ(g))dg. Prove absolute convergence, smoothness, automorphy, moderate growth and compatibility with the local theta quotient at every place. In the anisotropic case [G] is compact; for split G prove the estimates from cusp-form rapid decay and the minimal kernel’s growth. Define the global lift as the span of these functions, not as a presumed irreducible representation.

Hypotheses: k is a number field; φ is a cuspidal automorphic form with the fixed unitary central conventions and f is a smooth automorphic minimal vector.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair; ExceptionalThetaCorrespondencesForG2:EX.10/global-minimal-residue; AutomorphicFormsOnReductiveGroups:AF.2/automorphic-form; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form-rapid-decay; AutomorphicFormsOnReductiveGroups:AF.3/anisotropic-cuspidal; AutomorphicFormsOnReductiveGroups:AF.2/restricted-tensor-product.

Proof or construction:

1. Use reduction theory to dominate the kernel by a fixed polynomial on Siegel sets, integrate against arbitrary rapid-decay order, and differentiate under a uniform integrable bound. Compare adelic translation with the local quotient universal property.

API:

- `globalTheta_equivariance`: Right G and H translation gives the bilinear equivariant map from the minimal module and the contragredient cuspidal input.
- `globalTheta_local_occurrence`: Every irreducible automorphic constituent of a nonzero global lift has local constituents in the corresponding local exceptional theta module.
- `globalTheta_fourier_unfold`: The full-rank Siegel and generic Whittaker coefficients unfold to the explicit local orbit integrals and global periods with compatible measures.

Discriminating tests:

- `globalTheta_zero` (degenerate): The lift vanishes for a zero input; bilinearity is linear in f and conjugate-linear in φ.
- `globalTheta_anisotropic_convergence` (characterisation): For totally definite O the compact quotient supplies absolute convergence without a truncation term.
- `globalTheta_local_obstruction` (compatibility): If one local exceptional theta module of an irreducible cuspidal input is zero, no nonzero global theta constituent can occur.

Uses:

- LL Corollary 10.6: Produce a nonzero cuspidal H lift from a global quaternion period.
- HKT Theorem A.9: Produce a globally generic lift from a globally generic G₂ cusp form.

Check: A classical global oscillator integral does not define this exceptional kernel.

Sources:

- GrS, Chapter 5, introduction, (0.1)–(0.2), pp. 193–194; §§3–4, pp. 196–204: Gross–Savin define the global lift from the anisotropic G₂ over ℚ to the rank-three E₇ partner by integrating an automorphic form against Kim's automorphic realization of the minimal representation, note convergence over the compact quotient, and compute its Fourier coefficients and cuspidality.
- HKT, Appendix A.8–A.10, pp. 27–30: Savin's appendix defines the global lift for split G₂, notes absolute convergence from the cusp-form decay and moderate growth of the output, and unfolds its Whittaker coefficient.

Planet: The global exceptional theta lift.

### A quaternion period forces global nonvanishing

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-period-nonvanishing` (theorem).

For totally real k and totally definite O, a cuspidal automorphic representation of G with nonzero GD period for some quaternion D⊂O has a nonzero exceptional global H lift. Prove the extension from the Q setting of Gross–Savin to this k setting by unfolding a full-rank Siegel coefficient of the kernel and choosing factorizable local test functions with nonzero orbit integrals.

Hypotheses: k is totally real, O is totally definite, and an automorphic G representation has a nonzero GD period.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-theta-kernel; ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients; ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer; AutomorphicFormsOnReductiveGroups:AF.3/anisotropic-cuspidal.

Proof or construction:

1. Identify the rational orbit of quaternion embeddings and its stabilizer, unfold over GD(k)∖G(k), and use compactness/convergence to interchange the integral and orbit sum. Replace the rational-number arithmetic choices by their number-field versions explicitly.

Check: A bare statement that the Q proof is unchanged does not establish the number-field extension.

Sources:

- GrS, Chapter 5, §4, Proposition 4.5 and proof, p. 200: Gross–Savin show over ℚ that a nonzero period over the centralizer of a quaternion subalgebra is equivalent to the nonvanishing of the corresponding Fourier coefficient of the global lift.
- LL, Corollary 10.6 and proof, p. 29: Gan–Savin apply this over a totally real field to obtain nonzero global lifts; the node records the extension from ℚ as an obligation (gap G13).

### Cuspidality from Steinberg or regular compact weight

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-cuspidality-criteria` (theorem).

In the setting of the preceding period theorem, the nonzero global lift is cuspidal if its G input has a Steinberg component at one finite place or has regular highest weight at one real place. Prove both alternatives by calculating every proper H constant term; the real condition is regularity, not merely a nontrivial real representation.

Hypotheses: k is totally real, O totally definite, and the GD period on the input representation is nonzero.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-period-nonvanishing; ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-theta-kernel; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table; AutomorphicFormsOnReductiveGroups:AF.3/constant-term; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form; ExceptionalThetaCorrespondencesForG2:EX.9/compact-real-relative-model.

Proof or construction:

1. Compute the three maximal-parabolic constant terms using the global minimal representation and the associated lower lifts. In the finite-place case use Steinberg Jacquet exponents; in the real case use the compact highest-weight condition to kill all lower lift contributions.

Check: Verify all three maximal constant terms and the extension from Q to totally real k.

Sources:

- LL, Corollary 10.6 and proof, p. 29: Gan–Savin state that the global lift is cuspidal if the input has a Steinberg component at a finite place or regular highest weight at a real place.
- GrS, Chapter 5, §4, Corollary 4.9 and proof, pp. 203–204: Gross–Savin prove the corresponding cuspidality statement over ℚ.

### Generic global nonvanishing

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/global-generic-lift` (theorem).

For split G₂ over a number field k, every globally ψ-generic cuspidal input has a nonzero globally generic exceptional lift to PGSp₆. If one finite component is supercuspidal and its local H lift is supercuspidal, the global lift is cuspidal. This is a theta theorem for an existing automorphic input; it does not reproduce the separate globalization or G₂ LLC construction.

Hypotheses: k is a number field; G₂ is split; the input is a globally generic cuspidal automorphic representation.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-theta-kernel; ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers; ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts; AutomorphicFormsOnReductiveGroups:AF.3/constant-term; AutomorphicFormsOnReductiveGroups:AF.3/cusp-form.

Proof or construction:

1. Unfold the generic H coefficient to the nonzero G₂ Whittaker coefficient using the rank-one Albert orbit.
2. Use the unramified spherical calculation outside a finite set and compactly supported local choices inside it to make the unfolded integral nonzero.
3. At the designated finite place local supercuspidality kills the proper H constant terms and gives cuspidality.

Check: The local supercuspidal-lift condition is required for the cuspidality clause.

Sources:

- HKT, Theorem A.9 and Lemma A.10, pp. 28–30: Savin's appendix shows that a cusp form on split G₂ with nonzero Whittaker coefficient has a global lift with nonzero Whittaker coefficient, using the unramified local computation of Lemma A.10.
- LL, §10.3, proof of Lemma 10.8, p. 30: Gan–Savin use this together with a supercuspidal local lift to obtain globally generic cuspidal lifts.

Planet: Generic global nonvanishing.

### Real infinitesimal-character matching

Target: `ExceptionalThetaCorrespondencesForG2:EX.10/real-infinitesimal-character-matching` (theorem).

For the real exceptional G₂×PGSp₆ dual pair in E₇, construct the map on Harish–Chandra central characters induced by the minimal representation and prove that every occurring real theta pair has matched infinitesimal characters. Give its weight-coordinate formula with the chosen positive roots and ρ shifts. Combined with the imported unitary-dual theorem sufficiently far from the walls, this implies discrete-series real H components for the global input used in LL §8.4.

Hypotheses: The field is R and the local minimal representation is the real E₇ model for the stated dual pair.

Inputs: ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair; ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models; ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings; AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character; AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization; AutomorphicFormsOnReductiveGroups:AF.1.

Proof or construction:

1. Compute the two centers in the annihilator quotient of the real minimal Harish–Chandra module; compare the Cartan polynomials and the ρ-shifted parameters. Import the appropriate real unitary-dual isolation theorem only after checking its good-range bound.

Check: The exact central-character map and distance-from-walls bound remain source-verification gaps; no unverified coordinate formula is inserted.

Source: LL, §8.4, p. 25. Gan–Savin invoke the matching of infinitesimal characters for the real dual pair (citing Huang–Pandžić–Savin) and the fact that unitary representations with discrete-series infinitesimal character sufficiently far from the walls are discrete series.

Stage status: planned. ExceptionalThetaCorrespondencesForG2/G2: Primary minimal-model inputs not obtained ExceptionalThetaCorrespondencesForG2/G13: Global residue and number-field unfolding ExceptionalThetaCorrespondencesForG2/G14: Real central-character source and range Discharge the exact supplier contracts and inherited open obligations before closing this stage. Inherited own-stage inputs: ExceptionalThetaCorrespondencesForG2:EX.0, ExceptionalThetaCorrespondencesForG2:EX.2, ExceptionalThetaCorrespondencesForG2:EX.6, ExceptionalThetaCorrespondencesForG2:EX.8, ExceptionalThetaCorrespondencesForG2:EX.9 Salamanca-Riba’s range theorem, requested from the AutomorphicFormsOnReductiveGroups Part II.

## Supplier contracts

A request is a proof boundary, not a claim that the supplier has already been implemented. Exact supplier nodes are cited directly in the targets; each stage request below says what the supplier states as it stands at its pull-request head and what is requested from an undesigned Part II.

- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`: Cited as it stands (TauCetiRoadmap pull request #785, head 1e875b1): SR.0.2, the abelian category of smooth complex representations, and SR.0.4, admissibility, smooth vectors and smooth contragredients. Nothing beyond these is needed. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models`, `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules`.
- `SmoothRepresentationsOfLocalGroups:SR.2a`: Cited as it stands (TauCetiRoadmap pull request #785, head 1e875b1): SR.2a.1, second adjointness over ℂ. Requested from "Smooth representations of local groups, Part II" (not yet designed), because the upstream README does not state it: for connected reductive G and H over F, a parabolic P = MN of G, a smooth representation W of H × M and an irreducible smooth τ of H with maximal τ-isotypic quotient τ ⊗ V of W, the maximal τ-isotypic quotient of the normalized induction I\_P^G(W) is τ ⊗ I\_P^G(V) (Gan–Gurevich Lemma 9.4, pp. 34–36). No Ext¹ hypothesis on τ is needed. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward`, `ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse`, `ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness`.
- `SmoothRepresentationsOfLocalGroups:SR.2`: Cited as it stands (TauCetiRoadmap pull request #785, head 1e875b1): SR.2.1, smooth and compact induction with Frobenius reciprocity. Requested from "Smooth representations of local groups, Part II" (not yet designed): for closed H ⊂ G, a smooth H × L-module W and irreducible τ of L with Ext¹\_L(τ, τ) = 0, the maximal τ-isotypic quotient of c-Ind\_H^G W is c-Ind\_H^G of that of W (GS Lemma 11.6, p. 37, proved there from the decomposition of K-invariants of c-Ind\_H^G W over the double cosets H∖G/K); and Ext¹(1, 1) = 0 for smooth complex representations of PGL₂(F), which holds because PGL₂(F) has no nonzero continuous homomorphism to ℂ. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber`.
- `SmoothRepresentationsOfLocalGroups:SR.3`: Cited as it stands (TauCetiRoadmap pull request #785, head 1e875b1): SR.2.3 whittaker-functionals (Whittaker functionals, twisted coinvariants, and multiplicity one for GL₂ only) and SR.3.4 steinberg. The general-linear case of Whittaker multiplicity one is AutomorphicLFunctionsAndLocalFactors, generic finite-place newforms. Requested from "Smooth representations of local groups, Part II" (not yet designed), since neither upstream README states them: (a) multiplicity one of Whittaker functionals for irreducible smooth representations of quasi-split groups over F, applied to G₂, PGSp₆ and PGL₃ ⋊ Z/2Z; (b) Prasad’s theorem on generic GL₂ quotients of generic GL₃ representations (Prasad 1993, Theorem 3, p. 174, as cited in GS Proposition 8.4); (c) the Mœglin–Waldspurger comparison of degenerate Whittaker models with the leading terms of the Harish-Chandra–Howe character expansion, with Varma’s extension to residue characteristic 2 (as cited in GS Lemma 3.4); (d) the restriction of the Steinberg representation to a maximal unipotent subgroup used in the proof of LL Lemma 10.3; (e) the Harish-Chandra–Silberger criterion: for a maximal parabolic and unitary supercuspidal inducing data, reducibility of I\_P(s, τ) at real s ≠ 0 occurs exactly at the poles of the rank-one Plancherel measure. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness`, `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1`, `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-minus-supercuspidal`, `ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-uniqueness`, `ExceptionalThetaCorrespondencesForG2:EX.9/steinberg-relative-square-integrability`, `ExceptionalThetaCorrespondencesForG2:EX.8/depth-zero-spherical-example`.
- `MetaplecticAutomorphicForms:MP.2`: Cited as it stands (TauCetiRoadmap pull request #1063, head f91c5dd): §§0.15–0.17 (Schrödinger models), §1.1 (smooth Stone–von Neumann), §§2.4a–2.5 (Rao factor set, metaplectic double cover, genuine Weil representation and its operator formulas) and §2.7 (change of additive character). Consumers: `ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models`, `ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period`, `ExceptionalThetaCorrespondencesForG2:EX.7/root-exchange`, `ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber`.
- `MetaplecticAutomorphicForms:MP.3`: Cited as it stands (TauCetiRoadmap pull request #1063, head f91c5dd): §3.38a, the restriction of the Mp₂ × SO₇ oscillator to Mp₂ × G₂ with its Jacquet exact sequence and the injectivity, nonvanishing and irreducibility of its supercuspidal lifts (Gan–Gurevich Proposition 8.1 and Theorem 9.1(c,d)); §§3.39–3.40 (the minimal orthogonal lift and the division ternary lift σ\_ρ). Requested from "Metaplectic groups, Weil representations and automorphic theta kernels, Part II" (not yet designed), since the upstream README does not state them: (a) the lift τ\_ρ of σ\_ρ to SO₅ ≅ PGSp₄ is a nongeneric supercuspidal representation in a Saito–Kurokawa packet, with the ψ of GS §15.1; (b) Howe’s N-rank for the Siegel unipotent radical of Sp₆ and Li’s classification: an irreducible unitary representation of Sp₆(F) of N-rank at most two is a classical theta lift from an orthogonal group O(m) with m ≤ 2, and is not tempered (LL proof of Lemma 10.1). Consumers: `ExceptionalThetaCorrespondencesForG2:EX.6/mixed-mp2-g2-module`, `ExceptionalThetaCorrespondencesForG2:EX.8/rho-supercuspidal-family`, `ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison`, `ExceptionalThetaCorrespondencesForG2:EX.9/tempered-relative-quotient`.
- `ModularityAndLanglandsExtensions:ML.4`: Cited as it stands (TauCetiRoadmap pull request #1180, head c316a1b): §3.5, the Gan–Takeda local Langlands correspondence for GSp₄, including part (vi) (the Plancherel measures of a nongeneric supercuspidal agree with those of its parameter) and the standard five-dimensional parameter. Nothing beyond §3.5 is requested. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1`, `ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison`.
- `AutomorphicLFunctionsAndLocalFactors:AL.4`: AL.4 (TauCetiRoadmap pull request #924, head 4ed76a2) states unramified L-group factors only, cited for the unramified degree-eight spin factor. Requested from "Automorphic L-functions and local factors, Part II" (not yet designed): the Langlands–Shahidi local coefficient and the resulting spin γ-, L- and ε-factors of generic representations of PGSp₆ for the degree-eight representation of Spin₇, with the additive-character normalization, and the criterion of Savin–Weissman Theorem 5.3 relating a pole at s = 0 to Shalika functionals for generic supercuspidals. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.8/spin-pole-criterion`.
- `AutomorphicFormsOnReductiveGroups:AF.1`: Cited as it stands (TauCetiRoadmap pull request #1037, head dc45964): infinitesimal characters, Casselman–Wallach globalization and the unitarity of A\_q(λ) in the weakly fair range. Requested from "Automorphic forms on reductive groups, Part II" (not yet designed): Salamanca-Riba’s theorem that an irreducible unitary (𝔤, K)-module whose infinitesimal character is real, integral and sufficiently regular is an A\_q(λ), in the form used by LL §8.4 (a unitary representation with discrete-series infinitesimal character far enough from the walls is a discrete series), with an explicit bound. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.10/real-infinitesimal-character-matching`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`: The topological local Weil group, its degree map and Frobenius elements, cited as they stand. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`: Algebraic centralizers and stabilizer subgroup schemes, component groups and central quotients, cited as they stand; the rational-point descent with its H¹ obstruction is carried out where used here. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group`, `ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers`, `ExceptionalThetaCorrespondencesForG2:EX.0/component-groups`, `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs`, `ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw`, `ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`: Pinned split Chevalley–Demazure group schemes, root subgroup maps and base change, cited as they stand; the exceptional comparisons are constructed here. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group`, `ExceptionalThetaCorrespondencesForG2:EX.0/parabolics`, `ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers`, `ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry`, `ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent`, `ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal`, `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs`, `ExceptionalThetaCorrespondencesForG2:EX.8/depth-zero-spherical-example`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-6-branching-rules-and-gelfand-tsetlin-bases`: The GLₙ ↓ GLₙ₋₁ interlacing branching rule for rational representations, cited as it stands; this roadmap restricts it to SU₃ ⊃ SU₂ by Zariski density of SU₃ in SL₃(ℂ). Consumers: `ExceptionalThetaCorrespondencesForG2:EX.9/compact-real-relative-model`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-8-the-exceptional-lie-algebras-explicitly`: The split octonions, G₂ = Der(𝕆) with its 7-dimensional representation, the split Albert algebra, and the E₆ and E₇ Lie algebras with their 27- and 56-dimensional representations, as Lie-algebra constructions over a field of characteristic zero, cited as they stand. The Freudenthal–Jordan family of EX.2, the Lie algebras g\_J, the twisted forms and the group-level comparisons are constructed here. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group`, `ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry`, `ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal`, `ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics`, `ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-4-the-spin-and-half-spin-representations`: The spin and half-spin representations with their highest weights, cited as they stand. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings`, `ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics`, `ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈`: The triality automorphism of Spin₈ and its permutation of the three 8-dimensional representations, cited as they stand; the cubic-étale twist Spin₈^E and the exceptional see-saw are constructed here. Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings`, `ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw`.

## Open obligations

All targets are present. Closure requires the following proof/source work and the supplier contracts above.

### ExceptionalThetaCorrespondencesForG2/G1. Octonion algebraic comparison and rational descent

The pinned library supplies the split Zorn algebra, but not its represented automorphism group, the Chevalley comparison, or the nonsplit quaternion descent used globally. Carry out the basis/root calculations and check rational centralizers; the API and discriminating tests specify the required result.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group`, `ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces`, `ExceptionalThetaCorrespondencesForG2:EX.0/parabolics`, `ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers`, `ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer`, `ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs`, `ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw`.

### ExceptionalThetaCorrespondencesForG2/G2. Primary minimal-model inputs not obtained

HKT A.4 provides the rank-one exact sequence but refers to earlier minimal-model constructions. The primary Gan–Savin 2005 model paper and the division Rumelhart input were not obtained; prove or audit the Weyl relations, unitarity, irreducibility and all local model comparisons before closing the minimal representation target.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models`, `ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-minimal-residue`.

### ExceptionalThetaCorrespondencesForG2/G3. Residual-characteristic wavefront argument

GS Lemma 3.4 invokes wavefront and degenerate-character results. A full proof with exact source hypotheses, especially p=2,3, still needs to establish subregular maximality and finite cubic multiplicity; no all-primes theorem is claimed as already supplied.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness`, `ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness`, `ExceptionalThetaCorrespondencesForG2:EX.4/weak-existence`, `ExceptionalThetaCorrespondencesForG2:EX.4/cubic-period-chain`.

### ExceptionalThetaCorrespondencesForG2/G4. Rank-one reducibility source chain

The rank-one intertwining and R-group arguments for the complete G₂ and PGSp₆ tables need their cited primary reducibility proofs (Muić for G₂, Shahidi and Gan–Takeda for the PGSp₆ Levis) with exact normalized exponents. For the nongeneric τ\_ρ the route is fixed: Gan–Takeda part (vi) (ModularityAndLanglandsExtensions §3.5) gives its Plancherel measure, and the Harish-Chandra–Silberger criterion (requested from the SmoothRepresentationsOfLocalGroups Part II) turns it into reducibility; what remains is to carry out that comparison.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal`, `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg`, `ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters`, `ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal`, `ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments`, `ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel`, `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13`, `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p3`, `ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1`, `ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts`.

### ExceptionalThetaCorrespondencesForG2/G5. Finite-field cuspidal labels and examples

Verify the cuspidal unipotent character tables behind πsc[1],πsc[ω],πsc[ω²], and Gan’s regular finite-field construction behind the generic depth-zero example. Fix ranges in q,p and the two distinct cubic eigenvalue labels; the unrelated GS04 p≥5 example does not close this.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent`, `ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing`, `ExceptionalThetaCorrespondencesForG2:EX.8/depth-zero-spherical-example`.

### ExceptionalThetaCorrespondencesForG2/G6. Triality structure and omitted Mackey proof

Supply the primary degenerate-intertwiner proof of both triality exact sequences, and the full orbit/stabilizer/modulus calculation of GS Proposition 5.4. The source states that Mackey calculation without details.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.4/spin8-degenerate-series`, `ExceptionalThetaCorrespondencesForG2:EX.4/spin8-constituents`, `ExceptionalThetaCorrespondencesForG2:EX.4/triality-mackey`, `ExceptionalThetaCorrespondencesForG2:EX.4/triality-restriction-hom`.

### ExceptionalThetaCorrespondencesForG2/G7. Schwartz Ext supplier obligations

The exact imported smooth-to-Schwartz Ext comparison and tempered discrete-series projectivity carry their supplier’s unresolved Schwartz-analysis obligation. Preserve its hypotheses and prove vanishing in the full smooth category by comparison; do not assert all-smooth projectivity of discrete series.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.4/division-ext-vanishing`, `ExceptionalThetaCorrespondencesForG2:EX.4/cubic-period-chain`, `ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy`.

### ExceptionalThetaCorrespondencesForG2/G8. Exceptional raw coefficient proofs

Supply the disconnected C₂ action on the E₆ Whittaker/cubic/oscillator fibers, and the full E₇ N₂-twisted fiber computation before taking PGL₂ coinvariants. Connected stabilizers do not determine outer signs; GS gives the latter E₇ fiber without proof.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models`, `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels`, `ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber`, `ExceptionalThetaCorrespondencesForG2:EX.7/generic-period-chain`.

### ExceptionalThetaCorrespondencesForG2/G9. Split Jacquet orbit twists

Complete the split Q orbit calculation, the omitted P₁ null-quadruple proof, and the two separate P₂ density calculations. No uniform character δ′ of M₂ gives both printed orbit actions; derive each actual twist directly.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-q-jacquet`, `ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet`, `ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p2-jacquet`, `ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels`.

### ExceptionalThetaCorrespondencesForG2/G10. Reverse exponent cases and both finiteness directions

Write the full seven-Levi chamber table for GS Lemma 13.8 using the second GL₂ factor in P₂ piece three; rerun P₁₂ with exchanged factors. Give all non-top reverse finiteness cases and the A₅ homogeneity character, which the source leaves compressed.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse`, `ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness`, `ExceptionalThetaCorrespondencesForG2:EX.6/a5-sp6-restriction`, `ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility`.

### ExceptionalThetaCorrespondencesForG2/G11. Prime-degree torus distinction primary proof

The public Lonka–Tandon journal abstract and GS Theorem 7.2 give the degree-prime-to-p scope, but the primary proof of Theorem 2.4 was not obtained. Audit it before claiming the all-τ nonvanishing stage closed.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing`.

### ExceptionalThetaCorrespondencesForG2/G12. Savin–Weissman supercuspidal and spin-factor proof audit

The generic dichotomy statement, Proposition 4.6 and Theorem 5.3 were read; the long local-coefficient proof of Theorem 5.3 and the entire earlier supercuspidal injectivity proof were not audited line by line. Finish the primary proof chain with exact Shahidi hypotheses.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor`, `ExceptionalThetaCorrespondencesForG2:EX.8/spin-pole-criterion`, `ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality`.

### ExceptionalThetaCorrespondencesForG2/G13. Global residue and number-field unfolding

Check non-spherical local identification of the minimal residue, all analytic interchanges in the exceptional kernel, and the full-rank coefficient and all three constant terms over a general totally real field. Gross–Savin’s read proof is over Q; its extension needs these explicit arithmetic and measure checks. For d = 8 Hanzer–Savin do not say which residue of Theorem 6.4 is the minimal representation; identify it at s = 5 (their remark on p. 192 does this for d = 4, and the trivial representation is the residue at s = 9).

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.10/global-minimal-residue`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-theta-kernel`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-period-nonvanishing`, `ExceptionalThetaCorrespondencesForG2:EX.10/global-cuspidality-criteria`.

### ExceptionalThetaCorrespondencesForG2/G14. Real central-character source and range

The Huang–Pandžić–Savin primary real correspondence paper was not obtained. Supply its precise central-character polynomial map, shifts and real-form hypotheses; obtain the separate Vogan unitary range theorem before using the claimed discrete-series conclusion.

Consumers: `ExceptionalThetaCorrespondencesForG2:EX.10/real-infinitesimal-character-matching`.

## Mistakes in the sources

The packet’s sourceIssues record the mistakes in the sources that this plan corrects, each checked at its locator by the independent review; the nodes use the corrected statements. They consolidate the confirmed findings of the two paper extractions (PAPER-GAN-SAVIN-23/E1–E52 and PAPER-GAN-SAVIN-23-B/E1–E17).

- E1 (error, GS, arXiv v1 §2.1 p. 6; §2.6 p. 8; §3.4 p. 14): The introductory quadratic-subalgebra sentence lacks the trace-zero restriction; the commuting SL₂ quotient and a short-root label also have inconsistent forms. Correction: Use the trace-zero quadratic identity, the diagonal μ₂ quotient giving SO₄, and the short-root SL₂ in the indicated packet label. Review: Confirmed at GS pp. 6 and 8: the rank statement on p. 6 is for general elements (PAPER-GAN-SAVIN-23/E23), and p. 8 writes SL₂,r for the short-root factor of SO₄ (E1); the short-root label on p. 14 is E2. The extraction review confirmed each.
- E2 (error, GS, arXiv v1 Propositions 3.1–3.2 pp. 9–11): Several character-induced middle terms and Q-standard quotient exponents do not agree with their Borel supports; the negative P point is omitted. Correction: Use the corrected P-character middle term, Q quotient exponent 1, all negative dual points and the Steinberg-twist submodule stated in EX.1. Review: Confirmed at GS pp. 9–11: the cubic middle term I\_P(1/2, st\_χ) and the quotient exponents 1/2 in Propositions 3.1(iii) and 3.2(iii) contradict induction in stages, the ± is missing at 1/2 in 3.1(i), and §3.3 writes s for s₁ (extraction E3, E24–E27, all confirmed).
- E3 (misprint, GS, arXiv v1 §§4.1–4.4 pp. 15–16): The Jordan involution, distinguished unit tensor summand and trialitarian group symbol are inconsistent. Correction: Use the same Jordan involution throughout, F³⊗1\_J in the G₂ embedding, and Spin₈^E for the cubic triality group. Review: Confirmed at GS pp. 15–16: τ for ι in §4.1, F³ ⊗ 1\_J written twice for the dual summand in §4.2, and Spin₄^E for Spin₈^E in diagram (4.1) (extraction E4, E5, E28).
- E4 (gap, GS, arXiv v1 Proposition 5.4 p. 18; Proposition 5.5 pp. 18–19): The orbit proof of the restriction filtration is suppressed and the Q-supercuspidal support application is not stated in its generality needed. Correction: Supply every orbit stabilizer and half-modulus; add the Q-support Hom/Ext vanishing by nonassociation and Bernstein separation. Review: Confirmed at GS p. 18: Proposition 5.4 is stated without proof, and Proposition 5.5 assumes the Q-support case which the proof of Lemma 5.6 does not treat (extraction E20, E35).
- E5 (gap, GS, arXiv v1 Lemma 6.4 and §6.5 p. 21; Propositions 6.6–6.7 p. 22): The selected cubic algebra and contragredient character are not consistently tracked through the period comparison. Correction: For a division lift choose an embedded cubic field using the zero coefficient for nonembeddings; select the dual representation and character so the Hom dimensions match. Review: Confirmed at GS pp. 21–22: §6.5 chooses E for π but applies Lemma 6.4 in the form for π∨, and the lemma silently needs E embedded in J (extraction E33, E34).
- E6 (misprint, GS, arXiv v1 §§7–8 pp. 23–29; §15 pp. 52–55): Several part numbers, cited uniqueness results, group names and generic/degenerate labels do not match the objects being discussed. Correction: Use Theorem 7.2(iii), Lemma 8.1(i), Proposition 6.6 for minus uniqueness, the degenerate minus constituent and H₃ as the target of the reverse E₆ finite-length theorem. Use the anisotropic ternary JL direction in §15. Review: Confirmed at GS pp. 23, 28–29, 52, 54–55: Theorem 7.2 labels its third part (ii) (checked by the review on p. 23), and the part numbers, names and the isotropic/anisotropic slip on p. 54 are as listed in extraction E6–E8, E17–E19, E31, E32, E51, E52.
- E7 (error, GS, arXiv v1 §8.1 p. 24; Theorems 8.2(i) and 8.5(iii) pp. 25,27): The nongeneric selfdual list misses the trivial input, and a generic input is said to have a generic small quotient without a tempered restriction. Correction: Include the trivial plus/minus convention. Restrict generic small-quotient preservation to tempered inputs or an irreducible corresponding standard module; retain the unrestricted converse. Review: Confirmed at GS pp. 24–27: §8.1 omits the trivial representation from the nongeneric self-dual list, and Theorems 8.2(i) and 8.5(iii) assert genericity of θ(τ⁺) for generic nontempered τ, which fails for a reducible generic standard module (extraction E29, E30).
- E8 (gap, GS, arXiv v1 Lemmas 8.1 and 8.3 pp. 24–26): The disconnected E₆ coefficient computations are given without proving the fiber signs. Correction: Compute the pinned outer involution on each Whittaker, cubic and oscillator fiber and identify the full disconnected stabilizer character. Review: Confirmed at GS pp. 24–26: Lemma 8.1 and Lemma 8.3 are summarized as elementary or routine computations without proof (extraction E21).
- E9 (misprint, GS, arXiv v1 proof of Proposition 8.4 p. 27; Proposition 7.1(iii) p. 23): An oscillator additive character is not conjugated in a dual comparison, and the two cubic-character output labels require care. Correction: Use the conjugate-character rank-one oscillator lifts. Identify the two distinct cubic outputs as an unordered pair until the eigenvalue convention is fixed. Review: Confirmed at GS pp. 23 and 27: the proof of Proposition 8.4 uses ρ\_ψ where the dual comparison needs the conjugate character, and Proposition 7.1(iii) assigns π\_sc[χ] and π\_sc[χ²] without the eigenvalue convention of §3.4 (extraction E36, E37).
- E10 (error, GS, arXiv v1 §9 pp. 29–31): The Jordan multiplier, invariant form, root hyperplanes and a similitude description use incompatible coordinate conventions. Correction: Twist ∧²F⁶ by ν⁻¹, use the character-space invariant q(s)=Σsᵢ²+(Σsᵢ)², and use the nine hyperplanes and M₂ similitude action stated in EX.0. Review: Confirmed at GS pp. 29–31; the review re-derived the invariant form: applying the third simple reflection (s₁, s₂, s₃) ↦ (s₁+s₂+s₃, −s₃, −s₂) to Σsᵢ² + c(Σsᵢ)² preserves it only for c = 1, so the printed −¼ (with s₃³) is wrong, and the nine coroot kernels include sᵢ + s₁ + s₂ + s₃ = 0 (extraction E9, E38–E41).
- E11 (gap, GS, arXiv v1 Proposition 10.4 p. 33; Proposition 15.6 pp. 54–55): Generic Shahidi reducibility is used for a nongeneric SK inducing representation. Correction: Prove parameter invariance of the relevant Plancherel scalar or compute the SK rank-one induction directly. Review: Confirmed at GS pp. 31 and 33: Proposition 10.4 rests on Shahidi’s generic theory while being applied to the nongeneric τ\_ρ (extraction E42). The review adds the route through Gan–Takeda part (vi) to EX.1/pgsp-p1.
- E12 (error, GS, arXiv v1 §11.2 pp. 34–36): The oscillator center and one auxiliary root-group filtration are described using the wrong quotient. Correction: Use the center of U/Z(U), and the corrected lower-central root filtration in the root-exchange argument. Review: Confirmed at GS pp. 34 and 36: the centre of U/[U,U] is used for the Heisenberg quotient U/Z(U), and the lower-central filtration in the proof of Lemma 11.3 is misdescribed (extraction E43, E44).
- E13 (gap, GS, arXiv v1 §11.4 p. 37): The E₇ N₂ generic-character module is asserted without an orbit proof. Correction: Construct its rank-one fiber and stabilizer action before applying the compact-induction/isotypic lemma. Review: Confirmed at GS p. 37: the N₂-twisted coefficient of the E₇ minimal representation is asserted without proof (extraction E10).
- E14 (misprint, GS, arXiv v1 Theorem 12.4 p. 39; remark after Proposition 12.2 p. 39): One temperedness reference has the wrong part number, and the previous Shalika uniqueness result is described too broadly. Correction: Use Lemma 6.3(i). Treat the Savin–Weissman uniqueness input as supercuspidal; the remaining tempered case needs the new enhanced-period proof. Review: Confirmed at GS p. 39: the proof of Theorem 12.4(i) cites Lemma 6.3(ii) for 6.3(i), and the remark after Proposition 12.2 overstates the scope of Savin–Weissman’s Shalika uniqueness, which is for supercuspidals (extraction E11, E45).
- E15 (gap, GS, arXiv v1 §13.4 pp. 44–47; Proposition 13.3 p. 41): The split Q orbit calculation and P₁ filtration proof are missing; a single unspecified P₂ twist is used for incompatible strata. Correction: Compute all orbit stabilizer densities separately, retaining the displayed four-piece P₂ filtration. Review: Confirmed at GS pp. 41 and 44–47: the split Q orbit calculation and the P₁ filtration are not proved, and no single character δ′ of M₂ yields both P₂ actions (extraction E13, E47, E50).
- E16 (error, GS, arXiv v1 Lemma 13.8 pp. 47–48; §14.3 p. 51): The reverse calculation takes a Jacquet module on the wrong GL₂ factor and omits several Levi cases and lower finiteness pieces. Correction: Use the second factor in P₂ piece three; redo P₂₃ by its torus exponent and P₁₂ with inducing factors exchanged. Supply every missing chamber and lower piece. Review: Confirmed at GS pp. 47–48 and 51: Lemma 13.8 puts the lower Borel in the first GL₂ factor where Proposition 13.7 has it in the second, and leaves the other Levi cases and the non-top pieces to the reader (extraction E12, E49).
- E17 (misprint, GS, arXiv v1 Propositions 13.3,13.7 and Theorem 14.1 pp. 41,46–49): Some quotient modules, ambient Levi factors, representation letters and similitude labels are interchanged. Correction: Use rQ(Π), the ambient D₅×A₁ Levi, GSp₄ multiplier ν, the actual JP(τ₂) quotient and the pair π⊗σ. Review: Confirmed at GS pp. 41, 44, 46–49: the quotient r\_{P₂}(Π) for r\_Q(Π), the ambient Levi, the GSp₄ similitude, J\_P(τ₁) for J\_P(τ₂) and π ⊗ τ for π ⊗ σ (extraction E14–E16, E46, E48).
- E18 (gap, GS, arXiv v1 Theorems 15.2–15.3 pp. 52–53): The explicit tempered lift table is stated without its constituent-by-constituent derivation. Correction: Use the raw Jacquet support, established nonvanishing, genericity and uniqueness to identify every entry, including all discrete-series GL₂ inputs. Review: Confirmed at GS pp. 52–53: Theorems 15.2 and 15.3 are stated after listing four facts, without the case analysis (extraction E22).
- E19 (misprint, LL, published §3.3 p. 11; §10.1 p. 27): The octonion definiteness hypothesis and a quaternion orbit label are omitted in two sentences. Correction: Use totally definite O in the compact-real globalization and parameterize the open Siegel orbit by its quaternion D. Review: Confirmed at LL pp. 11 and 27: §3.3 says definite octonion algebra over F where it must be over k, and §10.1 omits the orbit label D (PAPER-GAN-SAVIN-23-B/E6, E10).
- E20 (gap, LL, published proof of Lemma 10.1 p. 27): The low-rank reduction names only exact rank two. Correction: Use rank at most two and include classical O(m) first occurrences for m=0,1,2. Review: Confirmed at LL p. 27: the proof of Lemma 10.1 says N-rank 2 and O(2), where N-rank at most two and O(m), m ≤ 2, are needed (PAPER-GAN-SAVIN-23-B/E11).

## Routed-item coverage

This is an identifier-to-target audit of the two routed extractions, not a reproduction of either source. Multiple source items can use a single target or an imported general theorem.

| Extraction item | Target or supplier |
|---|---|
| PAPER-GAN-SAVIN-23/thm-1-1 | ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy |
| PAPER-GAN-SAVIN-23/thm-1-2 | ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems |
| PAPER-GAN-SAVIN-23/thm-1-3 | ExceptionalThetaCorrespondencesForG2:EX.8/discrete-series-trichotomy, ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts |
| PAPER-GAN-SAVIN-23/generic-supercuspidal-lifts | ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor, ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts |
| PAPER-GAN-SAVIN-23/g2-group | ExceptionalThetaCorrespondencesForG2:EX.0/octonion-group, ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces |
| PAPER-GAN-SAVIN-23/g2-parabolics | ExceptionalThetaCorrespondencesForG2:EX.0/parabolics |
| PAPER-GAN-SAVIN-23/g2-sl3 | ExceptionalThetaCorrespondencesForG2:EX.0/quadratic-stabilizers |
| PAPER-GAN-SAVIN-23/g2-dual-group | ExceptionalThetaCorrespondencesForG2:EX.0/dual-embeddings |
| PAPER-GAN-SAVIN-23/prop-3-1 | ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal, ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-steinberg, ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-characters |
| PAPER-GAN-SAVIN-23/prop-3-2 | ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-supercuspidal, ExceptionalThetaCorrespondencesForG2:EX.1/g2-q-segments |
| PAPER-GAN-SAVIN-23/prop-3-3 | ExceptionalThetaCorrespondencesForG2:EX.1/g2-borel |
| PAPER-GAN-SAVIN-23/nontempered-g2 | ExceptionalThetaCorrespondencesForG2:EX.1/g2-nontempered-normal-forms |
| PAPER-GAN-SAVIN-23/g2-l-packets | ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters, ExceptionalThetaCorrespondencesForG2:EX.0/component-groups, ExceptionalThetaCorrespondencesForG2:EX.1/partial-g2-packets |
| PAPER-GAN-SAVIN-23/cubic-orbits | ExceptionalThetaCorrespondencesForG2:EX.0/cubic-characters |
| PAPER-GAN-SAVIN-23/lemma-3-4 | ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness |
| PAPER-GAN-SAVIN-23/freudenthal-jordan | ExceptionalThetaCorrespondencesForG2:EX.2/jordan-freudenthal |
| PAPER-GAN-SAVIN-23/dual-pair-g2-hj | ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs |
| PAPER-GAN-SAVIN-23/dual-pair-ge | ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw |
| PAPER-GAN-SAVIN-23/seesaw | ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules, ExceptionalThetaCorrespondencesForG2:EX.2/triality-see-saw |
| PAPER-GAN-SAVIN-23/minimal-representation | ExceptionalThetaCorrespondencesForG2:EX.2/minimal-models |
| PAPER-GAN-SAVIN-23/prop-5-2 | ExceptionalThetaCorrespondencesForG2:EX.4/spin8-constituents |
| PAPER-GAN-SAVIN-23/prop-5-3 | ExceptionalThetaCorrespondencesForG2:EX.4/division-ext-vanishing |
| PAPER-GAN-SAVIN-23/prop-5-4 | ExceptionalThetaCorrespondencesForG2:EX.4/triality-mackey |
| PAPER-GAN-SAVIN-23/prop-5-5 | ExceptionalThetaCorrespondencesForG2:EX.4/triality-restriction-hom |
| PAPER-GAN-SAVIN-23/lemma-6-2 | ExceptionalThetaCorrespondencesForG2:EX.3/e6-jacquet-finiteness, ExceptionalThetaCorrespondencesForG2:EX.6/e7-noncuspidal-finiteness |
| PAPER-GAN-SAVIN-23/lemma-6-3 | ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility |
| PAPER-GAN-SAVIN-23/lemma-6-4 | ExceptionalThetaCorrespondencesForG2:EX.4/cubic-period-chain |
| PAPER-GAN-SAVIN-23/prop-6-6 | ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness |
| PAPER-GAN-SAVIN-23/prop-6-7 | ExceptionalThetaCorrespondencesForG2:EX.4/nongeneric-tempered-uniqueness |
| PAPER-GAN-SAVIN-23/cor-6-8 | ExceptionalThetaCorrespondencesForG2:EX.6/nongeneric-full-finiteness |
| PAPER-GAN-SAVIN-23/prop-7-1 | ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence, ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing |
| PAPER-GAN-SAVIN-23/thm-7-2 | ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence, ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing |
| PAPER-GAN-SAVIN-23/lonka-tandon | ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing |
| PAPER-GAN-SAVIN-23/pgl3-z2-reps | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-clifford-labels |
| PAPER-GAN-SAVIN-23/lemma-8-1 | ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models |
| PAPER-GAN-SAVIN-23/thm-8-2 | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-explicit-lifts |
| PAPER-GAN-SAVIN-23/lemma-8-3 | ExceptionalThetaCorrespondencesForG2:EX.5/e6-coefficient-models |
| PAPER-GAN-SAVIN-23/prop-8-4 | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-minus-supercuspidal |
| PAPER-GAN-SAVIN-23/thm-8-5 | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality |
| PAPER-GAN-SAVIN-23/prasad-restriction | SmoothRepresentationsOfLocalGroups:SR.3 |
| PAPER-GAN-SAVIN-23/pgsp6-structure | ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-geometry |
| PAPER-GAN-SAVIN-23/pgsp6-roots | ExceptionalThetaCorrespondencesForG2:EX.0/pgsp-root-coordinates |
| PAPER-GAN-SAVIN-23/prop-10-1 | ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13 |
| PAPER-GAN-SAVIN-23/prop-10-2 | ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p2-p13 |
| PAPER-GAN-SAVIN-23/prop-10-3 | ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p3 |
| PAPER-GAN-SAVIN-23/prop-10-4 | ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1 |
| PAPER-GAN-SAVIN-23/nontempered-pgsp6 | ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse, ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts |
| PAPER-GAN-SAVIN-23/prop-11-1 | ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers, ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-uniqueness |
| PAPER-GAN-SAVIN-23/fourier-jacobi-period | ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-period |
| PAPER-GAN-SAVIN-23/lemma-11-3 | ExceptionalThetaCorrespondencesForG2:EX.7/fourier-jacobi-uniqueness |
| PAPER-GAN-SAVIN-23/lemma-11-4 | ExceptionalThetaCorrespondencesForG2:EX.7/root-exchange |
| PAPER-GAN-SAVIN-23/shalika-period | ExceptionalThetaCorrespondencesForG2:EX.7/shalika-period |
| PAPER-GAN-SAVIN-23/minimal-rep-coefficients | ExceptionalThetaCorrespondencesForG2:EX.6/minimal-whittaker-fibers |
| PAPER-GAN-SAVIN-23/pi-n2-psi2 | ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber |
| PAPER-GAN-SAVIN-23/lemma-11-6 | SmoothRepresentationsOfLocalGroups:SR.2 |
| PAPER-GAN-SAVIN-23/prop-11-7 | ExceptionalThetaCorrespondencesForG2:EX.7/minimal-shalika-fiber |
| PAPER-GAN-SAVIN-23/lemma-12-1 | ExceptionalThetaCorrespondencesForG2:EX.7/generic-period-chain |
| PAPER-GAN-SAVIN-23/prop-12-2 | ExceptionalThetaCorrespondencesForG2:EX.7/generic-tempered-uniqueness |
| PAPER-GAN-SAVIN-23/prop-12-3 | ExceptionalThetaCorrespondencesForG2:EX.7/generic-tempered-uniqueness |
| PAPER-GAN-SAVIN-23/thm-12-4 | ExceptionalThetaCorrespondencesForG2:EX.7/e7-tempered-howe |
| PAPER-GAN-SAVIN-23/cor-12-5 | ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts |
| PAPER-GAN-SAVIN-23/prop-13-1 | ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-p-jacquet |
| PAPER-GAN-SAVIN-23/prop-13-3 | ExceptionalThetaCorrespondencesForG2:EX.3/e7-g2-q-jacquet |
| PAPER-GAN-SAVIN-23/lemma-13-4 | ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-forward |
| PAPER-GAN-SAVIN-23/prop-13-5 | ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p3-jacquet |
| PAPER-GAN-SAVIN-23/prop-13-6 | ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p1-jacquet |
| PAPER-GAN-SAVIN-23/prop-13-7 | ExceptionalThetaCorrespondencesForG2:EX.3/e7-h-p2-jacquet |
| PAPER-GAN-SAVIN-23/lemma-13-8 | ExceptionalThetaCorrespondencesForG2:EX.3/nontempered-reverse |
| PAPER-GAN-SAVIN-23/thm-14-1 | ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts |
| PAPER-GAN-SAVIN-23/prop-14-2 | MetaplecticAutomorphicForms:MP.3/minimal-orthogonal-theta, ExceptionalThetaCorrespondencesForG2:EX.6/orthogonal-restriction-comparison |
| PAPER-GAN-SAVIN-23/gan-gurevich | ExceptionalThetaCorrespondencesForG2:EX.6/mixed-mp2-g2-module, MetaplecticAutomorphicForms:MP.3 |
| PAPER-GAN-SAVIN-23/thm-15-1 | ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems, ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts, ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy |
| PAPER-GAN-SAVIN-23/thm-15-2 | ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table |
| PAPER-GAN-SAVIN-23/thm-15-3 | ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table |
| PAPER-GAN-SAVIN-23/saito-kurokawa | MetaplecticAutomorphicForms:MP.3, ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison |
| PAPER-GAN-SAVIN-23/lemma-15-5 | ExceptionalThetaCorrespondencesForG2:EX.8/rho-sk-comparison |
| PAPER-GAN-SAVIN-23/prop-15-6 | ExceptionalThetaCorrespondencesForG2:EX.8/remaining-supercuspidal-lifts |
| PAPER-GAN-SAVIN-23/cor-15-7 | ExceptionalThetaCorrespondencesForG2:EX.8/discrete-series-trichotomy |
| PAPER-GAN-SAVIN-23/rev-depth-zero-unipotent-supercuspidal-representations | ExceptionalThetaCorrespondencesForG2:EX.1/depth-zero-unipotent |
| PAPER-GAN-SAVIN-23/rev-wave-front-sets-of-nongeneric | ExceptionalThetaCorrespondencesForG2:EX.1/cubic-finiteness, SmoothRepresentationsOfLocalGroups:SR.3 |
| PAPER-GAN-SAVIN-23/rev-shahidi-s-reducibility-criterion-for | ExceptionalThetaCorrespondencesForG2:EX.1/g2-p-supercuspidal, ExceptionalThetaCorrespondencesForG2:EX.1/pgsp-p1, AutomorphicLFunctionsAndLocalFactors:AL.4 |
| PAPER-GAN-SAVIN-23/rev-savin-weissman-lifts-to-pgsp | ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor |
| PAPER-GAN-SAVIN-23/rev-parabolic-subgroups-of-e-7 | ExceptionalThetaCorrespondencesForG2:EX.3/ambient-parabolics |
| PAPER-GAN-SAVIN-23/rev-null-subspace-orbits-and-the | ExceptionalThetaCorrespondencesForG2:EX.0/null-subspaces, ExceptionalThetaCorrespondencesForG2:EX.3/orbit-kernels |
| PAPER-GAN-SAVIN-23/rev-isotypic-quotients-of-ind-p | SmoothRepresentationsOfLocalGroups:SR.2a |
| PAPER-GAN-SAVIN-23/rev-the-see-saw-identity-14 | ExceptionalThetaCorrespondencesForG2:EX.6/orthogonal-restriction-comparison |
| PAPER-GAN-SAVIN-23/rev-restriction-of-a-5-to | ExceptionalThetaCorrespondencesForG2:EX.6/a5-sp6-restriction |
| PAPER-GAN-SAVIN-23-B/1 | ExceptionalThetaCorrespondencesForG2:EX.0/complex-parameters, ExceptionalThetaCorrespondencesForG2:EX.0/component-groups |
| PAPER-GAN-SAVIN-23-B/15 | ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-group-pairs, ExceptionalThetaCorrespondencesForG2:EX.2/exceptional-theta-modules |
| PAPER-GAN-SAVIN-23-B/16 | ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems |
| PAPER-GAN-SAVIN-23-B/17 | ExceptionalThetaCorrespondencesForG2:EX.6/theta-dichotomy |
| PAPER-GAN-SAVIN-23-B/18 | ExceptionalThetaCorrespondencesForG2:EX.5/division-correspondence, ExceptionalThetaCorrespondencesForG2:EX.5/division-nonvanishing |
| PAPER-GAN-SAVIN-23-B/19 | ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems, ExceptionalThetaCorrespondencesForG2:EX.3/tempered-compatibility |
| PAPER-GAN-SAVIN-23-B/20 | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-howe-duality, ExceptionalThetaCorrespondencesForG2:EX.8/three-howe-theorems |
| PAPER-GAN-SAVIN-23-B/21 | ExceptionalThetaCorrespondencesForG2:EX.8/discrete-series-trichotomy |
| PAPER-GAN-SAVIN-23-B/22 | ExceptionalThetaCorrespondencesForG2:EX.8/discrete-series-trichotomy |
| PAPER-GAN-SAVIN-23-B/23 | ExceptionalThetaCorrespondencesForG2:EX.5/pgl3-explicit-lifts, ExceptionalThetaCorrespondencesForG2:EX.8/nontempered-explicit-lifts, ExceptionalThetaCorrespondencesForG2:EX.8/e6-e7-siegel-table, ExceptionalThetaCorrespondencesForG2:EX.8/remaining-nonsupercuspidal-table |
| PAPER-GAN-SAVIN-23-B/46 | ExceptionalThetaCorrespondencesForG2:EX.5/opposite-division-compatibility |
| PAPER-GAN-SAVIN-23-B/66 | ExceptionalThetaCorrespondencesForG2:EX.5/generic-supercuspidal-precursor, ExceptionalThetaCorrespondencesForG2:EX.8/spin-pole-criterion |
| PAPER-GAN-SAVIN-23-B/81 | ExceptionalThetaCorrespondencesForG2:EX.9/quaternion-pointwise-stabilizer |
| PAPER-GAN-SAVIN-23-B/82 | ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients |
| PAPER-GAN-SAVIN-23-B/83 | ExceptionalThetaCorrespondencesForG2:EX.9/siegel-quaternion-coefficients |
| PAPER-GAN-SAVIN-23-B/84 | MetaplecticAutomorphicForms:MP.3, ExceptionalThetaCorrespondencesForG2:EX.9/tempered-relative-quotient |
| PAPER-GAN-SAVIN-23-B/85 | ExceptionalThetaCorrespondencesForG2:EX.9/tempered-relative-quotient |
| PAPER-GAN-SAVIN-23-B/86 | ExceptionalThetaCorrespondencesForG2:EX.9/supercuspidal-relative-submodule |
| PAPER-GAN-SAVIN-23-B/87 | ExceptionalThetaCorrespondencesForG2:EX.9/steinberg-relative-square-integrability |
| PAPER-GAN-SAVIN-23-B/88 | ExceptionalThetaCorrespondencesForG2:EX.9/compact-real-relative-model |
| PAPER-GAN-SAVIN-23-B/92 | ExceptionalThetaCorrespondencesForG2:EX.10/global-exceptional-pair, ExceptionalThetaCorrespondencesForG2:EX.10/global-minimal-residue |
| PAPER-GAN-SAVIN-23-B/93 | ExceptionalThetaCorrespondencesForG2:EX.10/global-period-nonvanishing, ExceptionalThetaCorrespondencesForG2:EX.10/global-cuspidality-criteria |
| PAPER-GAN-SAVIN-23-B/100 | ExceptionalThetaCorrespondencesForG2:EX.10/global-generic-lift |
| PAPER-GAN-SAVIN-23-B/101 | ExceptionalThetaCorrespondencesForG2:EX.8/depth-zero-spherical-example |
| PAPER-GAN-SAVIN-23-B/102 | ExceptionalThetaCorrespondencesForG2:EX.10/real-infinitesimal-character-matching |

## Sources and version discipline

Every statement above is written for its mathematical role in the construction. Locators refer to the following versions; the 2023 published Howe article was not obtained, so v1 findings are not attributed to an unread published text. The packet records SHA-256 digests of the public PDFs.

- GS: Wee Teck Gan; Gordan Savin, [Howe duality and dichotomy for exceptional theta correspondences](https://arxiv.org/pdf/2102.00372v1). arXiv:2102.00372v1 (2021), 56 pages; published Invent. Math. 232 (2023), 1–78 not served by publisher. Read 2026-10-19: §§1–15, pp. 1–55; references p. 56; all local target statements and their proofs.
- LL: Wee Teck Gan; Gordan Savin, [The local Langlands conjecture for G₂](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf). Forum Math. Pi 11 (2023), e28, published PDF. Read 2026-10-19: §§1–2 pp. 1–8; §3.5 p. 15; §§5–6 pp. 20–22; §8.4 p. 25; §10 pp. 27–30.
- HKT: Gordan Savin (appendix to Michael Harris; Chandrashekhar Khare; Jack Thorne), [A local Langlands parameterization for generic supercuspidal representations of p-adic G₂: Appendix A](https://arxiv.org/pdf/1909.05933). arXiv:1909.05933, Appendix A, PDF pp. 22–30. Read 2026-10-19: Appendix A.1–A.10, pp. 22–30.
- GrS: Benedict Gross; Gordan Savin, [Motives with Galois group of type G₂: an exceptional theta correspondence](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E242459F743917A019C0726055551FF5/S0010437X98000645a.pdf/div-class-title-motives-with-galois-group-of-type-g-2-an-exceptional-theta-correspondence-div.pdf). Compositio Math. 114 (1998), 153–217. Read 2026-10-19: Chapter 5, introduction (0.1)–(0.2), pp. 193–194; §3, Lemma 3.4, pp. 197–198; §4, Proposition 4.5, p. 200, and Corollary 4.9, pp. 203–204; Chapter 6, §2, Lemma 2.9, p. 213.
- HS: Marcela Hanzer; Gordan Savin, [Eisenstein series arising from Jordan algebras](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AE032F11A3717F7175A486BBE537549F/S0008414X18000615a.pdf/eisenstein_series_arising_from_jordan_algebras.pdf). Canad. J. Math. 72 (2020), 183–201. Read 2026-10-19: §§1–2 pp. 183–186; §4.1 (Lemma 4.1, Corollary 4.2, Proposition 4.3) pp. 189–191; §4.2, the remark after Corollary 4.6, p. 192; Proposition 6.3 and proof p. 197; §6.2 Theorem 6.4 and proof pp. 198–200.
- SW: Gordan Savin; Martin Weissman, [Dichotomy for generic supercuspidal representations of G₂](https://arxiv.org/pdf/0908.3340v2). arXiv:0908.3340v2, 48-page preprint. Read 2026-10-19: Introduction pp. 1–3; §3 (the dichotomy map) pp. 16–27; Proposition 4.6 p. 37; Theorem 5.3 pp. 37–38.
- Sav: Gordan Savin, [A class of supercuspidal representations of G₂(k)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CE9F949BF8D96C551E8C40D7EA71DC42/S0008439500010699a.pdf/a-class-of-supercuspidal-representations-of-g2k.pdf). Canad. Math. Bull. 42 (1999), 393–400. Read 2026-10-19: §3 (Theorem 3.4), pp. 396–397; §§5–6, pp. 398–400.
- MS: Kay Magaard; Gordan Savin, [Exceptional Θ-correspondences I](https://arxiv.org/pdf/math/9505209). arXiv:math/9505209 preprint. Read 2026-10-19: Theorem 1.1 pp. 3–4; §4 Theorem 4.3 p. 10; §5 Theorem 5.3 pp. 14–15.
- GS04: Wee Teck Gan; Gordan Savin, [Endoscopic lifts from PGL₃ to G₂](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2CE451D8C1AC7635396F547CB323BE65/S0010437X03000678a.pdf/endoscopic_lifts_from_pgl3_to_g2.pdf). Compositio Math. 140 (2004), 793–808. Read 2026-10-19: §§1–11 pp. 793–806; §12 p. 807 (depth-zero example has p≥5).
- GG: Wee Teck Gan; Nadya Gurevich, [Non-tempered A-packets of G₂: liftings from SL₂](https://math.bgu.ac.il/~ngur/Publications/sl2g2.pdf). author preprint, 81 PDF pages; published Amer. J. Math. 128 (2006), 1105–1185. Read 2026-10-19: §8 Propositions 8.1, 8.3, 8.4 pp. 27–28; §9 Theorem 9.1 and its proof, including §9.5, pp. 33–37; Lemma 9.4 pp. 34–36.
- Pra: Dipendra Prasad, [On the decomposition of a representation of GL(3) restricted to GL(2) over a p-adic field](https://www.math.iitb.ac.in/~dprasad/1077293429.pdf). Duke Math. J. 69 (1993), 167–177, author-hosted published PDF. Read 2026-10-19: §1 pp. 167–169; §3 Theorem 3 and proof p. 174. The independent review could not fetch this file (the author page did not respond); the node citing it gives the statement as GS cite it in the proof of Proposition 8.4.

Primary access is still missing for the minimal-model paper of Gan–Savin 2005, Lonka–Tandon’s proof, Gan’s finite-field example and the real infinitesimal-character formula of Huang–Pandžić–Savin; those gaps have named consumers above. No uncleared book was used.

## Suggested Lean and acceptance

The compact suggested file contains the two light predicates on the pinned octonion carrier, `IsOctonionAutomorphism` and `IsNullSubspace`, with the API items and unit tests the packet names for them (each test is an `example` labelled by its packet name). The heavy group, smooth-module, minimal-representation and global-kernel definitions require new carriers and remain fully specified in this document, as required by the roadmap shape rule; their API items and tests are targets of this document only. The file has no assumed theta structures and no data definition with an unproved body. It elaborates in the shared pinned Lean build with placeholder-proof warnings only.

Acceptance requires the packet checker to report no errors, exact coverage of all 87 main-paper and 25 sequel routed items, an acyclic prerequisite graph and at most six planets per stage. Mathematical closure additionally requires every open obligation above to be discharged and every supplier hypothesis matched.
