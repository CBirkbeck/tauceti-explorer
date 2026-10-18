# Stable compactifications and Torelli

## MC.6 — scope and conventions

This layer connects stable curve moduli to the Siegel minimal compactification.
Its geometric output is a stable extension after a finite cover of the base,
a full-level smooth Torelli morphism with its actual universal Jacobian, and
a compactified coarse Torelli morphism whose Hodge pullback proves nefness
and bigness under maximal variation. The generalized Jacobian at a nodal
curve supplies the boundary comparison. Arithmetic bigness over Spec Z,
archimedean metrics, a universal stable curve on a coarse space, and a full
level structure on every nodal Jacobian are outside these statements.

Fix genus g≥2. A stable family means a proper flat finitely presented family
of geometrically connected nodal curves of arithmetic genus g, with relatively
ample dualizing sheaf, in the sense imported from StableReduction. Write
M̄_g for the stack, M̄_g^coarse for its coarse space, and M_g for the smooth
open. The rank-g Hodge bundle is E=f_*ω; λ=det E is its invertible determinant.
Neither E nor λ is a pluricanonical direct image. A generalized Jacobian can
have a torus part of positive rank while its invariant-differential bundle
still has rank g.

Full level means a symplectic trivialization of Jacobian N-torsion for N≥3,
with N invertible. The pairing is fixed by a chosen primitive Nth root of
unity. Both fine spaces live over B_N=Spec Z[1/N,ζ_N]. A coarse ppav point
is distinguished from an abelian scheme with its polarization and level.
Use the latter object to define the classifying map and the Cartesian square.
Every assertion about arbitrary test-scheme pullback includes nonreduced test
schemes and the identity/composition comparison isomorphisms.

For a projective integral scheme X over a field, nef and big are the generic
SF.5 notions: nef tests nonnegative degrees on integral curves; big tests
maximal asymptotic section growth. Positivity of the top self-intersection
is used only with nefness. The generic field degree in intersection formulas
includes inseparable degree. Dimension zero is included.

## Imported objects and their diagnostic checks

The accepted MC.6 definitions keep their original identifiers. The targets
below refine their supplier compositions rather than introduce competing
objects.

**Stable compactification** (`MC.6/stable-compactification`). For an integral
quasi-projective S over B=Spec Z or a field and a smooth genus-g family C/S,
the data consist of an integral projective B-scheme S̄, an open immersion
S→S̄, a stable family C̄/S̄, and an isomorphism C̄|S≅C. Existence is asserted
after a finite surjective base cover, not necessarily over the given S.
`stable-input-compactification` strengthens the input range to an already
stable, possibly generically nodal family, and supplies a normal output.

The imported API exposes the open base, stable extension, restriction
isomorphism and pullback of that family. It must not claim arbitrary
base-change compatibility for the chosen normalization: relative
normalization does not in general commute with arbitrary base change.
Checks: a constant stable C₀ over A¹ extends to C₀×P¹; its base has
dimension1 even when the moduli image is a point. A constant nodal stable
C₀ is accepted by the strengthened existence target. A proper base with a
smooth stable family already has the identity compactification. A choice
of projective ambient scheme or finite cover is data, not a uniqueness theorem.

**Maximal variation** (`MC.6/maximal-variation`). For an integral finite-type
S over a field and a smooth genus-g family, the coarse curve classifying
map S→M_g^coarse is generically quasi-finite onto its image. The definition
is invariant under family isomorphism and restriction to a dense open; a
generically finite dominant change of base preserves it. It is a condition
on curve isomorphism classes, not on a frame torsor or on level choices.
Checks: a constant family over a positive-dimensional S fails; a family
parametrized by an integral curve mapping generically finitely into M_g^coarse
passes; a zero-dimensional integral base passes. Adding a positive-dimensional
parameter on which the curve does not vary makes the definition fail.

**Graph closure retaining the base** (`MC.6/graph-closure`). Choose a projective
B-compactification S̄₀ and the MC.4 projective finite cover V→M̄_g of the
stack. The scheme W=S×_{M̄_g}V remembers an isomorphism of stable families,
not just their coincident coarse points. Choose W₀ dominating S and put
L=K(W₀). Close its finite image in S̄₀×_B V, obtaining integral D, and
normalize D **in L**. This gives S̄′. Over S it recovers S′, the normalization
of W₀, with its finite surjective map to S. The pullback of the universal
stable curve on V has the required restriction isomorphism.

The imported API has both projections, the finite map to the original base,
the retained generic-field identification, and the stable-family restriction
isomorphism. Its checks distinguish three errors: a constant family on A¹
must not acquire a zero-dimensional compactification; a nontrivial
isomorphism-field extension must survive normalization; and W→S×V need not
be a monomorphism. A quadratic twist as in the first target below tests the
field extension. The native scheme milestone in the suggested file uses the
existing pullback map and its two projections: a map finite over S remains
finite as a map into S×_B V when V→B is separated. This is an instance of
Mathlib's `AlgebraicGeometry.IsFinite.of_comp`, not a new finite-morphism theory.

Apply this construction to the MC.4 fine full-level universal curve to get
the imported `MC.6/level-stable-compactification`. The boundary remembers a
stable family extending the smooth fine-level family. It does not assert
a prime-to-characteristic symplectic trivialization of the full generalized
Jacobian torsion at every nodal fibre.

Source locators for these imports: Yuan, author manuscript 21 August 2024,
§3.1.4, pp.45–46; the parent graph-closure correction is retained. Generic
finite normalization is supplied by the exact SF.0 target below.

## Supplier boundaries

The following are imports, not definitions to implement again in this layer.
The common prefix `StableReductionPartII:` is omitted from MC references;
all other identifiers are written in full in the target prerequisites.

| Object or theorem | Exact supplying target |
| --- | --- |
| Stable moduli atlas and finite diagonal | MC.1/hilbert-quotient, /smooth-dimension, /finite-unramified-diagonal |
| Dense smooth locus and regular atlas components | MC.1/normal-crossing-boundary; SchemeAndStackFoundations:SF.0/noetherian-normal-components |
| Finite normalization in a finite generic field extension | SchemeAndStackFoundations:SF.0/nagata-normalization-finite |
| Projective stable-family cover, fine smooth level, level rigidity | MC.4/finite-projective-cover, /fine-level-scheme, /full-level, /level-rigidity |
| Relative Picard Jacobian, arbitrary pullback and principal polarization | JacobianChallengePartII:JC1/relative-jacobian, /jacobian-base-change, /principal-polarization |
| Lie–R¹O, rank-g Hodge and determinant comparisons | JacobianChallengePartII:JC6/picard-lie-cohomology, /curve-jacobian-hodge-bundles, /hodge-line-isomorphism |
| Stable generalized Jacobian and graph exact sequence | NeronModelsAndSemistableAbelianVarieties:R11.4/stable-family-picard, /normalization-exact-sequence, /characters-graph-homology |
| Hodge bundle and determinant on curve stacks | MC.5/hodge-bundle, /hodge-determinant |
| Finite locally free determinant with coherent pullback | Existing TauCetiRoadmap AlgebraicVectorBundles L0C, through MC.5 |
| Fine Siegel classifying family | PELModuli:M5/siegel-moduli; M6/universal-family-export; M6/quasi-projective-realization for the good-base scheme realization |
| Early semiabelian carrier, invariant differentials | ShimuraCompactifications:C4/roadmap/semi-abelian-scheme |
| Minimal space and positive Hodge power | ShimuraCompactifications C5: existing integral targets plus the all-characteristic Siegel extension request below |
| Coarse factorization and sheaf/algebraic-space descent | MC.4/coarse-space; SchemeAndStackFoundations:SF.1/coarse-moduli-space, /qcoh-fpqc-descent, /space-fppf-descent |
| Numerical positivity and degree | SchemeAndStackFoundations:SF.5/nef-big, /big-line, /nef-big-numerical, /chow-proper-push, /chern-projection, /degree |

