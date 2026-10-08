# Arbitrary valuation bases: nearby cycles and generic extension

This document develops `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles`. It continues the accepted H0 packet, importing its twenty declarations and retaining their identifiers. The new part has thirteen nodes: two comparisons, seven theorems, three promoted API lemmas and one construction. Its coverage is **planned**, with explicit source, ownership and generality frontiers. All implementation statuses are unchecked.

The purpose is to make the valuation-base inputs usable by classical analytic comparisons and by general-base applications. The first output is the canonical nearby-cycle base-change isomorphism for arbitrary Cartesian valuation maps, including non-dominant maps. The second is a public finite-presentation route to tube–fibre comparison and constructibility. The third is generic extension on the **total scheme** over an absolutely integrally closed valuation ring, with perfect-constructible coefficients and universal local acyclicity. These outputs have different hypotheses and different targets.

## Conventions and the existing carrier

Write (S=\operatorname{Spec}V), with (V) an arbitrary valuation ring. A quadruple is (Q=(X,S,\eta,s)), with (\eta\) specializing to (s), a structure map (f:X\to S), and strictly henselian (\mathcal O_{S,s}). The case (\eta=s) is included. Valuation rings can have arbitrary rank; discreteness and a uniformizer are not part of the data. This is the carrier of H0’s `valuation-base-quadruple`, not a new definition in this packet.

Choose a separable closure (L/\kappa(\eta)). The source of (j\) is the base change of the **strict localization** (S_{(\bar\eta)}\), while (i:X_s\to X) is the special-fibre map. The inherited construction is

\[
R\Psi_L(F)=i^*Rj_*j^*F.
\]

It comes with the specialization unit, a continuous Galois action, and transport under a change of chosen separable closure. Substituting the geometric point (\bar\eta\) for the strict localization is a theorem about a canonical map; it is not the definition. At an intermediate prime of a rank-two valuation ring these are different schemes. At the generic point the strict localization is the geometric generic field; at (\eta=s) the inherited object is (i^*F).

A morphism (Q'\to Q) preserves both specified points and includes the embedding (L\to L') and the resulting compatible map of strict localizations. Its Cartesian condition is the actual fibre-product condition on (X',X,S',S). Its definition does not require dominance. The inherited exchange map is denoted (\beta_\phi\). Galois equivariance is relative to the specified restriction homomorphism of Galois groups.

The coefficient category is the existing scheme étale derived category, with its bounded-below subcategory (D^+). Mathlib supplies the small étale topology and the general derived-category carriers. Scheme pullback, derived direct image, their coherent adjunctions, and the general oriented-product site are precisely requested supplier interfaces. The suggested file uses these existing carriers and explicitly identifies its supplier stubs. Elaborating those stubs is not implementing a nearby-cycle theory.

## Imported declarations and retained proof boundaries

The prefix of every identifier in the following table is `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/`. All twenty entries are imported from [the accepted H0 packet](../packets/ClassicalAdicEtaleCohomology--H0.json); none is recreated here. Their definition APIs and tests remain in [H0’s reader](ClassicalAdicEtaleCohomology--H0.md) and [suggested file](../suggested/ClassicalAdicEtaleCohomology--H0.lean).

| Imported suffix | Interface retained |
|---|---|
| `valuation-base-quadruple` | Arbitrary valuation base, specialization and strict henselianity |
| `strict-localisation-of-a-valuation-ring` | Chosen strict localization and valued-field comparison |
| `morphism-of-valuation-quadruples` | Point-preserving map, chosen field embedding, Cartesian condition |
| `nearby-cycles-over-valuation-base` | Tube-defined (i^*Rj_*j^*) and specialization |
| `galois-action-on-nearby-cycles` | Continuous action with its specified coefficient convention |
| `milnor-tube-stalk-formula` | Strict-local tube cohomology, with the actual restriction map |
| `nearby-cycles-base-change-map` | Canonical exchange transformation, identity and composition |
| `nearby-cycles-equivariant-transport` | Change of choices and equivariant transport |
| `nearby-cycles-locality-and-proper-pushforward` | Étale/open locality and proper/projective reduction |
| `radicial-invariance-of-nearby-cycles` | Scheme étale topological invariance |
| `nearby-cycles-commute-with-filtered-colimits` | Degreewise coefficient continuity |
| `comparison-with-geometric-generic-point` | Full inherited tube–fibre target and its source frontier |
| `nearby-cycles-cohomological-amplitude` | Inherited geometric-fibre dimension bound, conditional on its comparison |
| `tame-quotient-of-a-henselian-valued-field` | Wild/tame distinction and the valued-field tame quotient |
| `prime-to-p-cohomology-through-tame-quotient` | Prime-to-(p) cohomology with the specified action hypotheses |
| `gauss-valuation` | Arbitrary-value-group Gauss valuation |
| `gauss-extension-tame-inertia-comparison` | Tame comparison, without asserting the full wild statement |
| `valuative-base-change-for-nearby-cycles` | Dominant-valuative theorem imported from H0 |
| `noetherian-coefficient-change-for-constructibility` | Coefficient extension with its amplitude and finiteness inputs |
| `constructibility-of-nearby-cycles` | Locally finite type, noetherian coefficients, full inherited target |

The full Huber proof strand remains precisely delineated. The original Gauss induction, the defectless hypotheses and full Galois-surjectivity of 4.2.10, and the controlling constructible submodule in the curve proof of 4.2.5, pp. 249–250, are not verified from an accessible source. The public arguments below prove their qualified mathematical outputs without identifying their proof steps with that strand. The source-library index marks Huber’s 1996 book as not cleared, so it was not accessed and no substitute copy was used.

## Public route and supplier order

The important extra input is de Jong’s **1997 Corollary 5.10**, p. 618. For a dominant proper morphism of integral excellent schemes it produces alterations of source and base and a tower of projective semistable curve fibrations. Its stated finite-group and purely inseparable function-field refinement must be retained. Quasi-splitness and finite dimensionality are not hypotheses of this corollary. The corollary is distinct from de Jong’s 1996 Theorems 4.1 and 6.5, which L5 plans. The excellent schemes occur after noetherian approximation; arbitrary valuation rings are not assumed excellent.

