# Automorphic bundles — B5: Hecke action and Fourier expansions

**Scope: `AutomorphicBundles:B5`. Completed planning pass; stage planned, with the supplier and proof gaps listed below.**

B5 equips the actual classical automorphic section modules with geometric Hecke operators and Fourier expansions, and proves the comparisons that identify their coefficients and normalizations. The packet preserves the fifteen scalar Fourier–Jacobi and coefficient-devissage nodes, adds the geometric Hecke action and non-neat descent, imports the owned modular Tate/analytic theory, and treats Hilbert and finite-projective vector coefficients. It also includes all three classical BCGP items routed to B5: the finite-dimensional coefficient-bundle comparison and the ordinary and compact-support Siegel Hodge–Tate decompositions. Each target has a precise prerequisite chain. Every implementation status remains unchecked.

The settings have distinct hypotheses:

| Strand | Setting and coefficient scope |
| --- | --- |
| Scalar Fourier–Jacobi | Lan’s good-prime PEL toroidal model, nonnegative determinant-Hodge powers, arbitrary modules over the stated base. |
| Vector Fourier–Jacobi | Lan Higher’s neat PEL model and finite projective Levi representation; general characteristic zero requires the actual mixed-boundary comparison. |
| Hilbert q-expansions | Diamond’s prime-to-p level, possibly ramified p, Noetherian O-algebras and embedding-indexed weights satisfying the unit condition. The general Iwahori principle fails. |
| Classical Siegel comparison | BCGP’s finite-level GSp4 logarithmic coefficient theory in characteristic zero, integral dominant weights with parity and all Tate/degree shifts retained. |

The reviewed B5 audit distinguishes the existing analytic trace, convolution and q-expansion infrastructure from the missing geometric action. This plan builds on those declarations and the exact modular supplier nodes. It does not create a second abstract Hecke algebra or replan modular curves, canonical principal bundles, the full higher Coleman coefficient functor, or logarithmic period theory. The prescribed blueprint granularity is target level; the six inherited coefficient lemmas retain their identifiers and valid work.

## Conventions and objects

Let `R` be the localization of the reflex integers specified by the good-prime PEL setting, or the characteristic-zero field version of that setting. Write `X` for the smooth proper toroidal model associated with compatible admissible smooth fan data, and `omega` for the determinant of the invariant differentials of its universal semi-abelian family. For `k >= 0` and an `R`-module `M`, use B4's actual section module

`AF(k,M) = Gamma(X, omega^k tensor_R M)`.

These are naive parallel weights, not all arithmetic Hilbert weights or arbitrary Levi representations. The determinant line is not the Hodge vector bundle itself. B3 owns canonical/subcanonical extensions; B4 owns their section spaces and analytic comparisons. Where the model is a stack, use its actual quasi-coherent sheaves and sections, not those on an unidentified coarse space.

A cusp label supplies its character lattice, positivity cone, finite cover of a lower-dimensional moduli **stack**, abelian torsor `C`, and character-indexed invertible sheaves `Psi(ell)` on `C`. Keep the actual cusp stabilizer, its degree action and its transport of coefficient sheaves. The cover is not identified with its quotient. The boundary Hodge line is

`L = det_Z(character lattice) tensor omega_A`.

The Raynaud extension and determinant of its invariant-differential sequence identify the relevant pullback of `omega` with `L`, compatibly with descent. In the elliptic comparison the invariant relative differential is `du/u` on the multiplicative fibre; `dq/q` is a differential on the base and is not a substitute.

## 1. Coefficients and local expansion

### Coefficient modules

Node: `B5/fj-coefficient-module`.

For a character degree `ell`, define

`C(ell;k,M) = Gamma(C, Psi(ell) tensor L^k tensor_R M)`.

Coefficient families lie in a **product** over the indicated dual cone. The completed character algebra can have additional support/topological constraints, so this product is neither declared equal to that completed algebra nor declared to consist entirely of expansions of global forms.

Use sections on the actual abelian torsor. The expression on the lower-dimensional base using a pushforward requires a separate projection/base-change theorem; arbitrary tensoring does not automatically commute with that pushforward.

API: `FJCoefficient.map` is functorial in `M`; `FJCoefficient.transport` transports the degree and its coefficient sheaf together; `FJCoefficient.family_ext` is degreewise extensionality with the prescribed transports.

Tests: `FJCoefficient.zeroCoefficients` for `M=0`; `FJCoefficient.tateTrivialization` identifies a coefficient with `M` using supplied Tate trivializations; `FJCoefficient.notFiniteSupport` uses the local function `(1-q)^(-1)`, whose nonnegative coefficients are all one. The last is not claimed to extend to a global modular form.

### Local expansion

Node: `B5/local-fj-expansion`.

Construct the map by restricting a global section to the completion along the chosen nonempty stratum, pulling it to the actual Mumford-family chart, applying the boundary Hodge identification, and extracting graded coefficients. Retain the equivariance inherited from the global section. In particular, no arbitrary linear map to a coefficient product is renamed an expansion.

The completion ideal and topology are part of the chart data. The Hodge identification uses actual étale descent with the required finite-type hypotheses. Descent to invariant sections does not divide by a stabilizer order.

API: `FourierJacobi.local_coeff`, `FourierJacobi.local_add`, `FourierJacobi.local_smul`. Tests: `FourierJacobi.local_zero`; `FourierJacobi.local_tate_monomial` for the local section `q^n(du/u)^k`; and `FourierJacobi.local_coefficient_map` for naturality under an `R`-linear map `M -> N`. Again a local monomial is not assumed to be a global form.

## 2. Cone comparison: distinguish ordinary charts from completions

Node: `B5/cone-compatibility`.

Let `sigma1` be a face of the closure of `sigma2`, both in the positive part of one cusp fan. Nonnegativity of the character pairing gives

`sigma2-dual <= sigma1-dual`.

The **ordinary** smaller-cone chart is an open subchart of the larger-cone chart. This correctly gives the inclusion of their character algebras. It does **not**, by itself, give a map between their completions along their respective, different strata.

### A test that rejects the direct-completion shortcut

Let `k` be a nonzero commutative ring, take the quadrant cone, and take its `x`-ray face. The ordinary charts are

`Spec k[x,y]` and `D(y) = Spec k[x,y,y^-1]`.

Completion of the first at its closed stratum gives `k[[x,y]]`. Completion of the second along its face stratum gives `k[y,y^-1][[x]]`, with the `x`-adic topology. There is **no coordinate-preserving ring homomorphism**

`k[[x,y]] -> k[y,y^-1][[x]]`.

Indeed, `1-y` is a unit in the source: its inverse is the formal series with every nonnegative `y` coefficient equal to one. In the target, take the constant coefficient in `x`, then evaluate the Laurent polynomial at `y=1`. This is a ring homomorphism to `k` sending `1-y` to zero. A unit cannot map to zero in a nonzero ring. The contradiction does not even require continuity.

This example refutes the general toric inference, not the global Fourier–Jacobi support theorem. It does not purport to construct a complete PEL datum. The zero-face/positive-ray example is useful only as an **uncompleted** polynomial-to-Laurent-polynomial degree test; it cannot justify a formal morphism, and the zero cone need not be in the positive part required by the argument.

The existing pinned theorem `PowerSeries.isUnit_iff_constantCoeff` supplies the unit criterion. The suggested file retains three algebraic regression signatures: invertibility of `1-X`, impossibility of sending `X` to one by a ring homomorphism to a nonzero ring, and the same obstruction after composing with a target evaluation. These use actual `PowerSeries` and `RingHom` types. They do not replace the geometric signatures.

### The common-completion construction contract

Use the relative fan embedding and its completion along the union `W` of the positive-cone strata. This is the common formal object defined immediately before Lan's (6.2.5.22), rather than one of the individual stratum completions. On an ordinary chart write `J = I(W)` and `I_sigma` for the ideal of a particular stratum.

The required arrows of **formal spaces** are

`individual stratum completion -> common boundary completion -> X`.

On rings the arrows reverse. Their existence must follow from the actual ideal-containment/continuity data: on the appropriate ordinary chart the image of `J` lies in `I_sigma`. Do not insert an arrow from one individual stratum completion to another.

For locally Noetherian **scheme** charts this construction already has an exact supplier node:
`AdicSpacesPartII:F0/completion-of-morphism`, using EGA I, 10.9.1–10.9.3.
Apply it to the chart morphism with the selected closed stratum mapping into the common closed
boundary. The compatible maps of finite ideal quotients give the continuous map from the
common completion to the stratum completion on rings. This supplies ordinary completion
functoriality once the ideals and chart maps are identified. Homogeneous coefficient extraction,
its compatibility with those maps, the actual Mumford family, and stack descent remain the
separate contracts below. The scheme theorem does not assert them.


The division of work is precise:

- **C0 and F0:** describe `J` as a character-homogeneous ideal on the shared toric chart. Construct the completed coefficient projections through its finite quotients, their separatedness and compatibility with the continuous maps to the individual stratum completions. Do not replace the inverse limit with an unrestricted product.
- **C4 and early C5:** construct the Mumford family on the common completion and its morphism to the toroidal model. Prove that restriction gives the individual chart maps and the same Hodge identification. This is actual family/gluing work, not a consequence of naming a common object.
- **B5:** pull a global Hodge section to that common object, compare its two pullbacks degree by degree, and descend the calculation with the actual coefficient-sheaf transports.

On the `sigma2` ordinary chart the character algebra only has degrees in `sigma2-dual`. The completed coefficient theorem must preserve that support. Applying its two comparison maps therefore yields agreement on the old degrees and zero coefficients in `sigma1-dual minus sigma2-dual`. Thus the `sigma1` expansion is the extension by zero of the `sigma2` expansion. This statement concerns sections in the **common image**, not every element of either completed ring.

There is a useful positive affine test. The `(xy)`-adic completion of `k[x,y]` maps to both `k[[x,y]]` and `k[y,y^-1][[x]]`: `(xy)` maps into `(x,y)` in the first ring and into `(x)` after localization in the second. Compare images of one element of this common completion. Enlarging the common source to all of `k[[x,y]]` reintroduces the counterexample above.

Finally use the admissible fan's incidence chains among positive cones and its support theorem. Arbitrary cones need not be comparable. Intersecting the dual-cone support conditions gives the dual of the fan support. The common-chart construction and completed-coefficient theorem are explicit **open supplier leaves**; correcting indices is not their proof.

### The full cusp-label map

Node: `B5/global-fj-expansion`.

The compatible expansions give `FJ_Phi` on the full dual support cone, valued in the fixed submodule for the **full** cusp stabilizer. Invariance under a single cone stabilizer is insufficient; the full group's transport of Mumford families supplies the additional comparison.

API: `FourierJacobi.coeff`, `FourierJacobi.constantTerm`, `FourierJacobi.coefficient_naturality`. The last now has its own proof node in section 4, because other nodes use it as a dependency. Tests: `FourierJacobi.global_zero`; `FourierJacobi.global_local`, recovering each local expansion by extension by zero; and `FourierJacobi.no_averaging`. For the last, a trivial cyclic order-`p` action on `F_p` has invariant module `F_p`, whereas the group sum annihilates it and division by `p` is unavailable. This is not a proof of the full non-neat Hecke-descent theorem.

## 3. Refinement and constant terms

### Fan refinement

Node: `B5/fj-refinement`.

A compatible refinement pulls back the same semi-abelian family and Hodge line. Comparison with the actual formal restriction maps preserves every coefficient. B3's section-comparison theorem, including torsion coefficients, and a common refinement give a canonical, cocycle-compatible identification independent of the fan. This is not literal equality of compactifications.

