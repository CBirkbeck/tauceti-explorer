# Resolution towers and compactification interfaces

This document specifies the supplemental targets for **AlgebraicModuliForArithmeticGeometry:R09.7a–d**. The [accepted aggregate R09.7 packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json) already owns the local invariant, the resolution algorithm, arbitrary-scheme Cartier separation and the original SNC compactification theorem. Its forty targets are imports here. The new work gives their finite scheme-valued output witnesses, connects regular coefficient data with their completions, and supplies the boundary constructions and meridian calculations used in stable-curve compactification.

All four stages are **planned**. The pass is complete at target level, with eleven supplemental targets, explicit prerequisite routes and eight supplier contracts. The proposed declarations are unchecked; this is a plan for proofs and interfaces. None of the stages is closed. The [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json) and [suggested file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7a.lean) accompany this reader.

## Ownership and conventions

The accepted RS-27 restructuring retains marked transforms, local invariant machinery, resolution and their compactification application here. Ordinary Rees-algebra blowups remain **StableReduction, Layer 4**. We import its blowup universal property, projectivity, exceptional Cartier ideal, strict-transform closure, pivot charts and flat base change. A finite sequence of those existing objects is new interface data, not another construction of a blowup. Stable pointed moduli remain the existing **StableReductionPartII:MC.2** import exposed through **R09.4**. General stacks and their descent carriers remain **SchemeAndStackFoundations:SF.1**. The geometric meridian comparison here ends before the topological identification with Dehn twists.

Unless a statement says otherwise, resolution inputs are smooth finite-type quasi-compact schemes over a characteristic-zero field. A reduced embedded input is specified when smoothness of the strict transform is asserted. Nonreduced inputs have the weaker Hilbert–Samuel conclusion of the accepted owner. The monodromy application is over the complex numbers. Geometric normal crossings is an étale-local property; a labelled strict-SNC boundary additionally has globally smooth branches. Labels may persist with empty support. The empty divisor has the unit ideal, while the zero ideal cuts out the whole scheme.

A blowup step maps the next year to the previous year. A total transform is ideal pullback. A strict transform is the scheme-theoretic closure of the inverse image away from the centre, with its scheme structure. A controlled transform divides the total ideal by the newborn Cartier ideal to the mark. A weak transform removes the actual exceptional multiplicity. These operations have different outputs even when the underlying blowup is an isomorphism. The complement of an ideal J means the complement of the support of the quotient by J.

The prototype uses native schemes, morphisms, ideal sheaf data, ideal pullback and kernel ideals. Its `Imported` namespace contains signature adapters for existing owners where their packaged declarations are absent at the pin. The current Tau Ceti library already contains arbitrary-scheme `Scheme.IdealSheafData.IsEffectiveCartier`; packaging must reuse it. Its flat-pullback API does not imply that blowups are flat. Nonzero regular equations on the relevant source justify the nonflat pullbacks in the geometric arguments below.

### Imported target map

The following identifiers all have prefix `AlgebraicModuliForArithmeticGeometry:R09.7/`. Their exact definitions, theorem hypotheses, API, examples and proof routes remain in the accepted aggregate packet. They are not supplemental nodes.

**R09.7a** imports: `regular-coordinates`, `stalk-order`, `snc-boundary`, `marked-ideal`, `permissible-centre`, `controlled-transform`, `test-equivalence`, `normalized-orders`, `orders-invariant`, `cartier-separation`.

**R09.7b** imports: `maximal-contact`, `coefficient-presentation`, `coefficient-equivalence`, `residual-presentation`, `initial-diagram`, `formal-division`, `hilbert-samuel`, `hs-stabilization`, `standard-certificate`, `finite-degree`, `samuel-jet-ideal`, `samuel-presentation-identity`, `samuel-transform`, `semicoherent-presentation`, `hs-semicoherence`, `exceptional-history`, `invariant-word`, `recursive-invariant`, `invariant-properties`, `monomial-data`, `monomial-decrease`.

**R09.7c** imports: `global-centres`, `termination`, `principalization`, `embedded-resolution`, `resolved-locus`, `preserve-resolved-points`, `local-isomorphism-resolution`.

**R09.7d** imports: `snc-compactification`, `analytic-polydisc`.

The imported local machinery has several conventions that constrain these interfaces. Orders and numerical Hilbert–Samuel data are first defined at closed points; the Jacobson passage to geometric loci is part of the accepted owner. A maximal-contact step needs normalized order one and a derivative producing a regular parameter transverse to the boundary. Its coefficient presentation uses only derivative indices strictly below the mark, with residual marks d−q. The initial-diagram order is graded lexicographic, with total degree first. A finite standard certificate supplies a diagram with its stated comparison to the actual initial diagram; it is not silently identified with that diagram.

The Samuel-transform centre ideal contains the Samuel ideal; the derivative generator bound is strict. The accepted corrections to those two points remain binding. Test-equivalence also retains the three distinct transformation laws: controlled permissible blowups, products adding the artificial coordinate divisor, and exceptional tests using pure total pullback. The restricted exceptional policy retains the distinguished point on the strict transform. Equal initial cosupport does not substitute for equivalence under those test sequences.

For global centres, the Hilbert–Samuel first entry has its pointwise partial order. There can be finitely many incomparable maximal values. The accepted centre construction treats all their disjoint maximal loci; it does not invent a unique greatest value. Termination, the exceptional birth blocks, the monomial final decrease and local-isomorphism compatibility remain those owners' proofs. Local-isomorphism comparison identifies entire surviving towers after empty steps are removed. A claim of functoriality for arbitrary smooth morphisms would need an additional theorem.

## Pinned library inputs

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The ten declaration entries below were checked in that build. Current upstream roadmaps and the current Tau Ceti library were checked separately for reuse; their newer declarations are not attributed to the pin.

- **mathlib:AlgebraicGeometry.Scheme.IdealSheafData** (Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean): Native quasi-coherent affine ideal data, products, powers, support and associated closed subscheme.
- **mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap** (Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean): Actual scheme ideal pullback; orientation is contravariant.
- **mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp** (Mathlib/AlgebraicGeometry/IdealSheaf/Functorial.lean): The pullback along f followed by g is pullback along g and then f.
- **mathlib:AlgebraicGeometry.Scheme.Hom.ker** (Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean): Kernel ideal of a scheme morphism, giving the scheme-theoretic image for quasi-compact morphisms.
- **mathlib:MvPowerSeries.coeff** (Mathlib/RingTheory/MvPowerSeries/Basic.lean): Multi-index coefficient linear map.
- **mathlib:MvPowerSeries.pderiv** (Mathlib/RingTheory/MvPowerSeries/Derivative.lean): Formal partial derivation over the coefficient ring.
- **mathlib:MvPowerSeries.coeff_pderiv** (Mathlib/RingTheory/MvPowerSeries/Derivative.lean): A derivative coefficient is the shifted coefficient times the corresponding exponent plus one.
- **mathlib:FundamentalGroup.map** (Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean): Group homomorphism induced by a continuous map on actual based path-homotopy classes.
- **mathlib:FundamentalGroup.fundamentalGroupMulEquivOfPath** (Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean): Basepoint change by an actual path and conjugation in the fundamental groupoid.
- **mathlib:Path.Homotopic.Quotient.mk** (Mathlib/Topology/Homotopy/Path.lean): The actual quotient map from paths to endpoint-fixed homotopy classes.

The native completion comparison also uses ideal generation, ideal powers and ideal extension from Mathlib. The prototype's projective space is native Proj of the graded polynomial algebra. Its path and fundamental-group statements use actual based homotopy classes. Current AlgebraicVectorBundles supplies sheaf and relative-Spec infrastructure and reserves its analytic realization for an extension; it does not furnish the SNC analytification carrier required here. That bridge is requested from the same bundle's A0-extension, as in the aggregate packet. The current Tau Ceti regular-fan theorem `TauCeti.Toric.Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm` and its affine-chart membership comparison supply the toric special case and are reused. The new monomial chart records a morphism and exponent matrix; it does not replace that existing normal form. There is no dependency on upper-tier GAGA.

