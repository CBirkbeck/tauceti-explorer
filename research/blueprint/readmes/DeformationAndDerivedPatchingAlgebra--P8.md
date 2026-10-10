# Patching complexes with cohomology in several degrees

This is part P8 of **Commutative algebra for deformation theory and patching**, covering `DeformationAndDerivedPatchingAlgebra:P8`. Its target is a bounded perfect patched complex, together with the actions and comparison maps that the finite input actually supplies. The matrix presentation makes the compactness argument finite without replacing Mathlib's complexes or derived category. The reader fixes the mathematical specifications; the [suggested file](../suggested/DeformationAndDerivedPatchingAlgebra--P8.lean) explores their native carriers. The [packet](../packets/DeformationAndDerivedPatchingAlgebra--P8.json) records individual declarations and their prerequisite graph.

Patching first fixes a coefficient quotient, chooses a finite presentation and its decorations there, and then takes compatible limits through the coefficient quotients. The choice of one ultrafilter is retained throughout. The finite presentations carry matrices, while derived Hecke algebras act on their images in the derived category. An action on cohomology is a third, weaker kind of datum. Keeping these distinct is necessary both for integral torsion and for the residual comparisons.

The following is the action output of the derived construction:

\[
 T_\infty\hookrightarrow\operatorname{End}_{D(S_\infty)}(C_\infty),\qquad
 I_\infty^{\delta}=0,\qquad
 R_\infty\twoheadrightarrow T_\infty/I_\infty.
\]

A continuous map from the deformation ring into the full derived endomorphism ring follows if a continuous lift from \(R_\infty\) to \(T_\infty\) is supplied. The source construction does not supply such a lift. The power-series scalar lift goes from \(S_\infty\) to \(R_\infty\); it cannot fill that missing map. The inherited unconditional action target therefore needs the clarification recorded in the packet. No chain action is asserted by any of these outputs.

## Conventions and ownership

All complexes are cochain complexes indexed by integers, and the successor differential raises degree. In coordinates, vectors are columns and the square-zero equation is \(d_{i+1}d_i=0\). A based presentation remembers the matrices and bases. A perfect derived object has a bounded finite-projective representative supplied by P7; its presentation is chosen after minimality and residual-rank comparison. Equality of chosen presentations is stronger than isomorphism of derived objects.

The commutative coefficient ring in the derived patch is

\[
 \Lambda=\mathcal O[[\text{coefficient variables}]],\quad
 T=\Lambda[[x_1,\ldots,x_j]],\quad
 S_\infty=T[[\mathbf Z_p^h]].
\]

Here \(\mathcal O\) is a complete discrete valuation ring with uniformizer \(\pi\) and finite residue field \(k\). The finite group quotients \(\Delta_N\) are quotients of \(\mathbf Z_p^h\) with kernel contained in \(p^N\mathbf Z_p^h\). The generator rank \(h\) stays fixed. Framing variables \(x_i\), group variables, and variables already in \(\Lambda\) are different. The full augmentation ideal \(\mathfrak a_\infty\) kills the group and framing variables and has quotient \(\Lambda\). Killing just the group variables retains the framed coefficient ring \(T\).

The coefficient finiteness used for compactness is at an **open quotient** \(B=S_\infty/J\). These rings are finite sets. A finite-level Hecke algebra over \(\Lambda[\Delta_N]\) is module-finite; before taking an open quotient it is generally an infinite set. The word finite in the coefficient-germ and finite-code lemmas always means finite cardinality. Uniform rank and support bounds are indispensable even at a finite coefficient ring.

The generic perfect-object, minimal-complex, K-projective, derived scalar-change, Hom-completion, and cohomology-completion interfaces belong to [P7](DeformationAndDerivedPatchingAlgebra--P7.md). In particular P8 imports its precise minimality and perfectness node ids rather than restating those targets. The complete local category, finite-variable completed group rings, continuous power-series evaluation, and formal-smooth lifting belong to R03.1. Generic decorated module patch data and their restriction functor belong to R03.5. P8 adds bounded complex matrix codes to that data.

Current upstream [IntegralHeckeAndGaloisDeterminants, Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md) owns derived Hecke images, the chain-homotopy comparison, and ghost ideal nilpotence. Its objects remain prerequisites. Locally symmetric arithmetic applications must supply their auxiliary-level freeness and residual identifications as input; the cardinality of a covering group does not prove freeness. This P8 algebraic plan cites no higher-tier arithmetic supplier as a prerequisite. Depth, codimension, regular-ring freeness, and nearly faithful support are P9 consumers.

## The finite input and the construction

The full `finite-level-patching-data` specification below is the input contract. Each finite complex comes with its derived augmentation, compatible deformation-to-Hecke **quotient** map, error ideal with the same positive exponent, and, for a pair, the specified residual diagrams. There need not be maps between distinct auxiliary levels. These are replaced by fixed-filter finite selection and compatible coefficient-quotient comparisons.

Choose minimal free representatives over the complete local finite-level coefficient rings. Their ranks are the dimensions of the common residual cohomology, so one rank profile and a bounded interval work at every level. For a broader bounded-complexity family one first selects its finite rank pattern. Over each finite coefficient quotient the differentials have only finitely many possible matrices. The finite-germ construction selects the matrix entries on one fixed ultrafilter. It preserves polynomial equations, including the square-zero equation.

The kernel condition on \(\Delta_N\) guarantees that the finite-level coefficient map factors through every fixed open coefficient quotient for all sufficiently large \(N\). An ultrafilter refining the cofinite filter contains those tails. Extending a family arbitrarily on its finitely many omitted indices does not change its patch. This does not identify the patches from two different ultrafilters: a family alternating zero and unit differentials can select different complexes.

The finite selection includes the Hecke image, the error ideal, and the deformation map together. Stabilizing only the differential matrices loses the action data. At a fixed coefficient quotient, the bounded-projective chain-to-derived comparison bounds the derived endomorphism cardinality by the number of graded endomorphism matrices. Finite local Hecke/error quotients of bounded cardinality admit one uniform maximal-ideal nilpotence exponent. This yields factorization through one finite deformation jet. The source filtration/ghost proof supplies another route to the same bound; its generic filtered and ghost machinery is imported, not duplicated.

The deformation jet quotients have a fixed finite source ring. Selecting their kernels therefore gives an actual quotient of that ring. No varying-type ultraproduct is assigned an invented ring structure. Coefficient change commutes with selection, so the fixed-quotient patches fit into a compatible tower. P7 strictification and compatible bases turn this tower into entrywise adic limits. Adic completeness supplies the entries and separatedness proves their equations. The result is a bounded finite free representative over \(S_\infty\).

The common nilpotence exponent passes to the inverse error ideal. P7 Hom completion constructs the derived Hecke action from the finite quotient actions and proves its injectivity. Finite exactness and compact lifting construct the deformation surjection onto the error quotient. Formal smoothness supplies a chosen scalar lift with the framing variables still present. The derived augmentation is then compared at every finite augmented quotient with the given original complex. It is a comparison in \(D(\Lambda)\), retaining integral torsion.

For paired systems, use the same filter and all the supplied compatible modulo-\(\pi\) maps. Completion lifts the residual complex comparisons. The two patched Hecke rings have the same **derived** residual image. The deformation maps agree after quotienting that image by the sum of the two residual error images. Equality on cohomology before that quotient does not follow, nor does equality in the full derived endomorphism ring. These are the three separate residual targets below.

The Calegari–Geraghty construction has a different input: compatible cohomology actions on all finite subquotients, finite ring maps, and top augmentation data. Its planned result keeps these cohomology actions. It supplies a top cohomology augmentation, not a whole prescribed derived augmentation. A complete finite decoration, including framing quotient actions, is required for the compactness proof. The exact normalized finite coefficient conventions and source issues are recorded below.

## Declaration catalogue

The entries are organized by the mathematical construction rather than by a source's section order. Names are in `TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra.P8`. Each entry specifies a single declaration. The source match may be a step in a cited proof; the proof routes and carrier choices are expressed here in our own words.

### Presentation data, finite germs, and input systems

#### Based finite presentation data

**Definition:** `PatchPresentation` (`bounded-presentation`).

For a commutative ring B and a fixed rank profile r:ℤ→ℕ, PatchPresentation B r is the data of matrices d_i:B^{r_i}→B^{r_(i+1)} with d_(i+1)d_i=0. It is an encoding of based free cochain representatives; support in [a,b] is a separate hypothesis, never implicit. No derived action is part of this data.

Proof route: Store the successor matrices and their square-zero equations. Interpret column matrices as linear maps on standard finite free modules; the complex construction is a separate declaration.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Definition 2.2.5 and Remark 2.2.8, p.13.

Prerequisites: `mathlib:CochainComplex.of`.

Uses: GN Remark 2.2.8, p.13: Finiteness of coefficient matrices gives a finite set of representative codes. ACC Definition 6.4.3 and Proposition 6.4.12(1), pp.1054,1058: Encode minimal representatives with the common residual rank profile before patching.

API:

- `PatchPresentation.complex` (constructor): Interpret the matrices on the native CochainComplex(ModuleCat B) carrier.
- `PatchPresentation.square_zero` (projection): For every i the successor product is zero.
- `PatchPresentation.ext` (extensionality): Two presentations with the same rank profile and the same matrices in every degree are equal.

Unit tests:

- `bounded_presentation_zero` (degenerate): For r_i=0 in all degrees, every term of the native complex is the zero module.
- `bounded_presentation_rank_one` (computation): For r concentrated with value one at one degree, every differential is zero.
- `bounded_presentation_unit_disk` (non-example): Over F₂, the two-term rank-one presentation with d_0=1 has a nonzero differential; it is a nonzero chain complex even though it becomes zero in the derived category.

#### The native cochain representative

**Construction:** `PatchPresentation.complex` (`presentation-native-complex`).

Interpret PatchPresentation B r as the Mathlib integer-indexed cochain complex with X_i=B^{r_i}, successor matrix d_i acting on columns, and all nonsuccessor differentials zero. This is a native representative, not a new complex category.

Proof route: Use ModuleCat.of of the standard free modules. Apply CochainComplex.of to matrix linear maps and the recorded square-zero relations.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Definition 2.2.5, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`, `mathlib:CochainComplex.of`.

Uses: ACC Proposition 6.4.10(1), p.1056: Identify finite-coefficient ultralimits as actual perfect derived objects via Q. ACC Proposition 6.4.12(2), p.1058: Use native homotopy and derived morphisms rather than treating chain matrices as derived endomorphisms.

API:

- `PatchPresentation.complex_X` (compatibility): X_i is B-linearly equivalent to the standard module B^{r_i}.
- `PatchPresentation.complex_d` (compatibility): In its standard bases the successor differential is exactly multiplication by d_i on column vectors.
- `PatchPresentation.complex_shape` (simp): The differential i→j is zero if j≠i+1.

Unit tests:

- `presentation_complex_zero` (degenerate): The all-zero rank profile gives zero native modules in every degree.
- `presentation_complex_scalar` (compatibility): The native term is B-linearly equivalent to B^{r_i}, with the B scalar action preserved.
- `presentation_complex_shape` (computation): The native differential from i to i+2 is zero.

#### Coefficient change of based models

**Construction:** `PatchPresentation.changeCoeff` (`presentation-coefficient-change`).

For a ring map f:B→D, changeCoeff applies f to every differential entry without changing the rank profile. For bounded r this native free representative computes the derived coefficient change, through the P7 K-flat/derived-tensor comparison; it is not ordinary tensor on cohomology.

Proof route: Map the successor matrices and square-zero equations entrywise. Use P7 bounded-projective K-flatness and the representative comparison for the derived interpretation.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.3, p.1054; Remark 6.4.6, p.1055.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`, `DeformationAndDerivedPatchingAlgebra:P7`.

Uses: ACC Proposition 6.4.10(4), p.1057: Compare open coefficient quotients of patched representatives. ACC Lemma 6.4.16, pp.1059–1060: Compute augmentation as derived scalar change on the free patched complex.

API:

- `PatchPresentation.changeCoeff_d` (simp): The new matrix is the entrywise image under f.
- `PatchPresentation.changeCoeff_id` (functoriality): Change along the identity leaves the presentation equal.
- `PatchPresentation.changeCoeff_comp` (functoriality): Changing along f and then g equals changing along g∘f.

Unit tests:

- `coefficient_change_zero` (degenerate): An all-zero differential family stays zero under every coefficient map.
- `coefficient_change_unit` (computation): The matrix [1] over ℤ remains [1] after reduction modulo 2.
- `coefficient_change_torsion` (non-example): The two-term differential [2] over ℤ becomes zero modulo 2; both terms survive. Tensoring only the integral cohomology would lose the extra Tor contribution.

#### Finite coefficient ultrafilter equivalence

**Construction:** `finiteGermEquiv` (`finite-coefficient-germ`).

For any fixed ultrafilter F on ℕ and finite commutative ring B, finiteGermEquiv is the ring equivalence Germ(F,B)≅B sending a germ to its unique value on an F-large fibre. Nonprincipality is needed for deleting finitely many levels, not for this equivalence.

Proof route: Partition ℕ by the finite value set of a representative. The ultrafilter selects one fibre; two selected fibres intersect, proving uniqueness and representative independence. Intersect the selected fibres of two functions to prove addition, multiplication and unit compatibility; constant functions give the inverse.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.2, p.12.

Prerequisites: `mathlib:Filter.Germ`, `mathlib:Filter.Germ.coeRingHom`, `mathlib:Filter.Germ.coe_eq`, `mathlib:Ultrafilter.eventually_exists_iff`.

Uses: GN Lemma 2.2.2, p.12: Compare product localization and finite-valued fibre selection. ACC Definition 6.4.7, p.1056: Evaluate finite-quotient matrix entries with the fixed ultrafilter.

API:

- `finiteGermEquiv_const` (simp): The equivalence sends a constant germ b to b.
- `finiteGermEquiv_fibre` (characterisation): The representative equals the output on an F-large set.
- `finiteGermEquiv_natural` (functoriality): Evaluation commutes with any ring map between finite coefficient rings.

Unit tests:

- `finite_germ_constant` (computation): The constant germ of 3 in ℤ/4 evaluates to 3.
- `finite_germ_principal` (compatibility): For the principal ultrafilter at n, evaluation of f is f(n).
- `finite_germ_finite_change` (characterisation): For F≤cofinite, two functions into F₂ differing at finitely many indices have the same output.

#### Fixed ultrafilter patching of free representatives

**Construction:** `ultrapatch` (`ultrapatching-of-perfect-complexes`).

For a fixed F and finite coefficient ring B, ultrapatch of presentations with common rank profile r has the same terms B^{r_i}; each differential entry is evaluated by finiteGermEquiv. Ring compatibility gives d²=0. For bounded r it represents the localized-product patch of GN/ACC. The comparison requires the selected based representatives. It does not identify outputs for different ultrafilters.

Proof route: Apply finiteGermEquiv to each finite matrix entry. Intersect finitely many fibres in each matrix product to preserve d²=0. For a uniformly bounded profile use stable-presentation and finite-product-localization to compare with localized products; those comparison lemmas are not required merely to define the matrices.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.7 and Proposition 6.4.10(1), p.1056; GN Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/finite-coefficient-germ`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`.

Uses: ACC Proposition 6.4.10, pp.1056–1057: Retain finite-quotient Hecke/error decorations on a common large subset. ACC Definition 6.4.11, pp.1057–1058: Supply the compatible quotient representatives for the final adic tower.

API:

- `ultrapatch_d` (simp): The successor entry is the fixed-filter evaluation of the corresponding finite-level entries.
- `ultrapatch_const` (simp): A constant family patches to the original presentation.
- `ultrapatch_eventuallyEq` (characterisation): Families equal on an F-large set have equal patched presentations.

Unit tests:

- `ultrapatch_zero` (degenerate): An all-zero rank family patches to zero native terms.
- `ultrapatch_identity` (compatibility): A constant finite based complex patches to itself, with identical differential matrices.
- `ultrapatch_two_filters` (non-example): For a two-term F₂ family, if F selects levels with differential 0 and G selects levels with differential 1, their patched differentials differ. In particular a zero-map complex and a contractible disk need not have the same ultrafilter output.

#### Framed finite-level complex patching data

**Definition:** `FinitePatchDatum` (`finite-level-patching-data`).

Fix a complete DVR O with uniformizer π and finite residue field k, a finite-variable power-series ring Λ over O, positive δ and fixed group-generator rank h. Put T=Λ[[x_1,…,x_j]], S∞=T[[Z_p^h]], with augmentation a∞ killing both group and framing variables and landing in Λ. Supply complete Noetherian local Λ-algebras Rloc and R∞=Rloc[[y_1,…,y_g]]. Supply a perfect C₀ in D(Λ); take Δ₀ trivial. For every N≥1 supply a finite p-group quotient Δ_N of Z_p^h whose kernel is contained in p^N Z_p^h, and a perfect C_N in D(Λ[Δ_N]) with a chosen residual identification C_N⊗ᴸk≅C_0⊗ᴸ_Λk. Supply a commutative derived Hecke image module-finite over Λ[Δ_N] T_N⊂End_D(C_N), an ideal I_N with I_N^δ=0, complete local R_N, continuous local surjections R_N→T_N/I_N and R∞→T completed-tensor_Λ R_N. The Λ[Δ_N] actions, local deformation actions, and all maps are compatible. Supply derived augmentation isomorphisms C_N⊗ᴸ_{Λ[Δ_N]}Λ≅C_0. The induced Hecke maps land in T_0 and are surjective after quotient by I_0; do not require surjectivity onto T_0. Supply augmentation ring isomorphisms R_N⊗_{Λ[Δ_N]}Λ≅R_0, compatible with R∞ and with the Hecke quotient after also removing the images of I_N. For paired systems supply the corresponding modulo-π isomorphisms of rings/complexes, equality of residual derived Hecke images, and equality of residual deformation maps after quotient by both residual error ideals. Fixed framings and each isomorphism belong to the data; no transition maps between distinct N are assumed. Uniform ranks/degree bounds are deduced from the common finite residual complex and P7 minimality, or supplied explicitly for the broader bounded-complexity formulation. In the paired version Rloc/π≅Rloc′/π induces R∞/π≅R∞′/π using the same g; the chosen residual maps of framed deformation rings, of finite complexes in D((Λ/π)[Δ_N]), and of their derived Hecke images commute. The two error ideals are mapped into the common residual Hecke image and their sum is retained.

