# The pointed curve moduli problem

This layer constructs the smooth and stable ordered pointed curve moduli problems over arbitrary schemes, together with their universal family. The essential objects are groupoids of geometric families: changes of base transport curves and their sections, and automorphisms remain visible. Effective descent must recover these families and arrows, including the canonical polarization that ensures the descended total space is a scheme.

Fix natural numbers g and n with 2g−2+n>0, where the expression is evaluated in the integers. A pointed family consists of a proper flat finitely presented morphism f:C→S, with nonempty geometrically connected geometric fibres of pure dimension one and arithmetic genus g, and sections σ_i indexed by the fixed ordered set {1,…,n}. Their images are pairwise disjoint and lie in the relative smooth locus. A stable family has nodal fibres and relatively ample log dualizing line ω_{C/S}(Σσ_i). A smooth family has f smooth; in the stable range its log line is automatically relatively ample. All schemes, markings, arrows and equalities retain the nilpotent structure of the base. No restriction to reduced, finite-type or locally Noetherian schemes is imposed here.

An arrow over a fixed base is a scheme isomorphism commuting with the projection and carrying each specified section to the section with the same index. Isomorphic objects need not be equal, and their automorphism groups are part of the moduli problem. Changing the order of markings is a separate operation. Connectedness without geometric connectedness, or ordinary points without section morphisms, does not meet the definition.

The family, node and stability notions belong to StableReduction Layers 0–3. The owned identifier `StableReductionPartII:key/moduli-curves` fixes the moduli specification. Its companions `MC.0/pullback-coherence`, `MC.0/effective-descent` and `MC.0/universal-curve` remain the corresponding target identifiers. The seven targets below refine their arbitrary-base and geometric interfaces; they do not replace these definitions. Node identifiers in the following headings have prefix `StableReductionPartII:MC.0/`.

## Dependencies and boundaries

| Supplier | Interface used here |
| --- | --- |
| StableReduction, Layer 0 | Relative curve families, finite presentation and scheme base change. |
| StableReduction, Layer 1 | Nodes, normalization, residues and branch flags, including both flags of a self-node. |
| StableReduction, Layer 2 | Locally Noetherian genus and relative duality, Cartier twists, positivity and compatibly polarized étale descent. |
| StableReduction, Layer 3 | Ordered pointed prestable/stable families, marking-preserving isomorphisms and stability on geometric components. |
| SchemeAndStackFoundations:SF.0 | The precise nodes `noetherian-approximation`, `finite-presentation-limits` and `generic-fibre-spreading`. |
| SchemeAndStackFoundations:SF.1 | `stack-in-groupoids`, `two-fibre-product`, `space-fppf-descent` and `qcoh-fpqc-descent`. |
| SchemeAndStackFoundations:SF.2 | `qcoh-higher-direct-images`, `derived-pullback-pushforward-qcoh`, `relative-dualizing-complex` and `curve-dualizing-comparison`, with the additional supplier contracts below. |
| AlgebraicVectorBundles, L0A–L0B | The existing ownership of tensor and pullback coherence for sheaves and line bundles. |

The original StableReduction coherent-theory convention restricts its duality and cohomology statements to locally Noetherian bases. Its polarized scheme descent is étale descent. Those contracts alone do not establish the assertions over all schemes and fppf covers below. The finite-stage comparison and the three explicit foundation extensions isolate exactly the extra input.

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Mathlib supplies the native slice pullback, its identity/composition comparisons, categorical cores, Cat-valued pseudofunctors, the fppf topology and the relative smooth locus. Tau Ceti supplies scheme-module cohomology and invertible sheaves, including their tensor-product object. None of these declarations supplies the stable-family moduli carrier or effective object descent for it. Current TauCetiRoadmap StableReduction and AlgebraicVectorBundles are imported at their stated boundaries; the newer current library family carrier is not silently treated as present at the pins.

Algebraicity, Deligne–Mumford structure, smoothness over Z, properness of the moduli stack, dimension and the identification with an additional stable marking belong to MC.1–MC.2. They are not hypotheses used to construct this moduli problem or to prove its descent.

## Finite-stage models of pointed curve diagrams

`pointed-approximation` — theorem.

Let A be a filtered colimit of finite-type Z-algebras A_i. Any finite diagram over Spec A of proper, flat, finitely presented, geometrically connected nodal curves of pure relative dimension one, equipped with finitely many ordered pairwise disjoint sections in the relative smooth locus and a fixed fibre genus for each curve, descends to some Spec A_i. Specified maps, isomorphisms, inverses, and finitely many commutative diagrams descend after a common refinement. Smoothness of a specified family and stability of a specified pointed family descend after refinement. The latter means positivity of 2h_v−2+b_v+m_v for every normalized geometric component, where b_v counts node branches. Two such finite-stage realizations of the same finite diagram become isomorphic at a common later stage, compatibly with all specified identifications. This is a local-on-the-base approximation theorem; it asserts no single Noetherian model for a non-quasi-compact base.

**Hypotheses and conventions.**

- Every curve morphism is of finite presentation; only a finite diagram and finitely many marked sections are being descended.
- The A_i form a filtered system of finite-type Z-algebras with colimit A.
- Fixed genus, nonempty geometrically connected fibres, and pure relative dimension one are part of the objects.

**Construction or proof.**

1. Import SF.0/noetherian-approximation and SF.0/finite-presentation-limits for schemes, arrows, equalities and inverse equations. Spread properness and flatness after refining.
2. Apply Stacks Lemma 53.20.10 to spread nodality, using its syntomic relative-dimension-one and unramified-singular-locus criterion. Spread geometric connectedness using the SF.0 property-spreading contract; use the locally Noetherian genus strata from StableReduction Layer 2 to select genus g.
3. Over a Noetherian model, the failure loci for smooth marked sections, disjointness, smooth fibres and stable fibres are closed after taking the appropriate proper images. Remove their images and refine the model until the limit base factors through the resulting open. Fixed-genus strata are open and closed.
4. Apply the finite-presentation limit theorem again to comparisons and all finite relations. Apply the construction on affine opens of a general base and compare on affine refinements of their intersections; do not assume intersections or the base are quasi-compact.