Orgogozo’s argument needs more than a bare alteration: Gabber’s extension of modifications, flattening, truncated proper hypercovers, proper cohomological descent, and the plurinodal/non-dominant component induction. Proper hypercover descent does not require dividing by an alteration degree. This differs from the prime-to-(p) trace splitting in the AIC generic-extension proof.

The exact general-base modification theorem has no suitable early declaration in the inspected packets. LPV.0’s current scope is excellent finite-type traits. GS.7 has a broad general-nearby application node, but it points to EDC.6, which consumes L5. SF.4’s current packet explicitly records conflicting alteration-owner recommendations. Thus this packet proposes, without accepting or applying, the following supplier arrangement:

| Supplier | Exact contribution |
|---|---|
| Early geometric prefix of `SchemeAndStackFoundations:SF.4` | Source-qualified modification/alteration geometry and de Jong 1997 5.10, using the existing stable curve reduction owner |
| Early general-base Part II extension of `LefschetzPencilsAndVanishingCycles:LPV.0` | Oriented products, canonical nearby functor and Orgogozo’s modification, cohomological-properness and constructibility theorems |
| `SchemeAndStackFoundations:SF.2` | Scheme étale functors, coherent mates, proper/smooth base change, proper descent, finiteness and general scheme ULA |
| Exact `AdicCoefficientsAndComparisons:L2` nodes | Noetherian approximation, finite-presentation diagram descent, cohomology/Hom/derived continuity and compactification |
| `EtaleDualityAndPerverseSheaves:EDC.0` | The common coefficient and tensor categories, extended to qcqs perfect-constructible objects |
| `EtaleDualityAndPerverseSheaves:EDC.1` | Relative duality with the exact ULA base-change/stability interface |

The alteration and general-nearby prefixes have no H1 or L5 dependency. H1’s valuation results consume those prefixes. SF.2’s ULA contracts require a separate proof order: its early ambient recognition inputs precede H1’s ambient extension proof, while its later geometric/valuative characterisation follows that proof. GeneralBasesFourier applications consume H1 and L2. The prefix separation is essential: adding an edge from H1 to an unsplit Fourier part that imports H1 would make a cycle. This packet records requests and a restructure proposal; it does not edit any supplier, the Fourier brief, or the atlas.

For the valuation base, the key elementary step is already grounded in Mathlib’s proper valuative criterion at 082e2d3. The generic inverse of a modification extends to a section over (\operatorname{Spec}V). The identity of (S) is then a finite surjection factoring through the modification. Pullback along that section, with coherent exchange-map composition, transfers the modification theorem to the original base. Lu–Zheng Example 4.26(2), p. 37, explicitly gives arbitrary base change on this basis.

The new oriented constructibility statement retains **finite presentation**. H0’s target is **locally finite type**. L2’s closed immersion into a finitely presented scheme does not, by itself, provide a constructible extension of a sheaf on a nonnoetherian closed subscheme. That bridge is a named gap. The public construction must not erase it by replacing finite type with finite presentation. Likewise the all-fibre (2d) bound in Orgogozo Proposition 2.3 is not quoted as H0’s generic-fibre-only bound.

## Generic extension and the Fourier supplier obligation

An AIC valuation base has algebraically closed fraction field (K). For separated finitely presented (X/V), write (j:X_K\to X). At arbitrary valuation rank this generic inclusion is a limit of quasi-compact opens; it need not be an open immersion. For the new extension package, fix a prime (\ell) invertible in (V), (r\geq1), and a commutative noetherian (\Lambda) with (\ell^r\Lambda=0).

Perfect-constructible means a finite constructible stratification on which the objects are locally constant perfect (\Lambda)-complexes. This is Hansen–Scholze setting (B), pp. 7–9. Constructible cohomology and finite Tor-amplitude are separate requirements. For example the constant (\mathbf Z/\ell) complex over (\mathbf Z/\ell^2) is constructible but does not satisfy this perfectness condition. General scheme ULA is quantified over every base change and every compatible geometric generization, as in Hansen–Scholze Theorem 4.4(iii), p. 22. Its definition belongs to the scheme cohomology supplier.

Theorem 4.1 of Hansen–Scholze, pp. 19–21, makes generic restriction an equivalence on the ULA perfect-constructible category, with inverse (Rj_*). Corollary 4.2, pp. 19–20, gives its flat AIC base change, relative duality and exterior-product compatibilities. These statements give information on the total scheme before applying (i^*). Flat base change of (Rj_*) is distinct from arbitrary nearby-cycle base change: the former retains flatness, and its closed-point specialization requires point preservation.

The proof uses a Gauss/relative-dimension induction under the AIC hypotheses. Divisibility of the value group and a separably closed residue field make the Gauss field’s tame quotient trivial; the residual finite extension is of (p)-power degree. Smooth-curve spreading and the prime-to-(p) trace produce ULA away from a finite special-fibre exceptional set. A proper compactification makes that exceptional set finite over the base. Hansen–Scholze Lemma 4.3, pp. 21–22, detects the remaining dualizability obstruction on its finite product by proper pushforward. The smooth-curve spreading assertion and the general finite-exception recognition lemma are exact supplier requests. The ambient recognition uses dualizability in the cohomological-correspondence category of setting (A). Proposition 3.4(iii), pp. 14–16, then gives perfect constructibility through compactness, descent and Lemma 3.5’s finite cohomological dimension, p. 16. A geometric ULA test on an arbitrary infinite constant module would not supply perfectness. This ambient recognition interface must agree with the perfect-constructible ULA category on their common domain. AIC does not prove the full general defectless calculation of Huber 4.2.10.

Hansen–Scholze Theorem 4.4, p. 22, proves the reverse implication from geometric/valuative ULA using Theorem 4.1 and Corollary 3.10. Thus the extension proof works first with ambient dualizability, then identifies that category with geometric ULA. Asking SF.2 for the reverse criterion as an early input would be circular. The precise prefix separation remains a supplier gap.