The regular-component criterion and finite-normalization theorem now have
exact supplier nodes. In particular, regularity of the fine moduli scheme
does not require proving geometric irreducibility first. Quasi-compactness
and Noetherian normality give finitely many integral open-and-closed
components. Determinants use the current AlgebraicVectorBundles roadmap;
they are not added to scheme foundations here.

## Target statements, APIs and checks

Each target has the namespace `TauCeti.ModuliCurves` and is a planning target,
not a claim of implementation. For target IDs the prefix is
`StableReductionPartII:MC.6/`. The exact prerequisite lists make the
supplier obligations visible. Source references below use the versions
listed in the bibliography; all statements and proof outlines are paraphrases.

### 1. Stable compactification of a stable input family

**Target:** `stable-input-compactification`.

Let B be Spec Z or Spec k for an arbitrary field k, S an integral quasi-projective B-scheme and C→S a stable genus-g family, g≥2. There exist a normal integral scheme S′, a finite surjective map p:S′→S, an open immersion j:S′→S̄′ with S̄′ normal integral projective over B, and a stable family C̄′→S̄′ whose restriction is isomorphic to C×_S S′. The construction preserves an already nodal family; smooth generic fibre is not required.

**Hypotheses and conventions.** Integral means reduced and irreducible; finite type is included in quasi-projective. A compactification is over the same B. The finite projective cover V→M̄_g is a representable finite surjective map to the stack, carrying the universal stable family.