**Prerequisites.** `SchemeAndStackFoundations:SF.0/noetherian-approximation`, `SchemeAndStackFoundations:SF.0/finite-presentation-limits`, `SchemeAndStackFoundations:SF.0/generic-fibre-spreading`, `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Acceptance.**

- A marking permutation is a separately specified arrow, not an equality of ordered markings.
- Nilpotents of the base are retained by scheme approximation.
- No bound on the number of affine opens of an arbitrary base is imposed.

**Sources.**

- [STACKS-LIMITS] Lemmas 32.10.1 (01ZM), pp. 25–27; 32.10.2 (01ZR), pp. 27–28; 32.4.15 (09MT), p. 9. Finite-presentation objects, arrows and equalities admit finite-stage models; ampleness can be detected at a later stage.
- [STACKS-CURVES] Lemmas 53.20.1 (0C59), 53.20.9–53.20.10 (0C5E–0C5F), pp. 49–51. Nodality is described by finitely presented local conditions, is fpqc local and spreads through affine-transition limits.
- [KNUDSEN-II] Definition 1.1, pp. 162–163; Definition 1.2, p. 164. The curve, section and fibrewise stability conditions being spread are those of the pointed moduli problem.

## Genus and cohomology over arbitrary bases

`arbitrary-base-genus` — theorem.

For a proper flat finitely presented scheme morphism f:C→S with nonempty geometrically connected nodal fibres of pure dimension one, the unit O_S→f_*O_C is an isomorphism universally; R¹f_*O_C is finite locally free, commutes with arbitrary base change, and R^qf_*O_C vanishes for q≥2. The geometric-fibre equality dim H¹(C_s,O)=g is equivalent to R¹f_*O_C having constant rank g. Formation of the genus-g open-and-closed locus commutes with arbitrary base change. On a locally Noetherian base this identifies with the genus convention and coherent cohomology of StableReduction Layer 2; over an affine base its groups identify with Tau Ceti scheme-module sheaf cohomology. No canonical splitting of Rf_*O_C is asserted.

**Hypotheses and conventions.**

- S is any scheme, including nonreduced and non-Noetherian schemes.
- Geometric connectedness, reduced nodal fibres, properness, flatness and finite presentation are essential hypotheses.

**Construction or proof.**

1. Use the requested SF.2 perfect-pushforward theorem with E=O_C to obtain a perfect complex whose derived formation commutes with arbitrary base change.
2. Use geometric connectedness and geometric reducedness to identify fibre H⁰ with the residue field. The unit then gives a local splitting as in Stacks 36.32.5. Fibre dimension one eliminates cohomology in degrees ≥2.
3. Apply the requested perfect-complex fibre-amplitude criterion to the complementary complex, whose fibres are concentrated in degree one. Its degree-one cohomology is finite locally free and has arbitrary base change.
4. Identify affine sections using SF.2/qcoh-higher-direct-images and Tau Ceti Cohomology; compare with the Noetherian supplier using pointed-approximation and uniqueness of base-change identifications.

**Prerequisites.** `StableReductionPartII:MC.0/pointed-approximation`, `SchemeAndStackFoundations:SF.2/qcoh-higher-direct-images`, `SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance.**

- For P¹_S, R¹f_*O=0 and the genus is zero.
- For a smooth elliptic family the first cohomology has rank one, including after a nonflat change of base.
- Two disjoint copies of P¹ fail the unit-isomorphism assertion: f_*O is O_S⊕O_S.

**Sources.**

- [STACKS-CURVES] Lemma 53.20.12 (0GKA), pp. 52–53. A proper geometrically connected nodal family has universal degree-zero comparison, finite locally free first cohomology and higher vanishing.
- [STACKS-PERFECT] Lemma 36.30.4 (0B91), p. 74; Lemma 36.32.5 (0E62), pp. 79–80. Perfect pushforward and arbitrary base change yield the cohomological argument, with a local splitting rather than a distinguished one.
- [STACKS-MODULI] Lemmas 109.9.3–109.9.4 (0E1J, 0E6K), pp. 10–11; Lemma 109.20.3 (0E6V), p. 22. These identify the constant-genus locus by the rank of first cohomology.

## Log dualizing sheaves over arbitrary bases

`arbitrary-base-duality` — construction.

For a proper flat finitely presented nodal curve f:C→S of pure relative dimension one over any scheme S, take the canonical relative dualizing complex supplied by SF.2/relative-dualizing-complex, with its diagonal rigidity and, for proper f, trace normalization. It is concentrated in degree −1, with cohomology ω_{C/S}; ω is an invertible O_C-module. For ordered disjoint smooth sections σ_i, their images are relative effective Cartier divisors D_i. Define L=ω_{C/S}(ΣD_i) using the existing invertible-sheaf tensor and Cartier-twist operations. Canonical comparisons u_C^*ω_{C/S}≅ω_{C_T/T} and u_C^*L≅L_T hold for every T→S, respect isomorphisms of pointed curves, and satisfy unit and composition coherence. On the locally Noetherian domain these identify with StableReduction Layer 2, including trace and smooth differential comparisons. On a geometric normalized component v, deg L=2h_v−2+b_v+m_v; a self-node contributes two to b_v. L is relatively ample exactly when all these degrees are positive. This extends the existing curve-specific dualizing interface; it does not introduce another line-bundle or generic duality theory.

**Hypotheses and conventions.**

- Nodal fibres are Gorenstein and geometrically reduced; all geometric components have dimension one.
- Each σ_i is a section in the relative smooth locus and the sections are pairwise disjoint.
- For ampleness the morphism is proper and of finite presentation; no Noetherian condition is imposed on S.

**Construction or proof.**

