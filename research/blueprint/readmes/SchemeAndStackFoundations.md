# Scheme, stack, cohomology and intersection foundations

Partial checkpoint by Codex — `codex-rtOQ9t`, 2 October 2026. Refs #642.

First fifteen-node checkpoint for the reserved general henselization key in SF.0. It defines the actual filtered-colimit algebra through a full category of residue-preserving etale neighbourhoods, proves the source-level filtering and smallness adapters separately, and outlines canonical residue preservation, Jacobson containment, simple-root lifting, etale lift uniqueness/comparison, the initial pair, fixed pairs and the ordinary local case. All missing proof adapters, five other reserved definitions, seven-stage targets, routed papers and twelve confirmed red-team findings remain explicit unfinished work. All implementations are unchecked.

This document is definitive for this checkpoint. The suggested Lean file proposes names and signatures; it is uncompiled and proves nothing. There are fifteen new nodes, nine API entries, eight definition/construction tests and three SF.0 planets. All seven stages remain open. The exact reserved henselization ID is present; the five other reserved IDs are explicit unfinished work.

The construction uses arbitrary commutative ring/ideal pairs. It does not require Noetherianity, locality or completeness. The ideal I may be the unit ideal, in which case its henselization is the zero ring. General faithful flatness therefore cannot be asserted. The local case preserves the specified residue field; strict henselization remains an upstream import.

The library baseline already supplies schemes, morphism properties, the simple-root HenselianRing predicate, etale algebras, standard etale presentations, tensor/quotient operations, full subcategories, small models and colimits. The new construction does not rebuild those carriers. Importing an etale-section criterion for the existing simple-root predicate is mathematical proof work, not a definitional identification.

## Source and ownership evidence

All seven accepted REV-RS-25 SchemeAndStackFoundations layer decisions and their touching exact endpoint links read on 2026-10-02; full RS-25 family report not claimed read.

Full GrothendieckEulerForms and Multiquadratic upstream roadmap documents read during this continuing worker session. Only selected ModularCurves 4D/0E passages and five exact touching AlgebraicCurves/ModularCurves research links were read for this job. Existing upstream mathematics is imported, never re-planned.

All seven applicable AUDIT-01 entries and the complete key/henselization brief were read. Four reviewed paper uses (CMM21/046, BhattMathew23/005, Bresciani24/46 and GroechenigWyssZiegler20-B/127) inform consumer requirements; no fresh primary-paper read or closed application is claimed. All original roadmap references and issue routes remain pending.

