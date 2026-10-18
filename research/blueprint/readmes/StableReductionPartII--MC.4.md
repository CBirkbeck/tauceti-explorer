# Stable reduction, Part II — MC.4

Coarse moduli, projectivity and full level. This continuation of the accepted
[StableReductionPartII plan](StableReductionPartII.md#mc-4) covers only
`StableReductionPartII:MC.4`. It imports its fifteen target IDs, adds five prerequisite
nodes, and completes a target-level planning pass. The stage is **planned, not closed**:
seven gap groups and ten exact supplier requests remain. No geometric implementation
is claimed.

The definitive mathematical specification is this reader together with its
[packet](../packets/StableReductionPartII--MC.4.json). The
[suggested file](../suggested/StableReductionPartII--MC.4.lean) contains only statements
whose carriers exist at the pins. Its six declarations elaborate with admitted proofs;
that check establishes signature compatibility, not the geometric results.

## Conventions and endpoints

A stable pair is `(g,n)` with `g,n≥0` and `2g−2+n>0`. The pointed curve stack is
`M̄_{g,n}` and its coarse algebraic space is `M̄ᶜ_{g,n}`. These are distinct objects.
The projectivity and level arguments here concern **unpointed `g≥2`**. Unless otherwise
specified a stable family is proper, flat and finitely presented, has geometrically
connected nodal fibres, and has relatively ample dualizing line `ω`. Smooth level
moduli are taken only where the curve is smooth.

Write `E_m=f_*ω^m` for `m≥2`. The MC.1 cohomology contract gives finite local
freeness, arbitrary pullback and rank `(2m−1)(g−1)`. Use the quotient convention
for the projective bundle: a quotient `f*E₃→ω³` gives
`X↪P_S(E₃)`, and `π_*O(d)=Sym^d E₃`. An assertion about the ideal of this embedding
means its actual ideal **sheaf**; it does not mean that a single degree generates all
lower pieces of the graded homogeneous ideal.

For full level, `N≥3` is invertible on the base. The polarized Jacobian pairing is
`e_N:J[N]×J[N]→μ_N`. The homogeneous level problem allows a primitive multiplier;
the fixed symplectic problem is over `B_N=Spec Z[1/N,ζ_N]` with that multiplier fixed.
DM's constant-coefficient `H¹` convention instead has pairing into `μ_N⁻¹`.
The dual and Tate twist in their comparison are retained. They are not removed by
calling both objects full level.

The endpoints are proper pointed coarse spaces; projectivity of `M̄ᶜ_g` over `Z`;
a chosen representable finite surjective normal integral projective scheme cover of
`M̄_g`; and a regular, smooth, quasi-projective fixed-level scheme of dimension
`3g−3` over `B_N`, with smooth projective universal curve and geometrically connected
fibres. A normalization used for compactification does not represent naive nodal full
level and is not automatically a scheme.

## Baseline and ownership

The elaboration pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed
`data/library-coverage.json` has no entry for this new Part II; the relevant R09.1,
R09.5 and SF.5 records were read. Current upstream roadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked in addition to the pins.
The current Mathlib checkout is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
No build was run in the current upstream checkouts.

Consume AlgebraicVectorBundles L0A–L0C for finite locally free modules, tensor,
symmetric/exterior powers, determinants and pullback. That roadmap does not supply
vector nefness or the Grassmann ampleness lemma. Consume StableReduction Layers 1–3
for nodes, dualizing/cohomological curves and stable automorphisms, and Layers 4–5
for the existing resolution/minimal-model direction. These do not establish all the
surface vanishing or pointed-divisor transport used here.

The current and pinned abelian endomorphism source constructs
`TauCeti.AlgebraicGeometry.AbelianVariety.End` as the ring of actual group
endomorphisms, with multiplication given by composition; it explicitly leaves
multiplication-isogeny theory to its owner. Mathlib supplies `Matrix`, `ZMod`,
`IsOfFinOrder` and `orderOf`. Their definitions were read. None of these is a carrier
for an algebraic stack, a relative Jacobian or a cohomology bundle.

The exact imported supplier interfaces are as follows. They are plans, not library
implementation claims.

- `AlgebraicModuliForArithmeticGeometry:R09.1/relative-serre`: Uniform high generation and vanishing on a quasi-compact Noetherian fixed family; supplies the integer bound, not projectivity.
- `AlgebraicModuliForArithmeticGeometry:R09.1/family-regularity`: S-flat coherent sheaves on projective space have a uniform regularity threshold, finite locally free high pushforwards and arbitrary base change; finite trivializing charts adapt this to P(E).
- `SchemeAndStackFoundations:SF.1/keel-mori`: Finite inertia gives a proper quasi-finite coarse morphism and flat coarse base change; no finite scheme cover or arbitrary coarse base change is concluded.
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`: Finite representable correspondence induces a finite map on coarse spaces under its separated finite-type finite-inertia hypotheses.
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`: Finite normalization in finite function-field extensions over locally Noetherian Nagata charts; does not imply geometric normality of all fibres.
- `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`: Finite normalization over the excellent integer base, used after choosing a dominating component.
- `SchemeAndStackFoundations:SF.5/nef-big`: Numerical nefness for line bundles; does not supply the vector-bundle quotient criterion or the Grassmann ampleness lemma.
- `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`: Over an algebraically closed field and invertible N≥3, a polarized abelian automorphism trivial on A[N] is identity. This is exactly the abelian rigidity needed by the parent curve level theorem.
- `AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties`: Arithmetic proof provider for the existing R09.4 automorphism owner; import rather than replan Serre rigidity.
- `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`: Scheme-theoretic vanishing on A[N] is divisibility in Hom by N, including non-etale kernels; the suggested source lemma uses this convention.
- `PELModuli:M2/rigidity`: Relative prime-to-characteristic polarized rigidity; its omitted-carrier prototype does not substitute for a proof.

The key improvement over a broad stage citation is R09.1: `relative-serre` and
`family-regularity` already state exactly the uniform generation, vanishing and
S-flat base-change results needed for the integer-base parameter family. They are
imported, not planned again. The JC1 relative Jacobian, pullback and polarization
nodes are likewise exact imports; polarized atlas descent and étale duality remain
separate requests.

## The retained targets

The IDs below belong to the accepted parent packet and are not reissued here.
Its definition/construction APIs and tests remain attached to those IDs. The table
states all fifteen target contracts so this continuation can be read on its own.

| Parent target suffix | Contract and use of this continuation |
| --- | --- |
| `coarse-space` | For every stable pair, construct coarse spaces of the smooth and stable pointed stacks, initial for maps to algebraic spaces and bijective on geometric isomorphism classes; the stable coarse space is proper over Z. Use SF.1/keel-mori with finite inertia. Coarse smoothness, a universal curve and arbitrary coarse base change do not follow. CLM Lemma 1.3, p.3. |
| `finite-degree-equations` | For a fixed Noetherian quasi-compact stable tricanonical family, sufficiently high degree multiplication is onto and its kernel determines every embedded geometric fibre. The new integral-hilbert-kernel node supplies the uniform degree and flat ideal comparison. CLM Lemma 7.1, pp.29–30. |
| `smooth-generic-direct-image-nef` | Over a smooth projective curve over an algebraically closed field, a nodal genus≥2 family with smooth generic fibre has nef `f_*ω^m`, `m≥2`. The proof uses the sourced surface bounds and controlled birational pushforward; these remain supplier obligations. CLM Proposition 6.3 and Lemmas 6.4–6.5, pp.23–25. |
| `dualizing-section-degree` | In that smooth-generic setting a smooth-locus section has nonnegative dualizing degree. Use the generically generated evaluation image and an effective defect divisor, not special-fibre H¹ vanishing on an unstable family. CLM Corollary 6.6, p.25, corrected as parent E12. |
| `pointed-normalization-nef` | For a smooth-generic nodal family of any genus with disjoint smooth-locus sections and `m≥2`, `0≤a_i≤m`, the pushforward of `ω^m(Σa_i s_i)` is nef, including zero pushforward in negative-degree genus-zero cases. The genus cases and unstable transport are separate obligations. CLM Proposition 6.7, pp.25–27. |
| `persistent-node-residue-sequence` | After a finite cover splitting horizontal nodes and branches, normalization has pullback dualizing line `ω_ν(D_ν)`. For `m≥2`, pushforward fits into `0→(fν)_*ω_ν^m((m−1)D_ν)→f_*ω^m→O_B^{number of persistent nodes}→0`. Stable pointed vanishing and the branch relation with sign `(-1)^m` supply exactness. CLM Lemma 6.8 and Proposition 6.9, pp.27–28. |
| `pluricanonical-nef` | For every stable genus-g family `g≥2` over a smooth projective algebraically closed-field curve, `f_*ω^m` is nef for `m≥2`, in all characteristics. Split persistent nodes, apply the pointed component result and trivial-quotient residue sequence, use extensions, then descend through a finite cover. CLM Theorem 6.10, pp.28–29. |
| `moduli-determinant-ample` | On a proper finite-type algebraic space over an algebraically closed field, a stable family with finite geometric moduli fibres has `det E_{3d}` ample when multiplication is onto and the degree-d kernel determines the embedded fibres. Apply the generic quotient/Grassmann ampleness lemma to nef `E₃`; the conclusion is about `det Q`, not Q. CLM Proposition 5.5, pp.21–22, and Lemma 7.1, pp.29–30. |
| `projective-coarse` | For `g≥2`, `M̄ᶜ_g` is a projective Z-scheme, with an ample descended power of a high pluricanonical determinant. The fixed-degree-ample-descent node repairs the order of the quantifiers. CLM Theorem 7.2, pp.30–31. |
| `finite-projective-cover` | Choose `V→M̄_g` representable finite surjective with V normal integral and projective over Z, with its pulled-back stable family. Obtain the initial finite scheme cover without an integrality assumption; after projectivity and irreducibility choose and normalize a dominating component. EHKV Theorem 2.7, p.5, and proof pp.12–13; the accepted parent also cites Yuan §3.1.4, p.45. |
| `full-level` | Construct the homogeneous torsion-frame level problem on smooth genus-g curves with its multiplier, and the exact fixed symplectic subfunctor over `B_N`. Import the JC1 Jacobian and polarization on the tricanonical atlas; retain the R09.4 descent and SF.3 duality obligations. DM 5.3–5.8, pp.105–106, and 5.14, p.108. |
| `level-rigidity` | An automorphism of a smooth genus-g curve, `g≥2`, trivial on `J[N]` is identity for invertible `N≥3`. Existing R09.4 polarized rigidity supplies the abelian step. The missing JC1 theorem is faithfulness of the curve action on its polarized Jacobian, not the whole strong Torelli equivalence. DM 5.14, p.108; Serre appendix pp.17-18–17-20. |
| `fine-level-scheme` | Fixed symplectic smooth level is a smooth quasi-projective scheme over `B_N`, regular of relative dimension `3g−3`, with its smooth projective universal curve. The forgetful map to the curve stack is representable finite étale. Trivial inertia gives an algebraic space; finite coarse comparison and coarse projectivity give quasi-projectivity and schemeness. DM 5.14–5.15, pp.108–109. |
| `level-connectedness` | Every geometric fibre of the fixed-multiplier fine level scheme over `B_N` is connected and hence irreducible by smoothness. The new abelian Teichmuller comparison, tame normalization and complex orbit calculation specify the proof. Homogeneous level over `Z[1/N]` is not asserted geometrically connected. DM 5.9–5.16, pp.106–109. |
| `irreducible-geometric-fibres` | For `g≥2`, smooth and stable curve moduli have geometrically irreducible fibres over Z. In characteristic p use N=3 if p≠3 and N=4 if p=3, then descend irreducibility through the fixed-level cover and use smooth-locus density in stable charts. DM conclusion p.109. |

## The two proof routes and their independence

For projectivity first take any finite scheme cover `V→M̄_g` from the finite-cover
supplier. Properness gives a proper Noetherian scheme over Z; one does not yet choose
a normal integral component. On its single stable family construct the flat ideal in
`P(E₃)` and fix **one** degree d valid on every fibre. The vector positivity and
Grassmann ampleness theorem then make the **same** determinant line `λ=det E_{3d}`
ample on each geometric fibre. Fixed-line openness is used on the scheme V and
relative ampleness is local over Z. A fixed power descending from the stack, together
with finite ampleness descent, makes the coarse algebraic space projective.

After this, the tame level argument can prove geometric irreducibility. Only then
choose a dominating component of a finite cover and use finite normalization over the
excellent integer base to obtain the normal integral projective cover. Projectivity
therefore does not assume the irreducibility it will help make accessible through
fine-level quasi-projectivity.

For connectedness start on the **smooth** stack, where J[N] is finite étale. Compare
its frames to abelian Teichmuller level `G=(Z/N)^{2g}` and fix the multiplier. Normalize
the stable stack in this cover. DM's theorem is applicable because `|G|=N^{2g}` is
invertible. It does not require the order of the frame deck group to be invertible.
Tame Kummer charts supply flatness, geometrically normal fibres and density; ordinary
normalization alone supplies none of these fibre claims. Proper flat normal-fibre
component counts are locally constant. Over C the connected marked Teichmuller space
and the surjective symplectic mapping-class action give one orbit. This fixes that
count at one in every admissible characteristic.

## The positivity and rigidity boundaries

For the smooth-generic nef theorem, a negative line quotient after a finite cover of
the base is the right obstruction. In characteristic p a Frobenius pullback makes
its negative degree arbitrarily large. Choose the resulting quotient as `M⁻¹` with
`M=ω_B^m⊗L` and L sufficiently positive, so the quotient of `E_m⊗M` onto `O_B`
forces `h¹(B,E_m⊗M)≥g(B)≥2`. Leray injects this group into
`H¹(S,ω_S^m(D))`, where D is a reduced sum of good fibres from the chosen L.
Those fibres have trivial normal line. In characteristic zero, spread the family and its negative quotient over a finite-type integer base and localize for the required coherent base-change comparison before specializing to positive characteristic; this transport is part of the surface/positivity supplier contract. The required surface bound is at most one,
including the exceptional characteristic-two, m=2 case. A vanishing theorem that
excludes that case is insufficient. CLM Lemmas 6.4–6.5, pp.23–24, give this route.

The surface contracts must be separated: general type after a genus≥2 base change;
crepant rational-double-point resolution; pushforward under exceptional contraction;
Ekedahl's all-characteristic positive-twist bound; and the genus-zero/one arguments.
Ekedahl II Theorem 1.7, pp.126–127, gives the positive-characteristic canonical-power
input by Serre duality. Its proof depends on the preceding torsor and classification
machinery, not on an existing moduli theorem. Chen–Zhang v1 Theorem 1.3, p.2, proved
in §4, pp.10–11, gives the required positive-characteristic general-type criterion:
for connected smooth generic fibre and base both of genus≥2, their Kodaira dimensions
sum to two. Their canonical-bundle formula Theorem 4.3, p.10, also identifies the
BM input but does not make its original source read here.

The elementary section-degree repair from parent E12 is complete at the planning
level: the evaluation image is an invertible sheaf `I=s*ω^m(-D)` with D effective;
its quotient degree is nonnegative, hence so is `m deg(s*ω)`. This does **not** repair
every use of surjectivity in the pointed induction. A subsheaf of a nonnegative-degree
line can have negative degree. For a blowup b at a centre shared by marked sections,
the transformed pointed pluricanonical divisor has exceptional coefficient
`m−Σa_i` over that centre. The inequalities `a_i≤m` do not imply `Σa_i≤m`.
A complete transport argument must handle this case instead of assuming disjoint
markings remain disjoint after contractions. This is an explicit open proof boundary.

Serre's original appendix uses divisibility in the actual endomorphism ring:
`u−1=Nv`, equivalently trivial action on the multiplication kernel as a group scheme.
For finite-order u, N≥3 gives identity, while N=2 gives `u²=1`. Its argument passes to
the finite commutative integral algebra generated by v and then uses the valuation of
`ζ−1` for a primitive root of unity. The integral Hom/endomorphism and torsion
factorization prerequisites belong to A3/A6. MC.4 already has the exact abelian
conclusion in R09.4, so this read closes a source-acquisition obligation rather than
creating a second generic rigidity plan. In characteristic dividing N, geometric
points of torsion alone cannot replace the kernel scheme. The curve level target
uses N invertible and still needs curve-to-Jacobian faithfulness.

## New prerequisite nodes

The following sections carry the exact new statements, proof prerequisites, API and
discriminating tests. Geometric APIs are README targets because their carriers do not
exist at the pins. No replacement propositional structure is introduced in Lean.

### Uniform integral tricanonical equations

**ID:** `StableReductionPartII:MC.4/integral-hilbert-kernel` (construction).

Let S be a quasi-compact Noetherian scheme, g≥2, and f:X→S a stable genus-g family. Put E=f_*ω³, of rank r=5g−5, and use the quotient convention for i:X↪P_S(E), with i*O(1)=ω³. For the ideal sheaf I of i there is d₀≥2 such that for every integer d≥d₀, I(d) is relatively generated, R^jπ_*I(d)=0 for j>0, and K_d=π_*I(d) is finite locally free and commutes with every base change. There is a base-change-compatible exact sequence 0→K_d→Sym^d E→f_*ω^{3d}→0, whose quotient has rank (6d−1)(g−1). Evaluation of K_d generates I(d), and its geometric-fibre equations recover the embedded curve as a closed subscheme. The same d₀ works over every residue characteristic of S, without assuming S is reduced, integral or flat over Z.

**Hypotheses.**

- Stable means proper flat finitely presented, geometrically connected nodal fibres and relatively ample dualizing line; genus g≥2 is fixed.
- The MC.1 tricanonical embedding and its locally free direct images commute with arbitrary base change.
- π:P_S(E)→S uses one-dimensional quotients, so π_*O(d)=Sym^d E for d≥0.

**Direct prerequisites.**

- `StableReductionPartII:MC.1/tricanonical-cohomology`
- `StableReductionPartII:MC.1/tricanonical-hilbert`
- `AlgebraicModuliForArithmeticGeometry:R09.1/relative-serre`
- `AlgebraicModuliForArithmeticGeometry:R09.1/family-regularity`

**Construction or proof.**

1. In 0→I→O_P→i_*O_X→0, the last two terms are S-flat, hence so is I. Tensoring with any base change stays exact, identifying I_T with the actual ideal of X_T. This is the flat-kernel criterion, not an appeal to constancy of a Hilbert polynomial.

2. Choose a finite affine cover trivializing E. Apply the imported relative Serre and S-flat family-regularity theorems on each projective-space chart to I. Take the maximum of these finitely many regularity thresholds: each conclusion holds for every higher degree on the same fixed chart. Descent gives one d₀ on S.

3. Push forward the twisted ideal sequence. The higher vanishing supplies surjectivity; projective-bundle cohomology identifies the middle term with Sym^d E. Cohomology and arbitrary base change for the stable family identify the quotient with f_*ω^{3d}.

4. Local freeness of the quotient makes the exact sequence locally split as modules; arbitrary pullback therefore preserves its kernel. Relative generation, also pulled back, recovers the fibre ideal sheaf. Equality of degree-d subspaces gives equality of these ideal sheaves after untwisting.

5. This refines the proof obligation of the parent finite-degree-equations node. It does not create another generic relative Serre theorem or assert generation of all lower graded pieces of the homogeneous ideal.

**Acceptance.**

- Choose d once before applying any characteristic-dependent positivity argument.
- The degree-d equations determine the saturated closed-subscheme ideal, not necessarily the entire graded ideal in lower degrees.

**Uses.**

- `StableReductionPartII:MC.4/finite-degree-equations`: Supplies the integral flat-ideal and uniform-degree proof omitted from the fieldwise source.
- `StableReductionPartII:MC.4/fixed-degree-ample-descent`: Fixes the same determinant λ_{3d} on every fibre of the finite parameter scheme.

**Planning API.**

- `IntegralCurveEquations.degreeBound` (data): Choose d₀≥2, valid for every d≥d₀ on this fixed S.
- `IntegralCurveEquations.kernelSequence` (characterisation): K_d is the kernel of Sym^d E→f_*ω^{3d}, and its rank is binomial(r+d−1,d)−(6d−1)(g−1).
- `IntegralCurveEquations.baseChange` (functoriality): For any T→S, K_d|T identifies with the multiplication kernel for X_T; identity and composite comparisons agree.
- `IntegralCurveEquations.evaluate` (universal-property): π*K_d→I(d) is onto, hence its image cuts out X.
- `IntegralCurveEquations.projectiveFrames` (compatibility): Changing a local frame of E transports K_d by Sym^d of that frame; its projective orbit determines the abstract stable curve.
- `IntegralCurveEquations.nativeIdeal` (compatibility): On affine projective charts the constructed ideal sheaf is the sheaf associated to the actual closed-immersion ideal, and its fibre is its tensor pullback.

**Unit tests.**

- `IntegralCurveEquations.genusTwoRanks` (computation): For g=2, r=5 and the d=2 source and target ranks are 15 and 11; if d=2 satisfies the generation bound its kernel rank is 4. This is not a claim that d=2 always determines the curve.
- `IntegralCurveEquations.degreeOneFails` (non-example): At d=1 the multiplication kernel is zero for every tricanonical curve; its equations define the whole P^{5g−6}, not the curve.
- `IntegralCurveEquations.nonflatFailure` (non-example): For R=Z, ambient Spec R and closed subscheme Spec(R/2), the ideal (2) tensored with F₂ maps to zero in F₂; it is not the actual fibre ideal 0 via an injection. Thus flatness of the quotient is indispensable.
- `IntegralCurveEquations.emptyBase` (degenerate): On the empty base every sheaf statement is vacuous, and one may choose d₀=2; no geometric-point test manufactures a nonempty family.

**Sources.**

- clm, Lemma 7.1, pp.29–30; Theorem 7.2, pp.30–31. The fieldwise degree-of-equations argument motivates this integral specialization; the integral uniformity proof is supplied here using the existing relative regularity contracts.
- stacks, Tags 02O1, 01Q3 and 01VG; numbered statements listed in the source receipt. Relative Serre vanishing and generation on the fixed quasi-compact parameter family permit a uniform threshold; no ampleness neighbourhood changes with degree in this step.

### One determinant line over the integer base

**ID:** `StableReductionPartII:MC.4/fixed-degree-ample-descent` (theorem).

Let M be the proper coarse algebraic space of the stable genus-g stack over Z, g≥2. Let V→M̄_g be a representable finite surjective scheme cover, and put h:V→M. Fix any d at least the bound of integral-hilbert-kernel for the pulled-back family, and λ=det f_*ω^{3d} on V. Suppose the generic positivity supplier gives the parent moduli-determinant-ample criterion in every characteristic, and there are a line L on M and e>0 with h*L≅λ^e. Then λ is ample over Z, L is ample over Z, and M is a projective Z-scheme. Neither V nor its fibres need be integral for this argument.

**Hypotheses.**

- M̄_g is proper finite type Deligne–Mumford over Z, with finite inertia.
- The finite scheme-cover and coarse power-descent contracts are separate inputs, not consequences of coarse-space existence.
- The determinant and its descent power are fixed before testing fibres.

**Direct prerequisites.**

- `StableReductionPartII:MC.4/integral-hilbert-kernel`
- `StableReductionPartII:MC.4/coarse-space`
- `StableReductionPartII:MC.4/moduli-determinant-ample`
- `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.5`

**Construction or proof.**

1. Properness of the stack and finiteness of V→M̄_g imply V is a proper finite-type Z-scheme. The composite h is proper and quasi-finite, hence finite; its geometric fibres have finitely many points by the finite stack cover and the coarse geometric-point property.

2. Apply the fixed-degree multiplication and ideal comparison on every V_s over an algebraically closed residue field. The family has finite coarse moduli fibres, so the parent ampleness criterion makes λ_s ample. Reduce nilpotents and components only through the generic criterion, without assuming the total cover normal.

3. Apply fixed-line openness of ampleness to λ on the proper scheme V over Spec Z (Stacks 0D2N). The resulting open sets cover Spec Z; relative ampleness is local on the base, so this single λ is relatively ample. No comparison between λ_{3d} for different d is used.

4. The same holds for λ^e=h*L. Descend relative ampleness across the finite surjection h using the generic algebraic-space finite descent theorem. An algebraic space carrying such a relatively ample line over Spec Z is a scheme and is projective.

5. Only after projectivity and irreducibility choose a dominating component and normalize to obtain the parent normal integral projective cover. This removes the potential circular use of irreducibility to construct the initial parameter scheme.

**Acceptance.**

- Do not replace the initial cover by an integral dominating component before irreducibility has been proved.
- No arbitrary-base-change theorem for coarse spaces is used; the family direct images do commute with arbitrary base change.

**Sources.**

- clm, Theorem 7.2, pp.30–31, with parent source issue StableReductionPartII/E13. Its conclusion is retained, while integral regularity fixes the determinant before fibrewise ampleness and openness.
- ehkv, Theorem 2.7 p.5, proof §4.1 pp.12–13. Finite-type stacks over a Noetherian ground scheme with quasi-finite diagonal admit a finite surjective scheme cover; no fine-level interpretation is supplied.
- stacks, Tag 0D2N, Lemma 30.21.4; Tag 01VG. The fixed-line openness and locality argument is applied on the proper scheme V, so an algebraic-space version of that openness lemma is not assumed.

### Jacobi level as an abelian Teichmuller component

**ID:** `StableReductionPartII:MC.4/jacobi-teichmueller-comparison` (comparison).

Fix g≥2 and N≥3, B=Spec Z[1/N], and G=(Z/N)^{2g}. On the smooth genus-g stack the sheaf of exterior epimorphisms from the prime-to-residue-characteristic fundamental group to G is the full abelian torsion-frame sheaf, after the canonical H¹/Jacobian dual-and-Tate-twist comparisons. In this sheaf the homogeneous symplectic-similitude frames form an open and closed subfunctor, stable under GSp_{2g}(Z/N). Its multiplier map has target the primitive-pairing scheme B_N=Spec Z[1/N,ζ_N]. Fixing a B_N-point gives exactly the symplectic Jacobi-level problem; the unconditioned sheaf of all frames is larger. Pairing conventions use e_N:J[N]×J[N]→μ_N, whereas DM 5.3 uses the H¹ pairing with values in μ_N^{-1}.

**Hypotheses.**

- Import the relative Jacobian, canonical polarization and arbitrary pullback on the Noetherian MC.1 atlas from JC1, and effective polarized-family descent from R09.4.
- N is invertible, so torsion and frame sheaves are finite étale; the comparison is étale-local and natural in the base.
- The primitive root is part of the base change, not a choice silently made over B.

**Direct prerequisites.**

- `StableReductionPartII:MC.4/full-level`
- `JacobianChallengePartII:JC1/relative-jacobian`
- `JacobianChallengePartII:JC1/jacobian-base-change`
- `JacobianChallengePartII:JC1/principal-polarization`
- `AlgebraicModuliForArithmeticGeometry:R09.4`
- `SchemeAndStackFoundations:SF.3`

**Construction or proof.**

1. Use relative Kummer theory to identify J[N] with R¹f_*μ_N, and duality between H¹ with constant coefficients and the abelianized fundamental group modulo N. Exterior conjugation is trivial because G is abelian.

2. An epimorphism to G from the rank-2g abelianization modulo N is an isomorphism: a surjection of finite free modules of equal finite cardinality has zero kernel, including composite N.

3. Transport the cup-product orientation through the dual and Tate twist. Retain its inverse on changing between the H¹ and torsion conventions; test rather than erase this sign/twist.

4. Étale-locally all relevant sheaves are finite constant, so the condition that an isomorphism takes the symplectic form to a scalar multiple is a union of connected components. The scalar is primitive and defines the multiplier morphism.

5. Fixing the multiplier gives the symplectic level problem; the full GL-frame sheaf is a finite union of translates of the homogeneous subfunctor. This comparison is used only over the smooth locus.

**Acceptance.**

- Do not call all GL frames symplectic similitudes when g≥2.
- An H¹-level frame and a torsion frame require the specified dual and twist; a literal identification of their pairings is wrong.

**Uses.**

- `StableReductionPartII:MC.4/boundary-level-normalization`: Identifies the smooth finite cover with a component of the abelian Teichmuller cover to which DM 5.9 applies.
- `StableReductionPartII:MC.4/complex-level-orbits`: Identifies the fixed multiplier fibre with the symplectic frame orbit problem.

**Planning API.**

- `JacobiTeichComparison.frameEquivalence` (equivalence): After the Kummer and dual/twist comparison, the abelian exterior-epimorphism sheaf equals the torsion-frame sheaf.
- `JacobiTeichComparison.multiplier` (projection): The homogeneous subfunctor maps to Isom(Z/N,μ_N), with inverse-pairing comparison to the DM convention.
- `JacobiTeichComparison.fixedPairing` (characterisation): The fibre at ζ_N is the exact symplectic-level sheaf, not the homogeneous sheaf with ζ forgotten.
- `JacobiTeichComparison.baseChange` (functoriality): Kummer, duality, the homogeneous subfunctor and multiplier commute with every pullback between admissible bases.

**Unit tests.**

- `JacobiTeichComparison.genusTwoNonSimilitude` (non-example): For N=3 and a standard symplectic basis e₁,f₁,e₂,f₂, scaling e₁ by 2 and fixing the other basis vectors is invertible but scales the two symplectic blocks differently; this GL₄-frame is outside GSp₄.
- `JacobiTeichComparison.multiplierThree` (computation): Over C at N=3 there are two primitive pairing choices, ζ₃ and ζ₃^{-1}; the homogeneous problem has both and a fixed component has one.
- `JacobiTeichComparison.compositeLevel` (compatibility): At N=4 the standard frame is an abelian epimorphism and has multiplier 1 after the chosen trivialization, although Z/4 is not a field.
- `JacobiTeichComparison.primeDividingLevel` (non-example): In characteristic p with p|N, J[N] need not be finite étale; the finite-étale frame argument is inapplicable.

**Sources.**

- dm, Definitions 5.3–5.8, pp.105–106; 5.14–5.15, pp.108–109. Jacobi level is an open-and-closed part of abelian Teichmuller level, and the multiplier separates the fixed symplectic problems.

### Tame normalization of a fixed pairing level

**ID:** `StableReductionPartII:MC.4/boundary-level-normalization` (construction).

Over B_N=Spec Z[1/N,ζ_N], let U be the smooth genus-g stack and U_N its fixed-pairing Jacobi-level cover, g≥2 and N≥3. Normalize the stable stack M̄_g×B_N in U_N, retaining every generic component. The resulting stack Y is finite over M̄_g×B_N, proper and flat of finite presentation over B_N; every geometric fibre of Y is normal, and U_N is dense in every such fibre. Consequently its geometric fibre component count is locally constant on B_N and equals that of U_N. Y is not asserted to be a scheme, a smooth stack, or a naive nodal full-level moduli problem.

**Hypotheses.**

- The parent MC.1 boundary charts are relative normal-crossing charts on the smooth stable stack.
- The DM tame Teichmuller normalization theorem applies to G=(Z/N)^{2g}, whose order N^{2g} is invertible on B_N.
- Use the exact finite normalization and normal-component comparison supplier contracts; no arbitrary normalization/base-change claim is made.

**Direct prerequisites.**

- `StableReductionPartII:MC.4/jacobi-teichmueller-comparison`
- `StableReductionPartII:MC.1/normal-crossing-boundary`
- `StableReductionPartII:MC.1/proper-moduli`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`
- `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`
- `SchemeAndStackFoundations:SF.1`

**Construction or proof.**

1. Use the open-and-closed abelian Teichmuller comparison to select the fixed-pairing component before normalization. Normalize each generic component and descend the finite normalization from étale atlases (R09.5).

2. Apply the tame local theorem of DM 5.9–5.10. On strict local normal-crossing charts, the cover is dominated by adjoining roots of the boundary parameters of order invertible on the residue base, and the normalization is obtained by the appropriate finite tame quotient.

3. The generic Kummer-chart supplier must give flatness and geometrically normal fibres after taking this quotient; its proof uses the root charts, tame invariants and normality. This is the explicit SF.1 extension request, not a consequence of normalization being finite.

4. The nonempty smooth part is dense on every geometric fibre by those same boundary charts. Apply the proper-flat-geometrically-normal component-count theorem from DM 4.17/4.19 and 5.11.

5. A normal Noetherian geometric fibre has disjoint irreducible components, so deleting this dense boundary complement preserves its connected-component count.

**Acceptance.**

- The tame hypothesis concerns G of order N^{2g}, not the order of GL or Sp acting on its frames.
- In characteristic 2, level 3 is admissible even though Sp₄(F₃) has even order.
- Geometrically normal fibres are a theorem of the Kummer local description; ordinary normalization alone does not imply it.

**Uses.**

- `StableReductionPartII:MC.4/level-connectedness`: Transfers the complex fixed-pairing component count to all fibres of the cyclotomic base.
- `StableReductionPartII:MC.4/irreducible-geometric-fibres`: Allows the choice of level 3 or 4 according to the residue characteristic.

**Planning API.**

- `CompactJacobiLevel.normalizationMap` (projection): Y→M̄_g×B_N is the finite normalization in the prescribed generic cover.
- `CompactJacobiLevel.smoothRestriction` (compatibility): Its inverse image over U is the original fixed-pairing smooth level cover U_N.
- `CompactJacobiLevel.geometricFibre` (characterisation): Every geometric fibre is normal and contains the original smooth-level fibre densely.
- `CompactJacobiLevel.componentCount` (compatibility): The connected-component count of a geometric fibre is locally constant and equals that of its smooth open.

**Unit tests.**

- `CompactJacobiLevel.emptyBoundary` (compatibility): Restriction to a smooth stable-moduli chart gives the original finite étale level cover; the normalization adds no sheets there.
- `CompactJacobiLevel.nonseparatingNode` (non-example): A nonseparating nodal degeneration has nontrivial unipotent homology monodromy; its level cover can ramify at the boundary and is not required to be étale there.
- `CompactJacobiLevel.levelThreeAtTwo` (computation): For N=3, G=(Z/3)^{2g} has odd order and satisfies the tame theorem in characteristic 2; rejection because the symplectic deck group has even order is incorrect.
- `CompactJacobiLevel.levelExcludedPrime` (non-example): The construction and its normal-fibre theorem are not asserted above any prime dividing N.

**Sources.**

- dm, Theorem 5.9 and local Lemma 5.10, p.106; Corollary 5.11, p.107; 5.15, pp.108–109; §4.17–4.19, pp.103–104. The tame normalization and proper component-count route transfers connectedness to every admissible characteristic. The statement is an application of this route, not fine representability on the boundary.

### The complex fixed-pairing orbit calculation

**ID:** `StableReductionPartII:MC.4/complex-level-orbits` (theorem).

Let g≥2, N≥3 and ζ_N∈C be primitive. Assuming the generic marked-surface uniformization and integral symplectic-reduction supplier contracts, the analytification of the fixed-pairing smooth curve level scheme is connected: its components correspond to orbits of the orientation-preserving genus-g mapping class group on symplectic frames modulo N, and that action is transitive. This complex calculation together with boundary-level-normalization proves every geometric fibre over B_N is connected.

**Hypotheses.**

- Use the actual analytification of the MC.4 fine smooth scheme, with the H¹/torsion convention of jacobi-teichmueller-comparison.
- The Teichmuller space is connected; its mapping-class quotient supplies the analytic moduli comparison, rather than an assumed connected moduli space.
- The integral symplectic reduction Sp_{2g}(Z)→Sp_{2g}(Z/N) is onto for composite N as well as prime N.

**Direct prerequisites.**

- `StableReductionPartII:MC.4/fine-level-scheme`
- `StableReductionPartII:MC.4/jacobi-teichmueller-comparison`
- `StableReductionPartII:MC.4/boundary-level-normalization`
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`
- `tauceti:TauCetiRoadmap/GeometricTopology#layer-3-diffeomorphism-groups-with-the-c-topology`

**Construction or proof.**

1. Use connected marked Teichmuller space and identify the analytic moduli cover as the quotient of its product with the finite set of frames. Components are the mapping-class orbits of that finite set.

2. The mapping-class action on integral first homology surjects onto Sp_{2g}(Z) (DM 5.12). Reduce modulo N; use elementary symplectic generators over Z/N, or Chinese remainder and prime-power generators, rather than a finite-field-only argument.

3. The symplectic group acts transitively on its own frame torsor, so there is one orbit. Connected analytification implies connectedness of the algebraic complex fibre.

4. Since B_N is connected, the locally constant component count from boundary-level-normalization equals one everywhere. Geometric normality plus density then gives connectedness of the smooth fibre, and smoothness makes it irreducible.

**Acceptance.**

- Fix the primitive pairing before computing orbits; homogeneous level can have several multiplier components.
- The cited upstream Fuchsian and topology layers do not themselves contain Teichmuller theory or this homology-action theorem. Their precise Part II extensions remain explicit requests and gaps.

**Sources.**

- dm, 5.12–5.13, pp.107–108; 5.15 and Lemma 5.16, pp.108–109. DM reduces component counts to the connected marked space and the symplectic orbit calculation. The Weil and Manger inputs it cites have not been read at their original sources here.

## Exact supplier requests

Requests are recorded in this packet; no supplier packet or issue was changed. A request
is a chain endpoint for a planned stage, not evidence that the theorem exists.

### MC4-R1 — `SchemeAndStackFoundations:SF.1`

Extend the descent owner by the finite scheme-cover theorem: every finite-type algebraic stack over a Noetherian ground scheme with quasi-finite diagonal admits a representable finite surjective map from a scheme. Record the quasi-finite-flat atlas, stack Zariski Main, finite normalization and Galois-translate gluing proof; the cover need not be separated until properness of this particular stack is used. Also supply proper quasi-finite algebraic-space maps are finite and a finite surjection descends relative ampleness to an algebraic space, yielding schemeness and projectivity when the base is affine.

**Needed by:** `StableReductionPartII:MC.4/fixed-degree-ample-descent`, `StableReductionPartII:MC.4/finite-projective-cover`.

**Source route:** EHKV Theorem 2.7 p.5 and proof pp.12–13; CLM Lemmas 1.2–1.3 pp.2–3. Finite normalization itself is already SF.0/R09.5.

### MC4-R2 — `SchemeAndStackFoundations:SF.1`

For a quasi-compact finite-type separated Deligne–Mumford stack over a Noetherian base with coarse space q and an invertible sheaf Λ, supply an integer e>0 and an invertible sheaf L on the coarse space with q*L≅Λ^e. Work in the non-tame integer-base case. Keep the actual groupoid norm cocycle; the forgetful map from equivariant Picard groups need not be injective. A corrected proof source must be read before this contract is counted closed.

**Needed by:** `StableReductionPartII:MC.4/fixed-degree-ample-descent`, `StableReductionPartII:MC.4/projective-coarse`.

**Source route:** Parent StableReductionPartII/E7, CLM Lemma 1.5 pp.3–5 and the parent-reported corrected NSF copy pp.4–6. This run read only the 2021 version, not that correction.

### MC4-R3 — `SchemeAndStackFoundations:SF.5`

Extend numerical positivity to vector bundles: E nef iff all line quotients after finite maps from smooth projective curves have nonnegative degree; finite surjective pullback detects nefness; quotients, extensions, tensor products and symmetric powers preserve nefness in every characteristic. For a proper finite-type algebraic space over an algebraically closed field, nef E and a locally free quotient Sym^d E→Q whose projective-frame/Grassmann classifying map has finite geometric fibres imply det Q ample. Include the exact generic normal-Chow, nef-big/intersection and Nakai hypotheses; do not assert Q itself ample.

**Needed by:** `StableReductionPartII:MC.4/moduli-determinant-ample`, `StableReductionPartII:MC.4/pluricanonical-nef`, `StableReductionPartII:MC.4/fixed-degree-ample-descent`.

**Source route:** CLM Definition 4.1 p.11, Lemma 4.3 and Proposition 4.5 p.12, Lemma 4.6 pp.13–14 and Proposition 4.9 pp.15–17; Proposition 5.5 pp.21–22, using preceding projective-frame construction pp.19–21. Existing SF.5/nef-big and AlgebraicVectorBundles L0 supply only parts.

### MC4-R4 — `SchemeAndStackFoundations:SF.5`

Route a generic surface extension outside this curve-moduli packet. Required contracts: (a) for a smooth projective minimal general-type surface over an algebraically closed field and m≥2, h¹(ω^m)=0 except possibly characteristic 2, m=2, where h¹≤1; (b) the same bound after twisting by a reduced sum D of disjoint smooth genus≥2 curves with trivial normal line; (c) a smooth projective fibred surface with connected smooth generic fibre of genus≥2 over a genus≥2 base is of general type, including positive characteristic; (d) precise crepant rational-double-point resolution and pluricanonical pushforward under exceptional contractions, tracking marked divisors; (e) the genus-zero Hodge-index and genus-one canonical-bundle/Euler–Noether bounds needed for the pointed induction. These are separate key theorems, not all consequences of (a). Include Noetherian spreading of a negative quotient and coherent base-change localization to reduce characteristic zero to positive characteristic in the smooth-generic nef argument.

**Needed by:** `StableReductionPartII:MC.4/smooth-generic-direct-image-nef`, `StableReductionPartII:MC.4/pointed-normalization-nef`, `StableReductionPartII:MC.4/pluricanonical-nef`.

**Source route:** Ekedahl II Theorem 1.7 pp.126–127, by Serre duality for (a); CLM Lemmas 6.2,6.4 and Proposition 6.7 pp.23–27; Chen–Zhang v1 Theorem 1.3 p.2 and §4 pp.10–11 for (c). Characteristic-zero Mumford 1967 vanishing, BM77 Theorem 2 and Lang80 were not acquired here.

### MC4-R5 — `SchemeAndStackFoundations:SF.1`

Extend finite-normalization descent by the tame relative normal-crossing theorem used in DM 5.9–5.10: for the finite Teichmuller cover with finite group G of invertible order, the finite normalization has local Kummer descriptions yielding flatness, geometrically normal fibres, and fibrewise density of the smooth cover. Include the proper-flat-geometrically-normal component-count theorem for Noetherian algebraic stacks, compatible with selecting an open-and-closed generic cover. Tame ramification means invertible local inertia order; the level frame deck group need not have invertible order.

**Needed by:** `StableReductionPartII:MC.4/boundary-level-normalization`, `StableReductionPartII:MC.4/level-connectedness`.

**Source route:** DM Theorem 5.9 and Lemma 5.10 p.106; Corollary 5.11 p.107; component results §4.17–4.19 pp.103–104. Their purity/Abhyankar/Kummer prerequisites require a generic source decomposition, not a claimed implementation.

### MC4-R6 — `SchemeAndStackFoundations:SF.3`

Supply the relative finite-etale Kummer/cohomology comparison J[N]≅R¹f_*μ_N and its dual description by abelian fundamental-group quotients, with cup-product/Weil-pairing comparison and the inverse Tate twist of DM H¹ conventions, natural under arbitrary base change of smooth proper genus-g families with N invertible.

**Needed by:** `StableReductionPartII:MC.4/jacobi-teichmueller-comparison`, `StableReductionPartII:MC.4/full-level`.

**Source route:** DM 5.3–5.8 pp.105–106; JC1 supplies the relative Jacobian, not this etale comparison.

### MC4-R7 — `AlgebraicModuliForArithmeticGeometry:R09.4`

Supply effective descent of the polarized relative Jacobian from the Noetherian MC.1 atlas and its overlaps, with arbitrary base pullback. The existing field automorphism-rigidity node is already sufficient for the abelian part of MC.4 and must not be replanned.

**Needed by:** `StableReductionPartII:MC.4/jacobi-teichmueller-comparison`, `StableReductionPartII:MC.4/full-level`.

**Source route:** JC1/relative-jacobian, jacobian-base-change and principal-polarization are imported; the exact overlap descent is the parent obligation.

### MC4-R8 — `JacobianChallengePartII:JC1`

Extend the Jacobian direction by the faithfulness theorem Aut(C)→Aut(J(C),λ_C) for smooth projective genus-g curves g≥2 over algebraically closed fields, in every characteristic. Only faithfulness is required for MC.4 rigidity; a full strong Torelli equivalence is not required. Combine this with existing curve automorphism finiteness and the existing R09.4 polarized rigidity theorem.

**Needed by:** `StableReductionPartII:MC.4/level-rigidity`, `StableReductionPartII:MC.4/fine-level-scheme`.

**Source route:** DM 5.14 p.108 cites Serre; Serre appendix pp.17-18–17-20 proves the abelian congruence step, not curve-to-Jacobian faithfulness. A primary proof of the latter remains to be acquired.

### MC4-R9 — `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`

Proposed FuchsianOrbifolds, Part II contract: connected genus-g marked Teichmuller space for g≥2, the mapping-class action and its analytic moduli quotient, and the finite level-cover/orbit description used by complex-level-orbits. Current FuchsianOrbifolds explicitly excludes Teichmuller theory; this request is an extension proposal, not an assertion that Layer 4 contains it.

**Needed by:** `StableReductionPartII:MC.4/complex-level-orbits`.

**Source route:** DM proof 5.13 p.108 and 5.15–5.16 pp.108–109, citing Weil, Bourbaki expose 168 (1957/58), not yet read at the original source.

### MC4-R10 — `tauceti:TauCetiRoadmap/GeometricTopology#layer-3-diffeomorphism-groups-with-the-c-topology`

Proposed GeometricTopology, Part II contract: the orientation-preserving genus-g mapping-class action on H₁(Σ_g,Z) preserves the unimodular symplectic intersection form and surjects onto Sp_{2g}(Z). Supply reduction Sp_{2g}(Z)→Sp_{2g}(Z/N) for all N≥2, with a precise integral symplectic-group supplier rather than a finite-field-only proof. Current Layer 3 supplies the diffeomorphism-group direction, not these statements.

**Needed by:** `StableReductionPartII:MC.4/complex-level-orbits`.

**Source route:** DM 5.12 p.107 and Lemma 5.16 p.109; the Manger 1939 proof cited there remains unread.

## Additional source findings

- **`StableReductionPartII/E-MC4-1`** (error), 2021 author manuscript, Proposition 6.7 proof, p.26, Case 1 higher-direct-image assertion. The pointed induction claims R¹f_*ω^m(D_j)=0 from fibre degrees on a general nodal family with smooth generic fibre. Retain the nefness target, but replace this vanishing step by a proved pointed model/transport or logarithmic positivity argument. The generic evaluation-image repair of Corollary 6.6 does not by itself give the required exact sequence. Blow up a constant smooth genus-g≥2 family at a point of a special fibre. At D_j=0 the exceptional rational tail has degree −m for ω^m and H¹ of dimension m−1. The normalization sequence surjects special-fibre H¹ onto this group, whereas generic H¹ is zero. Top-degree cohomology/base change then precludes the asserted global R¹ vanishing. This is the additional Proposition 6.7 use of the phenomenon in parent E12. Status: new; novelty and publisher-version collation unverified.

- **`StableReductionPartII/E-MC4-2`** (misprint), 1969 printed p.107, first sentence of the proof of Theorem 5.13. The reduction to the complex fibre cites Theorem 5.13 itself. Use Corollary 5.11, the preceding constancy of geometric fibre component counts. That corollary gives exactly the specialization-independent count needed before the complex orbit calculation; a self-reference cannot justify the reduction. Status: new; historical novelty unverified.

## Remaining proof gaps

1. **Generic stack-cover, power-descent and ampleness interfaces remain requested.** The initial finite scheme cover has now been sourced at EHKV and its route decomposed. SF.1 still has to publish its exact finite-cover and ampleness-descent nodes; its Keel–Mori node alone is insufficient. The wild coarse power-descent proof must be checked with the groupoid norm cocycle, rather than the false Picard injection recorded as parent E7. Requests: MC4-R1, MC4-R2.

2. **Generic vector positivity and the Grassmann ampleness lemma.** CLM generic background has been read. Existing AlgebraicVectorBundles L0 gives symmetric powers/determinants and SF.5 gives line nefness, not this vector criterion or det-Q ampleness theorem. The contracts and their proof ingredients are assigned as proposed SF foundations extensions; no implementation or accepted new owner node exists yet. Requests: MC4-R3.

3. **Surface theorems and the unstable pointed transport step.** Ekedahl and Chen–Zhang primary versions are now acquired and read at the indicated statements. Their generic dependencies and the char-zero vanishing source still require supplier decomposition. In the pointed proof, contraction can make previously disjoint markings meet; the coefficient of an exceptional divisor is m minus the sum of coefficients meeting its centre, which need not be nonnegative merely from each a_i≤m. The parent is not closed until a model argument handles those collisions and the ensuing direct-image exactness. Do not extend special-fibre H¹-vanishing to arbitrary unstable nodal curves. Requests: MC4-R4.

4. **Tame Kummer normal-fibre supplier.** The DM proof has been read, including the finite abelian group route avoiding a prime-to-order condition on the symplectic deck group. Its local normality, flatness and component-count theorem remain generic contracts; finite normalization in R09.5 supplies none of these by itself. Requests: MC4-R5.

5. **Relative cohomological comparison and polarized atlas descent.** JC1 exact relative Jacobian and polarization nodes are imported. Kummer duality, twist compatibility and effective polarized-family descent must still be exported by SF.3/R09.4. Requests: MC4-R6, MC4-R7.

6. **Curve-to-Jacobian faithfulness source.** Serre rigidity has been read at its original source and the needed polarized result is already another packet node. The missing curve faithfulness input is narrowed from a full strong Torelli theorem to the precise injection required, with JC1 as the proposed owner. Requests: MC4-R8.

7. **Generic Teichmuller, mapping-class and integral reduction suppliers.** The original Weil and Manger sources have not been read. DM gives the reduction route and locators but does not prove those inputs. Current FuchsianOrbifolds excludes Teichmuller theory, and current GeometricTopology does not supply the homology surjectivity theorem; Part II ownership proposals are explicit and require routing. Requests: MC4-R9, MC4-R10.

## Planets and structure

Keep exactly the six parent MC.4 planets: **Coarse curve moduli**,
**Pluricanonical nefness**, **Projectivity of stable coarse moduli**,
**Finite projective moduli cover**, **Full level on smooth curves**, and
**Fine curve moduli with level**. This continuation adds zero planets. The packet's
`planetSelection` names their existing node IDs for assembly.

The proposed foundations Part II extensions own finite covers, wild line-power descent,
tame normalization/component theorems, vector positivity, and a separately scoped
surface theory. Surface ownership is a proposal requiring routing. The proposed
FuchsianOrbifolds Part II and GeometricTopology Part II extensions own the marked
Teichmuller and mapping-class inputs. JC1 is the proposed home for the additional
curve automorphism faithfulness theorem. These proposals do not change an upstream
roadmap or silently extend what its current text promises.

## Acceptance and suggested-file map

A review should verify the following checks before any claim of closure.

1. The ideal sequence remains exact after arbitrary pullback because the quotient
   family is flat. Fix d on the entire finite Noetherian parameter scheme over Z.
2. Apply openness to that fixed determinant on the proper **scheme** cover, then use
   finite ampleness descent to the coarse algebraic space. Do not take maxima of
   changing ampleness neighbourhoods or assume arbitrary coarse base change.
3. Obtain initial finite covers independently of irreducibility. Choose a dominating
   component only after irreducibility; use finite normalization over the excellent base.
4. Check all-characteristic nefness, including the exceptional upper bound one in
   characteristic two, and the marked-contraction problem described above.
5. At level N=3 distinguish the two complex primitive multipliers. At level N=4
   verify the module argument over a ring, rather than a field.
6. At characteristic two and level three use the abelian group of order `3^{2g}` for
   DM's tame theorem; do not impose an order condition on the symplectic frame group.
7. Check the original Teichmuller and mapping-class inputs before closing connectedness.
   Derive stable moduli irreducibility using level three or four according to p.
8. All fifteen parent targets remain imported, every new construction has at least
   three discriminating tests, and combined planets remain at six.

The suggested file has no data definitions. `serre_level_rigidity` and
`serre_level_two` state the original source's endomorphism-ring lemma on the existing
Tau Ceti carrier; they are signatures of supplier mathematics, not new curve-owned
nodes. `boundary_transvection_order` states the finite-level arithmetic check on an
actual 2×2 matrix; two examples cover N=3 and N=4. The last example is the nontrivial
level-two involution on the integral rank-one module. These six signatures have no
omitted mathematical hypotheses. The geometric constructions, their ten
construction API items and eight unit tests, and the comparison's four API items and
four tests are prose targets; WORKERS.md's available-carrier rule requires this split.
There is no claim that the six admitted declarations test or implement the geometry.

`lean-check` passed at the specified pins on 18 October 2026 with exactly six
admitted-proof warnings and no other diagnostics. The structural packet checker
passed with zero errors and zero warnings. The handoff records the final submission
checks and the precise work required for proof closure.

## Source versions and reading receipt

All mathematical statements above are in our own words. No source passage is stored
in the repository. Citations use the exact edition read; neither the Chen–Zhang nor
EHKV preprint pagination is silently transferred to a journal version.

- **clm:** Raymond Cheng; Carl Lian; Takumi Murayama; with Yordanka Kovacheva and Monica Marinescu, *Projectivity of the moduli of curves*. Author manuscript dated 1 July 2021; not collated with a publisher version. [Source](https://chngr.github.io/assets/mgbar.pdf); read 2026-10-18. Entire manuscript pp.1–33; for this target, positivity §§2–5, pp.6–22, and §§6–7, pp.23–31. Parent corrections E7, E9, E10, E12 and E13 are retained by reference. SHA-256 `5314dd91d8957fc775ea40e30d9a9cc12159fd5b61a5f0d2640c41b18f19a829`.

- **dm:** Pierre Deligne; David Mumford, *The irreducibility of the space of curves of given genus*. Public author-hosted scan of Publ. Math. IHES 36 (1969), pp.75–109. [Source](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1969c--IrredModCurves-Deligne-Numdam.pdf); read 2026-10-18. §4, pp.96–104, particularly 4.13–4.21; §5, pp.104–109, including proofs 5.9–5.16. SHA-256 `d779973708ecef9a098db863df766f173740d75302f15655e4bbc9dd7df739e7`.

- **serre:** Jean-Pierre Serre, appendix to Alexandre Grothendieck, expose 17, *Rigidite du foncteur de Jacobi d echelon n >= 3*. Seminaire Henri Cartan 13 (1960/61), expose 17, appendix pp.17-18–17-20; public Numdam scan. [Source](https://www.numdam.org/item/SHC_1960-1961__13_2_A4_0.pdf); read 2026-10-18. Appendix pp.17-18–17-20, including scheme-theoretic divisibility, finite-order theorem and root-of-unity lemma. SHA-256 `5c993695a16086ff090c51d0f486f39bf0bb035ad4edde4e7c75abe64f5d39f7`.

- **ehkv:** Dan Edidin; Brendan Hassett; Andrew Kresch; Angelo Vistoli, *Brauer groups and quotient stacks*. arXiv:math/9905049v3, 12 February 2001; pagination of this version only. [Source](https://arxiv.org/pdf/math/9905049v3); read 2026-10-18. Theorem 2.7 and Remark 2.8 p.5; §4.1, Lemma 4.1 and proof of Theorem 2.7 pp.12–13. SHA-256 `b335dd5d040ed8d994a04c2c12e1fb6c87ea7ed328fa3df6b3d95811afe1bdb0`.

- **ekedahl:** Torsten Ekedahl, *Canonical models of surfaces of general type in positive characteristic*. Publ. Math. IHES 67 (1988), pp.97–144; public Numdam scan. [Source](https://www.numdam.org/item/PMIHES_1988__67__97_0.pdf); read 2026-10-18. Introduction and main theorem pp.97–100; Part II Theorem 1.7 and its proof pp.126–127. Other results of the paper have not been independently decomposed here. SHA-256 `0e53d89911bd563cdc5e8a38abc47dc4e990a75e77cbd05055812f6d63b30776`.

- **chen-zhang:** Yifei Chen; Lei Zhang, *The subadditivity of the Kodaira dimension for fibrations of relative dimension one in positive characteristics*. arXiv:1305.6024v1, 26 May 2013, 14 pages; no identification with later journal pagination. [Source](https://arxiv.org/pdf/1305.6024v1); read 2026-10-18. Theorem 1.3 p.2; §4, Theorem 4.3 and proof of Theorem 1.3 pp.10–11. SHA-256 `1812166bab9e188b085c164c1814aa618fb74fb36e00a8a7f6f00d57ec0f3c31`.

- **stacks:** The Stacks Project authors, *The Stacks Project: relative generation, vanishing and ampleness*. Online stable tags read 18 October 2026; numbered tags replace unstable page numbers. [Source](https://stacks.math.columbia.edu); read 2026-10-18. Tags 02O1 (Lemma 30.16.2), 01Q3 (Proposition 28.27.13), 01VG (relative ampleness), 0D2M (Lemma 30.21.3), 0D2N (Lemma 30.21.4), 0DUT (Theorem 106.13.9), statements and proofs.

The parent source findings E7, E8, E9, E10, E12 and E13 remain in the accepted parent
packet and are cited by their stable IDs rather than duplicated. They cover the false
forgetful Picard injection, the missing finite-type/properness step, contraction and
determinant slips, unstable section vanishing, and the fixed-degree quantifier gap.
The corrected non-tame norm proof reported in the parent's NSF source receipt has not
been independently read in this run; it remains MC4-R2. Missing original sources also
include Weil's Bourbaki 168 and Manger 1939, the characteristic-zero Mumford 1967
vanishing input, BM77 Theorem 2 and Lang80 Lemma 1. No unread text is marked as read,
and no copy of a non-cleared book was used.