1. Import the arbitrary-base rigid dualizing complex from SF.2. Use the requested arbitrary-base Cohen–Macaulay concentration and Gorenstein-invertibility extension to obtain its degree −1 module, with arbitrary base change.
2. Import relative Cartier marking divisors and log twists from StableReduction Layers 2–3. Form their tensor product with ω using the line-bundle API already owned by AlgebraicVectorBundles; do not replan those operations.
3. Compare with SF.2/curve-dualizing-comparison and the existing StableReduction sheaf on Noetherian models. Trace/rigidity uniqueness makes the comparisons independent of models and coherent; pointed-approximation handles finite diagrams.
4. Import the normalization residue and degree formula and componentwise positivity from StableReduction Layers 1–3. Reduce the fibrewise calculation to the Noetherian case; apply the relative ampleness criterion locally on S.

**Prerequisites.** `StableReductionPartII:MC.0/pointed-approximation`, `SchemeAndStackFoundations:SF.2/relative-dualizing-complex`, `SchemeAndStackFoundations:SF.2/curve-dualizing-comparison`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`.

**API.**

| Name | Contract |
| --- | --- |
| `PointedCurves.LogDualizing.omega` | The invertible sheaf is H⁻¹ of the supplied rigid relative dualizing complex. |
| `PointedCurves.LogDualizing.markingCartier` | A smooth section determines its relative effective Cartier divisor, compatibly with base change. |
| `PointedCurves.LogDualizing.line` | Form ω twisted by the sum of the ordered marking divisors in the existing invertible-sheaf category. |
| `PointedCurves.LogDualizing.baseChange` | Every base change has a canonical log-line isomorphism, with identity and composition coherence. |
| `PointedCurves.LogDualizing.mapIso` | A marking-preserving family isomorphism induces the canonical log-line isomorphism; its composition law lifts scheme cocycles. |
| `PointedCurves.LogDualizing.noetherianComparison` | On locally Noetherian bases identify ω, its trace, and the marked twist with StableReduction Layer 2 and SF.2/curve-dualizing-comparison. |
| `PointedCurves.LogDualizing.smoothComparison` | On the relative smooth locus ω identifies with Ω¹_{C/S}; the twist retains the marking divisors. |
| `PointedCurves.LogDualizing.componentDegree` | Degree on a normalized geometric component is 2h_v−2+b_v+m_v, counting both flags of a self-node. |
| `PointedCurves.LogDualizing.ample_iff` | Relative ampleness is equivalent to positivity of that degree on every geometric component. |

**Uses.**

- StableReductionPartII:MC.0/polarized-descent-comparison: The functorial canonical log line equips scheme descent with an actual lifted polarization cocycle.
- StableReductionPartII:MC.1 and StableReductionPartII:MC.2: Fixed log pluricanonical embeddings and stable-family pullbacks use the same line.
- Knudsen II, Definition 1.1, pp. 162–163: The log line realizes the stability condition and its normalization degree test.

**Checks.**

- `PointedCurves.LogDualizing.rationalThree` (computation): Over any field with three distinct chosen points of P¹, L≅O(1), so the family is stable.
- `PointedCurves.LogDualizing.rationalTwo` (non-example): For two distinct marks of P¹, L≅O(0); excluding this family prevents mere nonnegative degree from being used for stability.
- `PointedCurves.LogDualizing.fourPointBoundary` (computation): For a two-component stable genus-zero four-pointed fibre split 2+2, log multidegree is (1,1), not (2,2).
- `PointedCurves.LogDualizing.selfNodeFlags` (computation): For an irreducible rational one-nodal curve with one mark, degree is −2+2+1=1, hence stable.
- `PointedCurves.LogDualizing.nonflatBaseChange` (compatibility): For any pointed stable family over k[ε]/(ε²), reduction to k identifies its log line with the fibre log line by the canonical base-change isomorphism.

**Acceptance.**

- P¹ with three distinct markings has L≅O(1), whereas two markings give O(0) and fail stability.
- On two rational components joined at one node, each carrying two markings, L has multidegree (1,1).
- A rational irreducible one-nodal curve with one smooth mark has degree one: the self-node has two branches.

**Sources.**

- [STACKS-MODULI] Lemma 109.19.1, Definition 109.19.2 and Lemma 109.19.3 (0E6P, 0E6Q, 0E6R), pp. 20–21. For arbitrary-base Cohen–Macaulay curve families the relative dualizing complex is a shifted flat module, and it is invertible in the Gorenstein case.
- [STACKS-DUALITY] Remark 48.12.5 (0B6S), p. 30; Section 48.28, especially Lemma 48.28.6, pp. 72–75. Proper relative duality supplies the normalized complex; rigidity gives uniqueness and base-change compatibility.
- [KNUDSEN-II] Definition 1.1 and discussion of ω, pp. 162–163. The pointed stability condition uses the log dualizing line, and the source separates its base-change assertion from the Noetherian duality argument.

## Geometric realization of the pointed moduli pseudofunctor

`native-family-realization` — construction.

For naturals g,n with 2g−2+n>0 computed in Z, realize StableReductionPartII:key/moduli-curves on all schemes. Start with the category whose objects are an object q:C→S of the native slice category Over S and an ordered n-tuple of slice morphisms from id_S to q; morphisms are slice arrows preserving each of the n sections. Restrict by the actual geometric predicates: proper, flat, finitely presented, nonempty geometrically connected genus-g fibres of pure dimension one, nodality, disjointness and smoothness of the sections, and relative ampleness of the canonical log line. Take the native categorical core of this full subcategory. This is the stable fibre groupoid; its full subgroupoid cut out by smoothness of C→S is the smooth fibre groupoid. Reindex along u:T→S by the native slice pullback and the induced sections. Transport the native slice pullback identity and composition isomorphisms through the pointed full subcategories and their cores to obtain a Pseudofunctor on LocallyDiscrete(Schemeᵒᵖ) with values in Cat and groupoid fibres. The comparisons preserve the ordered marking data and satisfy the unit and pentagon laws. Geometric points recover the groupoid of pointed curves with their full marking-preserving automorphism groups, rather than its set of isomorphism classes.

**Hypotheses and conventions.**

- Fix universes for schemes, fibre categories and the Cat-valued pseudofunctor; use universe enlargement where required.
- The geometric predicates refer to the existing StableReduction objects, with arbitrary-base genus and log-duality comparisons above.
- There is no assumption that the moduli problem is already algebraic or has a Hilbert atlas.

**Construction or proof.**

1. Use the parent owned definition as the specification and StableReduction Layer 3 as the family and stability interface. Realize sections as actual morphisms in Over S, not named points or unconnected labels.
2. Use arbitrary-base-genus and arbitrary-base-duality to interpret the family predicates without a locally Noetherian restriction.
3. On the total curve of a pullback, the i-th section is the unique map with components σ_i∘u and id_T. All geometric conditions are preserved by base change.
4. Use Over.pullbackId and Over.pullbackComp for canonical comparisons, verify their equations on both projections and all marked sections, and apply Functor.core and Iso.core. These comparison maps give the same coherent pseudofunctor as parent MC.0/pullback-coherence.
5. Identify arrows in the core with inverse pairs of section-preserving over-S morphisms, and identify geometric fibres with the parent geometric-curve groupoid.

**Prerequisites.** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/pointed-approximation`, `StableReductionPartII:MC.0/arbitrary-base-genus`, `StableReductionPartII:MC.0/arbitrary-base-duality`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `mathlib:CategoryTheory.Over.pullback`, `mathlib:CategoryTheory.Over.pullbackId`, `mathlib:CategoryTheory.Over.pullbackComp`, `mathlib:CategoryTheory.Core`, `mathlib:CategoryTheory.Functor.core`, `mathlib:CategoryTheory.Iso.core`.

