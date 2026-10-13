# Independent package review: Igusa varieties, round 3

Issue: #9221. Reviewer: Codex, session `codex-3oXx1e`. Date: 2026-10-13.
Verdict: **needs_changes**. This is a completed fixing review, not a checkpoint.

The round-2 full-ring restriction defect is repaired. The operator subalgebra, full similitude algebra and unitary algebra now have distinct carriers. Restriction is asserted to be multiplicative only on the operator algebra. The remaining obstacles are prerequisite closure and genuine proof/source gaps, detailed below. A successful elaboration of theorem statements with `sorry` does not resolve those obstacles.

## Scope and evidence

Read the accepted 123-node plan, the complete package README and Lean file, the round-2 report and round-3 author handoff, WORKERS, PACKAGE_REVIEW, PROTOCOL, UPSTREAM_GUIDE and the source-fidelity protocol. The two current upstream models read were SmoothRepresentationsOfLocalGroups and AdicSpaces, both README and Suggested.lean. The package retains their prose/layer form and places unavailable geometric carriers exclusively in the README.

The duplication audit used current TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, alongside `data/library-coverage.json`. Searches covered mathematical objects, fields and hypotheses: Newton/Kottwitz invariants, sigma-centralizers, PEL slope structures, universal-cover automorphisms, central leaves, Igusa towers and compactifications, period fibres, equivariant nearby cycles, Hecke convolution/restriction/inversion, generic parameters and boundary cohomology. The nine newer roadmaps and Completed roadmaps were included. Existing restricted products, generic Hecke convolution and anti-involutions, ordinary algebraic vector bundles, smooth representations and classical class field theory remain deferrals. General vector bundles are not the missing classification of G-bundles with crystalline structure. Igusa invariants of curves are unrelated. No additional duplicate target requiring deletion was found; no target was removed and no ownership transfer was made in this review.

The shared Lean build has Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Independently compared both Tau Ceti imports and their complete ten-module Tau Ceti source closure with `f790474821cf4256814db967cb154e7af3d0c369`; all ten files match byte for byte. Read the native Hecke ring and anti-involution signatures. In particular, commutativity by anti-involution requires fixing double cosets, a hypothesis not supplied by inversion.

## Fixes applied

1. Added `[Finite W]` to both split-local Hecke-triple instances and the downstream Hecke section. Without it take W = natural numbers, rank 2, and g_w = diag(q,1): every factor contributes index q+1, so the product index is infinite. Empty W and rank zero instead give unitary algebra Z and full algebra Z[U,U^-1]. These boundary cases are now in the README.
2. Corrected the spherical-commutativity proof: use Satake or transpose on each GL factor, which fixes integral double cosets. Inversion remains the duality involution and is not a proof of commutativity by the fixed-coset criterion.
3. Separated negative covariant Dieudonné slopes from the nonnegative Frobenius slopes in complete slope divisibility. Negate and reorder dominant vectors. The ordinary vector (0,-1) has pairing 1; (-1,0) is not dominant. The basic PEL check now distinguishes Frobenius slope 1/2 from covariant slope -1/2. Renamed the complete-slope-divisibility fraction a/s to avoid collision with the filtration length.
4. Made the Newton cocharacter target relative to a chosen maximal torus and Borel, with the star Galois action. Corrected the unitary-datum source page to CSnc p.11. Added rank-zero and characteristic-two matrix witnesses without introducing division by two.
5. Restricted the local-finiteness application to torsion cohomology at fixed tame level. Finite-set submodules in the Lean localization theorem are a real hypothesis; the theorem does not assert this for integral or rational tower cohomology. Corrected the coefficient order: derived torsion limit gives integral cohomology, then invert ell, then extend scalars, then take the geometric-level colimit.
6. Added characteristic p and a chosen algebraic-closure embedding for the constant-object base change over a strict henselian perfect ring. `PerfectRing R p` alone does not supply `CharP R p`.
7. Corrected the Drinfeld check: the open stratum is Y-degree-zero with its degree-one closed locus removed; the closed degree-zero locus is the whole reduced special fibre. Marked the still-unverified Harris–Taylor model/first-kind interface separately from Mantovan's verified closure application.
8. Exposed the unit-similitude quasi-isogeny extension and compatible completely slope divisible fundamental representative as proof obligations. Added Oort and Viehmann–Wedhorn locators and explained their scope. The downstream Artin argument now explicitly depends on resolving a geometric affineness route. The integral PEL representative API likewise no longer claims that rational Dieudonné–Manin classification supplies all integral structures.
9. Added the two induced maps on the closed subschemes and both commuting squares to `isAffine_of_transfer` and the README. The preimage condition is topological, not a demand for equality of scheme-theoretic fibre products.
10. Distinguished Lan–Stroh's rational local boundary theorem from the torsion computation actually proved in CSnc Proposition 6.3.1. Marked Koshikawa's integral local vanishing as a separate unclosed target; the mod-ell proof only needs a cyclic subrepresentation and its irreducible quotient, not finite generation of the entire localization.
11. Restored five accepted API names omitted in the rewrite: the two datum-qualified operator/restriction names and the involution's involutivity, inverse-operator and native-compatibility names. Their mathematical assertions remain in IG.0.4.
12. Corrected the owner of geometric G-bundle classification from VB2 to BunG BG2:uniformization. Kept the crystalline comparison as an explicit additional obligation: a geometric-point bijection does not supply it.
13. Added six proved Lean examples for empty Newton vectors, the negative ordinary pairing, the characteristic-two and empty matrices, empty/singleton genericity and repeated eigenvalues at q=1. The README also records the weak/strong distinction for (1,1) at q=2 over F_5.