Additional hypotheses: All maps use the common complete local residue k; every unframed/framed identification and residual diagram specified in the statement is supplied. δ≥1, h fixed and the finite-level kernels inside p^N Z_p^h ensure actual cofinality. The Hecke algebras act in the derived category; no strict simultaneous chain lifts are assumed.

Proof route: Use existing complete-local coefficient and derived-category carriers. Record the finite-level group/ring/complex data, chosen augmentations, residual diagrams and uniform nilpotent errors; no arbitrary proposition stands for the diagrams. Pass to framed minimal free representatives: B_N=T[Δ_N], common profile r_i=dim_k H^i(C_0⊗ᴸk). The suggested typed core records only the available native carriers; its exact omissions are listed in prototypeCoverage.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.4.1, pp.1053–1054.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-residual-ranks`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`.

Uses: ACC §6.4.1–6.4.3, pp.1053–1054: Provides exactly the simultaneous unprimed/primed finite-level hypotheses used by patching. DeformationAndDerivedPatchingAlgebra:P9: Supplies a bounded patched complex, deformation quotient map and augmentation before depth/support arguments; arithmetic consumers verify this data.

API:

- `FinitePatchDatum.rank_bound` (projection): The common rank profile vanishes outside one recorded integer interval.
- `FinitePatchDatum.quotient_action` (projection): The composite R∞→framed R_N→framed T_N/I_N is surjective; its target is the quotient, not the full Hecke image.
- `FinitePatchDatum.finite_level_augmentation` (compatibility): The native free representative after killing group and frame variables is isomorphic in D(Λ) to the fixed C_0.

Unit tests:

- `patch_datum_one_degree` (computation): If the common residual rank profile is one in degree zero and zero elsewhere, every framed free model has zero differential.
- `patch_datum_no_increasing_rank` (non-example): There is no datum with rank one in every integer degree: no finite support interval can contain that profile.
- `patch_datum_error_exponent` (degenerate): At δ=1, each error ideal is zero, so the quotient Hecke action is the full Hecke action.

### Coordinate and coefficient APIs

#### Extensionality for based presentations

**Lemma:** `PatchPresentation.ext` (`presentation-ext`).

For two presentations over B with common profile r, equality of all differential matrices implies equality of presentations.

Proof route: Use structure extensionality; proof fields are proof-irrelevant.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`.

#### Coordinates of native terms

**Lemma:** `PatchPresentation.complex_X` (`presentation-coordinates`).

For every i, the native term of a presentation is B-linearly equivalent to B^{r_i}.

Proof route: Unfold the native representative and use its chosen standard basis.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Definition 2.2.5, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`.

#### Native successor differential

**Lemma:** `PatchPresentation.complex_d` (`presentation-differential`).

The chosen native term equivalences identify the successor differential with its recorded matrix acting on columns.

Proof route: Use CochainComplex.of and the matrix-to-linear-map correspondence.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Definition 2.2.5, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`.

#### Native nonsuccessor vanishing

**Lemma:** `PatchPresentation.complex_shape` (`presentation-shape`).

Every nonsuccessor differential of the native representative vanishes.

Proof route: Use the nonsuccessor branch of CochainComplex.of.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Definition 2.2.5, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`.

#### Coefficient change on entries

**Lemma:** `PatchPresentation.changeCoeff_d` (`coefficient-change-entry`).

The successor matrix after f is the entrywise image under f.

Proof route: Unfold the entrywise construction.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.3, p.1054.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coefficient-change`.

#### Identity coefficient change

**Lemma:** `PatchPresentation.changeCoeff_id` (`coefficient-change-identity`).

Changing a presentation along the identity ring map gives the same presentation.

Proof route: Use entrywise identity and presentation extensionality.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.6, p.1055.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coefficient-change`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`.

#### Composite coefficient change

**Lemma:** `PatchPresentation.changeCoeff_comp` (`coefficient-change-composition`).

Changing along f and then g equals changing along g∘f.

Proof route: Compare the entries and apply extensionality.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.6, p.1055.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coefficient-change`, `DeformationAndDerivedPatchingAlgebra:P8/coefficient-change-entry`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`.

#### Selected coefficient fibre

**Lemma:** `finiteGermEquiv_fibre` (`finite-germ-fibre`).

The representative of a finite coefficient germ equals its evaluated value on an F-large set.

Proof route: Use the selected finite fibre.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.2, p.12.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-coefficient-germ`.

#### Naturality of finite coefficient evaluation

**Lemma:** `finiteGermEquiv_natural` (`finite-germ-naturality`).

Finite coefficient evaluation commutes with a ring map between finite commutative rings.

Proof route: Map the selected fibre; uniqueness of the selected value gives the equality.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.2, p.12.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-coefficient-germ`, `DeformationAndDerivedPatchingAlgebra:P8/finite-germ-fibre`.

#### Patched matrix entry

**Lemma:** `ultrapatch_d` (`ultrapatch-entry`).

Each patched matrix entry is finiteGermEquiv of the family of that entry.

Proof route: Unfold the matrix construction.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.7, p.1056.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes`.

#### Constant complex family

**Lemma:** `ultrapatch_const` (`ultrapatch-constant`).

A constant family of finite coefficient presentations patches to its original presentation.

Proof route: Evaluate constant matrix entries and compare presentations.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`.

#### Restriction to a large set

**Lemma:** `ultrapatch_eventuallyEq` (`ultrapatch-eventual-equality`).

Presentations equal on an F-large subset have equal patched presentations.

Proof route: Each pair of matrix-entry families has equal germs.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes`, `mathlib:Filter.Germ.coe_eq`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`.

### Finite selection and decorated compactness

#### Finitely many bounded matrix codes

**Lemma:** `bounded_presentation_finite` (`bounded-presentation-finite`).

If B is a finite commutative ring and r vanishes outside a fixed finite interval [a,b], the type PatchPresentation B r is finite. The square-zero presentations form a subset of the finite product of successor matrix entries. Arbitrarily long complexes are excluded.

Proof route: Restrict the differential data to the finitely many nonempty source/target terms in [a,b]. Finite coefficient sets and finite matrix sizes give a finite code space; square-zero is a subset condition. All other matrices are uniquely zero because one rank is zero.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`.

#### Select a bounded rank pattern

**Lemma:** `bounded_rank_pattern` (`bounded-rank-pattern`).

For r_N with common support [a,b] and r_N(i)≤D, a fixed F selects a single profile r with r_N=r on an F-large set. The choice need not be the same for a different filter.

Proof route: Encode the profile by its finitely many coordinates in {0,…,D}. Select one finite code via the ultrafilter and restore the forced-zero outside coordinates.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.6 and Remark 2.2.8, p.13.

Prerequisites: `mathlib:Ultrafilter.eventually_exists_iff`.

#### Residual ranks give the common presentation size

**Lemma:** `residual_rank_profile` (`residual-rank-profile`).

Over a local coefficient ring B with residue k, a minimal free representative has rank r_i=dim_k H^i(C⊗ᴸ_Bk). In particular a common finite residual complex gives common degree bounds and ranks, independent of N and of the open quotient J. The suggested linear-rank signature records the zero-differential native representative; the homology equality is imported from P7.

Proof route: Use P7 minimality so the residual differential is zero. Identify each residual term with its own cohomology, then use the fixed residual augmentation identification.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.3, p.1054.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coefficient-change`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-coordinates`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-residual-ranks`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`.

#### Cofinality of finite group-ring levels

**Lemma:** `quotient_cofinal` (`quotient-cofinal`).

For S∞=T[[Z_p^h]] and Δ_N with kernel contained in p^N Z_p^h, ker(S∞→T[Δ_N]) is eventually contained in every open ideal J. Thus I_J is cofinite and belongs to the fixed F≤cofinite. The uniform h and unbounded p-power level are essential. The native ideal estimate prototype proves only the final K_N≤m^N implication; R03.1 supplies the actual completed group-algebra presentation/cofinality estimate.

Proof route: The standard p^N group quotient has relations (1+z_i)^(p^N)−1; these tend to zero in the (π, coefficient, group, frame)-adic topology. The map to Δ_N factors through the standard p^N quotient, so its kernel is contained in that standard kernel. Use the complete local topology to find a sufficiently small standard kernel inside J; intersect with the fixed cofinite ultrafilter.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.3, p.1054.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

#### An ultrafilter selects one based model

**Lemma:** `stable_presentation` (`stable-presentation`).

With finite B and bounded common r, there is an F-large set on which P_N equals the based presentation ultrapatch F P. This concerns chosen matrices; an intrinsic comparison of perfect objects is by isomorphism.