**API.**

| Name | Contract |
| --- | --- |
| `PointedCurves.Moduli.obj` | The fibre over S is the core of the geometric pointed full subcategory of Over S. |
| `PointedCurves.Moduli.isoEquiv` | Arrows are precisely marking-preserving scheme isomorphisms over the fixed base. |
| `PointedCurves.Moduli.pullback` | A scheme map induces the actual fibre-product functor on pointed families and isomorphisms. |
| `PointedCurves.Moduli.pullbackId` | The native identity-pullback isomorphism identifies every marking with its original section. |
| `PointedCurves.Moduli.pullbackComp` | The native iterated-pullback comparison preserves every marking and satisfies pentagon and unit laws. |
| `PointedCurves.Moduli.smoothInclusion` | Smooth families form a full subgroupoid, and their inclusion is pseudonatural in the base. |
| `PointedCurves.Moduli.geometricPoints` | Evaluation on an algebraically closed field is equivalent to the usual geometric pointed-curve groupoid, preserving automorphism groups. |
| `PointedCurves.Moduli.noetherianComparison` | Restriction to locally Noetherian schemes identifies with the StableReduction family interface and the parent owned definition. |

**Uses.**

- StableReductionPartII:MC.1: Hilbert presentations must present these geometric fibres and their actual isomorphisms.
- StableReductionPartII:MC.2 and StableReductionPartII:MC.3: Forgetful maps, universal evaluation and coarse moduli use the same groupoid rather than classes.
- Knudsen II, Definition 1.2, p. 164: Cartesian arrows determine the category fibred in groupoids.

**Checks.**

- `PointedCurves.Moduli.ellipticInvolution` (non-example): For an elliptic curve E over an algebraically closed field of characteristic ≠2, (E,0) is an object at (g,n)=(1,1) and [−1] is a nonidentity automorphism. A set-valued replacement fails this test.
- `PointedCurves.Moduli.orderedTriple` (non-example): The identity of P¹ is not a marking-preserving map from (0,1,∞) to (1,0,∞); relabelling is not an implicit identification of objects.
- `PointedCurves.Moduli.noninvertibleArrow` (non-example): In characteristic p>0, the Frobenius endomorphism of P¹ over F_p preserves 0,1,∞ but is not a moduli arrow, since it is not an isomorphism.
- `PointedCurves.Moduli.emptyBase` (degenerate): Over the empty scheme the stable fibre category is equivalent to the terminal groupoid, with empty total curve and uniquely determined marking maps; fibre conditions are vacuous.
- `PointedCurves.Moduli.markingBaseChange` (compatibility): The pullback of each marking is the unique graph map with components σ_i∘u and id_T. Iterated pullback gives the same marking through the native comparison.

**Acceptance.**

- A smooth elliptic curve with its origin retains its inversion automorphism in characteristic different from two.
- For a fixed ordered triple on P¹, the identity scheme map is not an arrow to a differently ordered triple unless it preserves each label.
- A noninvertible section-preserving endomorphism belongs to the ambient pointed slice category when defined, but is not an arrow of the moduli groupoid.

**Sources.**

- [KNUDSEN-II] Definitions 1.1–1.2, pp. 162–164. Ordered smooth disjoint markings, fibrewise stability and cartesian family isomorphisms specify the geometric fibre categories and their reindexing.
- [KNUDSEN-2012] Introduction, pp. 1–2. The moduli objects are families over schemes, with base change, and carry a universal family.

## Effective descent of the geometric pointed moduli problem

`polarized-descent-comparison` — comparison.

For an fppf covering of any scheme S, restriction of either the stable or the smooth pointed genus-(g,n) groupoid to its descent-data category is an equivalence. In the stable case, a family isomorphism cocycle induces a specified cocycle of isomorphisms on L=ω(ΣD_i), using rigidity/base-change coherence; this is a lift of the cocycle to line-bundle data, not merely invariance of a line-bundle isomorphism class. Apply polarized descent to obtain a scheme family and descend the marking sections and their equalities. The descended geometric predicates and fixed genus are the ones of native-family-realization. These equivalences give the native Pseudofunctor.IsStack instance for Scheme.fppfTopology and the specified groupoid fibres separately. On the locally Noetherian étale subsite the descended family and log line agree, by a uniquely determined isomorphism compatible with the chosen descent identifications, with the polarized descent already owned by StableReduction Layer 2. The same uniqueness compares with the polarized descent comparison of R09.3 on their common domain.

