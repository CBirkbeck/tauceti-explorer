# Relative Fargues–Fontaine curves and period geometry (part from RF0)

Blueprint for the roadmap `RelativeFarguesFontaine`, job `BP-RelativeFarguesFontaine--RF0` (issue #985).
Packet: `research/blueprint/packets/RelativeFarguesFontaine--RF0.json` (`"part": "RF0"`). Suggested Lean
file: `research/blueprint/suggested/RelativeFarguesFontaine--RF0.lean`. Handoff:
`research/blueprint/handoff/BP-RelativeFarguesFontaine--RF0.md`.

This part covers `RF0` with its two substages, `RF1`, `RF2` with its two substages, and `RF3`. `RF4` belongs to
`BP-RelativeFarguesFontaine--RF4` (issue #986).

**Status: partial.** All eight layers in scope are decomposed, none is closed. The packet has 20 nodes
(2 definitions, 6 constructions, 7 theorems, 2 lemmas, 3 comparisons), **41 API items** and **31 unit tests** —
an API outline with tests for every one of the eight definitions and constructions — 15 planets, 29 baseline
declarations, 8 gaps, 21 requests and 2 structural proposals.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources — all four hashes reproduce

Every one of this roadmap's four sources was downloaded again in this session and **every SHA-256 reproduces the
recorded value byte for byte.** No locator in this packet rests on a file that has changed.

- **`FS-geometrization`** — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*.
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, read 2026-09-16.
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` — reproduced 24 September 2026.
- **`SW20-berkeley`** — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*.
  <https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf>, read 2026-09-16.
  SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` — reproduced 24 September 2026.
- **`BMS18-integral`** — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*.
  <https://arxiv.org/abs/1602.03148>, read 2026-09-16.
  SHA-256 `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` — reproduced 24 September 2026.
- **`GR02-almost`** — Ofer Gabber, Lorenzo Ramero, *Almost ring theory*.
  <https://arxiv.org/abs/math/0201175>, read 2026-09-16.
  SHA-256 `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8` — reproduced 24 September 2026.

## What the pinned libraries supply — more here than in any sibling roadmap

`data/library-coverage.json` has **no reviewed audit entry for this roadmap**, so the pinned declaration index
was searched directly. The result is unusually good:

| pinned declaration | what it is here |
| --- | --- |
| `mathlib:WittVector.teichmuller` | **exactly** the multiplicative section `[·]` the first node asserts, and the `[ϖ]` of the definition of `𝒴_S` and of the radius function |
| `mathlib:WittVector.fontaineTheta` | the `θ` whose kernel the primitive degree-one ideals are, and whose generators cut out the divisor of a leg tuple |
| `mathlib:PreTilt`, `mathlib:PreTilt.untilt` | the tilting correspondence the functor-of-points theorem is about |
| `mathlib:IsAdicComplete`, `mathlib:AdicCompletion` | the `π`-adic completeness of the Witt lift and the `I_S`-adic completion giving `B^+` |
| `mathlib:IsDiscreteValuationRing` | what `B^+_dR` **is** at a geometric untilt |
| `mathlib:GradedAlgebra`, `mathlib:ProjectiveSpectrum` | `P` and `Proj P` |
| `mathlib:AlgebraicGeometry.LocallyRingedSpace` | the **exact** level at which `X_S → X_S^alg` is asserted — not schemes, not adic spaces |
| `mathlib:Valuation`, `mathlib:SpectralSpace` | the radius function and the norm estimate; the underlying spaces |
| `tauceti:TauCeti.Huber.Pair`, `TauCeti.ValuationSpectrum.spa` | `Spa(R,R^+)`, the annuli, and the divisor — `𝒴_S` is literally a `Spa` minus a vanishing locus |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | the twists `O(n)` and the Breuil–Kisin graded pieces |

**Absent at both pins:** the adic-space and perfectoid layer itself. A search found no declaration whose name
contains `Perfectoid`, and no diamond. Those are exactly the layers this packet requests, from `AdicSpacesPartII`,
`PerfectoidSpaces` and `DiamondsAndVStacks`, so the boundary is clean.

## RF0. Ramified Witt coefficients and relative period annuli

For a perfect `F_q`-algebra `R` there is a **unique** `π`-adically complete flat
`O_E`-algebra lifting it, with a **unique** multiplicative section `[·]`. That uniqueness is what makes every later
object canonical rather than presentation-dependent. It is realised as `W(R) ⊗̂_{W(F_q)} O_E`, and in equal
characteristic, `E = F_q((π))`, it is simply `R[[π]]` — the construction is uniform in the two characteristics, and
that uniformity is a unit test.

Mathlib has the unramified theory in full: `WittVector`, `WittVector.frobenius`, and — exactly the section asserted
here — `WittVector.teichmuller`. What is missing at the pin is the base change to `O_E`. Since that base change is the
coefficient ring of the whole Fargues–Fontaine family, the packet's second structural proposal asks who should own
it.

**Coverage: `partial`.** Ramified Witt coefficients as the unique flat pi-adic lift of a perfect F_q-algebra, with the multiplicative Teichmueller section. Mathlib has WittVector and WittVector.teichmuller, so the unramified case and the section are pinned; what this layer adds is the ramified base change to O_E and the uniformity across the two characteristics, where the equal-characteristic case is R[[pi]].

Remaining in this layer:

- The stage text also requires the mixed-characteristic comparison of W_{O_E}(R) with the completed scalar extension of p-typical Witt vectors over W(F_q) as a proved statement, and the change-of-uniformizer comparison; FS state the formula but give no proof, so Hazewinkel/Drinfeld-style ramified Witt vector foundations must still be read.
- Functoriality, reduction and topology statements for W_{O_E} are asserted here from the FS formula only.

### `ramified-witt-universal-property` — Ramified Witt coefficients as the unique flat pi-adic lift

*construction.* **Planet: Ramified Witt coefficients.**

**Statement.** For a perfect F_q-algebra R there is a unique pi-adically complete flat O_E-algebra R-tilde with R-tilde/pi = R, and a unique multiplicative section [.]: R -> R-tilde of the reduction. It is realised as W_{O_E}(R) = W(R) tensor-hat_{W(F_q)} O_E with pi-adic completion; when E = F_q((pi)) has equal characteristic this is R[[pi]].

**Hypotheses that must not be dropped.**

- R is a perfect F_q-algebra (perfectness is what makes the lift unique, not merely existent)
- E is a nonarchimedean local field with residue field F_q of characteristic p, O_E its ring of integers, pi a chosen uniformizer
- The tensor product W(R) tensor_{W(F_q)} O_E is completed pi-adically; without the completion the universal property fails
- The equal-characteristic identification R[[pi]] uses the chosen uniformizer pi of E = F_q((pi))

**Proof outline.**

1. Fargues-Scholze state the uniqueness of the pi-adically complete flat O_E-lift and of the Teichmueller section at the head of II.1.1, and then exhibit the lift as the pi-adically completed base change of p-typical Witt vectors along W(F_q) -> O_E.
2. The universal property in the form actually used later is the one invoked in the proof of Prop. II.1.2: for perfect R^+, maps W_{O_E}(R^+) -> A^+ into a pi-adically complete O_E-algebra correspond to maps R^+ -> (A^+)^flat.
3. The equal-characteristic case is read off from the formula, since W(R) tensor-hat_{W(F_q)} F_q[[pi]] = R[[pi]] for perfect R.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `ramifiedWitt` | data | W_{O_E}(R) = W(R) tensor-hat_{W(F_q)} O_E with its pi-adic completion, for R a perfect F_q-algebra. |
| `ramifiedWitt.universal` | universal-property | The unique pi-adically complete FLAT O_E-algebra with W_{O_E}(R)/pi = R; uniqueness is up to unique isomorphism and is what makes every later construction canonical. |
| `teichmuller` | data | The unique multiplicative section [.] : R -> W_{O_E}(R) of the reduction. Mathlib has WittVector.teichmuller for the unramified case, and the ramified section is its base change. |
| `ramifiedWitt.equalCharacteristic` | example | When E = F_q((pi)) has equal characteristic, W_{O_E}(R) = R[[pi]]; the construction is uniform in the two characteristics and this is the test that it is. |
| `ramifiedWitt.frobenius` | functoriality | The q-power Frobenius of R induces an endomorphism of W_{O_E}(R), which becomes the phi of the whole roadmap. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition` — the integral period space is Spa of this ring minus a vanishing locus
- in `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence` — untilts are primitive degree-one ideals in this ring
- in `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign` — E-breve = W_{O_E}(k)[1/pi] is the coefficient field of the isocrystals

**Unit tests.** A plausible wrong definition fails one of these.

- `perfectness_is_needed` — R must be PERFECT: for a general F_q-algebra the lift is not flat and the reduction is not an isomorphism, which is the same obstruction Bhatt-Scholze record for W(R).
- `equal_characteristic_is_power_series` — For E = F_q((pi)), W_{O_E}(R) = R[[pi]]. A construction that does not degenerate to power series in equal characteristic is not this one.
- `teichmuller_is_multiplicative_only` — [.] is multiplicative and is NOT additive; treating it as a ring map is the standard error.
- `uniqueness_makes_it_canonical` — The lift is unique up to unique isomorphism, which is what lets every later object be defined without choices; a construction that depends on a presentation is not the universal one.

**Acceptance.**

- Check on R = F_q that W_{O_E}(F_q) = O_E and [.] is the Teichmueller lift of the residue field
- Check that for E ramified over Q_p the ring W_{O_E}(R) is NOT W(R) with p renamed: compare W_{O_E}(F_q-bar) = O_{E-breve} with W(F_q-bar) for E = Q_p(pi), pi^2 = p
- Check the change-of-uniformizer comparison for two uniformizers pi, pi' of the same E

**Prerequisites.** `AdicSpacesPartII:R0`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.teichmuller`, `mathlib:PerfectRing`, `mathlib:IsAdicComplete`, `mathlib:AdicCompletion`, `mathlib:Perfection`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.1.1, printed p. 47.

  > Recall that for any perfect F_q-algebra R, there is a unique pi-adically complete flat O_E-algebra R-tilde such that R-tilde = R/pi. There is a unique multiplicative lift [.] : R -> R-tilde of the identity R -> R, called the Teichmueller lift.

  This is verbatim the statement of the node; the displayed formula R-tilde = W_{O_E}(R) = W(R) tensor-hat_{W(F_q)} O_E and the parenthetical equal-characteristic remark follow immediately after it.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Prop. II.1.2, printed p. 49.

  > By the universal property of W_{O_E}(R^+) in case R^+ is perfect, this is equivalent to giving a map R^+ -> (A^+)^flat such that the image of varpi in A^flat is invertible.

  Records the exact form of the universal property that the rest of Chapter II consumes, including the perfectness hypothesis on R^+.

## RF0:annuli. Pass to the generic period domain

`Y_S = 𝒴_S ∖ V(π)`, and on it a radius function
`rad(x) = log|[ϖ](x̃)| / log|π(x̃)|` evaluated at the rank-one generalization — so it factors through the Berkovich
quotient. The identity that matters is `rad(φ(x)) = q·rad(x)`: it is what makes `[1,q]` a fundamental domain and what
closes the two-chart presentation of the curve.

The annuli `Y_{S,I} = {|π|^b ≤ |[ϖ]| ≤ |π|^a}` are **rational** subsets, hence affinoid, and degenerate intervals
`a = b` are allowed — those are precisely the two ends glued by `φ`.

The Stein exhaustion then gives vanishing: restrictions between nested annuli have dense image, so `H^i(Y_{S,I},ℱ) = 0`
for `i > 0`, `R¹lim` vanishes, and `H^i(Y_S,ℱ) = 0` for all `i > 0` and every vector bundle.

**Coverage: `partial`.** The radius function with its Frobenius scaling rad(phi(x)) = q rad(x), the rational annuli Y_{S,I}, and the Stein exhaustion giving vanishing of higher cohomology of vector bundles on Y_S. The degenerate intervals a = b are allowed and are exactly the two ends glued in the presentation of the curve.

Remaining in this layer:

- Sousperfectoidness of each Y_{(R,R^+),I} is used but is quoted, not proved, in the passage read; the stably-uniform/sousperfectoid argument with explicit hypotheses is still to be read in SW20 Section 6.3 or Kedlaya-Liu.
- Density of the restriction maps O(Y_{I_2}) -> O(Y_{I_1}) is asserted in FS without proof.
- The explicit plus subrings B^+_{S,I} and the fixed-field Q_p comparison of RINGS (not just spectra) required by the stage text were not located in the passages read.

### `radius-function-and-rational-annuli` — The radius function and the affinoid annuli Y_{S,I}

*construction.* **Planet: The radius function and the annuli.**

**Statement.** Y_S = Y-curly_S \ V(pi) = Spa W_{O_E}(R^+) \ V(pi[varpi]). There is a map rad : |Y_S| -> (0,infty) sending x with rank-1 generalization x-tilde to log|[varpi](x-tilde)| / log|pi(x-tilde)|; it factors through the Berkovich quotient of |Y_S| and satisfies rad(phi(x)) = q rad(x). For a rational interval I = [a,b] contained in (0,infty), possibly with a = b, the subset Y_{S,I} = {|pi|^b <= |[varpi]| <= |pi|^a} is a rational open subset of Spa W_{O_E}(R^+), hence affinoid, Y_{S,I} = Spa(B_{S,I}, B^+_{S,I}).

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid with pseudouniformizer varpi; the function rad depends on varpi
- I = [a,b] has rational endpoints; degenerate intervals a = b are allowed and still give rational subsets
- The end 0 of the radius corresponds to the boundary divisor (pi) and the end infty to ([varpi]); both are outside Y_S
- Y_{S,[0,n]} and Y_{S,[1,infty]} appearing in II.1.1 and II.2.5 are NOT contained in Y_S

**Proof outline.**

1. Fargues-Scholze define rad on rank-1 generalizations and check it is constant on the fibres of the Berkovich quotient and scales by q under phi.
2. The annuli Y_{S,I} are rational subsets of the ambient Spa W_{O_E}(R^+) cut out by the two inequalities, so they are affinoid; sheafiness comes from the chart-level statement in II.1.1.
3. Fargues-Scholze record the warning that the half-open charts Y_{S,[0,1]} and Y_{S,[1,infty]} used in the cohomology computations lie in Y-curly_S but not in Y_S.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `Y` | data | Y_S = Y-curly_S minus V(pi) = Spa W_{O_E}(R^+) minus V(pi[varpi]), the generic period space. |
| `rad` | data | rad : \|Y_S\| -> (0,infty), x -> log\|[varpi](x-tilde)\| / log\|pi(x-tilde)\| at the rank-one generalization x-tilde of x. |
| `rad.berkovich` | structure | rad factors through the Berkovich quotient of \|Y_S\|, so it is a function of the rank-one point only. |
| `rad.frobenius` | compatibility | rad(phi(x)) = q rad(x); this is what makes the quotient by phi^Z an annulus quotient and what fixes the interval [1,q] as a fundamental domain. |
| `annulus` | data | For a rational interval I = [a,b] in (0,infty), possibly with a = b, Y_{S,I} = {\|pi\|^b <= \|[varpi]\| <= \|pi\|^a}, a rational open subset of Spa W_{O_E}(R^+), hence affinoid, written Spa(B_{S,I}, B^+_{S,I}). |
| `annulus.degenerate` | example | a = b is allowed: Y_{S,[1,1]} and Y_{S,[q,q]} are the two ends glued by phi in the two-chart presentation of the curve. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity` — the Stein exhaustion is by these annuli
- in `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation` — the curve is Y_{S,[1,q]} glued along phi : Y_{S,[1,1]} -> Y_{S,[q,q]}

**Unit tests.** A plausible wrong definition fails one of these.

- `frobenius_scales_by_q` — rad(phi(x)) = q rad(x). With any other scaling the fundamental domain [1,q] is wrong and the two-chart presentation does not close up.
- `degenerate_interval` — a = b is permitted and gives an affinoid; a definition requiring a < b cannot state the gluing.
- `factors_through_berkovich` — rad depends only on the rank-one generalization; a definition evaluating at a higher-rank point directly is not well defined.
- `rational_hence_affinoid` — Y_{S,I} is a RATIONAL subset, which is why it is affinoid; an arbitrary open subset of the same shape need not be.

**Acceptance.**

- Check rad ∘ phi = q rad on an explicit Gauss point for E = F_q((pi))
- Check that Y_{S,[a,a]} is affinoid and that the presentation of X_S glues Y_{S,[1,1]} to Y_{S,[q,q]}
- Check independence of varpi up to reparametrisation of rad

**Prerequisites.** `DiamondsAndVStacks:D1`, `FarguesFontaineDiamonds:F1`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:Valuation`, `mathlib:SpectralSpace`, `mathlib:WittVector.teichmuller`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.16, printed p. 54.

  > The action of phi on Y_S is free and totally discontinuous. In fact, if S = Spa(R,R^+) is affinoid and varpi in R is a pseudouniformizer, one can define a map rad : |Y_S| -> (0,infty) taking any point x in Y_S with rank-1-generalization x-tilde to log |[varpi](x-tilde)|/log |pi(x-tilde)|. This factorizes through the Berkovich space quotient of |Y_S| and satisfies rad ∘ phi = q . rad.

  Exact statement of the radius function and its equivariance.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.1.16, printed p. 55.

  > For any interval I = [a,b] contained in (0,infty) with rational ends (possibly with a = b), there is the open subset Y_{S,I} = {|pi|^b <= |[varpi]| <= |pi|^a} contained in rad^{-1}(I) contained in Y_S which is in fact a rational open subset of Spa W_{O_E}(R^+) and thus affinoid.

  Exact statement of the annuli, including the possibility a = b and the rationality claim.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.5, printed p. 62.

  > (We warn the reader that Y_{S,[0,1]} and Y_{S,[1,infty]} are not contained in Y_S = Y_{S,(0,infty)}; we hope this clash of notation will not cause confusion.)

  Confirms the scope caveat recorded in the hypotheses.

### `stein-exhaustion-and-higher-acyclicity` — Stein exhaustion of Y_S and vanishing of higher cohomology of vector bundles

*lemma.*

**Statement.** For S = Spa(R,R^+) affinoid perfectoid, Y_S is the union over compact rational intervals I of the affinoid sousperfectoid spaces Y_{(R,R^+),I}, and for I_1 contained in I_2 the restriction O(Y_{(R,R^+),I_2}) -> O(Y_{(R,R^+),I_1}) has dense image. Consequently H^i(Y_{S,I}, F) = 0 for i > 0 and any vector bundle F, R^1 lim_I Gamma(Y_{(R,R^+),I}, F) = 0, and hence H^i(Y_S, F) = 0 for all i > 0.

**Hypotheses that must not be dropped.**

- S affinoid perfectoid; I runs over compact intervals with rational ends
- Each Y_{(R,R^+),I} is affinoid sousperfectoid (this is what gives acyclicity of vector bundles, and is inherited from the splitting argument of II.1.1)
- The Mittag-Leffler condition is the density of the restriction maps, and the vanishing of R^1 lim is quoted from EGA 0_III 13.2.4

**Proof outline.**

1. Fargues-Scholze list the three properties (i) compact rational intervals, (ii) affinoid sousperfectoid, (iii) dense restriction maps.
2. Point (ii) gives H^i(Y_{S,I}, F|_{Y_{S,I}}) = 0 for i > 0.
3. Point (iii) gives R^1 lim_I Gamma(Y_{(R,R^+),I}, F) = 0 by [Gro61, 0.13.2.4].
4. Combining, H^i(Y_S,F) = 0 for i > 0; hence for a bundle E on X_S, RGamma(X_S,E) is the two-term complex [H^0(Y_S,E) --(phi - 1)--> H^0(Y_S,E)] and vanishes in degrees > 1.

**Acceptance.**

- Verify density of restriction for E = F_q((pi)) using explicit Laurent series
- Verify that the two-term description of RGamma(X_S,E) reproduces H^0(X_S,O) = E and H^1(X_S,O) = 0 pro-etale locally
- Verify sousperfectoidness of Y_{S,I} for ramified E

**Prerequisites.** `FarguesFontaineDiamonds:F1`, `mathlib:CategoryTheory.Sheaf`, `mathlib:DerivedCategory`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.2 preamble, printed p. 57.

  > Then Y_S is 'Stein', one has Y_S = union over I contained in (0,infty) of Y_{(R,R^+),I} where (i) as before I is a compact interval with rational ends (ii) Y_{(R,R^+),I} is affinoid sous-perfectoid (iii) for I_1 contained in I_2, the restriction morphism O(Y_{(R,R^+),I_2}) -> O(Y_{(R,R^+),I_1}) has dense image.

  The three hypotheses of the node, stated verbatim.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.2 preamble, printed p. 57.

  > Point (3) implies that R^1 lim_I Gamma(Y_{(R,R^+),I}, F) = 0 ([Gro61, 0.13.2.4]). We thus have H^i(Y_S,F) = 0 when i > 0.

  The conclusion and the imported Mittag-Leffler vanishing, with its exact citation.

## RF0:integral-Y. Retain the integral period space

`𝒴_S = Spa W_{O_E}(R^+) ∖ V([ϖ])`, with `W_{O_E}(R^+)` carrying the
`(π,[ϖ])`-adic topology, independent of the pseudouniformizer.

**`V(π)` is not removed.** The space is over `O_E` and is not base-changed to `E`. That is the entire point of this
substage, and it is what `GeometricSatakeAndFusion` depends on: Remark VI.2.1 there says the Cartier divisor `π = 0` is
included and `B^+_dR(C^♯) = W_{O_E}(C)` on it, which is the characteristic-`p` fibre where the Witt vector affine
Grassmannian lives. Delete it and the special-fibre comparison has no right-hand term.

Sheafiness is proved, not assumed, and the route is worth keeping: base-change to `O_{E_∞}` makes the space
**perfectoid**, with tilt the perfectoid open unit disc over `S`, and the sheaf property transports back because
`B_{S,[0,n]}` splits off its base change as a **topological direct factor**.

And the functor of points: giving an untilt `T^♯` with a map to `𝒴_S` is the same as giving an untilt over `Spa O_E`
and a map `T → S` — that is, `(𝒴_S)^◊ = Spd O_E × S`.

**Coverage: `partial`.** The integral period space Y-curly_S, its perfectoidness after base change to O_{E_infty} with the splitting argument for sheafiness, the functor of points (Y-curly_S)^diamond = Spd O_E x S, and the gluing for a general base. The special fibre V(pi) is RETAINED, and that is the point: GeometricSatakeAndFusion's comparison of the B^+_dR and Witt vector affine Grassmannians exists only because this space is over O_E and not over E.

Remaining in this layer:

- The sousperfectoid descent step is quoted by FS from [HK20] (Hansen-Kedlaya) and SW20 Section 6.3; only SW20 Definition 6.3.1/Example 6.3.2 were read, not Proposition 6.3.3 or the Hansen-Kedlaya paper.
- FS assert that the displayed computation of A^+_0/[varpi] 'implies already' integral perfectoidness via BMS18 Lemma 3.10(ii); the verification that the hypotheses of that lemma (pi^p | p for the chosen element, Frobenius S/pi -> S/pi^p an isomorphism) hold for A^+_0 is not written out in FS and was not reconstructed here.

### `curly-Y-affinoid-definition` — The integral period space Y-curly_S and independence of the pseudouniformizer

*definition.* **Planet: The integral period space Y-curly.**

**Statement.** For S = Spa(R,R^+) affinoid perfectoid over F_q and varpi in R^+ a pseudouniformizer, set Y-curly_S = Spa W_{O_E}(R^+) \ V([varpi]), where W_{O_E}(R^+) carries the (pi,[varpi])-adic topology. The result is independent of the choice of varpi, and the q-power Frobenius of R^+ induces an automorphism phi of Y-curly_S. The characteristic-p fibre V(pi) is retained: Y-curly_S is not base-changed to E.

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid of characteristic p; R^+ open and integrally closed
- varpi in R^+ a pseudouniformizer, i.e. a topologically nilpotent unit of R
- W_{O_E}(R^+) is given the (pi,[varpi])-adic topology, not the pi-adic one; the removed locus is V([varpi]) only, not V(pi[varpi])

**Proof outline.**

1. Fargues-Scholze define Y-curly_S in the affinoid case by removing V([varpi]) from Spa W_{O_E}(R^+) with the (pi,[varpi])-adic topology.
2. Independence of varpi is deduced from the divisibility relations varpi | varpi'^n and varpi' | varpi^n valid for any two pseudouniformizers of R, which give equality of the removed closed subsets.
3. The Frobenius automorphism is induced by functoriality of W_{O_E}(-) applied to the q-power Frobenius of R^+.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `curlyY` | data | Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), for S = Spa(R,R^+) affinoid perfectoid over F_q and varpi a pseudouniformizer of R^+, where W_{O_E}(R^+) carries the (pi,[varpi])-adic topology. |
| `curlyY.independent` | structure | Independence of the choice of pseudouniformizer varpi: two choices divide powers of each other, so the removed loci agree. |
| `curlyY.frobenius` | functoriality | The q-power Frobenius of R^+ induces an automorphism phi of Y-curly_S. |
| `curlyY.retainsSpecialFibre` | structure | V(pi) is NOT removed: Y-curly_S is over O_E and is not base-changed to E. This is the whole point of the integral space, and every degeneration argument downstream depends on it. |
| `curlyY.analytic` | characterisation | Y-curly_S is an analytic adic space over O_E, which is what makes the sheafiness question meaningful. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli` — the generic period space Y_S is this one with V(pi) removed, and the annuli are rational subsets of the same Spa
- in `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness` — the divisors are closed Cartier divisors in this space
- in `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate` — an untilt is presented as a closed immersion into this space

**Unit tests.** A plausible wrong definition fails one of these.

- `pseudouniformizer_independence` — Two pseudouniformizers give the same space; a definition that depends on the choice is not well posed.
- `special_fibre_is_retained` — V(pi) belongs to Y-curly_S. Removing it gives Y_S, a different space, and deleting it deletes the Witt vector affine Grassmannian fibre that GeometricSatakeAndFusion's comparison needs.
- `adic_topology` — W_{O_E}(R^+) carries the (pi,[varpi])-adic topology, not the pi-adic one; with the wrong topology the removed locus and the analyticity both change.
- `equal_characteristic_case` — For E = F_q((pi)) the space is Spa R^+[[pi]] minus V([varpi]), which is the punctured open unit disc over S; a construction failing this is not uniform in the two characteristics.

**Acceptance.**

- Verify that V([varpi]) = V([varpi']) inside Spa W_{O_E}(R^+) for two pseudouniformizers
- Verify on S = Spa(C,O_C) that the special fibre {pi = 0} of Y-curly_C is nonempty, so that Y-curly_S differs from Y_S
- Verify that phi acts on Y-curly_S and fixes V(pi) setwise

**Prerequisites.** `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `AdicSpacesPartII:R1`, `AdicSpacesPartII:R2`, `PerfectoidSpaces:P1`, `PerfectoidSpaces:P2`, `tauceti:TauCeti.Huber.Pair`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:WittVector`, `mathlib:WittVector.teichmuller`, `mathlib:Ideal.span`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.1.1, printed p. 47.

  > we let Y-curly_S = Spa W_{O_E}(R^+) \ V([varpi]). Here W_{O_E}(R^+) has the (pi,[varpi])-adic topology. These objects do not depend on the choice of varpi, as for any choice of varpi, varpi' in R, one has varpi | varpi'^n, varpi' | varpi^n for some n > 0.

  Gives the definition, the topology and the independence argument exactly as stated in the node.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition II.1.15, printed p. 54.

  > Y_S = Y-curly_S x_{Spa O_E} Spa E = Y-curly_S \ V(pi), which for affinoid S = Spa(R,R^+) with pseudouniformizer varpi is given by Y_S = Spa W_{O_E}(R^+) \ V(pi[varpi]).

  Confirms that Y-curly_S retains V(pi) and that the generic space Y_S is the strictly smaller open, as the stage text requires.

### `chart-cover-perfectoidness-and-sheafiness` — FS II.1.1: rational charts, perfectoid base change to O_{E_infty}, and sheafiness by splitting

*theorem.* **Planet: Perfectoidness after base change, and sheafiness.**

**Statement.** Y-curly_S is an analytic adic space over O_E. Letting E_infty be the completion of E(pi^{1/p^infty}), the base change Y-curly_S x_{Spa O_E} Spa O_{E_infty} is perfectoid, with tilt the perfectoid open unit disc S x_{F_q} Spa F_q[[t^{1/p^infty}]] = D_{S,perf}. Sheafiness of the structure presheaf on Y-curly_S is obtained from the perfectoid sheaf property because B_{S,[0,n]} splits off B_{S,[0,n]} tensor-hat_{O_E} O_{E_infty} as a topological direct factor.

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid of characteristic p with pseudouniformizer varpi
- The charts are the rational subsets Y-curly_{S,[0,n]} = {|pi|^n <= |[varpi]| != 0} of Spa W_{O_E}(R^+), n a positive integer taken to be a power of p; by applying Frobenius on (R,R^+) one may reduce to n = 1
- B_{S,[0,n]} = W_{O_E}(R^+)<pi^n/[varpi]>[1/[varpi]], and B^+_{S,[0,n]} is the INTEGRAL CLOSURE of W_{O_E}(R^+)<pi^n/[varpi]> in B_{S,[0,n]}
- E_infty is the completion of E(pi^{1/p^infty}) for the chosen uniformizer pi
- Perfectoidness of A^+_0 is obtained from BMS18 Lemma 3.10(ii), which requires a ring pi-adically complete with respect to an element whose p-th power divides p, that element a nonzerodivisor, and Frobenius S/pi -> S/pi^p an isomorphism

**Proof outline.**

1. Cover Y-curly_S by the rational subsets Y-curly_{S,[0,n]} of Spa W_{O_E}(R^+) and reduce to n = 1 using the Frobenius of (R,R^+).
2. Reduce the adic-space (sheafiness) claim to showing that A = B_{S,[0,1]} tensor-hat_{O_E} O_{E_infty} is a perfectoid Tate algebra: the map B_{S,[0,1]} -> A is split injective as topological B_{S,[0,1]}-modules, so the perfectoid sheaf property descends. Fargues-Scholze point to the sousperfectoid formalism of Hansen-Kedlaya and SW20 Section 6.3 for this step.
3. Set A^+_0 = (W_{O_E}(R^+) tensor-hat_{O_E} O_{E_infty})[(pi^{1/p^infty}/[varpi])]^wedge_{[varpi]} and compute A^+_0/[varpi] = (R^+/varpi tensor_{F_q} O_{E_infty}/pi)[t_1^{1/p^infty}]/(pi^{1/p^m} - [varpi]^{1/p^m} t_1^{1/p^m}) = R^+/varpi[t_1^{1/p^infty}].
4. Conclude A^+_0 is integral perfectoid by BMS18 Lemma 3.10(ii), then A^+_0 -> A^+ is an almost isomorphism and A = A^+_0[1/[varpi]] is perfectoid by BMS18 Lemma 3.21.
5. Identify the tilt of A as R<t_1^{1/p^infty}> with t_1^sharp = [varpi]/pi, corresponding to the locus {|t| <= |varpi| != 0} inside D_{S,perf}.

**Acceptance.**

- Verify that B^+_{S,[0,n]} really is the integral closure and not the naive subring, on a base S whose R^+ is not a valuation ring
- Verify the displayed computation of A^+_0/[varpi] on S = Spa(C,O_C) and on a non-field affinoid perfectoid S
- Verify the topological splitting B_{S,[0,1]} -> B_{S,[0,1]} tensor-hat O_{E_infty} for ramified E/Q_p, where O_{E_infty}/O_E is not free

**Prerequisites.** `AdicEtaleGeometry:A3`, `AdicSpacesPartII:R3`, `PerfectoidSpaces:P3`, `PerfectoidSpaces:P4`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:PreTilt`, `mathlib:Perfection`, `mathlib:CategoryTheory.Sheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.1 and proof, printed p. 48.

  > To see that Y-curly_S is an adic space (i.e. the structure presheaf is a sheaf) and Y-curly_S x_{Spa O_E} Spa O_{E_infty} is perfectoid, it is enough to prove that B_{S,[0,n]} tensor-hat_{O_E} O_{E_infty} is a perfectoid Tate algebra. Indeed, the algebra B_{S,[0,n]} splits off B_{S,[0,n]} tensor-hat_{O_E} O_{E_infty} as a direct factor as topological B_{S,[0,n]}-module.

  This is the direct-summand argument that the stage text insists on ('Derive sheafiness by the topological direct-summand argument, not by assuming all Witt rings are Tate').
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.1.1, printed p. 48.

  > A^+_0/[varpi] = (R^+/varpi tensor_{F_q} O_{E_infty}/pi)[t_1^{1/p^infty}]/(pi^{1/p^m} - [varpi]^{1/p^m} t_1^{1/p^m}) = R^+/varpi[t_1^{1/p^infty}]. This implies already that A^+_0 is integral perfectoid by [BMS18, Lemma 3.10 (ii)], and thus necessarily (cf. [BMS18, Lemma 3.21]) A^+_0 -> A^+ is an almost isomorphism and A^+_0[1/[varpi]] = A is perfectoid.

  Fixes the precise intermediate computation and names the imported criterion; the node records its hypotheses explicitly.
- `BMS18-integral` — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*, Lemma 3.10, article p. 22.

  > Let S be a ring which is pi-adically complete with respect to some element pi in S such that pi^p divides p, and assume that phi : S/pi S -> S/pi^p S is surjective. ... (ii) Conversely, if phi : S/pi S -> S/pi^p S is an isomorphism and pi is a non-zero-divisor, then Ker theta is a principal ideal (and hence S is perfectoid).

  The imported criterion read in the source; its hypotheses (pi^p | p, nonzerodivisor, Frobenius iso) must be carried into any reproof of FS II.1.1.
- `BMS18-integral` — Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic Hodge theory*, Lemma 3.21, article p. 24.

  > Let R_0 be a perfectoid ring which is pi-adically complete for some non-zero-divisor pi such that pi^p divides p. Then R = R_0[1/pi], endowed with the pi-adic topology on R_0, is a complete Tate ring which is perfectoid in Fontaine's sense. Moreover, pi R^circ is contained in R_0.

  The second imported criterion, used by FS to pass from A^+_0 to A = A^+_0[1/[varpi]].

### `untilt-functor-of-points` — FS II.1.2: the diamond of the integral period space is Spd O_E x S

*theorem.* **Planet: The diamond of Y-curly is Spd O_E x S.**

**Statement.** For any perfectoid T over F_q, giving an untilt T^sharp of T together with a map T^sharp -> Y-curly_S of analytic adic spaces is the same as giving an untilt T^sharp with a map T^sharp -> Spa O_E and a map T -> S. Equivalently there is a natural isomorphism (Y-curly_S)^diamond = Spd O_E x S, and hence a natural map |Y-curly_S| -> |S|.

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid over F_q; the argument reduces to affinoid T = Spa(A,A^+)
- R^+ is perfect, so that the universal property of W_{O_E}(R^+) applies
- The condition imposed on the map W_{O_E}(R^+) -> A^+ is that the image of [varpi] be invertible in A (this is what cuts out Y-curly_S, and it corresponds to invertibility of varpi in A^flat)

**Proof outline.**

1. Reduce to: for T perfectoid over O_E, maps T -> Y-curly_S correspond to maps T^flat -> S.
2. A map T -> Y-curly_S is a map W_{O_E}(R^+) -> A^+ whose value on [varpi] is invertible in A.
3. Apply the universal property of W_{O_E}(R^+) for perfect R^+ to convert this into a map R^+ -> (A^+)^flat with varpi invertible in A^flat, i.e. a map Spa(A^flat,A^{flat+}) -> Spa(R,R^+).
4. The product Spd O_E x S is the product of v-sheaves on Perf_{F_q}; no structural morphism Y-curly_S -> S of adic spaces is asserted, only the map on topological spaces.

**Acceptance.**

- Verify the claim for T = S^sharp an untilt of S itself, recovering the tautological section
- Verify that the resulting map |Y-curly_S| -> |S| is the one used later to define the radius function
- Check that the statement is about the diamond and does NOT produce an adic morphism Y-curly_S -> S

**Prerequisites.** `FarguesFontaineDiamonds:F0`, `DiamondsAndVStacks:D4`, `PerfectoidSpaces:P2`, `mathlib:PreTilt.untilt`, `mathlib:PreTilt`, `tauceti:TauCeti.Huber.Pair`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.2 and proof, printed p. 49.

  > Giving a map T -> Y-curly_S is equivalent to giving a map W_{O_E}(R^+) -> A^+ such that the image of [varpi] in A is invertible. By the universal property of W_{O_E}(R^+) in case R^+ is perfect, this is equivalent to giving a map R^+ -> (A^+)^flat such that the image of varpi in A^flat is invertible.

  The whole proof is this two-line conversion; the node records the invertibility condition, which is the only place the deleted locus V([varpi]) enters.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.1.2, printed p. 49.

  > In particular, there is a natural map |Y-curly_S| = |(Y-curly_S)^diamond| = |Spd O_E x S| -> |S|.

  Records that only a map of topological spaces is produced.

### `gluing-for-general-base` — FS II.1.3: open immersion and cartesian square for affinoid subsets of the base

*lemma.*

**Statement.** If S' is an affinoid subset of S then Y-curly_{S'} -> Y-curly_S is an open immersion, and the square (|Y-curly_{S'}| -> |Y-curly_S|, |S'| -> |S|) is cartesian. Consequently Y-curly_S can be defined for an arbitrary perfectoid space S by gluing, compatibly with the isomorphism (Y-curly_S)^diamond = Spd O_E x S.

**Hypotheses that must not be dropped.**

- S' a (not necessarily rational) affinoid subset of the affinoid perfectoid S
- The check of the isomorphism is performed after base change to O_{E_infty}, which is legitimate because the maps on structure sheaves are naturally split injective

**Proof outline.**

1. Let Z be the open subset of Y-curly_S corresponding to |Y-curly_S| x_{|S|} |S'|; functoriality gives a map Y-curly_{S'} -> Z.
2. Check that this map is an isomorphism after base change to O_{E_infty}, using that structure-sheaf maps are split injective (the same splitting as in II.1.1).
3. After base change both sides are perfectoid, so it suffices to compare diamonds, where the claim is Prop. II.1.2.
4. Glue over an affinoid cover of a general perfectoid S.

**Acceptance.**

- Verify the cartesian property on a rational subset and on a non-rational affinoid subset
- Verify that the glued Y-curly_S for non-affinoid S still satisfies (Y-curly_S)^diamond = Spd O_E x S

**Prerequisites.** `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `AdicSpacesPartII:R5`, `DiamondsAndVStacks:D4`, `tauceti:TauCeti.ValuationSpectrum.spa`, `mathlib:CategoryTheory.Sheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.3 and proof, printed p. 49.

  > To see that it is an isomorphism, we can check after base change to O_{E_infty} (as the maps on structure sheaves are naturally split injective). The base change of Y-curly_{S'} and Z become perfectoid, and hence it suffices to see that one gets an isomorphism after passing to diamonds, where it follows from Proposition II.1.2.

  Gives the exact proof route and the reason the base change is harmless, which is the same splitting used for sheafiness.

## RF1. Quotient and functoriality in the base

`φ` acts freely and totally discontinuously on `Y_S`, so the quotient
`X_S = Y_S/φ^ℤ` exists as an adic space — concretely, glue `Y_{S,[1,q]}` along `φ : Y_{S,[1,1]} → Y_{S,[q,q]}`. `X_S` is
qcqs when `S` is.

One subtlety the decomposition keeps and the packet preserves: **`X_S` has no structural morphism of adic spaces to
`S`**. The map `|X_S| → |S|` exists only because the absolute Frobenius `φ × φ` of `S × Spd(E)` acts trivially on the
underlying topological space, so the quotient by `φ^ℤ × id` and by `id × φ^ℤ` have the same space. It is qcqs for every
`S`.

**Coverage: `partial`.** Freeness and total discontinuity of the Frobenius action, the two-chart presentation of X_S from Y_{S,[1,q]}, and the diamond formula. The subtlety the decomposition keeps is that X_S has no structural morphism of adic spaces to S: the map |X_S| -> |S| exists only because the absolute Frobenius acts trivially on the underlying topological space.

Remaining in this layer:

- FS prove Proposition II.1.16 with 'This follows directly from the definitions'; the verification that rad is well defined on all of |Y_S| and factors through the Berkovich quotient was not reconstructed.
- Descent and pullback along a general map T -> S of perfectoid spaces, and compatibility of structure sheaves and valuations, are used implicitly but were not isolated as proved statements in the passages read.
- Comparison with FarguesFontaineDiamonds F1-F3 in the fixed-field Q_p case was not carried out.

### `frobenius-quotient-and-presentation` — Freeness and total discontinuity of phi on Y_S, and the two-chart presentation of X_S

*theorem.* **Planet: The curve as a Frobenius quotient.**

**Statement.** The action of phi on Y_S is free and totally discontinuous, so the quotient X_S = Y_S/phi^Z exists as an adic space. Concretely X_S is obtained from the affinoid Y_{S,[1,q]} by glueing along the isomorphism phi : Y_{S,[1,1]} -> Y_{S,[q,q]}. In particular X_S is qcqs when S is affinoid.

**Hypotheses that must not be dropped.**

- S affinoid perfectoid with chosen pseudouniformizer varpi (used to define rad and the annuli)
- Freeness and total discontinuity are deduced from rad ∘ phi = q rad, so they use q > 1 and the fact that rad takes values in (0,infty) on Y_S, i.e. that both V(pi) and V([varpi]) have been removed
- The presentation is by the single annulus [1,q] and NOT by Y-curly; the Frobenius action on Y-curly_S is not totally discontinuous at the special fibre

**Proof outline.**

1. PACKET-AUTHORED RECONSTRUCTION (Fargues-Scholze print no argument): from rad o phi = q rad, the phi-orbit of any point has radii ..., r/q, r, qr, ..., which are pairwise distinct and separated by the rational annuli, giving freeness and total discontinuity.
2. PACKET-AUTHORED RECONSTRUCTION: take the fundamental domain Y_{S,[1,q]} and glue its two boundary annuli along phi; this presents X_S as a qcqs adic space when S is affinoid. Fargues-Scholze state the presentation but do not print its verification.
3. What Fargues-Scholze actually print is 'Proof. This follows directly from the definitions.' for Proposition II.1.16, preceded by 'cf. [SW20, Lecture 12]'. Steps 1-2 above are therefore reviewer/packet reconstructions, not read arguments; SW20 Lecture 12 was not read.

**Acceptance.**

- Verify total discontinuity fails on Y-curly_S (the special fibre is phi-stable) so that the removal of V(pi) is essential
- Verify that X_S is qcqs for S affinoid and that its two-chart presentation is independent of the chosen fundamental interval [1,q] vs [1,q^2]

**Prerequisites.** `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `FarguesFontaineDiamonds:F2`, `FarguesFontaineDiamonds:F3`, `DiamondsAndVStacks:D3`, `mathlib:WittVector.frobenius`, `mathlib:SpectralSpace`, `tauceti:TauCeti.ValuationSpectrum.spa`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition II.1.15 and Proposition II.1.16, printed p. 54.

  > For any perfectoid space S over F_q, the relative Fargues-Fontaine curve is X_S = Y_S/phi^Z where Y_S = Y-curly_S x_{Spa O_E} Spa E = Y-curly_S \ V(pi).

  Definition of the quotient, showing that the generic locus is used.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.1.16, printed p. 55.

  > and one can form X_S as the quotient of Y_{S,[1,q]} via the identification phi : Y_{S,[1,1]} = Y_{S,[q,q]}. In particular, X_S is qcqs in case S is affinoid.

  The explicit two-chart presentation and the qcqs conclusion.

### `diamond-formula-and-map-to-base` — The diamond of the relative curve and the qcqs map |X_S| -> |S|

*comparison.*

**Statement.** There are natural isomorphisms (Y_S)^diamond = S x Spd(E) and (X_S)^diamond = (S x Spd(E))/(phi^Z x id). Although X_S carries no structural morphism of adic spaces to S, the absolute Frobenius phi x phi of S x Spd(E) acts trivially on the underlying topological space, giving |X_S| = |S x Spd(E)/(phi^Z x id)| = |S x Spd(E)/(id x phi^Z)| -> |S|, and this map is qcqs for every S.

**Hypotheses that must not be dropped.**

- S a perfectoid space over F_q
- Fargues-Scholze assert only that the absolute Frobenius phi x phi of S x Spd(E) acts trivially on the TOPOLOGICAL SPACE, and use that to exchange the two quotients at the level of |-|. Whether (phi^Z x id) and (id x phi^Z) agree as v-sheaf quotients is not addressed in the passage read; no such claim is made here.
- The conclusion is a statement about topological spaces and diamonds; no adic morphism X_S -> S is claimed

**Proof outline.**

1. Apply II.1.2 to get (Y_S)^diamond = S x Spd(E) after inverting pi.
2. Pass to the phi-quotient to get (X_S)^diamond.
3. Use triviality of absolute Frobenius on the topological space to exchange the two quotients and obtain |X_S| -> |S|, qcqs since |Spd(E)/phi^Z x S| -> |S| is qcqs by the total discontinuity in II.1.16.

**Acceptance.**

- Verify that |X_S| -> |S| is qcqs but that there is no morphism of adic spaces X_S -> S, e.g. by exhibiting the failure for S a geometric point
- Verify the identification for S = Spa C and compare with the absolute curve X_C of Fargues-Fontaine

**Prerequisites.** `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D6`, `FarguesFontaineDiamonds:F3`, `mathlib:CategoryTheory.Sheaf`, `mathlib:SpectralSpace`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.1.16, printed p. 55.

  > Although X_S does not sit over S, the absolute Frobenius phi x phi of S x Spd(E) acts trivially on the topological space and one has |X_S| = |(X_S)^diamond| = |S x Spd(E)/phi^Z x id| = |S x Spd(E)/id x phi^Z| -> |S|. Thus the topological space |X_S| sits over |S|, and for all S the map |X_S| -> |S| is qcqs.

  States both the caveat (no structural morphism) and the topological conclusion, as the stage text demands.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.17, printed p. 55.

  > There is a natural isomorphism (Y_S)^diamond = S x Spd(E), descending to an isomorphism (X_S)^diamond = (S x Spd(E))/phi^Z x id.

  The diamond formulas over Perf_{F_q} with the chosen coefficient field E.

## RF2. Untilts, divisors and local de Rham rings

An aggregate layer with no node of its own.

**Coverage: `partial`.** Aggregate layer over RF2:integral-divisors and RF2:untilts; no node of its own.

Remaining in this layer:

- Aggregate stage; inherits the remaining items of RF2:integral-divisors and RF2:untilts.

## RF2:integral-divisors. Divisors before removing the special fibre

`Div^d_𝒴 = (Spd O_E)^d/Σ_d`, and likewise over `Y` and over the
curve; the quotients are taken inside v-sheaves and **remain small**.

In the **ordered** case the divisor of a leg tuple is cut out by `ξ = ∏ ξ_i` with `ξ_i` a generator of `ker(θ_i)` —
Mathlib has `θ` as `WittVector.fontaineTheta` — and equals `Spa(A,A^+)` with `A = W_{O_E}(R^+)[1/[ϖ]]/ξ`. In the
**unordered** case there is no global generator, and the ideal is obtained by **v-descent of line bundles**. That is
what the symmetric quotient costs, and it is easy to lose.

`Div^d_𝒴(S)` is then characterised geometrically: it is exactly the set of closed Cartier divisors whose pullback along
every geometric point has degree `d`. And bundles on the divisor form a v-stack, which is what makes the completed
rings `B^+ ⊂ B` v-sheaves.

**Coverage: `partial`.** The divisor moduli Div^d as symmetric v-sheaf quotients, the divisor attached to a leg tuple with its product equation and affineness, the geometric-fibre criterion for a relative Cartier divisor of degree d, the v-stack of bundles on the divisor, and the completed rings B^+ and B. In the UNORDERED case the ideal is obtained by v-descent of line bundles and not by choosing a generator, which is what the symmetric quotient costs.

Remaining in this layer:

- Remark VI.1.3 (relative-degree criterion) is attributed by FS to Fargues, 'Simple connexite des fibres d'une application d'Abel-Jacobi...' [Far20b]; that paper is not in the supplied library and was not read.
- The v-cover step of Proposition VI.1.4 imports SW20 Lemma 17.1.8 and the almost vanishing of H^1_v(S,O^+); neither was read.
- de Jong-van der Put Proposition 3.2.2 and KL15 Proposition 8.2.20 (reduction of an etale cover to a finite etale cover) were not read.
- Construction of Div^d_X by Frobenius descent and the gluing/restriction to Div^d_Y were read only in the one-paragraph form of the proof of VI.1.2.

### `div-d-moduli-v-sheaf` — FS VI.1.1: the degree-d divisor moduli as symmetric v-sheaf quotients

*definition.* **Planet: The divisor moduli Div^d.**

**Statement.** For d >= 0 define the small v-sheaves on Perf_{F_q}: Div^d_{Y-curly} = (Spd O_E)^d/Sigma_d, Div^d_Y = (Spd E)^d/Sigma_d, Div^d_X = Div^d = (Spd E/phi^Z)^d/Sigma_d. The quotients are taken inside v-sheaves and remain small.

**Hypotheses that must not be dropped.**

- Quotients by Sigma_d are v-sheaf quotients, not naive quotients of presheaves; smallness is preserved
- Div^d_{Y-curly} uses Spd O_E, so it retains the characteristic-p locus; Div^d_Y and Div^d_X use Spd E
- d = 0 is allowed and gives the final v-sheaf

**Proof outline.**

1. Fargues-Scholze give the three definitions in one display and note that quotients of small v-sheaves are taken inside v-sheaves and are still small.
2. The Frobenius quotient in Div^d_X is applied factorwise to Spd E before taking Sigma_d-coinvariants.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `DivCurlyY` | data | Div^d_{Y-curly} = (Spd O_E)^d/Sigma_d, the degree-d divisor moduli over the integral period space. |
| `DivY` | data | Div^d_Y = (Spd E)^d/Sigma_d, over the generic one. |
| `DivX` | data | Div^d = Div^d_X = (Spd E/phi^Z)^d/Sigma_d, over the curve. |
| `Div.quotientIsVSheaf` | structure | The quotients are taken inside v-sheaves and remain SMALL; smallness is part of the statement, not an afterthought. |
| `Div.symmetric` | structure | The symmetric-group quotient is what makes the legs unordered, and it is why the ideal of the divisor is obtained by v-descent of line bundles rather than by choosing a generator. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness` — the divisor attached to a point of this moduli space is cut out by a product of generators in the ordered case
- in `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor` — bundles on the divisor of a point of this space form a v-stack over it
- in `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness` — for d = 1 the moduli space is Spd E/phi^Z and is proper

**Unit tests.** A plausible wrong definition fails one of these.

- `d_zero` — Div^0 is the final object; a definition that does not degenerate correctly at d = 0 is not the symmetric power.
- `d_one_over_the_curve` — Div^1_X = Spd E/phi^Z, which is the statement the properness theorem is about.
- `unordered_not_ordered` — The Sigma_d-quotient is essential: in the unordered case the ideal is obtained by v-descent of line bundles and NOT by choosing xi = product xi_i, which only exists after ordering.
- `smallness` — The quotient remains a SMALL v-sheaf; without smallness the later representability statements are not even statable.

**Acceptance.**

- Verify that Div^1_{Y-curly} = Spd O_E and Div^1 = Spd E/phi^Z, and that Div^1 over Perf_k is Spd E-breve/phi^Z
- Verify that Div^2 is not the naive symmetric square on points: exhibit a v-cover needed to split a doubled leg

**Prerequisites.** `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D6`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Quotient`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition VI.1.1, printed p. 190.

  > For any d >= 0, consider the small v-sheaves on Perf_{F_q} given by Div^d_{Y-curly} = (Spd O_E)^d/Sigma_d, Div^d_Y = (Spd E)^d/Sigma_d, Div^d_X = Div^d = (Spd E/phi^Z)^d/Sigma_d, where Sigma_d is the symmetric group.

  Verbatim definition, including the retention of Spd O_E in the integral case required by the stage text.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Definition VI.1.1, printed p. 190.

  > As always, quotients of small v-sheaves are taken inside v-sheaves, and are still small (and in particular exist).

  Records the topology in which the quotient is formed.

### `product-equation-and-affineness` — FS VI.1.2: the divisor attached to a degree-d leg tuple, its product equation and affineness

*theorem.* **Planet: The divisor of a leg tuple.**

**Statement.** There is a functorial injection from Div^d_{Y-curly}(S) into closed Cartier divisors on Y-curly_S (and correspondingly for Div^d_Y on Y_S and Div^d_X on X_S). For affinoid perfectoid S = Spa(R,R^+) and ordered legs, the divisor is cut out by xi = product of xi_i where xi_i generates ker(theta_i : W_{O_E}(R^+) -> R_i^{sharp +}); it equals Spa(A,A^+) with A = W_{O_E}(R^+)[1/[varpi]]/xi and A^+ the integral closure of W_{O_E}(R^+)/xi. In the unordered case the ideal is obtained by v-descent of line bundles, not by choosing a generator. In cases (i) and (ii) D is affinoid for affinoid S; in case (iii) this holds locally in the analytic topology on S.

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid with pseudouniformizer varpi
- Over (Spd O_E)^d one has d untilts R_i^sharp with primitive kernel generators xi_i; the product xi is then a nonzerodivisor and cuts out a closed Cartier divisor, including at coincident legs
- For the unordered quotient the descent input is v-descent of LINE BUNDLES on Y_S, quoted as SW20 Proposition 19.5.3; a global generator need not exist
- Affineness in case (iii) is only local on S; the global statement is false

**Proof outline.**

1. Over (Spd O_E)^d and affinoid S, each xi_i defines a closed Cartier divisor by Prop. II.1.4; the product xi = prod xi_i defines another one, presented as Spa(A,A^+) with A = W_{O_E}(R^+)[1/[varpi]]/xi and A^+ the integral closure of W_{O_E}(R^+)/xi.
2. For a map S -> Div^d_{Y-curly} = (Spd O_E)^d/Sigma_d, the ideal sheaf is only defined v-locally; use v-descent of line bundles on Y_S (SW20 19.5.3) to descend the invertible ideal I contained in O_{Y-curly_S}, and check the Cartier property v-locally.
3. Show V(I) is quasicompact over S v-locally, hence contained in some Y-curly_{S,[0,n]}, so D = Spa(A,A^+) is affinoid in general.
4. Case (ii) follows by restricting to the open Y_S; case (iii) by descending along the Frobenius quotient, which is only locally split, giving affineness only locally on S.

**Acceptance.**

- Verify the doubled-leg case d = 2 with the two untilts equal: check that xi_1 xi_2 is still a nonzerodivisor and that the multiplicity is retained
- Verify that the unordered divisor ideal is a line bundle without a global generator on a suitable non-split base
- Verify the failure of global affineness for Div^d_X and the covering by loci where D_S is affinoid

**Prerequisites.** `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `PerfectoidSpaces:P3`, `DiamondsAndVStacks:D6`, `mathlib:WittVector.fontaineTheta`, `mathlib:Ideal.span`, `mathlib:IsLocalization`, `tauceti:TauCeti.Huber.Pair`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.2, printed p. 191.

  > Then xi = prod_i xi_i defines another closed Cartier divisor, given by Spa(A,A^+) for A = W_{O_E}(R^+)[1/[varpi]]/xi, and A^+ the integral closure of W_{O_E}(R^+)/xi, where varpi in R is a pseudouniformizer.

  Gives the product Cartier equation at ordered legs together with the exact presentation of the divisor, including the integral closure.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.2, printed p. 191.

  > Now the ideal sheaf of this closed Cartier divisor is a line bundle, and by [SW20, Proposition 19.5.3], line bundles on Y-curly_S satisfy v-descent. Thus, even if we are only given a map S -> Div^d_{Y-curly} = (Spd O_E)^d/Sigma_d, we can still define a line bundle I contained in O_{Y-curly_S}.

  The descent step for the unordered quotient, exactly as the stage text requires ('descended as a line bundle, not by choosing a global generator').
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.2, printed p. 191.

  > Moreover, in case (i) and (ii), if S = Spa(R,R^+) is affinoid perfectoid, then for any closed Cartier divisor D contained in Y-curly_S resp. D contained in Y_S in the image of this embedding, the adic space D = Spa(Q,Q^+) is affinoid. In case (iii), the same happens locally in the analytic topology on S.

  Fixes the scope of affineness, which the stage text singles out.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Proposition 19.5.3, printed p. 180.

  > Let S be in Perf be a perfectoid space of characteristic p and let U be an open subset of S x-dot Spa Z_p. The functor on Perf_S sending any S' -> S to the groupoid of G-torsors on U x_{S x-dot Spa Z_p} S' x-dot Spa Z_p is a v-stack.

  The imported v-descent statement; specialising G = GL_1 gives the line-bundle descent used above. Note the source states it over Spa Z_p; the ramified O_E-version is used by FS without restatement.

### `relative-degree-criterion` — FS VI.1.3: geometric-fibre characterisation of degree-d relative Cartier divisors

*comparison.*

**Statement.** Div^d_{Y-curly}(S) is exactly the set of relative Cartier divisors of degree d on Y-curly_S, that is, closed Cartier divisors whose pullback along every geometric point Spa(C,C^+) -> S is a Cartier divisor of degree d. The same holds for Div^d_Y and Div^d_X.

**Hypotheses that must not be dropped.**

- The test objects are geometric points Spa(C,C^+) -> S with C complete algebraically closed, including higher-rank C^+, not only rank-1 points
- Degree is measured on the fibre; the statement is a characterisation of the image of the injection of VI.1.2, not a new construction

**Proof outline.**

1. Fargues-Scholze assert the characterisation and attribute the verification to Fargues' article [Far20b], where the notion of relative Cartier divisor is set up in analogy with classical algebraic geometry.
2. For d = 1 the corresponding statement is Remark II.1.5, proved there by checking the Cartier property after pullback to Spa(K(s),K(s)^+) for each s in S.

**Acceptance.**

- Verify the d = 1 case directly from Remark II.1.5
- Test on a family where the two legs collide over a closed subset of S, and check that the fibre degree stays 2

**Prerequisites.** `DiamondsAndVStacks:D6`, `mathlib:Ideal.span`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark VI.1.3, printed p. 191.

  > As in [Far20b] one checks that Div^d_{Y-curly}(S) is the set of 'relative Cartier divisors' of degree d, that is to say Cartier divisors that give degree d Cartier divisors when pulled back via any geometric point Spa(C,C^+) -> S. The same holds for Div^d_Y and Div^d_X.

  Exact statement; FS defer the verification to Fargues' paper, which is the unresolved boundary recorded in gaps.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Remark II.1.5, printed p. 50.

  > The preceding Cartier divisor satisfies the stronger property of being a 'relative Cartier divisor' in the sense that for all s in S its pullback to Y_{Spa(K(s),K(s)^+)} is a Cartier divisor.

  The degree-one case, proved in FS, which fixes the intended meaning of 'relative'.

### `v-descent-of-bundles-on-the-divisor` — FS VI.1.4: vector bundles on D_S form a v-stack

*theorem.* **Planet: Bundles on a divisor form a v-stack.**

**Statement.** Sending a perfectoid S with a map to Div^d_{Y-curly} (resp. Div^d_Y, Div^d_X) to the category of vector bundles on the associated divisor D_S defines a v-stack.

**Hypotheses that must not be dropped.**

- S affinoid perfectoid is used in the descent argument; the general case follows by gluing
- The geometric-point step requires C complete algebraically closed, where D_S is a finite sum of degree-1 divisors
- The v-cover step uses that H^1_v(S, O(Y_{[0,n]})^+) is ALMOST zero, not zero, and the deduction of the perfectoid case from the base change to O_E[pi^{1/p^infty}]^wedge as a direct summand
- The reduction from a general etale cover to a finite etale cover quotes de Jong-van der Put Prop. 3.2.2 and KL15 Prop. 8.2.20

**Proof outline.**

1. Reduce the X_S and Y_S cases to Y-curly_S, since locally on S the relevant D_S are isomorphic.
2. For S = Spa(C,C^+): D_S is a finite sum of degree-1 Cartier divisors; induct on the degree and apply SW20 Lemma 17.1.8 at each untilt.
3. For an etale cover: reduce to a finite etale cover by dJvdP Prop. 3.2.2 / KL15 Prop. 8.2.20, note D_T -> D_S is finite etale since Y_T -> Y_S is, and apply ordinary finite etale descent.
4. For a v-cover: after etale localization assume E_T free, write the descent datum as a matrix that can be arranged to lie in 1 + [varpi] O^+(Y_{T x_S T,[0,n]})/xi, then use almost vanishing of H^1_v(S, O(Y_{[0,n]})^+) and the successive-approximation argument of SW20 Lemma 17.1.8 to produce an invariant basis in the limit.

**Acceptance.**

- Verify the successive-approximation bound explicitly for d = 1 and a split v-cover
- Verify the almost (not exact) vanishing of the v-cohomology group, and that the almost error is absorbed by the limit
- Check that finite etale descent for D_T -> D_S really applies when the legs collide

**Prerequisites.** `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D6`, `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:Module.Projective`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.4 and proof, printed pp. 191-192.

  > Now assume first that S = Spa(C,C^+) for some complete algebraically closed C. Then D_S is given by a finite sum of degree 1 Cartier divisors on Y-curly_S, and one can reduce by induction to the case of degree 1 Cartier divisors, where the result is [SW20, Lemma 17.1.8] applied to the corresponding untilt of S.

  The geometric-point base case and its imported input.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.4, printed p. 192.

  > Now one uses that the v-cohomology group H^1_v(S, O(Y_{[0,n]})^+) is almost zero, as follows from almost vanishing in the perfectoid case, and writing it as a direct summand of the positive structure sheaf of the base change to O_E[pi^{1/p^infty}]^wedge.

  The exact form of the cohomological input, including the word 'almost' and the direct-summand reduction.

### `completed-rings-B-plus-and-B` — The completed rings B^+_{Div^d} and B_{Div^d} along the divisor ideal

*construction.* **Planet: The completed rings B+ and B.**

**Statement.** Assuming D_S affinoid, as holds locally on S, let B^+_{Div^d_{Y-curly}}(S) (resp. B^+_{Div^d_Y}(S), B^+_{Div^d_X}(S)) be the global sections of the completion of O_{Y-curly_S} (resp. O_{Y_S}, O_{X_S}) along the ideal I_S, and set B_{Div^d_(-)}(S) = B^+_{Div^d_(-)}(S)[1/I_S]. These define v-sheaves B^+ contained in B over Div^d_(-) in all three cases. For d = 1 they are the rings usually denoted B^+_dR and B_dR.

**Hypotheses that must not be dropped.**

- D_S must be affinoid for the description by global sections; this is only local on S in the X-case
- The completion is along the invertible ideal I_S, and inverting I_S means inverting a local generator; the result is independent of that choice because I_S is invertible
- The v-sheaf property is inherited from Prop. VI.1.4 applied to the infinitesimal thickenings O/I^m

**Proof outline.**

1. Complete the three structure sheaves along I_S and take global sections over the affinoid divisor.
2. Invert the invertible ideal I_S to obtain B from B^+.
3. The v-sheaf property of B^+ and B follows by checking modulo powers of I_S, where the statement is Prop. VI.1.4 (this is exactly how it is used in the proof of VI.1.7).
4. Fargues-Scholze identify the d = 1 case with the classical de Rham period rings.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `Bplus` | data | B^+_{Div^d}(S), the global sections of the completion of the structure sheaf along the divisor ideal I_S, assuming D_S affinoid as holds locally on S. |
| `B` | data | B_{Div^d}(S) = B^+_{Div^d}(S)[1/I_S]. |
| `Bplus.threeVersions` | structure | The three cases Y-curly, Y and X give three different pairs; the roadmap keeps them apart because the integral one retains the special fibre. |
| `Bplus.vSheaf` | structure | B^+ contained in B are v-sheaves over Div^d in all three cases. |
| `Bplus.dRforDOne` | example | For d = 1 these are the rings usually written B^+_dR and B_dR, which is the next node. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration` — the d = 1 case with its filtration is built on this
- in `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor` — the v-sheaf property is what makes bundles on the divisor descend

**Unit tests.** A plausible wrong definition fails one of these.

- `local_affineness_hypothesis` — D_S is affinoid only LOCALLY on S; the construction is therefore local and glued, and a definition assuming global affineness overstates the hypothesis.
- `three_cases_differ` — The Y-curly, Y and X versions are different rings; conflating them loses the special fibre that the integral case retains.
- `inverting_the_ideal` — B is obtained by inverting I_S, not by inverting a chosen generator, which matters in the unordered case where no global generator exists.

**Acceptance.**

- Verify that B^+_{Div^1_{Y-curly}} at a characteristic-p point of Spd O_E is the ramified Witt ring W_{O_E}(R^+)-completion and NOT a B_dR of a characteristic-zero untilt
- Verify independence of the local generator of I_S in the localization
- Verify inverse-limit completeness B^+ = lim B^+/I^m

**Prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `mathlib:IsLocalization`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition VI.1.4, printed p. 192.

  > Assuming that D_S is affinoid, as is the case locally on S, we let B^+_{Div^d_{Y-curly}}(S) (resp. B^+_{Div^d_Y}(S), resp. B^+_{Div^d_X}(S)) be (the global sections of) the completion of O_{Y-curly_S} along I_S (resp. of O_{Y_S} along I_S, resp. of O_{X_S} along I_S), and B_{Div^d_(-)}(S) = B^+_{Div^d_(-)}(S)[1/I_S]. This defines v-sheaves B^+ contained in B over Div^d_(-) in all three ...

  Verbatim construction, the affinoid hypothesis, and the identification for d = 1. The excerpt is truncated here; the full quotation is in data/decompositions/RelativeFarguesFontaine.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.7, printed p. 193.

  > The category of vector bundles over B^+_{Div^d_{Y-curly}} (resp. B^+_{Div^d_Y}, B^+_{Div^d_X}) satisfies v-descent: It is enough to check this modulo powers of the ideal I_S, where the result is Proposition VI.1.4.

  Shows that the v-sheaf property of the completed rings is obtained from VI.1.4 through the I_S-adic filtration.

## RF2:untilts. Generic divisors and de Rham completions

An untilt **is** a primitive degree-one ideal `J ⊂ W(R^+)`, generated by
`ξ = p + [ϖ]α`; any such `ξ` is a nonzerodivisor. The correspondence runs both ways, and Mathlib's
`WittVector.fontaineTheta` is the `θ` whose kernel these are.

The geometric form is the norm estimate: an untilt gives a **closed immersion** `S^♯ ↪ 𝒴_S` presenting `S^♯` as a closed
Cartier divisor, with `0 → A --ξ--> A → B → 0` exact on suitable affinoids. The moduli of degree-one divisors on `X_S`
is then `Div¹ = Spd(E)/φ^ℤ`, where the quotient may be computed as a v-sheaf quotient **or** for the topology of open
covers — so *"locally on `S`"* may be read either way — and `Div¹ → *` is proper, representable in spatial diamonds and
cohomologically smooth.

For `d = 1` the completed rings are `B^+_dR` and `B_dR`. Their filtration has graded pieces `I_S^m/I_S^{m+1}` that are
**line bundles** — Breuil–Kisin twists — not free modules: changing the local generator changes the trivialization but
not the ring. And at a geometric untilt `B^+_dR` is a complete **discrete valuation ring** with residue field the
untilt, which is where the Cartan decomposition behind the Schubert stratification is computed. Mathlib has
`IsDiscreteValuationRing`.

**Coverage: `partial`.** Untilts as primitive degree-one ideals, the norm estimate presenting an untilt as a closed Cartier divisor, Div^1 = Spd E/phi^Z with its properness and cohomological smoothness, and B^+_dR with its filtration by Breuil-Kisin line bundles. Mathlib's WittVector.fontaineTheta is the theta whose kernel these ideals are.

Remaining in this layer:

- The residue map, the full ideal filtration with all graded pieces, and the base-change conditions for B^+_dR are only partially covered: FS give the graded pieces in the loop-group form (VI.1.10/VI.1.11) but the intrinsic filtration statements were not separately located.
- Effective Cartier divisors of degree d, their addition, the disjoint-divisor locus and the finite symmetric-power comparison 'in the source's range, retaining multiplicities' were not found in the passages read; the candidate location is Fargues' [Far20b] and FS VI.1, which only gives the symmetric-quotient definition.
- ECD Proposition 24.5 (cohomological smoothness of Spd E) and ECD Proposition 18.3 (valuative criterion) were not read.

### `primitive-untilt-correspondence` — Untilts as primitive degree-one ideals in the Witt ring

*comparison.*

**Statement.** For (R,R^+) a perfectoid Tate-Huber pair of characteristic p, an untilt is the same as a primitive degree-one ideal J contained in W(R^+), i.e. one generated by an element xi = p + [varpi]alpha with varpi a pseudouniformizer of R^+ and alpha in W(R^+); any such xi is a nonzerodivisor. The correspondence sends (S,S^+) to (S^flat,S^{flat+}, ker theta) and (R,R^+,J) to (W(R^+)[1/[varpi]]/J, W(R^+)/J).

**Hypotheses that must not be dropped.**

- (R,R^+) is a perfectoid Tate-Huber pair of characteristic p
- Primitivity of degree 1 is the shape xi = p + [varpi]alpha; the untilt is allowed to have characteristic p (take xi = p), so this does not force a characteristic-zero untilt
- In Scholze-Weinstein this is stated for p-typical Witt vectors over Z_p; the ramified O_E-version replaces p by pi and W by W_{O_E}

**Proof outline.**

1. Scholze-Weinstein prove that ker theta is generated by an explicit element of the required shape, constructed from f in varpi R^+ with f^sharp congruent to p modulo p varpi^sharp R^{sharp +}.
2. Nonzerodivisor property: assume xi sum [c_n]p^n = 0, reduce modulo [varpi] to get c_n congruent 0 modulo varpi, divide and induct.
3. Generation of ker theta: theta induces a surjection W(R^+)/xi -> R^{sharp +} which is an isomorphism modulo [varpi] because W(R^+)/(xi,[varpi]) = W(R^+)/(p,[varpi]) = R^+/varpi = R^{sharp +}/varpi^sharp.
4. Fargues-Scholze use the corresponding ramified normalisation xi = pi - a[varpi] in the proof of Prop. II.1.4.

**Acceptance.**

- Verify the correspondence on the tautological untilt of R itself (xi = p), which must be allowed
- Verify the ramified analogue of the shape xi = pi - a[varpi] for E ramified over Q_p
- Verify that the plus ring of the untilt is W(R^+)/J and not merely the integral closure of the image

**Prerequisites.** `PerfectoidSpaces:P2`, `mathlib:WittVector`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.teichmuller`, `mathlib:PreTilt`, `mathlib:PreTilt.untilt`, `mathlib:Ideal.span`

**Sources.**

- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Definition 6.2.9 and Lemma 6.2.10, printed p. 46.

  > An ideal I contained in W(R^+) is primitive of degree 1 if I is generated by an element of the form xi = p + [varpi]alpha, with varpi in R^+ a pseudo-uniformizer and alpha in W(R^+). Lemma 6.2.10. Any element xi in W(R^+) of the form xi = p + [varpi]alpha ... is a nonzerodivisor.

  Exact definition and the nonzerodivisor lemma with its one-line induction proof.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Theorem 6.2.11, printed p. 47.

  > There is an equivalence of categories between: 1. Perfectoid Tate-Huber pairs (S,S^+) 2. Triples (R,R^+,J), where (R,R^+) is a perfectoid Tate-Huber pair of characteristic p and J contained in W(R^+) is primitive of degree 1. In one direction the map is (S,S^+) -> (S^flat, S^{flat+}, ker theta), and in the other, it is (R,R^+,J) -> (W(R^+)[[varpi]^{-1}]/J, W(R^+)/J).

  The precise equivalence, including the formula for the plus ring.
- `SW20-berkeley` — Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Before Definition 6.2.9, printed p. 46.

  > We remark that there is no assumption that an untilt of R should have characteristic 0. In particular R itself is an untilt of R, corresponding to xi = p.

  Confirms that the characteristic-p untilt is retained, matching the stage text's insistence on keeping the special fibre.

### `closed-cartier-divisor-norm-estimate` — FS II.1.4: an untilt is a closed Cartier divisor, via a Shilov-boundary norm estimate

*theorem.* **Planet: An untilt is a closed Cartier divisor.**

**Statement.** For S perfectoid over F_q, sections of (Y-curly_S)^diamond -> S, maps S -> Spd O_E, and untilts S^sharp of S over O_E are in natural bijection. Given such an untilt there is a natural closed immersion S^sharp -> Y-curly_S presenting S^sharp as a closed Cartier divisor: for U = Spa(A,A^+) contained in Y-curly_S with affinoid perfectoid pullback V = Spa(B,B^+) contained in S^sharp, the sequence 0 -> A --xi--> A -> B -> 0 is exact.

**Hypotheses that must not be dropped.**

- S = Spa(R,R^+) affinoid perfectoid; the generator may be chosen of the form xi = pi - a[varpi] with a in W_{O_E}(R^+), after choosing a pseudouniformizer varpi in R^+ with varpi^sharp | pi
- One may localize near S^sharp = V(xi) and assume U = {|xi| <= |[varpi]|^n} for some n > 0
- Norms are the spectral norms, normalized on each completed residue field of Y-curly_S by |[varpi]| = 1/q
- The estimate |xi a| >= q^{-n}|a| for all a in A gives BOTH injectivity and closed image; surjectivity onto B uses that R^sharp is the separated completion of A/xi
- The maximum-modulus step is reduced to the Shilov boundary, then to U x_{Spa O_E} Spa O_{E_infty}, then to the tilt, an affinoid subset of D_{S,perf}, and finally by approximation to classical affinoid subsets of D_S

**Proof outline.**

1. Deduce the bijection (i)-(iii) directly from Prop. II.1.2.
2. Write R^{sharp +} = W_{O_E}(R^+)/xi with xi = pi - a[varpi] obtained from pi = varpi^sharp theta(a).
3. To prove exactness, localize so that U = {|xi| <= |[varpi]|^n}; prove |xi a| >= q^{-n}|a| using that the spectral norm on U is the supremum over the Shilov boundary, all of whose points lie in {|xi| = |[varpi]|^n}.
4. Transfer the maximum principle through the split base change to O_{E_infty} and the tilt to D_{S,perf}, then approximate by classical affinoid subsets of D_S where the maximum principle is classical.
5. Conclude injectivity and closedness of the image of xi, and identify B = A/xi.

**Acceptance.**

- Verify the inequality |xi a| >= q^{-n}|a| on an explicit annulus for E = Q_p and for a ramified E
- Verify the normalization |[varpi]| = 1/q and that changing varpi rescales but does not destroy the estimate
- Verify the existence of varpi with varpi^sharp | pi on a non-field affinoid perfectoid base

**Prerequisites.** `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `PerfectoidSpaces:P2`, `mathlib:WittVector.fontaineTheta`, `mathlib:Valuation`, `mathlib:Ideal.span`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.4 and proof, printed p. 50.

  > Then S^sharp = Spa(R^sharp, R^{sharp +}) is affinoid perfectoid as well, and R^{sharp +} = W_{O_E}(R^+)/xi for some nonzerodivisor xi in W_{O_E}(R^+) that can be chosen to be of the form pi - a[varpi] for some a in W_{O_E}(R^+) and suitable topologically nilpotent varpi in R.

  The ramified normalisation of the primitive generator used throughout Chapter II.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.1.4, printed p. 50.

  > Endow A with the spectral norm, where we normalize the norm on each completed residue field of Y-curly_S by |[varpi]| = 1/q. We claim that with this choice of norm, one has |xi a| >= q^{-n}|a| for all a in A. In particular, this implies that xi : A -> A is injective, and has closed image.

  The exact analytic estimate and what it yields; this is the technical heart of the stage.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.1.4, printed p. 50.

  > In fact, it is enough to consider the points in the Shilov boundary, i.e. those points Spa(C,O_C) -> U that admit a specialization Spa(C,C^+) -> Y-curly_S whose image is not contained in U; any such is necessarily contained in {|xi| = |[varpi]|^n}.

  Records the Shilov-boundary reduction that the stage text attributes to FarguesFontaineDiamonds F4 in the fixed-field case.

### `div1-moduli-and-properness` — Div^1 = Spd E/phi^Z: degree-one divisors, properness and cohomological smoothness

*theorem.* **Planet: Div^1 = Spd E / phi^Z.**

**Statement.** A closed Cartier divisor of degree 1 on X_S is by definition one arising from a map S -> Spd(E)/phi^Z, equivalently locally on S from an untilt S^sharp over E. The moduli space of such is Div^1 = Spd(E)/phi^Z, where the quotient may be computed either as a v-sheaf quotient or for the topology of open covers, so that 'locally on S' may be read v-locally or on open subsets of |S|. The map Div^1 -> * is proper, representable in spatial diamonds, and cohomologically smooth.

**Hypotheses that must not be dropped.**

- E is the fixed nonarchimedean local coefficient field; over Perf_k with k algebraically closed, Spd(E) is replaced by Spd(E-breve) and Div^1 = Spd(E-breve)/phi^Z
- Cohomological smoothness of Spd(E) -> * is quoted from ECD Proposition 24.5 for E = Q_p, from which the finite-extension case follows formally; the equal-characteristic case is handled inside that proof
- Properness is obtained from the valuative criterion of ECD Proposition 18.3 after qcqs-ness is established
- Div^1 is the moduli of degree-1 divisors, not the curve itself; FS flag this explicitly

**Proof outline.**

1. Sections of (Y_S)^diamond -> S correspond to maps S -> Spd E and to untilts over E (Prop. II.1.18, from II.1.4).
2. Composing S^sharp -> Y_S -> X_S still gives a closed Cartier divisor depending only on S -> Spd(E)/phi^Z, giving the injection of Spd(E)/phi^Z into closed Cartier divisors on X_S.
3. |Spd(E) x S| = |Y_S| -> |S| together with total discontinuity of phi^Z gives |Spd(E)/phi^Z x S| = |X_S| -> |S| qcqs for qcqs S, hence representability in spatial diamonds.
4. Properness then follows from the valuative criterion; cohomological smoothness is inherited from Spd(E) -> *.

**Acceptance.**

- Verify Div^1(C) = untilts of C over E modulo Frobenius, matching Def./Prop. II.1.22
- Verify that the open-cover quotient and the v-sheaf quotient agree, so that a degree-1 divisor is analytically local on S
- Check the identification of Div^1 with (BC(O(1)) minus zero)/E^times from Corollary II.2.4 as an independent test

**Prerequisites.** `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D5`, `DiamondSixOperations:S4`, `mathlib:CategoryTheory.Sheaf`, `mathlib:SpectralSpace`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Definition II.1.19 and following, printed p. 56.

  > A closed Cartier divisor of degree 1 on X_S is a closed Cartier divisor D contained in X_S that arises from a map S -> Spd(E)/phi^Z. Equivalently, it arises locally on S from an untilt S^sharp over E of S. The quotient Spd(E)/phi^Z that occurs here is the quotient in the category of v-sheaves; but we note that it agrees with the quotient computed in the category of sheaves on Perf_{F_q} ...

  Definition plus the comparison of the two quotient topologies, which is what makes 'locally on S' unambiguous. The excerpt is truncated here; the full quotation is in data/decompositions/RelativeFarguesFontaine.json, where the independent review checked it against the source.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.1.21 and proof, printed p. 56.

  > The map Div^1 -> * is proper, representable in spatial diamonds, and cohomologically smooth. Proof. First, Spd(E) -> * is representable in locally spatial diamonds and cohomologically smooth by [Sch17a, Proposition 24.5] (for E = Q_p, which formally implies the case of E finite over Q_p, and the equal characteristic case is handled in the proof).

  The three properties and the exact imported input, with its case distinction.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Corollary II.2.4, printed p. 61.

  > There is a well-defined map BC(O(1)) \ {0} -> Div^1 sending a nonzero section f in H^0(X_S, O_{X_S}(1)) to the closed Cartier divisor given by V(f). This descends to an isomorphism (BC(O(1)) \ {0})/E^times = Div^1.

  An independent presentation of Div^1 usable as the acceptance test.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Corollary II.2.4, printed p. 61.

  > In particular, if one works on Perf_k, then Div^1 = Spd E-breve/phi^Z, whose pi_1^et is given by the absolute Galois group of E.

  Sources hypothesis 1: the unramified coefficient base E-breve appears exactly when one works over Perf_k, which is the convention the RF2:untilts stage text fixes.

### `BdR-completion-and-filtration` — B^+_dR, B_dR and the I_S-adic filtration at a degree-one divisor

*construction.* **Planet: B_dR and its filtration.**

**Statement.** For d = 1 the rings of the previous construction are B^+_dR = B^+_{Div^1}(S) and B_dR = B^+_dR[1/I_S]. The filtration by powers of I_S has graded pieces I_S^m/I_S^{m+1}, which are line bundles on D_S (Breuil-Kisin twists {m}); changing the local generator of I_S changes the trivialization of the graded pieces but not the completed ring. At a geometric untilt the ring B^+_dR is a complete discrete valuation ring whose residue field is the untilt.

**Hypotheses that must not be dropped.**

- Degree d = 1, so that D_S is the closed Cartier divisor attached to a single untilt S^sharp over E (resp. over O_E in the integral case)
- The identification of I_S^m/I_S^{m+1} with a line bundle on D_S requires the Cartier property, i.e. invertibility of I_S; it is NOT a free module unless a generator has been chosen
- The complete-discrete-valuation-ring description is asserted for geometric points: FS use that at a geometric point B^+_{Div^d_{Y-curly}}(S) is a product of complete discrete valuation rings with algebraically closed residue field
- PACKET-AUTHORED: the clause 'changing the local generator of I_S changes the trivialization of the graded pieces but not the completed ring' is an inference from invertibility of I_S; Fargues-Scholze do not state it in the passages read. It is what the RF2:untilts stage text asks for, and is recorded here as unproved in the source.

**Proof outline.**

1. Instantiate the construction of B^+_{Div^d} at d = 1.
2. The graded pieces of the principal congruence filtration are computed in Prop. VI.1.10 and VI.1.11 as Lie G tensor I_S^m/I_S^{m+1}, where I_S^m/I_S^{m+1} is a line bundle on D_S; the same computation identifies the graded pieces of the filtration on B^+ itself.
3. At a geometric point, FS record that B^+_{Div^d_{Y-curly}}(S) is a product of complete discrete valuation rings with algebraically closed residue field, which gives the local structure and the residue map.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `BdRplus` | data | B^+_dR = B^+_{Div^1}(S), the completion along a degree-one divisor ideal. |
| `BdR` | data | B_dR = B^+_dR[1/I_S]. |
| `filtration` | data | The I_S-adic filtration with graded pieces I_S^m/I_S^{m+1}. |
| `filtration.gradedAreLineBundles` | structure | Each graded piece is a LINE BUNDLE on D_S, the Breuil-Kisin twist {m}; changing the local generator changes its trivialization but not the completed ring. |
| `BdRplus.dvr` | characterisation | At a geometric untilt B^+_dR is a complete DISCRETE VALUATION RING whose residue field is the untilt; this is where the Cartan decomposition of GeometricSatakeAndFusion is computed. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map` — the twists whose sections form the graded algebra are the same Breuil-Kisin line bundles one level up
- in `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B` — this is the d = 1 case of that construction

**Unit tests.** A plausible wrong definition fails one of these.

- `dvr_at_a_geometric_point` — At a geometric untilt B^+_dR is a complete DVR with residue field the untilt. Anything else contradicts the Cartan decomposition that the Schubert stratification rests on.
- `graded_pieces_are_line_bundles_not_free` — I_S^m/I_S^{m+1} is a line bundle and need not be trivial; a construction that trivialises it has fixed a generator and lost the Breuil-Kisin twist.
- `generator_independence` — Changing the local generator of I_S changes the trivialization of the graded pieces but NOT the completed ring; a definition depending on the generator is not well posed.
- `not_the_classical_BdR_only` — This is the relative B_dR over a general base; over a geometric point it recovers the classical one, and a construction that only makes sense at a point is not this one.

**Acceptance.**

- Verify that for S^sharp of characteristic p the ring B^+_{Div^1_{Y-curly}} is the completed ramified Witt ring, not a mixed-characteristic B^+_dR
- Verify that gr^m is a line bundle that need not be trivial for a non-split base
- Verify the independence of the completed ring from the chosen generator xi

**Prerequisites.** `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `mathlib:IsDiscreteValuationRing`, `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `mathlib:IsLocalization`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition VI.1.4, printed p. 192.

  > In the case of d = 1, those rings are the ones that are usually denoted B_dR, resp. B^+_dR.

  Identifies the d = 1 specialisation.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition VI.1.10 and VI.1.11, printed pp. 194-195.

  > (L^+_{Div^1_{Y-curly}} G)^{>=m}/(L^+_{Div^1_{Y-curly}} G)^{>=m+1} = (Lie G)^diamond {m} where {m} signifies a 'Breuil-Kisin twist' by I_S^m/I_S^{m+1}. ... sends a perfectoid space S -> Div^d_{Y-curly} with corresponding Cartier divisor D_S contained in Y-curly_S with ideal sheaf I_S to (Lie G tensor_{O_E} I_S^m/I_S^{m+1})(S) where I_S^m/I_S^{m+1} is a line bundle on D_S.

  Fixes the graded pieces of the I_S-adic filtration and states explicitly that they are line bundles on D_S.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition VI.1.7, printed p. 193.

  > Indeed, if S is a geometric point then B^+_{Div^d_{Y-curly}}(S) is a product of complete discrete valuation rings with algebraically closed residue field, so that all G-torsors are trivial.

  The local structure of B^+ at a geometric point, used for the residue field statement.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, VI.2 opening, printed p. 196.

  > for every geometric point S = Spa(C,C^+) -> Div^1_{Y-curly} = Spd O_E given by an untilt S^sharp = Spa(C^sharp,C^{sharp+}) of S, one has B^+_{Div^1_{Y-curly}} = B^+_dR(C^sharp) and B_{Div^1_{Y-curly}} = B_dR(C^sharp) for the usual definition of B^+_dR and B_dR (relative to O_E). Recall that B^+_dR(C^sharp) is a complete discrete valuation ring with residue field C^sharp, fraction field ...

  The d = 1 geometric-point description with its residue field and uniformizer, which the node statement asserts; previously only the general 'product of complete discrete valuation rings' remark of p. 193 was cited. The excerpt is truncated here; the full quotation is in data/decompositions/RelativeFarguesFontaine.json, where the independent review checked it against the source.

## RF3. Line bundles and the graded algebra

The exact tensor-functor `Isoc_k → Bun(X_S)`, `(D,φ) ↦ ℰ(D,φ)`, obtained by descending
`D ⊗_{Ĕ} O_{Y_S}` along `φ ⊗ φ`. The twists are `O_{X_S}(n) = ℰ(Ĕ, π^{-n}σ)`, and **the functor reverses slopes** —
Fargues–Scholze flag the change of sign in a parenthesis, and it must be fixed once, because it propagates into every
slope statement of `VectorBundlesAndIsocrystals` and `GeometricSatakeAndFusion`.

Then `P = ⊕_{n≥0} H⁰(X_S, O_{X_S}(n))` and `X_S^alg = Proj P`, with a natural map of **locally ringed spaces**
`X_S → X_S^alg`. The construction is formal: on the nonvanishing locus of `g ∈ P_n`, multiplication by `g` is an
isomorphism `O_U → O_U(n)`, and the local ring maps glue. **No ampleness hypothesis is used.**

That matters for the shape of the atlas. The GAGA *equivalence* needs global generation, and that is
`VectorBundlesAndIsocrystals:VB2:ampleness`. Keeping the formal map here and the equivalence there is what stops the
two roadmaps from being circular.

**Coverage: `partial`.** The functor from isocrystals to bundles with the slope-reversing sign, and the graded algebra with the map of locally ringed spaces X_S -> X_S^alg. That map is constructed FORMALLY, with no ampleness hypothesis; only the GAGA equivalence needs one, and that is VectorBundlesAndIsocrystals:VB2:ampleness. Keeping the two apart is what stops the two roadmaps from being circular.

Remaining in this layer:

- Divisor sections and explicit transition functions for O(n) were not read; FS give the isocrystal definition and the Lubin-Tate section (Prop. II.2.2) but not a chart-level transition-function description.
- The graded algebra's ring-theoretic properties for general affinoid S (beyond the formal construction of the map to Proj P) were not read.
- The 'restriction identifications' the stage says it owns were not located as separate statements.

### `isocrystal-line-bundles-and-sign` — O_{X_S}(n) from isocrystals, and the slope-reversal sign

*construction.* **Planet: The twists O(n) and the slope sign.**

**Statement.** Fix an algebraically closed k over F_q and let E-breve = W_{O_E}(k)[1/pi] with Frobenius sigma. Functorially in S in Perf_k there is a natural exact tensor-functor Isoc_k -> Bun(X_S), (D,phi) -> E(D,phi), obtained by descending D tensor_{E-breve} O_{Y_S} along phi tensor phi. One sets O_{X_S}(n) = E(E-breve, pi^{-n} sigma); the functor REVERSES slopes, and for the simple isocrystal (D_lambda, phi_lambda) of slope lambda one sets O_{X_S}(-lambda) = E(D_lambda, phi_lambda).

**Hypotheses that must not be dropped.**

- k is algebraically closed over F_q; S lies in Perf_k so that the constant isocrystal descends
- phi denotes the q-power Frobenius on Y_S and sigma the Frobenius of E-breve; the descent is along the diagonal phi tensor phi
- The eigenvalue convention is pi^{-n} sigma for O(n): the Frobenius eigenvalue and the degree have OPPOSITE signs
- (D,phi) has phi a bijective sigma-semilinear endomorphism of a finite-dimensional E-breve vector space

**Proof outline.**

1. Descend the constant bundle D tensor_{E-breve} O_{Y_S} along the Frobenius-semilinear automorphism phi tensor phi to a bundle on X_S = Y_S/phi^Z.
2. Exactness and the tensor structure are inherited from the constant construction.
3. Fargues-Scholze record the sign reversal explicitly when defining O_{X_S}(n) and again when defining O_{X_S}(-lambda) from the Dieudonne-Manin simple objects.
4. Cross-check: Prop. II.2.2 computes H^0(X_S, O(1)) = H^0(Y_S,O)^{phi = pi}, so the superscript on the Frobenius equation for O(1) is phi = pi.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `isocToBundle` | data | The natural exact tensor-functor Isoc_k -> Bun(X_S), (D,phi) -> E(D,phi), obtained by descending D tensor_{E-breve} O_{Y_S} along phi tensor phi, functorially in S in Perf_k. |
| `Ebreve` | data | E-breve = W_{O_E}(k)[1/pi] with its Frobenius sigma, for a fixed algebraically closed k over F_q. |
| `twist` | data | O_{X_S}(n) = E(E-breve, pi^{-n} sigma). |
| `twist.signReversal` | structure | The functor REVERSES slopes: for the simple isocrystal of slope lambda one sets O_{X_S}(-lambda) = E(D_lambda, phi_lambda). Fargues-Scholze flag the change of sign in a parenthesis, and it must be fixed once. |
| `isocToBundle.exactTensor` | structure | The functor is exact and monoidal, which is what makes slopes add under tensor and negate under dual. |

Derived from where the object is used:

- in `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map` — the graded algebra is the sum of the sections of these twists
- in `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration` — the Breuil-Kisin twists of the filtration are the same objects one degree at a time

**Unit tests.** A plausible wrong definition fails one of these.

- `sign_is_reversed` — O_{X_S}(n) = E(E-breve, pi^{-n} sigma) and the functor reverses slopes; the opposite convention inverts every slope statement in VectorBundlesAndIsocrystals and in GeometricSatakeAndFusion.
- `descent_along_phi` — The bundle is obtained by descending along phi tensor phi on Y_S, not by a direct construction on X_S; a definition on X_S alone cannot express the Frobenius equivariance.
- `tensor_and_dual` — Slopes add under tensor and negate under dual, because the functor is exact monoidal.
- `depends_on_k` — The functor is defined after fixing an algebraically closed k over F_q and is functorial in S in Perf_k; a version over a general base is a different statement.

**Acceptance.**

- Verify H^0(X_S, O_{X_S}(1)) = H^0(Y_S, O_{Y_S})^{phi=pi} and that H^0(O(-1)) = 0
- Verify deg O(n) = n against Pic(X_C) = Z (Prop. II.2.10), confirming the sign
- Verify the tensor and dual comparisons O(m) tensor O(n) = O(m+n), O(n)^dual = O(-n)

**Prerequisites.** `FarguesFontaineDiamonds:F4`, `mathlib:WittVector`, `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.frobenius`, `mathlib:CategoryTheory.MonoidalCategory`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, II.2 preamble, printed p. 58.

  > We denote by O_{X_S}(n) the image of (E-breve, pi^{-n} sigma) (note the change of sign - the functor E reverses slopes); more generally, if (D_lambda, phi_lambda) is the simple isocrystal of slope lambda in Q in the Dieudonne-Manin classification, we let O_{X_S}(-lambda) = E(D_lambda, phi_lambda).

  The exact normalization and the explicit sign warning that the stage text demands.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proposition II.2.2, printed p. 60.

  > defines a natural isomorphism G-tilde(R^{sharp +}) = H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}.

  Independent confirmation of the Frobenius eigenvalue convention for O(1).

### `graded-algebra-and-algebraic-curve-map` — The graded ring P and the map of locally ringed spaces X_S -> X_S^alg

*construction.* **Planet: The graded algebra and X^alg.**

**Statement.** For S affinoid perfectoid, set P = direct sum over n >= 0 of H^0(X_S, O_{X_S}(n)) and X_S^alg = Proj P. Formally (without any ampleness hypothesis) there is a natural map of locally ringed spaces f : (X_S, O_{X_S}) -> X_S^alg: for g in P_n and U = D(g) the nonvanishing locus in X_S, multiplication by g|_U is an isomorphism O_U -> O_U(n), and x = a/g^k in P[g^{-1}]_0 is sent to g|_U^{-k} composed with a, giving a ring map P[g^{-1}]_0 -> O(U); these glue.

**Hypotheses that must not be dropped.**

- S affinoid perfectoid over F_q, so that X_S is a qcqs adic space and O(n) is defined by RF3's isocrystal normalization
- The CONSTRUCTION of f needs no ampleness: Fargues-Scholze state 'the construction of the map is formal (and does not rely on any assumptions)'
- Proj P is formed by glueing Spec P[g^{-1}]_0 over homogeneous g of positive degree; quasicompactness of X_S lets one use finitely many g of a single large degree
- The statement that f^* is an equivalence on vector bundles and preserves cohomology is the GAGA theorem and needs the global-generation and vanishing hypotheses; it is owned by VectorBundlesAndIsocrystals VB2:ampleness, not here

**Proof outline.**

1. Define P as the graded ring of global sections of the twists.
2. For each homogeneous g of positive degree, trivialize O(n) on D(g) by multiplication by g and build the ring map P[g^{-1}]_0 -> O(D(g)).
3. Check these are maps of local rings and glue over varying g, producing f : (X_S,O_{X_S}) -> Proj P.
4. Record that Proj P carries a tautological O(1) whose pullback is O_{X_S}(1), and that X_S^alg is quasicompact because finitely many g suffice.

**Planning API.**

| name | role | statement |
| --- | --- | --- |
| `P` | data | P = the direct sum over n >= 0 of H^0(X_S, O_{X_S}(n)), a graded ring, for S affinoid perfectoid. |
| `Xalg` | data | X_S^alg = Proj P. |
| `toAlg` | data | A natural map of LOCALLY RINGED SPACES f : (X_S, O_{X_S}) -> X_S^alg, constructed formally and WITHOUT any ampleness hypothesis. |
| `toAlg.onBasicOpens` | structure | For g in P_n and U = D(g) the nonvanishing locus in X_S, multiplication by g\|_U is an isomorphism O_U -> O_U(n), and a/g^k in P[g^{-1}]_0 goes to g\|_U^{-k} composed with a; these glue. |
| `toAlg.notYetAnEquivalence` | structure | That f induces an equivalence on vector bundles is the GAGA theorem of VectorBundlesAndIsocrystals:VB2:ampleness and needs global generation; this construction supplies only the map. |

Derived from where the object is used:

- in `VectorBundlesAndIsocrystals:VB2:ampleness` — the axiomatic GAGA theorem is about this map and needs the global-generation hypothesis that is proved there
- in `VectorBundlesAndIsocrystals:VB1` — the degree of a bundle is defined through Pic(X_C) = Z, which is computed on the algebraic side

**Unit tests.** A plausible wrong definition fails one of these.

- `no_ampleness_needed_for_the_map` — The map of locally ringed spaces exists formally, with no ampleness hypothesis; only the equivalence needs one, and conflating the two makes the roadmap circular.
- `multiplication_by_g_is_an_iso` — On the nonvanishing locus of g in P_n, multiplication by g is an isomorphism O_U -> O_U(n); this is the whole content of the local formula.
- `gluing` — The local ring maps glue over the basic opens, which is what makes f a map of locally ringed spaces rather than a family of maps.
- `graded_pieces_can_vanish` — P_n may be zero for small n; the construction must not assume the graded ring is generated in degree one.

**Acceptance.**

- Verify the construction of f without invoking II.2.6, i.e. on a bundle for which global generation has not yet been proved
- Verify that the pullback of O_{Proj P}(1) is O_{X_S}(1)
- Verify quasicompactness of Proj P using a finite set of degree-n sections

**Prerequisites.** `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `mathlib:GradedAlgebra`, `mathlib:ProjectiveSpectrum`, `mathlib:AlgebraicGeometry.LocallyRingedSpace`, `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`

**Sources.**

- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, Proof of Proposition II.2.7, printed p. 67.

  > The construction of the map f : (X,O_X) -> X^alg is formal (and does not rely on any assumptions): if g in P_n, then on the non-vanishing locus U = D(g) contained in X, there is an isomorphism g|_U : O_U -> O_U(n). Now, for x = a/g^k in P[g^{-1}]_0, g|_U^{-k} composed with a lies in O(U), and this defines a morphism of rings P[g^{-1}]_0 -> O(U).

  The formal construction, isolated from the ampleness hypotheses, exactly as this stage requires.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.2.7, printed pp. 66-67.

  > In our situation, if n is large enough so that O_X(n) is globally generated, then it is enough to consider only f in P_n for this given n, and in fact only a finite set of them (as X is quasicompact); in particular, Proj(P) is quasicompact. ... The pullback of O_{Proj(P)}(1) is then given by O_X(1).

  The quasicompactness and the identification of the tautological twist.
- `FS-geometrization` — Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*, After Proposition II.2.7, printed p. 68.

  > In particular, for any affinoid perfectoid space S over F_q, we can define the algebraic curve X_S^alg = Proj of the direct sum over n >= 0 of H^0(X_S, O_{X_S}(n)).

  The instantiation for the relative curve with the affinoid hypothesis on S.

## Requests

- **`AdicSpacesPartII:R0`** — Huber rings, their adic topologies and completions. W_{O_E}(R^+) with the (pi,[varpi])-adic topology is a Huber ring, and the whole construction is Spa of one.
- **`AdicSpacesPartII:R1`** — Spa of a Huber pair with its structure presheaf, and rational subsets. The integral period space is a rational-subset complement in such a Spa, and the annuli are rational subsets.
- **`AdicSpacesPartII:R2`** — Analytic adic spaces and the sheafiness question. Y-curly_S is asserted to be an analytic adic space over O_E, and sheafiness is proved rather than assumed.
- **`AdicSpacesPartII:R3`** — The uniform-completion and finite-etale machinery behind the perfectoid base change to O_{E_infty} and the splitting that transports the sheaf property back.
- **`AdicSpacesPartII:R5`** — Gluing of adic spaces along open immersions, which is how Y-curly_S is defined for a general perfectoid base out of the affinoid case.
- **`AdicEtaleGeometry:A3`** — Nonnoetherian affinoid-etale approximation, quoted in the chart-cover argument.
- **`PerfectoidSpaces:P1`** — Perfectoid tilting and the marked-untilt theory. Every base here is perfectoid and every untilt statement is about its tilt.
- **`PerfectoidSpaces:P2`** — Perfectoid pullback, rational localisations and almost acyclicity. The perfectoidness of the base change, the Tate-Huber pairs of the untilt correspondence and the Shilov-boundary norm estimate all live here.
- **`PerfectoidSpaces:P3`** — Almost purity and the finite-etale site, on which the v-descent statements and the tilting comparison of the chart cover rest.
- **`PerfectoidSpaces:P4`** — The perfectoid structure sheaf and its acyclicity, which is what makes the sheafiness of Y-curly_S follow from the perfectoid case by splitting.
- **`DiamondsAndVStacks:D1`** — Totally disconnected perfectoid spaces and the Berkovich quotient, through which the radius function factors.
- **`DiamondsAndVStacks:D3`** — Effective descent and the v-topology. The v-sheaf property of the divisor moduli, the v-stack of bundles on a divisor and the v-descent of the unordered divisor ideal are all statements here.
- **`DiamondsAndVStacks:D4`** — Diamonds and small v-stacks, in which Spd O_E, Spd E and the quotients defining Div^d are formed, and in which the functor-of-points theorem is stated.
- **`DiamondsAndVStacks:D5`** — Spatial diamonds and relative representability, needed for the statement that Div^1 -> * is representable in spatial diamonds.
- **`DiamondsAndVStacks:D6`** — Diamondification and Spd, and the equivalence of the analytic and diamond etale sites. (Y-curly_S)^diamond = Spd O_E x S is the central identification of this part.
- **`DiamondSixOperations:S4`** — Cohomological smoothness with its descent hypotheses, which is the last clause of the Div^1 properness theorem.
- **`FarguesFontaineDiamonds:F0`** — The absolute Fargues-Fontaine diamond constructions, which the functor-of-points theorem specialises.
- **`FarguesFontaineDiamonds:F1`** — The absolute period annuli and their exhaustion, of which the relative ones here are the base-changed version.
- **`FarguesFontaineDiamonds:F2`** — The absolute Frobenius quotient, the model for the freeness and total discontinuity argument.
- **`FarguesFontaineDiamonds:F3`** — The absolute curve and its diamond, which the relative diamond formula specialises.
- **`FarguesFontaineDiamonds:F4`** — The absolute isocrystal-to-bundle functor and the fixed-field estimate. The decomposition's own gap records that F4 supplies the fixed-field Q_p estimate only, and that the ramified relative assembly of FS II.1.4 has no supplier; this request is filed against that gap.

## Gaps

### Fargues' [Far20b] is absent from the supplied library

FS cite [Far20b] (L. Fargues) for (a) the equivalence of their Definition II.1.19 with a relative-Cartier-divisor definition (Remark II.1.20), (b) Remark VI.1.3's characterisation of Div^d(S) by geometric fibres, and (c) Corollary II.2.4 (Far20b Proposition 2.12) and the Lubin-Tate/Artin reciprocity comparison in Section 2.3. Searched the supplied library: CATALOGUE.json and the diamonds source files list no Fargues single-author paper besides FarguesFontaine_Courbes. NEXT SOURCE ACTION: obtain L. Fargues, 'Simple connexite des fibres d'une application d'Abel-Jacobi et corps de classes local' (Ann. Sci. ENS, author-hosted preprint) and read Definition 2.6, Proposition 2.12 and Section 2.3. Until then the geometric-fibre criterion is recorded as an unread import, not as an established input.

### [GR03, Proposition 5.4.21] could not be matched in the locally available Gabber-Ramero copy

FS's proof of Proposition VI.1.7 concludes etale-local triviality of G-torsors over B^+_{Div^d} by citing [GR03, Proposition 5.4.21], i.e. the Springer LNM 1800 (2003) edition of Gabber-Ramero 'Almost ring theory'. The library copy is arXiv:math/0201175v3, the 2002 'sixth (and final) release'; in that numbering Proposition 5.4.21 (PDF p. 121) is a henselian-approximation density statement ('Let X be a smooth quasi-projective R[t^{-1}]-scheme ... the natural map X(R[t^{-1}]) -> X(R^wedge[t^{-1}]) has dense image'), while the torsor lifting/descent results are in Section 5.8 (e.g. Theorem 5.8.14, PDF p. 148, which resumes the assumptions of 5.4.21). The two editions plausibly renumber. NEXT SOURCE ACTION: consult the published LNM 1800 numbering (or a copy with the 2003 pagination) to identify the exact cited statement, then check that the hypotheses (henselian pair, smooth quasi-projective scheme, (t,I)-adic completion) are actually satisfied by B^+_{Div^d}(S) -> B^+/I_S. Recorded as an unresolved import boundary, not as an input package.

### Sousperfectoid machinery is quoted but unread

Three separate steps rest on sousperfectoid theory that was located but not read: (i) FS II.1.1 cites [HK20] and [SW20, Section 6.3] for descending sheafiness along the split inclusion; (ii) the Stein exhaustion asserts Y_{(R,R^+),I} is affinoid sousperfectoid; (iii) SW20 Theorem 19.5.2 needs Proposition 6.3.3 and KL15 Theorem 8.2.22 (c),(d). Verified present in the library: Scholze-Weinstein Berkeley PDF Definition 6.3.1 and Example 6.3.2 were read (printed p. 47). KedlayaLiu_RelativePadicHodgeFoundations.pdf is present in the library (sha256 a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942) but Theorem 8.2.22 was not read. Hansen-Kedlaya 'Sheafiness criteria for Huber rings' was NOT found in the library (unchecked beyond CATALOGUE.json and the diamonds source files). NEXT SOURCE ACTION: read SW20 Proposition 6.3.3 and KL15 Theorem 8.2.22, and locate Hansen-Kedlaya.

### Ramified Witt vector foundations are assumed, not decomposed

FS state the existence and uniqueness of the pi-adically complete flat O_E-lift and the Teichmueller section in one sentence with no proof and no citation. The stage text explicitly warns that 'A general E is not obtained by renaming p in a formula'. Nothing in the passages read proves the mixed-characteristic comparison with W(-) tensor-hat_{W(F_q)} O_E or the change-of-uniformizer isomorphism. NEXT SOURCE ACTION: read a ramified-Witt-vector source (Hazewinkel, 'Formal groups and applications', Ch. IV; or Drinfeld's pi-typical Witt vectors; or Fargues-Fontaine Courbes Chapter 1, which is in the library as FarguesFontaine_Courbes.pdf, sha256 cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3) and decompose the universal property there.

### Classical points of Y_C and X_C are not covered by any RF stage text

FS II.1.6-II.1.14 and Definition/Proposition II.1.22 (classical points, the bijection with untilts, Proposition II.1.11's Spm(B) = |U|^cl, Corollary II.1.12's principal-ideal-domain property, Lemma II.1.14's inertia-surjectivity point used later in IV.7.3) were read but correspond to no stage text in the RelativeFarguesFontaine roadmap. They are consumed by VectorBundlesAndIsocrystals VB2:classification ('Geometric points') and by DiamondSixOperations/Drinfeld's lemma. They are decomposed in the VectorBundlesAndIsocrystals packet of this job rather than duplicated here. Flagged as a possible scope correction to the RF roadmap text.

### F4 supplies the fixed-field Q_p estimate only; the ramified relative assembly of FS II.1.4 has no supplier

Added by independent review. The proposed edge FarguesFontaineDiamonds:F4 -> RelativeFarguesFontaine:RF2:untilts was checked against F4's atlas description, which fixes Q_p coefficients ('sections of Y_F-diamond -> S with maps S -> Spd Q_p', 'marked untilts of S over Q_p') and a fixed perfectoid field F. The coefficient-independent part of what RF2:untilts needs - the maximum-modulus / Shilov-boundary statement for one-variable period annuli, the perfectoidness of their compatible-root base extension, and the transfer through the split topological-module base extension - is inside F4's stated scope. The ramified and relative part is not: FS II.1.4 (printed p. 50) works over W_{O_E}(R^+) with xi = pi - a[varpi] obtained from pi = varpi^sharp theta(a), normalizes the spectral norm on each completed residue field of Y-curly_S by |[varpi]| = 1/q, and only then reduces the maximum principle to a geometric point. No stage in the atlas is declared to own that ramified relative step; RF2:untilts does it itself, and this packet decomposes it there. NEXT ACTION (orchestrator): either accept the edge as an analytic-estimate-only edge with this limitation recorded, or widen F4's stage text to cover a general nonarchimedean local coefficient field E, or add the ramified estimate as an explicit obligation of RF2:untilts. Also note the atlas currently lists F4's only consumer as RelativeFarguesFontaine:RF3, and RF2:untilts' requires does not contain F4, so integrating this packet adds a new stage edge; a reachability check confirms it introduces no cycle in stageEdges.

### Atlas substage order is the reverse of the source's proof order: RF0 -> RF0:integral-Y and RF2:untilts -> RF2:integral-divisors, while the atlas has both edges the other way

Added by independent review. Both links are source-correct at NODE level. (a) Y-curly_S is defined as Spa W_{O_E}(R^+) minus V([varpi]) (printed p. 47), so the ramified Witt construction precedes the integral period space; but the atlas has RelativeFarguesFontaine:RF0:integral-Y -> RF0. (b) The proof of Proposition VI.1.2 (printed p. 191) says 'Each of the xi_i defines a closed Cartier divisor by Proposition II.1.4', so the single-untilt norm estimate of RF2:untilts precedes the degree-d product construction of RF2:integral-divisors; but the atlas has RF2:integral-divisors -> RF2:untilts. In both cases the SOURCE's order of proof is the reverse of the atlas's substage order. CONSEQUENCE AND DECISION NEEDED. The node-level link graph of all thirteen packets of this job is ACYCLIC (197 nodes, 210 edges, checked). The cycle appears only if node links are lifted to stage edges and unioned with data/atlas.json stageEdges. Nothing was reversed here, because reversing would misstate the source. The orchestrator must choose: (i) treat these as node-level edges only and do not lift them to stage edges at integration; (ii) re-parent the offending node (or split it) so that its stage matches the source's order; or (iii) revise the atlas substage ordering. Option (iii) is the one the source actually supports in each case.

### All four sources reproduce their hashes, and the pinned libraries supply more of this part than of any other in its family

Every one of this roadmap's four sources was downloaded again in this session and every SHA-256 reproduces byte for byte: Geometrization 9ab9efbd..., Berkeley 225505171e..., Bhatt-Morrow-Scholze arXiv:1602.03148 285f7d2088..., Gabber-Ramero arXiv:math/0201175 c4ab39ad5c.... So no locator in this packet rests on a file that has changed. data/library-coverage.json has no reviewed audit entry for this roadmap, so the pinned declaration index was searched directly, and the result is unusually good. Mathlib has WittVector and WittVector.frobenius; WittVector.teichmuller, which is exactly the multiplicative section the ramified-Witt universal property asserts; WittVector.fontaineTheta, whose kernel the primitive degree-one ideals and the divisor equations are about; PreTilt and PreTilt.untilt for the tilting correspondence; IsAdicComplete and AdicCompletion for the pi-adic and I_S-adic completions; IsDiscreteValuationRing, which is what B^+_dR is at a geometric untilt; GradedAlgebra and ProjectiveSpectrum for P and Proj P; AlgebraicGeometry.LocallyRingedSpace, which is the exact level at which the map X_S -> X_S^alg is asserted; Valuation and SpectralSpace. Tau Ceti has Huber.Pair, ValuationSpectrum.spa and InvertibleSheaf. What is absent at both pins is the adic-space and perfectoid layer itself: a search found no declaration whose name contains Perfectoid, and no diamond. Those are exactly the layers this packet requests from AdicSpacesPartII, PerfectoidSpaces and DiamondsAndVStacks, so the boundary is clean.

## Structural proposals

### Two atlas edges inside this roadmap run against the source's proof order (`reorder-links`)

The reviewed decomposition's last gap records it and its link graph confirms it: the links run RF0/ramified-witt-universal-property -> RF0:integral-Y/curly-Y-affinoid-definition and RF2:untilts/closed-cartier-divisor-norm-estimate -> RF2:integral-divisors/product-equation-and-affineness, while the atlas has both the other way. The mathematics is not in doubt. The integral period space is Spa of the ramified Witt ring minus a vanishing locus, so the Witt construction is its input and not its consequence; and the divisor of a leg tuple is cut out by a product of generators of ker(theta_i), each of which is an untilt presented as a closed Cartier divisor by the norm estimate, so the untilt statement is the input. As with the sibling roadmaps VectorBundlesAndIsocrystals and GeometricSatakeAndFusion, where this packet's author found the same pattern, these are edges between substages of a single roadmap, so a wrong direction makes the roadmap look internally circular to a reader following the arrows. A kind:link job should correct both.

### The ramified Witt vector foundations have no owner and are assumed by every layer here (`new-owner`)

The decomposition's fourth gap says the ramified Witt vector foundations are assumed and not decomposed, and this packet's first node states the universal property without a source that proves it. The pinned Mathlib has the UNRAMIFIED theory in full - WittVector, its Frobenius, and WittVector.teichmuller, which is precisely the multiplicative section asserted here - and nothing for the base change W(R) tensor-hat_{W(F_q)} O_E. That base change is not special to this roadmap: it is the coefficient ring of every layer of the Fargues-Fontaine family, it is what makes the equal-characteristic case R[[pi]], and GeometricSatakeAndFusion's integral divisor space and VectorBundlesAndIsocrystals' isocrystals both rest on it. At present it is planned, without a proof source, inside a layer whose subject is the period annuli. PROTOCOL section 15 says a general missing notion should be planned once, as generally as its uses require, in the roadmap that owns it. Either RF0 should own the ramified Witt theory explicitly, as a sub-layer with its own source route - Fargues-Fontaine chapter 1 is the obvious candidate and is in the reference library - or it should be a layer of whichever roadmap owns Witt vectors, and RF0 should import it.

## Planets

At most six per layer; only definitions, constructions and named theorems.

| layer | planets |
| --- | --- |
| `RF0` | Ramified Witt coefficients |
| `RF0:annuli` | The radius function and the annuli |
| `RF0:integral-Y` | The integral period space Y-curly; Perfectoidness after base change, and sheafiness; The diamond of Y-curly is Spd O_E x S |
| `RF1` | The curve as a Frobenius quotient |
| `RF2` | — |
| `RF2:integral-divisors` | The divisor moduli Div^d; The divisor of a leg tuple; Bundles on a divisor form a v-stack; The completed rings B+ and B |
| `RF2:untilts` | An untilt is a closed Cartier divisor; Div^1 = Spd E / phi^Z; B_dR and its filtration |
| `RF3` | The twists O(n) and the slope sign; The graded algebra and X^alg |

## Nothing here is formalised

No Lean was compiled for this job and no statement in this packet is claimed to be formalised. The suggested file
is a set of signatures whose only proof is `sorry`; every `implementationStatus` is `unchecked`.