This handles the authorized portion of **RT-AREA-etale/15**. ABE/A10–A11 import L2’s existing cohomological, constructible-Hom and bounded-constructible-category continuity; those categories are not defined in a Fourier application. YANG–ZHAO/A07 imports this H1 generic-extension package. ABE/A14 is an extension on the normalization of a general coherent integral base in a geometric generic field. Such a base need not be a valuation spectrum. Its consumer must compare its extension with H1’s (Rj_*) after pulling to AIC valuation test schemes, and preserve constructibility, finite Tor-amplitude, units and base-change maps. H1 alone does not establish A14’s general-base theorem. Yang–Zhao v4 §6.4, p. 46, also extends over normalization of the whole curve and then descends to finite covers. The extracted A07 valuation theorem matches this packet, but the application’s arc descent, normalization comparison and finite-cover descent remain with its owner. Abe v2 Lemma 1.4 and Theorem 1.5, pp. 4–7, confirm the corresponding general-base boundary. The H1:valuation-exports request for the total extension needed by Hansen–Scholze Corollary 4.5 is answered by the same package.

## New declaration contracts

Each suffix below has the same stage prefix used in the imported table. Named declarations are suggestions for the implementation namespace `TauCeti.AlgebraicGeometry.ValuationNearby`. Source locators use the pinned public editions listed at the end. Proof steps refer to requested mathematical supplier contracts; none claims a library implementation.

### Valuation nearby cycles are the specified oriented-product shred

`oriented-shred-identification` · comparison · `orientedShred_identification`.

For the inherited quadruple Q=(X,Spec V,η,s), chosen separable closure L of κ(η) and compatible specialization of geometric points, restrict the general oriented-product nearby-cycle object RΨ_f F to its (s,η)-shred. There is a canonical natural isomorphism with the inherited tube-defined i*Rj*j*F on X_s, where j is the base change of S_(η̄)→S, not of η̄→S. Under this isomorphism, the general nearby exchange map restricts to the inherited nearby-cycles-base-change-map for each Cartesian morphism of quadruples; automorphisms of L restrict to the inherited Galois action.

- F lies in D⁺(X_et,Λ). No torsion or finite-type hypothesis is required for this identification.
- A geometric lift over s and a compatible geometric specialization η̄→s̄ are retained; when identifying with X_s, use that O_(S,s) is strictly henselian.

The proof/construction proceeds as follows.

1. Import H0’s quadruple, strict localization, morphism and tube construction without defining them again. The oriented-product site and its canonical derived-image functor are an early general-base supplier request, not a second trait nearby-cycle construction.
2. Use Lu–Zheng Lemma 4.1 to identify the s-slice with X_s times the strict localization at s; then Remark 4.2(a) identifies the η-shred with i*R(j_ηs)* applied to F on X_(η). The Milnor-tube stalk formula identifies this with H0’s j.
3. Compare the units and the pullback/direct-image exchange transformations, rather than comparing only the dimensions of stalk cohomology. Their mates are the same natural transformation; the chosen lift of strict localizations is essential.
4. Naturality for automorphisms of η̄ gives Galois equivariance. Remark 4.3 checks the identity specialization η=s.

Acceptance checks:

- For η=s, both sides are i*F and the unit is the identity after the canonical identification.
- For rank two and an intermediate η, use S_(η̄); replacing it by η̄ is a separate comparison theorem, not this definition.
- Changing the chosen embedding L→L′ conjugates the map by the inherited equivariant transport.

Sources: LZ-v7, §4.1, Lemma 4.1, Remark 4.2(a) and Remark 4.3, pp. 26–27.

### Universal Ψ-goodness over an arbitrary valuation spectrum

`valuation-universal-psi-goodness` · theorem · `valuation_universalPsiGoodness`.

Let S=Spec V for any valuation ring V, let n≥1 be a unit in V, let nΛ=0, and let f:X→S be a morphism of schemes. For F∈D⁺(X_et,Λ), the general oriented-product RΨ_f F commutes with every scheme base change h:T→S: the canonical exchange transformation h←*RΨ_f F→RΨ_(f_T)(h_X*F) is an isomorphism. No dominance, flatness, rank-one, discreteness, noetherianity or finite-presentation hypothesis on h or V is imposed. This is a valuation-specific theorem, not universal Ψ-goodness over arbitrary bases.

- A single n annihilates Λ and is invertible on S. For the stage’s hypothesis n invertible in κ(s), first replace S by Spec O_(S,s).
- F is bounded below. The unbounded case is outside this declaration.

The proof/construction proceeds as follows.

1. Use the actual proper valuative criterion at the pinned Mathlib to extend the inverse on the generic point of any modification r:S′→S to a section σ:S→S′. Thus the identity S→S is a finite surjective morphism factoring through r, even when V has arbitrary rank.
2. Apply precisely Lu–Zheng Example 4.26(2). Its reduction takes finite-presentation models and constructible ℤ/n sheaves by standard limits; L2 supplies these limit and filtered-coefficient operations. This is not approximation by discrete valuation rings.
3. The finite-presentation input is Orgogozo v1 Theorem 1.1: after a modification, canonical nearby cycles commute with all base changes. Request the early general-base Part II supplier of LPV.0, with de Jong 1997 Corollary 5.10 and the remaining geometry requested from an early SF.4 prefix. The ownership proposal and supplier proofs are open, and are not silently imported from L5.
4. Transport the universal exchange theorem along σ using the coherent identity/composition laws for exchange maps. Lu–Zheng’s cited [O] Lemma 3.3 uses published numbering; do not identify it with arXiv v1 §3.3. If desired, split-retract descent along σ proves this specialization directly.

Acceptance checks:

- A quotient V→V/𝔭 with prime 𝔭 need not be injective or flat; the canonical exchange is still an isomorphism.
- The identity of a rank-two valuation spectrum passes with no discrete uniformizer or DVR approximation.
- If n is not a unit in V, this theorem supplies no isomorphism.
- Use the canonical exchange map itself; existence of an unrelated isomorphism between the two objects is insufficient.

Sources: LZ-v7, §4.5, Example 4.26(2), p. 37; Org-v1, Theorem 1.1, p. 2; Remark 4.4, p. 13.

### Cartesian base change without dominance for valuation quadruples

`non-dominant-cartesian-base-change` · theorem · `valuation_cartesianBaseChange`.

For any Cartesian morphism φ=(g,h,ι):Q′→Q of the inherited valuation quadruples, let n≥1 be invertible in κ(s), nΛ=0 and F∈D⁺(X_et,Λ). Then the inherited map β_φ(F):g_s*RΨ_L(F)→RΨ_L′(g*F) is an isomorphism and is equivariant for the specified restriction homomorphism Gal(L′/κ(η′))→Gal(L/κ(η)). Neither injectivity of O_(S,s)→O_(S′,s′) nor dominance or flatness is required. This extends the dominant theorem imported from H0, using exactly its β, not a replacement comparison.

- h(η′)=η and h(s′)=s, and the embedding ι and local map of strict localizations belong to φ.
- Localize both bases at s,s′ before applying universal Ψ-goodness; n is then a unit on the source base.

The proof/construction proceeds as follows.

1. Use valuation-universal-psi-goodness for the localized source and arbitrary h. Non-dominant maps are covered before any generic-fibre or Galois reduction.
2. Apply oriented-shred-identification to the source and target slices. Its comparison of adjunction mates identifies the restriction of the general exchange with H0’s β_φ.
3. Use naturality with respect to σ′∈Gal(L′/κ(η′)) and the chosen embedding ι to obtain equivariance. The identity and composition of β are inherited unchanged.
4. For dominant φ this recovers H0’s valuative-base-change-for-nearby-cycles; it does not depend on the unread Gauss induction or claim a new proof of the wild defectless calculation.

Acceptance checks:

- For η=s and the residue map V→κ(s), choose η′=s′ and the compatible separable closures: β is ordinary special-fibre pullback and is the identity on the constant coefficient stalk.
- For a prime 𝔭⊊𝔪 of a strictly henselian rank-two V, h:Spec(V/𝔭)→Spec V is non-dominant; choose η=𝔭,s=𝔪 and matching generic/closed points upstairs. The map is covered.
- When g,h are identities, β is the inherited identity transformation.
- Two composable Cartesian maps, including a quotient followed by a residue-field extension, give the inherited composite β.

Sources: LZ-v7, Example 4.26(2), p. 37; Remark 4.2(a), pp. 26–27; Org-v1, Remark 4.4, p. 13.

### Universal Milnor tube–fibre comparison from a valuation base

`valuation-universal-milnor-fibre-comparison` · theorem · `valuation_universalMilnorComparison`.

Let V be a valuation ring, n≥1 invertible in V, f:X→Spec V of finite presentation and F∈Dᵇ_c(X_et,ℤ/n). After every scheme base change T→Spec V, for every geometric point x of X_T over a geometric point a of T and every compatible geometric generization b of a, the canonical restriction RΓ((X_T)_(x)×_(T_(a))T_(b),F_T)→RΓ((X_T)_(x)×_(T_(a))b,F_T) is an isomorphism. T need not itself be a valuation spectrum. Restricting to the inherited quadruple gives the actual unit-induced tube–fibre comparison, not merely isomorphic cohomology groups.

- Finite presentation and bounded constructible ℤ/n input are retained from Orgogozo v1 Theorem 5.1.
- The two strictly localized schemes and their map b→T_(b) are fixed by the compatible geometric specialization.

The proof/construction proceeds as follows.

1. Request Orgogozo v1 Theorem 5.1 with its uniform through-degree-N statement and every subsequent base change. It is supplied by the same early general-base Part II proof as Theorem 1.1, not by a valuation-as-trait reduction.
2. Apply the section of its modification over Spec V. Pullback along the section, and then along every T→Spec V, transfers the cohomological-properness conclusion to the original family with its canonical restriction map.
3. Do not promote an unbounded statement from one truncation. Proposition 2.3 gives a uniform bound 2d using a bound d for all fibre dimensions of the finite-presentation f; finite amplitude of F and the geometric-fibre cohomological bound reduce the isomorphism to finitely many degrees, to which the through-degree-N theorem applies.
4. The Milnor-tube stalk formula and oriented-shred-identification identify this map with H0’s comparison-with-geometric-generic-point in the finite-presentation, constructible ℤ/n case. Extending to the full locally finite type and arbitrary-coefficient H0 statement requires the separately recorded continuity/presentation bridge.

Acceptance checks:

- For b=a, both sides restrict to the same geometric stalk.
- If b is a generic geometric point of a valuation spectrum, T_(b)=b and the restriction is already the identity.
- At an intermediate prime of a rank-two valuation ring the comparison has nontrivial content; do not identify the schemes T_(b) and b.
- A uniform bound on all fibre dimensions is used here; Proposition 2.3 is not cited as a bound in terms of the generic fibre alone.

Sources: Org-v1, Theorem 5.1 and proof, pp. 14–15; Proposition 2.3, pp. 3–4; Ill06, Theorem 3.2 and Remark 3.3(c), p. 7.

### Constructibility of oriented nearby cycles over valuation bases

`valuation-oriented-constructibility` · theorem · `valuation_orientedConstructibility`.

Let V be any valuation ring, n≥1 invertible in V, B a noetherian ring with nB=0 and f:X→Spec V of finite presentation. For F∈D_c(X_et,B)∩D⁺(X_et,B), the general oriented-product RΨ_f F has constructible B-module cohomology: each stalk is finitely generated over B and, for each cohomology sheaf, there are finite constructible locally closed partitions of X and Spec V on whose oriented products it is locally constant. In particular its (s,η)-shred is constructible on X_s. If F is bounded, RΨ_f F is bounded constructible, using the uniform all-fibre cohomological-dimension bound. This declaration does not identify finite type with finite presentation.

