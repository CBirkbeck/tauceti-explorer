# Roadmap: the existing Fargues–Fontaine curve as a diamond

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

This component does not reconstruct period rings or the adic quotient. It consumes AdicSpaces
Layer 6 and supplies the new comparison with diamonds. The primary additional source is
Fargues–Scholze, *Geometrization of the local Langlands correspondence*, II.1.2 and
II.1.15–18; restrict its coefficient field to `E = ℚ_p` and its perfectoid base to
`S = Spa(F,𝒪_F)` to match the existing construction.

The geometric endpoint is F3. F4 supplies the marked-untilt/Cartier-divisor interpretation;
F5 supplies the derived comparison after the coefficient category exists. F0–F4 do not
require the six-operation or alteration components.

## F0. Reuse the actual adic objects

Fix a prime `p` and a characteristic-`p` perfectoid field `F`, with ring of integers `𝒪_F`.
No algebraic-closedness assumption is imposed for the diamond identification. Obtain from
AdicSpaces Layer 6:

\[
A_{\inf}=W(\mathcal O_F),\qquad
Y_F=D(p)\cap D([\varpi]),\qquad
q:Y_F\longrightarrow X_F=Y_F/\varphi^{\mathbb Z}.
\]

Use its `(p,[ϖ])`-adic topology on `A_inf`, rational annuli, Witt Frobenius and wandering
charts. The open locus is the complement of the zero locus of **the product** `p[ϖ]`;
it is not `D(p) ∪ D([ϖ])`, the larger analytic locus. Do not invert `p` in the initial
Witt ring before specifying which analytic open is being constructed.

Prove the interface statements needed to apply D6: analytic adic structure over `ℤ_p`,
the factorization over `Spa(ℚ_p,ℤ_p)`, agreement of the ring-of-integers conventions, and
the rational-chart and quotient maps as morphisms in the chosen adic category. Transport
through the existing independence-of-`ϖ` isomorphisms. Any missing interface lemma is a
proof about the existing objects here, not a change of their definitions.

## F1. The untilt product formula

Put `S = Spa(F,𝒪_F)`, regarded as a representable sheaf on `Perf`. Construct, naturally
in every characteristic-`p` perfectoid test space `T`, a bijection

\[
Y_F^\diamond(T)\;\simeq\;
\operatorname{Hom}_{\mathrm{Perf}}(T,S)\times
\operatorname{Spd}(\mathbf Q_p)(T).
\]

On an affinoid test object, the left side is a marked untilt `T^♯` with a map `T^♯ → Y_F`.
Use the universal property of Witt vectors of the perfect ring `𝒪_F` and Fontaine's `θ`
to identify continuous maps `W(𝒪_F) → 𝒪⁺(T^♯)` with the corresponding maps into the
integral tilt. The condition that `[ϖ]` maps to an invertible element translates into the
map to `S`; the condition that `p` is invertible translates into the untilt lying over
`ℚ_p`. Prove the topology, boundedness and integral-subring requirements, not just an
algebraic bijection of untopologized rings.

Construct both directions, prove they are inverse, and prove compatibility with restriction
and every morphism of perfectoid test objects. Glue over affinoid covers to obtain an
isomorphism of v-sheaves and then of locally spatial diamonds:

\[
\alpha_F:Y_F^\diamond\xrightarrow{\sim}S\times\operatorname{Spd}(\mathbf Q_p).
\]

Prove compatibility with the projection to `Spd ℚ_p` and with the permitted continuous
field maps. This proof can use the fixed-field period domains already supplied by AdicSpaces;
it does not require constructing the general relative curve over every perfectoid ring.

## F2. Frobenius equivariance and the quotient comparison

Let `φ_S` denote absolute `p`-power Frobenius on `S`, and let `φ_Y` be the adic morphism
induced by Witt Frobenius in the existing roadmap. Check the convention on valuations and
prove the equivariance identity

\[
\alpha_F\circ\varphi_Y^\diamond
=(\varphi_S\times\mathrm{id})\circ\alpha_F.
\]

Check the generator itself, not only the subgroup it generates: an accidental inversion of
the generator has the same orbit sets but gives the wrong equivariance statement. The
existing radius convention scales the relevant logarithmic ratio by `p`; compare this
with the chosen contravariant ring-map convention.

Prove that the adic quotient map `q` is locally an isomorphism on the existing wandering
charts and that its relation is the disjoint union of Frobenius graphs. Construct the
corresponding étale relation and prove its effectiveness after diamondification:

\[
\coprod_{n\in\mathbb Z}Y_F^\diamond
\;\simeq\;Y_F^\diamond\times_{X_F^\diamond}Y_F^\diamond.
\]

Prove that `q^♢` is a cover and that it exhibits `X_F^♢` as the quotient **sheaf**. The
proof uses the local quotient charts and D6's restriction/fibre-product comparisons, not
a false general assertion that diamondification preserves every colimit. Deduce

\[
\beta_F:X_F^\diamond\xrightarrow{\sim}
\bigl(S\times\operatorname{Spd}(\mathbf Q_p)\bigr)/
(\varphi_S^{\mathbb Z}\times\mathrm{id}).
\]