**Hypotheses and conventions.**

- Use the general polarized fppf descent supplier requested from SF.1, including actual cocycle isomorphisms, arrows and marking maps.
- The stable log line is relatively ample by arbitrary-base-duality.
- The smooth groupoid is the full subcategory satisfying smoothness, an fppf-local condition.

**Construction or proof.**

1. Use log-duality mapIso and baseChange to lift the curve descent cocycle canonically to L, with its identity and triple-overlap equations.
2. Use SF.1/space-fppf-descent and SF.1/qcoh-fpqc-descent through the requested polarized-scheme descent theorem. Relative ampleness is fpqc local, and the descended ample invertible sheaf makes the descended algebraic space a scheme (Stacks 74.13.1).
3. Descend sections and marking-preserving arrows using the morphism part of the supplier and subcanonicity. Properness, flatness, finite presentation, nodality, geometric connectedness, genus, smoothness/disjointness of markings and log ampleness descend; use Stacks 53.20.9 for nodality.
4. Translate full faithfulness and essential surjectivity of the descent functor into native IsStack via SF.1/stack-in-groupoids. Preserve automorphisms in this equivalence. Compare étale and fppf descent constructions using full faithfulness, not a chosen equality of objects.

**Prerequisites.** `StableReductionPartII:MC.0/native-family-realization`, `StableReductionPartII:MC.0/arbitrary-base-duality`, `SchemeAndStackFoundations:SF.1/space-fppf-descent`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

**Acceptance.**

- For a finite separable splitting cover of a genus-zero three-pointed form, descent recovers the marked curve and its descent identifications. The triviality theorem is imported from MC.2, not used to prove descent.
- An elliptic involution in an overlap cocycle descends as actual automorphism data; it is not discarded by passing to classes.
- Specifying that a line-bundle class is fixed, without cocycle isomorphisms, is insufficient input to polarized descent.

**Sources.**

- [STACKS-QUOT] Lemma 99.14.3 (0D40), pp. 38–39. The fppf stack property for polarized proper flat finitely presented schemes follows from space descent, module descent and descent of ampleness.
- [STACKS-DESCENT] Lemma 74.13.1 (0D3C), pp. 21–22. An ample line descends along fpqc covers, and its existence over a scheme base forces the descended space to be a scheme.
- [KNUDSEN-II] Definition 1.2 and following stack assertion, p. 164. The original fibred category and its étale stack assertion motivate the comparison; the fppf and arbitrary-base strengthening uses the Stacks arguments explicitly.

## The universal curve represents an unrestricted additional section

`universal-evaluation` — comparison.

Realize the parent MC.0/universal-curve construction by the pseudofunctor Z̄_{g,n} whose S-objects are stable pointed families (C/S,σ_i) together with any section Δ:S→C, and whose arrows are marking-preserving isomorphisms carrying Δ to Δ. Forgetting Δ defines π:Z̄→M̄. The extra-section pseudofunctor is an fppf stack by effective family descent and descent of section morphisms. For a family x over S, there is a pseudonatural equivalence h_S×_{M̄}Z̄≃h_C over h_S: an object over u:T→S includes a specified isomorphism of its underlying family with u^*x, and that isomorphism carries its extra section to a unique map T→C over S. Thus π is represented by schemes, and its base change along x is exactly f:C→S. It is representable, proper, flat, finitely presented and nodal of pure relative dimension one, with geometrically connected genus-g fibres. Its relative smooth locus is identified under every such base change with that of f; a geometric point is smooth for π exactly when it is smooth in the corresponding geometric curve. The n marking maps M̄→Z̄ send Δ to σ_i. Their images are disjoint and in the relative smooth locus. Δ is otherwise unrestricted and can coincide with a mark or pass through a node; it is not a new stable disjoint marking. No equivalence with M̄_{g,n+1} is assumed; that equivalence is owned by MC.2/expansion-contraction-inverses.

**Hypotheses and conventions.**

- g,n satisfy the stable range and x is an actual object of native-family-realization.
- The two-fibre product includes an isomorphism to the fixed pulled-back family.
- The representability statement is about the projection, not algebraicity of M̄.

**Construction or proof.**

1. Use the native over-S section Hom description and fibre-product universal property to identify sections of C_T→T with maps T→C over S.
2. Using SF.1/two-fibre-product, identify an object with a family, an identification with x_T, and an extra section. Transport the section to x_T. The inverse uses x_T with its given section and identity identification.
3. Prove full faithfulness: an arrow compatible with the fixed identification is uniquely determined. This makes each represented fibre discrete while leaving the automorphisms of Z̄ and M̄ intact. Check pseudonaturality in T and x.
4. Transport the curve properties through this equivalence and identify the n marking maps. Extra-section descent follows from descent of morphisms; there is no smooth-locus condition on Δ.

**Prerequisites.** `StableReductionPartII:MC.0/native-family-realization`, `StableReductionPartII:MC.0/polarized-descent-comparison`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `mathlib:CategoryTheory.Over.pullback`.

**API.**