Proof route: Apply finite witness selection to the type of bounded presentation codes. Evaluate each selected constant entry to identify the code with the patched one.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation-finite`, `mathlib:Ultrafilter.eventually_exists_iff`, `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-entry`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`.

#### Compare finite germ evaluation with localization

**Lemma:** `finite_product_localization` (`finite-product-localization`).

For finite commutative local B and F, let x_F⊂∏_N B consist of functions whose selected value lies in the maximal ideal of B. This is prime, and (∏_N B)_(x_F)≅B, carrying each function to its finiteGermEquiv value. The native signature takes the prime and its explicit membership characterization as input; primehood follows as the inverse image of the residue-field zero ideal.

Proof route: The evaluation map onto B is a ring homomorphism, so x_F is its inverse image of the maximal ideal. It sends the localization denominators to units. An element killed on an F-large set is annihilated by that set’s characteristic idempotent, which lies outside x_F; therefore the localized kernel vanishes. Constant functions give surjectivity and identify the inverse.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.2, p.12.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-coefficient-germ`, `DeformationAndDerivedPatchingAlgebra:P8/finite-germ-fibre`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Localized product coordinates

**Lemma:** `ultrapatch_module_coordinates` (`ultrapatch-module-coordinates`).

For finite commutative B and d<∞, Germ(F,B^d) is B-linearly equivalent to B^d, compatibly with finite coordinate projections and B-scalar multiplication. For based fixed-rank terms this is the module comparison in the localized-product construction.

Proof route: Evaluate finitely many coordinates. Intersect their selected fibres to compare with the unique tuple value. Use addition and constant B-scalar compatibility; constant tuples give the inverse.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Lemma 2.2.2 and Remark 2.2.8, pp.12–13.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-coefficient-germ`, `DeformationAndDerivedPatchingAlgebra:P8/finite-germ-naturality`.

#### Finite quotient change commutes with patching

**Lemma:** `ultrapatch_baseChange` (`ultrapatch-base-change`).

For a ring map B→D between finite coefficient rings, changeCoeff of ultrapatch over B equals ultrapatch of the changed presentations over D, with the same fixed F and rank profile. Derived interpretation uses bounded free representatives.

Proof route: Apply naturality of finite evaluation to every matrix entry. Use presentation extensionality. Invoke P7 for the derived scalar-change comparison; this avoids assuming flatness of a quotient.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.10(4), p.1057.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-entry`, `DeformationAndDerivedPatchingAlgebra:P8/finite-germ-naturality`, `DeformationAndDerivedPatchingAlgebra:P8/coefficient-change-entry`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-ext`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Discard finitely many levels

**Lemma:** `ultrapatch_cofinite` (`ultrapatch-cofinite`).

If F≤cofinite, changing a presentation family at finitely many indices leaves its patched presentation equal. Extending a family defined only on I_J by arbitrary values at the finite complement is therefore harmless.

Proof route: The complement of the exceptional finite set belongs to F. Apply eventual equality; no statement about different F is used.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.7, p.1056.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-eventual-equality`.

#### Patch supplied comparisons of finite models

**Lemma:** `ultrapatch_iso_of_eventually_iso` (`ultrapatch-eventual-isomorphism`).

If bounded fixed-rank P_N over finite B are isomorphic to a fixed Q on an F-large set, the patched native complex is isomorphic to Q. A comparison is chosen from the finite set of chain isomorphisms; this is not a canonical comparison without supplied identifications.

Proof route: There are finitely many component matrices for a chain isomorphism and its inverse within the bounded interval. Choose their values on one large set, preserving inverse and chain equations. Evaluate to obtain an actual complex isomorphism.

Source: [GN](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), Remark 2.2.8, p.13; ACC Proposition 6.4.10(3), p.1057.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/stable-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation-finite`, `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-constant`, `mathlib:Ultrafilter.eventually_exists_iff`.

#### Uniform finite derived endomorphism codes

**Lemma:** `finite_end_cardinal` (`finite-end-cardinal`).

For finite B and a bounded based free presentation P with ranks r_i supported in [a,b], |End_D(B)(QP)|≤|B|^(Σ_(i=a)^b r_i²). Hence all derived Hecke images have uniformly bounded finite cardinality at a fixed open coefficient quotient. The derived-to-chain comparison is a surjection through homotopy classes, not an injection of derived maps into chain maps.

Proof route: Encode graded chain endomorphisms by the finite product of r_i-square matrices; chain equations restrict that finite set. Use P7 bounded-projective K-projectivity and the pinned Qh morphism bijection: every derived endomorphism has a chain representative, modulo homotopy. A quotient of a finite set cannot have larger cardinality.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.4 and proof of Proposition 6.4.10(2), pp.1055–1057.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coordinates`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-native-complex`, `mathlib:CochainComplex.IsKProjective.Qh_map_bijective`, `DeformationAndDerivedPatchingAlgebra:P7`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`.

#### Select the full finite Hecke decoration

**Lemma:** `stable_hecke_decoration` (`stable-hecke-decoration`).

At a fixed finite quotient B, with a stabilized based complex and a fixed finite deformation source quotient A, the derived Hecke image, its error ideal and the deformation homomorphism are simultaneously constant on an F-large subset after their supplied representative identifications. Encode image and ideal as subsets of the finite derived endomorphism carrier E, and the source map as a function A→E; every ring/ideal identity is retained.

Proof route: The ambient endomorphism ring E is finite. Its subsets and functions from the finite source A form a finite decoration-code set. Select the whole code at once so action and error compatibilities survive together.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.10(2),(5), pp.1056–1057.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-end-cardinal`, `DeformationAndDerivedPatchingAlgebra:P8/stable-presentation`, `mathlib:Ultrafilter.eventually_exists_iff`.

#### Finite deformation quotient stabilization

**Lemma:** `ultra_deformation_quotient` (`ultra-deformation-quotient`).

If each R(d,J,N) is a quotient of the same finite A=R∞/m∞^e(d,J), a fixed F selects one kernel K⊂A on a large set. Thus the fixed-filter deformation patch is A/K, canonically with its supplied quotient maps, and R∞ maps onto it. This does not postulate an algebra structure on Mathlib’s varying-type Filter.Product.

Proof route: Encode the kernels as subsets of finite A. Select a single kernel on a large subset; the first isomorphism theorem identifies all selected quotient rings with A/K. The product localization or equivalent quotient code preserves the resulting map from A.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.3 and Lemma 6.4.8, pp.1054,1056.

Prerequisites: `mathlib:Ultrafilter.eventually_exists_iff`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

#### Uniform deformation jet through the Hecke quotient

**Lemma:** `uniform_deformation_exponent` (`uniform-deformation-exponent`).

For each fixed open J there is d_0(J), independent of N∈I_J, such that the surjection R_N⊗_{Λ[Δ_N]}S∞/J→T(J,N)/I(J,N) kills m_(R_N)^d for d≥d_0(J). Keep a power of the entire maximal ideal, not merely powers of individual elements. The native signature exposes the uniform target-ideal nilpotence bound; the requested coefficient API and finite code lemma supply it.

Proof route: Source proof: a uniform residual nilpotence bound is transported through the finite length coefficient filtration, then through the bounded ghost-power theorem. Equivalent finite-code proof: fixed rank and finite B bound all possible finite local Hecke/error quotient rings; each maximal ideal is nilpotent, so the finite set has a maximum nilpotence exponent. Locality maps m_(R_N) into the target maximal ideal, giving the whole ideal-power kernel containment. The named filtered-complex route is imported from P7 if used; individual element powers alone are not an ideal-power conclusion.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.4, p.1055.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/finite-end-cardinal`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`, `IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-annihilator-power`.

#### Compatible finite patch data choices

**Lemma:** `compatible_patch_choices` (`compatible-patch-choices`).

A cofiltered inverse system of nonempty finite decorated patch-data types has a compatible section. In the CG application these include maps R∞→R/d_n, based complexes over S_n/π^n, actions at every lower quotient and framing quotient, and the fixed top augmentation. Before applying compactness, verify restriction functoriality and retain a cofinal sequence of level indices tending to infinity.

Proof route: Import from R03.5 the finite decorations and their restriction maps, and ensure the complex matrix codes are included. For each finite truncation, arbitrarily large input levels provide a realization; stable-image finite fibres are nonempty. Apply the pinned finite-system compactness theorem to these stabilized fibres.