- Noetherian B can be infinite, e.g. 𝔽_ℓ[t]; finite B-modules do not mean finite underlying abelian groups.
- The bounded-below restriction agrees with this packet’s ambient derived carrier. The published source permits a larger D_c input.

The proof/construction proceeds as follows.

1. Use valuation-universal-psi-goodness with coefficients B. This gives Ψ-goodness without requiring B to be finite as an abelian group.
2. Apply Lu–Zheng Theorem 4.27(2) to this Ψ-good finite-presentation pair. Its proof on pp. 37–38 explicitly generalizes Orgogozo from ℤ/n to noetherian B by using constant constructible B-modules in place of the constant coefficient ring and by coherent conservative descent.
3. The supplier must include Orgogozo v1 §8.1 proper oriented pushforward and §8.2 induction: proper-hypercover descent reduces to plurinodal families; the smooth part is locally acyclic, the singular locus of a semistable curve is finite, and proper pushforward detects constructibility there.
4. Pull the constructible oriented object back to the specified shred via oriented-shred-identification. On the finite-type special fibre over κ(s), the induced constructible partition has finite, locally constant B-module stalks.
5. For bounded F use Proposition 2.3’s uniform all-fibre bound. Keep H0’s locally finite type constructibility target as imported, with its finite-type/presentation proof bridge recorded separately; finite-presentation general-base constructibility alone does not close that larger target.

Acceptance checks:

- For B=𝔽_ℓ[t], f=id, and F=B, the output stalk is B, which is constructible over B and is infinite as an abelian group.
- For η=s the shred is i*F, with its inherited constructibility.
- For a semistable curve, the smooth locus and the finite nodal locus must both be treated; local constancy on the smooth locus alone does not prove constructibility.
- For a locally finite type morphism which is not finitely presented, the statement is not invoked; use the inherited target and its recorded bridge gap.

Sources: LZ-v7, Theorem 4.27(2), definition and proof, pp. 37–38; Org-v1, Theorem 6.1, p. 16; §8.1–8.2, pp. 19–22.

### Generic restriction and extension over an absolutely integrally closed valuation ring

`aic-generic-extension-equivalence` · construction · `aicGenericExtensionEquivalence`.

Let V be a valuation ring with algebraically closed fraction field K (hence V is absolutely integrally closed), let ℓ be a prime invertible in V, let r≥1 and Λ be a commutative noetherian ring with ℓʳΛ=0. For separated finitely presented f:X→Spec V and j:X_K→X, generic restriction is an equivalence from the full category of perfect-constructible universally locally acyclic complexes over Spec V to the category of perfect-constructible complexes on X_K. Its specified inverse is Rj*. In particular, Rj*F is constructible, has finite Tor-amplitude and is ULA over Spec V; these are separate conclusions. The unit A→Rj*j*A and counit j*Rj*F→F are the canonical adjunction maps. The construction uses the existing étale derived/coefficient carriers, extended to qcqs schemes, and the general scheme ULA predicate requested from SF.2.

- Perfect-constructible means a finite constructible stratification with locally constant perfect Λ-complexes on each stratum, as in Hansen–Scholze setting (B).
- ULA is the scheme notion quantified over all base changes and geometric generizations; neither diamond ULA nor mere local acyclicity replaces it.
- Finite presentation and separatedness of f are essential in this declaration. Generic inclusion j is not assumed to be an open immersion at arbitrary rank.

The proof/construction proceeds as follows.

1. Work first with the full subcategory of ambient correspondence-dualizable objects, Hansen–Scholze’s definition of ULA. Proposition 3.4(iv) gives the canonical unit A→Rj*j*A an isomorphism for those objects. At arbitrary rank the generic point is an affine-transition limit of quasi-compact opens; use the listed L2 continuity contracts. Do not use Theorem 4.4’s reverse implication to start this argument.
2. For essential surjectivity, follow Theorem 4.1’s induction on relative dimension. Project an affine chart to A¹_V and pass to a strictly henselized Gauss valuation W at a generic point of the special fibre. Import the arbitrary-value-group Gauss carrier and tame quotient from H0. Since Γ_V is divisible and the residue field of W is separably closed, its tame quotient is trivial and its absolute Galois group is pro-p (trivial in residue characteristic zero). This specialized argument does not establish Huber’s general defectless/Galois-surjectivity theorem.
3. Pass to an absolute integral closure of W, apply induction, and spread out from a finite p-power subextension. The needed assertion that this extension is the strict localization of a smooth curve over V, together with the finite cover and trace, is a precise SF.4 supplier request. Its full proof is not replaced by de Jong 5.10 alone. Prime-to-p coefficients make this p-power trace split; Orgogozo’s unrelated proper-hypercover descent did not require such degree invertibility.
4. The spreading argument gives ULA away from a closed subset with finite special fibre. Import the L2 finitely presented compactification and extend generic coefficients by zero; for a proper family the exceptional closed subset is finite over Spec V.
5. Apply Hansen–Scholze Lemma 4.3: the dualizability obstruction is supported on the finite product of exceptional loci; proper direct image is conservative there, and the pushforward is locally constant perfect. This general recognition lemma and the early ambient ULA stability inputs belong to SF.2. It proves ULA including the exceptional points and yields perfect constructibility. Here ambient ULA means dualizability in the cohomological-correspondence category of setting (A); a geometric ULA stalk test alone does not make an arbitrary ambient object perfect. Use Proposition 3.4(iii), with Lemma 3.5’s finite cohomological dimension and the descent/compactness argument, to obtain perfect constructibility.
6. First package restriction and Rj* on the ambient dualizable category with the actual unit/counit and triangle identities. Only then apply the proof of Hansen–Scholze Theorem 4.4, p. 22: Proposition 3.4 supplies the forward implications, Corollary 3.10 reduces the reverse implication to rank-one AIC valuation tests, and the already established ambient extension theorem identifies the unit on those tests. SF.2 owns this later geometric/valuative ULA comparison. Transport the equivalence to the geometrically defined perfect-constructible ULA category. EDS supplies the enhancement; Mathlib Equivalence is the homotopy-category carrier.