Require identity and composition compatibility and test `M=R/p^2`. A coefficient-free degree-zero pushforward theorem does not establish this coefficient-sensitive comparison. For the finitely generated projective part of B3's coefficient reduction, use a direct summand of a finite free module, not a union of free submodules; see E6813 below. The new injectivity dévissage in section 4 is not a replacement for the toric higher-direct-image calculation required by refinement invariance.

### Boundary restriction

Node: `B5/constant-term-restriction`.

For the appropriate positive-cone stratum, positivity places every nonzero degree in the global dual cone in its character-graded ideal. Reduction modulo that ideal leaves degree zero. Then use full cusp-stabilizer invariance and the actual quotient of the finite lower-dimensional cover to descend the resulting section. The quotient and its invariance condition cannot be suppressed.

On a Tate chart this is restriction at `q=0`. At higher-dimensional boundaries the constant term may itself vary on a lower-dimensional moduli object. Its value at one deeper cusp is not a test that the entire boundary section vanishes.

## 4. Expansion principle and coefficient recognition

Fix the actual finite collection `I` of cusp labels. In this section abbreviate

`F(M) = AF(k,M)` and `G(M) = product_(i in I) FJE_Phi_i(k,M)`.

Each factor of `G` is itself a full-stabilizer fixed submodule of a product over character degrees. These abbreviations refer to the geometric constructions above; they are not replacement carriers whose fields assume the expansion principle.

### Naturality of coefficient change

Node: `B5/coefficient-naturality`.

For an `R`-linear map `a:M -> N`, prove

`G(a) composed with FJ_I,M = FJ_I,N composed with F(a)`.

Tensor by `a`, restrict to each completion and use functoriality of the actual Hodge identification and homogeneous coefficient projections. Then descend the calculation through the character-line transports and pass to full stabilizer invariants. The group acts `R`-linearly and the maps intertwine its actions. Only functoriality of completion is used here, not an unjustified exactness theorem for arbitrary coefficient modules.

Check identity and composition and transport under an actual coefficient-module isomorphism. For `R -> R/p`, this is a square of natural maps, not the claim that `AF(k,R) tensor R/p` equals `AF(k,R/p)`.

### Left exactness of the section row

Node: `B5/coefficient-sequence-exact`.

From `0 -> N -> M -> Q -> 0`, construct the exact row

`0 -> F(N) -> F(M) -> F(Q)`.

Early C5 supplies flatness of `X` over `R`, and B3 supplies local freeness of the Hodge line over `O_X`. Together these make the coefficient sheaf flat over `R`; local freeness over `O_X` alone does not. On the flat atlas, tensoring preserves the short exact coefficient sequence. SF.1 descends the exact sheaf sequence, and left exactness of global sections gives the displayed row. No vanishing of `H^1`, surjectivity of `F(M) -> F(Q)`, or arbitrary global-section base-change theorem is used.

The flat affine test is `Z --2--> Z -> Z/2`. The failure test is `X=Spec F_p` over `Z`: the invertible sheaf `O_X` sends the injection `Z --p--> Z` to zero after tensoring. This isolates the required base-flatness hypothesis.

### Left exactness of coefficient families

Node: `B5/fj-target-left-exact`.

For the same coefficient sequence, construct the exact row

`0 -> G(N) -> G(M) -> G(Q)`.

C4/early C5 supply `R`-flatness of each abelian torsor and invertibility of each character-Hodge coefficient sheaf. Use SF.0/SF.1 to obtain the left-exact section row in each degree. Products preserve its injection and kernel description: a family in the kernel has a componentwise lift, unique because the first product map is injective.

For invariant families, translate that lift by a stabilizer element. Equivariance gives the same image, so uniqueness makes the lift invariant. This is left exactness of fixed submodules without averaging, and does not require a finite stabilizer or invertible group order. Finally take the product over `I`.

The distinction from right exactness is essential. Let a generator of `C_p` act on `F_p^2` by `(a,b) -> (a+b,b)`. The sequence with the first-coordinate inclusion and second-coordinate quotient is exact, but its map on invariants to the final `F_p` is zero. A claim that invariant sections preserve the final surjection would fail this test.

### Prime-quotient coefficients

Node: `B5/fj-injectivity-cyclic`.

Let `p` be a prime ideal of `R`, including `p=0`, and put `S=R/p`. Assume that the base-changed chosen strata meet every irreducible component of `X_S`, and that the formal-chart coefficient comparisons are compatible with this base change. Under these explicit hypotheses, prove injectivity on `AF(k,S)`.

Use the **sheaf** identification with `Gamma(X_S,omega_S^k)`. This is not an identification with `AF(k,R) tensor_R S`. A zero coefficient family gives a zero completed Hodge section. At a point of a selected stratum, its germ lies in every power of the local stratum ideal. The ideal is proper and the Hodge stalk is finite over a Noetherian local ring, so the Krull intersection theorem gives a zero germ. The section therefore vanishes on an open neighborhood of the selected strata.

The local algebra is already in pinned Mathlib. The statement
`Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` has exactly the finite-module, Noetherian-local and
proper-ideal hypotheses used for the stalk. `IsHausdorff.of_isLocalRing` packages this separation;
`AdicCompletion.of_injective` makes the canonical map into the actual completion injective.
No completeness assumption on the original module is needed. The unit ideal is excluded:
even the rank-one module over F₂ has zero completion at that ideal, so its completion map is
not injective. The suggested file checks the three direct baseline uses and includes this
negative acceptance signature.

For an ordinary locally Noetherian scheme chart, the already planned node
`AdicSpacesPartII:F0/completion-detects-near-closed`, part (i), supplies the precise passage
from zero coherent formal restriction to vanishing on an open neighborhood (EGA I, 10.8.11).
For a locally closed stratum use the open chart on which it is closed. The actual coefficient
projection must first be identified with that formal restriction. Transport through the flat
atlas and descent of the zero section remain SF.1 obligations; the scheme statement is not
promoted to a stack theorem.

The model in this step is reduced: for `p=0`, it is smooth over the regular Dedekind base, and for nonzero `p` it is smooth over a residue field. Because the zero open meets every irreducible component, it is dense in each one. On a trivializing affine chart, the representing function vanishes at all generic points and is zero by reducedness. For a stack, carry the open zero locus and its density through an actual flat atlas and descend the zero section. Do not assume that every arbitrary affine atlas chart itself meets the selected strata.

The source's total-component hypothesis and this fiberwise condition are different. The following owner proof supplies a precise route at neat level. Its hypotheses must be verified for the actual PEL strata; its statement is not automatically a theorem for a non-neat stack.

### The smooth-closure component-detection interface

**Owner:** SF.1 for the generic algebraic-space result, with SF.0 morphism and regularity facts and SF.2 coherent proper cohomology; early C5 for its PEL stratum instantiation. **Consumer:** `B5/fj-injectivity-cyclic`. No new B5 geometric carrier is introduced.

Let `B=Spec R` for a regular Noetherian ring, and let `X -> B` be a smooth proper algebraic space. Let finitely many `W_a -> X` be closed immersions, with each `W_a -> B` smooth and proper. Let `Z_a` be open in `W_a`, dense in **every geometric fiber** of `W_a -> B`. Assume that the union of the `Z_a` meets every irreducible component of the total space `X`. Then their base changes meet every irreducible component of every geometric fiber of `X -> B`.

Here is the complete generic argument, to be implemented once in the owner.