Source: [CG](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Theorem 6.3 construction proof, PDF pp.91–92.

Prerequisites: `mathlib:nonempty_sections_of_finite_cofiltered_system`, `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation-finite`, `DeformationAndDerivedPatchingAlgebra:R03.5`.

### Limits, actions, augmentation, and comparisons

#### Complete a compatible based tower

**Theorem:** `inverse_limit_presentation` (`inverse-limit-presentation`).

Let S be m-adically complete. For each n≥0 take a presentation P_n over S/m^(n+1) with the same r and based reduction equalities at consecutive levels. Then there is a presentation P over S whose reduction is P_n for every n. For a bounded r this is the bounded free chain-level patch; arbitrary infinite r does not give perfectness. Derived comparisons first require minimal strictification and compatible bases.

Proof route: Use P7 minimality and K-projective lifting to choose strict consecutive coefficient-change isomorphisms and compatible bases. Apply native adic completeness to every compatible scalar matrix entry. The square-zero equations hold modulo every m^n, hence hold in S by separatedness. Reduction preserves all the chosen coordinate identifications.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 6.4.11 and Proposition 6.4.12(1), pp.1057–1058; KT Lemma 2.13(1), p.11.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/bounded-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/presentation-coefficient-change`, `mathlib:AdicCompletion.of_bijective_iff`, `DeformationAndDerivedPatchingAlgebra:P7/minimal-homotopy-equivalence-is-iso`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Finite patched terms

**Lemma:** `patched_terms_finite` (`patched-terms-finite`).

Every degree term of a patched based presentation over S is a finitely generated S-module. No assertion that S is finite over R∞ is required.

Proof route: Transfer the standard finite coordinate generators through the term equivalence.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(1), p.1058.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coordinates`.

#### Free patched terms

**Lemma:** `patched_terms_free` (`patched-terms-free`).

Every term of the based patched presentation is finite free over S, with its recorded rank. The freeness is over the completed group/framing coefficient ring, not automatically over a deformation ring.

Proof route: Transport the standard coordinate basis.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(1), p.1058.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coordinates`.

#### Bounded patched representative

**Lemma:** `patched_support` (`patched-support`).

If the common r vanishes outside [a,b], every term of the patched representative outside [a,b] is zero. Combining this with finite free terms realises P7 perfect-object for Q(P). Bounded support of terms is stronger than merely bounded cohomology.

Proof route: The standard module in rank zero is zero. Use the rank-support hypothesis separately from finite generation. Apply the P7 definition of a perfect object to this bounded free representative.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(1), p.1058.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/presentation-coordinates`, `DeformationAndDerivedPatchingAlgebra:P8/patched-terms-finite`, `DeformationAndDerivedPatchingAlgebra:P8/patched-terms-free`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

#### Finite cohomology of the patched complex

**Lemma:** `patched_cohomology_finite` (`patched-cohomology-finite`).

For Noetherian S, every H^i of the based patched complex is a finitely generated S-module, including integral torsion. This says nothing about being concentrated in a single degree or nearly faithful.

Proof route: The cycle module is a submodule of the finite term, hence finite over the Noetherian ring. The cohomology module is its quotient by boundaries.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(1), p.1058.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/patched-terms-finite`, `DeformationAndDerivedPatchingAlgebra:P7`, `mathlib:MvPowerSeries.isNoetherianRing`.

#### Uniform error survives the limit

**Lemma:** `patched_error_nilpotent` (`patched-error-nilpotent`).

For T∞=lim_J T(J,∞), the ideal I∞ consisting of compatible members of I(J,∞) satisfies I∞^δ=0. Prove vanishing in all coordinate projections and use their joint injectivity; a varying exponent would not suffice.

Proof route: Each finite quotient error ideal has the same exponent δ. Project each product of δ elements into every quotient; all coordinates vanish. Joint injectivity of inverse-limit coordinates forces the product to vanish, and finite sums give the ideal-power statement.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 6.4.9(1) and Definition 6.4.11, pp.1056–1058.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/stable-hecke-decoration`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Derived Hecke action on the patched complex

**Theorem:** `patched_hecke_injective` (`patched-hecke-injective`).

T∞ embeds into End_D(S∞)(C∞). Its action is the inverse limit of the finite quotient derived actions using the canonical Hom_D completion isomorphism for bounded free complexes over complete Noetherian local S∞. The topology is the finite quotient topology, so the resulting action is continuous in that sense. It is not a strict chain action or a replacement by the cohomological Hecke image.

Proof route: Import P7’s Hom_D(C,D)≅lim Hom_D(C_J,D_J), derived from finite Hom-complex and homotopy modules and the Mittag–Leffler condition. The inclusions at finite quotients give an injective map from the inverse Hecke ring into that inverse endomorphism ring. Transport through the completion isomorphism; the finite projection maps determine continuity.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(2), p.1058; KT Lemma 2.13(3), pp.11–12.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/inverse-limit-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/patched-support`, `DeformationAndDerivedPatchingAlgebra:P8/stable-hecke-decoration`, `DeformationAndDerivedPatchingAlgebra:P7`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`.

#### Deformation maps onto the Hecke error quotient

**Theorem:** `patched_deformation_surjective` (`patched-deformation-surjective`).

The finite deformation maps induce a continuous surjection R∞→T∞/I∞, factoring through α(R∞)=lim_(d,J) R(d,J,∞). Finite error-ideal inverse systems satisfy Mittag–Leffler, so T∞/I∞≅lim_J T(J,∞)/I(J,∞). Compatibility and compactness or finite inverse limits give surjectivity. No map R∞→T∞ is inferred.

Proof route: Pass the stabilized deformation/error surjections to the compatible finite quotient diagrams. Use P7 finite-system exactness to identify the error quotient of the inverse limit. The complete local source is compact; finite fibre conditions are closed and nested. Nonempty finite fibres have a common point, and jointly injective target projections identify the lift.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 6.4.9(2) and Proposition 6.4.12(3), pp.1056,1058–1059.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultra-deformation-quotient`, `DeformationAndDerivedPatchingAlgebra:P8/uniform-deformation-exponent`, `DeformationAndDerivedPatchingAlgebra:P8/stable-hecke-decoration`, `DeformationAndDerivedPatchingAlgebra:P8/patched-error-nilpotent`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Choose the patched coefficient action on the deformation ring

**Theorem:** `patched_scalar_lift` (`patched-scalar-lift`).

Choose a continuous Λ-algebra lift S∞→R∞ of the scalar map S∞→α(R∞). Existence uses finite-variable complete local formal smooth lifting over Λ, with variable images in the maximal ideal. For paired modulo-π systems the lifts can be chosen compatibly modulo π by the exact fibre-product diagram in ACC Remark 6.4.14. These choices are not canonical. They make R∞→T∞/I∞ S∞-linear, retaining all framing variables.

Proof route: Use the R03.1 continuous complete-local power-series lifting contract to lift the finitely many scalar variable images. For a pair, first lift compatibly through the fibre-product quotient matching α and the fixed residual identification. Continuity plus the complete power-series universal property assembles the chosen variable lifts. The native prototype exposes the compatibility equality for a supplied lift; existence/topological/residual conditions are omitted until the coefficient category has its exact signature.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.14, p.1059.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

#### Derived deformation action with a supplied lift

**Theorem:** `deformation_derived_action_of_lift` (`deformation-derived-action-of-lift`).

Given the continuous derived Hecke action T∞→End_D(C∞), the quotient map f:R∞→T∞/I∞, and a supplied continuous ring lift l:R∞→T∞ with q∘l=f, composition gives a continuous derived R∞ action. This is a conditional result. ACC §6.4 provides f, not l; S∞→R∞ from formal smoothness has the opposite direction and does not supply l.

Proof route: Compose the supplied lift with the genuine derived Hecke action. Check its quotient equals f, and its finite projections are continuous. Do not promote a quotient action to a derived action without this lift.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.12(2),(3), pp.1058–1059.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/patched-hecke-injective`, `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`.

#### Derived augmentation of the patched complex

**Theorem:** `derived_augmentation` (`derived-augmentation`).

With S∞=Λ[[group variables, framing variables]] and the augmentation ε:S∞→Λ, C∞⊗ᴸ_{S∞}Λ≅C_0. For an open J⊃a∞ use S∞/J≅Λ/s(J), the supplied finite augmentation isomorphisms, and their compatible patched comparisons. The completion/Hom comparison then identifies the augmentation with C_0 over Λ. A group-only augmentation retains Λ[[framing variables]], and equals the framed original complex.

Proof route: At each J containing the full augmentation ideal, compare with the fixed C_0⊗ᴸΛ/s(J) using its supplied finite-level isomorphisms. Use coefficient-change compatibility and P7 completion/derived Hom comparison to lift the compatible finite comparisons. Compute derived scalar change using the patched bounded free representative; kill group and frame variables together only for the Λ-valued assertion.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.10(3) and Lemma 6.4.16, pp.1057,1059–1060.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-base-change`, `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-eventual-isomorphism`, `DeformationAndDerivedPatchingAlgebra:P8/inverse-limit-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/patched-support`, `DeformationAndDerivedPatchingAlgebra:P7`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`.

#### Coefficient variables survive augmentation

**Lemma:** `augmentation_retains_coefficients` (`augmentation-retains-coefficients`).

The full group/frame augmentation from Λ[[z_1,…,z_h,x_1,…,x_j]] to Λ sends each constant coefficient c∈Λ to c. If Λ itself has formal variables, they survive. Its target is O only in the specialization Λ=O. The node uses Mathlib constantCoeff rather than defining another augmentation map.

Proof route: Use the constant-term ring map in the finite-variable native power-series carrier. Keep the coefficient ring parameter Λ independent of group and framing indices.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §6.4.1 and Lemma 6.4.16, pp.1053,1059–1060.

Prerequisites: `mathlib:MvPowerSeries.isNoetherianRing`, `DeformationAndDerivedPatchingAlgebra:P8/derived-augmentation`.

#### Deformation augmentation onto the original ring

**Theorem:** `unframed_deformation_surjective` (`unframed-deformation-surjective`).

The chosen scalar lift and compatible finite ring augmentation maps give a surjection R∞/a∞R∞→R_0. All group and framing variables generating a∞ are killed. The factorization is derived from the finite maps, not from the complex augmentation alone.

Proof route: At augmented coefficient quotients, identify the deformation patch with the corresponding finite quotient of R_0 using the given ring isomorphisms. Use compatible finite lifts to obtain the continuous surjection R∞→R_0. The image of a∞ lies in the kernel, so the map factors through the actual quotient and remains surjective.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 6.4.15, p.1059.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/patched-scalar-lift`, `DeformationAndDerivedPatchingAlgebra:P8/ultra-deformation-quotient`, `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

#### Retain the specialization error ideal

**Lemma:** `augmentation_hecke_error` (`augmentation-hecke-error`).

Under C∞⊗ᴸΛ≅C_0 the map T∞→T_0 is surjective after quotient by I_0. Write I_(∞,0) for the image of I∞ in T_0/I_0. Its δ-th power is zero. The map from R∞/a∞ to (T_0/I_0)/I_(∞,0) agrees with the map through R_0. Neither full surjectivity onto T_0 nor disappearance of I_(∞,0) is asserted.

Proof route: Use the finite-level Hecke image augmentation diagrams, keeping I_0. Patch their quotient surjections and compatible ring maps. Map the uniform nilpotence equation for I∞ into T_0/I_0.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 6.4.16, pp.1059–1060.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/derived-augmentation`, `DeformationAndDerivedPatchingAlgebra:P8/unframed-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:P8/patched-error-nilpotent`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Comparison for fixed finite quotient data

**Theorem:** `transition_choices_comparison` (`transition-choices-comparison`).

With the same F and the same compatible finite quotient objects/identifications, any two chosen strict chain lifts produce canonically isomorphic patched derived objects. The unique comparison reduces to the fixed identity/comparison at every finite quotient. More generally supplied coherent finite isomorphisms give a comparison. No comparison between arbitrary ultrafilters is claimed.

Proof route: Apply the P7 inverse-limit derived Hom bijection to the supplied coherent finite comparison maps and inverses. Lift both maps, then check their compositions reduce to identities. Injectivity of the Hom comparison gives inverse equations and uniqueness; the native prototype exposes this final faithful-reduction check.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Remark 6.4.13, p.1059.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/inverse-limit-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/patched-hecke-injective`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Residual comparison of paired patched complexes

**Theorem:** `residual_complex_comparison` (`residual-complex-comparison`).

For paired systems as in finite-level-patching-data, the compatible finite residual isomorphisms induce C∞⊗ᴸ_{S∞}S∞/π≅C′∞⊗ᴸ_{S∞}S∞/π. The common F and the compatibility of every finite residual identification are required; equal residual dimensions alone do not suffice.

Proof route: Apply coefficient change to the finite quotient patch, obtaining the J+(π) systems. Patch the supplied residual isomorphisms on the same filter. Use P7 Hom completion over S∞/π to lift the compatible finite isomorphisms and their inverses.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.17(1), pp.1060–1061.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/ultrapatch-base-change`, `DeformationAndDerivedPatchingAlgebra:P8/transition-choices-comparison`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Equality of residual derived Hecke images

**Theorem:** `residual_hecke_images` (`residual-hecke-images`).

Under the preceding residual isomorphism, T∞ and T′∞ have the same image in End_D(S∞/π)(C∞/π). This common image is derived; it may have nonzero ghosts. Equality follows from compatible finite residual image equalities and compact inverse-limit lifts, not from matching cohomology actions alone.

Proof route: Identify the finite residual images via the given finite residual isomorphisms. The source Hecke rings are compact inverse limits of finite rings; finite fibres of a desired image element are closed, nonempty and nested. Choose a compatible preimage and use jointly faithful finite endomorphism projections to prove equality of images.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.17(2), pp.1060–1061.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/residual-complex-comparison`, `DeformationAndDerivedPatchingAlgebra:P8/stable-hecke-decoration`, `DeformationAndDerivedPatchingAlgebra:P8/patched-hecke-injective`, `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Residual deformation actions modulo both errors

**Theorem:** `residual_quotient_actions` (`residual-quotient-actions`).

Identify R∞/π≅R′∞/π and the common residual derived Hecke image Tbar∞. Let Ibar∞ and I′bar∞ be the two residual error images. The deformation maps agree in Tbar∞/(Ibar∞+I′bar∞), and consequently their actions on H*(C∞/π)/(Ibar∞+I′bar∞) agree. Equality in the full residual derived endomorphism ring or before quotient by both ideals is not asserted.

Proof route: Use the finite residual ring/action diagrams from the original data, already quotiented by the sum of both error images. Pass to compatible finite residual quotients. Joint injectivity of the inverse-limit projections identifies the two ring maps; the resulting quotient acts on the indicated cohomology quotient.

Source: [ACC](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Proposition 6.4.17(3), pp.1060–1061.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/residual-hecke-images`, `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`, `DeformationAndDerivedPatchingAlgebra:P7`.

#### Calegari–Geraghty bounded complex construction

**Theorem:** `cg_patched_complex` (`patched-perfect-complexes-in-a-range-of-degrees`).

Let O be a complete DVR with finite residue k and uniformizer π. Let q,j,l₀ be nonnegative integers with q+j≥l₀, S∞=O[[Z_p^q]], S_N=O[(Z/p^N)^q], and O□=O[[z₁,…,z_j]]. Let R∞ and R be complete Noetherian local O-algebras with residue k and dim R∞=1+j+q−l₀. Require H a finite R-module, so H is π-adically complete. Let V be a finite-dimensional zero-differential k-complex supported in [0,l₀], with H^(l₀)(V)≅H/π. For N≥1 supply perfect D_N over S_N/π^N with a bounded free representative of D_N whose entrywise reduction to k is V. For every M≥N≥0, M≥1 and 1≤n≤M, supply commuting S_M□ and R∞ actions on H*(D_M□⊗_(S_M/π^M)S_N/π^n), compatible with reduction N→N′ and n→n′. Supply continuous local surjections φ_N:R∞→R and top augmentation identifications for 1≤n≤N, H^(l₀)(D_N□⊗_(S_N□/π^N)O/π^n)≅H/π^n, R∞-linear via φ_N and compatible in n. Require the scalar S_M□ image on each indicated cohomology group to lie in the R∞ image. For the datum attached to level M, require the image of the augmentation ideal of S_N□ on each indicated sublevel to be contained in the image of ker φ_M. (At M=N this is the φ_N condition.) For each finite patch level L≤M also supply these actions and compatibility on all framing quotients by ideals I with (z₁^L,…,z_j^L)⊂I⊂(z₁,…,z_j), after coefficient reduction with n≤L. These actions are input data; they are not inferred by commuting cohomology with a potentially nonflat quotient. Then the decorated cofinal compactness construction gives a based bounded free P∞ over S∞ supported in [0,l₀], its framed extension P∞□, a continuous surjection φ∞:R∞→R, commuting compatible R∞ actions on H*(P∞□), and H^(l₀)(P∞□)/a∞≅H, R∞-linear via φ∞. The scalar image is contained in the deformation image; hence every framed cohomology module is finite over R∞. Here a∞ kills both group and framing variables. Top cohomology commutes with its ordinary augmentation quotient because there is no term above l₀. A prescribed whole derived augmentation requires the separate full finite-level augmentation data. This construction retains only cohomology actions. The minimal resolution/depth/support conclusions of the source are P9 targets, with any finite depth formula applied to a nonzero framed top module (E9, E14).

Additional hypotheses: The complete local rings have common finite residue field k and the specified numerical dimension. H is finite over R, or replace this by explicitly supplied π-adic completeness plus the finite residual generation needed to recover H; the finite-module convention here is definite. All M,N,n reductions and frame quotients are part of the commuting cohomology action/augmentation data, not just the top N-level complex. Finite reductions use n≤M, augmentation uses n≤N, and all permitted framing quotients carry supplied compatible actions. E11–E13 explain the checked text’s index and base-change problems.

Proof route: Use the finite decorated types, with cofinal open d_n=(π^n,Ann_R(H)^n) for nonzero finite H and d_n=m_R^n for H=0, complexes at group/π levels, and supplied actions at every lower level and framing quotient. The finite residual top generation makes the former ideals open. Choose a compatible cofinal path by compatible-patch-choices, with level indices going to infinity. Construct the bounded free limit from the compatible matrices; patch its ring maps and all cohomology actions through the finite diagrams. The fixed top augmentation identifications pass to H; the quotient of top cohomology equals top cohomology of the augmented complex because no term lies above l_0. Retain framing variables until the indicated augmentation. Do not infer a derived R∞ action from cohomology actions.

Source: [CG](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Theorem 6.3 and construction proof, PDF pp.90–93; [CGcorr](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf), Items (1),(10), pp.855–856.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:P8/compatible-patch-choices`, `DeformationAndDerivedPatchingAlgebra:P8/inverse-limit-presentation`, `DeformationAndDerivedPatchingAlgebra:P8/patched-terms-free`, `DeformationAndDerivedPatchingAlgebra:P8/patched-support`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:P7`.

## Acceptance and prerequisite completion

Acceptance requires bounded terms, actual coefficient cofinality, a fixed ultrafilter, uniform matrix ranks, the full decorated action data, and the exact quotient targets stated above. The zero complex, a single rank-one term, the unit disk over the two-element field, and reduction of the differential 2 modulo 2 discriminate between chain presentations, derived zero objects, and coefficient change. The principal-filter test checks evaluation; the two-filter test explicitly rules out a false independence assertion. The error-exponent test requires the whole ideal power, while the infinite-rank test rules out an unbounded “perfect” input.

For the completed construction, verify the reduction of every chosen representative, the identity of every finite action diagram, the positive error exponent, and the injective Hom-completion comparison. Verify the augmentation over the correct coefficient ring with the intended framing variables killed. For a pair, test both residual error images and retain their sum. The CG top quotient comparison uses the absence of a term above the top degree; a prescribed full derived augmentation needs its separate finite-level input. P8 acceptance contains no P9 depth or faithfulness conclusion.

The pass is complete at declaration granularity: 52 nodes, 18 API entries, 18 unit tests, and six planets. The stage is **planned**, with two explicit gaps and four requested supplier interfaces; it is not closed. The native suggested file has admitted proofs. Elaboration checks names, carriers, and the displayed signatures, rather than establishing the theorems or the omitted source hypotheses.

Supplier contracts:

- **`DeformationAndDerivedPatchingAlgebra:P7`:** Supply exact native signatures for bounded-projective K-projectivity/K-flatness; derived tensor along coefficient maps with comparison to entrywise free representative change; strictification of minimal compatible quotient models; Hom_D and cohomology inverse-limit comparison over complete Noetherian local rings with finite Artinian quotients; exactness/quotient compatibility of finite Mittag–Leffler systems. KT Lemma 2.13(1)–(3), pp.11–12 and ACC Proposition 6.4.12 are the contracts. Existing minimality nodes are imported by id; do not re-plan them.

- **`DeformationAndDerivedPatchingAlgebra:R03.1`:** Supply the complete local category with finite residue field, finite-variable power-series/complete group-algebra comparison and the cofinal standard p-power group kernels; completed tensor products of the framed local rings; continuous local quotient maps and compactness of complete local finite-residue rings; uniform ideal nilpotence across a finite bounded-cardinality family of local rings; continuous formal-smooth power-series lifting and the paired modulo-π fibre-product lifting contract of ACC Remark 6.4.14. Generic MvPowerSeries and adic completeness are already baseline.

- **`DeformationAndDerivedPatchingAlgebra:R03.5`:** Supply finite decorated patch-data types and the functorial lower-level restriction maps for complete local module patching, including local ring maps, cohomology module action data at all subquotients, framings, top augmentation identifiers and cofinal level choice. P8 adds the bounded matrix-complex codes. CG Theorem 6.3 proof, PDF pp.91–92. Do not re-plan the generic compact finite module/deformation decoration machinery here. In particular the action data at every allowed finite framing quotient must be supplied; do not infer it from an invalid nonflat cohomology base-change identity (E13).

- **`IntegralHeckeAndGaloisDeterminants:IHG.2`:** Import current upstream Layer 2 derived Hecke images, finite derived endomorphism/Hecke modules, chain-homotopy-derived comparison and ideal ghost-power nilpotence. Their atlas node ids are retained as precise compatibility references, not new planning targets.

**Unconditional deformation action is stronger than the patching sources.** ACC Proposition 6.4.12 gives T∞→End_D(C∞) and R∞→T∞/I∞. It supplies neither R∞→T∞ nor a strict chain action. The actual continuous derived R∞ action target requires a chosen continuous quotient lift or an additional theorem establishing one. CG Theorem 6.3 supplies only cohomology actions. The planned conditional node is complete; the stage’s unconditional promise must be corrected or its extra input supplied.

**Native supplier signatures absent from the accepted P7 part.** The precise mathematical contracts are sourced and requested above; the original P7 packet did not finish the derived tensor/completion/coefficient-category APIs. The suggested file states its typed core and final native checks honestly, with the exact omissions enumerated in prototypeCoverage. Elaborating an admitted signature does not close these contracts.

### Exact prototype limits

- `FinitePatchDatum`: The typed core omits the source group-algebra/completed-tensor identification, complete local topology/locality/continuity of R maps, common residual derived isomorphisms, scalar action diagrams, Hecke augmentation maps and paired residual diagrams; it keeps common support, actual native complexes, augmented native isomorphisms, coefficient-kernel cofinality, injective derived Hecke maps, error ideals and quotient deformation surjections. These omitted conditions are spelled out in the full node and require the R03.1/P7 carriers.

- `cg_patched_complex`: The prototype packages the output from an already supplied native bounded presentation, its cohomology actions, and its augmented top comparison. It does not construct these inputs from finite decorated data. The full mathematical node states the corrected CG input system; R03.5 must type its ring maps, all coefficient/framing quotient action diagrams, and top augmentations. The precise continuous φ∞, ordinary top quotient identification, and full scalar-image inclusion are also omitted from the output prototype. It is not an unconditioned existence theorem.

- `patched_scalar_lift`: The prototype checks compatibility of a supplied ring lift. Existence, complete-local continuity and the paired residual choices require the requested R03.1 formal-smooth lifting API.

- `derived_augmentation`: The native signature takes the P7 derived-tensor functor and its representative-computation isomorphism plus the completed augmentation comparison as inputs. Producing them uses the exact requested P7 contracts and finite augmentation hypotheses in the node.

- `residual_rank_profile`: The signature records term finrank of a minimal residual presentation. Its equality with residual cohomology and the assertion that the coefficient homomorphism is the local residue map are supplied by the imported P7 minimal-residual-ranks node.

- `quotient_cofinal`: The prototype is the final ideal-power containment estimate. The completed group-algebra kernel estimate and the implication from actual Δ_N kernel bounds to coefficient cofinality use the requested R03.1 interface.

- `uniform_deformation_exponent`: The prototype takes the uniform target maximal-ideal nilpotence bound as input. Its uniform production uses the finite cardinality/code argument and requested complete-local/finite local coefficient interface, or the source filtered/ghost route via P7 and IHG.2.

- `transition_choices_comparison`: The prototype tests the inverse equations for supplied native comparison lifts and jointly faithful reductions. Producing the coherent Hom lifts and proving uniqueness uses the P7 Hom completion contract.

- `residual_complex_comparison`: The prototype tests the residual inverse equations for supplied comparison lifts and jointly faithful reductions. It does not construct the finite residual arithmetic maps; those are part of the paired datum and the P7 completion contract.

The remaining native checks for injectivity, compact surjectivity, residual image equality, and quotient factorization expose the final algebraic verification on supplied maps. Their construction from the finite data uses the supplier contracts in their mathematical nodes. The supplied-lift action signature expresses the algebraic composition; its continuity is supplied by the continuous input maps. These prototypes do not produce the input systems, completion functors, or comparison lifts.

## Source versions and corrections

The following findings refer to the exact author-hosted CG journal PDF checked in this pass. The publisher's two-page 2022 correction was also read in full. It restores completed-ring brackets; it does not address the additional issues listed here. The current publisher original replacement text was not obtained. No claim of novelty relative to every version or unpublished correction is made. No independent verification verdict is attached in this worker's own pass.

### E8 — error

Locator: Theorem 6.3, hypothesis (2) and conclusion (iv), construction proof inverse-limit ψ∞, Springer-formatted CG.pdf on author page, PDF pp.90–92, SHA-256 as in sources.

Checked assertion: H is only specified as an R-module; finite residual quotients are then used to identify the patched top augmentation with H itself.

Correction or required input: Require H finite over R (as this P8 plan does), or supply the completeness/separatedness and finite residual generation hypotheses that identify H with lim_n H/π^nH. Without such a hypothesis the construction recovers the π-adic completion, not an arbitrary H.

Check: Take q=j=l₀=0, R∞=R=O and H=Frac(O). Set V=0 and D_N=0, all φ_N the identity, all cohomology actions zero. Since π is invertible on H, H/π^nH=0 for every n. All finite-level conditions in the checked statement hold, including its unrestricted n quantifier, and the augmentation ideal is zero. Any bounded finite free patched complex has finite top O-module, so its top augmentation cannot be Frac(O). The inverse finite quotients recover zero. The failure is the missing H→lim_n H/π^nH isomorphism.

Effect: a stated result. Existing correction search: No correction of this issue found in the checked primary records. The published 2022 correction, DOI 10.1007/s00222-021-01095-5, corrects bracket typesetting; novelty beyond the records checked is not asserted.

### E9 — misprint

Locator: Theorem 6.3(iii) and last paragraph of its proof, Springer-formatted CG.pdf on author page, PDF pp.91,93, SHA-256 as in sources.

Checked assertion: The R∞ depth 1+j+q−l₀ is attached in (iii) to top cohomology of P∞ without the framing mark, whereas the proof applies the depth argument to P∞□.

Correction or required input: Attach the formula to H^(l₀)(P∞□). The unframed augmentation in the z variables may have smaller depth. P8 keeps the existence/action construction; P9 must use the framed depth formula.

Check: The final paragraph of the construction proof applies Lemma 6.2 to P∞□ and computes its framed coefficient depth; Theorem 6.4 also uses framed top cohomology. The framing mark in 6.3(iii) is therefore missing. For the intended finite reduction convention 1≤n≤M, take q=l₀=0, j=1, R∞=O[[z]], R=H=O and D_N=(O/π^N)[0]. Framed multiplication gives Htop(P∞□)=O[[z]] of R∞ depth 2; setting z=0 gives Htop(P∞)=O of R∞ depth 1. This example illustrates the symbol correction under the meaningful finite-level convention; it is not claimed to satisfy the separate unrestricted-n typo recorded in E11.

Effect: a stated result. Existing correction search: No correction of this issue found in the checked primary records. The published 2022 correction, DOI 10.1007/s00222-021-01095-5, corrects bracket typesetting; novelty beyond the records checked is not asserted.

### E10 — misprint

Locator: Theorem 6.3 definitions of S∞ and O□, author-hosted journal PDF p.90; published correction items (1) and (10), pp.855–856.

Checked assertion: The author-hosted journal PDF uses single brackets where completed group rings and power-series rings are needed.

Correction or required input: Use S∞=O[[Z_p^q]] and O□=O[[z₁,…,z_j]]. Finite group rings S_N remain ordinary finite group rings.

Check: The construction takes adic limits and uses formal smoothness of the completed coefficient ring. The published correction explicitly restores double brackets in these definitions.

Effect: a stated result. Existing correction search: Calegari–Geraghty, Correction to: Modularity lifting beyond the Taylor–Wiles method, Inventiones 227 (2022), 855–856, DOI 10.1007/s00222-021-01095-5, items (1), (10).

### E11 — misprint

Locator: Theorem 6.3(b),(c), author-hosted journal PDF p.90; finite patch-data range in its proof, pp.91–92.

Checked assertion: The finite complex D_M has coefficients modulo π^M, but the sublevel and augmentation conditions quantify over all n≥1 rather than n≤M (respectively n≤N).

Correction or required input: For finite coefficient reductions use 1≤n≤M in (b) and 1≤n≤N in (c), and compute tensor on bounded free representatives over S_M/π^M. The finite patch-data construction itself only uses n up to the patch level. A derived tensor over the larger ring S_M is a different operation and introduces coefficient Tor.

Check: Already for q=j=l₀=0 and the intended D_N=(O/π^N)[0], H=O, the ordinary top augmentation at n=N+1 is O/π^N and cannot be H/π^(N+1). All data in the construction use n≤N and yield the usual free limit. Restricting n makes these reductions actual maps of coefficient quotient rings.

Effect: a stated result. Existing correction search: No correction of this issue found in the checked primary records; the 2022 correction concerns bracket typesetting. Finding scoped to the author-hosted journal PDF.

### E12 — misprint

Locator: Theorem 6.3(d), author-hosted journal PDF p.90; definition of D_(M,N) in its proof p.92.

Checked assertion: The kernel in the sublevel augmentation condition is indexed by N although the input complex is D_M and N is allowed to be zero; φ_0 has not been defined.

Correction or required input: Use the map φ_M attached to D_M when restricting its augmentation condition to sublevel N. At M=N this is the displayed φ_N condition. The planned node requires this consistent decoration explicitly.

Check: The proof defines the ring map of D_(M,N) by composing φ_M with R→R/d_N, so its augmentation compatibility must use φ_M. The source expression with φ_N is undefined at N=0.

Effect: a stated result. Existing correction search: No correction of this issue found in the checked primary records; the 2022 correction concerns bracket typesetting. Finding scoped to the author-hosted journal PDF.

### E13 — gap

Locator: Theorem 6.3 proof, claimed cohomology/base-change identity for a framing ideal I, author-hosted journal PDF p.92.

Checked assertion: The construction obtains actions on cohomology after every allowed framing quotient I by commuting cohomology with tensor by O□/I.

Correction or required input: Supply the compatible cohomology actions at these framing quotients directly as part of the decorated finite patch datum, or prove a sufficient flatness/derived action lifting statement. The present P8 construction takes the former input. The displayed tensor identity is not valid for all the allowed I.

Check: Let A=O/π² and consider the perfect two-term A[[z]] complex with differential π. Take I=(z²,πz), lying between (z²) and (z). Before quotient its H⁰ is πA[[z]], isomorphic to k[[z]] as a module. Its tensor with A[[z]]/I retains a nonzero formal class π⊗z, but the natural cohomology base-change map kills that class. After quotient the differential also kills the nonzero class z, which is outside the image of the natural map. In fact z acts nontrivially on the tensor H⁰, and acts trivially on H⁰ of the quotient complex, so even the modules are not isomorphic. The issue is coefficient Tor from a nonflat framing quotient, not a convention on cochain indexing.

Effect: the proof. Existing correction search: No correction of this issue found in the checked primary records; the 2022 correction concerns bracket typesetting. Finding scoped to the author-hosted journal PDF.

### E14 — error

Locator: Theorem 6.3(iii), author-hosted journal PDF p.91.

Checked assertion: The depth formula is asserted without excluding zero top cohomology.

Correction or required input: A finite numerical depth assertion must exclude the zero top module or state its zero case separately. This is a requirement for P9’s depth target; the P8 construction includes the zero complex.

Check: Take q=j=l₀=0, R∞=R=O, H=0, V=0 and D_N=0 with identity ring maps. Every finite-level condition holds, and both patched complexes have zero top cohomology. The usual depth of the zero module is infinite, rather than dim R∞=1; under a convention assigning depth zero to it the claimed value still fails. Thus restoring the framing mark alone does not fix the missing nonzero condition.

Effect: a stated result. Existing correction search: No correction of this issue found in the checked primary records; the 2022 correction concerns bracket typesetting. Finding scoped to the author-hosted journal PDF.

The search examined the [author publication listing](https://math.uchicago.edu/~fcale/research.html), the [publisher original and its correction link](https://doi.org/10.1007/s00222-017-0749-x), the [complete published correction](https://doi.org/10.1007/s00222-021-01095-5), and [arXiv 1207.4224 version metadata](https://arxiv.org/abs/1207.4224), on 10 October 2026. The mathematical node uses the restored completed rings, finite-module H, consistent finite coefficient reductions, the input level’s ring map, and supplied framing quotient actions. Its construction conclusion makes no depth claim.

## Sources

- **CG:** Frank Calegari and David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf). Author public version of Inventiones 211 (2018), 297–433; locators below use PDF pages. Read 2026-10-10: §6.1, Theorem 6.3 and its construction proof, PDF pp.90–93. File SHA-256: `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`.

- **ACC:** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; author public journal PDF. Read 2026-10-10: §6.4.1–6.4.17, printed pp.1053–1061 (PDF pp.157–165). File SHA-256: `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02`.

- **GN:** Toby Gee and James Newton, [Patching and the completed homology of locally symmetric spaces](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf). Author public version of J. Inst. Math. Jussieu 21 (2022), 395–458; author pagination. Read 2026-10-10: §2.2, Lemmas 2.2.2–2.2.6, Corollary 2.2.7 and Remark 2.2.8, pp.12–13. File SHA-256: `c248b649dde553ec301d25909aa7c1d3909c146eb8cbb64a8637ea2a2994082d`.

- **KT:** Chandrashekhar Khare and Jack A. Thorne, [Potential automorphy and the Leopoldt conjecture](https://www.dpmms.cam.ac.uk/~jat58/taylor-wiles-hida-leopoldt.pdf). Author version dated 9 August 2016; source of the 2017 journal reference in ACC. Read 2026-10-10: §2.2, Lemma 2.3 and Proposition 2.4, pp.6–7; Lemma 2.5, p.7; Lemma 2.13 and proof, pp.11–12. File SHA-256: `fe1871f0fbb520d0e42feea515f790812f43c641b5c0f8a9c27ab9e7d58af23a`.

- **CGcorr:** Frank Calegari and David Geraghty, [Correction to: Modularity lifting beyond the Taylor–Wiles method](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf). Inventiones mathematicae 227 (2022), 855–856, published 31 December 2021; publisher PDF. Read 2026-10-10: Complete two-page correction; especially items (1) and (10)..

## Atlas landmarks

- Ultrapatching (`ultrapatching-of-perfect-complexes`).
- Complex patching data (`finite-level-patching-data`).
- Patched derived Hecke action (`patched-hecke-injective`).
- Derived augmentation (`derived-augmentation`).
- Residual patching comparison (`residual-complex-comparison`).
- Complex patching theorem (`patched-perfect-complexes-in-a-range-of-degrees`).