The API is derived from total-cohomology invariance and the A07/A14 consumers.

| Name | Contract |
|---|---|
| `aicGenericExtensionEquivalence_functor` | The forward functor is the actual generic restriction j* on ULA complexes. |
| `aicGenericExtensionEquivalence_inverse` | The inverse is the ULA lift of the actual Rj* on perfect-constructible generic complexes; forgetting ULA gives Rj*. |
| `aicGenericExtension_unit` | On every ULA object A the unit A→Rj*j*A is an isomorphism, with the same unit as pullback/direct-image adjunction. |
| `aicGenericExtension_counit` | For every perfect-constructible generic F the counit j*Rj*F→F is an isomorphism; the unit and counit satisfy both triangle identities. |
| `aicGenericExtension_perfectConstructible` | The underlying total-scheme object of the inverse lies in the imported perfect-constructible category, giving constructible cohomology and finite Tor-amplitude separately. |

Its four unit tests pin the inverse and its domain.

- `aicGenericExtension_zero`: Rj* of the zero generic object is the zero total object, also in the ULA category.
- `aicGenericExtension_field`: For V=K an algebraically closed field, the canonical adjunction unit is an isomorphism on every perfect-constructible X-complex, because j is the identity up to the canonical generic-fibre identification.
- `aicGenericExtension_recovery`: Generic restriction of the inverse applied to F is canonically isomorphic to F, through the actual adjunction counit.
- `aicGenericExtension_supported_ULA`: If A is ULA and j*A is zero, then A is zero. This excludes a nonzero complex supported entirely on the special fibre from the domain.

Acceptance checks:

- The output is perfect-constructible on the total X, not just constructible after restricting to X_s.
- For a field V=K algebraically closed, restriction and Rj* identify with identity on the perfect-constructible category.
- ULA objects are recovered by the canonical unit; a complex supported only on the closed fibre cannot be ULA unless it is zero.
- For Λ=ℤ/ℓ² the constructible constant ℤ/ℓ complex need not be perfect; it is not an admissible generic input merely because its stalks are finite.

Sources: HS, §2, setting (B), pp. 7–9; Proposition 3.4(iii)–(iv) and Lemma 3.5, pp. 14–16; Corollary 3.10, p. 18; Theorem 4.1, Lemma 4.3 and Theorem 4.4, pp. 19–22.

### Consumed API lemmas

Protocol §4 gives three used API facts their own nodes, with the same hypotheses as `aic-generic-extension-equivalence`. Their suggested names already occur in the construction API; they are not duplicate declarations.

`aic-generic-extension-inverse` · lemma · `aicGenericExtensionEquivalence_inverse`. Under the exact hypotheses of aic-generic-extension-equivalence, composing its inverse with the inclusion of ULA objects into D⁺(X,Λ) is canonically naturally isomorphic to Rj* composed with the inclusion of perfect-constructible generic objects. The proof applies the corresponding interface of the constructed equivalence and the common inclusions. Source: Hansen–Scholze Theorem 4.1, pp. 19–21.

`aic-generic-extension-unit` · lemma · `aicGenericExtension_unit`. Under the exact hypotheses of aic-generic-extension-equivalence, for every perfect-constructible ULA object A the canonical pullback/direct-image adjunction unit A→Rj*j*A is an isomorphism. The proof applies the corresponding interface of the constructed equivalence and the common inclusions. Source: Hansen–Scholze Theorem 4.1 and full-faithfulness proof, pp. 19–20.

`aic-generic-extension-perfect-constructible` · lemma · `aicGenericExtension_perfectConstructible`. Under the exact hypotheses of aic-generic-extension-equivalence, Rj* of every perfect-constructible generic F belongs to the imported perfect-constructible category on total X: it has constructible cohomology and finite Tor-amplitude. The proof applies the corresponding interface of the constructed equivalence and the common inclusions. Source: Hansen–Scholze Corollary 4.2(i), pp. 19–20.

Flat base change, duality and Künneth cite these inverse, unit and perfectness nodes directly. The inherited-nearby comparison cites the inverse node and applies it to j*F on total-scheme input.

### Flat AIC valuation base change for generic extension

`aic-generic-extension-flat-base-change` · theorem · `aicGenericExtension_flatBaseChange`.

In the hypotheses of aic-generic-extension-equivalence, let V→W be a flat map to another absolutely integrally closed valuation ring, let L=Frac W, X_W=X×_V W, and let g:X_W→X and g_K:X_L→X_K be the canonical maps. For F perfect-constructible on X_K, the canonical derived exchange g*Rj*F→Rj_W*(g_K*F) is an isomorphism on the total scheme X_W. Flatness, rather than faithful flatness, is sufficient here. The induced nearby-cycle comparison on the closed fibres additionally needs a local/faithfully flat map carrying the closed point to the closed point.

- Both valuation fraction fields are algebraically closed. The generic fibre maps exist by injectivity of the flat map of domains.
- No claim of total-scheme generic-extension base change along arbitrary nonflat maps is made; the earlier arbitrary nearby-cycle theorem has a different target.

The proof/construction proceeds as follows.

1. ULA is stable under arbitrary scheme pullback, so g*Rj*F is ULA over Spec W. The generic restriction is g_K*F.
2. Apply the W generic-extension equivalence: the canonical unit identifies this object with Rj_W*g_K*F. Identify the unit-induced map with the exchange map by the adjunction-mate comparison requested from SF.2.
3. For closed-fibre nearby cycles, use the inherited fibre square only when the map preserves the specified special point. This separates flat base change of Rj* from faithful-flat closed-fibre transport.

Acceptance checks:

- For V=W the exchange is the identity.
- A localization V→V_𝔭 is flat and is allowed on total schemes; it need not preserve the old closed point.
- A quotient V→V/𝔭 is covered by arbitrary nearby base change but is not an input to this flat Rj* theorem.