## R09.7a — Finite blowup and marked-transform towers

The accepted blowup and marked-ideal definitions supply each individual step. The interface needed by a resolution output is a finite list of native schemes and actual morphisms, with centre ideals, intermediate composites and persistent exceptional labels. An arbitrary proper morphism with a smooth source would omit this information.

### Finite blowup towers

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower` · definition.

A BlowupTower on a scheme X is a natural number N, schemes X₀,…,X_N with X₀=X, finite-type coherent centre ideals Cᵢ on Xᵢ for i<N, and morphisms πᵢ:Xᵢ₊₁→Xᵢ identified with the ordinary blowups Bl_{Cᵢ}(Xᵢ). Its map to X is the ordered composite of the πᵢ. Each exceptional ideal is CᵢO_{Xᵢ₊₁}. Length zero has X as its endpoint and the identity map. A restriction retains all N years, including years whose centre misses the open; deletion of those identity steps is a separate reindexing operation. This record adds the finite native scheme carrier omitted from the aggregate prototype; it does not construct another ordinary blowup.

**Hypotheses.** Schemes and finite-type centre ideals; projectivity and the ordinary blowup universal property are imported from StableReduction Layer 4.

**Construction or proof route.**

1. Use the imported blowup object at each of finitely many years.
2. Define the endpoint map by composition in chronological order.
3. For restriction use flat base change of blowups and the canonical pullback isomorphisms.

The ordinary blowup contract is its universal property on morphisms for which the pulled-back centre ideal is effective Cartier. Projectivity is supplied by the ordinary blowup owner; the native prototype explicitly stores properness for its output certificates. Restriction pulls each year back over the original open. It keeps the length, even if a centre becomes empty and its blowup becomes an identity. This indexing convention lets birth years and controlled-transform formulas survive restriction. The canonical algorithm comparison can remove those years with its separately specified order-preserving reindexing.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**API.**

- `BlowupTower.identity` (constructor): The length-zero tower on X has endpoint X and composite id_X.
- `BlowupTower.toBase` (projection): For every i≤N, the chronological composite Xᵢ→X₀, with toBase(0)=id and toBase(i+1)=πᵢ followed by toBase(i).
- `BlowupTower.exceptional` (data): At year i+1 the newborn exceptional ideal is CᵢO_{Xᵢ₊₁}, with the imported effective-Cartier property.
- `BlowupTower.restrict` (functoriality): For an open W⊆X, take Xᵢ×_X W and pull back the centres. This is a tower of the same length; the comparison to Xᵢ is the actual pullback square, and restriction twice agrees with restriction to the intersection up to the unique blowup comparison.

**Unit tests.**

- `BlowupTowerTests.identity` (degenerate): The endpoint morphism of the identity tower is id_X.
- `BlowupTowerTests.oneStep` (compatibility): For a one-step tower the endpoint morphism is its specified ordinary blowup morphism, with exceptional ideal equal to the pullback centre ideal.
- `BlowupTowerTests.cartierCentre` (non-example): Blowing up an effective Cartier ideal is an identity morphism up to canonical isomorphism, but its exceptional ideal is that pulled-back Cartier ideal and need not be the unit ideal.

**Acceptance.** A tower is more than a proper modification: all centre ideals and blowup identifications remain visible. Composition order is X_N→…→X₀.

**Sources.** BM97, §1, (1.1), pp. 211–212; Theorems 1.10 and 13.2, pp. 216, 297–298. The algorithms retain a finite sequence of spaces and specified centres; these data supply a native finite-tower record.

**Uses.** BM97, Theorems 11.14 and 13.2: Retains the actual finite sequence whose endpoint enters the global resolution output.

### Marked transforms and persistent boundary labels

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/marked-transform-tower` · definition.

A MarkedTower extends a BlowupTower on a smooth finite-type characteristic-zero k-scheme M. It stores a positive integral mark d, a coherent ideal Jᵢ on each Mᵢ, and a labelled strict-SNC boundary Eᵢ with labels 0,…,m+i−1. The initial marked ideal is (J₀,d); every centre is permissible for its current marked ideal and boundary in the accepted R09.7 sense. The next ideal is the controlled transform, characterized by JᵢO_{Mᵢ₊₁}=Fᵢ^d Jᵢ₊₁, where Fᵢ=CᵢO_{Mᵢ₊₁} is Cartier. Old labels denote scheme-theoretic strict transforms; the last label denotes Fᵢ. A vanished old component is retained as the unit ideal with empty support. The record retains birth years even after restriction or loss of components; history blocks are computed by the existing exceptional-history node, not stored as arbitrary counters.

**Hypotheses.** Smooth finite-type ambient schemes, char(k)=0, d>0. Permissibility includes ideal divisibility Jᵢ≤Cᵢ^d and the simultaneous boundary/centre coordinate condition.

**Construction or proof route.**

1. Import permissible-centre and controlled-transform and the SNC-after-blowup API.
2. Cartier cancellation makes the controlled ideal uniquely determined by its product equation.
3. Transport old ideals by the imported strict transform and append the pulled-back centre ideal.
4. Use the native ideal pullback composition law to telescope total transforms.

The simultaneous centre/boundary coordinate condition requires an étale neighbourhood in which the centre is a coordinate subspace and the incident boundary branches are distinct coordinate hypersurfaces. Together with J_i contained in C_i raised to the mark, it is the scheme specialization of permissibility. The newborn ideal is invertible, so cancellation identifies the controlled ideal uniquely. Multiplying the step equations gives the endpoint formula. In that product the first newborn ideal is pulled back through every subsequent step; replacing it by its surviving strict boundary label loses multiplicities.

The coordinate test on the Cartier centre (x) uses native marked-tower data as well as the ideal quotient calculation. The birth label remains (x) although the scheme map is an identity. When a boundary divisor itself is the centre, its old strict label becomes the unit ideal and its new birth label is the original divisor. This is why geometric identity maps cannot be discarded before transform and history data are transported.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower`, `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/permissible-centre`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.7/exceptional-history`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap_comp`.

**API.**

- `MarkedTower.controlled` (characterisation): The pullback of Jᵢ is Fᵢ^d times Jᵢ₊₁; this identifies Jᵢ₊₁ uniquely because Fᵢ is Cartier.
- `MarkedTower.oldBoundary` (simp): For j<m+i, Eᵢ₊₁(j) is the scheme-theoretic strict transform of Eᵢ(j).
- `MarkedTower.newBoundary` (simp): Eᵢ₊₁(m+i)=CᵢO_{Mᵢ₊₁}.
- `MarkedTower.totalTransform` (compatibility): On M_N, J₀O_{M_N}=J_N times the product, over i<N, of the total pullbacks of Fᵢ^d. These are total pullbacks of born ideals, not their strict transforms.

**Unit tests.**

- `MarkedTowerTests.cartierDivision` (computation): In k[x,y], mark 2 and centre (x), the ideal (x²y) has controlled transform (y), despite the blowup being an identity. Its total transform remains (x²y).
- `MarkedTowerTests.deadLabel` (degenerate): The strict transform of a Cartier divisor blown up in itself is empty, represented by the unit ideal, while the newborn label is the original Cartier ideal.
- `MarkedTowerTests.twoYears` (computation): In a length-two marked tower, the total transform is the pullback of F₀^d times F₁^d times J₂; replacing the first factor by a strict transform generally gives a wrong formula.

**Acceptance.** Controlled transforms are distinguished from total and strict transforms. Dead labels remain available to chronological history without contributing to incident-component counts.

**Sources.** BM97, §§3–4, (4.3)–(4.4), pp. 241–242; Definitions 6.8 and §6.15, pp. 256, 259. Controlled ideal division and surviving/born exceptional components must be tracked at every year; the birth-block rule is imported unchanged.

**Uses.** BM97, §§6, 10–13: The numerical history and global output require the same persistent geometric labels and controlled ideals.

## R09.7b — Regular coefficient data and completion

### Regular coefficients and completed germs

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/coefficient-completion-comparison` · theorem.

