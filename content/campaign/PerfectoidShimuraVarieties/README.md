# Roadmap: Shimura towers and perfectoid representability

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

## Purpose and precise generality

Define infinite p-level Shimura towers for every pure Shimura datum, and prove perfectoid representability for the broad class with a verified complete proof route: pre-abelian type, including its minimal compactification. Construct compatible Hodge–Tate maps and coefficient comparisons in the scopes stated below. Treat the modular and Hilbert towers as explicit instances, not as motivations only.

The selected sources are Scholze's construction for Siegel/Hodge type, Hansen–Johansson Theorem 1.5 and §5 for pre-abelian minimal compactifications, and Boxer–Pilloni §4.4 for the period maps and torsor comparisons. BHW §§2,5,8 supply the detailed modular/Hilbert comparisons.

This scope is not a claim that pre-abelian type is the limit of present research. More recent work on exceptional cases is recorded in the separate dated source audit. Those arguments require their own checked hypotheses and extra foundations; they are not silently substituted for the sources used in this implementation plan.

## Inputs and conventions

Consume V8, R0–R5, PerfectoidSpaces P1–PerfectoidSpaces P9, C where compactifications are used, and T0–T5 for the abelian construction. T6 is required only for S6's general logarithmic statement. At a p-adic place choose a complete algebraically closed extension `C/ℚ_p` and an embedding of the reflex field into C for the general representability theorem. Descent to other bases is a further theorem, not implicit notation.

Write `S_K` for the analytified canonical model and reserve superscripts `min` and `tor` for compactifications. Define

\[
S_{K^p,\infty}^{\diamond}=\varprojlim_{K_p} S_{K^pK_p}^{\diamond}.
\]

This definition requires no perfectoidness hypothesis. A perfectoid representative is supplied by an existence theorem, together with an isomorphism to this sheaf and the corresponding tilde-limit comparison.

## Milestones

<a id="s0"></a>

### S0. Finite and infinite towers

**Dependencies:** V8, R1/R4, PerfectoidSpaces P7–DiamondsAndVStacks D4/D6.

Construct the p-level inverse systems, prove cofinality of the chosen principal/congruence systems, and construct their right group actions with the correct level changes. Form the inverse limits as v-sheaves/diamonds and prove the local spatial and topological comparisons needed by the applications.

Compute the effective deck groups and distinguish the full tower, a connected-component tower, and a tower retaining a moduli rigidification. Central rational elements and their closures in the finite adeles must be accounted for. Do not describe every tower as a `K_p`-torsor without calculating the kernel.

<a id="s1"></a>

### S1. The Siegel construction

**Dependencies:** S0, M2–M4, C4–C5, T3–T4, PerfectoidSpaces P7.

Construct the anticanonical tower through the canonical-subgroup quotient maps. Prove that its integral transition maps approximate Frobenius with the required estimates and that the completed direct-limit rings are perfectoid. Construct a covering of the full tower by translates of these affinoid perfectoid pieces and prove compatibility on overlaps.

Extend the construction to the minimal compactification using the boundary/normalization construction of the source. Prove the gluing and the closedness of the boundary. At elliptic cusps the local perfectoid q-disc construction is required; the open finite étale torsor proof does not establish the compactified result.

<a id="s2"></a>

### S2. Hodge type

**Dependencies:** S1, D4, V6/V8, C2–C5 where applicable, PerfectoidSpaces P8 and PerfectoidQuotients Q4, T2.

Choose a symplectic embedding, compare finite-level varieties with their Siegel images, and construct the normalized/perfectoidized local models required by Scholze's proof. Establish perfectoidness and identify the represented tower sheaf. Prove independence of the symplectic embedding through the tower's universal property and comparison of auxiliary constructions.

The proof cannot consist merely of saying that the tower is a closed subset of a perfectoid Siegel space. Its structure sheaf and the perfectoidness of its local algebras must be established. No smooth hyperspecial model of an arbitrary Hodge-type group at the fixed p is assumed.

<a id="s3"></a>

### S3. Hodge-type period map and coefficients

**Dependencies:** S2 and T2, together with the compactified tensor comparison where used.

Construct the Hodge–Tate period map on the open perfectoid tower. Prove its equivariance, functoriality under datum morphisms, and pullback identification of the Levi torsor and its associated algebraic automorphic bundles. Construct the extension to the compactification in the precise Hodge-type form provided by the source, distinguishing auxiliary normalized compactifications from the canonical minimal one.