- [Henselization and strict henselization](https://stacks.math.columbia.edu/tag/0EM7): Online tag 0EM7, retrieved 2026-10-02. The complete mathematical statements and proofs of Lemmas 15.12.1-15.12.8; the selected proof of 15.12.1 drives the nodes. Later lemmas are read leads, not fully planned results. SHA-256 `4ba42d62e07f39cd049d2d8f3111e27472daf4060685232ac1ea70a2cc3f0e0e`.

- [Henselian pairs](https://stacks.math.columbia.edu/tag/09XD): Online tag 09XD, retrieved 2026-10-02. Definition 15.11.1 and Lemmas 15.11.2-15.11.12, with their displayed proofs, especially all implications of 15.11.6 and integral closure argument 15.11.5. Only the beginning of 15.11.13 was read; no claim to have read the entire section. SHA-256 `18df4964249ddabef35c00efeba591da700b4b8dfef513eb438111965457a5a8`.

- [Product compatibility of henselization](https://stacks.math.columbia.edu/tag/0H7Q): Online tag 0H7Q, retrieved 2026-10-02. Statement and entire proof as displayed in parent section 0EM7, Lemma 15.12.8; the downloaded standalone page is a version receipt. Product compatibility is not a node in this checkpoint. SHA-256 `cc52e43fa913e1f2105ac07ad603e98576d233c57f151b52958b71c45b8531a5`.

- [More on Algebra source text](https://raw.githubusercontent.com/stacks/stacks-project/master/more-algebra.tex): Current master more-algebra.tex, retrieved 2026-10-02. Only the product-henselization proof paragraph containing the circular B double-prime subscript, collated with 0EM7/0H7Q. Not a whole-file read. SHA-256 `0106554339e8966fe04411b2ae9f9cd856b165849feef0c7bc37634819064708`.


The source product proof has a circular subscript: B''_2 = B_2 \otimes_B B''_2; the intended tensor product uses B''_2 = B_2 \otimes_B B'_2. The finding is a proof misprint awaiting independent review. It is scoped to the downloaded online/current-master versions; the product theorem is not planned here. Searches and reasons are in sourceIssues E1.

## Henselization declarations

### Residue-preserving étale neighbourhoods

`SchemeAndStackFoundations:SF.0/etale-neighbourhood` · definition · `TauCeti.Henselization.IsNeighbourhood`

For a commutative R and ideal I, an object is an existing CommAlgCat R algebra B satisfying Algebra.Etale R B and bijectivity of the canonical quotientMap R/I → B/(I.map(algebraMap R B)). Neighbourhood I is the existing full subcategory on this predicate; its morphisms are every actual R-algebra map. An arbitrary abstract isomorphism of quotients is not sufficient.

Proof/construction outline:

1. Instantiate Ideal.quotientMap with Ideal.le_comap_map; this fixes the reduction map, rather than choosing a residue-field equivalence.

2. Use ObjectProperty.FullSubcategory and its inclusion, retaining all algebra maps, including distinct parallel maps with identical reduction.

3. The identity R-algebra is an object. A localization R[1/x] is an object when x becomes a unit in R/I: it is already etale and its quotient localization is R/I.

4. Tensor and parallel-map operations are supplied by the following separate nodes. No scheme, etale, ideal, tensor or full-subcategory carrier is rebuilt.


Acceptance:

- Inverting 2 over (Z,(5)) qualifies; inverting 5 does not.

- The diagonal Z/5 → (Z/5)^2 is not bijective, so the two-sheeted etale product is rejected.


Use-derived API:

- `TauCeti.Henselization.isNeighbourhood_self` (constructor): The identity R-algebra is a neighbourhood of (R,I).

- `TauCeti.Henselization.isNeighbourhood_localization` (constructor): If x is a unit modulo I, the existing Localization.Away x is a neighbourhood.

- `TauCeti.Henselization.isNeighbourhood_tensor` (structure): The tensor product of two neighbourhoods over R is again a neighbourhood.


Discriminating typed tests in the suggested file:

- `TauCeti.Henselization.neighbourhood_identity` (degenerate): For every (R,I), the identity algebra R belongs to Neighbourhood I.

- `TauCeti.Henselization.neighbourhood_invert_two` (computation): For (Z,(5)), Z[1/2] satisfies the neighbourhood predicate.

- `TauCeti.Henselization.neighbourhood_reject_invert_five` (non-example): For (Z,(5)), Z[1/5] does not satisfy the predicate; its quotient is zero.

- `TauCeti.Henselization.neighbourhood_reject_two_sheets` (non-example): For (Z,(5)), the etale Z-algebra Z × Z is not residue-preserving: the canonical reduction is diagonal.


Uses:

- Stacks 15.12.1, category C: Its objects and actual morphisms are the diagram for the initial henselian pair.

- KEYDEF-algebraicgeometry/henselization; reviewed CMM21 item 046, Construction 3.18: The general pair construction, rather than completion or only a chosen local ring, is the shared consumer contract. The original CMM paper has not been freshly read in this checkpoint.


Prerequisites: `mathlib:CommAlgCat`, `mathlib:CommAlgCat.Hom`, `mathlib:Algebra.Etale`, `mathlib:Ideal.quotientMap`, `mathlib:Ideal.le_comap_map`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:CategoryTheory.ObjectProperty.ι`, `mathlib:Algebra.Etale.of_isLocalizationAway`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Residue-preserving étale neighbourhoods

### Tensor products give common targets

`SchemeAndStackFoundations:SF.0/tensor-neighbourhood` · lemma · `TauCeti.Henselization.isNeighbourhood_tensor`

If B and C are etale R-algebras with canonical quotient R/I, then B tensor_R C is etale over R and its canonical quotient by I is R/I. The standard tensor inclusions give a common target in Neighbourhood I.

Proof/construction outline:

1. Base change Algebra.Etale R C to B, then compose with Algebra.Etale R B.

2. Use the existing quotient/tensor equivalences to identify (B tensor_R C)/I with (B/IB) tensor_(R/I) (C/IC).

3. Use the two canonical reduction isomorphisms to identify this tensor product with R/I. Check the resulting map is the canonical quotientMap, not just some ring equivalence.

4. Lift both existing tensor algebra maps to the full subcategory.


Acceptance:

- For I=top all reductions are zero; the construction still applies.

- For two copies of R[1/2] at (Z,(5)), the common target is again canonically R[1/2].


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.comp`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `mathlib:Algebra.TensorProduct.tensorQuotientEquiv`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Tensor products give common targets

### Parallel algebra maps can be equalized

`SchemeAndStackFoundations:SF.0/parallel-equalization` · lemma · `TauCeti.Henselization.parallel_equalization`

For every f,g:B→C in Neighbourhood I there exist D in Neighbourhood I and h:C→D with h∘f=h∘g. No assumption that f=g, that maps are inclusions, or that the category is thin is allowed.

Proof/construction outline:

1. Form E=C tensor_(B,f,g) C, and its structure as a quotient of C tensor_R C. Then form D=E tensor_(C tensor_R C) C using multiplication into the last C.

2. Each B→C map is etale by the existing of_restrictScalars theorem. Base change and composition show R→D is etale.

3. Reduce this iterated tensor diagram modulo I. All object reductions are canonically R/I and all reduced morphisms are identities, so D/ID is canonically R/I.

4. The map C→D equalizes f,g by the tensor balancing equations. This is the actual source coequalizer construction; native scalar-tower transport remains a recorded implementation gap.


Acceptance:

- Over R=Z/6,I=(3), C=F3×F2×F2 admits distinct identity and sheet-swap endomorphisms. Projection to F3 equalizes them and remains a neighbourhood.

- The sheet-swap witness rejects a plan that replaces this category by a directed poset of embeddings.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/tensor-neighbourhood`, `mathlib:Algebra.Etale.of_restrictScalars`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.comp`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Parallel algebra maps can be equalized

### The neighbourhood category is filtered

`SchemeAndStackFoundations:SF.0/filtered-neighbourhoods` · theorem · `TauCeti.Henselization.neighbourhood_isFiltered`

Neighbourhood I is a nonempty filtered category in the existing CategoryTheory.IsFiltered sense: identity object, common targets, and equalization of every pair of parallel arrows.

Proof/construction outline:

1. Use the identity neighbourhood to give nonemptiness.

2. Use the tensor common-target node for the cocone_objs field.

3. Use parallel_equalization for cocone_maps. These are precisely the existing IsFiltered fields; no new filtered predicate is introduced.


Acceptance:

- The zero-ring boundary I=top still gives a nonempty category.

- The explicit Z/6 sheet-swap case uses the second filtering axiom, which directedness of objects alone cannot supply.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/tensor-neighbourhood`, `SchemeAndStackFoundations:SF.0/parallel-equalization`, `mathlib:CategoryTheory.IsFiltered`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The neighbourhood category is filtered

### A small model for neighbourhoods

`SchemeAndStackFoundations:SF.0/small-neighbourhoods` · lemma · `TauCeti.Henselization.neighbourhood_essentiallySmall`

For R:Type u, Neighbourhood I with carriers in Type u is EssentiallySmall at universe u. Thus SmallModel at universe u can index a colimit in CommAlgCat with carriers in Type u.

Proof/construction outline:

1. Etale implies finite presentation and hence finite type; the neighbourhood full subcategory embeds fully faithfully into the existing FGAlgCat R.

2. Use the existing FGAlgCat essential-smallness instance, whose proof represents finite-type algebras by finite-variable polynomial quotients.

3. Apply essentiallySmall_of_fully_faithful and use the existing equivalence equivSmallModel. Reindex the inclusion along its inverse. Generic smallness and skeleton construction remain baseline work, not new nodes.

4. This is a categorical implementation adapter to the source colimit. A universe-enlargement comparison for differently sized target carriers remains future work; common-universe statements below are meaningful.


Acceptance:

- The indexing objects may originally live in Type (u+1), but their SmallModel is in Type u.

- No class of all rings is used as a small colimit shape without a smallness proof.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:CategoryTheory.EssentiallySmall`, `mathlib:CategoryTheory.SmallModel`, `mathlib:CategoryTheory.equivSmallModel`, `mathlib:CategoryTheory.essentiallySmall_of_fully_faithful`, `mathlib:Algebra.FiniteType.exists_fgAlgCatSkeleton`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. A small model for neighbourhoods

### Henselization of a ring and ideal

`SchemeAndStackFoundations:key/henselization` · construction · `TauCeti.Henselization.algebra`

For arbitrary (R,I), define its henselization algebra H to be the actual colimit in CommAlgCat R of the neighbourhood inclusion, reindexed by the inverse of equivSmallModel. The unit η:R→H is its existing algebraMap; IH is I.map η. Desired henselian and universal properties are theorems about this colimit, not fields postulated in a record.

Proof/construction outline:

1. Use the actual neighbourhood full subcategory and its essential-smallness proof.

2. Define diagram I=(equivSmallModel (Neighbourhood I)).inverse followed by the full-subcategory inclusion.

3. Use existing colimits in CommAlgCat, available through its equivalence with Under R. Define H=colimit(diagram I), with the inherited commutative-ring and R-algebra structures.

4. Use the universal cocone to obtain all stage maps. The following nodes establish canonical residue preservation, Jacobson containment, simple-root lifting and the initial property.

5. Treat diagram, extended ideal, reduction map and stage maps as routine instantiations of existing categorical/algebra operations. They do not redefine ind-etaleness or assume H is the completion.


Acceptance:

- At I=0, H is canonically R; at I=top, H is the zero R-algebra.

- Already henselian pairs are fixed. For F5 at its zero maximal ideal the residue field remains F5, not its separable closure.


Use-derived API:

- `TauCeti.Henselization.stage` (constructor): For each object of the small neighbourhood diagram, the colimit cocone gives its R-algebra map to H.

- `TauCeti.Henselization.stage_naturality` (functoriality): For f:B→C in the small diagram, stage(C)∘diagram(f)=stage(B).

- `TauCeti.Henselization.quotient_bijective` (compatibility): The canonical R/I→H/IH is bijective, not merely abstractly isomorphic.

- `TauCeti.Henselization.henselian` (characterisation): The actual H,IH satisfy the existing Mathlib HenselianRing predicate.

- `TauCeti.Henselization.existsUnique_lift` (universal-property): Every pair map to a HenselianRing (S,J) extends uniquely to a ring map H→S.

- `TauCeti.Henselization.fixed_of_henselian` (compatibility): If (R,I) is already henselian, H is canonically isomorphic to R as an R-algebra.


Discriminating typed tests in the suggested file:

- `TauCeti.Henselization.henselization_zero_ideal` (degenerate): For every commutative R, H(R,0) is R as an R-algebra.

- `TauCeti.Henselization.henselization_unit_ideal` (degenerate): For every commutative R, H(R,R) is a subsingleton ring.

- `TauCeti.Henselization.henselization_fixed_pair` (compatibility): For every existing HenselianRing R I, H(R,I) is R as an R-algebra.

- `TauCeti.Henselization.henselization_ordinary_finite_field` (non-example): The ordinary henselization of (F5,0) is F5 as an F5-algebra; it does not enlarge the residue field as strict henselization does.


Uses:

- Stacks 15.12.1, initial henselian pair and colimit construction: The universal pair, residue comparison and explicit filtered etale presentation determine the construction.

- Reviewed KEYDEF-algebraicgeometry/henselization and CMM21 item 046, Construction 3.18 / Remark 3.19: General pair universality is required before the K-theory application. This imports the reviewed extraction as a consumer lead, not a fresh CMM source read.

- Reviewed BhattMathew23 item 005; Bresciani24 item 46; GroechenigWyssZiegler20-B item 127: p-henselian gluing, local Galois specialization and henselized local neighborhoods require later comparisons listed as gaps. None follows merely from naming H.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `SchemeAndStackFoundations:SF.0/filtered-neighbourhoods`, `SchemeAndStackFoundations:SF.0/small-neighbourhoods`, `mathlib:CategoryTheory.SmallModel`, `mathlib:CategoryTheory.equivSmallModel`, `mathlib:CategoryTheory.Limits.HasColimit`, `mathlib:commAlgCatEquivUnder`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. Henselization of a ring and ideal

### The canonical reduction is unchanged

`SchemeAndStackFoundations:SF.0/residue-comparison` · lemma · `TauCeti.Henselization.quotient_bijective`

The canonical quotientMap R/I→H/IH is bijective for the actual colimit H. No Noetherian, local, complete or nonzero hypothesis is imposed.

Proof/construction outline:

1. Each neighbourhood has canonical quotient R/I and each morphism reduces to the identity under that identification.

2. Reduction is scalar extension to R/I, hence a left adjoint and commutes with colimits. Express it using the existing quotient/tensor equivalence.

3. The resulting constant R/I diagram has a colimit R/I because the category is nonempty and filtered. Reindexing by the chosen equivalence does not change it.

4. Check this is exactly reducedMap I H on classes of R. The canonical quotient/colimit comparison is still an explicit implementation gap, rather than a second quotient carrier.


Acceptance:

- I=top gives an isomorphism of zero rings, not a contradiction.

- The finite-field example preserves its specified residue field.


Prerequisites: `SchemeAndStackFoundations:key/henselization`, `mathlib:Ideal.quotientMap`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The canonical reduction is unchanged

### The extended ideal is Jacobson

`SchemeAndStackFoundations:SF.0/jacobson-containment` · lemma · `TauCeti.Henselization.extended_le_jacobson`

IH is contained in the Jacobson radical of H for every (R,I), even if I is not contained in the Jacobson radical of R.

Proof/construction outline:

1. Use the filtered algebra colimit to descend each finite ideal sum and any multiplier to a common neighbourhood B. The descended element of IH lies in IB.

2. For such b∈IB and c∈B, x=1+bc is 1 modulo IB. Localizing B away from x is etale over R and its canonical reduction is R/I, so it is another neighbourhood.

3. Its stage map to H makes 1+bc a unit. Apply the already existing Ideal.mem_jacobson_bot element criterion in H.

4. The finite-data descent and equality-detection adapter for this CommAlgCat colimit must still be implemented; it is not assumed as an extra field of H.


Acceptance:

- For (Z,(5)), 1+5y becomes a unit in H for every y.

- For I=top this forces H to be the zero ring, in agreement with residue preservation.


Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/etale-neighbourhood`, `mathlib:Ideal.mem_jacobson_bot`, `mathlib:Algebra.Etale.of_isLocalizationAway`.

Source: STACKS-0EM7, Lemma 15.12.1 construction, adapted to the unit criterion. This elementary localization argument proves the Jacobson condition required by the pinned simple-root predicate.

### A simple root is realized in a neighbourhood

`SchemeAndStackFoundations:SF.0/simple-root-realization` · lemma · `TauCeti.Henselization.simple_root_lift`

For monic f in H[T] and a0∈H with f(a0)∈IH and derivative at a0 a unit modulo IH, there exists a root a of f in H with a−a0∈IH.

Proof/construction outline:

1. Use StandardEtalePair with g=f prime. Its defining equation has p1=1,p2=0,n=1, and its already-built ring is H[T,Y]/(f,Yf prime−1). The reduction map sends T to a0 modulo IH.

2. Descend the finitely many coefficients and equalities to one neighbourhood B. The same explicit standard-etale presentation over B avoids assuming an undecomposed general etale-descent theorem.

3. The residue section of this etale algebra gives a product decomposition R/I × C. Lift the idempotent (1,0) to some g in the algebra and localize at g, making the localized algebra another neighbourhood.

4. Map that neighbourhood to H. The image of T is the required root; the chosen residue section gives its exact congruence.

5. The etale section/product-splitting and finite-data descent adapters are outstanding leaves. This is an explicit adaptation of the source construction to the pinned simple-root predicate.


Acceptance:

- Over an already complete local ring, the result agrees with its existing HenselianRing root-lifting instance.

- A multiple root modulo I supplies no unit derivative and is not covered.


Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/residue-comparison`, `mathlib:StandardEtalePair`, `mathlib:StandardEtalePair.Ring`, `mathlib:StandardEtalePair.homEquiv`, `mathlib:Algebra.Etale.of_isLocalizationAway`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. A simple root is realized in a neighbourhood

### The colimit pair is henselian

`SchemeAndStackFoundations:SF.0/henselian-pair` · theorem · `TauCeti.Henselization.henselian`

H and IH satisfy the existing Mathlib HenselianRing H IH: Jacobson containment and the specified monic simple-root lifting property.

Proof/construction outline:

1. Install the existing predicate using extended_le_jacobson and simple_root_lift as its two fields.

2. Do not identify source monic-factorization henselianity with this predicate by reflexivity. The etale-section lifting theorem below supplies the needed source comparison for universality.


Acceptance:

- Works for non-Noetherian rings and the zero ring.

- Ordinary residue preservation remains distinct from strict henselization.


Prerequisites: `SchemeAndStackFoundations:SF.0/jacobson-containment`, `SchemeAndStackFoundations:SF.0/simple-root-realization`, `mathlib:HenselianRing`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The colimit pair is henselian

### Étale lifts with the same reduction are unique

`SchemeAndStackFoundations:SF.0/etale-lift-uniqueness` · lemma · `TauCeti.Henselization.etale_lift_unique`

If I⊆Jac(R), B is etale over R and two R-algebra maps B→R have equal reductions modulo I, they are equal. Existence is not asserted by this lemma.

Proof/construction outline:

1. The diagonal of the affine etale map splits B tensor_R B as B×C, compatibly with multiplication.

2. Apply the two maps to the tensor product. The complementary diagonal idempotent has image in I because the maps agree modulo I.

3. An idempotent in I⊆Jac(R) is zero: 1−e is a unit and e(1−e)=0. The two maps therefore factor through the diagonal and coincide.

4. The diagonal/product decomposition in the pinned etale API remains a named gap; no global uniqueness of arbitrary polynomial roots is assumed.


Acceptance:

- For B=R×R, the two projections have distinct reductions when R/I is nonzero.

- Without Jacobson containment take R=F2×F2, I=0×F2 and B=R×R. The maps f(x,y)=x and g(x,y)=(x first,y second) are distinct R-algebra maps and have equal reductions modulo I.


Prerequisites: `mathlib:Algebra.Etale`, `mathlib:Ideal.mem_jacobson_bot`.

Source: STACKS-0EM7, Lemma 15.12.1, uniqueness paragraph using Algebra 10.151.4 and More on Algebra 15.10.2. The diagonal-idempotent proof extends to two maps with the same fixed residue section.

### Simple-root henselianity lifts étale sections

`SchemeAndStackFoundations:SF.0/etale-section-comparison` · theorem · `TauCeti.Henselization.exists_etale_lift`

For existing HenselianRing R I and any etale R-algebra B, every ring map sigma:B→R/I extending the quotient map of R lifts to an R-algebra map B→R with that exact reduction. Combined with the preceding lemma, the lift is unique.

Proof/construction outline:

1. First obtain the source Gabber polynomial criterion from the pinned simple-root class: a monic polynomial reducing to T^n(T−1) has simple root 1 modulo I, so its lift belongs to 1+I.

2. Follow the read proof of Stacks 15.11.6, implication (5)⇒(2). The residue section splits B/IB as R/I×C.

3. Use the source integral-closure localization lemma 15.11.5 to replace the selected component by an integral algebra. Enlarge a finite R-subalgebra to include a lift b of the residue idempotent and generators of the selected localization.

4. Source 15.10.4 gives an annihilating polynomial for b reducing to T^n(T−1). Its lifted root in 1+I splits off the selected component; the integral etale residue-preserving component is R by source 15.10.3.

5. The precise Zariski Main/integral-closure localization and annihilating-polynomial leaves must be source-read at their own locators and decomposed against the baseline. They are open gaps, so this is not a closed proof or a silently postulated factorization equivalence.


Acceptance:

- Applied to B=R[1/x] with x a unit modulo I, the lift sends x inverse to its genuine inverse, since I⊆Jac(R).

- The section sigma is part of the input; arbitrary etale algebras need not admit a section.


Prerequisites: `SchemeAndStackFoundations:SF.0/etale-lift-uniqueness`, `mathlib:HenselianRing`, `mathlib:Algebra.Etale`.

Source: STACKS-09XD, Lemma 15.11.6, implication (5)⇒(2), with 15.11.5. Simple-root lifting gives Gabber roots; the displayed finite integral-closure argument gives etale section lifting.

### The initial henselian pair

`SchemeAndStackFoundations:SF.0/initial-henselian-pair` · theorem · `TauCeti.Henselization.existsUnique_lift`

Let S be commutative and (S,J) an existing HenselianRing. Every ring map f:R→S with I⊆f inverse J extends uniquely to a ring map g:H→S satisfying g∘η=f. Its map IH into J follows from generation by η(I). Targets are expressed in a common universe; no faithful-flatness hypothesis is imposed.

Proof/construction outline:

1. Base change each etale neighbourhood B along f to S tensor_R B. Its quotient by J is canonically S/J, using the pair-map condition and canonical B/IB=R/I.

2. Use exists_etale_lift with the inverse reduction section to obtain a map S tensor_R B→S, and restrict it to B.

3. Use etale_lift_unique to prove compatibility with every neighbourhood arrow, including parallel maps. These maps form a genuine cocone in CommAlgCat R, with the R-algebra structure on S determined by f.

4. Use the actual colimit universal property to construct g and its uniqueness. Quotient-map naturality implies the reduction of any candidate agrees with the chosen section at every stage.

5. The conclusion is conditional on the explicitly open section-comparison proof leaves; no axiom or arbitrary initial object record is substituted for the colimit.


Acceptance:

- For f=id on an already henselian pair, the unique extension is the inverse of η.

- For I=top a pair map to (S,J) forces J=top; a henselian target then is zero, matching the zero henselization.


Prerequisites: `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `SchemeAndStackFoundations:SF.0/residue-comparison`, `SchemeAndStackFoundations:SF.0/etale-section-comparison`, `SchemeAndStackFoundations:SF.0/etale-lift-uniqueness`, `mathlib:Algebra.Etale.baseChange`, `mathlib:CategoryTheory.Limits.HasColimit`, `mathlib:Algebra.TensorProduct.quotIdealMapEquivTensorQuot`.

Source: STACKS-0EM7, Lemma 15.12.1, indicated construction/proof paragraph. The initial henselian pair

### Already henselian pairs are fixed

`SchemeAndStackFoundations:SF.0/fixed-henselian-pair` · lemma · `TauCeti.Henselization.fixed_of_henselian`

If (R,I) satisfies the existing HenselianRing predicate, the colimit H is canonically R as an R-algebra, with the equivalence inverse to η.

Proof/construction outline:

1. Apply existsUnique_lift to f=id_R to obtain an R-algebra retraction H→R.

2. Apply uniqueness to the two endomorphisms of H extending η: identity and η followed by the retraction. The henselian theorem supplies the target instance.

3. Construct the actual R-algebra equivalence from the mutually inverse maps. This is not a completeness assertion.


Acceptance:

- Every ring at the zero ideal is fixed.

- Any already henselian but noncomplete ring is fixed; being an adic completion is not the definition. The concrete noncomplete example still needs a primary-source and cardinality comparison, listed in the gaps.


Prerequisites: `SchemeAndStackFoundations:SF.0/initial-henselian-pair`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `mathlib:HenselianRing`.

Source: STACKS-0EM7, Lemma 15.12.1, initial property. Idempotence follows from the initial property and the proved henselian target.

### Ordinary local henselization is local

`SchemeAndStackFoundations:SF.0/ordinary-local-henselization` · lemma · `TauCeti.Henselization.local_henselization`

If R is local with maximal ideal m, H(R,m) is local. The canonical quotient H/mH=R/m is a field and mH⊆Jac(H), so mH is its unique maximal ideal. No separable closure of the residue field is chosen.

Proof/construction outline:

1. Use the canonical quotient comparison to show mH is a maximal ideal.

2. Use extended_le_jacobson to show it is contained in every maximal ideal; maximality forces every maximal ideal to equal mH.

3. Instantiate the existing IsLocalRing carrier predicate. The typed residue-field equivalence and HenselianLocalRing adapter remain future API work.


Acceptance:

- For a field K, m=0 and ordinary H=K.

- Strict henselization, which enlarges the residue field to a separable closure, remains with ModularCurves 4D and is not re-planned here.


Prerequisites: `SchemeAndStackFoundations:SF.0/residue-comparison`, `SchemeAndStackFoundations:SF.0/jacobson-containment`, `SchemeAndStackFoundations:SF.0/fixed-henselian-pair`.

Source: STACKS-0EM7, Lemma 15.12.3, whole proof. The ordinary local case follows from the maximal residue quotient and Jacobson containment.

## Finite nonthin neighbourhood witness

Take R=Z/6 and I=(3). Let B=F3×F2×F2 with R→B given by the three residue maps. Its I-image is 0×F2×F2, so B/IB=F3 canonically. The R-algebra is etale: R=F3×F2 and B adds a second disjoint copy of the F2 component. Identity and the swap of the two F2 factors are distinct R-algebra maps, both inducing the identity on B/IB. Projection h:B→F3 equalizes them, and F3 is another neighbourhood. This directly tests the parallel-map axiom. Finite ring/ideal/map checks can verify the arithmetic; they do not prove etaleness or the general source theorem.

## Stage worklists and reserved keys

### SchemeAndStackFoundations:SF.0 — partial

- Complete the fifteen-node henselization strand, including the explicitly missing finite-data/quotient-colimit and etale-section comparison proof adapters.

- Plan the reserved excellent-schemes key. Reuse existing schemes/morphisms, smooth/etale/proper/flat predicates, QCoh and local algebra. Source-decompose relative Spec, general Proj/canonical comparison without unrestricted O(1) or properness claims.

- Retain all SF.0 routed source obligations listed in sourceWorklist, including perfect geometry, coherent extension, standard coordinates and finite-presentation spreading. Weil restriction uses the confirmed MC0F → RG2.0a → R09.3 import, not a duplicate.

### SchemeAndStackFoundations:SF.1 — not_read

- Construct general algebraic spaces/stacks beyond the upstream abstract stack predicate and the exact MC0E/SR2 descent inputs; do not duplicate those owners.

- Plan reserved galois-gerbs with actual groupoid/Galois actions and crossed-module/torsor comparisons. Source-read quotient/root stacks, perfect-site groupoids and geometric descent routes in sourceWorklist.

### SchemeAndStackFoundations:SF.2 — not_read

- Plan reserved scheme-brauer, coherent-duality and equivariant-sheaf-cohomology, with their canonical comparison and scope-qualified APIs/tests.

- Split early site/coefficients from later comparisons: import EDC/CPC and EtaleDualityAbsolutePurityPartII. Preserve coherent-curve SR2 and general coherent-duality distinction; do not create a second six-operations or absolute-purity theory.

- Retain all site/localization/support/compact support/base-change/Cousin/pro-etale/Nisnevich routes with coefficient distinctions. Henselian points require the still-open affine strand and additional site geometry.

### SchemeAndStackFoundations:SF.3 — not_read

- Import upstream AlgebraicCurves/JacobianChallenge function-field divisors, genus and RR; prove scheme/Picard/line-bundle/coherent-duality comparisons. Do not infer arbitrary-vector-bundle duality from function-field RR.

- Keep NS/Picard-number theory with A2; retain rational-divisor versus rational-class/Brauer-obstruction and family/Jacobian routes.

### SchemeAndStackFoundations:SF.4 — not_read

- Formal geometry, deformation/lifting, algebraization, non-Noetherian modifications, strict transforms and source-qualified alterations remain unread at their primary locators.

- Import NeronModelsAndSemistableAbelianVarieties R11.1/R11.3 and StableReductionLayer7/8/9. Resolve the conflicting confirmed alteration-owner recommendations before adding any alteration dependency.

### SchemeAndStackFoundations:SF.5 — not_read

- Build on the existing AlgebraicCycle carrier; construct rational equivalence/Chow, pushforward, flat/lci pullback, refined Gysin, intersection/Chern/RR in their actual domains.

- Import arithmetic-surface intersections from StableReductionLayer4. Retain SF.3/R09.1/coherent-duality inputs, isolated-intersection Bezout inequalities, DM-stack and positivity/Keel routes without requiring unrelated reduction theorems.

### SchemeAndStackFoundations:SF.6 — not_read

- This is a consumer handoff/process layer according to AUDIT-01: do not invent mathematical nodes for integration itself.

- Record typed imports and coefficient/comparison contracts from the actual suppliers, including ComplexComparison C5, once the mathematical nodes exist. All arithmetic handoffs in sourceWorklist remain unfinished.


Reserved IDs:

- `SchemeAndStackFoundations:key/excellent-schemes`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/scheme-brauer`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/coherent-duality`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/henselization`: planned_with_gaps. Fifteen-node focused strand; sample API comparisons and proof leaves remain open.

- `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.

- `SchemeAndStackFoundations:key/galois-gerbs`: unplanned. Exact reserved ID retained as unfinished work, not falsely supplied by a placeholder node.


## Open proof and ownership gaps

- **Filtered algebra colimit finite-data and reduction adapters**: Inspect the pinned forgetful-functor filtered-colimit construction and its element/equality descent API; prove finite coefficients and ideal sums descend, and identify the canonical quotient colimit using scalar-extension adjunction. No custom colimit ring is planned. Generic existing categorical machinery must be imported where available. Needed by: SchemeAndStackFoundations:SF.0/residue-comparison, SchemeAndStackFoundations:SF.0/jacobson-containment, SchemeAndStackFoundations:SF.0/simple-root-realization.

- **Actual scalar towers in the parallel-map coequalizer**: Build the source iterated tensor with both B-algebra structures f and g, the map from C tensor_R C and multiplication map, and prove all AlgHom/tower coherences and canonical residue identities. The native existence signature does not constitute that construction. Needed by: SchemeAndStackFoundations:SF.0/parallel-equalization.

- **Etale diagonal and residue-section splitting**: Inspect the pinned etale/unramified diagonal and idempotent APIs; otherwise source-decompose the affine etale product splitting used by Stacks 10.143.9 and 10.151.4. A residue section must select the actual R/I component, not an arbitrary point. Needed by: SchemeAndStackFoundations:SF.0/simple-root-realization, SchemeAndStackFoundations:SF.0/etale-lift-uniqueness, SchemeAndStackFoundations:SF.0/etale-section-comparison.

- **Simple-root versus source etale-section criterion**: Directly read and decompose source 15.10.3, 15.10.4 and all Zariski Main inputs in 15.11.5 against the pinned libraries. The full 15.11.6 proof was read, but these recursively cited leaves have not all been independently read. The forward Gabber-root argument is explicit; no factorization comparison or source proof closure is asserted. Needed by: SchemeAndStackFoundations:SF.0/etale-section-comparison, SchemeAndStackFoundations:SF.0/initial-henselian-pair, SchemeAndStackFoundations:SF.0/fixed-henselian-pair.

- **Remaining henselization sample API and concrete comparisons**: Plan pair-map functoriality/composition, ind-etale presentation independence/universe transport, ideal-power quotient comparisons, flatness with an existing generic filtered-flat adapter, local faithful flatness, Noetherianity, completion isomorphism (no Noetherian hypothesis for that isomorphism alone), radical invariance, filtered-pair-colimit preservation and integral base change/quotient compatibility. Read the exact baseline completion and integrality statements first. Include a source-verified noncomplete henselian example, a failed unrestricted base change, and the actual local residue/HenselianLocalRing adapters. General faithful flatness is false: I=top gives the zero ring. Needed by: SchemeAndStackFoundations:key/henselization.

- **Five reserved definitions are still unplanned**: The exact reserved ids key/excellent-schemes, key/scheme-brauer, key/coherent-duality, key/equivariant-sheaf-cohomology and key/galois-gerbs are not nodes in this partial packet. Freshly read each complete key brief and all relevant primary locators, then supply actual carriers, APIs and discriminating examples. Do not certify this issue complete. Needed by: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2.

- **Conflicting confirmed alteration ownership directions**: RT-AREA-algebraicgeometry/16 recommends SF.4→L5, while RT-AREA-etale/21 recommends L5:alterations→SF.4. Both findings are confirmed in their inputs. This checkpoint imports neither direction; a coherent accepted ownership decision is needed before this strand can be planned. Other confirmed findings remain the explicit unimplemented matrix below. Needed by: SchemeAndStackFoundations:SF.4.

- **Seven-stage and all routed-source closure**: Only one affine henselization strand is developed. All stage remaining lists, all sourceWorklist paper routes, the original roadmap references and every other reserved key must be retained. SF.6 is process/handoff work. No stage, paper or mathematical implementation is claimed closed. Needed by: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5, SchemeAndStackFoundations:SF.6.


## Confirmed red-team findings retained

Every listed finding remains unimplemented in this first checkpoint. These are imported verifier-confirmed inputs, not this worker’s independent review. No integrated link is changed.

| Finding | Stage | Required boundary |
|---|---|---|

| RT-AREA-algebraicgeometry/1 | SchemeAndStackFoundations:SF.1 | General spaces/stacks belong here; R09 receives the exported interface. |

| RT-AREA-algebraicgeometry/8 | SchemeAndStackFoundations:SF.3 | NS and Picard number remain with A2, not duplicate generic SF.3 theory. |

| RT-AREA-algebraicgeometry/11 | SchemeAndStackFoundations:SF.0 | Weil restriction follows MC0F → RG2.0a → R09.3; import that owner. |

| RT-AREA-algebraicgeometry/15 | SchemeAndStackFoundations:SF.5 | Use genuine SF.3/R09.1/coherent-duality prerequisites and remove spurious reduction paths through the eventual reviewed link changes. |

| RT-AREA-algebraicgeometry/16 | SchemeAndStackFoundations:SF.4 | Recommends SF.4 as single alteration supplier to L5; conflicts with etale/21. |

| RT-AREA-algebraicgeometry/17 | SchemeAndStackFoundations:SF.4 | Use pointed-curve moduli R09.4/R09.5 as alteration inputs, not an SR object theorem. |

| RT-AREA-algebraicgeometry/18 | SchemeAndStackFoundations:SF.2 | General coherent duality extends the curve-scoped SR2 contract. |

| RT-AREA-algebraicgeometry/31 | SchemeAndStackFoundations:SF.6 | Import ComplexComparison C5 for the arithmetic cohomology comparison. |

| RT-AREA-etale/2 | SchemeAndStackFoundations:SF.2 | Absolute purity belongs to EtaleDualityAbsolutePurityPartII; split early SF.2 site foundation from late comparison to prevent a cycle. |

| RT-AREA-etale/21 | SchemeAndStackFoundations:SF.4 | Recommends new L5:alterations as supplier to SF.4; conflicts with algebraicgeometry/16. |

| RT-AREA-ktheory-2/38 | SchemeAndStackFoundations:SF.2 | General Nisnevich site and henselian point foundation must be supplied here. |

| RT-AREA-geomlanglands/15 | SchemeAndStackFoundations:SF.5 | Single positivity/Keel supplier here; GS consumes the result. |


## Routed papers still requiring full reading

The exact issue routes below are preserved as a worklist. Each primary paper and its complete extraction require fresh reading; a shortened brief is not proof evidence. None is discharged by the affine construction.

- Kings–Sprang, "Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation", Annals of Mathematics 202 (2025), no. 1 (https://annals.math.princeton.edu/2025/202-1/p01), for SchemeAndStackFoundations:SF.2: SF.2 owns sheaf cohomology, localization and compact support. The paper uses the Γ-equivariant version of coherent cohomology (Grothendieck, Tôhoku, Chapter V) with its spectral sequences, cohomology with supports and its localization sequence, l … (shortened)

- Lawrence–Sawin, "The Shafarevich conjecture for hypersurfaces in abelian varieties", Annals of Mathematics 202 (2025), no. 3 (https://annals.math.princeton.edu/2025/202-3/p01), for SchemeAndStackFoundations:SF.0: SF.0 owns schemes and morphisms with their named properties and is the most foundational layer that could own the Weil restriction of scalars along a finite étale extension, with its universal property and the resulting bijection on integral points. Neither library has it and no layer … (shortened)

- Kisin–Zhou, "Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties", Annals of Mathematics 202 (2025), no. 3 (https://annals.math.princeton.edu/2025/202-3/p03), for SchemeAndStackFoundations:SF.0: SF.0 owns smooth and etale scheme morphisms and their local coordinate geometry. Add the precise standard-smooth coordinate and boundary/component lemmas needed by the local curve proof; the reusable curve selection remains in the existing finite-field curve continuation. (f … (shortened)

- Stefan Schröer, "There is no Enriques surface over the integers", Annals of Mathematics 197 (2023), no. 1 (https://annals.math.princeton.edu/2023/197-1/p01), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: A concrete henselian section-lifting consequence for smooth separated algebraic spaces using a residue-preserving étale scheme chart. Import smooth algebra Hensel lifting, not the p-adic polynomial lemma as a geometric substitute. SF.2 owns … (shortened)

- Hongjie Yu, "Comptage des systèmes locaux ℓ-adiques sur une courbe", Annals of Mathematics 197 (2023), no. 2 (https://annals.math.princeton.edu/2023/197-2/p01), for SchemeAndStackFoundations:SF.3: Import coherent Serre duality through SF.3 and its upstream JacobianChallenge Layer B supplier. The function-field Riemann–Roch theorem does not establish duality for arbitrary vector bundles on the scheme. No new Serre-duality programme is proposed. (from the extraction of Hongjie Yu, "Comptage des … (shortened)

- Wei Zhang, "Weil representation and Arithmetic Fundamental Lemma", Annals of Mathematics 193 (2021), no. 3 (https://annals.math.princeton.edu/2021/193-3/p05), for SchemeAndStackFoundations:SF.5: Use the shared Chow/intersection owner for actual proper pushforward, lci operations and rational equivalence; neither special-cycle proposal constructs a rival generic Chow theory. (from the extraction of Wei Zhang, "Weil representation and Arithmetic Fundamental Lemma", Annals of Mathematics 193 (202 … (shortened)

- Dimitrov–Gao–Habegger, "Uniformity in Mordell–Lang for curves", Annals of Mathematics 194 (2021), no. 1 (https://annals.math.princeton.edu/2021/194-1/p04), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns general scheme theory and SF.5 intersection theory. The proofs need EGA IV 21.4.13 (line bundles trivial on the generic fibre), Cartier/Weil divisor facts on regular and normal schemes (Görtz–Wedhorn 11.38–11.49), étale quasi-sections (EGA IV 17.16.3), Siu's bigne … (shortened)

- Chao Li–Yifeng Liu, "Chow groups and L-derivatives of automorphic motives for unitary groups", Annals of Mathematics 194 (2021), no. 3 (https://annals.math.princeton.edu/2021/194-3/p06), for SchemeAndStackFoundations:SF.2: SF.2 owns étale cohomology with localization and proper and smooth base change. PAPER-CESNAVICIUS-19 routes its prime-to-residue-characteristic absolute-purity input there, and its accepted review names SF.2 the owner of local and global purity; SF.2's own text does not name … (shortened)

- Jean-Marc Couveignes, "Enumerating number fields", Annals of Mathematics 192 (2020), no. 2 (https://annals.math.princeton.edu/2020/192-2/p04), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns the concrete localized-Jacobian presentation/component comparison, importing its already-built abstract etale APIs. SF.5 owns the isolated-intersection Bezout inequality (not an equality that assumes proper intersection). Both are generic algebraic geometry inputs; the arithme … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions (II)", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p02), for SchemeAndStackFoundations:SF.3: The paper consumes the scheme/line-bundle, cohomology/base-change and Picard comparison contracts, not merely the existing function-field Riemann–Roch statement. SF.3 integrates the upstream AlgebraicCurves/JacobianChallenge owners. No upstream roadmap is replanned; the tame Hurwitz input is … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions (II)", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.5: SF.1 owns quotient/root-stack geometry and infinitesimal fibres; use its existing Bresciani24 root-stack source lead rather than rebuilding roots inside geometric class field theory. SF.5 owns rational DM-stack Chow/refined-Gysin, support-filtered coherent K0 … (shortened)

- Gao–Habegger, "Heights in families of abelian varieties and the Geometric Bogomolov Conjecture", Annals of Mathematics 189 (2019), no. 2 (https://annals.math.princeton.edu/2019/189-2/p03), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns general scheme theory and SF.5 intersection theory and degrees. The paper proves a long-intersection Bézout bound independent of the number of intersected varieties (Proposition 6.7, with Faltings' Lemma 6.8), and uses Bertini thro … (shortened)

- Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed characteristic", Annals of Mathematics 185 (2017), no. 2 (https://annals.math.princeton.edu/2017/185-2/p02), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: General perfect spaces, pfp models, Frobenius approximation and perfect morphism properties belong to the common foundation, already used by BS17 and HE21. GS consumes them. (from the extraction of Xinwen Zhu, "Affine Grassmannians and the geometric Sat … (shortened)

- Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed characteristic", Annals of Mathematics 185 (2017), no. 2 (https://annals.math.princeton.edu/2017/185-2/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: Own perfect-site torsors, groupoids and the revised free-action quotient theorem once, including A.30–A.31 flatness. The fpqc site is not a new h/v site. (from the extraction of Xinwen Zhu, "Affine Grassmannians and the geometric Satake in mixed charact … (shortened)

- Zhiwei Yun–Wei Zhang, "Shtukas and the Taylor expansion of L-functions", Annals of Mathematics 186 (2017), no. 3 (https://annals.math.princeton.edu/2017/186-3/p02), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.5: SF.5 constructs Chow groups, proper pushforward, flat/lci pullback, refined Gysin maps, intersection products and source-scoped Grothendieck–Riemann–Roch. Appendix A of this paper is general intersection theory, with no shtukas in it … (shortened)

- Boxer–Pilloni, "Higher Hida theory for Siegel modular forms", Inventiones Mathematicae (2026) (https://link.springer.com/journal/222/volumes-and-issues/244-1), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2: SF.0 ('Construct schemes, quasi-coherent modules ...'; 'State flat ... hypotheses as properties of named morphisms') receives two statements: every coherent sheaf on an open subscheme of a noetherian scheme extends to a coherent sheaf, an … (shortened)

- Guo–Reinecke, "A prismatic approach to crystalline local systems", Inventiones Mathematicae (2024) (https://link.springer.com/journal/222/volumes-and-issues/236-1), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: Coherent Grothendieck–Serre duality for smooth proper formal schemes extends SF.3's Serre duality, and Bhatt's algebraization for points of qcqs algebraic spaces on products belongs to SF.1's algebraic spaces. (from the extraction of Guo–Reinecke, "A prismatic appr … (shortened)

- Qian, "Potential automorphy for GL_n", Inventiones Mathematicae (2023) (https://link.springer.com/journal/222/volumes-and-issues/231-3), for SchemeAndStackFoundations:SF.4: SF.4 plans 'formal schemes, algebraization, semistable reduction and alterations … a model records its base, generic fiber and allowable base extension'. It owns the general mixed-characteristic toroidal semistable reduction theorem that the companion preprint applies (item 142, Kempf–Knudsen–Mumford–Saint-Donat, Chapters I … (shortened)

- Xie–Yuan, "Geometric Bogomolov conjecture in arbitrary characteristics", Inventiones Mathematicae (2022) (https://link.springer.com/journal/222/volumes-and-issues/229-2), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5: §2 is intersection theory on smooth projective varieties, consuming the Chow groups and intersection products SF.5 plans: Proposition 2.2 (Bertini-type choice of hypersurfaces through V), Lemma 2.3, the proper part of an inters … (shortened)

- Benoist–Wittenberg, "On the integral Hodge conjecture for real varieties, I", Inventiones Mathematicae (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: SF.2 owns scheme sites, cohomology, localization and comparisons. Add real étale comparison and the concrete cohomology-with-supports/Cousin/coniveau package as a named suffix, importing M.5 norm-residue and the shared equivariant topology. S.4 and M.6/M.6a are K-theory spectral sequences, and Dittmann … (shortened)

- Benoist–Wittenberg, "On the integral Hodge conjecture for real varieties, I", Inventiones Mathematicae (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.5: SF.5 owns Chow groups, proper cycle operations and Riemann–Roch. Euler-characteristic intermediate indices and their devissage/degree congruences are reusable consequences inside that direction. Reuse the pinned AlgebraicCycle carrier; do not duplicate intersections in MC.0 or the K-theory roadmap. (fr … (shortened)

- Calegari–Geraghty, "Modularity lifting beyond the Taylor-Wiles method", Inventiones Mathematicae (2018) (https://math.uchicago.edu/~fcale/research.html), for SchemeAndStackFoundations:SF.2: The flat Kummer sequence 0 → O_F^×/O_F^{×p} → H¹_fppf(O_F, μ_p) → Cl(F)[p] → 0, which computes the dual Selmer group of §8.2, belongs to the owner of fppf cohomology on schemes. Review: accepted. (from the extraction of Calegari–Geraghty, "Modularity lifting beyond the Taylor-Wiles method", Inventiones Math … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: Own general perfection, pfp models, morphism properties, pushouts and formal blowup geometry once. GS0 consumes these common results; it does not create a private theory of perfect schemes. (from the extraction of Bhatt–Scholze, "Projectivity of the Witt vector affine Gras … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: Reuse the Picard-groupoid owner found in PAPER-WITASZEK-22. Add the abstract Picard interface needed for coherent determinant descent, retaining the pinned invertible-sheaf category as its carrier. (from the extraction of Bhatt–Scholze, "Projectivity of the Witt vector aff … (shortened)

- Bhatt–Scholze, "Projectivity of the Witt vector affine Grassmannian", Inventiones Mathematicae (2017) (https://people.mpim-bonn.mpg.de/scholze/papers.html), for SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5: Supply general positivity, finite Frobenius power descent and Keel’s criterion from the existing divisor/intersection/birational foundations. Keep original Artin contraction and gluing as explicit source gates. (from the extraction of Bhatt– … (shortened)

- Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: The scheme-theoretic Hochschild–Serre edge sequence and naturality specialize its sites/cohomology scope; group-only Hochschild–Serre is a different supplier. Include the natural comparison of splitting-variety and fundamental-group Hochschild–Serre edge maps, not just an abstract Brauer-group isomorphism. … (shortened)

- Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.4: Characteristic-zero smooth compactification is within the existing birational-geometry stage; preserve its characteristic restriction. (from the extraction of Harpaz–Wittenberg, "The Massey vanishing conjecture for number fields", Duke Mathematical Journal (2023), PAPER-HARPAZ-WITTENBERG-23: research/bluepr … (shortened)

- Pilloni, "Higher coherent cohomology and p-adic modular forms of singular weights", Duke Mathematical Journal (2020) (https://projecteuclid.org/journals/duke-mathematical-journal/volume-169/issue-9/Higher-coherent-cohomology-and-p--adic-modular-forms-of/10.1215/00127094-2019-0075.full), for SchemeAndStackFoundations:SF.2: SF.2 ('construct sheaf cohomology, localization') gets the depth statement of SGA 2, Exposé III, §3, which the proof of Lemma 14.9.2 (p. 103) cites: if F is locally free on a … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.1: General scheme-torus descent, represented homogeneous quotient, torsor lifting and finite-type group reductions belong to the existing descent/quotient layer. Import field tori/characters from upstream ReductiveGroups Layer4, affine Weil restriction from RG2.0a, and finite locally free Cartier duality from the pinned Tau Ceti lib … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.2: General scheme-cohomology supplier: sites, Kummer and étale/fppf comparison, finite-flat and torus cohomological descent, completion and perfectoid cohomology preparation, supports, support-local-global and strict support stalks, and Appendix A field cohomology. The purity consumer imports these constructions; its vanishing, coni … (shortened)

- Česnavičius, "Purity for the Brauer group", Duke Mathematical Journal (2019) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.4: General Henselian approximation, projective presentation groupoids, iterated completion and formal-algebraization supplier, including SGA 2 VIII finiteness/depth and IX formal comparison/algebraization. Import pinned Artin–Rees/Taylor/naive cotangent foundations and DD.0 low comparison. The exact smooth-algebra lifting theorem is … (shortened)

- van Hoften, "Mod p points on Shimura varieties of parahoric level", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3: The foundational roadmap owns general perfection, smoothness, descent, quotient stacks and ample-line criteria. GS0 consumes its perfect-space interface and specializes it to Witt f … (shortened)

- Canning–Larson–Payne, "Extensions of tautological rings and motivic structures in the cohomology of the moduli spaces of stable curves", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.5: SF.5 constructs Chow groups, rational equivalence, proper pushforward, flat and lci pullback, refined Gysin maps, Chern classes and intersection products. Two items of the extr … (shortened)

- Canning–Larson–Payne, "Extensions of tautological rings and motivic structures in the cohomology of the moduli spaces of stable curves", Forum of Mathematics, Pi (2024) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/F8892C4B042F5A303D4C4571F67D5E34?pageNum=2), for SchemeAndStackFoundations:SF.2: SF.2 owns sites and cohomology with compact support and duality, so the Poincaré duality this paper uses belongs there — but in the generality the moduli application requires, … (shortened)

- Bhatt–Mathew, "Syntomic complexes and p-adic étale Tate twists", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.0: Néron–Popescu desingularization is routed to SF.0 by the Česnavičius extraction; this paper uses the same statement for regular F_p-algebras. (from the extraction of Bhatt–Mathew, "Syntomic complexes and p-adic étale Tate twists", Forum of Mathematics, Pi (2 … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.0: Divisorial/reflexive extension and absolute-integral-closure indexing refine the foundational scheme layer. Reuse built ring/scheme carriers; do not put a duplicate general algebra package inside the MMP extension. … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.4: Formal lifting, coherent algebraization adapters, obstruction theory and local Q-Cartier deformation lie in the existing deformation/algebraization direction. Import formal existence from Adic F0 rather than rebuild … (shortened)

- Hacon–Witaszek, "On the relative minimal model program for fourfolds in positive and mixed characteristic", Forum of Mathematics, Pi (2023) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/90D8AB5A81D5A4AA0B008C3B0CFC8878), for SchemeAndStackFoundations:SF.5: Constancy of fibre intersection numbers belongs to the general intersection-theory supplier, not to a fourfold-specific duplicate. (from the extraction of Hacon–Witaszek, "On the relative minimal model program for f … (shortened)

- He, "Cordial elements and dimensions of affine Deligne–Lusztig varieties", Forum of Mathematics, Pi (2021) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/A0F34FDF4105CBC68BD961812700E85E), for SchemeAndStackFoundations:SF.0: The finite-type scheme dimension lemma is general scheme-morphism infrastructure. Its application to the ind/perfect correspondences remains G2. (from the extraction of He, "Cordial elements and dimensions of affine Deligne–Lusztig varieties", Foru … (shortened)

- Le–Le Hung–Levin–Morra, "Serre weights and Breuil's lattice conjecture in dimension three", Forum of Mathematics, Pi (2020) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/85BC64C1D182D4DE7F91091602ED00B0), for SchemeAndStackFoundations:SF.0: The same coherent-Hartogs owner already used by PAPER-GILLE-PARIMALA-26/130–135 and PAPER-CESNAVICIUS-19/hartogs supplies arbitrary coherent full-support MCM extension and embedded ideal closure. Import the existing affine module e … (shortened)

- Le–Le Hung–Levin–Morra, "Serre weights and Breuil's lattice conjecture in dimension three", Forum of Mathematics, Pi (2020) (https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/85BC64C1D182D4DE7F91091602ED00B0), for SchemeAndStackFoundations:SF.2: Own the comparison from existing Ext-colimit local cohomology to the localization exact sequence and canonical flat base change for sections/ideal closures. This extends the coherent direct-image interface already used by PAPER-BEN … (shortened)

- Merkurjev–Scavia, "Galois representations modulo p that do not lift modulo p^2", Journal of the American Mathematical Society (2026) (https://www.math.univ-paris13.fr/~scavia/), for SchemeAndStackFoundations:SF.1: The generic criterion needs the existing quotient/descent owner: a free open of a linear representation has a finite étale constant-group torsor quotient. This is not a new quotient-stack roadmap. (from the extraction of Merkurjev–Scavia, "Galois representations modulo p that do not … (shortened)

- Merkurjev–Scavia, "Galois representations modulo p that do not lift modulo p^2", Journal of the American Mathematical Society (2026) (https://www.math.univ-paris13.fr/~scavia/), for SchemeAndStackFoundations:SF.2: The generic criterion adds a concrete source for étale cohomology continuity and the compatible torsor edge maps within the existing sites/cohomology layer. Import the general Hochschild–Serre construction from ArithmeticGaloisDuality. (from the extraction of Merkurjev–Scavia, "Galoi … (shortened)

- Clausen–Mathew–Morrow, "K-theory and topological cyclic homology of henselian pairs", Journal of the American Mathematical Society (2021) (https://math.uchicago.edu/~amathew/), for SchemeAndStackFoundations:SF.0: The equivalent characterizations of henselian pairs, henselization of pairs, Elkik's theorem and Néron–Popescu are standard Stacks-project commutative algebra; SF.0 already receives Néron–Popescu from the Česnavičius extraction, and these belong with it. (from the extraction of Clause … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.2: Étale G_m cohomology, purity, residue comparisons and Leray inputs belong to the shared scheme-cohomology foundation. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical So … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.3: Boundary divisors and the Picard localization sequence refine the common divisor/Picard API. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020), PAPER-HARPA … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.4: Characteristic-zero compatible compactification and resolution are explicit birational-geometry inputs; do not assume positive-characteristic resolution. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Jou … (shortened)

- Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Journal of the American Mathematical Society (2020) (https://www.math.univ-paris13.fr/~wittenberg/), for SchemeAndStackFoundations:SF.5: Import rational equivalence, CH₀, degree and the Chow push/pull projection formula once. The existing AlgebraicCycle carrier and partial map are reused. (from the extraction of Harpaz–Wittenberg, "Zéro-cycles sur les espaces homogènes et problème de Galois inverse", Jour … (shortened)

- Kisin, "Mod p points on Shimura varieties of abelian type", Journal of the American Mathematical Society (2017) (https://people.math.harvard.edu/~kisin/preprints.html), for SchemeAndStackFoundations:SF.1: SF.1 owns gerbs, descent and the reusable quotient-category/torsor interfaces. Add strict monoidal crossed modules and invertible two-fiber adapters to its existing categorical foundations; preserve ordinary Mathlib carriers. (from the extraction of Kisin, "Mod p points on Shimura varieties o … (shortened)

- Bhargava–Gross–Wang, "A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension", Journal of the American Mathematical Society (2017) (https://collaborate.princeton.edu/en/publications/a-positive-proportion-of-locally-soluble-hyperelliptic-curves-ove/), for SchemeAndStackFoundations:SF.3: SF.3 owns divisors, line bundles and Picard objects. The comparison of rational divisor classes with rational divisors, via Pic_{C/K}(K)/Pic(C/K) ↪ Br(K′ … (shortened)

- Gao–Ge–Kühne, "The Uniform Mordell–Lang Conjecture", Publications Mathématiques de l'IHÉS (2026) (https://pmihes.centre-mersenne.org/volume/PMIHES_2026__143_/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5: SF.0 owns properties of morphisms and SF.5 owns intersection theory and degrees. The paper uses EGA IV facts (openness of the geometrically integral locus in flat proper families, openness of flat morphisms, irreducibility of fibre powers with geometrically irreducible … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.0: Absolute integral closures, reflexive divisor sheaves and base-scope adapters refine the existing scheme foundations. Reuse scheme/module and normality carriers rather than hiding duplicates in the MMP extension. (from the extraction of Bh … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.4: Named three-dimensional pair resolution and Saito's log-smooth extension refine the existing models/alterations direction. Import curve stable reduction and keep the nowhere-dense/projective/ample-exceptional restrictions explicit. (from t … (shortened)

- Bhatt et al., "Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic", Publications Mathématiques de l'IHÉS (2023) (https://pmihes.centre-mersenne.org/volume/PMIHES_2023__138_/), for SchemeAndStackFoundations:SF.5: The discriminant computation is a concrete Chern/intersection/Thom–Porteous application of the single intersection-theory supplier. (from the extraction of Bhatt et al., "Globally +-regular varieties and the minimal model program for three … (shortened)

- Benoist, "The period-index problem for real surfaces", Publications Mathématiques de l'IHÉS (2019) (https://pmihes.centre-mersenne.org/volume/PMIHES_2019__130_/), for SchemeAndStackFoundations:SF.2: Use the early SF.2 site and equivariant-sheaf carriers. PAPER-CESNAVICIUS-19 route 3 already owns cohomological Brauer groups, generic injectivity, purity/residues and étale Kummer; items 09–10 add only finite residue support/maximal unramified open and the residue ramification-index formula. PAPER … (shortened)

- Kisin–Pappas, "Integral models of Shimura varieties with parahoric level structure", Publications Mathématiques de l'IHÉS (2018) (https://www.numdam.org/volume/PMIHES_2018__128_/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1: Generic Hartogs extension, affine arithmetic descent and module torsor twisting use the existing scheme/descent owner. Import the earlier CESNAVICIUS-22 torsor and patching items before adding statement-specific adapters. (from the extraction of Kis … (shortened)

- Boxer, Calegari, Gee and Pilloni, "Abelian surfaces over totally real fields are potentially modular" (arXiv:1812.09269) (https://arxiv.org/abs/1812.09269), for SchemeAndStackFoundations:SF.2: SF.2 is to 'construct sheaf cohomology, localization, proper/smooth base change and compact support'. It receives Kempf's Cousin complexes, in the cohomology-with-supports package that the Benoist–Wittenberg (2020) extraction asks of this layer, beside local cohomology as a colimit of Ext sheaves (Kings– … (shortened)

- Bhatt, "On the direct summand conjecture and its derived variant", Inventiones Mathematicae 212 (2018) (https://link.springer.com/article/10.1007/s00222-017-0768-7), for SchemeAndStackFoundations:SF.4: Generic multisections and the non-Noetherian algebraic modification theory belong in SF.4: flattening by blowup (Stacks 0815, 081R), the module strict transform, flat generic isomorphisms, proper-modification domination (081T) and its p-adic instance formal-domination. H^0 integrality is a pinne … (shortened)

- Česnavičius, "Macaulayfication of Noetherian schemes", Duke Mathematical Journal (2021) (https://webusers.imj-prg.fr/~kestutis.cesnavicius/), for SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4: SF.0 constructs schemes and quasi-coherent modules, and the extension of a coherent submodule (or closed subscheme) across an open immersion of Noetherian schemes, EGA I 9.4.7 (item 71), used in Lemma 2.11 and twice in Proposition 5.2, is a basic statement about them that nothing states. … (shortened)

- Deligne, "La conjecture de Weil. II", Publications mathématiques de l'IHÉS 52 (1980), 137–252 (https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), for SchemeAndStackFoundations:SF.2: The conventions of §0 (geometric points, henselisation and strict henselisation, traits, closed points, finite filtrations, limits in ind- and pro-categories) and the filtered derived category and truncation of (1.1.2) are the site-theoretic background SF.2 owns ('construct sheaf cohomology, localization, … (shortened)

- Scholze, "Étale cohomology of diamonds" (arXiv:1709.07343) (https://arxiv.org/abs/1709.07343), for SchemeAndStackFoundations:SF.2: SF.2 is the layer that is to 'construct sheaf cohomology, localization, proper/smooth base change and compact support' for schemes. The paper uses scheme proper base change in Lemma 19.4 and invariance of étale cohomology under extension of algebraically closed base field in Proposition 27.2, and (in Lemma 9.5) the refinement of fppf covers of strictly henselian lo … (shortened)

- Kedlaya and Liu, "Relative p-adic Hodge theory: foundations", Astérisque 371 (2015) (https://arxiv.org/abs/1301.0792), for SchemeAndStackFoundations:SF.2: SF.2 owns the sites and the cohomology of schemes: it says it will "own Zariski, etale, fppf and pro-etale site comparisons", "construct sheaf cohomology" and "distinguish torsion, l-adic and rational coefficients in every export". The pro-étale site of a scheme (Definition 1.4.10, weakly étale morphisms with fpqc coverings and the sheaves F … (shortened)


## Validation boundary

Not compiled: no existing combined build at both exact pins found. No Lake project, library/cache build or language server started. Every node unchecked. Checker success tests packet structure and references, not proofs or Lean elaboration. The handoff records the completed packet/intake, native-name parity, source-receipt, finite-witness and actual atlas projection checks. No independent mathematical review or promoted atlas change is claimed.