Let N be smooth over a characteristic-zero field k, a a closed point, H=(z=0) a smooth maximal-contact hypersurface transverse to the labelled boundary, and (hᵢ,dᵢ) a finite regular presentation with dᵢ>0. In an étale coordinate neighbourhood let ∂z be the coordinate derivation and cᵢq=(1/q!)∂z^q hᵢ restricted to H, for 0≤q<dᵢ. Under the coordinate completion isomorphisms Ô_{N,a}≅κ(a)[[z,y]] and Ô_{H,a}≅κ(a)[[y]], the completion of cᵢq is the z^q coefficient of the completed hᵢ. Consequently, for a positive common mark L divisible by every dᵢ−q, extension of the regular coefficient ideal generated by cᵢq^{L/(dᵢ−q)} equals the formal coefficient ideal with the same powers. Faithful flatness of completion reflects equality and ideal-power membership of these finitely generated regular ideals. This is the missing regular-to-formal comparison, not a second definition of coefficient presentation or a claim that independently chosen formal germs descend.

**Hypotheses.** Étale regular coordinates with z as contact coordinate; char(k)=0; closed point residue field κ(a), not necessarily k. One common regular neighbourhood supplies all coefficients; completion is its actual adic completion.

**Construction or proof route.**

1. Use the accepted regular-coordinates bridge to extend the derivation and restriction map to the coordinate completions.
2. The pinned coefficient-of-partial-derivative formula, iterated q times, yields q! times the z^q coefficient.
3. The factorial is invertible in κ(a); restrict z to zero.
4. Extension of an ideal commutes with generation and powers. Apply the requested Noetherian-local faithful-flat completion comparison to reflect the regular ideal assertions.

The residue field in the completed coordinate ring is κ(a), not an assumed copy of k. The proposed algebra calculation allows a k-algebra coefficient field K and k-algebra maps from the regular rings into K-valued multivariable series. It does not assume the regular local ring itself is a κ(a)-algebra. The supplier must identify those maps with the actual adic completions, extend the coordinate derivation compatibly, and compare the restriction to the contact hypersurface with setting the contact coordinate to zero.

Repeated differentiation multiplies the coefficient of z to the qth power by q factorial. Dividing by that invertible scalar and restricting z to zero yields the coefficient. One positive common mark L turns the weighted coefficients into ordinary ideal generators with powers L/(d_i−q). Ideal extension then gives the formal ideal equality. Faithful flatness of the actual local completion reflects the relevant finite ideal equalities and memberships. This final reflection is an explicit SF.0 obligation, rather than a descent claim about arbitrary formal germs. The example z squared demonstrates the strict index bound: its coefficient at index two is a unit, and including that index would destroy the marked cosupport.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-equivalence`, `mathlib:MvPowerSeries.pderiv`, `mathlib:MvPowerSeries.coeff`, `mathlib:MvPowerSeries.coeff_pderiv`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** For h=z²+y³ marked 2 the only nonzero lower coefficient is y³ marked 2. For h=z²+zy+y³ marked 2 the coefficients are (y³,2) and (y,1); common mark 2 gives (y³,y²)=(y²). Taking the derivative q=d adds a unit for h=z^d and is forbidden.

**Sources.** BM97, Construction 4.18, Proposition 4.19 and Remark 4.20, pp. 246–247; §§3.5–3.7, p. 233. Regular Taylor coefficients restrict to H and agree with their completed coefficients; all coefficients arise from the same regular data.

## R09.7c — Native output of principalization and embedded resolution

### Principalization with its native finite tower

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/principalization-tower-output` · construction.

For a smooth finite-type quasi-compact k-scheme M in characteristic zero and a coherent ideal J nonzero on each irreducible component, construct a PrincipalizationTower recording the finite tower supplied by the accepted principalization theorem. The initial boundary is empty, the centres are smooth permissible centres and miss M minus Supp(O_M/J), and the endpoint morphism is an isomorphism on that open. Store the total pullback JO_{M_N}, the weak transform equal to the unit ideal, and the final labelled SNC boundary. The total ideal is Cartier and locally a monomial in boundary equations with nonnegative integral exponents. The tower length is the finite termination witness, rather than an arbitrary proper morphism with a smooth target. This construction realizes the aggregate theorem’s witness on native schemes; it does not plan its invariant or termination proof again.

**Hypotheses.** Finite-type, smooth and quasi-compact over k; char(k)=0. J is coherent and generically nonzero on every component; empty initial boundary.

**Construction or proof route.**

1. Take the finite witness from R09.7/principalization and its termination prerequisite.
2. Populate the BlowupTower with that witness’s centre ideals and ordinary blowups.
3. Track total and weak ideals using R09.7/controlled-transform and its exceptional multiplicities.
4. Record the local monomial factorization and complement isomorphism as output fields.
5. If the prototype uses one global exponent per birth label, split each smooth centre into its finitely many disjoint connected components before populating it; the full canonical theorem keeps the aggregate’s grouping of these steps.

The output certificate is weaker than being the canonical algorithm itself: the accepted algorithm constructs one, while a small example can supply another valid centre sequence. The prototype uses a single global exponent for each birth label. To populate that specialization, refine each smooth centre into its finitely many disjoint connected components. Blowing up those components successively reproduces the original disjoint-union blowup; each born divisor then has a constant multiplicity. Labels that have vanished have unit ideal and contribute no support. The aggregate owner retains the canonical grouped years and supplies the comparison with this refinement.

The hypothesis that J is generically nonzero on every component is expressed in the native existence signature by density of its complement. For a smooth finite-type scheme these conditions agree. A zero ideal on a whole component cannot become an effective Cartier total ideal under this principalization statement. The unit ideal has a length-zero witness. In contrast, the certificate for (x squared y cubed) starts with empty boundary and uses the two Cartier centres (x), then (y). Its two scheme maps are identities, its birth labels are (x) and (y), its exponents are two and three, and its weak ideal is the unit ideal.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower`, `AlgebraicModuliForArithmeticGeometry:R09.7/principalization`, `AlgebraicModuliForArithmeticGeometry:R09.7/termination`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`.

**API.**

- `PrincipalizationTower.totalIdeal` (projection): The stored total ideal is exactly J pulled back along the tower composite.
- `PrincipalizationTower.weakIdeal` (simp): The final weak transform is the unit ideal.
- `PrincipalizationTower.preservedOpen` (compatibility): The tower composite restricted to M minus Supp(O_M/J) is an isomorphism.
- `PrincipalizationTower.ofUnit` (constructor): For J=O_M take the identity tower and empty boundary.

**Unit tests.**

- `PrincipalizationTowerTests.unit` (degenerate): The ofUnit construction has length zero, identity composite and empty boundary.
- `PrincipalizationTowerTests.coordinateMonomial` (computation): On A²_k, a valid principalization certificate for (x²y³) blows up the Cartier centres (x) and then (y). Both maps are identities, the final boundary labels are (x),(y), the total exponents are (2,3), and the final weak ideal is the unit ideal.
- `PrincipalizationTowerTests.nativePullback` (compatibility): For every output P, P.totalIdeal is the native IdealSheafData pullback J.comap P.tower.toBase(N).

**Acceptance.** The unit ideal has a length-zero output. Generic nonvanishing excludes the zero ideal on a nonempty component.

**Sources.** BM97, Theorem 1.10 and Remark 1.18, pp. 216, 225; §10, pp. 283–287. Principalization supplies a finite centre-by-centre witness, an invertible total ideal with normal-crossings support, and a unit weak transform.

**Uses.** R09.7/snc-compactification and finite-cover-compactification below: Principalizes a closed complement while retaining a proof that its prescribed smooth open survives.