Identify the elliptic map with the quotient-line construction and `π_HT*𝒪(1)=ω`. Identify the Hilbert map with the restriction-of-scalars flag variety, and its factors after an explicitly stated splitting extension. This theorem supplies the compatible functions used by O; naming an abstract period map without its tautological-bundle pullback is insufficient.

<a id="s4"></a>

### S4. Pre-abelian perfectoid representability

**Dependencies:** S2, the connected-component/isogeny comparisons V6/V8, and PerfectoidSpaces P8 and PerfectoidQuotients Q4.

Implement the complete descent argument of Hansen–Johansson §5: compare connected towers with the auxiliary Hodge-type datum, prove the finite-group quotient results at infinite level, reconstruct the full tower from components and group actions, and descend the minimally compactified construction. Prove the perfectoid representative of both the open tower and its minimal compactification, together with their sheaf-limit identifications and the Zariski-closed boundary.

Use the definition of pre-abelian type from D4, not the stronger abelian-type hypothesis unless a particular intermediate theorem needs it. Conversely, do not transfer an abelian-type theorem solely from an adjoint isomorphism without proving the necessary connected-tower statement.

Hansen–Johansson's revised theorem supplies representability. It must **not** be cited as having proved the additional Hodge–Tate-map statement removed from that version. S6 has the separate period-map proof.

<a id="s5"></a>

### S5. The modular and Hilbert towers

**Dependencies:** S1–S4, H4–H5, C6, T4–T5.

Prove comparison with the tower obtained directly from #81's modular curves, including fixed Weil-pairing components and tame level. Identify completed cusp charts and the action on q-parameters.

For Hilbert varieties compare the geometric, intermediate, and arithmetic towers from H4. Prove the full-tower profinite polarization torsor statement and the different finite torsor statement on connected components. Identify the period maps and coefficient trivializations across these comparisons. Preserve the arithmetic unit action and adjugate level convention. Prove compatibility with canonical/anticanonical domains and their radii at every rational prime.

<a id="s6"></a>

### S6. General period maps and the abelian-type minimal extension

**Dependencies:** S0, T6, B1–B3, C1–C3; for the abelian-type perfectoid assertion also S4.

For an arbitrary datum, construct the Hodge–Tate map from the **toroidal tower diamond** and the canonical Levi-torsor pullback isomorphism via Boxer–Pilloni Theorem 4.4.40. On abelian-type data prove the further minimal-compactification period-map construction and compatibilities through the auxiliary torus/fibre-product and finite-quotient argument in §4.4. Do not identify that argument with the pre-abelian representability proof.

The generic interface distinguishes three results: a map on the general toroidal diamond; perfectoid representability of pre-abelian minimal towers; and the additional minimal period-map theorem in the established abelian/Hodge scope. In the Hilbert case all the needed conclusions are proved and compared by S5.

## Completion conditions

Every object called a perfectoid Shimura variety has a proved representability theorem and an identified underlying finite-level tower. General tower definitions remain available outside that theorem's class. Every period map comes with a checked source, target, action convention, and coefficient comparison. Neither canonical models, good reduction, nor infinite level alone are used as a shortcut to perfectoidness.


## Implementation handoff: Represented towers and period-map scope

**Stages:** S0, S1, S2, S3, S4, S5, S6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Start with the tower diamond and its actual level maps. For each representability theorem produce the affinoid perfectoid rings, transition maps, gluing and identification with the inverse-limit sheaf. The minimal pre-abelian theorem and the general toroidal period-map theorem are distinct outputs with different source routes.

**Acceptance and consumer contract.** Check completed modular cusp discs, a Hodge-type closed embedding with its structure sheaf, and the effective polarization quotient in a Hilbert tower. The pullback of the tautological quotient bundle must match the Hodge bundle in the chosen dual convention. A source version from which a period-map theorem was removed cannot prove that map; S6 must supply the separate construction.

## Source anchors and prototype coverage

- PerfectoidShimuraVarieties source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.

<a id="stage-S0.general"></a>

## S0.general. General-data completion interface

**Dependencies:** S0 and ShimuraVarieties V8.general.

Construct the general-data infinite-level diamond as the limit of the actual finite-level canonical models. This suffix does not claim general perfectoid representability or an HT map; S6 adds the logarithmic period-map theorem.