## Unfixed blockers and where to resume

### B1. Tier closure of the Fargues–Scholze route

Igusa is tier 19 in `upstream/CaraianiNewton.md`. VectorBundlesAndIsocrystals, BunGAndNewtonStrata, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas and ExcursionOperatorsAndSpectralAction are outside that order. The package still imports them. Naming exact contracts does not satisfy WORKERS' lower-tier/bundle rule.

The previous author moved B(G), J_b, Newton/Kottwitz maps and the flag Newton-stratification target down into this package. That does not supply the G-bundle classification, crystalline comparison, cohomologically smooth modification map, equivariant dualizing object, coefficient equivalence, local-shtuka realization or integral/mod-ell spectral action used by IG.3.4, IG.3.9, IG.3.20, IG.3.27 and IG.7.10–IG.7.15. The required notions must have permitted ownership and complete prerequisite chains, or the maintainer must revise the upstream order. The review cannot silently treat the proposed order change in the author's handoff as an approved change.

### B2. Supplier contracts exceed the actual suppliers

These are independent of the order problem. Read the relevant supplier roadmap/package/packet when present, rather than accepting the consumer's contract as evidence that the supplier plans it.

| Consumer input | Actual supplier and missing interface |
| --- | --- |
| IG.0.11 integral slope representative | R07.2 supplies Dieudonné–Manin classification. It does not supply the simultaneous integral O_B-action, determinant condition, principal polarization and compatible complete slope divisibility requested here. The supplier itself defers polarized PEL structures to moduli roadmaps. |
| IG.3.3 Scholze–Weinstein classification | HodgeTateAndCanonicalSubgroups T2 gives Hodge–Tate structures, not a complete owner target for Theorem B over O_C with the needed extra structures. The public Scholze–Weinstein theorem is a source, not an already fulfilled T2 interface. |
| IG.3.4/3.9/3.20 G-bundles | VectorBundlesAndIsocrystals VB2 concerns vector bundles. Corrected the geometric G-bundle owner to BunGAndNewtonStrata BG2:uniformization/points-are-B-of-G. That target states a geometric-point bijection, not the crystalline G-Dieudonné comparison needed here; the additional obligation remains explicit. |
| IG.3.11/3.15/IG.4.1 formal sites | SF.4 formal-scheme foundations and AdicSpacesPartII R2's admissible comparison have stronger finiteness assumptions than the arbitrary perfect Witt and completed O_C bases here. Supply a nonnoetherian comparison or compatible descent to eligible finite-level models. |
| IG.4.4/4.7/7.4 geometric descent | SF.2's equivariant sheaf cohomology is not the full finite/profinite étale-tower Cartan–Leray comparison with nearby cycles, both level directions, Hecke localization, uniform costalk bounds and boundary restrictions. SR's derived invariants alone supply no geometric comparison. |
| IG.4.7 integral pushforward | EDC.5's finite-type constructible perversity does not establish integral pushforward and uniform continuity for the particular nonconstructible two-level systems. No arbitrary-scheme perverse t-structure can fill this gap. |
| IG.4.4/4.7/7.12 nearby cycles | The current LPV package already includes finite-coefficient t-exactness over henselian traits (§6.2) and a conditional filtered-colimit criterion (§6.5). The old assertion that it only plans rational coefficients is obsolete. Its hypotheses still do not establish the required O_C model comparison, uniform bounds and ordinary-support derived inverse limit. A filtered colimit criterion is not a support Rlim comparison. |
| IG.6.7 torsion GL_r Galois systems | TC.4 is reusable validation infrastructure, not Scholze's torsion determinant theorem for GL_r cohomology. There is no TC packet supplying the missing owner node. IntegralHecke's determinant formalism does not construct the cohomological determinant. |
| IG.3.27/7.11–7.13 local geometry and spectral coefficients | Keep separate the quotient by the full universal-cover automorphism group, its positive connected kernel and trace/orientation, compact torsor coinvariants, arbitrary finite F/Q_p local-shtuka realization, and mod-ell parameter reduction. The exact VS/HS/ES/S2 requests need actual supplier targets in the required generality. Characteristic-zero LLC comparison is insufficient. |

Two old terminal gaps have improved and are **not** findings against the present suppliers. PadicHodgeTheory now contains `P8:local-rational/constructible-primitive-comparison`, covering proper algebraic maps and constructible F_p sheaves with a relative form; Scholze's survey Theorem 3.13, pp.17–18, is the correct source for the application to finite-level Stein maps. Current ClassFieldTheory Layer 5 explicitly plans finiteness, local duality and the finite-module local Euler formula, including smooth/discrete hypotheses. For ell different from p this gives H^1 = H^0 + H^2 in dimensions; for an unramified character of arithmetic Frobenius eigenvalue lambda, H^0 and H^2 vanish outside lambda in {1,q_L}. The requested local obstruction input therefore has an upstream owner.