### Strict transforms in embedded resolution outputs

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/embedded-tower-output` · construction.

For a reduced closed finite-type subscheme X of a smooth quasi-compact characteristic-zero ambient M, construct an EmbeddedTower recording the finite witness from R09.7/embedded-resolution. At each year set Xᵢ₊₁ to the scheme-theoretic closure of the inverse image of Xᵢ away from the chosen centre. Store its closed immersion into Mᵢ₊₁ and its map to Xᵢ. The output identifies the endpoint strict transform X_N with this iterative closure, proves it smooth, and gives SNC for the restrictions of the final exceptional labels to X_N. Its map to X is proper and an isomorphism over the original smooth locus. For the smooth-pair variant, import R09.7/preserve-resolved-points with its distinct-germ and noncontainment hypotheses and preserve exactly its resolved open. Isomorphism compatibility is throughout the specified towers, with empty steps removed on restriction as in R09.7/local-isomorphism-resolution.

**Hypotheses.** Reduced closed X⊆M, M smooth finite-type and quasi-compact over char-zero k. The smooth-pair refinement keeps the accepted resolved-locus and Cartier-restriction hypotheses.

**Construction or proof route.**

1. Import the finite resolution witness without replacing reduced strict transforms by total inverse images.
2. Use the strict-transform closure in each ordinary blowup and compose its square with the ambient blowup square.
3. Populate the endpoint smoothness, SNC and original-regular-open assertions from the accepted theorem.
4. For local-isomorphism comparison, use the accepted unique lifts and retain their commuting squares at every surviving year.

At each step the open inverse image of the current closed subscheme is composed with its closed immersion into the next ambient scheme; its kernel ideal defines the scheme-theoretic closure. The native strict-transform map must make the displayed ambient square commute. Iterating this operation, rather than pulling back the original ideal at every year, supplies the intended endpoint. Smoothness of the endpoint and strict-SNC restrictions of the exceptional boundary are separate output properties.

The original reduced finite-type input over a characteristic-zero field has its regular locus equal to its smooth locus. The prototype uses the native smooth-locus open and states its finite-presentation hypothesis. The accepted smooth-pair refinement preserves its specific resolved open, with its noncontainment and distinct-germ conditions. That full pair predicate and the canonical whole-tower comparison remain imports. The origin-in-the-plane example distinguishes strict closure from total inverse image: its strict transform under blowing up that origin is empty, while its total inverse image is the exceptional projective line.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower`, `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7/preserve-resolved-points`, `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7/resolved-locus`, `mathlib:AlgebraicGeometry.Scheme.Hom.ker`.

**API.**

- `EmbeddedTower.strictIdeal` (characterisation): The next strict ideal is the kernel ideal of the composite from the open inverse image away from the centre into the next ambient scheme; thus it is the scheme-theoretic closure, including its scheme structure.
- `EmbeddedTower.square` (compatibility): At each year the closed immersion followed by the ambient blowup equals the strict-transform map followed by the previous closed immersion.
- `EmbeddedTower.smoothEndpoint` (structure): The endpoint strict transform is smooth and meets all incident exceptional components with the expected smooth intersection codimensions.
- `EmbeddedTower.preservedOpen` (functoriality): The map X_N→X restricts to an isomorphism over Reg(X); in the imported smooth-pair variant it restricts over the specified resolved open.

**Unit tests.**

- `EmbeddedTowerTests.identity` (degenerate): For a smooth closed X⊆M and empty boundary, the identity tower has strict transform X and identity map to X.
- `EmbeddedTowerTests.avoidsCentre` (compatibility): If Xᵢ is disjoint from a centre, the next strict transform is its full inverse image and maps isomorphically to Xᵢ.
- `EmbeddedTowerTests.containsCentre` (non-example): For the origin X in A² and the blowup at that origin, the scheme-theoretic strict transform is empty, whereas the total inverse image is the nonempty exceptional line.

**Acceptance.** A smooth X with empty boundary has an identity output. Nonreduced inputs do not get a smooth strict-transform conclusion; their weaker theorem stays with the aggregate owner.

**Sources.** BM97, Theorem 11.14 and following paragraph, pp. 290–291; Theorems 12.2, 12.4, 13.2, pp. 292–294, 297–298. The finite embedded witness carries iterative strict transforms and prescribed-open preservation; local isomorphisms lift through the entire towers.

**Uses.** R09.7/snc-compactification; BM97 Theorem 13.2: Exports an actual resolution witness with the same open identification and strict transform used in compactification.

## R09.7d — Boundary refinement, covers and monodromy

### Strictifying a normal-crossings boundary

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/boundary-stratum-refinement` · construction.

For a smooth finite-type quasi-compact characteristic-zero scheme Y and a reduced normal-crossings divisor D (branches may be permuted or self-intersect globally), construct a BoundaryRefinement: a finite BlowupTower supported on D, an unchanged open Y minus D, and a final reduced boundary with globally smooth labelled components and strict SNC. Use the branch-multiplicity stratification: starting with the largest number of original branches, blow up the reduced closures of its strata, then their proper transforms in descending branch number down to two. After higher strata are blown up, the next centres are disjoint smooth coordinate intersections. New components are labelled by their centre’s original stratum and birth year. Local branch permutations preserve the centre ideals, so the construction glues. Locally this is the barycentric subdivision of the coordinate boundary, not an invocation of general resolution of an arbitrary singular divisor. The same construction on a smooth DM stack uses the requested étale atlas and ideal/blowup descent interface; the scheme theorem is the native prototype.

**Hypotheses.** Y smooth finite-type quasi-compact over char-zero k; D is reduced and normal crossings in the étale sense. The maximum original branch number is finite; the invariant stratification and centres use original branches, not all newly created intersections.

**Construction or proof route.**

1. Describe the distinct-branch strata étale locally by the coordinate intersections; finite boundary normalization distinguishes repeated branches without assuming global labels.
2. Blow deepest strata first. The pivot chart x_p=y_p, x_i=y_p y_i gives coordinate boundaries; proper transforms of remaining stratum closures are smooth after deeper intersections have been separated.
3. The permutation-invariant ideals descend; imported blowup base change identifies all overlap charts.
4. Descending original branch number is finite. The final components and their intersections have the required smooth codimensions; retain the original open identification.

Write b(a) for the number of original geometric branches at a point. The branch-normalization contract makes this intrinsic: distinct ordered branches form the off-diagonal pieces of iterated fibre products of the finite boundary normalization. Their permutation-invariant images describe the loci b(a) at least r. The reduced closures of the strata of maximal original branch number are smooth coordinate intersections. After they are blown up, proper transforms of the next original stratum closures become disjoint smooth intersections. Descend their coherent ideals and repeat in descending original branch number.

Each local coordinate simplex is subdivided by this descending procedure. Surviving original branches become globally smooth, and exceptional components indexed by the original strata have smooth intersections of the expected codimension. Monodromy permuting local branches preserves the centre ideals, so ordinary blowup base change gives the overlap isomorphisms and their cocycles. The process has finitely many original ranks. It does not keep restarting on the new intersection strata created by an earlier blowup.

For the plane axes, there is one step at the origin. In the x-pivot chart, x=u and y=uv, the total boundary equation is u squared times v, whereas the reduced boundary equation is uv. Globally the final boundary has the two strict axes and one exceptional component. For the irreducible nodal curve y squared=x squared(x+1), that same substitution gives u squared(v squared−u−1). The strict curve is smooth in this chart and meets u=0 at v=1 and v=−1, transversely and at distinct geometric points. Its other chart gives the complementary description. Keeping the original nodal component as a smooth label would fail the definition. The native examples state both its initial SNC failure and the one-step refinement output.

The output record does not yet encode the normalization-based global stratum algorithm; the statement and proof route above are its specification. Its étale comparison signature gives an actual endpoint pullback square. Full year-by-year centre/label comparison requires that algorithm's descent carrier. Quasi-compactness of the étale restriction is visible so that the finite-type output condition is preserved. For a DM stack, the same permutation-invariant ideal construction runs on an étale atlas and uses the SF.1 descent contract below.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `SchemeAndStackFoundations:SF.0`.

**API.**

- `BoundaryRefinement.open` (compatibility): The composite is an isomorphism over Y minus D, with the final reduced boundary equal to its inverse-image complement.
- `BoundaryRefinement.localChart` (characterisation): In the blowup of the intersection of branches indexed by I, the p-pivot chart has x_p=y_p, x_i=y_p y_i for i∈I minus {p}, and x_i=y_i for i outside I.
- `BoundaryRefinement.labels` (data): The final labels are surviving original strict components and components born from original-stratum centres; every label defines a globally smooth divisor or an empty component.
- `BoundaryRefinement.etaleComparison` (functoriality): For a quasi-compact étale restriction, identify the centre ideals and every blowup square; local branch permutations merely reindex the final labels.

**Unit tests.**

- `BoundaryRefinementTests.empty` (degenerate): For the empty divisor use the identity tower and empty boundary.
- `BoundaryRefinementTests.axes` (computation): For xy=0 on A², the deepest-stratum step blows up (x,y). In the x-pivot chart x=u,y=uv, the reduced boundary is uv=0, and the total boundary ideal is (u²v).
- `BoundaryRefinementTests.nodal` (non-example): For an irreducible nodal divisor on a smooth surface, blow up its node: its strict component is smooth near the old node and meets the new exceptional component in two distinct geometric points. Leaving the node unchanged fails strict SNC.

**Acceptance.** Already disjoint smooth components need no blowup. An irreducible nodal divisor is not treated as one smooth component. Repeatedly blowing newly created intersections is not the specified finite procedure.

**Sources.** LL24, Proof of Lemma 8.3.3, pp. 40–41. The strictification of the stable-curve boundary is a boundary-stratum blowup construction; this node isolates and proves its geometric local calculation. STACKS, §41.21, Definitions 41.21.1 and 41.21.4; Lemmas 41.21.2 and 41.21.6 (tags 0CBN, 0CBR). The distinct-branch description and expected-codimension intersection criterion distinguish normal crossings from globally strict SNC.

**Uses.** LL24, proof of Lemma 8.3.3; LLSS23, Lemma 2.1.1: Separates repeated stable-boundary branches while retaining the monomial chart description that controls new meridians.

### Compactifying finite étale covers over a fixed SNC model

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-cover-compactification` · construction.