| Name | Contract |
| --- | --- |
| `PointedCurves.Universal.sectionEquiv` | Sections of C_T→T are naturally equivalent to over-S maps T→C, via the native slice pullback. |
| `PointedCurves.Universal.fiberEquivalence` | The two-fibre product h_S×_{M̄}Z̄ is represented by C over S, naturally in the classified family. |
| `PointedCurves.Universal.marking` | The i-th marking morphism is obtained by choosing Δ=σ_i, for each i in the fixed ordered index set. Composing it with the projection is canonically identified with the identity of the moduli pseudofunctor. |
| `PointedCurves.Universal.markingPullback` | Under fiberEquivalence, the i-th marking pulls back to the original σ_i, with the slice-section identification. |
| `PointedCurves.Universal.projectionProperties` | Every scheme base change of the projection is the classified proper flat finitely presented nodal curve. Its geometric fibres are connected of genus g, and its pointwise relative smooth locus is that of the classified curve. |
| `PointedCurves.Universal.baseChange` | The representing equivalence commutes with arbitrary change of base and with family isomorphisms, coherently. |
| `PointedCurves.Universal.smoothRestriction` | Restriction over the smooth-family subfunctor is the whole smooth family; over the stable base the relative smooth locus alone omits nodes. |

**Uses.**

- Knudsen 2012, Introduction, pp. 1–2: The unrestricted extra section and the diagonal prove the universal-family square.
- StableReductionPartII:MC.2/expansion-contraction-inverses: Expansion replaces a node or collision by a new component, identifying this universal curve with stable n+1 markings.
- StableReductionPartII:MC.5: Marked clutching and universal sections use the represented curve and its ordered markings.

**Checks.**

- `PointedCurves.Universal.nodeAllowed` (non-example): For a stable genus-zero four-pointed curve with two rational components carrying two marks each, the node defines a geometric point of the universal fibre.
- `PointedCurves.Universal.collisionAllowed` (degenerate): For any pointed family, choosing Δ=σ_1 defines an object of Z̄; it does not define a disjoint n+1-st marking on the same total curve.
- `PointedCurves.Universal.nodalProjection` (non-example): The universal projection has a nonsmooth fibre at that node, so it is not smooth over the entire stable moduli problem.
- `PointedCurves.Universal.markingPullbackTest` (compatibility): Under h_S×_{M̄}Z̄≃h_C, each marking map is precisely the given section σ_i.
- `PointedCurves.Universal.identifiedFibre` (characterisation): For an elliptic pointed curve with nontrivial automorphisms, an automorphism in the represented two-fibre fibre compatible with a fixed identification must be the identity.

**Acceptance.**

- Over a field the fibre over a pointed curve together with its fixed identification is its entire curve, including every node.
- A marking section is itself a valid extra section.
- For a curve with automorphisms, discreteness is asserted only after specifying the identification with the fixed family.

**Sources.**

- [KNUDSEN-2012] Introduction, pp. 1–2, the cartesian universal-family square. An extra section has no smoothness or disjointness requirement; applying the construction to the diagonal of C×_S C identifies the pulled-back universal family with C.
- [KNUDSEN-II] Definition 1.2, p. 164; Corollary 2.6, p. 179. The extra-section category is distinct from the stable extra-marking category; expansion and contraction compare them in MC.2.

## The smooth-family open and the relative smooth locus

`smooth-base-restriction` — theorem.

For a stable family f:C→S, let C_sm be the relative smooth locus, and define S_sm as the open subscheme with underlying set S minus f(|C| minus |C_sm|). The image removed is closed because f is proper. For any u:T→S, the family C_T→T is smooth exactly when u factors through S_sm; the open S_sm and the resulting cartesian square commute with arbitrary base change. Hence the smooth pointed pseudofunctor is a full open subfunctor of the stable one, represented on every scheme test object by S_sm. Pulling the universal curve back to that subfunctor gives C×_S S_sm, with all its markings. This differs from C_sm→S, which keeps smooth points of nodal fibres. Smoothness of the moduli stack over Z, owned by MC.2, is a separate assertion and implies no smoothness of the universal projection over nodal curves.

**Hypotheses and conventions.**

- f is proper, flat and finitely presented with nodal pure-one-dimensional geometric fibres.
- The relative smooth locus is taken for f, not for the total space over Z.

**Construction or proof.**

1. Use the native Scheme.Hom.smoothLocus for the relative smooth locus and its base-change characterization. Properness makes the image of its closed complement closed.
2. The fibre over s is smooth precisely when the entire fibre lies in C_sm. Faithfully flat field extension detects this condition, proving the arbitrary-base-change characterization of the resulting open subscheme.
3. Apply this construction naturally to every classified family to obtain the represented open subfunctor; identify the restricted universal curve by universal-evaluation.

**Prerequisites.** `StableReductionPartII:MC.0/native-family-realization`, `StableReductionPartII:MC.0/universal-evaluation`, `mathlib:AlgebraicGeometry.Scheme.Hom.smoothLocus`.

**Acceptance.**

- For a smooth family S_sm=S and C_sm=C.
- For a stable nodal curve over an algebraically closed field S_sm is empty while C_sm is nonempty.
- At a smoothing xy=t, the special fibre contains a nonsmooth node even though the total space may be smooth over the ground field.

**Sources.**

- [STACKS-MODULI] Lemma 109.16.1 (0DZZ), p. 16. The smooth-family locus is obtained by removing the proper image of the nonsmooth locus and commutes with arbitrary base change.
- [KNUDSEN-2012] Introduction, pp. 1–2. Universal evaluation pulls the entire classified curve back; restricting the base to smooth families therefore restricts the whole curve.

## The represented fibre and its automorphisms

The distinction between a moduli fibre and a represented two-fibre product is essential. If x is a pointed curve over S, an object of h_S×_{M̄}Z̄ over T includes u:T→S and an isomorphism from its underlying pointed family to u^*x. After this identification, its extra section is simply a map T→C over S. An arrow compatible with that identification has its underlying family map fixed, so its action on the section is fixed as well. This explains the discrete represented fibre h_C without asserting that x has no automorphisms in M̄.

For example, take a pointed elliptic curve (E,0) in characteristic different from two. Inversion is an automorphism in M̄. It acts on points of E, including extra sections of its universal fibre. Requiring compatibility with a *chosen* identification with E removes that freedom in the two-fibre product. Passing to isomorphism classes before forming the fibre product would lose the information required for this argument and for descent.