### B3. Affineness depends on unresolved PEL geometry

CSnc Corollary 3.2.14, pp.44–45, is printed for G-isogenies that are isomorphisms on the outer slope pieces. With nonzero multiplicative part and principal polarizations, this forces unit similitude and hence degree one. The proof instead changes the middle piece by a power of p. Replacing the word isogeny with quasi-isogeny is not a proof: the boundary quotient's principal polarization and gluing to the interior need construction. Multiplying by a power of p destroys the prescribed outer isomorphisms.

The alternate fundamental-EO route also needs work. [Oort, Minimal p-divisible groups](https://annals.math.princeton.edu/wp-content/uploads/annals-v161-n2-p10.pdf), §1.1, pp.1022–1023, gives unstructured products of minimal slope blocks. [Viehmann–Wedhorn v4](https://arxiv.org/abs/1011.3230v4), §8.2, Remark 8.12 and Corollary 8.13, author-copy pp.36–37, identifies minimal notions in the split case. Neither passage alone proves that every required unramified PEL fundamental X_w has a compatible integral completely slope divisible structure. Nie's fundamental representative/central-leaf results and Boxer's affineness of an EO stratum do not supply that missing compatibility. Resolve one complete route before claiming IG.2.16–IG.2.18 and the affineness input of IG.4.9.

### B4. Restricted Harris–Taylor source/interface

The authorized library index does not clear Harris–Taylor's book. No other copy was obtained. Li–Liu's public formulation supports the Drinfeld-stratum application, and Mantovan's public §4.2.4/Proposition 12 supports the closure-smoothness application. A full construction and proof source for the Drinfeld integral model and first-kind Igusa interface in IG.0.31, IG.0.33 and IG.1.9 is still needed. The README now distinguishes these obligations. This finding does not reject Mantovan's verified application.

### B5. Integral Koshikawa target

IG.7.11 retains an integral vanishing target whose reduction step is open. The cyclic smooth representation Z_ell[t,t^-1]/(t-ell) of Q_p^times is nonzero and ell-divisible; its mod-ell quotient is zero. Thus finite generation as a smooth group representation is not a Nakayama hypothesis. Establish the required localized completeness/finiteness or remove the additional integral export. The later arguments explicitly use the mod-ell form, so this gap alone is not a counterexample to their mod-ell conclusions.

## Source checks

The reproducible random sample is `random.Random(9221).sample(packet['nodes'], 15)` in the accepted packet's node order. Read the indicated statements and surrounding hypotheses/proofs in the actual public PDFs. The following table reports source agreement, not independent proofs of all theorems or closure of their suppliers.

| Sampled target | Locator read and outcome |
| --- | --- |
| IG.2.13 EO minimal affineness | Boxer thesis, Theorems B/C, printed p.17; Theorem 6.2.3 and Corollary 6.2.4, p.190; CSnc Theorem 3.3.2, p.45. EO affineness verified; does not resolve B3's CS-divisibility compatibility. |
| IG.7.15 CN middle degree | CN v3 Theorem 2.1.28, p.25, Theorem 2.1.26, p.24, Corollary 2.1.20, p.22, setup 2.1.11, p.15. F^+=Q extra local hypothesis retained. |
| IG.6.1 parabolic strata | CSnc §6.1, pp.79–80. The lower datum uses Z_-1/Z_-2; reversed printed quotient is already corrected. |
| IG.1.5 faithful flatness | CS17 Corollary 4.3.9, p.718. Faithful flatness is not replaced by pro-etaleness or finiteness. |
| IG.7.2 cohomological genericity | LTXZZ Definition D.1.1 and Proposition D.1.3, p.365, Corollary D.1.4, p.368. Finite enlargements and actual auxiliary data matter; distinct eigenvalues are unnecessary. |
| IG.6.2 boundary induction | CSnc Theorem 6.2.1, p.80. Unnormalized induction and lower-rank action retained. |
| IG.7.13 ordinary comparison | Koshikawa v1 Proposition 1.7, p.3; §9, pp.14–16, especially Lemma 9.1, p.15. Equivariant kappa^-1[-2d] and disjoint spectral support are essential. |
| IG.6.4 local boundary calculation | CSnc Proposition 6.3.1, p.84; Lan–Stroh author copy Assumption 4.3.1/Lemma 4.3.2, p.61, Definition 4.3.8/Theorem 4.3.10, pp.63–64. Added rational/torsion distinction. |
| IG.2.7 toroidal finite level | CSnc Definition 3.2.4, p.40, Lemma 3.2.6, p.41. Finite étale level map and slope-graded trivialization retained. |
| IG.3.16 Newton correspondence | CS17 Proposition 4.2.6, p.702, Remark 4.2.8, p.703. Rank-one reduction dictionary and Hodge–Tate identification retained. |
| IG.3.20 constant mod p^epsilon | CSnc Lemma 4.3.1, p.54. Small positive epsilon and crystalline/bundle input are required; B2 remains. |
| IG.3.21 compactified map | CSnc Lemma 4.3.2, p.55, proof p.57. Rank-one points and actual integral map are distinct from cohomological comparison. |
| IG.6.7 length obstruction | CSnc Theorem 6.4.1, p.84, proof p.86, with §2.8.7, p.35. Length-two boundary contradiction uses torsion GL_r Galois systems; B2 remains. |
| IG.3.25 fibre/cohomology | CSnc Theorem 4.1.1 and Corollary 4.1.2, p.51. Compactified fibre and its two cohomology forms retained. |
| IG.3.18 open fibre | CSnc Theorem 2.7.2, p.33. Open immersion plus canonical compactification retained, without asserting properness of the open fibre. |

Additional flagged-input checks:

- CSnc §2.1, pp.11–12, versus §5.1, p.64, confirms the two different uses of the same Hecke symbol. In the product decomposition the unit-similitude subgroup has the same compact factor as the unitary group. Central similitude cosets give the full-ring counterexample.
- [Stacks Lemma 10.53.6, tag 00JB](https://stacks.math.columbia.edu/tag/00JB) gives the Artinian product decomposition. The module statement in IG.0.5 follows by applying it to finite images of R and passing through finite invariant submodules. It is not a direct quotation of a Stacks theorem for arbitrary infinite modules.
- Oort, Foliations in moduli spaces of abelian varieties, author version math/0207050v3, Corollary 1.7, p.5, supplies finite-level recognition; Theorem 2.2, p.8, and Theorem 3.3, pp.9–10, give leaf geometry. These do not automatically add integral PEL structures. Oort–Zink's complete-slope-divisibility and Hamacher's dimension results were read in their public versions.
- Lan–Stroh's partial compactification result is Theorem 2.3.2, not the display numbered 2.3.3. The current author erratum and the componentwise cusp-lattice correction were read. Theorem 4.3.10 remains rational. The other Lan–Stroh paper's Corollary 5.20, author-copy p.25, gives ordinary/compact-support nearby-cycle comparisons; it is not a general nonnoetherian perversity theorem.
- Scholze–Weinstein v2 Theorems A/B were read for the two different bases and isogeny/integral categories. An isocrystal classification does not automatically classify integral principal-polarized objects.
- [Hansen–Kaletha–Weinstein](https://www.math.uni-bonn.de/people/kaletha/fp.pdf), author copy dated 7 May 2021, Theorem 1.0.3, p.5, identifies the Fargues–Scholze and usual semisimplified parameters for inner forms of GL_n in the characteristic-zero coefficient setting of the paper. It does not itself establish the mod-ell reduction compatibility needed here. Mínguez–Sécherre v2 (1110.1467), Theorem A, p.3, and v1 (1404.0804), Theorem 3.27/Remark 3.28, pp.35–36, support the lifting/supercuspidal-support input now owned by IG.7.9.
- Illusie, Astérisque 223, Corollary 4.5, printed p.47, is rational ell-adic. The current LPV finite-coefficient target additionally uses the BBD torsion formalism. No claim that Illusie's displayed corollary alone supplies the whole torsion/O_C extension is accepted.
- Scholze's CDM survey Theorem 3.13, pp.17–18, rather than the similarly dated rigid Hodge-theory paper, is the primitive-comparison source used above. Mantovan's PEL and Igusa author copies, Li–Liu I/II and Shin's public Igusa trace-formula copy were read for the flagged applications and normalizations.

All eighteen recorded plan gaps were revisited: (1–2) B3; (3) inert-prime unit-similitude existence remains outside the explicitly split target; (4) torsion GL_r is B2; (5) primitive comparison has a current owner; (6) Scholze–Weinstein/G-bundles is B2; (7) nearby-cycle extension is B2, with the updated LPV qualification; (8) Harris–Taylor is B4; (9) HKW characteristic-zero statement verified, mod-ell supplier still required; (10) good-prime descent needs the actual normal-cover geometric comparison in B2; (11) Li–Liu application/compact-unitary extensions remain scoped as downstream consumers, not silently added end theorems; (12) integral PEL representatives is B2; (13–14) enlarged perversity/formal Witt sites is B2; (15) mod-ell spectral action is B1/B2 and integral passage B5; (16–17) ordinary costalk/Mantovan quotient interfaces are B1/B2; (18) local Euler characteristic has a current owner. No gap was closed merely by restating it as a supplier contract.

## Adversarial pass over all targets

Each row records an instance or obstruction checked against the complete statement/API and its standing hypotheses. “Retained” means that this pass found no further local change, not that the target is proved or its supplier closure is established. B1–B5 apply wherever indicated above. Ring-valued model definitions permit their stated algebraic generality; global Shimura theorems keep n positive, mixed characteristic and the explicit unramified/type-(A)/(C) assumptions. No equal-characteristic or arbitrary ramified-DVR extension is inferred.

| Target | Instance, direction or boundary checked; result |
| --- | --- |
| IG.0.1 | Trivial G gives one sigma-class and trivial J; GL_1 gives integer valuation; conjugation direction retained. |
| IG.0.2 | Empty vector pairing 0; ordinary (0,-1) pairing 1; basic pair equal slopes pairing 0; dominance and sign/reordering clarified. |
| IG.0.3 | Scalar 2 has similitude 4; n=0 excluded for datum; n=1 and p=2 matrices added. |
| IG.0.4 | U times U^-1 is 1 but restrictions both zero; empty/finite/infinite W tested; finiteness and commutativity proof fixed. |
| IG.0.5 | Zero M gives zero sum; finite field-image module gives a finite primary decomposition; integral non-finite-set modules excluded from application. |
| IG.0.6 | Scalar 2 is outside G^0; operator-ideal pullback uses an isomorphism; no full-ring restriction homomorphism. |
| IG.0.7 | Trivial torsor is neutral; global balanced datum retained; no arbitrary reductive-group Hasse principle inferred. |
| IG.0.8 | Ordinary split group and supersingular group have different slope data; boundary semiabelian torsion need not be p-divisible. |
| IG.0.9 | Hyperspecial unramified case versus bad reduction; N at least 3 retained to eliminate stabilizers. |
| IG.0.10 | Complex double quotient uses the common rational similitude; no identity-component equality of G and G^0. |
| IG.0.11 | Ordinary/basic and p=2 versus type D; rational and integral polarization separated; representative proof obligation exposed. |
| IG.0.12 | Ordinary/basic Newton polygons distinct; specialization order unchanged; negative dominant normalization explicit. |
| IG.0.13 | Zero filtration and a paired two-step filtration; isotropic piece dual to its quotient, not self-dual independently. |
| IG.0.14 | Equal slopes have zero connected internal Hom; unequal slopes retain direction; ordinary etale-to-multiplicative example. |
| IG.0.15 | Etale source gives the expected Tate module; Hom order matches the contravariance in its source; rational versus integral modules kept. |
| IG.0.16 | Slope difference zero does not produce a positive formal piece; slope 0 to slope 1 gives the positive piece. |
| IG.0.17 | Etale slope 0 and multiplicative slope 1; nonzero block excludes s=0; positive Frobenius convention clarified. |
| IG.0.18 | Isoclinic and ordinary products; representative up to isogeny is not a unique integral model; retained. |
| IG.0.19 | Ordinary group versus basic group; full universal-cover automorphism group includes connected positive part, not just J_b. |
| IG.0.20 | Identity fibre versus nonidentity J_b element; fibre translation and base change, not triviality of the whole extension. |
| IG.0.21 | Truncation level zero gives trivial finite automorphism data; liftable subgroup differs from all truncated automorphisms. |
| IG.0.22 | Empty and identity isomorphism loci; finite recognition bound is a hypothesis, not arbitrary level-one recognition. |
| IG.0.23 | Identity isomorphism gives a section; forms need a torsor, not a chosen global trivialization. |
| IG.0.24 | Ordinary versus supersingular central leaves; isomorphism class is finer than isogeny class; reduced structures kept. |
| IG.0.25 | Basic pairing 0; ordinary GL_4 pairing 4; no affine-Deligne–Lusztig defect term added to central-leaf dimension. |
| IG.0.26 | Zero thickening gives identity equivalence; nonnoetherian nilpotent thickening is retained as a theorem obligation. |
| IG.0.27 | Identity quasi-isogeny gives framed point; varying height components are not a single connected component. |
| IG.0.28 | Field and valuation-ring cases distinct; constant Newton hypothesis retained; no arbitrary nonnormal-domain extension. |
| IG.0.29 | Etale constant object and multiplicative constant object; characteristic p and constant-base embedding added. |
| IG.0.30 | Trivialized family gives trivial torsor; no globally chosen trivialization for every family; retained. |
| IG.0.31 | n=2 supersingular j=1 has dimension 0; open versus closed j=0 corrected; B4 explicit. |
| IG.0.32 | Empty locus and whole constant-family locus; finite truncation bound depends on height; retained. |
| IG.0.33 | Endpoint refined Drinfeld label and containment direction; reduced closure differs from raw possibly nonreduced model; B4. |
| IG.1.1 | Identity framing gives a tower point; full-group trivialization versus finite slope truncation; retained. |
| IG.1.2 | Identity quasi-isogeny gives identity; composition matches the correspondence direction; integral maps not inferred for arbitrary quasi-isogenies. |
| IG.1.3 | Level zero and ordinary split slopes; finite liftable truncation group, not all automorphisms of arbitrary BT truncations. |
| IG.1.4 | Perfection kills nilpotent structure; finite-level and perfect towers not identified before perfection. |
| IG.1.5 | Identity point in a leaf; faithful flatness and surjectivity do not assert finiteness of the perfect tower. |
| IG.1.6 | Scalar pair acts trivially; left/right conversion uses inversion; action not falsely faithful. |
| IG.1.7 | Empty variety gives zero cohomology; finite coefficients then derived limit then invert ell; coefficient order fixed. |
| IG.1.8 | Zero complex has zero virtual character; alternating signs retained; rational trace formula not used to define integral cohomology. |
| IG.1.9 | Ordinary height endpoint versus first-kind cover; balanced and Harris–Taylor signatures kept separate; B4. |
| IG.1.10 | Smallest refined closure and Mantovan local-model application; closure smoothness does not construct every first-kind model. |
| IG.2.1 | Empty and entire subsets; well-positioned boundary product condition is more than arbitrary locally closedness. |
| IG.2.2 | Empty boundary recovers the original subset; partial compactification need not be proper; retained. |
| IG.2.3 | Rank-zero cusp recovers interior; torus extension and biconnected quotient kept distinct. |
| IG.2.4 | Empty closed subset and whole special fibre; closedness assertion uses scheme structure, not just point inclusion. |
| IG.2.5 | Ordinary leaf can meet boundary; no multiplicative part excludes boundary; retained. |
| IG.2.6 | Rank-zero degeneration has no outer toric pieces; polarization pairs the two outer pieces; retained. |
| IG.2.7 | Level zero and absence of biconnected part; finite etale statement restricted to finite level. |
| IG.2.8 | Infinite Galois tower is integral over a leaf, generally not finite; retained. |
| IG.2.9 | Zero toric rank yields interior chart; formal completion does not give a global product. |
| IG.2.10 | p split permits independent middle adjustment; inert case not inferred; retained explicit split hypothesis. |
| IG.2.11 | Integral outer-isomorphism case forces degree one; multiplying a quasi-isogeny by p breaks outer isomorphisms; B3 exposed. |
| IG.2.12 | Ordinary Hasse section nonzero versus supersingular zero; power/line bundle retained, no scalar-valued Hasse function asserted. |
| IG.2.13 | Zero-dimensional EO stratum is affine; partial minimal EO closure requires Boxer's nonvanishing section input. |
| IG.2.14 | Basic and ordinary fundamental elements; central-leaf EO property does not by itself prove compatible slope divisibility. |
| IG.2.15 | Empty closed loci reduce to finite-surjective transfer; whole closed loci reduce to assumed affine Y; commuting squares added. |
| IG.2.16 | Fundamental representative versus another isogenous representative; transfer still requires B3. |
| IG.2.17 | Infinite perfect tower is not finite; affineness follows only after the central-leaf input; B3. |
| IG.2.18 | Finite normalization versus inverse limit; unstructured minimal slope blocks do not settle integral PEL choice; B3. |
| IG.2.19 | Rank zero yields interior label; componentwise lattice exponents matter in higher rank; retained. |
| IG.2.20 | Rank-zero cusp has no toroidal boundary; stabilizer quotient and Hecke equivariance retained. |
| IG.2.21 | Finite and infinite-level cusp strata distinguished; no finite morphism claimed for the limit. |
| IG.3.1 | Good-reduction locus can be proper open in the analytic space; tower/p-completion are not finite type schemes. |
| IG.3.2 | Proper case recovers usual cohomology; nonproper comparison uses Lan–Stroh and overconvergence, not proper base change alone. |
| IG.3.3 | Ordinary and basic filtrations; integral lattice T versus rational V; Scholze–Weinstein source does not fulfill missing T2 target. |
| IG.3.4 | Ordinary flag stratum dimension zero; basic locus open; no algebraic locally closed scheme structure asserted for every flag stratum. |
| IG.3.5 | Basic d_b=0 gives flag dimension d; ordinary d_b=d gives dimension 0; retained. |
| IG.3.6 | Trivialization change acts through J_b; map direction to flags fixed; cyclotomic completed base retained. |
| IG.3.7 | Chosen lift gives an automorphism orbit, not a finite fibre; universal-cover group retained. |
| IG.3.8 | Rank-one points alone do not imply arbitrary pointwise isomorphism without extension criterion; eligibility assumptions retained. |
| IG.3.9 | Ordinary/basic points require the correct G-bundle/crystalline classification; no rational isocrystal-only argument accepted. |
| IG.3.10 | Equal slopes give no positive kernel dimension; ordinary slopes give the expected pairing dimension; retained. |
| IG.3.11 | R=F_p yields W(R)=Z_p; nonnoetherian perfect R does not become noetherian; formal site input remains B2. |
| IG.3.12 | Identity framing and rank-zero deformation; infinite level uses preperfectoid/strong completion, not a finite-level isomorphism. |
| IG.3.13 | Product dimension balances central leaf and local factor; quotient uses full automorphism group, not only its discrete quotient. |
| IG.3.14 | Constant point sheaf and zero complex; rank-one stalk argument requires overconvergence; retained. |
| IG.3.15 | R a perfect field is a baseline case; arbitrary perfect base needs B2's formal-site comparison. |
| IG.3.16 | Ordinary/basic rank-one points; specialization dictionary uses the same covariant convention; retained. |
| IG.3.17 | Compact PEL fibre versus noncompact case; compact cohomology only where the stated geometry supplies it. |
| IG.3.18 | Open fibre may be nonproper; canonical compactification is the target, not equality with the open source. |
| IG.3.19 | Zero-rank boundary recovers interior; lower-rank flag embedding includes the outer filtration pieces. |
| IG.3.20 | Small positive epsilon, not arbitrary epsilon or p=0; crystalline comparison remains B2. |
| IG.3.21 | Identity boundary chart and rank-one point; extension requires integral model data, not just pointwise bijection. |
| IG.3.22 | Proper target required by the criterion; partial properness alone does not suffice; existing correction retained. |
| IG.3.23 | Empty toroidal boundary recovers open fibre; canonical compactification rather than unqualified equality. |
| IG.3.24 | Stein fibres and almost mod-p^n comparison; primitive relative input now has a current P8 owner. |
| IG.3.25 | Open versus compactified fibres and ordinary/compact support; all cohomological forms kept distinct. |
| IG.3.26 | One-dimensional height-one example; SW base and integral lattice preserved, not a general ramified PEL theorem. |
| IG.3.27 | Trivial connected kernel is simpler than the general case; quotient/coinvariant/orientation data cannot be dropped; B1/B2. |
| IG.4.1 | Trivial group gives ordinary site; finite free action quotient; arbitrary action is not automatically a geometric quotient; B2. |
| IG.4.2 | Proper map to a point with positive-dimensional fibre is not finite; rank-one uniqueness criterion retains finiteness hypotheses. |
| IG.4.3 | O_C/p finite presentation differs from finite type over k; integral morphism need not be finite; retained. |
| IG.4.4 | Proper compact case needs both halves of t-exactness; no noncompact equality inferred; B2. |
| IG.4.5 | Empty stratum contributes zero; minimal nonempty stratum concentration depends on actual support, not all strata simultaneously. |
| IG.4.6 | Ell-power tower killing uses its level direction; not exact invariants for an ell-group on ell-torsion coefficients. |
| IG.4.7 | Zero complex satisfies lower criterion; nonconstructible colimit requires uniform bounds and integral pushforward; B2. |
| IG.4.8 | Empty boundary gives ordinary cohomology; RΓ(Ig*,j_!-) differs from compact support when Ig* is not proper. |
| IG.4.9 | Affine point has no positive cohomology; geometric affineness route explicitly conditional on B3. |
| IG.4.10 | Empty minimum gives zero; dimension shift follows the supported minimal stratum, not arbitrary Newton label. |
| IG.5.1 | m=2, q=7 over F_11 sends (1,2) to (7,9); inversion and Tate twist exponent checked; nonzero denominators explicit. |
| IG.5.2 | Smooth d=0 case gives unshifted duality; general shift 2d and twist d retained; full/operator involutions compatible. |
| IG.5.3 | Zero constituent gives no representation assertion; semisimple parameter length and normalized trace input retained. |
| IG.5.4 | Zero localized group gives no nonzero rational constituent; one-degree and integral lifting hypotheses not removed. |
| IG.5.5 | Lambda outside {1,q_L} kills H^0 and H^2; lambda=1 or q_L obstructs splitting; local Euler owner verified. |
| IG.5.6 | Basic nonordinary versus ordinary J_b; generic principal series cannot transfer to nontrivial inner form; weak repetitions allowed. |
| IG.6.1 | r=0 is interior; r=n removes the lower-rank unitary factor; lower graded quotient direction checked. |
| IG.6.2 | Trivial parabolic gives original representation; unnormalized induction retained; no accidental modulus inserted. |
| IG.6.3 | Zero cohomology factors give zero cup product; boundary chart compatibility is needed before taking congruence limits. |
| IG.6.4 | Rank-one cusp and class-group decomposition; rational Lan–Stroh theorem distinguished from torsion CSnc proof. |
| IG.6.5 | Empty boundary gives zero formula; parabolic contributions have Hecke/Satake actions, not the interior action by identity. |
| IG.6.6 | Induction from the whole group reduces to identity; derived invariants needed when group order is not invertible. |
| IG.6.7 | Boundary forces at least three constituents; length at most two excludes it; needs torsion GL_r determinant owner in B2. |
| IG.7.1 | Empty/singleton tuples vacuous; q=1 repetitions fail weak genericity; q=2 over F_5 repetitions pass only weak form. |
| IG.7.2 | Arbitrary finite excluded set can be enlarged; one prime without enlargement stability is insufficient; actual datum retained. |
| IG.7.3 | Ordinary d_b=d yields lower bound d; no ordinary contribution when its localization vanishes. |
| IG.7.4 | Level already good versus arbitrary neat level; choose a new good prime and genuine normal cover; B2 geometric descent remains. |
| IG.7.5 | Zero localization is allowed; nonzero cohomology outside middle degree vanishes only under full global residual hypotheses. |
| IG.7.6 | Mod-ell then integral passage retains coefficient/finiteness assumptions; no arbitrary smooth-representation Nakayama. |
| IG.7.7 | Absolutely irreducible implies boundary length obstruction; generic reducible length two is separate. |
| IG.7.8 | Compact support versus ordinary cohomology identified only after boundary vanishing; local systems carry their hypotheses. |
| IG.7.9 | GL_1 trivial inner form versus division inner form; integral lift and semisimple reduction, not irreducible reduction, retained. |
| IG.7.10 | Quasi-split excluded from irrelevance conclusion; nontrivial inner form and generic unramified parameter give the obstruction; B1/B2. |
| IG.7.11 | Nonzero smooth module has cyclic subrepresentation with irreducible quotient; ell-divisible cyclic integral module defeats reduction; B5. |
| IG.7.12 | Ordinary support inverse limit is not filtered-colimit continuity; shift d retained; B1/B2. |
| IG.7.13 | Ordinary dualizing object kappa^-1[-2d]; replacing it by dimension alone loses equivariance; B1/B2. |
| IG.7.14 | F^+=Q route uses Koshikawa rather than the F^+ unequal Q trace argument; hypotheses not exchanged. |
| IG.7.15 | Local length restriction in the F^+=Q case and other global branch distinguished; no unconditional strengthening of CN. |

## Lean signature comparison

Spot-checked more than the required ten signatures against the final README:

| Lean declaration(s) | Comparison |
| --- | --- |
| `NewtonVector` | Finite decreasing rational tuple with multiplicity-times-slope integral; excludes a lone slope 1/2. It models abstract B(GL_n), not all integral PEL structures. |
| `pairingTwoRho`, `DominatedBy` | Pairing order is i<j; dominance has equal total slope and all prefix inequalities. Empty, basic and ordinary values checked. |
| `IsAdmissible`, `admissible_gl2_eq` | Integer Hodge vector is the supplied dominant vector; the concrete theorem uses (1,0). It is not falsely identified with the negative Shimura mu inverse convention. |
| `skewHermMatrix`, `similitudeGroup` | Actual matrix equation and unit multiplier; subgroup-law fields are propositions, not sorry-defined data. Model works for a ring endomorphism; the advertised unitary interpretation specializes to an involution. |
| `unitaryGroup`, `UnitarySimilitudeDatum` | Kernel of c, CM field, positive n and finite/full/self-dual lattice are real data; group and datum use their respective ring/number-field generalities. |
| `instIsHeckeTripleSplit`, `instIsHeckeTripleSplitUnitary` | Added finite W. q is prime and the integral subgroups are the native images in Q_q. General F_w factors remain README targets. |
| `localHeckeOperatorSubring`, `exists_heckeRestrict` | Support on unit similitude, native Hecke multiplication, isomorphism with prescribed function values; no opaque homomorphism substituted for restriction. |
| `localSimilitudeUnit_mul_neg`, `not_exists_ringHom_restrict_full` | Nonmultiplicativity witness is stated on the full carrier, still valid for empty W. |
| `localization_operator_eq_sum` | Arbitrary commutative R and subring A, maximal m, union of finite-set R-submodules; R-linear direct sum over maximal ideals contracting to m. Zero module allowed. |
| `isAffine_of_transfer` | Proper/surjective maps, closed immersions and actual commuting restricted maps, topological preimages, finiteness off the closed locus and three affine schemes; conclusion matches CSnc. |
| `WeaklyGeneric`, `DecomposedGeneric` | Predicates make sense for arbitrary field tuples; interpretation as nonzero Frobenius eigenvalues is separate. q=1 and repeated eigenvalues checked. |
| `dualEigenvalues`, `weaklyGeneric_dualEigenvalues` | m-1 is natural subtraction; empty tuple is harmless; theorem explicitly assumes q and all alpha_i nonzero. The F_11 two-term witness pins twist direction. |

Heavy definitions and end theorems without pinned carriers are covered by the closing README-only comment. No new formal geometric carrier, sorry-defined data, auxiliary proof development or placeholder proposition was introduced.

## Validation

- `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean`: exit 0; 17 warnings, all `declaration uses sorry`; zero errors. Memory exceeded 100 GB available. No Lean edit followed this successful check. Final file: 431 lines.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no offenders.
- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json`: zero errors/warnings; 123 nodes, 137 planned tests, 47 requests and 18 recorded gaps. Packet unchanged.
- Final README coverage: 129 numbered targets, all 123 accepted target anchors retained, all 234 entries of the plan's API fields represented; the plan checker's own narrower API count is 224. All forty accepted definition/construction targets retain Checks, with six added interface sections making 46 blocks; each has at least three checks. There are 162 explicit Check bullets.
- 151 unique explicit anchors and 256 internal links; all resolve. No source passages or section-by-section source summaries were added. Metadata remains exactly `topic = "math.NT"` followed by a newline.
- Intake check-files on all six deliverables: 0 problems. JSON parsing, accepted-definition Check coverage and `git diff --check` pass; the handoff records the same final results.

Only this job's package files, review report and handoff change. Suppliers, accepted packets, upstream checkouts and atlas data are unchanged. Resume with B1 ownership/order and B2's missing owner targets, then close one full B3 geometric route. Do not spend the next revision re-fixing the resolved full-ring restriction defect.

## Public PDF receipts

SHA-256 of the public files read in this run (no PDFs are committed):

| Source/version identified above | SHA-256 |
| --- | --- |
| csnc | `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e` |
| cs17 | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| cn23 | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| kos21 | `622ba722641718431ac6c6750df44e1682506140733f61995551209d276be99d` |
| ls18a-author | `2be447b18090d30564f8d2bccd815e9805767bbf5a16325f0d87febf4f6084ce` |
| ls18a-erratum | `ad9d1675994950552affda1c57bcf49db6a2721ab04228af857264921f105730` |
| oort05 | `de91ad1864a08a334f85ee00c8299e3737172027244ae82c33638a3f8d4e56d8` |
| vw13 | `716a4549e17be6c44cc3d5dbdcd21f116d11977371a46ed09df5bc567aba6daa` |
| hkw21 | `89a8554beec657069838b6a84dcf37179319b221af92200f6aaf7c233300b3b0` |
| ill94 | `a81d3e6c63ea0257b1cbd58933bb863c4adad3864cc19968f56beec700670e70` |
| sch13-survey | `85a0b85e13163d8953c25d521c7f568afcc2a67c8f192228a8608f533b5f11eb` |
| ls18b | `17b8895c946898099ed0ae86400ef5eacf6318125f0819448e7c3ae6afd98987` |