Let U be a smooth integral quasi-projective characteristic-zero k-variety, let C be a chosen smooth projective strict-SNC compactification of U, and let f:V→U be a nonempty connected finite étale cover. Construct a FiniteCoverCompactification with a smooth projective compactification C_V of V and a proper dominant morphism g:C_V→C whose restriction is the given f and whose inverse image of U is exactly V. First normalize C in k(V), obtaining a finite projective normal scheme N and V as its unchanged inverse image of U. Resolve N preserving V, then principalize its reduced boundary preserving V, using the accepted resolution and compactification interfaces. The final map is proper but need not remain finite after blowups. Its reduced complement is labelled strict-SNC. Pullbacks of each target boundary Cartier ideal are Cartier and locally products of source-boundary ideals with nonnegative exponents; this is a divisor-supported-on-SNC statement, not an assertion that g is a toroidal morphism or that it is flat. Disconnected covers are treated componentwise.

**Hypotheses.** Connected nonempty finite étale cover of an integral U; chosen projective SNC model C. Normalization finiteness uses finite type over a field (Nagata), not arbitrary excellent-scheme compactification.

**Construction or proof route.**

1. Use the same-bundle finite normalization interface and its actual integral-closure carrier; the function field extension is finite separable.
2. Normality of V identifies N over U with V. Finiteness over the projective C gives projectivity.
3. Apply the accepted local-isomorphism resolution and principalization witnesses away from V; retain both finite towers and the open-identifying squares.
4. Each pulled-back target Cartier equation is nonzero in the smooth integral source. Its divisor is supported on the source SNC complement, so local factoriality gives the unit-times-monomial expression.

A connected nonempty finite étale cover of the integral smooth open is integral and normal, and induces a finite separable function-field extension. Normalize the chosen projective model C in that extension. Finite type over a field supplies the Nagata hypotheses for finiteness of the relative normalization. Normality of V identifies the inverse image of U with the actual given cover, not merely a birational model. Finiteness over C supplies a projective normal scheme.

This normal scheme can be singular along its boundary. Embed it in a smooth projective ambient, apply the accepted resolution preserving its smooth open V, and principalize the ideal of the reduced complement while preserving that same open. The finite composed modification is projective. Its composite to C is proper and dominant, and its inverse image of U remains exactly V. It need not be finite after these modifications. The construction records the actual open pullback square and the chosen embedding into projective space.

Every pulled-back target boundary equation is nonzero on the resulting smooth integral source. Its zero divisor is supported on the strict-SNC complement. Local factoriality and the incident coordinate primes factor it into a unit and nonnegative powers of those primes. After shrinking a common affine neighbourhood the corresponding ideal equals the product of the boundary ideals to those powers. This uses integrality and dominance, rather than flatness. It gives the required boundary equations without claiming that all coordinates of the morphism are monomial.

The identity model has unchanged native schemes, map and labels. The power-cover test specifies the native projective-line morphism through its standard affine charts; both the zero and infinity Cartier ideals pull back to their eth powers. For the degree-two cover of the two-dimensional torus given by z squared=xy, the affine extension has coordinate ring k[x,y,z]/(z squared−xy). It is normal but singular at the origin: the hypersurface has a two-dimensional local ring and a three-dimensional cotangent space there. The native nonsmoothness example tests the actual spectrum. Identifying this ring with the relative normalization, and checking its normality through the integral-closure carrier, belong to the requested normalization comparison. This example rules out replacing the resolution step by an unsupported assertion that normalization is smooth.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7a/principalization-tower-output`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `SchemeAndStackFoundations:SF.3`.

**API.**

- `FiniteCoverCompactification.openSquare` (compatibility): The square V→C_V over U→C commutes and is a pullback square; C_V minus its boundary is exactly V.
- `FiniteCoverCompactification.projective` (structure): C_V is smooth projective over k and g is a proper dominant k-morphism.
- `FiniteCoverCompactification.pullbackBoundary` (characterisation): On the smooth integral source, for each target boundary component D_i, g*I_{D_i} is locally ∏_j I_{E_j}^{a_ij}, with a_ij≥0, up to a unit in equations.
- `FiniteCoverCompactification.identity` (constructor): For f=id_U, use C_V=C, g=id and the same boundary labels.

**Unit tests.**

- `FiniteCoverCompactificationTests.identity` (degenerate): The identity construction has the same native model and identity morphism; its boundary exponent matrix is the identity on incident labels.
- `FiniteCoverCompactificationTests.powerCover` (computation): For V=G_m→U=G_m, z↦z^e with e≥1, the extension P¹→P¹ has pullback exponents e at 0 and at ∞.
- `FiniteCoverCompactificationTests.singularNormalization` (non-example): The finite étale degree-two cover z²=xy of G_m² normalizes A² in a scheme singular over (0,0); it must be resolved before a smooth compactification is claimed.

**Acceptance.** Identity cover admits the original model itself with identity map. A normalization of an SNC model is not silently assumed smooth. The resolved map is proper; finiteness and flatness are not output properties.

**Sources.** LL24, Proof of Lemma 8.3.3, pp. 40–41. The finite-cover route uses normalization in the cover’s function field. The added resolution and boundary principalization make its smooth-SNC output justified. STACKS, Lemma 29.54.14, tag 0AVK; §41.21, paragraph after Definition 41.21.1. Finite-type relative normalization is finite, and a Cartier divisor supported on SNC components has local monomial exponents.

**Uses.** LL24, proof of Lemma 8.3.3: Supplies a smooth strict-SNC scheme compactification after the source’s finite-cover normalization step.

### Monomial equations for boundary morphisms

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/monomial-boundary-chart` · definition.

A MonomialBoundaryChart for a morphism of smooth complex pairs stores local polydisc coordinates z on the source and w on the target, their incident boundary labels, a matrix A=(a_ij) with nonnegative integral entries (target labels are rows, source labels columns), and nowhere-zero holomorphic functions u_i on the full source polydisc, such that w_i∘g=u_i∏_j z_j^{a_ij} for every incident target boundary coordinate. The source chart contains its boundary points, not merely the punctured complement. Coordinates without an incident target boundary are unrestricted holomorphic functions. An incident source divisor mapping into the target boundary has at least one positive entry in its column. This chart only records pullback boundary equations; it does not require monomial formulas for the whole morphism or étaleness of g.

**Hypotheses.** Smooth complex source and target pairs with labelled SNC; g maps the complements to one another. Units are nonzero on the full source polydisc.