**Prerequisites.** `StableReductionPartII:MC.6/graph-closure`; `StableReductionPartII:MC.4/finite-projective-cover`; `StableReductionPartII:MC.1/finite-unramified-diagonal`; `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; `mathlib:AlgebraicGeometry.IsFinite.of_comp`; `mathlib:CategoryTheory.Limits.pullback.lift`.

**Construction or proof.**

1. Choose a projective B-compactification S̄₀. In W=S×_{M̄_g}V choose a reduced irreducible component W₀ dominating S. Its field L=K(W₀) is finite over K(S).
2. The stack diagonal is finite, so W→S×_B V is finite, not generally a monomorphism. Let D be the integral reduced closure of its W₀-image in S̄₀×_B V. Define S̄′ to be the normalization of D in L.
3. D is excellent and Nagata. The exact SF.0 finite-normalization target gives a finite S̄′→D, hence projectivity. Over S the result is the normalization of W₀, with a finite surjective map to S. Both normalizations use L; normalization in K(D) can discard isomorphism data.
4. Pull the stable universal curve on V to S̄′. The defining stack fibre product supplies the isomorphism on S′. None of these steps uses smoothness of the initial family.

**Sources.** Yuan2024, §3.1.4, p.45. Stable extension after a finite cover; use the accepted correction retaining the base and the finite-cover function field, rather than closing only the moduli image.

**Acceptance checks.**

- For C=C₀×A¹ with fixed stable C₀, S̄′ has dimension1. Closing only the point [C₀] does not pass.
- Over a field of characteristic≠2, a quadratic twist of a genus2 curve with automorphism group {±1} can become isomorphic to the original curve only over a quadratic field L. The corresponding isomorphism component in the stack fibre product has field L, while its image point has the smaller field. The normalization must retain L.
- For a stable C₀ with a node, the constant family over A¹ is accepted; no smooth-generic restriction is introduced.

### 2. Full-level Torelli by the relative Jacobian

**Target:** `torelli-family-composition`.

Fix g≥2, N≥3 and B_N=Spec Z[1/N,ζ_N] with the chosen primitive root specifying the symplectic pairing. For the MC.4 universal smooth curve f:C_g[N]→M_g[N], use JC1 to form J=Pic⁰_{C/M}, its canonical principal polarization and the induced full symplectic level. Its PEL classifying map τ_N:M_g[N]→A_g[N] has a canonical isomorphism J≅M_g[N]×_{A_g[N]}A_g[N]^univ preserving polarization and level. Formation is natural under every test-scheme pullback; it does not choose a section of C.

**Hypotheses and conventions.** Both source and target use the same fixed cyclotomic pairing component. N is invertible on B_N. The fine Siegel target can first be used as an algebraic space: its good-base scheme realization is a PEL M6/C5 import, not a prerequisite for the classifying map.

**Prerequisites.** `StableReductionPartII:MC.6/smooth-torelli`; `StableReductionPartII:MC.4/fine-level-scheme`; `StableReductionPartII:MC.4/full-level`; `JacobianChallengePartII:JC1/relative-jacobian`; `JacobianChallengePartII:JC1/jacobian-base-change`; `JacobianChallengePartII:JC1/principal-polarization`; `PELModuli:M5/siegel-moduli`; `PELModuli:M6/universal-family-export`; `PELModuli:M6/quasi-projective-realization`.

**Construction or proof.**

1. Import the family Picard construction and its base change. Use the canonical polarization descended from local theta data; there is no global Abel–Jacobi base point.
2. Transfer the curve level to its Jacobian torsion with the agreed Weil pairing. Apply fine ppav representability to the object (J,λ,α).
3. The universal property supplies the Cartesian family comparison and its identity/composition coherence, rather than just agreement on geometric points.

**Sources.** DGHv3, §6.1, pp.23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JC1 and PELModuli, not inferred from this complex-geometric passage. BLR1990, §8.4, Theorem1(a), pp.231–232; §9.4, Theorem1 and Proposition4, pp.259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular.

**API derived from use.**

- `SmoothTorelli.classifies`: τ_N classifies exactly (Pic⁰, canonical principal polarization, induced symplectic level).
- `SmoothTorelli.universalCartesian`: The displayed universal-Jacobian square is Cartesian as a square of families, with the polarization and level comparisons.
- `SmoothTorelli.baseChange`: For T→M_g[N] the pulled-back universal comparison is the JC1 comparison for C_T; identity and successive pullbacks agree.
- `SmoothTorelli.forgetLevel`: For N dividing N′, with compatible cyclotomic base maps and both levels≥3, forgetting level commutes with τ and its family comparison.
- `SmoothTorelli.unlevelled`: Forgetting full level gives the stack morphism M_g→A_g and then the coarse smooth Torelli map.

**Uses.** DGHv3 §6.1, diagram(6.1), pp.23–25: The universal abelian scheme is used to transport curve families and form difference maps without a section. StableReductionPartII:MC.6/regular-component-hodge-pullback: The Hodge comparison must concern this Cartesian universal Jacobian, not an unrelated family with isomorphic geometric fibres.

**Discriminating unit tests.**

- `SmoothTorelli.noSection` (non-example): A smooth family with no global section is allowed; replacing Pic⁰ by a pointed Abel–Jacobi construction fails.
- `SmoothTorelli.infinitesimal` (compatibility): The construction on a dual-number test scheme is the pullback abelian scheme with its level, including nilpotent directions.
- `SmoothTorelli.pairing` (non-example): A level with Weil pairing ζ_N^a for a∈(Z/NZ)× with a≠1 in Z/NZ does not lie in the fixed ζ_N component until the base/pairing convention changes. Taking a=1+N leaves the pairing unchanged and is not a counterexample.

**Acceptance checks.**

- A genus≥2 family without a section still has τ_N and the Cartesian Jacobian comparison.
- A map from Spec k[ε]/(ε²) is tested by pullback of the same relative Picard object, not just a pointwise Jacobian assignment.
- Changing ζ_N changes the paired base/component; a map between mismatched pairing components is rejected.

### 3. Canonical Hodge comparison on the fine moduli scheme

**Target:** `regular-component-hodge-pullback`.

For τ_N above, let E_A=e*Ω¹_{A_g[N]^univ/A_g[N]}, E_C=f_*ω_{C/M}, and λ_A=det E_A, λ_C=det E_C. There are canonical coherent isomorphisms τ_N*E_A≅E_C and τ_N*λ_A≅λ_C. Their pullback along every T→M_g[N], including nonreduced T, is the relative Jacobian Hodge comparison for C_T. Both bundles have rank g; the second comparison is its determinant.

**Hypotheses and conventions.** g≥2, N≥3 and B_N as above; M_g[N] is regular, Noetherian and quasi-compact. The integral-base JC6 theorem is applied on integral open-and-closed components of this fine scheme, not to an arbitrary test scheme T.

**Prerequisites.** `StableReductionPartII:MC.6/torelli-family-composition`; `StableReductionPartII:MC.6/jacobian-hodge-comparison`; `StableReductionPartII:MC.4/fine-level-scheme`; `StableReductionPartII:MC.5/hodge-bundle`; `StableReductionPartII:MC.5/hodge-determinant`; `SchemeAndStackFoundations:SF.0/noetherian-normal-components`; `JacobianChallengePartII:JC6/picard-lie-cohomology`; `JacobianChallengePartII:JC6/curve-jacobian-hodge-bundles`; `JacobianChallengePartII:JC6/hodge-line-isomorphism`.

**Construction or proof.**

1. Regular local rings are integrally closed domains. SF.0 identifies finitely many disjoint integral open-and-closed components; no geometric irreducibility theorem is required.
2. Apply JC6 on each component to identify e*Ω¹_J with (R¹f_*O_C)∨≅f_*ω. Use the Cartesian Jacobian comparison to identify the left side with τ_N*E_A.
3. Glue the canonical componentwise maps. Pull this map and the represented Picard/base-change comparisons to arbitrary T; do not reapply an integral theorem to nonreduced T.
4. Take the fixed-rank determinant using the existing AlgebraicVectorBundles L0C functor imported by MC.5. Identity and composition coherence come from the same natural maps.

**Sources.** BLR1990, §8.4, Theorem1(a), pp.231–232; §9.4, Theorem1 and Proposition4, pp.259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular. DGHv3, §6.1, pp.23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JC1 and PELModuli, not inferred from this complex-geometric passage. StacksRegular, Lemmas28.7.5–6 and28.9.4. Regularity supplies normal local domains; quasi-compact Noetherian normal schemes split into finitely many integral components.

**Acceptance checks.**

- On two disconnected integral components the maps glue componentwise, without assuming the full fine scheme integral.
- For a dual-number test base the same comparison survives and its reduction agrees with the geometric comparison.
- In genus2 the bundle rank is2 but its determinant rank is1; replacing E by λ fails.

### 4. The sign ambiguity in geometric Torelli fibres

**Target:** `signed-level-fibres`.

Over an algebraically closed field k of arbitrary characteristic with N invertible, the fibre of τ_N over a geometric point is empty or has at most two geometric points. If a preimage is (C,α), the possible points are (C,α) and (C,−α). They are distinct precisely when C is nonhyperelliptic; for hyperelliptic C the hyperelliptic involution identifies them. In genus2 every C is hyperelliptic, so the map is injective on geometric points. Thus τ_N is quasi-finite. No assertion of reduced fibres, separability or proper finiteness is made.

**Hypotheses and conventions.** g≥2, N≥3, p∤N, and the fixed symplectic pairing convention of τ_N. Use strong Torelli including its ± uniqueness statement, not merely injectivity of the curve-isomorphism-class map.

**Prerequisites.** `StableReductionPartII:MC.6/torelli-family-composition`; `StableReductionPartII:MC.6/torelli-finite-fibres`; `JacobianChallengePartII:JC1`; `StableReductionPartII:MC.4/level-rigidity`.

**Construction or proof.**

1. Request strong Torelli from the Jacobian owner. Compare two polarized Jacobian isomorphisms using the induced curve isomorphism up to sign.
2. Transport full level across that curve isomorphism. The only remaining possibilities are α and −α. For N≥3 these levels differ as torsion trivializations, including in characteristic2.
3. Strong Torelli says −1 is induced by a curve automorphism exactly in the hyperelliptic case. The resulting point count and finite-type morphism give quasi-finiteness; no infinitesimal-fibre conclusion follows.

**Sources.** Milne2021, Theorem12.1(a,b), pp.38–39; existence proof begins §13, pp.40–41. A polarized Jacobian isomorphism is induced by a curve isomorphism up to sign; sign uniqueness depends on hyperellipticity. The full existence proof remains an explicit supplier proof leaf. DGHv3, §6.1, pp.23–25, diagram(6.1). The smooth fine-level Jacobian and its Cartesian universal family over a characteristic-zero component. The integral construction here is supplied by JC1 and PELModuli, not inferred from this complex-geometric passage.

**Acceptance checks.**

- For a nonhyperelliptic genus3 curve and N=3 there are two different curve-level points with the same ppav-level image.
- For a genus2 curve and any allowed N there is one point in a nonempty fibre.
- Characteristic2 with odd N is allowed: multiplication by −1 on étale N-torsion is not multiplication by1.
- A compact-type degeneration of a smooth genus2 curve to two elliptic components has decomposable Jacobian in A₂ but no smooth preimage there; smooth Torelli is not proper.

### 5. Stable Picard and Hodge comparison along a moduli atlas

**Target:** `stable-picard-atlas-comparison`.

Let U→M̄_g be a quasi-compact regular Noetherian smooth scheme atlas over Z, g≥2, and R=U×_{M̄_g}U. On integral open-and-closed components of U and R the R11.4 stable-family Picard and JC6 comparison identify e*Ω¹_{Pic⁰} with f_*ω. Canonical pullback isomorphisms of the represented relative Picard functor identify the two objects on R and satisfy the cocycle on triple overlaps. They descend a semiabelian Picard group object over the stack and its rank-g Hodge comparison. For any test scheme T→M̄_g the comparison is the pullback one for the classified stable curve, including nonreduced T; a scheme-representability claim on T requires the R11.4 arbitrary-base export, not algebraic-space descent alone.

**Hypotheses and conventions.** The MC.1 atlas is smooth over the regular base Z and finite type; its overlaps are representable schemes and regular Noetherian. The required arbitrary-base Picard identification and effective scheme representability are the precise R11.4 request. Preserve its early semiabelian and normalization-cohomology gaps.

**Prerequisites.** `StableReductionPartII:MC.1/hilbert-quotient`; `StableReductionPartII:MC.1/smooth-dimension`; `StableReductionPartII:MC.1/finite-unramified-diagonal`; `StableReductionPartII:MC.5/hodge-bundle`; `SchemeAndStackFoundations:SF.0/noetherian-normal-components`; `SchemeAndStackFoundations:SF.1/space-fppf-descent`; `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`; `NeronModelsAndSemistableAbelianVarieties:R11.4/stable-family-picard`; `NeronModelsAndSemistableAbelianVarieties:R11.4`; `JacobianChallengePartII:JC6/curve-jacobian-hodge-bundles`; `StableReductionPartII:MC.1/normal-crossing-boundary`.

**Construction or proof.**

1. Use regularity and the exact SF.0 component criterion on U, R and triple overlaps; apply integral-base R11.4 and JC6 componentwise.
2. All comparison maps arise from pullback of the same fppf Picard sheaf and the natural Lie/cohomology map. Hence they agree on overlaps and satisfy the cocycle before taking determinants.
3. Use algebraic-space group descent and quasi-coherent descent for the stack object and Hodge isomorphism. Ask R11.4 for the additional stable-curve arbitrary-base scheme representation; do not infer it from algebraic-space descent.
4. For arbitrary T, pull back the canonical atlas descent and compare its represented Picard functor. This transfers the formula without assuming T integral or regular.

**Sources.** BLR1990, §8.4, Theorem1(a), pp.231–232; §9.4, Theorem1 and Proposition4, pp.259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular. Yuan2024, Lemma3.4, pp.43–44. Uses BLR9.4/1 for stable Picard and the Lie–cohomology/duality comparison; integral Noetherian scope is not a regular-total-space hypothesis.

**Acceptance checks.**

- For a stable one-node irreducible genus2 curve with elliptic normalization, the semiabelian fibre has torus rank1 and abelian rank1, but its Hodge rank is2.
- For two elliptic components joined at one separating node, torus rank is0 and Pic⁰ is their product.
- A stable degeneration with local total-space equation xy=t² has nonregular total space at the node; it still lies in the source range.
- On a nonreduced test scheme only the canonical pullback comparison is used; splitting it into integral components is invalid.

### 6. The abelian part of a stable Jacobian

**Target:** `boundary-abelian-part`.

For a stable connected curve C of genus g≥2 over an algebraically closed field k, let ν:⊔_v C̃_v→C be its normalization and Γ its dual multigraph, allowing loops. There is a canonical fppf exact sequence 1→T_Γ→Pic⁰_C→∏_v J(C̃_v)→0, with X*(T_Γ)=H₁(Γ,Z). Put r=b₁(Γ) and a=Σ_v g(C̃_v)=g−r. The abelian quotient has the product principal polarization and defines a point of the a-dimensional ppav stratum of A_g^min. Hodge rank of Pic⁰_C remains g, not a.

**Hypotheses and conventions.** Vertices index geometric irreducible components; edges index nodes, including self-nodes. The normalized component Jacobians and their principal polarizations are imports, not reconstructed here.

**Prerequisites.** `StableReductionPartII:MC.6/stable-picard-atlas-comparison`; `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`; `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; `JacobianChallengePartII:JC1/principal-polarization`; `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`; `ShimuraCompactifications:C5`.