**Stein factor and components.** Take the factorization `X --h--> E -> B`. The algebraic-space Stein theorem gives `h` proper and surjective with connected geometric fibers; smoothness makes `E -> B` finite étale. These are [Stacks, Theorem 76.36.4 and Lemma 76.36.1](https://stacks.math.columbia.edu/tag/0A18), and [Lemma 76.36.9](https://stacks.math.columbia.edu/tag/0E0D). Smoothness of `X` over regular `B` makes `X` regular; `E` is regular as well. Their connected components are therefore their irreducible components, and are open and closed.

For completeness, `h` identifies the connected-component sets. The inverse image of a connected component of `E` cannot split into two nonempty open-and-closed subsets: their proper images would be closed, disjoint by connectedness of the fibers, and together cover that connected component. Conversely, inverse images of different components of `E` are disjoint and open and closed. Thus the hypothesis on the `Z_a` reaches every component of `E`.

**Clopen images of closures.** Each `W_a -> E` is proper, since it factors through its closed immersion into `X` followed by `h`. It is also smooth. Indeed, the graph `W_a -> W_a ×_B E` is a section of an étale separated morphism, hence an open immersion; the projection `W_a ×_B E -> E` is the base change of the smooth morphism `W_a -> B`. This proves smoothness without assuming that `W_a -> X` is smooth. Therefore the image of `W_a -> E` is both open and closed. The finite union of these images meets every connected component of `E`, by the preceding paragraph and `Z_a ⊂ W_a`, so the union is all of `E`.

**Passage to a geometric fiber.** For a geometric point `b` of `B`, the finite étale fiber `E_b` is a finite discrete set of points. The nonempty fibers `X_e`, for `e` in `E_b`, are connected and regular: they are open-and-closed subspaces of the smooth space `X_b` and are geometrically connected by the property of `h`. Thus they are exactly the irreducible components of `X_b`.

Choose such an `e`. Surjectivity of the union of the `W_a -> E` gives some nonempty `W_a,e`; this remains nonempty after the indicated field extension. It is an open-and-closed subspace of `W_a,b`, because `e` is open and closed in `E_b`. Fiberwise density of `Z_a,b` in `W_a,b` now gives a point in `Z_a,b ∩ W_a,e`. That point lies on `X_e`. This proves detection for every geometric component. It also gives detection for ordinary residue-fiber components by surjective extension to an algebraic closure. No assertion about commuting the formation of the Stein factor with an arbitrary nonflat base change is needed: the argument uses the existing morphism `h` and its geometric fibers.

### Relative-coordinate density and the neat stratum identification

**Owner contracts used.** In [Lan's author revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Theorem 6.4.1.1(2), (3), (5), printed pp. 519-521, supplies the face-ordered stratification, relative normal-crossings boundary, neat no-self-intersection condition and stratum-preserving charts. Proposition 6.3.1.6(1), printed p. 491, identifies chart strata as scheme-theoretic inverse images; Definitions 6.3.2.14 and 6.3.2.16 specify the face equivalence and its chart labels. These are the early-C5 inputs used below, not a theorem inferred from constant component counts. The following is the explicit deduction from those inputs; their actual algebraic-space and chart declarations still have to be supplied by the owner.

**The relative-coordinate lemma.** Let `X -> B` be a smooth Noetherian algebraic space with a finite relative strict-normal-crossings boundary, whose labelled components are `D_i`. Here the relative hypothesis means that, etale locally over `B`, the components passing through a point are distinct *relative* coordinates in a smooth chart. This is stronger than an absolute normal-crossings statement on the total space and stronger than smoothness of each `D_i -> B` separately. A base uniformizer is not one of those relative coordinates.

For a set `J` of components let `D_J` be their scheme-theoretic intersection, using `X` when `J` is empty. Let `W` be a connected component of `D_J`, and put

`W^o = W minus union_(i not in J) (W intersect D_i)`.

Assume `B` regular, and `X -> B` proper when properness of `W` is required. Then `W -> B` is smooth and proper, and `W^o_b` is dense in every geometric fiber `W_b`, including every component of a disconnected fiber. Empty fibers cause no exception.

To prove this, on a relative-coordinate chart the intersection has equations `x_j=0` for `j in J`. It is smooth over the base. For `i not in J`, intersecting also with `D_i` either gives the empty set or adds one further, independent relative coordinate equation. After any geometric base change this cuts a proper divisor in the smooth fiber of `D_J`. In particular it contains no irreducible component of that fiber. A finite union of these divisors still contains no irreducible component: an irreducible component contained in a finite union of closed sets would be contained in one of them. The complement is therefore dense in each component.

This calculation descends from the etale charts. An etale surjection is open, and remains so on a geometric fiber. If the complement of the claimed dense locus contained a nonempty open on the space, its preimage would be a nonempty open on the chart, contradicting the calculation there. The proof does not require the chart itself to meet a globally selected cusp beforehand.

Smoothness of `D_J` over regular `B` makes `D_J` regular. In a Noetherian regular space its connected components are irreducible and open and closed. Thus `W` is smooth, and is closed in the proper space `X`, proving properness. The restriction of the fiberwise-density argument to the open-and-closed `W_b` proves the assertion for `W`. If a component has relative dimension zero, an additional independent relative coordinate cannot occur on it; the claimed complement is empty there, as it must be.

The reference [Stacks 0CBP](https://stacks.math.columbia.edu/tag/0CBP) was checked for the regular-parameter argument under smooth pullback. It is an *absolute* normal-crossings lemma for schemes, not a substitute for the relative-coordinate hypothesis just stated or for algebraic-space descent.

**Why the particular labelled stratum is this open, rather than an arbitrary dense open.** Let `Z_a` be an irreducible component of a selected neat PEL stratum with cone label `sigma`, and put `d=dim(sigma)`. Its reduced closure `W_a` is the component of the appropriate `d`-fold boundary intersection given by the source's stratum/intersection description. Apply the preceding construction to obtain `W_a^o`. Two pieces of the actual chart dictionary must be carried together:

- A smooth toric cone of dimension `e` has `e` boundary coordinate directions; its orbit has exactly those directions zero. Thus the number of boundary branches through a point of its labelled stratum is `e`. The torus-torsor and smooth base factors do not add zero boundary coordinates.
- A stratum in the frontier has a cone containing the original cone as a face, in the equivalence convention of the source. The chart's labelled strata are the inverse images of those toric orbits. This excludes adding an unrelated open condition in the arithmetic base.

These statements are the precise content needed from early C5's stratum-preserving chart construction. A bare isomorphism of completed rings without its ideals and labels does not supply them. In particular, this use of charts introduces no map between the completions along two different strata.

Here is the identification argument. A point of `Z_a` has exactly `d` boundary branches, namely those defining `W_a`, so it lies in `W_a^o`. Conversely, a point of `W_a^o` lies in the closure of the `sigma`-stratum and has exactly `d` boundary branches. Let `tau` be its stratum label. The frontier relation says that `sigma` is a face of `tau`, while the branch count gives `dim(tau)=d=dim(sigma)`. Make this comparison in the common labelled chart of the compatible fan. A face of a polyhedral cone with the same dimension is the whole cone. The orbit-to-label transport then gives the same stratum label for `tau` and `sigma`; equality of dimensions by itself would not identify two unrelated cusp labels. Thus no proper frontier stratum occurs in `W_a^o`.

Finally `W_a^o` is a nonempty open of the irreducible space `W_a`, and hence is connected. The original stratum is smooth over the regular base, so its irreducible components are open and closed. Consequently the connected set `W_a^o`, which meets `Z_a` and lies in that stratum, lies entirely in `Z_a`. Together with the other inclusion this proves

`Z_a = W_a^o`.

The coordinate lemma now gives density of `Z_a,b` in every `W_a,b`. Splitting each chosen stratum into its finitely many components is harmless. The smooth-closure argument above then carries the original total-component detection to every geometric fiber, **at neat level and with the actual chart dictionary**. No transitivity claim about a selected collection on a level cover is used.

This supplies the written identification and fiberwise-density deduction that the preceding checkpoint left abbreviated. It is not a claim that the early-C5 contracts, generic algebraic-space lemmas or their Lean transport have been implemented or validated. Until those exact contracts are integrated, the packet's corresponding supplier request remains open. The all-level expansion principle also retains its separate formal-coefficient and non-neat obligations.

**A collision test for the relative hypothesis.** Over a DVR with uniformizer `pi`, take the two sections `t=0` and `t=pi` of `P1_R`. Each is smooth and proper over `R`, and they are disjoint on the generic fiber. Their intersection on the affine chart is cut out by

`(t, t-pi) = (t, pi)`.

On the first section, removing the second leaves `Spec R[1/pi]`, which is dense in the total section but has empty closed fiber. The two branches coincide after reduction. The pair therefore does not satisfy the relative-coordinate condition: the would-be extra divisor becomes the whole zero-dimensional fiber. This rejects a proof that substitutes individually smooth boundary components, or total density alone, for the required relative normal crossings. It is not a counterexample to Lan's theorem.

**Non-neat boundary.** The full statement still needs a proper branch-normalization or actual stack/level-change construction, its fiberwise coverage and descent. Pullback to a neat cover does not automatically make the inverse images of a chosen detecting collection meet every component of that cover; a toroidal level map need not be etale everywhere. No averaging or division by a stabilizer order is introduced. Those hypotheses cannot be erased because the neat argument has become more explicit.

**Acceptance tests.** For `P1_R` with boundary the zero and infinity sections, either whole section meets the unique component of every geometric fiber. For a DVR `R` with uniformizer `pi`, replacing that section by its open over `R[1/pi]` still meets the total component but misses the closed fiber: its failure is exactly the fiberwise-density premise. The simpler `Spec R[1/pi] ⊂ Spec R` gives the same warning. Neither example is a counterexample to Lan's theorem. On a disjoint union of two proper smooth curves, a choice confined to one component fails the total-component premise. Over a connected finite étale cover with several geometric points in a fiber, the argument must cover all those points through clopen images; it must not treat connectedness of the cover as geometric connectedness.

The factor `E` here is over the **arithmetic base**. It is not the Shimura minimal compactification. Its construction uses proper coherent cohomology and formal functions in the foundations owner, not C5's late Hodge positivity or B5's constant-term theorem.

### Residue coefficients: compare finite thickenings first

**Owners:** SF.0 for quotient/tensor operations, F0 for the inverse systems and completions, C4/early C5 for the actual charts, and SF.1 for descent. **Consumer:** `B5/fj-injectivity-cyclic`.

On an actual affine chart let `A` be its `R`-algebra, `I` the ideal of the stratum after removing the other closure strata as in Lan 6.4.1.1(5), and `P` the finite locally free Hodge module. Put `S=R/p`, `A_S=A tensor_R S`, `P_S=P tensor_R S`, and let `I_S` be the image ideal. For every `n >= 0`, construct the canonical isomorphism

`(P / I^(n+1)P) tensor_R S ≅ P_S / I_S^(n+1)P_S`.

The proof is at finite level. Tensor the right-exact sequence `I^(n+1)P -> P -> P/I^(n+1)P -> 0`. Its new first map need not be injective, but its image is exactly `I_S^(n+1)P_S`: write an element as a sum of products of `n+1` elements from the image of `I`, and conversely lift those factors to `I`. Right exactness therefore identifies the cokernel with the displayed quotient. No flatness of `S` is needed for this cokernel statement. This algebra argument supplies an owner proof route, not a claim that a particular new Lean lemma has been checked.

The isomorphisms must commute with the transition maps in `n`, chart localization, and the Hodge trivialization and coefficient-sheaf transports. Taking the inverse limit **of these identified systems** then compares the completions of the coefficient sheaf on the original model and of its pulled-back sheaf on `X_S`. It does not prove, or assume,

`(lim_n P/I^(n+1)P) tensor_R S ≅ lim_n ((P/I^(n+1)P) tensor_R S)`.

The desired map is defined through the finite-thickening systems, not through that unproved interchange. F0 and early C5 must still check that the actual Mumford chart and its separated degree projections realize this system and that the comparison descends. Lan's completion along a locally closed stratum first removes the other strata in its closure; completing the whole compactification along a different ideal would not be this comparison.

The Tate test has `A=R[q]`, `I=(q)`, `P=A`: modulo `q^(n+1)`, each class `q^j`, `0 <= j <= n`, maps to the same class over `R/p`. Its compatible coefficients recover the usual residue-coefficient expansion. This finite-level test does not certify an arbitrary tensor/inverse-limit theorem.

### Nonsplit coefficient extensions

Node: `B5/fj-injectivity-extension`.

For `0 -> N -> M -> Q -> 0`, injectivity of `FJ_N` and `FJ_Q` implies injectivity of `FJ_M`. Form the two actual `ShortComplex (ModuleCat R)` rows for `F` and `G` and their naturality morphism. Apply the existing pinned theorem

`CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.

Its exact hypotheses are source-row exactness, monicity of both first row maps, and monicity of the two outer vertical maps. The three preceding coefficient nodes supply the rows and squares. The theorem does **not** require the last map of the section row to be onto, nor a splitting of the coefficient extension.

The element argument explains the interface. A section with zero expansion has zero image in `F(Q)`, so it lifts to `F(N)`. The first map of the `G` row is injective, so that lift has zero expansion. Injectivity for `N` then kills the lift. This generic diagram lemma already exists; the work here is its instantiation with the constructed Fourier–Jacobi maps.

Test the nonsplit sequence `0 -> Z/2 -> Z/4 -> Z/2 -> 0`, as well as `N=0` and `Q=0`. The suggested file includes a `ModuleCat` application of the existing lemma and finite algebra regression signatures, not a completed geometric instantiation.

### Finite coefficients by a prime filtration

Node: `B5/fj-injectivity-finite`.

For a finite module over a commutative Noetherian ring, the pinned Mathlib theorem

`IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`

already supplies a finite filtration

`0 = M_0 <= M_1 <= ... <= M_r = M`, with `M_j/M_(j-1)` isomorphic to `R/p_j`.

This is the theorem annotated with Stacks 00L0 in `Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean` at commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its `RelSeries` has actual submodule vertices; each step gives containment and a prime together with a nonempty R-linear equivalence from the quotient inside the upper submodule to R/p. No localness, completeness, freeness or finite-length hypothesis is present. Repeated primes are allowed, and the prime need not be maximal. Use the existing relation, quotient maps and equivalences rather than defining another filtration.

For the proof use the companion declaration

`IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.

Apply it to the property that the **constructed** joint expansion on `AF(k,M)` is injective. The three cases are as follows.

**Subsingleton coefficients.** Tensoring the actual Hodge coefficient sheaf with a zero module gives a zero sheaf and hence a zero section module. Its expansion map is injective. The subsingleton-module formulation is the same case through the zero-module identification.

**A module linearly equivalent to R/p.** Use the geometric prime-quotient theorem above for R/p, including its component-detection and completed-chart hypotheses. For an R-linear equivalence `e:N -> R/p`, functoriality sends e and its inverse to inverse maps on the actual F and G coefficient functors. Naturality transports injectivity to N. The library's case is deliberately stated using this equivalence, rather than forcing R/p into the fixed module universe. No arbitrary global-section tensor/base-change isomorphism is inferred.

**An exact coefficient extension.** The induction supplies finite modules, linear maps f and g, injectivity of f, surjectivity of g and `Function.Exact f g`. Apply `B5/fj-injectivity-extension` with the two outer induction hypotheses. The surjectivity premise is for the original coefficient quotient g, **not** for the induced map on Hodge sections. The preceding left-exactness and naturality lemmas provide the geometric diagram. No splitting, finite free decomposition or averaging is used.

The induction proves finite-coefficient injectivity. Over a Dedekind domain a nonzero prime is maximal and invokes the residue-field model; the prime zero invokes R itself. No PID or semilocal hypothesis enters. The generic algebra is a direct baseline import, so it needs no R03.3 supplier request or completion of deformation/patching theory. The geometric prime and extension cases are still genuine B5 obligations.

The filtration `0 < 2(Z/4) < Z/4` has two `Z/2` factors. The coefficient sequence is nonsplit: a homomorphism from Z/2 to Z/4 sends one to zero or two, so cannot section the reduction to Z/2. The induction therefore handles nilpotent torsion such as `R/p^n` without a separate completion-faithfulness theorem on each nonreduced thickening. It also covers a finite nonfree projective ideal without calling it free. Finally Z as a module over itself has a one-step filtration with prime zero, although it is not a finite-length module; a replacement by maximal-ideal composition factors would be incorrect.

### Arbitrary coefficients and the source theorem

Node: `B5/fj-injectivity`.

The target remains the source theorem: the selected nonempty strata meet every irreducible component of the toroidal model, and their joint expansion on `AF(k,M)` is injective for arbitrary `M`. First discharge early C5's residue-component obligation and obtain the finite-coefficient theorem. The smooth-closure proof specifies a neat-level route; its actual PEL instantiation, the non-neat transport and formal-chart descent are not silently removed from the obligations.

Write `M` as the directed union of its finitely generated submodules `N`. Tensoring the fixed Hodge sheaf commutes with this colimit. On the actual qcqs algebraic stack, use Stacks 0GQZ with the finitely presented sheaf `G=O_X` to commute sections with it. Therefore a given section `f` comes from some `f_N`.

If the expansion of `f` vanishes, naturality gives

`G(N -> M)(FJ_N(f_N)) = 0`.

The map `G(N) -> G(M)` is injective by the coefficient-family left-exactness theorem. Hence `FJ_N(f_N)=0`, finite-coefficient injectivity gives `f_N=0`, and consequently `f=0`.

There is no need for `colim_N G(N) = G(M)`. That tempting interchange can fail: if `M` is the direct sum of countably many copies of a field, the sequence of its distinct basis vectors belongs to the countable product of `M`, but to the product of no single finite-dimensional submodule. The proof needs only that the section lifts from finite coefficients and that the coefficient-family inclusion is injective.

In particular, the method applies to `R[1/p]/R` by its finite torsion submodules. A field-only or torsion-free-only expansion theorem would not supply this case.

### Recognition of a coefficient submodule

Node: `B5/coefficient-recognition`.

For `M1 <= M`, membership of every selected expansion in the image of the actual `M1` coefficient-family module must imply membership of the global section in the image of `AF(k,M1)`.

Apply the naturality square to `0 -> M1 -> M -> M/M1 -> 0`. The two left-exactness nodes supply its rows. The image of the section in `AF(k,M/M1)` has zero expansion, so use joint injectivity **for that quotient module**, then exactness at `AF(k,M)`. The linear-map prototype covers only this final algebraic step; it is not a proof that the geometric rows have been constructed.

Test `M1=M`, `M1=0`, and `M=R[1/p]` with `M1=R`. The last quotient is torsion and may be infinitely generated. No unconditional global-section base-change isomorphism or surjectivity of the final section map is asserted.

## 5. Cuspidality

Node: `B5/cuspidal-boundary-criterion`.

For a neat smooth toroidal model with reduced relative normal-crossings boundary `D`, use B3's subcanonical coefficient `omega^k(-D)`. Prove exactness of the boundary sequence with the chosen module `M`; its global-section kernel identifies the image of subcanonical sections. Then use all required boundary charts and constant-term restrictions to detect vanishing on `D`.

Checking geometric points is not sufficient over nonreduced coefficients. Nor can one scalar constant at one maximal cusp replace all the required boundary restrictions. The rank-one test is divisibility by `q`; the higher-dimensional test allows a nonzero boundary form whose deeper scalar constant vanishes. Koecher extension does not force cuspidality. The new left-exactness lemma in section 4 concerns change of `M`; it does not by itself prove exactness of this separate boundary sequence after tensoring.

## 6. Geometric Hecke action

### Geometric Hecke operators on classical sections

Node: `B5/hecke-section-operator`.

For the B1–B4 automorphic bundle E(V) on a fixed toroidal model X_K over R, take an admissible prime-to-characteristic element g with K_g=K∩gKg⁻¹ and the correspondence X_K ←p1 X_Kg →p2 X_K. After compatible cone refinement, the B2/B3 equivariant realization supplies θ_g:p2*E(V)→p1*E(V). For every R-module M define H_g=tr_p1 ∘ θ_g ∘ p2* on Γ(X_K,E(V)⊗_R M). Here the trace is the extension of the finite locally free trace through the supplied toric-refinement comparison, not a trace inferred for an arbitrary proper map. Fix a K-bi-invariant multiplicative character ν of the admissible monoid with values in R×, and set T_g=ν(g)H_g. The construction is independent of common refinement and representatives and preserves the subcanonical section module when the boundary ideal transport is supplied.

Use actual bundle sections, including coefficients inside the sheaf; Γ(E)⊗M is not substituted. p1 is finite locally free on a compatible intermediate model; a further fan refinement can be proper rather than finite. Its coefficient-sensitive pushforward comparison is required. θ_g uses the right-translation and isogeny convention; ν is part of the level/weight normalization, not division by every correspondence degree.

The proof route is precise:

1. Import the correspondence and degree convention from AA.4 and its actual compactified extension from C3.
2. Pull back the canonical bundle and M; use B2/B3 equivariance to identify it with the p1-pullback, retaining its cocycle.
3. On finite-free charts use algebra trace and the projection formula; descend the finite-projective trace from SF.0 and remove refinements using B3/C3. These trace/base-change inputs remain explicit requests.
4. Compose and multiply by ν(g); the boundary ideal comparison proves the same construction for cusp sections.

The API serves the following uses:

- `AutomorphicBundles:B5/hecke-convolution`: Produces the basis operators of the existing integral Hecke ring.
- `OverconvergentAutomorphicForms:O6`: Provides the normalization and cusp-preserving classical operator used to compare the p-adic action.

| Proposed declaration | Interface |
| --- | --- |
| `ClassicalHecke.operator` | The R-linear composite ν(g)tr_p1 θ_g p2* on the actual section module. |
| `ClassicalHecke.operator_one` | The identity correspondence with ν(1)=1 acts as identity. |
| `ClassicalHecke.coefficient_map` | An R-linear coefficient map M→N commutes with T_g, by coefficient-compatible pullback, trace and θ_g. |
| `ClassicalHecke.refinement` | Transport across the B3 section comparison along a common fan refinement intertwines T_g, with identity and composition laws. |

The discriminating tests are:

- `ClassicalHecke.identity` (degenerate): The identity correspondence acts as identity on canonical and subcanonical sections.
- `ClassicalHecke.weightZeroTrace` (computation): For a finite-free degree-d chart and the trivial bundle, the raw operator on 1 is d, not 1; the normalized value is ν(g)d.
- `ClassicalHecke.modularNormalization` (compatibility): Over C, after the imported modular comparison and correct coset orientation, GL2 det⁻¹-scaled isogeny pull-identify-trace agrees with the existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients have the character-weighted ℓ^(k−1) term.

Acceptance checks:

- H_1 is identity and H_g sends the weight-zero constant 1 to deg(p1); T_g(1)=ν(g)deg(p1).
- For GL2 geometric isogeny pullback on ω^k, ν(g)=det(g)⁻¹ changes det(g)^k j(g,z)⁻k to the analytic det(g)^(k−1) factor. The chosen double-coset orientation must first be compared to the supplier, which may use inverse representatives.
- For a degree-ℓ good modular correspondence and ν=ℓ⁻¹, the weight-zero value is (ℓ+1)/ℓ. ℓ must be a unit; no extension of this formula to ℓ=p is inferred.

Direct prerequisites: `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `ShimuraCompactifications:C3`, `SchemeAndStackFoundations:SF.0`, `mathlib:Algebra.trace_algebraMap_of_basis`.

Source passages: LAN-2021, 6.4.3.1–6.4.3.4, pp.527–530; DIAMOND-2022, §6.1, weight/level pullback convention, p.24; BCGP-2025, §1.8, pp.17–18. Supplies toroidal translation after refinement, not the missing global coefficient trace. Fixes the norm-scaled pullback convention in the Hilbert specialization; finite correspondence trace is a derived extension requiring the listed suppliers. The isogeny correspondence convention is transposed relative to Faltings–Chai; comparison must transport it explicitly.

### Convolution law for the geometric Hecke action

Node: `B5/hecke-convolution`.

With the correspondences, trace/base-change comparisons, θ cocycle and multiplicative normalization of hecke-section-operator, the assignment [KgK]↦T_g extends to a unital ring homomorphism from the existing integral Hecke ring to End_R Γ(X_K,E(V)⊗_R M), and restricts to the subcanonical section module. The multiplication convention is the existing HeckeCosetModule convolution, after an explicit right-coset/inverse-orientation comparison; its integer multiplicities are unchanged.

Require the full double-coset fibre-product/Mackey decomposition, not a false Cartesian square for an arbitrary normal finer level. Coefficient traces satisfy composition and finite-flat base change; normalization ν is multiplicative and bi-K-invariant.

The proof route is precise:

1. Import the actual double-coset correspondence calculus from AA.4, rather than constructing another Hecke algebra.
2. Decompose the composed correspondence into the finite double-coset pieces with their multiplicities; apply trace transitivity and base change to each.
3. Use the θ cocycle and multiplicativity of ν to identify the composite with the convolution sum. Compare inverses and order with the pinned analytic action.

Acceptance checks:

- The identity coset maps to identity and a sum maps to the sum of operators.
- In the good GL2 prime case the transported formula recovers the existing analytic convolution action, including its character term.
- A normalization chosen by dividing each coset by its degree need not be a multiplicative character; the construction does not silently permit it.

Direct prerequisites: `AutomorphicBundles:B5/hecke-section-operator`, `AdelicAlgebraicGroups:AA.4/hecke-cartesian`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `tauceti:HeckeRing.GL2.heckeRingHomCharSpace`, `SchemeAndStackFoundations:SF.0`.

Source passages: BCGP-2025, §1.8, Hecke conventions, pp.17–18; DIAMOND-2022, §6.1, p.24. Geometric action follows correspondence composition after the stated convention comparison. A source specialization of the normalized action; the general geometric convolution proof is a derived target with explicit Mackey/trace requests.

### Hecke action at non-neat level

Node: `B5/non-neat-hecke-descent`.

Let K′◁K be neat and normal with finite Γ=K/K′, and use the actual equivariant canonical or subcanonical bundle on the stack quotient [X_K′/Γ]. Descent identifies its section module with Γ(X_K′,E⊗_R M)^Γ for every allowed R-module M. Define the K-Hecke operators through the refined K_g correspondences and their common neat covers. The resulting operators preserve this descent equalizer, are independent of the chosen neat cover, and agree under the descent identification with the stack pull-identify-trace action.

The quotient means the stack with its bundle action; no coarse-space vector bundle descent is assumed. No inversion of |Γ| is required for the equalizer. Hecke compatibility uses the refined correspondence and Mackey sum, not restriction of a single K′-double-coset operator.

The proof route is precise:

1. Use SF.1 effective equivariant descent for the actual sheaves and sections.
2. Construct common neat covers of both correspondence legs with C3; compare operators using trace base change and the double-coset decomposition.
3. Prove the equalizer is stable and changes of neat cover commute; uniqueness of descent gives independence.

Acceptance checks:

- For the trivial action of C_p on F_p, invariants are F_p, while the group sum is zero.
- For the unipotent C_p action on F_p², taking invariants does not preserve the surjection to the second-coordinate quotient. The proof uses only the equalizer, not exactness of invariants.
- Do not assume K′∩K_g=K′∩gK′g⁻¹; AA.4’s Cartesian theorem requires its additional product condition.

Direct prerequisites: `AutomorphicBundles:B5/hecke-section-operator`, `AutomorphicBundles:B5/hecke-convolution`, `AdelicAlgebraicGroups:AA.4/hecke-cartesian`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C3`.

Source passages: DIAMOND-2022, §6.1, non-small U and normal fine U′, p.24; LAN-2021, 7.1.2.6–7.1.2.8, pp.536–537. Descent uses invariants without averaging; the general Hecke comparison is the corresponding stack argument. Retains the full stabilizer in Fourier coefficients and compatibility with non-neat descent.

## 7. Modular and Hilbert comparisons

### Tate and analytic q-expansion comparison

Node: `B5/modular-expansion-comparison`.

Under B3/B4’s modular specialization and the R15.1 all-weight analytic comparison, the rank-one Fourier–Jacobi expansion is the imported Tate q-expansion, and over C it equals UpperHalfPlane.qExpansion h at the same cusp parameter q=exp(2πiτ/h) and invariant-differential trivialization. At full level n≥3 use Tate(q^n) over Z[1/n,ζ_n][[q]] as in the owner: the Kodaira–Spencer image of the square of the canonical differential is n dq/q. Import the R15.2 all-component integral q-expansion principle and cusp exact sequence rather than asserting new modular theorems. Transport Hecke normalization to the existing analytic action and the owned geometric R15.2 operators.

Match the selected cusp, width h>0 in the actual subgroup strict periods, roots of unity and descent data. Levels 1 and 2 use the owner’s stack/rigidifying-cover descent. One infinity constant detects cuspidality only in the full modular group case already proved in Mathlib.

The proof route is precise:

1. Identify the rank-one toric coefficient sheaf and Hodge trivialization with the exact R15.1 Tate interface.
2. Apply the owner’s analytification comparison; Taylor uniqueness with the same q-parameter identifies the formal and analytic coefficients.
3. Compare isogeny/differential pullback and the ν scalar with R15.2’s geometric operators and the pinned analytic ring action.

Acceptance checks:

- Retain n dq/q at Tate(q^n); replacing du/u with a base differential loses the convention.
- The local monomial q^r(du/u)^k has coefficient 1 in degree r and 0 elsewhere; this is a local chart test, not a global existence claim.
- Import the modular principle for one cusp per component and all-cusp cuspidality; analytic injection alone supplies neither statement over torsion coefficients.

Direct prerequisites: `AutomorphicBundles:B5/local-fj-expansion`, `AutomorphicBundles:B5/hecke-section-operator`, `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance`, `mathlib:UpperHalfPlane.qExpansion`, `mathlib:ModularForm.qExpansion_injective`, `mathlib:ModularForm.isCuspForm_iff_coeffZero_eq_zero`, `tauceti:HeckeRing.GL2.heckeRingHomCharSpace`.

Source passages: LAN-2021, 7.1.2.1–7.1.2.4, pp.534–535; LAN-INTRO, §4.2.7, pp.49–50. Rank-one specialization is compared to the exact imported Tate/analytic interfaces; it does not rebuild them. Explains the section interpretation whose specialized comparison is owned by R15.1.

### Hilbert cusp q-expansions and coefficient lines

Node: `B5/hilbert-cusp-expansion`.

Use Diamond’s Hilbert setting: F≠Q totally real, a rational prime p possibly ramified in F, a sufficiently large p-adic field with valuation ring O and embeddings Θ, and U=U^p GL2(O_F,p). Let R be a Noetherian O-algebra and (k,m)∈Z^Θ×Z^Θ with χ_(k+2m),R trivial on O_F×∩U. For the imported automorphic line A_(k,m), M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). At a cusp c represented by 0→I→H→J→0, polarization λ and level η, set Λ=d_F⁻¹I⁻¹J. Choose a prime-to-p full level N≥3 contained in U, ζ_N∈O, and a splitting H≅J⊕I. Let D_(k,m),c=⊗_θ (I⁻¹)_θ^⊗kθ ⊗ (d_F(IJ)⁻¹)_θ^⊗mθ. Define q_c by formal restriction into the series with coefficient line D_c⊗_O R and indices N⁻¹Λ_+∪{0}, using the actual unit action and completion. Changes of splitting, cusp representative and fine level use the canonical transports of these data; the expansion at general U is independent of a chosen cusp above c. The minimal pushforward j_*A is not assumed locally free.

All the weight, level and trivial-unit-character conditions are part of the definition; p=2 and ramified p are not discarded. The ramified Pappas–Rapoport splitting model and its automorphic line are imported from H2/B2/B3 and the Hilbert cusp geometry from C6. The series includes zero and totally positive degrees in the stated fractional lattice; the coefficient line and unit action cannot be replaced by a naked scalar monoid algebra.

The proof route is precise:

1. Import the cusp lattice, compactifications and completed chart from C6, including the ramified splitting-model comparison from H2.
2. Identify the boundary automorphic line with the stated D_c using B2/B3’s embedding-indexed weight realization.
3. Restrict j_*A to the completion and use the source’s inclusion into formal q-series. Prove its transport laws using the actual cusp unit action.
4. At general prime-to-p level pull to fine U(N); the fine-cusp independence is descended by invariants, without averaging.

The API serves the following uses:

- `AutomorphicBundles:B5/hilbert-expansion-principle`: Supplies the all-component expansion map and coefficient recognition target.
- `AutomorphicBundles:B5/hecke-expansion-compatibility`: Supplies the normalized Hilbert coefficients used by the prime-to-p Hecke formula.
- `OverconvergentAutomorphicForms:O6`: Fixes the cusp lattice, coefficient line and p-adic/classical comparison conventions.

| Proposed declaration | Interface |
| --- | --- |
| `HilbertQExpansion.map` | The R-linear formal restriction q_c into the coefficient-line series in the specified fractional positive lattice. |
| `HilbertQExpansion.coeff` | Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including zero. |
| `HilbertQExpansion.transport` | The canonical lattice/line isomorphism for a cusp representative or splitting change intertwines the transformed series; transports compose. |
| `HilbertQExpansion.coefficient_map` | A Noetherian O-algebra map R→R′ commutes with each coefficient after base change of the actual form. |
| `HilbertQExpansion.fineLevel` | Restriction to a fine U(N) and any cusp above c gives the same expansion after the canonical line/lattice identifications. |

The discriminating tests are:

- `HilbertQExpansion.zero` (degenerate): The zero form has zero coefficient in every degree; over the zero coefficient ring all forms and coefficients vanish.
- `HilbertQExpansion.localMonomial` (computation): On a chosen formal cusp chart and coefficient-line trivialization, q^t d has coefficient d at t and zero elsewhere; no global form or unit invariance of this local monomial is asserted.
- `HilbertQExpansion.unitTransport` (non-example): A family supported at a positive t moved to a different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its full transported orbit satisfies the unit relation. It cannot be declared the expansion of a descended form.

Acceptance checks:

- The full weight vector and D_c survive; χ_(k+2m)=1 is not replaced by parallel k alone.
- The source permits ramified p but does not give an all-component principle for general U0(P).
- F=Q comparison is imported through the modular specialization; Diamond’s source itself assumes F≠Q.

Direct prerequisites: `AutomorphicBundles:B5/vector-fj-expansion`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraCompactifications:C6`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`.

Source passages: DIAMOND-2022, §6.1 and §6.2, pp.24–25. Defines q_c, its coefficient line, splitting, full-level denominator and independence at general level.

### Hilbert q-expansion principle

Node: `B5/hilbert-expansion-principle`.

In hilbert-cusp-expansion’s prime-to-p-level setup, let S be a collection of cusps meeting every connected component of Ymin, equivalently with surjective determinant map S→F_+×\A_F,f×/det(U). Then q_S is injective. If R′⊂R is a Noetherian O-subalgebra and every coefficient lies in D_c⊗_O R′ at all c∈S, then the form comes from M_(k,m)(U;R′). This is Diamond Proposition 6.2.1; its geometric supplier must verify the component-to-fibre-detection comparison used by the vector principle. No analogous assertion is made for general Iwahori special fibres Y0(P)min_R, whose irreducible components need not contain cusps.

Retain the weight/unit condition over both rings and the exact prime-to-p level U. The determinant surjectivity is the source’s component condition, not merely the choice of one representative in a polarization class. Before importing the vector proof at torsion R, C6 must supply the actual fibrewise detection argument; it remains an explicit input rather than an inferred smoothness claim for every ramified integral model.

The proof route is precise:

1. Use the source’s fine-level formal chart and component argument; request the precise ramified/fibrewise geometric detection interface from C6 and H2.
2. At neat fine level specialize the vector detection and quotient-recognition argument with D_c’s O-flat coefficient line.
3. At general U pass to a normal fine cover and its equalizer; no division by the finite level group order is needed.

Acceptance checks:

- A set of infinity cusps covering the determinant classes gives an injective map.
- Coefficients in R′=O inside its fraction field detect the corresponding integral form in the stated setup.
- For U0(P) the source explicitly warns that components may contain no cusp, so the same criterion is not available.

Direct prerequisites: `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/vector-expansion-principle`, `AutomorphicBundles:B5/coefficient-recognition`, `ShimuraCompactifications:C6`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.1`.

Source passages: DIAMOND-2022, Proposition 6.2.1 and following Iwahori warning, p.25. States both injectivity and coefficient-subalgebra recognition with the determinant/component condition, and excludes the general Iwahori analogue.

### Hilbert cusp forms and all cusp constants

Node: `B5/hilbert-cuspidal-boundary`.

In the Hilbert prime-to-p setting, let e_c be the constant coefficient of q_c with values in D_c⊗_O R. The source’s cusp space is ker(∏_c e_c), using all cusps. Under B3’s canonical/subcanonical boundary comparison and exact relative boundary tensor sequence, this is the image of Γ(Ytor,A_(k,m)(−D)⊗_O R) in the canonical sections. Each e_c is independent of splitting and lands in the actual cusp-unit invariants. In the characteristic-zero/flat O setting of §6.3, if the pair of weight vectors is not parallel, meaning (kθ,mθ) is not independent of θ, these invariant constants vanish and every such form is cuspidal; the conclusion is not inferred for arbitrary torsion R.

Use every required boundary component and its unit/line action. One infinity coefficient at arbitrary level is insufficient. B3/C6 supply the precise Hilbert boundary ideal and tensor exactness, including the ramified model; Koecher extension does not replace the cusp ideal.

The proof route is precise:

1. Extract degree zero using the actual completed restriction; the unit action makes the constant independent of the splitting.
2. Import the boundary ideal comparison and apply the relative boundary sequence, using exactness for the chosen coefficients rather than right exactness of global sections.
3. Use the character ideal calculation in Diamond §6.3 for the flat/characteristic-zero parallelness criterion; keep torsion invariant constants separate.

Acceptance checks:

- At all cusps a local q^t d with t strictly positive has zero constant; a local constant d has its actual D_c value.
- The source’s nonparallel flat-coefficient case makes the cusp and full section spaces equal; torsion coefficients require rechecking the character ideal.
- No automatic cusp assertion follows merely because the Hilbert minimal boundary has codimension greater than one.

Direct prerequisites: `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/constant-term-restriction`, `AutomorphicBundles:B5/cuspidal-boundary-criterion`, `AutomorphicBundles:B3`, `ShimuraCompactifications:C6`.

Source passages: DIAMOND-2022, §6.3, p.26. Defines cusp forms by all constant terms, their unit-invariant values and the flat-coefficient parallelness condition.

## 8. Vector coefficients and Hecke expansions

### Fourier–Jacobi expansion with vector coefficients

Node: `B5/vector-fj-expansion`.

In Lan’s neat good-prime PEL setup, let R be a Noetherian coefficient algebra over the allowed reflex/representation base and W a finite projective R-representation of the actual Levi group. Import Ecan(W) from B2/B3. For each cusp chart the Raynaud/parabolic identification supplies a locally free bundle E0(W) on its abelian torsor C whose pullback is Ecan(W) on the completed Mumford family. For every R-module M define degree-ell coefficients as Γ(C,Ψ(ell)⊗E0(W)⊗_R M), and define the expansion by actual formal restriction, the bundle identification and graded extraction. Impose the completed support condition and full-stabilizer transports before passing to invariants. For general characteristic-zero Shimura data use this construction only after C3.general supplies the actual mixed-boundary formal isomorphism and coefficient-bundle comparison; Milne VII.4.1 is a conjectural description in the inspected notes, not that supplier’s proof.

The PEL bundle W is finite projective and the fan smooth/projective as in Lan Higher §2; arbitrary infinite-dimensional or p-adic analytic representations are not included. The degree-zero coefficient module is Γ(C,Ψ(ell)⊗E0⊗M). Definition 5.10 also treats higher cohomology, which is not replaced here by a degree-zero product. E0’s filtration is on C. Its graded pieces descend locally over the lower base, but the whole filtration need not descend through the stabilizer quotient.

The proof route is precise:

1. Import the actual canonical bundle and parabolic reduction; Proposition 5.6 identifies its formal pullback with E0 on C. This representation realization is B2/B3’s work.
2. Use the completed graded algebra of Corollary 5.9 to extract coefficients on the actual torsor and retain its support topology.
3. Repeat the common-completion comparison and full-stabilizer descent with E0 in place of the determinant power; character sheaf transports include the coefficient-bundle action.
4. For general characteristic zero request the mixed-boundary comparison from C3.general. Its absence is a recorded gap rather than an unconditional theorem extracted from Milne’s conjecture.

The API serves the following uses:

- `AutomorphicBundles:B5/vector-expansion-principle`: Supplies the formal restriction whose coefficients detect vector-valued sections.
- `OverconvergentAutomorphicForms:O6`: Provides the finite-dimensional coefficient reference for p-adic q/FJ normalization.
- `BCGP-2025 §4.6.1`: Keeps classical finite-dimensional bundles distinct from the higher Coleman coefficient functor.

| Proposed declaration | Interface |
| --- | --- |
| `VectorFourierJacobi.coefficient` | Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M from the completed boundary restriction. |
| `VectorFourierJacobi.coefficient_map` | An equivariant R-linear representation map W→W′ and a coefficient map M→M′ induce commuting degreewise maps, respecting identities and composition. |
| `VectorFourierJacobi.transport` | A cusp transport moves the lattice degree, Ψ and E0 together and intertwines extraction. |
| `VectorFourierJacobi.determinant` | The determinant-Hodge representation specializes to the scalar FJ map, under B3’s supplied boundary bundle isomorphism. |
| `VectorFourierJacobi.refinement` | The canonical section comparison for a common fan refinement intertwines vector expansions and has its cocycle law. |

The discriminating tests are:

- `VectorFourierJacobi.zeroRepresentation` (degenerate): For W=0 or M=0 every coefficient and expansion is zero.
- `VectorFourierJacobi.rankTwoMonomial` (computation): On a trivial rank-two local coefficient bundle and rank-one chart, q^n(v1,v2) has vector coefficient (v1,v2) at n and zero at other degrees.
- `VectorFourierJacobi.scalarSpecialization` (compatibility): For the determinant-Hodge representation giving ω^k the expansion equals the scalar map after the actual boundary-line identification.

Acceptance checks:

- For the determinant representation giving ω^k, this agrees with the scalar FJ construction including det_Z(X)⊗ω_A.
- On a trivialized rank-two local coefficient bundle, a monomial q^n(v1,v2) has precisely the vector (v1,v2) in degree n; one scalar coefficient loses data.
- Do not descend E0’s filtration to the stabilizer quotient merely because its graded pieces descend locally.

Direct prerequisites: `AutomorphicBundles:B5/fj-coefficient-module`, `AutomorphicBundles:B5/local-fj-expansion`, `AutomorphicBundles:B5/cone-compatibility`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B3.general`, `AutomorphicBundles:B4`, `ShimuraCompactifications:C3.general`, `ShimuraCompactifications:C4`.

Source passages: LAN-HIGHER, Proposition 5.6 and Remark 5.7, pp.177–179; LAN-HIGHER, Corollary 5.9 and Definition 5.10, pp.179–180; MILNE-2018, VII.4, Conjecture 4.1, p.102. Identifies the boundary coefficient bundle; the remark distinguishes the characteristic-zero general construction. Degree-zero specialization gives sections with E0, retaining the completed chart rather than asserting all products are global expansions. The general formal isomorphism is a conjecture in these notes. The node explicitly requires a proven owner interface, with the Siegel case identified separately.

### Expansion principle for locally free automorphic coefficients

Node: `B5/vector-expansion-principle`.

Let R be Noetherian, X a qcqs toroidal model smooth over R in the supplied PEL or characteristic-zero setup, Ecan a finite-rank locally free canonical automorphic bundle, and C_i its R-flat abelian-torsor charts with locally free E0,i. Require the actual formal restriction/graded coefficient identification, descent, and a finite collection of strata whose restrictions meet every irreducible component of X_(R/p) for every prime p⊂R. Then the joint vector Fourier–Jacobi map Γ(X,Ecan⊗_R M)→∏_i FJE_i(Ecan,M) is injective for every R-module M. For M1⊂M, membership of every expansion in the image from M1 is equivalent to membership of the global section in Γ(X,Ecan⊗M1). Boundary-zero coefficients at all required boundary strata characterize the image of Esub=Ecan(−D), when its relative boundary tensor sequence is exact.

The component condition is fibrewise after every prime reduction, including the zero prime when present; total-model density alone is not used as this hypothesis. Use the sheaf colimit theorem on qcqs stacks via SF.1, or schemes at neat level. Products of coefficient modules are not asserted to commute with filtered colimits. This is a derived vector-bundle extension of Lan’s scalar argument, with the formal identification from Higher Koecher’s principle; it is not claimed as a verbatim statement of either paper.

The proof route is precise:

1. For R/p the bundle is coherent on the actual reduced model. Zero graded coefficients give zero formal restrictions; apply finite-stalk Krull separation and F0’s coherent-section detection on an atlas. The specified fibrewise component hypothesis gives global zero.
2. R-flatness of X and C_i plus local freeness give the two left-exact coefficient rows; products and invariants preserve left exactness by unique lifts.
3. Use the existing Mathlib prime-filtration induction and short-complex monicity theorem for finite M. Lift an arbitrary section from a finite coefficient submodule using qcqs section/colimit compatibility, without interchanging colimits with products.
4. For recognition apply injection to M/M1 and the two exact rows. For cusp sections use the separately exact boundary sequence and the degree-zero restriction theorem.

Acceptance checks:

- W=det^k recovers the scalar principle with the same component and coefficient hypotheses.
- A rank-two direct sum is detected component by component; the theorem does not collapse coefficients to a scalar.
- The nonsplit Z/4 extension is included. The Iwahori Hilbert special fibre with a component disjoint from all cusps fails the required hypothesis.

Direct prerequisites: `AutomorphicBundles:B5/vector-fj-expansion`, `AutomorphicBundles:B5/coefficient-naturality`, `AutomorphicBundles:B5/coefficient-sequence-exact`, `AutomorphicBundles:B5/fj-target-left-exact`, `AutomorphicBundles:B5/fj-injectivity-finite`, `AutomorphicBundles:B5/coefficient-recognition`, `AutomorphicBundles:B5/constant-term-restriction`, `AutomorphicBundles:B5/cuspidal-boundary-criterion`, `AdicSpacesPartII:F0/completion-detects-near-closed`, `SchemeAndStackFoundations:SF.1`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`.

Source passages: LAN-2021, Proposition 7.1.2.14, pp.539–540; LAN-HIGHER, Proposition 5.6, p.177. The scalar proof supplies the devissage pattern; the vector result additionally uses the explicit formal bundle and flatness hypotheses. Provides the local coefficient bundle needed to carry the scalar detection argument over to vectors.

### Hecke action on Fourier–Jacobi coefficients

Node: `B5/hecke-expansion-compatibility`.

For an admissible geometric Hecke correspondence of hecke-section-operator, the actual completed cusp correspondence and bundle transport induce a coefficient operator H_g^FJ. The square FJ∘T_g = ν(g)H_g^FJ∘FJ commutes, including cusp-label changes, finite trace and full-stabilizer transport; it is independent of compatible refinement and commutes with allowed coefficient changes. No universal scalar formula for higher-dimensional coefficients is asserted: they remain sections on abelian torsors. At a good modular prime ℓ∤N, under modular-expansion-comparison this specializes to b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), with a_(n/ℓ)=0 when ℓ∤n and the n=0 term included. In Diamond’s Hilbert normalization r_m^t, for U1(n) or U(n) and v∤np, it specializes to r_m^t(T_v f)=r_m^(ϖ_v t)(f)+Nm(v) r_m^(ϖ_v⁻¹t)(S_v f); for U1(n) and v|n the second term is absent. Here r_m^t includes the coefficient-line/χ_m normalization of (6.1), and S_v is the actual central correspondence.

The comparison requires formal trace/base-change and actual degree/cusp maps from C3/C4; these are requests, not consequences of ordinary toric inclusions. The modular geometric normalization requires ℓ invertible and the source’s good-prime hypotheses. Diamond’s displayed formulas use primes outside p; no saving trace or U_p at p is inferred. Retain the different cusp/component t in the Hilbert formula and its character normalization.

The proof route is precise:

1. Complete the actual correspondence along each cusp lying over the target and import the resulting sheaf trace compatibility.
2. Use functoriality of graded extraction with the character lattice map and θ_g; trace the transported coefficient sections and descend stabilizer invariance.
3. For rank one compare with the owned R15.2 geometric formula and the pinned analytic good-prime sum.
4. For Hilbert forms compute using Diamond Proposition 6.5.1, retaining r_m^t and the central S_v term rather than treating it as an unnormalized q coefficient.

Acceptance checks:

- For a local modular sequence supported in degree r and n not divisible by ℓ, only the a_(ℓn) term contributes; when ℓ|n the second term has χ(ℓ)ℓ^(k−1).
- At n=0 the good modular operator gives (1+χ(ℓ)ℓ^(k−1))a_0; this also tests the normalization on constant weight-zero forms.
- Over R/p² at ℓ≠p, coefficient change and the normalized operator commute; reduction at p does not erase a missing integral trace construction.
- Higher-rank coefficients move through abelian-torsor sections, rather than being scalar Fourier coefficients.

Direct prerequisites: `AutomorphicBundles:B5/hecke-section-operator`, `AutomorphicBundles:B5/non-neat-hecke-descent`, `AutomorphicBundles:B5/modular-expansion-comparison`, `AutomorphicBundles:B5/hilbert-cusp-expansion`, `AutomorphicBundles:B5/vector-fj-expansion`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C6`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `tauceti:HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`.

Source passages: DIAMOND-2022, Proposition 6.5.1, equation (6.1) and Remark 6.5.2, pp.27–29; LAN-2021, 5.4.3.8–5.4.3.10 and 6.4.3, pp.438–439 and 527–530. The formula is for normalized adelic coefficients at infinity; the R15 supplier owns its modular integral specialization. Supplies the geometric cusp assignment. Formal trace/graded extraction compatibility is a derived target and remains an explicit supplier request.

## 9. Routed classical BCGP comparisons

### Classical algebraic bundles in the Hodge–Tate coefficient functor

Node: `B5/classical-bcgp-equivariance`.

In BCGP’s Hodge-type setting, fix neat tame K^p, a sufficiently large p-adic coefficient field E, the actual Levi M, finite-dimensional algebraic L_κ with κ M-dominant, and compatible smooth toroidal data. The imported coefficient functor VB^0 identifies VB^0(L_κ)=ω^(κ,sm) with the smooth tower of the finite-level classical automorphic bundles of B2/B3, with its μ-weight Tate normalization. Its coherent cohomology is colim_(Kp) RΓ(X_KpK^p,ω_Kp^κ), a complex of smooth admissible G(Q_p)-representations. The same compatibility holds after tensoring by the actual boundary ideal (−D). Level pullbacks, prime-to-p Hecke maps and compatible fan refinements commute with the identification; G(Q_p) may change the fan. For GSp4 the convention check is ω^((1,0;−1),sm)=ω_A(−1)⊗O^sm, with Q_p(1) of Hodge–Tate weight −1 and Sen eigenvalue +1. The full derived/analytic VB machinery belongs to the already proposed HigherHidaAndColemanTheory, not to B5.

The bundle is finite-dimensional and algebraic, not a locally analytic Coleman coefficient. Retain the μ normalization; §4.8 uses untwisted coherent bundles and applies its Tate twists separately. The supplier for the complete VB functor is pending design, so its actual carrier is a recorded gap and its existing proposal is retained rather than invented as a new stage.

The proof route is precise:

1. Import B1/B2/B3’s finite-dimensional representation realization and T6’s logarithmic coefficient comparison.
2. Use BCGP §4.6.1’s descent of VB^0(L_κ) and compare transition maps; the pending HigherHida supplier must provide its actual VB carrier and the finite-dimensional acyclicity/descent interface.
3. Transport the actual boundary ideal under refinement; apply coherent level-colimit compatibility from SF.2 and the existing Hecke correspondences.
4. Check the tautological differential sequence and the (1,0;−1) Tate shift as in §4.6.2.

Acceptance checks:

- The (1,0;−1) coefficient is ω_A(−1), not untwisted ω_A.
- At κ=0 the actual constant coefficient matches the classical structure sheaf with its supplied normalization.
- The cusp comparison uses ω_Kp^κ(−D_Kp) on every finite model and compatible boundary pullback, not ordinary Γ on the open Shimura variety.

Direct prerequisites: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B3.general`, `AutomorphicBundles:B4`, `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`, `ShimuraCompactifications:C3.general`, `AutomorphicBundles:B5/hecke-section-operator`.

Source passages: BCGP-2025, §§4.6.1–4.6.2, pp.81–82; §§4.5.17–4.5.22 for refinement context. The finite-dimensional bundle descends to the classical finite-level sheaf with its stated Tate normalization. The source’s general VB construction is imported.

### Classical Siegel Hodge–Tate decomposition

Node: `B5/classical-siegel-ht-comparison`.

For the finite-level GSp4 toroidal model X=X_KpK^p in BCGP’s setting, let κ=(k1,k2;w) be an integral G-dominant weight with 0≥k1≥k2 and k1+k2+w even, and let V_κ∨ be its canonical pro-Kummer-étale coefficient local system. Use the untwisted canonical coherent bundles ω^λ of §4.8. Define λ0=(k1,k2;−w), λ1=(2−k1,k2;−w), λ2=(3−k2,k1+1;−w), λ3=(3−k2,3−k1;−w); 2a0=k1+k2+w, 2a1=2−k1+k2+w, 2a2=4−k2+k1+w, 2a3=6−k1−k2+w. For every i≥0 there is a G_Qp×T_KpK^p-equivariant isomorphism H^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj)(−a_j), with negative coherent degrees interpreted as zero. The étale group is the logarithmic/pro-Kummer cohomology in the source notation; it is not reinterpreted as ordinary étale cohomology of the proper underlying toroidal space with an arbitrary lisse extension. The Tate convention is Q_p(1) of Hodge–Tate weight −1, Sen eigenvalue +1.

Keep all four weights, central weight −w, shifts i−j and separate Tate twists −a_j. Parity makes every a_j integral. The logarithmic comparison and canonical local system are T6/B1 inputs. The dual BGG/Kostant identification and degeneration/Hecke comparison underlying FC90 Theorem 6.2 are not proved in the inspected BCGP passage and remain explicit gaps.

The proof route is precise:

1. Import the actual logarithmic local system/de Rham comparison from T6 and the canonical coefficient realization from B1/B2/B3.
2. Identify the four coherent weights by the GSp4 dual BGG/Kostant calculation. This lies beyond upstream LieHighestWeight, which expressly excludes BGG, and needs its already proposed Part II input.
3. Apply the source-qualified classical Hodge–Tate decomposition quoted as FC90 Theorem 6.2; acquire and check the underlying proof and its degeneration and functoriality inputs. No deduction from a spectral sequence alone is claimed.
4. Compare Hecke and Galois actions using the actual coefficient maps and the pinned convention; the explicit μ pairing gives the four Tate shifts.

Acceptance checks:

- At κ=(0,0;0), λj=(0,0;0),(2,0;0),(3,1;0),(3,3;0) and a_j=0,1,2,3.
- At i=0 only the j=0 summand can survive; negative coherent degree is zero.
- For κ=(0,0;1), parity fails and the integral GSp4 representation in this convention is unavailable; a formula using integer truncation of half-weights is rejected.

Direct prerequisites: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`, `AutomorphicBundles:B5/classical-bcgp-equivariance`, `AutomorphicBundles:B5/hecke-convolution`.

Source passages: BCGP-2025, §4.8.1 and Theorem 4.8.2, pp.101–102. States the four-term classical decomposition and attributes the proof to FC90 Theorem 6.2; the uninspected proof is explicitly recorded as a gap.

### Compact-support Siegel Hodge–Tate decomposition

Node: `B5/cuspidal-siegel-ht-comparison`.

With exactly the weight, coefficient local system, finite-level model and Tate convention of classical-siegel-ht-comparison, there is a G_Qp×T_KpK^p-equivariant isomorphism H_c^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj(−D))(−a_j), where D is the actual reduced toroidal boundary divisor and H_c is the compact-support logarithmic/étale theory used by BCGP. Keep this as a separate comparison from the ordinary canonical-bundle statement. The cusp twist is the subcanonical coefficient sheaf, not replacement by a selected set of zero constant terms in cohomological degree i.

Use the same four λ_j and a_j, all component boundary ideals and compact-support functoriality. The boundary/logarithmic compact-support comparison and duality are supplier inputs. It is not a formal consequence of degree-zero cuspidality or of the ordinary decomposition.

The proof route is precise:

1. Import the subcanonical extensions and boundary ideal from B3 and the compact-support logarithmic comparison from T6/SF.2.
2. Use the compact-support version quoted in Theorem 4.8.2, whose FC90 proof and boundary functoriality must be read and supplied.
3. Apply the same four-weight calculation and compare the Hecke/Galois actions with the boundary ideal maps; verify all coherent summands carry (−D).

Acceptance checks:

- At κ=0 the four coherent terms have twists −D and Tate shifts 0,−1,−2,−3, with their degree shifts retained.
- When D is empty the boundary twist is identity and the proper compact-support theory agrees with the ordinary one under the supplier comparison.
- When D is nonempty, silently using ω^λ in place of ω^λ(−D) fails the cusp-coefficient convention.

Direct prerequisites: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`, `AutomorphicBundles:B5/classical-bcgp-equivariance`, `AutomorphicBundles:B5/hecke-convolution`, `AutomorphicBundles:B5/classical-siegel-ht-comparison`, `AutomorphicBundles:B5/cuspidal-boundary-criterion`.

Source passages: BCGP-2025, Theorem 4.8.2, compact-support display, pp.101–102. The second display uses compact support and the boundary twist in every coherent summand. Proof and actual cohomology carriers remain supplied inputs.

## 10. Ownership and unresolved inputs

C0 supplies the fan and graded character algebra; C1 labels, full stabilizers and quotients; C4 the abelian/torus torsors and degeneration data; early C5 the good-prime toroidal model and charts. F0 supplies completion on the actual scheme charts, and SF.1 transports the argument through the stack atlas. SF.0 owns generic coefficient tensors, finite-projective sheaf trace and its laws. SF.2’s proper-duality counit is a distinct operation and is not silently used as algebra trace. B1–B4 own principal bundles, representation realization, extensions and section/cohomology modules. B5 consumes these actual carriers.

The modular comparison imports the exact R15.1 Tate-normalization and all-weight analytic-comparison nodes, and R15.2’s integral q-expansion principle, geometric Hecke operators and cusp sequence. AdelicAlgebraicGroups AA.4 owns the correspondences and its qualified Cartesian result. Tau Ceti owns the convolution ring and analytic character-space action. Hilbert H2/H3 and C6 own ramified models, unit quotients and compactification charts; B5 owns their expansion interfaces and comparison with the classical/p-adic consumers. In particular C6’s Koecher extension does not replace the cusp ideal.

The BCGP extraction routes principal-bundle and representation realization to B1–B3, all finite-dimensional classical sections to B4, and the three stated comparisons to B5. The added AGHMP and Caraiani–Scholze sources are B0–B2 inputs, outside this issue’s single-stage scope. Their realizations are imported, not extracted again here. The full VB coefficient machinery is supplied by the existing pending HigherHidaAndColemanTheory proposal; the dual BGG input extends upstream LieHighestWeight, which explicitly excludes full BGG, through its already proposed Part II. Neither pending proposal has a verified stage id here, so both are explicit gaps. T6:comparison owns the logarithmic comparison underneath the classical coefficients. B5 does not make T6 depend on its downstream decomposition.

C5 combines early toroidal geometry consumed by B5 with a late minimal endpoint whose argument consumes B5 constant terms. The packet proposes its early/late split without changing the atlas. The arithmetic-base Stein factor in section 4 is distinct from the minimal compactification. A local acyclic node graph is not a certification of the whole stage DAG before that split. The packet also proposes four presentation sub-layers for B5, retaining the one prescribed scope id and six planets in this pass.

The precise open inputs are:

- **Residue-fiber detection after coefficient reduction.** The generic smooth-closure/finite-etale-Stein proof is spelled out in the reader and routed to SF.1. At neat level, early C5 must identify the actual selected strata as fiberwise-dense opens of smooth proper relative boundary intersections; total-space density and constant component counts alone are not sufficient. At non-neat level, the proper branch or stack/level-change construction and its component coverage remain open. The finite-thickening algebra comparison is explicit, but the actual formal-chart coefficient maps and descent still must be identified with it. These are narrower concrete leaves, not a declaration that the source theorem is complete.
- **C5 has an early toroidal and a late minimal endpoint.** The current C5 README combines toroidal construction with minimal compactification. B5 consumes only the early chart theorem, while Lan 7.2.3 uses B5's constant-term theorem for the minimal boundary factorization. An accepted module/stage split is needed; no full cross-roadmap acyclicity claim is made. The arithmetic-base Stein factor in the residue-component proof is not the Shimura minimal compactification and does not use the late positivity theorem.
- **Coefficient pushforward and boundary exactness.** Prove the coefficient expression on the lower-dimensional base using the precise projection/base-change theorem, and prove exactness of the relative boundary sequence with the chosen M. The torsor-section definition avoids assuming the former; the AF left-exactness lemma does not prove the separate boundary tensor sequence.
- **Common formal chart and coefficient comparison.** The preceding checkpoint resolved rendering and rejected the generic direct map between different stratum completions by the k[x,y] unit obstruction. Still needed are C4/early-C5's common Mumford-family chart mapping to the toroidal model, and C0/F0's homogeneous boundary ideal, continuous maps to the individual completions, separated degree projections and coefficient-compatible descent. Corrected indices alone do not close this node. The ordinary scheme completion-map construction is now imported through the exact F0/completion-of-morphism node; its application to the actual charts, homogeneous coefficients and stack descent remain open.
- **Actual geometric suggested-file carriers.** The suggested file retains the compiled algebraic regression layer and adds actual Scheme.Modules/affine tilde section-map prototypes and explicit weight calculations where the pinned carriers suffice. It does not fabricate Shimura stacks, completed Mumford families, fractional Hilbert positive-index series or logarithmic cohomology. Full geometric definitions, their API and geometric tests require the specified B1–B4, C0–C6, F0 and T6 carrier imports. Each omitted signature is named in the file. Algebraic compilation is not closure of these targets.
- **Finite-projective trace and toroidal Hecke refinement.** Establish SF.0’s local-to-global coefficient trace and its base-change/transitivity laws, then B3/C3’s extension through proper toric refinements and boundary ideals. Read and compare actual coefficient/isogeny cocycles and ν against the inverse/right-coset convention. A geometric action is not supplied by analytic ModularForm.trace or SF.2’s duality counit.
- **Refined correspondences and non-neat action.** AA.4/hecke-cartesian has the additional product hypothesis U′L=U. An arbitrary normal neat cover does not make the needed square Cartesian, nor identify its g-double-coset with the original one. Supply the actual common refinement/Mackey decomposition and stack descent; never average or assert exactness of invariants.
- **General-data Fourier–Jacobi source interface.** The inspected Milne VII.4.1 explicitly states the general mixed-boundary formal identity as a conjecture and singles out the proven Siegel case. C3.general/B3.general must supply a proven formal boundary/coefficient comparison in the exact characteristic-zero generality used. Lan Higher Proposition 5.6 supplies the good-prime PEL vector case; it does not prove an all-prime general integral version.
- **Ramified Hilbert charts and component detection.** C6/H2/H3 must identify the actual ramified splitting-model cusp completion and weight line, unit action and determinant components, and verify the coefficient/fibre-detection argument in Proposition 6.2.1. Diamond’s prime-to-p statement is retained, while general Iwahori component coverage is explicitly false. The printed §6.2 proof cites Rapoport 1978 Theorem 6.7; that underlying proof has not been read in this pass.
- **Pending higher Coleman coefficient supplier.** BCGP’s VB and VB^0 carriers and finite-dimensional descent are routed to the existing pending HigherHidaAndColemanTheory design from Pilloni20/BCGP25. It has no assigned atlas stage here. Do not invent an id or rebuild the derived/analytic coefficient functor in B5; request its finite-dimensional interface once design assigns stages. T6 supplies the foundational logarithmic comparison. The Part II proposal is recorded in restructure.
- **Classical BGG and FC90 comparison proof.** BCGP Theorem 4.8.2 states the full ordinary and compact-support decompositions and quotes Faltings–Chai 1990 Theorem 6.2. That underlying proof, the exact logarithmic/compact-support definitions and degeneration/Hecke functoriality inputs have not been independently read here. The four-weight calculation is explicit, but it is not the decomposition proof. Upstream LieHighestWeight expressly excludes full BGG; its already proposed LieHighestWeightPartIICompletedCategoryO is the candidate supplier for the dual BGG/Kostant input, pending a designed exact stage. No such stage is invented.
- **Cross-roadmap early/late stage validation.** The local packet node graph is acyclic. The existing C5 stage combines toroidal inputs with the minimal endpoint consuming B5, so the requested early/late split must be approved before whole-atlas stage-DAG closure can be certified. General-data, Hilbert and T6 comparisons retain their exact supplier directions; no claim is made that the pending coefficient/BGG designs already have validated stages.

The nineteen requests in the packet assign these needs to the existing owners, with exact consuming nodes. Requests do not certify that the supplier is implemented. The pass is complete because every B5 target is now planned; the stage is not closed because these inputs remain. Follow-up work is exactly the stage coverage list:

- Supply the actual common-completion coefficient comparison and stack descent, and instantiate residue-fibre detection and coefficient-sensitive boundary/refinement exactness.
- Complete finite-projective sheaf trace, refined correspondence composition, normalization and non-neat descent on the actual toroidal coefficient modules.
- Provide the general-data formal boundary identity and the ramified Hilbert chart, unit-line and component interfaces; read the underlying Rapoport proof.
- Assign the existing pending VB and BGG suppliers, read FC90 Theorem 6.2’s ordinary/compact-support proof, and provide the logarithmic cohomology carriers and functoriality.
- State the omitted full geometric Lean signatures and tests against those imported carriers, and validate the C5 early/late split in the atlas DAG.

## 11. Sources, baseline and suggested-file boundary

Source metadata in the packet identifies each public version and fresh byte hash. On 6 October 2026 this pass read Lan’s author revision §§7.1.1–7.1.2 and §§6.4.3.1–6.4.3.4, the Hecke cusp assignments in §5.4.3, and the relevant errata; Lan Higher §2, Proposition 5.6 with its proof and Remark 5.7, Corollary 5.9 and Definition 5.10; Diamond’s notation, §§2.1–2.3, §§6.1–6.3 and §6.5; BCGP §§1.8, 4.5.1, 4.5.17–4.5.22, 4.6.1–4.6.2 and 4.8.1–4.8.2; and Milne VII §§1–5. These are the B5 source passages, not a claim to have read every section of those papers. Earlier EGA/Stacks readings remain explicit provenance.

Milne’s general formal boundary identity is visibly a conjecture in the inspected 2018 notes. Diamond §6.2 cites the underlying Rapoport theorem, and BCGP Theorem 4.8.2 cites FC90 Theorem 6.2; those underlying proofs remain unread source inputs. The target statements are transcribed with their hypotheses, while their proof/carrier dependencies remain open. The ordinary and compact-support BCGP targets are separate, and no spectral-sequence degeneration is inferred without its theorem.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All nineteen cited baseline statements and ambient hypotheses were read at those exact commits. Their conventions and limitations are recorded individually. At least two upstream documents were read completely: JacobianChallenge and GrothendieckEulerForms. ModularForms/ModularCurves passages were used as interface references without claiming another complete reading.

The suggested file preserves the algebraic regression layer and adds actual scheme-module section maps, affine tilde-section tests, local finite-free trace, a rank-two local monomial and the four-weight parity calculations. They use existing mathematical carriers; they do not construct the missing Shimura charts. Its omission ledger names every full geometric signature, API item and test whose carrier is unavailable. No opaque conclusion field or invented bundle type replaces one.

The available shared build has pinned Mathlib, but the required Tau Ceti object files are absent and its checkout differs from the Tau Ceti pin. The full suggested file is therefore not claimed to compile in this run. Its Mathlib-only fragment is checked with `lean-check`; final results are recorded in the handoff. No new project, dependency download or library build is used. Packet validation and fragment elaboration do not close the geometric expansion principle or the classical cohomological comparisons.

## Source issues and verification boundary

The main primary text inspected is Kai-Wen Lan's *Arithmetic compactifications of PEL-type Shimura varieties*, **author-hosted thesis revision of 14 March 2021**, at https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf. The publisher edition has not been inspected, and no finding is attributed to it merely because the numbering agrees.

`AutomorphicBundles/E6811` preserves the preceding checkpoint's finding of a reversed new-degree difference and mismatched stabilizer subscripts on printed p. 536, checked there in the rendered author copy. The relevant zero condition is on the `sigma1` coefficients in `sigma1-dual minus sigma2-dual`; the printed reverse difference is empty. This transcription issue is separate from the missing formal-map justification.

`AutomorphicBundles/E6812` preserves that separate justification issue. The affine unit obstruction in section 2 invalidates the generic direct-completion inference. The common-completion route is a proposed repair requiring geometric supplier proofs, not a verbatim source proof or a disproof of the final support theorem.

`AutomorphicBundles/E6813` concerns the coefficient reduction in the proof of Lemma 7.1.1.4, printed p. 533 (PDF index 560), visually read in the preceding checkpoint. The passage from flatness to a filtered union of the module's free submodules is not valid over a general Dedekind base. A finitely generated module equal to such a directed union would already equal one member containing its finite generating set, hence would be free. A nonprincipal invertible ideal is finite projective and not free. The source's notation permits an infinite set of retained primes, so semilocality is not a blanket standing hypothesis.

This is a scoped objection to the generic algebra inference, not a constructed counterexample with a chosen PEL reflex field, nor a claim that Lemma 7.1.1.4 or the expansion principle is false. For the finitely generated projective part already reached in that proof, split a finite free surjection and pass the natural comparison to its direct summand (Stacks 00NX). A separately proved freeness condition on a particular base would also repair that case. A filtered colimit of finite free modules with general transition maps is not a filtered union of free submodules. The prime-filtration route above repairs the injectivity reduction only; refinement cohomology still needs its own proof.

The preceding checkpoints checked the author-hosted errata of 14 March 2021, https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf. Items 71–77 concern charts, étaleness, stacks and stabilizers. No correction for the two p. 536 issues was located there, and searches of the parsed errata for 7.1.1 and free located no correction for E6813. This pass re-read the served author revision and errata and inspected rendered p. 536, preserving the three version-scoped findings. It is not an independent errata review. Novelty remains unverified. No communication to the author is part of this task.

Earlier primary inputs are Stacks [00L0](https://stacks.math.columbia.edu/tag/00L0), prime filtrations; [00IP](https://stacks.math.columbia.edu/tag/00IP), local separation; [00NX](https://stacks.math.columbia.edu/tag/00NX), finite projective summands; and [0GQZ](https://stacks.math.columbia.edu/tag/0GQZ), the qcqs-stack filtered-colimit comparison, with the site conditions in [0GQU](https://stacks.math.columbia.edu/tag/0GQU). Their earlier verification notes are retained in the packet. The new primary input is [0A18](https://stacks.math.columbia.edu/tag/0A18), including the proofs of the Noetherian algebraic-space Stein theorem and its finite-étale refinement [0E0D](https://stacks.math.columbia.edu/tag/0E0D). The generic clopen-image deduction and finite-thickening argument in section 4 are authored proof routes using these specified owner inputs, not newly numbered theorems attributed to Lan.
