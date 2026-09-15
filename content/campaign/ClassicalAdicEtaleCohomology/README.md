# Roadmap: the classical analytic cohomology inputs to diamonds

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

ECD's proof imports substantial results from Huber. AdicSpaces constructs structure sheaves
and an absolute period curve; it does not supply these cohomology theorems. This component
constructs the classical results **without using the diamond results that depend on them**.
The main source is Hub96. The precise entry points are recorded below and in the source
contracts. They are proof tasks, not axioms standing in for a formalization of the book.

Use the scheme carriers and scheme base-change/compact-support results supplied by
CohomologicalPointCounting. Reuse the algebraic-curve and formal-model infrastructure when
its proved scope matches; extend it here where needed. The classical derived theory first
uses ordinary bounded-below derived categories, with enhancement from E1 only when a later
comparison needs it. Thus no derived diamond theory is needed to start.

## H0. Classical étale sheaves, stalks, and direct image

Using A1–A2 and D0, construct module sheaves on analytic adic étale sites, injective resolutions,
ordinary `D⁺`, derived global sections and direct image. Construct torsion local systems,
constructible sheaves in the appropriate classical analytic sense, twists, supports, and
geometric stalks. Prove affine-local descriptions, the stalk formula over strict localization,
Leray, Čech-to-derived comparison, and continuity under the cofiltered limits used in the
classical proofs. State which limits are adic inverse limits and which are Huber tilde-limits;
a tilde-limit is not by notation a categorical inverse limit.

The rational acyclicity of `𝒪` from AdicSpaces is not the vanishing of étale cohomology with
constant torsion coefficients. Prove every comparison actually used. Preserve field pairs
`Spa(C,C⁺)` rather than silently replacing all of them by `Spa(C,𝒪_C)`.

## H1. Formal models, specialization, and nearby-cycle comparison