**Construction or proof.**

1. Import the R11.4 units/cohomology exact sequence and graph-character calculation, retaining the recorded normalization proof leaf.
2. Use arithmetic-genus additivity to identify g=a+r. Give the abelian quotient the product polarization; its determinant differential is not the whole rank-g semiabelian Hodge bundle.
3. Apply the C5 Siegel minimal-stratum interpretation by the abelian part. No claim that the nonproper generalized Jacobian itself lies in A_g is made.

**Sources.** BLR1990, §8.4, Theorem1(a), pp.231–232; §9.4, Theorem1 and Proposition4, pp.259–261. The Lie–R¹O comparison, semiabelian Picard identity of a semistable curve and canonical Jacobian polarization; the stable-curve total space need not be regular. FC1990, IV Proposition5.1, Remark5.3, Theorem5.7, pp.113–117; V Theorem2.3, pp.150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension/Hodge comparison independent of a chosen cone is a requested C5 interface, not a direct quotation of these theorems.

**Acceptance checks.**

- An irreducible stable genus2 curve with one node and elliptic normalization maps to the A₁ stratum, and X*(T)=Z.
- A union of two elliptic curves meeting at one node maps to their product in the interior A₂ (compact type).
- A rational curve with two self-nodes is stable of genus2: X*(T)=Z², abelian quotient0, and the minimal image lies in A₀. Counting only edges between different components fails.

### 7. Compactified Torelli in every characteristic

**Target:** `minimal-torelli-descent`.

For every algebraically closed field k and g≥2 construct t̄_g:M̄_g^coarse→A_g^min over k, extending coarse smooth Torelli. Its value on a stable curve C is the principally polarized abelian part ∏_v J(C̃_v) in the A_a stratum, a=g−b₁(Γ). The stack morphism is defined by canonical semiabelian specialization on regular atlases and descends by the coarse universal property. It is independent of the atlas, finite stable-family cover and any toroidal cone choices; it commutes with extension of algebraically closed fields.

**Hypotheses and conventions.** A_g^min is the fixed-field unlevelled Siegel coarse minimal space requested from C5, supported by FC V2.3 over Z and a proved fixed-field comparison. A literal identification with a geometric fibre of the integral model is not assumed; a characteristic-zero Satake theorem alone does not supply this target. The C5 normal-base semiabelian extension and Hodge-power contract is an explicit supplier gap. No use is made of FC V6.7 in characteristic p. Coarse formation is used over fixed k and permitted flat field extension; no arbitrary nonflat base-change theorem is asserted.