**Construction or proof route.**

1. Use the accepted algebraic-to-analytic SNC chart bridge for both pairs.
2. Factor pulled-back boundary Cartier equations on the smooth local source into its incident components and a unit.
3. Shrink charts to avoid nonincident divisors and keep the unit nonzero; record exponents with the stated row/column convention.

The carrier contains the full holomorphic coordinate map and its nonboundary coordinates, its source and target radii, the finite incident label sets, the nonnegative exponent matrix, and the holomorphic units. It requires that the map takes the full source polydisc into the target polydisc. The units extend and are nowhere zero on the full source polydisc. Consequently the map restricts to a continuous map of the punctured coordinate complements.

The order along z_j=0 characterizes each exponent and proves uniqueness. Composition substitutes the first boundary equations into the second ones. Units remain extending units because their pullbacks and their finite products are nowhere zero, and the exponent matrix of target-after-source composition is BA. This argument also explains why the nonboundary coordinate functions must be retained: they enter the second chart's pulled-back units.

For the finite-cover model, every incident source boundary divisor lying over the target boundary has a positive entry in its column. An arbitrary boundary chart can also have an extraneous source branch mapping into the interior; that column is zero. The positivity assertion is conditional on mapping the branch into the target boundary. The invalid punctured-unit factorization of the identity disc map would assign exponent zero and unit z. It fails because z vanishes at the boundary point in the full disc.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/analytic-polydisc`, `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-cover-compactification`, `SchemeAndStackFoundations:SF.3`.

**API.**

- `MonomialBoundaryChart.equation` (projection): w_i∘g=u_i∏_j z_j^{a_ij} on the full chart.
- `MonomialBoundaryChart.exponentsUnique` (characterisation): The exponent a_ij is the order of g*w_i along z_j=0; multiplying either boundary equation by an extending unit leaves it unchanged.
- `MonomialBoundaryChart.compose` (functoriality): For composable boundary charts with exponent matrices A and B, the composite has exponent matrix BA, and the remaining factors extend as nowhere-zero units.
- `MonomialBoundaryChart.identity` (constructor): An identity chart has the identity exponent matrix and all units 1.

**Unit tests.**

- `MonomialBoundaryChartTests.identity` (compatibility): For an identity chart a_ij is the Kronecker delta.
- `MonomialBoundaryChartTests.power` (computation): The map z↦z^e has exponent matrix [e], unit 1 and boundary pullback (z^e).
- `MonomialBoundaryChartTests.puncturedUnit` (non-example): Writing the identity map on Δ* as w=(z)·z⁰ is invalid monomial-chart data: the proposed unit z vanishes on the full disc and would lose the meridian exponent 1.

**Acceptance.** A unit only on the punctured locus is insufficient to control winding. Changing an equation by a holomorphic unit does not change its exponent column.

**Sources.** LLSS23, Lemma 2.1.1 and proof, pp. 7–8. Its local blowup monodromy calculation uses exactly the monomial pullback of boundary coordinates. STACKS, §41.21, paragraph after Definition 41.21.1. A Cartier equation supported on SNC components is a unit times their powers.

**Uses.** Meridian comparison below; LL24, Lemma 8.3.3 proof: The full-chart units have zero winding, so new inertia depends only on the exponent matrix.

### The homomorphism on meridian lattices

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/meridian-map` · construction.

For a nonnegative integer matrix A indexed by r target and s source boundary branches, define MeridianMap(A):Z^s→Z^r by v↦(Σ_j a_ij v_j)_i. The positively oriented source meridian e_j maps to the jth column. For a boundary-intersection blowup of I and pivot p∈I, the pivot column has entry 1 exactly in rows i∈I, while every nonpivot column is its usual coordinate column. A composable sequence of such charts gives the product of their matrices in target-after-source order. This is the local geometric inertia adapter; it is not a new mapping-class-group definition.

**Hypotheses.** Finite label sets; a_ij∈N, viewed in Z for the homomorphism.

**Construction or proof route.**

1. Use finite sums to define the additive homomorphism.
2. Evaluate on coordinate generators.
3. Prove composition by rearranging finite sums.
4. Read the boundary blowup matrix from the imported pivot chart.

The matrix has target rows and source columns. In the x-pivot blowup of two axes, x=u and y=uv, its rows are (1,0) and (1,1). The exceptional source meridian therefore maps to both target meridians, and the remaining source meridian maps to the y meridian. For a finite cover z mapping to z raised to e, its one-dimensional matrix has entry e. No primitivity assertion is made for that cover.

This additive lattice map is an elementary adapter for the actual topological theorem below. It neither defines a mapping class group nor postulates an equality between an abstract inertia lattice and a surface-group action. Matrix composition follows the same order as the geometric boundary-chart composition.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/monomial-boundary-chart`, `AlgebraicModuliForArithmeticGeometry:R09.7a/boundary-stratum-refinement`.

**API.**

- `MeridianMap.column` (simp): MeridianMap(A)(e_j) has ith coordinate a_ij.
- `MeridianMap.identity` (simp): MeridianMap(I_r)=id_{Z^r}.
- `MeridianMap.compose` (functoriality): MeridianMap(BA)=MeridianMap(B)∘MeridianMap(A).
- `MeridianMap.blowupPivot` (compatibility): For a blowup of the I-intersection, the exceptional pivot meridian maps to Σ_{i∈I}e_i.

**Unit tests.**

- `MeridianMapTests.empty` (degenerate): With no boundary labels on either side the map is the unique endomorphism of the zero lattice.
- `MeridianMapTests.axes` (computation): For x=u,y=uv, the matrix [[1,0],[1,1]] sends the exceptional meridian (1,0) to (1,1), and (0,1) to (0,1).
- `MeridianMapTests.power` (computation): For z↦z^e, the one-dimensional meridian map sends 1 to e, including e=2 rather than incorrectly returning 1.

**Acceptance.** Target labels are rows and source labels are columns. Exponents need not be primitive: a degree-e finite cover multiplies its meridian by e.

**Sources.** LLSS23, Lemma 2.1.1 and proof, pp. 7–8. The exceptional meridian of an intersection blowup is the sum of the incident coordinate meridians. LL24, Proof of Lemma 8.3.3, pp. 40–41. Boundary inertia after finite-cover normalization may be a positive power; subsequent monomial pullbacks compose these powers.

**Uses.** LLSS23, Lemma 2.1.1; LL24, Lemma 8.3.3: Converts boundary exponents into products of commuting geometric monodromy generators.

### Monomial pullback and positive boundary meridians

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/meridian-comparison` · theorem.

In a MonomialBoundaryChart with exponent matrix A, fix a basepoint in the punctured source chart. Let γ_j be its positive coordinate meridian, and let τ_i be the positive target coordinate meridian based at the image point. In the fundamental group of the target coordinate complement, g_*(γ_j)=∏_i τ_i^{a_ij}. The τ_i commute. Units extending over the full polydisc contribute no winding: contract their image loops along a based contraction in that full polydisc. Passing to a global complement uses the chart inclusion and a basepoint path, so the resulting equality there is defined up to simultaneous conjugacy. Consequently any representation of the global complement sends the source meridian to the product of the corresponding commuting target monodromies with these nonnegative exponents. The theorem computes actual path-homotopy classes; identifying stable-curve monodromies with Dehn twists is a separate consumer input.

**Hypotheses.** Full-chart extending units; coordinate meridians remain in the chosen source polydisc. Positive complex orientation; one common basepoint and the same transporting path for all generators.

**Construction or proof route.**

1. Apply the pinned FundamentalGroup.map to the coordinate loop.
2. Contract each extending-unit loop in the full source polydisc, then use its nowhere-zero image to obtain a homotopy through the target coordinate complement.
3. The remaining coordinate loop has winding a_ij in target coordinate i; simultaneous coordinate loops commute by the product homotopy.
4. Apply the global chart inclusion and basepoint conjugation. No surface-group or mapping-class presentation is used.