The trait theory is supplied by
[LefschetzPencilsAndVanishingCycles LPV.0–2](../LefschetzPencilsAndVanishingCycles/README.md#lpv-0).
It does **not** supply the nondiscrete or higher-rank valuation-base theorem. H1 owns
that source-qualified extension and the formal/adic comparison below, on the same scheme
and derived-site carriers. It does not create an incompatible second trait RΨ/RΦ.

<a id="h1-henselian"></a>
<a id="stage-H1:henselian"></a>
### H1:henselian — Henselian pairs and approximation

Using H0, A2 and AdicCoefficientsAndComparisons L2, construct affinoid henselizations,
strict localizations and pro-special subsets; prove Hub96 §§3.1–3.4's cohomology
comparisons and their continuity under étale finite-presentation limits. Track the ideal,
topology and plus ring in every completion. The affinoid henselian-pair theorem and
Zariski–Riemann argument are proof tasks, not an equivalence of all analytic/algebraic
sites. Source: Hub96 3.2.5, 3.2.9–3.2.12 and their proofs in §§3.3–3.4.

<a id="h1-formal-adic-comparison"></a>
<a id="stage-H1:formal-adic-comparison"></a>
### H1:formal-adic-comparison — Formal completion and the actual comparison map

For a formal scheme of type (S) in Hub96 §1.9, construct the specialization morphism
`λ_X : d(X)_et → X_et` and its functor on étale neighborhoods (3.5.1). Identify
`X_et` with the reduced special scheme's étale topos. For a locally closed subset L,
construct the pairs `(X,L)` and pseudo-adic support space `d(X,L)` (3.5.3–3.5.6).
Prove the strict-localization/tube stalk formula 3.5.8, with its type-(S) assumption;
without that assumption use the filtered formula 3.5.9, not a nonexistent analytic
strict-localization space. Prove restriction and open-extension-by-zero compatibilities
3.5.11 from those formulas.

For a scheme X and finite-type ideal defining Y, let `U = X \ Y` and `X̂` be its
completion. Assume either X locally noetherian, or the ideal locally principal and
X̂ of type (S), exactly as in 3.5.12. With maps `i:Y→X`, `j:U→X`,
`a:d(X̂)_et→U_et`, `b:d(X̂)_et→Y_et`, construct the adjunction comparison
`i* Rj* K → Rb* a* K`, and prove it an isomorphism for K in D⁺ with torsion
coefficients (3.5.13). Prove the derived-global-sections and tube restrictions
3.5.14–3.5.15. Retain this theorem's actual torsion scope; the narrower prime-to-residue
restriction enters the valuation-base-change theorem, not by silently rewriting 3.5.13.

For a microbial valuation ring A, X locally finite type over A and the specified ideal
of definition, construct the pseudo-adic subspace over the closed point of d(Spf A)
and prove 3.5.16. Its base need not be a discrete valuation ring. Then identify 3.5.17
for a strictly henselian rank-one DVR and a completed algebraic closure with the
LPV.0 trait RΨ. Huber's terminology “complex of vanishing cycles” here denotes the
nearby-cycle object RΨ, **not** the cone RΦ; verify the map and inertia action, not just
abstract cohomology groups.

<a id="h1-valuation-nearby-cycles"></a>
<a id="stage-H1:valuation-nearby-cycles"></a>
### H1:valuation-nearby-cycles — Arbitrary valuation bases, not just traits

For a quadruple `(X,S,η,s)` of Hub96 §4.2, S is the spectrum of a valuation ring,
η specializes to s, and O_(S,s) is strictly henselian; allow η=s. Let η̃ be the strict
localization at η, with `j:X_η̃→X` and `i:X_s→X`. Define
`RΨ_L(F)=i*Rj*j*F`, its Galois action and the natural base-change map for a morphism
of quadruples and a chosen compatible map of strict localizations. Prove independence
up to the specified equivariant transport and the comparison with geometric η (4.2.3).

Prove 4.2.4: for a Cartesian change of valuation bases the actual base-change map is
an isomorphism for torsion F whose torsion is prime to the residue characteristic
exponent at s. Prove 4.2.5: if X/S is locally finite type, B is noetherian and
annihilated by an integer invertible in k(s), and F is constructible over B, each
`R^nΨ_L(F)` is constructible. These are not asserted for arbitrary p-torsion.

Proof substeps: valuation-theoretic pro-p Sylow/tame comparison (4.2.1–4.2.2), using
the existing continuous Hochschild–Serre owner ArithmeticGaloisDuality R02.1–R02.2;
henselian localization (4.2.3); radicial invariance and projective reduction; induction
on generic-fibre dimension via Gauss valuations; and the Galois-surjectivity/defectless
calculation 4.2.10. For constructibility, construct the controlling constructible
submodule off finitely many closed points and finish by proper cohomology/finiteness
(4.2.5's proof, pp.249–250). This is not an assertion that every valuation ring is a
filtered limit of DVRs. L2 supplies the requisite general-scheme continuity and base
change, while the PR196 finite-type scheme finiteness contracts supply their base cases.
No analytic H2, diamond C1/C2, semipurity or Weil-weight theorem enters this proof.

<a id="h1-valuation-exports"></a>
<a id="stage-H1:valuation-exports"></a>
### H1:valuation-exports — Interfaces for analytic invariance and support

Derive 4.2.6 support/local-cohomology comparisons; 4.2.7 cohomological invariance for
a **surjective** map of valuation spectra with separably algebraically closed fraction
fields; and 4.2.8–4.2.9 constructibility/finiteness with their finite-presentation or
finite-dimension/finite-boundary alternatives. Prove their maps compatible with
H1:formal-adic-comparison. Export these to H2 (4.1.1(c)), H4 (6.2.2), H5 and
the later scheme/adic comparisons. Regression tests include a nondiscrete rank-one
valuation, a higher-rank plus ring, η=s, a non-surjective base map (no invariance claim),
and torsion with residue characteristic dividing its annihilator (no 4.2.4 claim).

## H2. Invariance under extension of an algebraically closed valued field

Prove the form of Hub96 Theorem 4.1.1(c) required in ECD Lemma 16.3: for an extension of
complete algebraically closed nonarchimedean fields with compatible open bounded valuation
subrings and the stated surjectivity condition, the relevant prime-to-`p` torsion cohomology
comparison is an isomorphism. Include the version for extension by zero from the open subsets
occurring in that lemma, not just constant cohomology over the base point.

Follow the classical finite-type/strict-localization and formal-model proof. Establish
approximation of perfectoid affinoids by the p-finite analytic spaces used in Sch12, finite-stage
descent of étale data, and passage to the cohomological limit. Distinguish the analytic
approximation spaces from perfectoid limits. The special Lemma 16.3 is then applied in C1 to
prove ECD Theorem 16.1. It may not be proved from C1 or from the v-locality theorem 14.12.

Also supply geometric-connectedness invariance under algebraically closed analytic base
extension, used in ECD Lemma 14.6. A connectedness assertion is a separate theorem with a
proof, not an inference from an as-yet undefined enhanced étale category.

## H3. Proper support, traces and Poincaré duality for curves

Construct Huber's proper-support direct image in the classical eligible scope using his
compactification/partial-properness and support definitions. Prove independence, localization,
proper agreement, base change, and the finite cohomological-dimension statements needed here.
The source's pseudo-adic treatment of support subsets may be implemented internally; do not
pretend every topologically closed complement is a closed adic subspace.

For smooth analytic curves over a complete algebraically closed nonarchimedean field, construct
the trace and the duality pairing. Prove the trace normalization, compatibility with finite
étale maps and restrictions, nondegeneracy, and the finite-dimensionality required to pass
between a complex and its dual. Supply the relative and valued-plus-ring versions actually
used by ECD 24.1, including the relevant open-extension-by-zero compatibility.

The explicit Hub96 outputs are Proposition 5.5.8 (dimension bound), Theorem 7.2.2 (trace) and
Theorem 7.5.3 (duality). Import the scheme trace/purity and pairing from
[EtaleDualityAndPerverseSheaves EDC.2](../EtaleDualityAndPerverseSheaves/README.md#edc-2),
then prove henselian comparison, local residue/trace computations and formal-model
transfer here. The scheme theorem remains a prerequisite proof task at that owner,
not a second construction hidden inside H3. Do not use diamond cohomological smoothness or `Rf^!` to prove
this classical input.

## H4. Constructibility in curve families and annulus computations

Prove the instance of Hub96 Theorem 6.2.2 used for a relative ball over the finite-type bases
approximating a strictly totally disconnected perfectoid space. It is not enough to prove
finiteness for one curve over one algebraically closed point: ECD 24.1 needs constructibility
of the pushforward over the approximating base. Build finite stratifications, constructible
stalk control and the base-change/finite-presentation arguments used in that result.

Prove the prime-to-`p` cohomology and restriction maps for the discs, punctured discs and
annuli used in ECD 19.5 and 24.1. Include Kummer classes, roots of unity, radii change,
base-field change and compact-support normalization. Transfer the appropriate cases to
perfectoid limits using P5–P6 and cohomological continuity. No inference that an infinite
pro-étale cover is cohomologically smooth is allowed.

## H5. Algebraic/analytic comparison and compactification of smooth curves

Prove the cases of Hub96 Theorems 3.7.2 and 3.8.1, and Proposition 6.1.1, used in ECD §27:
proper algebraic/analytic direct-image comparison, the relevant cohomology comparison, and
finite-dimensionality for constructible analytic complexes. Track topology on the base ring:
`Spec C` with its scheme structure and `Spa(C,𝒪_C)` are not interchangeable by notation.
Supply the exhaustion-by-balls and overconvergent-sheaf continuity statements used in 27.2.

Prove the compactification input used in ECD §25: the Lütkebohmert theorem cited as
[Lüt95, Theorem 5.3] allowing the smooth rigid-curve reduction there to be embedded into a
proper smooth rigid curve. Include the formal-model/curve-algebraization, normalization,
boundary-annulus and patching prerequisites needed for that specific statement. Prove the
finiteness and boundary-local contribution statements used when passing from the open curve
to its compactification. “Nagata for schemes” alone is not this analytic theorem.

These results also supply the normal-crossing analytic local calculations used in L6. The
existence of the alterations reducing an arbitrary finite-type scheme to such a situation is
L5, not H5 and not a claim of the curve stable-reduction roadmap.

## Proof accounting and completion

The Huber entry points above are identified from ECD's proofs. The implementation must expand
the supporting Huber lemmas into the six stages here and link them to their actual preceding
geometric, henselian, scheme-cohomological or curve-theoretic proofs. An imported result is
not “done” merely because a theorem with that name appears in an external book.

Completion requires the target cases with **all** their coefficient, support, base-field and
relative-base hypotheses, together with their comparison maps. In particular, the scalar-extension
map used in H2, the trace used in H3 and the constructible pushforward used in H4 must be the
same maps used by the later diamond proof; abstractly isomorphic groups do not suffice.

Source verified in round 2: Huber, 1996,
printed pp.201–225 (§§3.5–3.6), pp.240–253 (§4.2), and the entry points above.
The PDF has x+450 pages. Page numbers in this README are printed pages, not PDF offsets.

## Completion contracts added on 2026-09-15

**Applies to:** `H1:formal-adic-comparison`, `H1:valuation-nearby-cycles`, `H2`, `H3`, `H4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Make the H1 comparison an explicit morphism i*Rj*K→Rb*a*K and track it through strict localization and tube restriction. Its stalk computations and inertia action must agree with LPV's trait functor. For H3/H4, separate curve trace at a geometric point from constructibility over a finite-type parameter base; the second requires descent of both sheaf and morphism and a uniform cohomological bound before passage to a perfectoid limit.

### Producer–consumer contract

Return the maps, not abstract equality of Betti dimensions, to C1 and S5. The valuation-base theorem retains surjectivity of spectra and prime-to-residue torsion; the formal-completion theorem keeps its different type-(S)/noetherian alternatives.

### Acceptance and source route

Test a nondiscrete rank-one valuation, a higher-rank plus ring, a non-surjective valuation-base map and radius restriction of an annulus with its Kummer generator.

**Source route:** Hub96 §§3.5/4.2, 7.2.2/7.5.3 and 6.2.2; ECD 16.3/24.1. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