**Prerequisites.** `StableReductionPartII:MC.6/compactified-torelli`; `StableReductionPartII:MC.6/torelli-family-composition`; `StableReductionPartII:MC.6/stable-picard-atlas-comparison`; `StableReductionPartII:MC.6/boundary-abelian-part`; `StableReductionPartII:MC.1/smooth-dimension`; `StableReductionPartII:MC.1/normal-crossing-boundary`; `StableReductionPartII:MC.4/coarse-space`; `SchemeAndStackFoundations:SF.1/coarse-moduli-space`; `ShimuraCompactifications:C5`.

**Construction or proof.**

1. Choose a quasi-compact smooth scheme atlas of M̄_g over the fixed field k. MC.1 smoothness over k makes the atlas and its scheme double overlaps regular, and the dense smooth-curve locus meets every integral component by the boundary theorem. On each component use its stable Picard semiabelian scheme, generically a canonically polarized abelian scheme. Invoke the requested C5 stable-Jacobian polarized-trait compatibility from R11.3 before applying the normal-base minimal-extension/Hodge-power contract. Both this trait identification and the minimal contraction remain in G-minimal-extension; semiabelianity alone is not the asserted input.
2. Uniqueness and the canonical Picard overlap isomorphisms make these maps agree on double overlaps. Descend the stack map; the categorical coarse universal property factors it uniquely through M̄_g^coarse.
3. At geometric boundary points apply the abelian-part stratum rule. On the smooth open this is the JC1 Jacobian, so the result extends smooth Torelli.
4. FC IV5.1 requires a common toroidal cone on a general normal base. Independence after contraction to the minimal space must be proved by the supplier; a direct toroidal lift is not silently assumed.

**Sources.** FC1990, IV Proposition5.1, Remark5.3, Theorem5.7, pp.113–117; V Theorem2.3, pp.150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension/Hodge comparison independent of a chosen cone is a requested C5 interface, not a direct quotation of these theorems. KnudsenIII, §6, printed pp.210–211 (PDF11–12). Characteristic-zero map from a finite stable-family cover to the Satake compactification and identification of a positive Hodge power. It alone does not prove the all-characteristic target. Yuan2024, §3.4, p.56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.

**API derived from use.**

- `CompactifiedTorelli.smoothRestriction`: Restriction to M_g^coarse is coarse smooth Torelli induced by JC1.
- `CompactifiedTorelli.boundaryValue`: At C the stratum and ppav point are the polarized product of normalization-component Jacobians.
- `CompactifiedTorelli.atlasIndependence`: The morphism agrees with every atlas-local semiabelian classifying extension and is uniquely determined by this property.
- `CompactifiedTorelli.fieldExtension`: Extension of algebraically closed fields preserves the morphism and the boundary-value formula.
- `CompactifiedTorelli.hodgePower`: Its pullback of the minimal ample Hodge power is the same positive power of the stable curve Hodge line, as stated in minimal-hodge-power.

**Uses.** Yuan2024 §3.4, p.56: Pull back an ample minimal Hodge Q-line along stable classifying maps to prove Hodge nefness and bigness. StableReductionPartII:MC.6/minimal-hodge-power: The actual morphism, not a boundary point assignment, is needed for invertible-sheaf pullback.

**Discriminating unit tests.**

- `CompactifiedTorelli.compactType` (computation): For C=E₁∪E₂ meeting at one node, t̄(C)=[E₁×E₂] in A₂.
- `CompactifiedTorelli.allToric` (computation): For a rational curve with two self-nodes, t̄(C) is the unique A₀ point in A₂^min.
- `CompactifiedTorelli.attachmentMotion` (non-example): For two fixed genus≥2 components joined at a node, varying one attaching point changes the stable curve through infinitely many classes while t̄ stays constant.
- `CompactifiedTorelli.characteristicTwo` (compatibility): The same normalization/torus formula is required in characteristic2; a char0-only extension does not pass.

**Acceptance checks.**

- A separating elliptic–elliptic genus2 boundary curve maps into A₂, not the lower-dimensional boundary.
- A rational stable genus2 curve with two nodes maps into A₀.
- Moving the attaching points of two fixed smooth components leaves the product-Jacobian image fixed; compactified Torelli need not have finite fibres.
- A characteristic2 example is covered by the all-Z minimal target and the requested semiabelian extension contract, not by characteristic-zero purity.

### 8. Stable Hodge as a minimal Hodge pullback

**Target:** `minimal-hodge-power`.

Over the k of minimal-torelli-descent, let q:M̄_g→M̄_g^coarse and λ=det(f_*ω). There exist m>0 and an ample invertible sheaf A on A_g^min such that (t̄_g∘q)*A≅λ^⊗m canonically with the semiabelian Hodge comparison. Equivalently, λ descends as a rational line λ_coarse with λ_coarse=t̄_g*ω_min and ω_min ample as a rational line. For every stable family over a projective k-scheme X this yields λ_X^⊗m≅h_X*A; the comparison survives nonreduced test pullback. The power absorbs stabilizer actions and toric determinant signs.

**Hypotheses and conventions.** A and m are chosen compatibly from the Siegel minimal Hodge-power theorem; the unlevelled coarse Hodge line need not itself descend integrally. Use the rank-g semiabelian invariant-differential determinant across the boundary, not the smaller-rank abelian-part differential determinant.

**Prerequisites.** `StableReductionPartII:MC.6/minimal-torelli-descent`; `StableReductionPartII:MC.6/stable-picard-atlas-comparison`; `StableReductionPartII:MC.5/hodge-determinant`; `ShimuraCompactifications:C5/roadmap/minimal-hodge-ampleness`; `ShimuraCompactifications:C5`; `JacobianChallengePartII:JC6/hodge-line-isomorphism`.

**Construction or proof.**

1. Request the all-characteristic Siegel minimal ample power and its pullback identification on semiabelian normal bases. Compare this semiabelian Hodge line with the stable Hodge line by atlas-comparison.
2. Glue the canonical positive-power isomorphisms on overlaps and factor the target morphism through the coarse space. This directly supplies a descending power of λ, without an unsupported wild coarse-line descent assertion.
3. For a family pull back the stack equality. Rationalize the line group only after the positive-power statement, with coherent determinant base change.

**Sources.** FC1990, IV Proposition5.1, Remark5.3, Theorem5.7, pp.113–117; V Theorem2.3, pp.150–151. Toroidal extension has a cone condition; minimal compactification exists over Z and records the abelian part. A normal-base extension/Hodge comparison independent of a chosen cone is a requested C5 interface, not a direct quotation of these theorems. KnudsenIII, §6, printed pp.210–211 (PDF11–12). Characteristic-zero map from a finite stable-family cover to the Satake compactification and identification of a positive Hodge power. It alone does not prove the all-characteristic target. Yuan2024, §3.4, p.56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.

**Acceptance checks.**

- At an irreducible nodal genus2 curve the rank2 semiabelian determinant is used although the abelian quotient has dimension1.
- For two components of genera g₁,g₂ the determinant symmetry contains (−1)^(g₁g₂); a suitable positive power absorbs this sign on coarse descent.
- For a family over dual numbers the equality is an invertible-sheaf isomorphism pulled back from the stack, not a numerical equality of degrees.

### 9. Generic finiteness of the extended Torelli classifying map