A positive source coordinate loop multiplies its jth coordinate by exp(2πit), leaving the other coordinates fixed. Its norm is unchanged, so it stays in the centred source polydisc. It is an actual based path in the punctured complement. The continuous chart map induces the native homomorphism on its based homotopy class.

The full source polydisc is contractible. Contracting the coordinate loop there and applying a nonvanishing extending unit proves that this unit's image loop has zero winding in the punctured line. The remaining ith coordinate has winding a_ij. Product contractions of the nonboundary discs and the radial retractions of the punctured coordinate discs identify the target complement's loop class with the product of positive coordinate classes to those powers. These coordinate classes commute. The Lean form uses an ordered list product, so the statement does not require a commutative-group instance for an arbitrary monodromy group.

Include the coordinate chart into a global complement, then use one common transporting path to its chosen global basepoint. This changes the local formula by simultaneous conjugacy. Changing paths independently for individual generators would lose the specified simultaneous statement. Any representation carries the based formula to the corresponding product of commuting target monodromies. The axes chart and the degree-two power chart are the concrete acceptance cases.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/monomial-boundary-chart`, `AlgebraicModuliForArithmeticGeometry:R09.7a/meridian-map`, `mathlib:FundamentalGroup.map`, `mathlib:FundamentalGroup.fundamentalGroupMulEquivOfPath`, `mathlib:Path.Homotopic.Quotient.mk`.

**Acceptance.** The x-pivot blowup of xy=0 gives τ_xτ_y, not a single original τ. The cover z↦z² gives τ². If a unit is allowed only on Δ*, the false factorization z=(z)·1 would contradict the conclusion.

**Sources.** LLSS23, Lemma 2.1.1 and proof, pp. 7–8. The lemma reduces exceptional inertia to the local normal-crossings blowup calculation; this node supplies that calculation with explicit exponents and orientation.

### Stable-curve compactification and conditional multitwist inertia

**Target:** `AlgebraicModuliForArithmeticGeometry:R09.7a/stable-curve-boundary-interface` · application.

For 2g−2+n>0, import the algebraic smooth-curve stack M_{g,n}, its smooth proper stable compactification with normal-crossings boundary, its local node-smoothing coordinates, and a nonempty finite étale scheme cover of the smooth open from the same-bundle R09.4/R09.5 interface. Strictify the stable boundary by its stratum blowups, and normalize the resulting proper model in the cover’s function field. Resolve this normalization and its boundary preserving the cover; the output is a smooth proper strict-SNC scheme model, projective when the supplier gives the required projective coarse/finite normalization model. On a stable deformation chart, every final boundary meridian maps to a product ∏_e τ_e^{a_e} of the mutually commuting node-smoothing meridians, with a_e≥0 and at least one positive a_e for a divisor above the boundary. If the consumer supplies the identification τ_e↦T_{δ_e} for pairwise disjoint vanishing curves δ_e, its monodromy is the corresponding positive multitwist, up to conjugacy and finite-cover powers. The geometry and exponent calculation are owned here; algebraicity, covers and stable-family coordinates are supplier contracts, and the topological Dehn-twist identification remains with the surface-group consumer. No fundamental-group equivalence for coarse spaces is asserted.

**Hypotheses.** Stable numerical range; over C for the monodromy statement. Finite étale cover is a scheme of the stack, not a claim that coarse-space passage preserves inertia. Projectivity needs the supplier’s projective coarse model and finite normalization comparison.

**Construction or proof route.**

1. Use the lower same-bundle moduli interfaces without redeclaring stable pointed moduli or rigidification.
2. Apply boundary-stratum refinement on an étale atlas and descend the invariant centre ideals and blowups.
3. Finite normalization gives a proper scheme extension once the supplier provides its stack-to-scheme comparison; it may be singular. Resolve and principalize its complement preserving the cover.
4. Apply the monomial-boundary and meridian comparison on each stable deformation chart. The consumer’s node-monodromy identification turns the computed exponents into multitwists.

The application needs a finite étale scheme cover of the smooth-curve stack, not just a finite surjective cover at arbitrary residue characteristics. The boundary and the stable node-smoothing charts belong to the existing stable-moduli import exposed through R09.4. Strictification and finite normalization must be compared on the stack's étale charts, with effective scheme realization from the chosen cover. For projectivity, the supplier must give the projective coarse model and the finite normalization comparison to it. A blanket identification of a stack with its coarse space would lose inertia and does not supply these data.

After strictification, normalization and resolution preserving the cover, pull each node-smoothing equation back to a full final boundary chart. Its nonnegative exponent column computes the image of that final meridian. At a divisor above the boundary at least one exponent is positive. Node-smoothing coordinate meridians commute. The topological consumer supplies their identification with positive Dehn twists about pairwise disjoint vanishing curves; with that premise the computed product is a positive multitwist. A finite-cover ramification index scales the exponent. A single node of index e gives the eth power of its twist, and blowing up a two-node intersection gives the product of the two twists.

The prototype states the precise conditional consequence on native fundamental groups and a group representation. It omits the stack-valued construction signature until the supplier's actual carrier and comparison maps exist. It supplies no substitute proposition field asserting a pretend moduli object. The source's compactification step is expanded by the explicit resolution/principalization of a possibly singular normalization. The local exponent computation survives this expansion because the resulting proper boundary morphism has the full-chart monomial equations proved above.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7a/boundary-stratum-refinement`, `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-cover-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7a/meridian-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** For a single node and ramification index e the image is T_δ^e. For an intersection of two node divisors the exceptional image is T_{δ₁}T_{δ₂}; disjointness of vanishing curves is the reason these commute. The empty-boundary case has no boundary inertia.

**Sources.** LL24, Lemma 2.2.3, p. 15 (arXiv v4); proof of Lemma 8.3.3, pp. 40–41. The application starts with a finite étale scheme cover and uses boundary-stratum blowups and normalization; its inertia calculation is local and uses commuting twists. LLSS23, Lemma 2.1.1 and proof, pp. 7–8. Boundary-stratum exceptional inertia is the multitwist associated with the nodes of the stratum; the Dehn-twist premise belongs to the topological consumer.

## Supplier contracts and closure

The direct prerequisites terminate in the pinned declarations, the accepted aggregate targets, the existing StableReduction blowup layer or the following named supplier stages. The accepted aggregate's own requests remain in force. A request specifies mathematics and comparison maps, rather than merely a matching name.

- **tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces**: Reuse the existing ordinary blowup, Cartier exceptional ideal, projectivity, strict-transform closure, pivot-chart and flat-base-change API. Supply the finite native tower restriction comparisons used here; no duplicate Rees/Proj construction. Current Tau Ceti affineBlowup charts must replace older prototypes when packaging. Required by `finite-blowup-tower`, `boundary-stratum-refinement`.
- **SchemeAndStackFoundations:SF.0**: The existing R09.7 regular-coordinate/Noetherian local-completion request, including derivative and quotient compatibility and faithful-flat reflection for finite ideals, plus finite boundary normalization/distinct-branch localization. Its Jacobson and étale coordinate nodes are imported through the aggregate owners. Required by `coefficient-completion-comparison`, `boundary-stratum-refinement`.
- **SchemeAndStackFoundations:SF.3**: Reuse current native effective-Cartier ideals, and provide the unrestricted ideal-product/divisor dictionary and local monomial factorization of a Cartier divisor supported on a labelled SNC boundary. Pullback here is justified by nonzero equations on a dominant smooth integral source, not by flatness of a blowup. Required by `finite-cover-compactification`, `monomial-boundary-chart`.
- **AlgebraicModuliForArithmeticGeometry:R09.3**: Effective étale descent for the permutation-invariant coherent branch-stratum centre ideals and their blowups on scheme charts, with overlap cocycles from the ordinary blowup universal property. General quasi-coherent descent stays with the accepted R09.3 owner. Required by `boundary-stratum-refinement`.
- **AlgebraicModuliForArithmeticGeometry:A0-extension**: Finite normalization of a finite-type characteristic-zero projective variety in a finite separable function-field extension: the actual integral-closure carrier, finiteness, its equality with the finite étale normal cover over U, and compatibility with étale localization. Analytification and open/étale coordinates remain the aggregate analytic-polydisc request; no upper-tier GAGA import. Required by `finite-cover-compactification`.
- **AlgebraicModuliForArithmeticGeometry:R09.4**: Expose its existing stable-pointed-moduli import without replanning StableReductionPartII: for 2g−2+n>0 over C, the smooth proper stable DM stack, the smooth open, node-smoothing coordinate charts with étale normal-crossings boundary, and ordered local branch/node incidence. Keep separated/proper/tame and DM hypotheses distinct. Required by `stable-curve-boundary-interface`.
- **AlgebraicModuliForArithmeticGeometry:R09.5**: For the stable smooth-curve stack over C, a nonempty finite étale surjective scheme cover, and the stack-to-scheme comparison extending this cover by finite normalization over the proper stratum-refined compactification. For projectivity, a projective coarse model and proof that the scheme extension is finite over it. A merely finite surjective cover at wild primes does not supply this étale characteristic-zero interface. Required by `stable-curve-boundary-interface`.
- **SchemeAndStackFoundations:SF.1**: On a smooth DM stack with étale normal-crossings boundary, descend permutation-invariant centre ideals, ordinary blowups, open-complement identifications and finite normalization from an étale atlas, with effective scheme/algebraic-space realization under the R09.5 cover contract. The full stack carrier belongs here; the suggested file supplies only the native scheme specialization until this carrier exists. Required by `stable-curve-boundary-interface`.

There is no mathematical gap recorded in this supplemental pass. The suppliers and prototype refinements are explicit remaining obligations, so no stage is classified as closed. In particular a packaged stable-stack construction must use actual stack carriers, effective descent maps and the characteristic-zero finite-étale-cover contract. The reader's theorem does not manufacture these objects from the conditional group statement.

| Stage | Status | Remaining work |
|---|---|---|
| R09.7a | planned | Import the accepted aggregate owners listed in importedTargets; their supplier requests and implementation refinements remain in force. Replace the pin-only blowup/Cartier adapters with the suppliers and prove finite-tower restriction, controlled cancellation and persistent-label tracking. |
| R09.7b | planned | Import the accepted aggregate owners listed in importedTargets; their supplier requests and implementation refinements remain in force. Discharge the completion/derivation supplier contract and the full geometric-to-formal comparison; the suggested file states its coefficient calculation under explicit algebra-map compatibilities. |
| R09.7c | planned | Import the accepted aggregate owners listed in importedTargets; their supplier requests and implementation refinements remain in force. Populate and prove the native finite output records from the accepted algorithm, including the smooth-pair preserved-open variant and unique whole-tower comparison. |
| R09.7d | planned | Import the accepted aggregate owners listed in importedTargets; their supplier requests and implementation refinements remain in force. Discharge the stable-moduli, finite étale scheme-cover and stack descent requests. The suggested file gives scheme and analytic chart specializations and omits the unavailable stack-carrier signature. |

## Prototype boundary

All eight new definition/construction targets have signatures, four API entries and three named example groups in the suggested file. The three theorem/application targets also have stated signatures. The native marked and embedded records enforce their tracking equations on actual ideal sheaves. Cartier and ordinary-blowup adapters must be replaced with their existing supplier declarations during packaging.

The algebra comparison states the coefficient and ideal-extension calculation under explicit compatible algebra maps; the supplier must establish those compatibilities for the actual completed local rings and the faithful-flat reflection. The boundary output records the actual finite tower, unchanged open and strict-SNC endpoint; it omits the global distinct-branch-stratum algorithm predicate. Its full descent/year comparison remains part of the specified proof route. The reduced embedded output omits the aggregate's full smooth-pair and canonical tower-comparison predicates. The stable application omits the unavailable stack-valued signature and states its conditional consequence on actual path-homotopy groups.

The native projective-line test uses its two affine charts and its zero/infinity kernel ideals. The native cone test states nonsmoothness of its actual spectrum; its identification with normalization belongs to the A0 contract. This is the exact scope of the prototype examples, while the reader specifies their complete geometric context. The generic coefficient test allows a larger residue coefficient field and does not assume rationality of the closed point.

## Sources and application boundary

The results above are stated in this document's own words, with the indicated theorem, section and page locators. No source passages are stored with the deliverables. Public PDF checksums and access dates are recorded in the packet. The cited pages use the editions below.

- **BM97**: Edward Bierstone and Pierre D. Milman, [Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant](https://www.mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf). Inventiones Mathematicae 128 (1997), 207–302; full published PDF. Consulted locators: §1, §§3–6, §10, Theorems 11.14, 12.2, 12.4, 13.2; printed pp. 209–259, 283–298.
- **LL24**: Aaron Landesman and Daniel Litt, [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4). Annals of Mathematics 199 (2024), no. 2, 823–897; the accessed PDF is arXiv v4 (February 2025), with its own author pagination. Consulted locators: Lemma 2.2.3, p. 15; §8.3, especially proof of Lemma 8.3.3, pp. 40–41.
- **LLSS23**: Wanlin Li, Daniel Litt, Nick Salter and Padmavathi Srinivasan, [Surface bundles and the section conjecture](https://nsalter.science.nd.edu/research/sectconj.pdf). Mathematische Annalen 386 (2023), 877–942; author PDF dated May 27, 2023, with author pagination. Consulted locators: §2.1, Lemma 2.1.1 and proof, pp. 6–8.
- **BP26**: George Boxer and Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.ma.imperial.ac.uk/~gboxer/higherhidaSiegel.pdf). Inventiones Mathematicae 244 (2026); author PDF pagination. Consulted locators: §4.1.10–4.1.11, author p. 42; imported from accepted R09.7/cartier-separation.
- **BKT20**: Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf). Journal of the American Mathematical Society 33 (2020), 917–939; author PDF pagination. Consulted locators: §4.1, author p. 13; SNC source-chart input only.
- **STACKS**: The Stacks Project Authors, [The Stacks Project](https://stacks.math.columbia.edu). Online version accessed 2026-10-11; stable tag locators. Consulted locators: §29.54, Lemma 29.54.14 (0AVK); §41.21, Definitions 41.21.1, 41.21.4 and Lemmas 41.21.2, 41.21.6, 41.21.7.

### Source finding E1903

The packet records one proof gap, scoped to **LL24, arXiv v4, proof of Lemma 8.3.3, pp. 40–41**. The accessed argument takes a finite normalization after strictifying the stable-moduli boundary, without justifying smoothness of that normalization. The quadratic cone z squared=xy is the explicit counterexample to that intermediate smoothness inference. The corrected construction resolves the normalization and principalizes its reduced boundary while preserving the given cover. Pullback equations on the resulting strict-SNC model then give the required nonnegative meridian exponents. This finding concerns that proof step; it does not assert that the integrality theorem fails.

The official arXiv version history, the Annals article page and title/correction searches yielded no existing correction on 2026-10-11. The journal full text was not inspected. The finding therefore makes no claim about its wording; the accessed artifact and checksum are recorded under `sourceVersions`. Independent review must check the finding and the correction. The aggregate packet’s two already confirmed BM97 misprints remain imported and are not duplicated here.

The source uses outside this part keep their established owners. Kisin–Zhou's smooth-atlas construction remains R09.4; Chen's stack, coarse-space, rigidification and deformation technology remains R09.4–R09.6. We request only the stable-chart and cover interfaces this part consumes. The Cartier-separation result used by Boxer–Pilloni is imported from the accepted aggregate and remains valid on arbitrary schemes under its regular-pivot hypotheses. It is not replaced by the smooth characteristic-zero resolution statement. BKT's buffered boundary charts consume the accepted SNC input here; their finite coverings, definability and period-map estimates belong to the Hodge/period-map consumer. Borel extension itself is also a consumer result. No general source theorem is weakened by silently replacing its input category or passing from a stack to a coarse space.

The geometric acceptance chain is: a genuine finite blowup witness; correct controlled/strict/total transforms; actual regular-to-completed coefficients; preserved prescribed opens; strictification of an étale normal-crossings boundary; normalization followed by resolution when needed; full-chart extending units; and positive meridians with the stated exponent matrix. Every transition has a named owner or supplier contract.