Sources: HS, Corollary 4.2(ii) and proof, pp. 19–20.

### Generic extension and relative Verdier duality

`aic-generic-extension-relative-duality` · theorem · `aicGenericExtension_relativeDuality`.

For the same separated finitely presented X over an AIC valuation V and perfect-constructible torsion coefficients Λ, let D_X/V(A)=RHom_Λ(A,Rf!Λ_V), using the common relative-duality supplier. For F on X_K, the canonical comparison D_X/V(Rj*F)≅Rj*(D_X_K/K F) is a natural isomorphism. Relative duality and its base-change comparison are those of the common scheme supplier. Passing to X_s gives the corresponding nearby-cycle duality comparison, with the specified relative-duality identifications; no arbitrary base-change compatibility of Verdier duality on non-ULA objects is asserted.

- Use perfect-constructible generic F, the prime-power coefficient hypotheses and AIC base of the equivalence.
- This is relative duality over Spec V, not an absolute duality based on an unspecified dualizing complex.

The proof/construction proceeds as follows.

1. Import stability of perfect-constructible ULA objects under relative Verdier duality and its restriction/base-change formula from the scheme ULA/duality suppliers.
2. Both D_X/V(Rj*F) and Rj*(D_X_K/K F) are ULA and have canonically identified generic restrictions. Full faithfulness of generic restriction identifies them by the required natural comparison.
3. On the special fibre use the base-change formula for relative duality of a ULA object. The generic-extension equivalence alone does not supply that formula.

Acceptance checks:

- For X=Spec V the formula is derived Λ-module duality of a perfect complex.
- The comparison preserves shifts and the supplier’s Tate-twist convention.
- Finite stalks without finite Tor-amplitude do not satisfy the input convention.

Sources: HS, Corollary 4.2(iii) and proof, pp. 19–20.

### Künneth formula for AIC generic extension

`aic-generic-extension-kunneth` · theorem · `aicGenericExtension_kunneth`.

Let X,Y be separated finitely presented over the same AIC valuation V, with the same coefficient hypotheses, and let F,G be perfect-constructible on X_K,Y_K. On (X×_V Y), the canonical exterior-product map Rj_X*F ⊠^L_Λ Rj_Y*G→Rj_(X×Y)*(F⊠^L_Λ G) is an isomorphism. All exterior products use the imported derived tensor and the two scheme projections, and the product remains separated finitely presented.

- Perfect-constructible factors; derived tensor is used even when coefficients are not a field.
- The product is over V on total schemes and over K on generic fibres.

The proof/construction proceeds as follows.

1. The scheme ULA supplier gives stability under exterior derived products, so the left side is ULA over V.
2. Generic restriction commutes with derived tensor and identifies the generic object with F⊠^L G.
3. The unit of the product’s generic-extension equivalence identifies the two objects; compare this unit map with the canonical Künneth transformation rather than choosing an unspecified product isomorphism.

Acceptance checks:

- One factor Spec V with generic coefficient unit gives the unit constraint.
- If either generic factor is zero, both sides vanish.
- With Λ=ℤ/ℓ² use derived tensor; replacing it by degreewise ordinary tensor can change the complex.

Sources: HS, Corollary 4.2(iv) and proof, pp. 19–20.

### AIC generic extension recovers the inherited valuation nearby object

`aic-nearby-extension-identification` · comparison · `aicNearby_extensionIdentification`.

For an AIC valuation V and separated finitely presented X/V, take the inherited quadruple with η the generic point and s the closed point. Then κ(η)=K is algebraically closed, its chosen separable closure can be identified with K, and S_(η̄)=Spec K. For a total-scheme perfect-constructible F, the inherited RΨ_L(F)=i*Rj*j*F identifies canonically with i* applied to the underlying total object of the generic-extension inverse evaluated on j*F. This comparison preserves the specialization unit, canonical base-change maps whenever their diagrams are defined, and the inherited (now trivial) Galois action. It reconciles the stronger Rj*/ULA theorem with special-fibre constructibility without identifying the two assertions.

- η is generic for this comparison; an intermediate η uses the separate Milnor tube–fibre comparison.
- F is perfect-constructible, not just an arbitrary constructible B-module complex.

The proof/construction proceeds as follows.

1. Use the imported strict-localization and nearby-cycle definitions. Since K is algebraically closed, strict localization at the generic geometric point is Spec K.
2. Apply the promoted inverse lemma to j*F using the perfect-constructible pullback and its compatible inclusion, then apply i*. The comparison is a natural isomorphism from perfect-constructible objects on total X to D⁺(X_s,Λ).
3. Compare units, counits and exchange mates from the common SF.2 derived-functor supplier; all maps are canonical. The absence of Galois ambiguity here is a consequence of algebraic closedness.
4. Record the downstream contract: PAPER-YANG-ZHAO-25/A07 imports this total extension package. PAPER-ABE-25/A14 treats normalization of a general coherent integral base in a geometric generic field and must prove a comparison after pulling to AIC valuation test schemes; this H1 theorem alone does not prove A14 over a nonvaluation base. ABE/A10–A11 import the exact L2 continuity nodes.

Acceptance checks:

- For X=Spec V and F=Λ_X both constructions give Λ on the closed point and specialization fixes 1.
- For V an algebraically closed field, η=s and this becomes identity restriction.
- An AIC valuation of rank greater than one is allowed; its generic inclusion is not relabelled as an open immersion.
- The H1→GeneralBasesFourier edge carries a comparison obligation on A14; it is not a claim that every absolute integral closure is a valuation ring.

Sources: HS, Corollary 4.2, pp. 19–20; LZ-v7, Remark 4.2(a), pp. 26–27.

## Acceptance of the stage and the suggested file

The stage-level acceptance includes a non-dominant quotient of a rank-two valuation base, the identity specialization, a genuine intermediate-point Milnor comparison, an infinite noetherian coefficient ring, and a total-scheme AIC extension with a finite-Tor check. The actual unit/exchange/restriction maps must pass these tests. A theorem about isomorphic stalk dimensions does not satisfy the map contracts.