**Target:** `maximal-variation-generic-finiteness`.

Let k be algebraically closed, X normal integral projective over k, and C→X a stable genus-g family, g≥2, smooth over a dense open U. If U→M_g^coarse has maximal variation in the imported MC.6 sense, the composite h:X→M̄_g^coarse→A_g^min is generically finite onto its reduced integral image Z. The finite field extension K(X)/K(Z) need not be separable. No global finiteness of h or t̄ is required.

**Hypotheses and conventions.** The classifying map is to coarse curve moduli; adding a level is not part of maximal variation. X is integral and U is dense and nonempty; a dimension-zero X is permitted.

**Prerequisites.** `StableReductionPartII:MC.6/maximal-variation`; `StableReductionPartII:MC.6/signed-level-fibres`; `StableReductionPartII:MC.6/minimal-torelli-descent`; `StableReductionPartII:MC.4/coarse-space`.

**Construction or proof.**

1. Unlevelled strong Torelli gives finite geometric fibres on the smooth locus; this follows from the same JC1 supplier used in signed-level-fibres after forgetting level.
2. Compose the generically quasi-finite U classifying map with this quasi-finite smooth Torelli map. The image of U is dense in h(X), so the resulting dominant map to Z has finite generic residue-field extension.
3. Retain the full inseparable degree. Positive-dimensional boundary fibres of t̄ do not change the generic calculation.

**Sources.** Yuan2024, §3.4, p.56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness. Milne2021, Theorem12.1, pp.38–39. Strong Torelli implies finiteness of smooth geometric fibres; no properness theorem is supplied.

**Acceptance checks.**

- An isotrivial family over a positive-dimensional X fails maximal variation; its constant h is not generically finite.
- A generically finite purely inseparable base change of a maximal-variation family stays in range; no generic étaleness test is imposed.
- For X a point the image dimension is0 and the finite field extension condition holds.

### 10. Nefness and bigness of the Hodge line under maximal variation

**Target:** `hodge-nef-big-application`.

For the family over X in maximal-variation-generic-finiteness, λ_X=det f_*ω is nef and big. Choose m,A from minimal-hodge-power, let d=dim X, Z=h(X)_red and e=[K(X):K(Z)]. Then deg_X(c₁(λ_X^⊗m)^d)=e·deg_Z(c₁(A|Z)^d)>0. Nefness follows by curve degrees; the nef-and-positive-top-intersection criterion gives bigness, and positive powers detect both properties.

**Hypotheses and conventions.** k algebraically closed; X normal integral projective, stable genus g≥2, smooth over a dense maximal-variation open. Big means the imported section-growth convention, and nef means nonnegative degree on every integral curve. These are generic SF.5 notions, not new definitions.

**Prerequisites.** `StableReductionPartII:MC.6/maximal-variation-generic-finiteness`; `StableReductionPartII:MC.6/minimal-hodge-power`; `StableReductionPartII:MC.6/maximal-variation-hodge`; `SchemeAndStackFoundations:SF.5/nef-big`; `SchemeAndStackFoundations:SF.5/big-line`; `SchemeAndStackFoundations:SF.5/nef-big-numerical`; `SchemeAndStackFoundations:SF.5/chow-proper-push`; `SchemeAndStackFoundations:SF.5/chern-projection`; `SchemeAndStackFoundations:SF.5`; `SchemeAndStackFoundations:SF.5/degree`.

**Construction or proof.**

1. Use λ_X^m≅h*A. The requested generic SF.5 pullback theorem makes it nef.
2. Projective h is generically finite onto integral Z, so weighted cycle pushforward gives h_*[X]=e[Z]. Apply the Chern projection formula d times and the degree map, including inseparable e.
3. The ample restriction A|Z has positive top degree, including the degree convention in dimension0. Apply the SF.5 nef/big numerical theorem and invariance under positive power. Its transitive asymptotic-RR/Kodaira proof leaf remains visible.

**Sources.** Yuan2024, §3.4, p.56, proof of Hodge nefness and bigness. Uses compactified Torelli, Hodge pullback and generic finiteness. The smooth Torelli step is read as quasi-finiteness, not proper finiteness.

**Acceptance checks.**

- On a positive-dimensional constant family λ_X is a constant line and has zero top degree, so omitting maximal variation would fail.
- On an integral projective base curve the formula is deg λ_X^m=e deg A|Z>0.
- For d=0 the degree is positive and a line is big by constant section growth; no positive-dimension assumption is inserted.

### 11. Hodge positivity descends from a finite cover

**Target:** `finite-cover-hodge-descent`.

Let p:Y→X be a finite surjective morphism of normal integral projective schemes over an arbitrary field k, and C→X a stable genus-g family g≥2. Put λ_X=det f_*ω and λ_Y for its pulled-back family. Canonically λ_Y≅p*λ_X. Consequently λ_X is nef if and only if λ_Y is nef, and, when these lines are nef, λ_X is big if and only if λ_Y is big. This applies when Y is a normal stable-family cover or an already constructed finite normalization; flatness and separability of p are unnecessary.

**Hypotheses and conventions.** Both schemes are projective over the same k; p is finite and surjective, not just dominant on an open. The bigness equivalence here is stated for nef lines and uses top intersection, avoiding a stronger unproved general section-growth descent assertion.

**Prerequisites.** `StableReductionPartII:MC.5/hodge-bundle`; `StableReductionPartII:MC.5/hodge-determinant`; `SchemeAndStackFoundations:SF.5/chow-proper-push`; `SchemeAndStackFoundations:SF.5/chern-projection`; `SchemeAndStackFoundations:SF.5/nef-big-numerical`; `SchemeAndStackFoundations:SF.5`; `SchemeAndStackFoundations:SF.5/degree`.

**Construction or proof.**

1. Use arbitrary base change for the Hodge bundle and coherent determinant pullback to identify λ_Y.
2. For curves use a component of the finite preimage dominating each integral curve of X; degree scales by its positive field degree. This proves nef descent, and the same projection argument proves ascent.
3. For d=dim X use deg_Y(c₁(p*λ_X)^d)=[K(Y):K(X)]deg_X(c₁(λ_X)^d). Apply the nef/big criterion in both directions.

**Sources.** Yuan2024, §3.4, pp.55–56. Finite-cover reductions in the geometric argument and the subsequent Hodge positivity argument; the general numerical transfer belongs to SF.5.

**Acceptance checks.**

- For relative Frobenius F_{Y/k}:Y→Y^(p) on a smooth geometrically integral projective k-curve in characteristic p, pull a stable family on X=Y^(p) back to Y. This finite k-morphism has degree p, so deg λ_Y=p·deg λ_X; an étale-only proof fails. Absolute Frobenius need not be a k-morphism.
- For a finite nonflat cover of a singular normal projective base over k, the equality uses the full generic field degree; no flat pullback of Chow cycles is assumed.
- A positive-dimensional constant family stays nonbig under any finite surjective cover; a cover cannot manufacture maximal variation.

### 12. Hodge positivity over an arbitrary field