The same distinction separates Z̄ from the subproblem of one more smooth disjoint marking on C. Over a stable nodal geometric curve, a node is a point of Z̄. At an existing marking, choosing that marking as the extra section is also allowed. The corresponding stable curve with n+1 disjoint smooth markings requires expansion, owned by MC.2, and generally has a different total curve.

## Sample exports and their mathematical owners

The following identifiers from the owned moduli definition retain their existing providers. They are exports to verify against those providers, not prerequisites of effective descent.

| Exports | Provider | Contract |
| --- | --- | --- |
| `CurvesModuli.rationalThreeEquivalence`, `CurvesModuli.rationalThree` | `StableReductionPartII:MC.2/genus-zero-base` | The stable and smooth (0,3) groupoids are terminal over Spec Z, with the unique three-point trivialization. This is an MC.2 consequence and not an MC.0 descent prerequisite. |
| `CurvesModuli.crossRatio`, `CurvesModuli.crossRatioBoundary` | `StableReductionPartII:MC.2/cross-ratio` | The ordered (0,4) smooth base is P¹ minus 0,1,∞; its stable base is P¹ with the three 2+2 boundary partitions. |
| `CurvesModuli.stableStackProperties`, `CurvesModuli.stableStackDimensions` | `StableReductionPartII:MC.2/pointed-dm-theorem` | Algebraicity, proper Deligne–Mumford structure, smoothness over Z and dimension 3g−3+n are MC.2 conclusions, not assumptions of MC.0. |
| `CurvesModuli.universalForgetful`, `CurvesModuli.universalRationalFour` | `StableReductionPartII:MC.2/expansion-contraction-inverses` | Universal extra sections correspond to stable n+1 markings via expansion and contraction, with inverse natural family isomorphisms. |
| `CurvesModuli.forgetStabilize`, `CurvesModuli.forgetRationalTail` | `StableReductionPartII:MC.2/forget` | Single-mark forgetting followed by stabilization is supplied only when the target pair is in the stable range. |

The genus-zero base and cross-ratio equivalences must retain their groupoid-level meaning over schemes, rather than asserting only a bijection of algebraically closed points. The finite-diagram approximation target transfers a Noetherian construction only when its object, arrow, inverse and coherence data meet that target's finite-presentation hypotheses. It does not automatically extend an arbitrary abstract theorem to non-Noetherian bases. In particular, the source's Noetherian stabilization arguments are not being used as an unqualified all-schemes proof of the MC.2 exports.

The other owned exports are realized by the targets in this layer:

| Export | Target |
| --- | --- |
| `CurvesModuli.rationalTwoExcluded` | `StableReductionPartII:MC.0/arbitrary-base-duality` |
| `CurvesModuli.selfNodeFlags` | `StableReductionPartII:MC.0/arbitrary-base-duality` |
| `CurvesModuli.ellipticInvolution` | `StableReductionPartII:MC.0/native-family-realization` |
| `UniversalCurve.section` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.marking` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.projectionNodal` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.smoothRestriction` | `StableReductionPartII:MC.0/smooth-base-restriction` |
| `CurvesModuli.obj` | `StableReductionPartII:MC.0/native-family-realization` |
| `CurvesModuli.iso` | `StableReductionPartII:MC.0/native-family-realization` |
| `CurvesModuli.pullback` | `StableReductionPartII:MC.0/native-family-realization` |
| `CurvesModuli.smoothInclusion` | `StableReductionPartII:MC.0/native-family-realization` |
| `CurvesModuli.geometricPoints` | `StableReductionPartII:MC.0/native-family-realization` |
| `UniversalCurve.fiber` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.baseChange` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.nodeAllowed` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.collisionAllowed` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.nodalProjection` | `StableReductionPartII:MC.0/universal-evaluation` |
| `UniversalCurve.smoothFiber` | `StableReductionPartII:MC.0/smooth-base-restriction` |

The moduli object, isomorphism, pullback, smooth-inclusion and geometric-point exports use the `PointedCurves.Moduli` API. The parent universal-fibre, section, base-change and marking exports use `PointedCurves.Universal`. Thus the different display names denote comparisons with the same owned objects; no second moduli problem is introduced.

## Foundation extensions required by the comparisons

The statements in this layer reduce to the imported contracts above and the following three precise additions. These are mathematical supplier obligations, not assumptions that the pinned libraries already contain the results.

1. **Perfect cohomological pushforward over arbitrary bases** (`SchemeAndStackFoundations:SF.2`). For proper finitely presented f:X→S over arbitrary schemes, Rf_*E is perfect with arbitrary derived base change if f is flat and E is perfect; likewise for a finitely presented S-flat module. Supply the perfect-complex fibre-amplitude criterion, locally free cohomology in a single fibre degree, and the local splitting induced by O_S→Rf_*O_X when each fibre H⁰ is κ(s). Stacks 36.30.4, 36.32.5 and More on Algebra 15.77.7. The existing derived-pushforward and Tor-independent comparison nodes do not assert this perfection or amplitude conclusion. Consumed by `StableReductionPartII:MC.0/arbitrary-base-genus`.

2. **Arbitrary-base Cohen–Macaulay dualizing module extension** (`SchemeAndStackFoundations:SF.2`). Extend the relative-dualizing-module concentration interface to arbitrary-base flat finitely presented Cohen–Macaulay morphisms of pure relative dimension d, using the already owned rigid relative dualizing complex: a pseudo-coherent module flat over the base in degree −d, arbitrary base change, invertibility for Gorenstein fibres, with coherent rigidity and proper trace comparisons. The existing relative-dualizing-module node is restricted to FTS_S with Noetherian S; the curve case is Stacks 109.19.1–109.19.3. Consumed by `StableReductionPartII:MC.0/arbitrary-base-duality`.

3. **General polarized fppf scheme descent supplier** (`SchemeAndStackFoundations:SF.1`). Effective fppf descent for proper flat finitely presented schemes endowed with a relatively ample invertible sheaf and specified compatible cocycle isomorphisms on it. Include morphisms, sections, equalities, refinements and arbitrary base-change compatibility. Recover a scheme from descended algebraic-space and module data using Stacks 74.13.1; cf. 99.14.3. Reuse the same outstanding supplier requested by AlgebraicModuliForArithmeticGeometry:R09.3/r093-polarized-descent-comparison; neither finite-locally-free Galois descent nor StableReduction Layer 2 étale descent supplies this general fppf contract. Consumed by `StableReductionPartII:MC.0/polarized-descent-comparison`.

The first extension is about perfection and fibre amplitude, beyond the existing statement that a derived pushforward preserves quasi-coherent cohomology. The second reuses the already arbitrary-base rigid complex and extends only its Cohen–Macaulay module interface. The third reuses the outstanding R09.3 polarized-descent supplier and its algebraic-space and module descent inputs. In particular, neither an invariant Picard class nor subcanonicity of schemes proves effectivity of a curve object.

The suggested signatures cover the native slice-section universal property and its evaluation checks. The geometric family, genus, dualizing, moduli and polarized-descent carriers are absent at the pins, so their full statements, API and checks remain the mathematical targets above. A generic pseudofunctor variable with an assumed descent property would not instantiate this moduli problem.

## Sources and corrections

All statements above are expressed independently of the source wording. Stacks page numbers refer to the individual chapter PDFs, version ed88ff78, compiled 14 July 2026; their internal theorem numbering omits the chapter prefix. Knudsen II page numbers are the printed journal pages; its scanned PDF starts at printed page 161. All public files were accessed on 18 October 2026, and their hashes are recorded with the source metadata.

- **[KNUDSEN-II]** Finn F. Knudsen, [The projectivity of the moduli space of stable curves, II: The stacks M_g,n](https://journals.msp.org/mscand/article/download/1622/1621/1653). Math. Scand. 52 (1983), 161–199, published journal scan. Read: Definitions 1.1–1.2 and dualizing-sheaf discussion, pp. 162–164; Proposition 2.1, p. 174; Lemma 2.5, p. 178; Corollary 2.6 and Theorem 2.7, p. 179.

- **[KNUDSEN-2012]** Finn F. Knudsen, [A closer look at the stacks of stable pointed curves](https://arxiv.org/pdf/1106.1588v2). arXiv:1106.1588v2, 3 April 2012. Read: Introduction and universal-family square, pp. 1–2; main lemma hypotheses, p. 3.

- **[STACKS-LIMITS]** The Stacks Project Authors, [Limits of Schemes](https://stacks.math.columbia.edu/download/limits.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 32.4.15, p. 9; 32.10.1–32.10.2, pp. 25–28.

- **[STACKS-CURVES]** The Stacks Project Authors, [Algebraic Curves](https://stacks.math.columbia.edu/download/curves.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 53.20.1–53.20.12, pp. 49–53.

- **[STACKS-MODULI]** The Stacks Project Authors, [Moduli of Curves](https://stacks.math.columbia.edu/download/moduli-curves.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 109.3–109.4, pp. 2–4; 109.9, pp. 10–11; 109.16.1, p. 16; 109.19–109.20, pp. 19–22.

- **[STACKS-DUALITY]** The Stacks Project Authors, [Duality for Schemes](https://stacks.math.columbia.edu/download/duality.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 48.12.4–48.12.5, pp. 29–30; 48.28, pp. 72–75.

- **[STACKS-PERFECT]** The Stacks Project Authors, [Derived Categories of Schemes](https://stacks.math.columbia.edu/download/perfect.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 36.30.4, p. 74; 36.32.3–36.32.5, pp. 79–80.

- **[STACKS-DESCENT]** The Stacks Project Authors, [Descent and Algebraic Spaces](https://stacks.math.columbia.edu/download/spaces-descent.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 74.13.1, pp. 21–22.

- **[STACKS-QUOT]** The Stacks Project Authors, [Quot and Hilbert Spaces](https://stacks.math.columbia.edu/download/quot.pdf). Version ed88ff78, compiled 14 July 2026; chapter-local PDF page numbers. Read: 99.14.1–99.14.3, pp. 37–39; 99.14.8, p. 40; 99.15.1, p. 44.

Three harmless notation slips were encountered. Each correction preserves the mathematical statement, and no correction was found in the live tag comments, the relevant parent-section comments or the chapter PDFs checked on the access date:

- **StableReductionPartII/E-MC0-1**, Lemma 53.20.11 (0CBX), proof, p. 52; ed88ff78 PDF and live tag checked 2026-10-18. The displayed residue power-series map assigns the variable x twice, once to each of the two branch parameters. The second assignment has source variable y, so x maps to the first branch parameter and y to the second. A map from the two-variable power-series ring is determined by separate images of x and y; the subsequent kernel (xy) and the final lifted map use those separate branch parameters.

- **StableReductionPartII/E-MC0-2**, Lemma 48.28.5, proof, p. 73; ed88ff78 PDF and live tag 0E2X checked 2026-10-18. The restriction-cocycle equation uses a transition indexed by V as its upper source, although V was an affine open of the base and the intermediate curve open is U′. Replace that upper source index by U′. The composite then runs from K_U restricted to U″ through K_U′ restricted to U″ to K_U″. The preceding definition gives transition maps indexed by inclusions of opens of X. The stated composition has intermediate object K_U′, so the first factor must have upper index U′.

- **StableReductionPartII/E-MC0-3**, Lemma 48.28.6, proof, p. 74; ed88ff78 PDF and live tag 0E2Y checked 2026-10-18. The closed immersion factoring the base-changed diagonal is given source X even though the displayed cartesian square has source X′. The source of the primed closed immersion must be X′. The immersion factors the diagonal of X′ over S′; the subsequent pushforward uses O_X′, which requires source X′.