The new construction has five named API items and four unit tests, all present in the suggested file. H0’s imported definitions retain their own APIs/tests. The zero generic complex, field case, recovery by the actual counit and exclusion of a nonzero special-supported ULA object test the generic-extension inverse and its domain. Additional acceptance distinguishes constructibility from perfectness and flat total extension from arbitrary nearby base change.

The suggested file imports individual Mathlib modules and elaborates at pinned Mathlib 082e2d3 through `lean-check`, with only admitted-proof warnings. Its derived category and scheme/fibre morphisms are native. The labelled supplier types and functors remain declarations to construct: oriented modules, perfect-constructible and scheme ULA full subcategories, strict localizations, pullback/direct image, canonical Milnor restriction and relative duality. The constructibility signature now uses the requested bounded-below constructible category; its bounded-output refinement remains in the mathematical contract. The nearby comparison includes total input and j*, and duality asserts invertibility of the supplied canonical comparison. Continuous equivariance, enhanced equivalence, and all map-coherence equations remain mathematical contracts in this reader and the packet. No missing condition is encoded as an arbitrary proposition field.

Four new planet nominations are made: Universal valuative base change, Milnor tube–fibre comparison, Constructible valuative nearby cycles, and Valuative generic-extension equivalence. H0 already nominates six planets in this stage. Assembly must select at most six across both packets: keep the quadruple and tube-defined nearby construction, use the new universal-base-change, universal-Milnor, source-qualified constructibility and generic-extension nominations, and omit the Gauss-valuation nomination from this star. This reconciles overlapping nominations without editing H0.

## Recorded frontiers and continuation

The complete planning pass records six gaps and six supplier requests. Coverage is **planned**, not closed. A continuation must specify the early ambient ULA inputs and later geometric comparison without a reverse-criterion cycle; reconcile and accept the early alteration/general-base supplier splits; establish the locally finite type versus finite presentation reduction with constructible coefficients and canonical maps; verify the exact Huber conventions and original henselian/Gauss/wild/curve proof inputs from a cleared or faithful public source; and construct the requested derived, perfect-constructible, ambient-recognition, ULA, smooth-curve spreading and duality interfaces. The packet’s `gaps`, `requests` and `coverage.remaining` give exact consumers and statements.

The public arbitrary-base-change result is now represented without a dominance hypothesis and with an explicit early-geometry owner request. The source-qualified finite-presentation constructibility theorem and the AIC total-extension theorem are fully specified planning outputs. Their supplier existence is not a claim that the stage is proof-closed.

## Sources and baseline

All results above are in the worker’s own words. No passage of a source is stored in the repository. Source hashes and access date 2026-10-08 are in the packet.

- **LZ-v7:** Qing Lu and Weizhe Zheng, [Duality and nearby cycles over general bases, arXiv:1712.10216v7](https://arxiv.org/pdf/1712.10216v7). Lemma 4.1 and Remarks 4.2–4.3, pp. 26–27; Example 4.26(2), Theorem 4.27 and proof, pp. 37–38.
- **Org-v1:** Fabrice Orgogozo, [arXiv:math/0507475v1](https://arxiv.org/pdf/math/0507475v1). Theorems 1.1, 5.1 and 6.1; Proposition 2.3; §§3–4 and 7–8, with the printed arXiv pagination. The publication has different numbering; Lu–Zheng’s published-source locators are not substituted for v1’s.
- **dJ97:** A. Johan de Jong, [Families of curves and alterations](https://www.numdam.org/item/10.5802/aif.1575.pdf), Annales de l’Institut Fourier 47 (1997), 599–621. Situation 5.8 and Theorem 5.9, pp. 615–617; **Corollary** 5.10, p. 618. The inherited “Theorem 5.10” label is a roadmap locator error, not an erratum in de Jong’s source.
- **Ill06:** Luc Illusie, [Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), author PDF dated 9 April 2006. Theorem 3.2 and Remark 3.3(c), pp. 6–7; §§4.1–4.3, pp. 8–10.
- **ABE-v2:** Tomoyuki Abe, [arXiv:2405.19601v2](https://arxiv.org/pdf/2405.19601v2), Lemma 1.4, pp. 4–5, and Theorem 1.5, pp. 5–7, checked for the general-base supplier boundary.
- **YZ-v4:** Enlin Yang and Yigeng Zhao, [arXiv:2209.11086v4](https://arxiv.org/pdf/2209.11086v4), §6.4, p. 46, checked for normalization and descent in the application.
- **HS:** David Hansen and Peter Scholze, [Relative perversity](https://people.mpim-bonn.mpg.de/scholze/RelativePerverse.pdf), the 38-page author PDF. Setting (B), pp. 7–9; Proposition 3.4 and Lemma 3.5, pp. 14–16; Theorem 4.1, Corollary 4.2, Lemma 4.3 and Theorem 4.4, pp. 19–22.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The accepted AUDIT-18 entry marks this stage not built and distinguishes its existing valuation/inertia primitives from nearby cycles and general-valued-field wild/tame theory. The seven pinned Mathlib declarations read for this pass are the proper valuative criterion, `ValuationRing`, the small étale topology, `DerivedCategory`, `HasDerivedCategory`, `DerivedCategory.Plus` and `CategoryTheory.Equivalence`. Searches of the full Tau Ceti tree at f790474 found no exact plurinodal/Orgogozo/nearby/ULA/alteration supplier. Their detailed baseline records are in the packet; native properness and derived categories are not re-planned as new mathematics.

Independent review accepted this complete planning pass on 8 October 2026, with four original nodes verified, six corrected and three API nodes added. The [review report](../reviews/REV-ClassicalAdicEtaleCohomology--H1-valuation-nearby-cycles.md) records source checks, baseline evidence, corrections and supplier questions. Acceptance retains every explicit gap; it asserts no formalization.