**Target:** `arbitrary-field-hodge-positivity`.

Let k be any field, X a normal integral projective k-scheme, and f:C→X a stable genus-g family, g≥2, smooth over a dense open U. If U→M_g^coarse is generically quasi-finite onto its image, then λ_X=det f_*ω is nef and big. No perfectness or geometric-integrality assumption on k or X is imposed. The conclusion is geometric positivity of this line, not arithmetic bigness over Spec Z.

**Hypotheses and conventions.** Normality is that of X itself; X over an algebraic closure may be nonreduced or reducible. Use the arbitrary-field numerical/base-extension and reduced-component comparison requested from SF.5.

**Prerequisites.** `StableReductionPartII:MC.6/maximal-variation`; `StableReductionPartII:MC.6/hodge-nef-big-application`; `StableReductionPartII:MC.6/finite-cover-hodge-descent`; `StableReductionPartII:MC.4/coarse-space`; `StableReductionPartII:MC.5/hodge-bundle`; `StableReductionPartII:MC.5/hodge-determinant`; `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`; `SchemeAndStackFoundations:SF.5/nef-big`; `SchemeAndStackFoundations:SF.5/big-line`; `SchemeAndStackFoundations:SF.5/nef-big-numerical`; `SchemeAndStackFoundations:SF.5`.

**Construction or proof.**

1. Extend to an algebraic closure k̄. For each integral component Z of (X_k̄)_red take its finite normalization Y. The Y are normal integral projective k̄-schemes; pull back the stable family and its Hodge line.
2. The smooth dense open and generic quasi-finiteness persist on these components. Use the permitted flat field-base-change comparison for coarse spaces, not arbitrary nonflat coarse base change. Apply hodge-nef-big-application to each Y.
3. Use the requested SF.5 component/reduction/normalization detection of nefness and positivity of top intersection, and flat field-extension invariance, to descend to X. Nonreduced geometric base change is treated with its generic multiplicities, not declared integral. Apply the nef/big numerical criterion on the original integral X.

**Sources.** Yuan2024, §3.4, pp.55–56, geometric Hodge-positivity argument. The minimal-Torelli pullback supplies the geometric positivity argument. Extension to an arbitrary field here explicitly imports field-extension and component detection from the numerical owner.

**Acceptance checks.**

- In characteristic p, X may have a finite purely inseparable field of constants over k. Its geometric base change can be nonreduced; the theorem still applies after reduction and normalization, with positive generic multiplicities.
- A geometrically disconnected smooth projective X over a nonclosed k is treated componentwise after k̄, not by choosing just one component.
- A constant positive-dimensional family is excluded by maximal variation even after extending k.

## Proof obligations owned by the suppliers

Every MC.6 target is specified, but the following contracts are needed for
proof closure. The layer is planned; it is not proof-closed. These requests
extend the owning plans without modifying their packets.

**`JacobianChallengePartII:JC1`.** Extend the existing field/family Jacobian interface by strong Torelli over algebraically closed fields of every characteristic, genus≥2: each isomorphism of canonically principally polarized Jacobians is ± the map induced by a curve isomorphism; the two signs are both induced exactly for hyperelliptic curves. Supply the proof chain for Milne12.1(a), §13 pp.40–45, beyond the read statement/sign proof. Export the consequent unlevelled geometric-fibre injectivity and compatibility with prime-to-characteristic full level. Do not assign this theorem to upstream JacobianChallenge D, which supplies a universal property, not strong Torelli.

**`NeronModelsAndSemistableAbelianVarieties:R11.4`.** Retain stable-family-picard and normalization-exact-sequence as the owners. Export the canonical arbitrary-base-change identification of the fppf Picard identity functor for a stable genus≥2 family and its semiabelian scheme representation, with identity/composition isomorphisms, so atlas descent gives the same object on nonreduced test schemes. BLR9.4 Theorem1, pp.259–260 actually treats general semistable base schemes, without regular total space; BLR8.4 Theorem1(a), pp.231–232 gives the natural Lie–R¹O map. Complete the existing G-semiabelian-prefix and G-normalization-cohomology chains; the DVR/regular-total-space picard-zero node alone does not supply normalization-exact-sequence in this range. Do not create a second stable Picard theory in MC.6. The supplier’s G-stable-Picard also remains a formalization/proof-chain obligation: independently reading BLR here establishes source applicability but does not amend or discharge the owner packet.

**`ShimuraCompactifications:C4`.** Supply only the early acyclic semiabelian carrier/extension/abelian-quotient interface needed by R11.4 and the Siegel C5 boundary: torus character lattice, rank-g invariant differentials, and the product polarization on the normalization-component abelian quotient. Retain the R11.4 prefix gap. Do not import the complete C4 degeneration suffix back into stable Picard.

**`ShimuraCompactifications:C5`.** Extend/specialize the existing good-prime integral-minimal-space and minimal-hodge-ampleness targets to the unlevelled Siegel minimal scheme over Z of FC V2.3, pp.150–151, and its geometric fibres in every characteristic. Precisely: for a normal integral finite-type k-scheme T and a semiabelian T-scheme G whose dense open is a principally polarized abelian scheme of dimension g and with the following polarized-trait compatibility: on every complete strictly henselian DVR mapping to T with generic point in that open, the polarized generic fibre has the positive polarized degeneration datum of C4/roadmap/polarized-degeneration-data, and its semiabelian realization agrees with the pulled-back G, give the unique extension T→A_g^min of its classifying map, the geometric abelian-part stratum formula, and a canonical identity/composition/base-change-compatible isomorphism h*A≅(det e*Ω¹_G)^m for a minimal ample A and m>0. It suffices to export this on regular atlases plus the normal overlap/base-change comparisons used here. For the stable Picard application, identify this polarized-trait datum using the semistable Jacobian degeneration interface of R11.3; this does not enter the early R11.4 semiabelian carrier prefix. Prove the contraction/independence-of-cone step: IV5.1 and5.7 do not give a toroidal lift for every normal base without a common cone. V6.7 purity is generic-characteristic-zero and cannot fill this characteristic-p gap. Preserve the C5 semiampleness/theta and Stein/base-change proof leaves. The fine-level scheme target in PEL M6 may continue to use good-prime C5; this request concerns the all-characteristic unlevelled stable Torelli target. Identify the fixed-field coarse minimal space used here and prove any required comparison with geometric fibres of the Z-model. Do not infer normality, coarse-space formation or Hodge section-ring base change just from the existence of the integral model.

**`SchemeAndStackFoundations:SF.5`.** Combine the existing nef-big, big-line, nef-big-numerical, weighted proper push and Chern projection interfaces into (i) pullback of an ample line along a projective generically finite morphism of integral projective k-schemes onto its reduced image is nef and big, with top degree [K(X):K(Z)]deg(A|Z)^d; (ii) nefness and, for nef lines, bigness descend and ascend under finite surjective maps of integral projective schemes. Permit inseparable field degree, nonflat finite maps and d=0. Retain the supplier’s asymptotic-RR/Kodaira proof leaf rather than treating its numerical criterion as already proof-closed. No generic positivity definitions or proofs are replanned in MC.6. Also export detection of nefness/top-intersection positivity after arbitrary field extension and passage to the reduced geometric components and their finite normalizations, retaining positive generic multiplicities for nonreduced geometric base change. This is needed to pass from algebraically closed fields to imperfect fields; no geometric-integrality shortcut is allowed.