Prove that this identification is over `Spd ℚ_p`, independent of `ϖ` and of a choice of
wandering windows. Its local spatiality comes from the adic comparison. Any stronger qcqs
statement must be justified from the existing quotient's finite chart cover and overlaps,
not merely from the word “curve”.

## F3. Étale-site and finite-cover comparison

Apply the already proved general adic comparison to obtain actual equivalences of sites
and of finite étale categories:

\[
(X_F)_{\mathrm{ét}}\simeq(X_F^\diamond)_{\mathrm{ét}},\qquad
(X_F)_{\mathrm{fét}}\simeq(X_F^\diamond)_{\mathrm{fét}}.
\]

Construct the functors, prove compatibility with covers, and verify that restriction from
`X_F` to the wandering charts of `Y_F` agrees through `α_F` and `β_F`. Prove the étale
sheaf descent description along `q^♢`, including the Frobenius cocycle and its compatibility
with finite étale covers. This is an equivalence of categories with descent data, not a
set-theoretic claim that taking pointwise invariant sections always computes derived invariants.

This is the first complete answer to the requirement “view the Fargues–Fontaine curve from
the adic roadmap as a diamond.” Neither `Bun_G` nor a classification of vector bundles is
needed to reach it.

## F4. Marked untilts and Cartier divisors

Using F1, identify sections of `Y_F^♢ → S` with maps `S → Spd ℚ_p`, equivalently marked
untilts of `S` over `ℚ_p`. An untilt includes the identification of its tilt with `S`; do not
quotient out this marking before proving the Frobenius action.

For an untilt, construct the map to `Y_F` and the local equation given by the primitive
kernel of `θ`. Prove it is a closed Cartier divisor, rather than concluding this solely
from principality in the initial Witt ring. On suitable annular neighborhoods, prove that
multiplication by its generator is injective and has closed image, identify the completed
quotient with the untilt algebra, and establish the exact sequence of analytic sheaves.

The auxiliary analytic argument is the fixed-field case of FS II.1.4: perform the
compatible-root base extension of period annuli, prove their perfectoidness using Q0's
integral perfectoid criteria, compute the tilt, and use the maximum/annulus boundary estimate
to obtain the lower bound for multiplication by the primitive generator. Prove the required
maximum-modulus/Shilov-boundary statements for these one-variable annuli and transfer them
through the split topological module base extension. These analytic estimates are owned here;
F1's functor-of-points formula does not prove them.

Use the Frobenius translates and local quotient charts to descend the divisor to `X_F`.
Prove that the resulting divisor depends on the Frobenius orbit of the marked untilt in the
stated sense. This stage does not assert a classification of **all** closed points for an
arbitrary non-algebraically-closed `F`.

Keep distinct the moduli functor `Div¹ = Spd ℚ_p/φ^ℤ` from the diamond of the fixed
curve. The action in F2 is on `S`, not on the `Spd ℚ_p` factor. A relationship between
underlying topological spaces does not identify the two quotient functors or produce a
structural morphism `X_F^♢ → S`.

## F5. Derived étale comparison

Once C2 exists, lift the site comparison to the left-completed derived categories for the
allowed coefficients. Prove compatibility with pullback, tensor and the actual global-sections
map. In particular,

\[
R\Gamma((X_F)_{\mathrm{ét}},A)
\simeq R\Gamma((X_F^\diamond)_{\mathrm{ét}},A^\diamond)
\]

in the correctly specified ordinary/left-completed range. For adic coefficients, apply L0
and the finite-level comparisons with derived completion; that later coefficient extension
is a consequence after L0, not a prerequisite for F3.

A subsequent use of `Rf!` or `Rf^!` on this curve must establish the geometric hypotheses
for the particular map. Do not infer properness, smoothness, or a dualizing-complex formula
for `X_F^♢ → Spd ℚ_p` simply because the object is named a Fargues–Fontaine curve.

## Completion and examples

The final comparison theorem mentions the **AdicSpaces definition** of `X_F` on its left-hand
side. Test it for `F=\widehat{𝔽_p((t^{1/p^∞}))}` and, separately, an algebraically closed
characteristic-`p` perfectoid field with a chosen mixed-characteristic untilt. Check the
Frobenius generator, the plus rings, the two inverted elements, the relation identification
and the sheaf/stack distinction. The relative and general-`E` constructions are outside
this component; their interfaces can consume the same tilting and diamond APIs without
changing these definitions.

## Completion contracts added on 2026-09-15

**Applies to:** `F0`, `F1`, `F2`, `F3`, `F4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Prove the Witt/theta correspondence on test affinoids preserves topology and the chosen plus subrings, then verify naturality under arbitrary test-space pullbacks. For Frobenius descent exhibit the relation as the disjoint union of actual generator graphs and show the quotient map is a covering on wandering annuli. In F4 verify the primitive generator has closed image and remains regular after the relevant completed base change.

### Producer–consumer contract

The final object on the left of the comparison is the upstream adic curve X_F. Its diamond and the moduli of degree-one divisors are different functors; no structural map to the characteristic-p base is inferred from functoriality in F.

### Acceptance and source route

Compute one generator, not only orbit sets, for the compatible-root field; compare a non-algebraically-closed F with an algebraically closed field and chosen untilt; retain both p and [varpi] invertibility conditions.

**Source route:** FS II.1.2/II.1.15–18; ECD 15.6; upstream fixed-field annular quotient. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