Four proof leaves remain: strong Torelli; stable Picard descent with the
early semiabelian and normalization comparisons; minimal extension with the
all-characteristic Hodge-power comparison and the stable-Jacobian polarized-trait
identification via R11.3; and numerical transfer including
the supplier's asymptotic positivity inputs and the field-extension step.
The normal-component and finite-normalization requests from the parent are
resolved by exact imports. Reading BLR here confirms the stable Picard
source range; it does not silently close the owner's recorded proof gaps.

The atlas construction requires canonical overlap maps. Agreement of
geometric fibres is insufficient. On the regular atlas and its regular
scheme overlaps apply the integral-base comparison componentwise, and then
pull the resulting natural map to arbitrary test schemes. Algebraic-space
descent gives an algebraic-space object; the additional arbitrary-base
scheme representation comes from the stable Picard owner.

The all-characteristic distinction is also substantive. Faltings–Chai V2.3
constructs the Siegel minimal space over Z. Knudsen III §6 gives the
characteristic-zero stable-family comparison. Faltings–Chai V6.7 has a
generic-characteristic-zero hypothesis. Neither that purity theorem nor
a cone-dependent toroidal lift proves the required characteristic-p
normal-base extension. The C5 request explicitly includes contraction to
the minimal space and the compatible positive Hodge power.

## Native Lean statements and omissions

The suggested file is deliberately compact. It imports the native finite and
separated scheme morphism modules. Its named milestone
`finite_retainedBaseMap` says that the existing pullback lift is finite when
its first projection is finite and the second factor is separated over the
base. Three examples recover the two coordinates and the specialization
where the second factor is the base itself. This is the scheme part of the
graph-closure construction, not the stable-family theorem.

All twelve target names above are explicitly listed as README-only in the
suggested file. Their stable-family, stack, Picard, polarized-level,
minimal-space and numerical-line carriers are not simultaneously available
at the pinned libraries. They are not replaced by opaque types or by
structures whose fields assume the desired theorems. The imported
upstream JacobianChallenge suggested file itself has no compiled relative
Picard signatures. Formalizing those carriers belongs to their owners.

The baseline is Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
TauCeti f790474821cf4256814db967cb154e7af3d0c369. The current read-only
TauCetiRoadmap and current TauCeti sources were also checked, respectively at
0d144d044dacebca17b654695b6f1ad58f159b27 and
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Existing StableReduction curve
theory, JacobianChallenge field/family interfaces and AlgebraicVectorBundles
determinants are imported. No upstream target is replanned here.

## Planets and parent-target coverage

The parent has already selected the six MC.6 planets: **Maximal variation**,
**Stable compactification**, **Graph-closure compactification**, **Torelli
morphism**, **Compactified Torelli morphism**, and **Hodge bigness**. Keep
these six and attach the refinements above to them; this part adds no planets.

| Parent target | Refinement in this part |
| --- | --- |
| stable-compactification and graph-closure | stable-input-compactification; native retained-base map |
| stable-compactification-exists and level-stable-compactification | stable input extension, exact finite normalization; level family application retains no nodal full-level assertion |
| smooth-torelli | torelli-family-composition with JC1/PEL universal-family comparison |
| torelli-finite-fibres | signed-level-fibres, including characteristic2 and genus2 |
| jacobian-hodge-comparison | regular-component-hodge-pullback; canonical arbitrary-test pullback |
| compactified-torelli | stable-picard-atlas-comparison, boundary-abelian-part, minimal-torelli-descent and minimal-hodge-power |
| maximal-variation and maximal-variation-hodge | generic-finiteness, numerical Hodge application, finite-cover descent and arbitrary-field positivity |

## Source corrections and bibliography

Retain the parent's confirmed source issue `StableReductionPartII/E4` against
Yuan's 21 August 2024 author manuscript, p.45: closing only the moduli image
loses the base. The graph closure in S̄₀×V, normalized in the finite-cover
field, is used throughout this part.

A further finding, `StableReductionPartII/E15-MC6`, concerns the same author
manuscript, p.56. If its description of smooth Torelli as finite is read as
proper finiteness to A_g, the genus2 compact-type degeneration contradicts
it. Quasi-finiteness suffices for the proof: it gives generic finiteness of
the maximal-variation composite. The author publications page and Annals
article page were checked for a correction; none was located. The full
published text was not collated, so this finding makes no assertion about
the published wording. The independent review confirms this finding only under the proper-finiteness reading and only against this author manuscript. In the genus2 example, the product has a reducible theta divisor, whereas the smooth Jacobian theta divisor is the irreducible curve. The review does not make a claim about the published wording.

- **Yuan2024.** Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*. Author manuscript dated 21 August 2024; printed page = PDF page. Published Annals 203 (2026), pp.15–119, not collated. [Source](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf).
- **DGHv3.** Vesselin Dimitrov, Ziyang Gao, Philipp Habegger, *Uniformity in Mordell–Lang for curves*. arXiv:2001.10276v3; locators use this version. [Source](https://arxiv.org/pdf/2001.10276v3).
- **Milne2021.** J. S. Milne, *Jacobian Varieties*. Author revised notes, 12 June 2021; printed pp.38–41 correspond to PDF pp.38–41. [Source](https://www.jmilne.org/math/xnotes/JVs.pdf).
- **KnudsenIII.** Finn Faye Knudsen, *The projectivity of the moduli space of stable curves, III: The line bundles on M̄_g,n, and a proof of the projectivity of M̄_g,n in characteristic 0*. Mathematica Scandinavica52 (1983), pp.200–212; published scan. [Source](https://journals.msp.org/mscand/article/download/1623/1622/1654).
- **BLR1990.** Siegfried Bosch, Werner Lütkebohmert, Michel Raynaud, *Néron Models*. Springer, Ergebnisse21 (1990); maintainer-cleared reference copy, read in place. Maintainer-cleared reference copy read in place; no book material is reproduced.
- **FC1990.** Gerd Faltings, Ching-Li Chai, *Degeneration of Abelian Varieties*. Springer, Ergebnisse22 (1990); maintainer-cleared reference copy, read in place. Maintainer-cleared reference copy read in place; no book material is reproduced.
- **StacksRegular.** The Stacks Project Authors, *The Stacks Project: normal and regular schemes*. Online HTML read 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/033H).

The source locators attached to the targets record exactly what each source
supports. Milne's strong Torelli existence proof beyond the opening of §13,
the supplier's full normalization-cohomology proof, the minimal-extension
contraction argument, the C5 theta-generation proof and the SF.5 asymptotic
positivity proofs are not claimed to have been read or closed by this part.
All source results are stated in our own words; no source passages are stored.
