# Analytic toric geometry, Part II: arithmetic toroidal compactifications

**First prerequisite:** the unchanged [Analytic toric geometry](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/AnalyticToricGeometry/README.md) roadmap, `tauceti:TauCetiRoadmap/AnalyticToricGeometry`.

**Part C0; status: partial.** The scope is C0, C1, C2, C2.general, C3, C3.general, C4 and C5. C6 belongs to the other part. This initial checkpoint gives five declaration-level targets for the neat-level boundary geometry inside C5. It does not claim a complete decomposition of the eight stages or an implementation of the toroidal model.

The accepted RS-32 proposal is binding. The anchor supplies finite regular complex toric geometry on the common lattice, cone, monoid-algebra and scheme carriers. This extension starts with arithmetic-admissible cone systems and relative integral torus embeddings, then constructs arithmetic quotients and their compactifications. Finitely many cone orbits is not finiteness of the fan. Relative properness, integral degeneration, canonical descent and coefficient-specific cohomology do not follow automatically from the finite complex theorems. C4 builds on R11.3's local Raynaud theory; it does not construct that local theory a second time.

## The C5 problem addressed here

The prime-quotient step in the Fourier–Jacobi expansion principle needs the selected strata to meet the components of the residue-fiber model. Meeting every component of the total space alone does not imply this for arbitrary open subsets. The useful extra fact is that the actual neat-level strata are exact relative boundary opens in smooth proper closures.

The mathematical argument below identifies those opens using **ordinary étale charts and their labels**. It does not extract a global assertion merely from a formal completion or from constancy of the number of fiber components. It supplies the PEL instance of the generic smooth-closure component detector requested from the foundations owner. The direction is foundations → early C5 → B5, never B5 → C5.

### Standing objects and hypotheses

Use Lan's actual object `X = M_H,Sigma^tor`, defined as the quotient of the constructed étale groupoid in 6.3.3.15 of the author revision dated 14 March 2021. The base is the indicated regular Noetherian localization of the reflex integers, or its specified field version, written `B = Spec R`. Retain the PEL hypotheses of 1.4.1.2 and Condition 1.4.3.10, including the maximal-order extension of the lattice action. The good-prime conditions and level restrictions are those supplied by PELModuli M2, not simply a condition that a prime be large.

Require **neat H** and compatible admissible smooth cone decompositions as in 6.3.3.4, including Condition 6.2.5.25. The fan condition and neatness are used for boundary-branch separation. They are not replaced by a blanket assertion that every arithmetic quotient of a smooth fan has global simple normal crossings.

The model is a smooth proper **algebraic space** over B at this level. No scheme realization, ample line bundle or integral minimal compactification is assumed. Its construction, universal family, chart comparisons and properness are source theorems still requiring their own complete formalization chain. Naming the source object does not implement them; no abstract record storing the conclusions replaces it.

Let `D_i` be the finite family of irreducible components of the reduced boundary. For a subset J of its index set put

`D_J = intersection of D_i for i in J`, with `D_empty = X`,

using scheme-theoretic intersections of closed algebraic subspaces, and

`D_J^o = D_J minus the union of D_i for i outside J`.

The superscript circle denotes an open subspace, not a different stratification or a quotient carrier. A labelled stratum means the source's equivalence class of cusp/cone labels. Its irreducible components are kept separate.

### Source interfaces actually used

Definition 6.3.2.5 gives an ordinary stratification-preserving **étale** map from a good algebraic model to the relative torus embedding. Proposition 6.3.2.6 supplies such neighborhoods; 6.3.2.16 identifies their face labels. The finite assembly and compatibility conditions are in 6.3.3.1–6.3.3.4. The groupoid and its descent in 6.3.3.14–6.3.3.16 preserve the stratum labels. The no-self-intersection conclusion at neat level occurs in 6.4.1.1(3), with the specified fan conditions.

These inputs are stronger than an abstract statement that a stratum is dense in its total closure. They provide coordinates over the arithmetic base and identify the labelled pieces. Known errata 61 and 72 require the appropriate étale finite-type hypotheses; formal étaleness alone is not substituted. Errata 71 and 74 require the actual torus-torsor/abelian-torsor/stack base and the equivalence-class labels.

## 1. Smooth relative boundary intersections

**Declaration target:** `C5/neat-boundary-intersection-smooth`.

For every J, `D_J → B` is smooth. It may be empty or disconnected.

In the ordinary relative toric chart, choose an integral basis extending the primitive rays of a regular cone. C0's relative extension of the shared dual-monoid algebra identifies the chart, after trivializing the actual torsor, with a polynomial/Laurent polynomial algebra over the abelian-torsor cusp base. This base is smooth over B by C4 and the lower-dimensional M2 moduli theorem. The finite complex chart is its compatibility test, not a proof of its arithmetic generality.

The neat branch-separation condition ensures that the global boundary components through the point correspond to distinct coordinate hyperplanes. After shrinking the étale chart, components not through the point are absent. The scheme-theoretic intersection is therefore the quotient by the selected coordinate variables. Its remaining polynomial and invertible coordinates give smoothness over the cusp base, hence over B. The actual étale cover descends this statement to the algebraic space.

This is an application to the source model of generic coordinate, smoothness and descent facts owned by SF.0/SF.1. Stacks 41.21.2 provides the absolute scheme intersection criterion; its word “regular” is not silently interpreted as relative smoothness. The relative conclusion here comes from the ordinary charts over B.

**Acceptance.** In a two-ray affine chart, empty J gives the plane, a singleton gives a line and both rays give the base. A disconnected intersection is not renamed a single stratum. An irreducible nodal boundary is a warning against discarding branch separation: its single global component is not a smooth coordinate divisor at the node. That warning is not asserted to be a PEL counterexample.

## 2. Density after every geometric base change

**Declaration target:** `C5/neat-boundary-open-fiberwise-dense`.

For every geometric point b of B, `(D_J^o)_b` is dense in `(D_J)_b`. The same holds after restricting to any open-and-closed component of `D_J`.

Take the preceding ordinary étale charts after base change to b. In the coordinate intersection, the exact open is obtained by inverting the product f of the remaining boundary coordinates. This coordinate open is dense. One algebraic proof uses the polynomial monomial basis: multiplication by f is injective, and the smooth geometric-fiber base is reduced. Thus f avoids the minimal primes of the Noetherian coordinate ring. Laurent coordinates already invertible do not change this calculation.

Pull the result back through the étale chart maps. The topological input is elementary but must be applied in the correct direction: the inverse image of a dense open under an **open map** is dense. Every nonempty open in the source has nonempty open image, which meets the given dense open. Étale maps are open. Finally use the jointly surjective étale cover to descend density.

This proves more than density on the generic fiber. It also avoids counting rational points: the topology concerns all scheme points, or geometric fibers, not a finite set of rational coordinates. Density after extending a residue field to an algebraic closure implies density on the residue fiber itself by surjectivity of that base change.

**Acceptance.** The open `G_m` in the affine line is dense over a finite field as well. With no remaining boundary coordinates, f is 1 and the open is the entire intersection. For a DVR R with uniformizer pi, removing the closed fiber from a boundary section gives `Spec R[1/pi]`: it is dense in the total section but misses its closed fiber. This rejects the proposed shortcut “any dense open in a smooth closure is fiberwise dense.”

## 3. Recover the labelled stratum, not just some dense open

**Declaration target:** `C5/neat-stratum-closure-component`.

For a nonempty irreducible component Z of a labelled stratum, let J be the set of boundary components containing Z. There is a unique connected component W of `D_J` such that

`Z = W intersect D_J^o`.

Its reduced closure in X is W.

First the source's closure/incidence description makes each boundary component a union of stratum components. Consequently Z is wholly contained in or disjoint from each `D_i`. Thus it lies in the exact-pattern open for J.

The key point is local constancy of the **actual labels** on that open. In a regular toric chart, specifying which boundary coordinates vanish and which are invertible specifies one face-orbit stratum. The good algebraic models preserve those face labels. The two projections of the groupoid preserve their equivalence classes. Around every point of `D_J^o`, an exact-pattern chart therefore maps into the corresponding labelled stratum. The image is open in `D_J^o`, because the restricted chart map is étale. All label subsets are open, and their complements are unions of the other open label subsets.

Each labelled stratum is smooth over the regular base, so it is regular. Its irreducible components are open and closed. We obtain a partition of `D_J^o` into open-and-closed stratum components. An arbitrary stratification would not have this property: it is the face description and the actual label-preserving quotient that supply it.

By the first theorem `D_J` is regular and Noetherian, so its connected components are irreducible and open and closed. By the second theorem every nonempty such W has nonempty dense open `W intersect D_J^o`; density on fibers implies density in the total space by intersecting any nonempty open with a fiber. This open is irreducible. It cannot meet two nonempty pieces of the open-and-closed stratum partition. Conversely the connected Z lies in only one component W. These facts give the asserted equality and uniqueness. W is closed in X and reduced, so it is exactly the reduced closure of Z, with the actual subspace structure.

This argument is the additional deduction from the source charts. It is not obtained merely by rereading the phrase that a stratum is open dense in an intersection.

**Acceptance.** A quadrant gives the expected four exact coordinate patterns. For a disconnected intersection, take `P1_z × P1_w` over a base where 2 is invertible, with divisors `w=1` and `w=z^2`. Their intersection is the disjoint union of the sections `z=1` and `z=-1`. One must choose a connected component W, not identify the whole intersection with the closure of a single zero-dimensional stratum. The case J empty includes components of the open moduli stratum; it does not produce a boundary cusp in an empty boundary.

## 4. Proper closures without a minimal compactification

**Declaration target:** `C5/neat-stratum-closure-proper`.

The reduced closure W just identified is proper over B. It is also smooth by the first theorem, and Z is dense in every geometric fiber of W by the second.

Indeed, W is an open-and-closed component of the Noetherian regular closed subspace `D_J`. It is therefore closed in X. Compose that closed immersion with the proper structural morphism of the actual toroidal model. This argument needs no Hodge positivity, scheme realization, projectivity or minimal compactification. It is valid for the algebraic-space model in the source.

**Acceptance.** A whole boundary section of `P1_B` is proper; its open obtained by deleting a special fiber is not the closure. Separate components of an intersection give separate proper closures, not necessarily geometrically connected fibers. Replacing a proper algebraic space by a scheme is not an admissible implicit step.

## 5. Detect every geometric-fiber component

**Declaration target:** `C5/neat-strata-detect-geometric-components`.

Suppose a finite family of nonempty labelled strata meets every irreducible component of the actual neat model X. Their base changes then meet every irreducible component of every geometric fiber of X over B.

Decompose the selected strata into their finitely many irreducible components. The previous theorems produce smooth proper closed spaces `W_a` and opens `Z_a` dense in every geometric fiber of `W_a`. Apply the generic component detector assigned to **SF.2**, after SF.1's algebraic spaces and the coherent proper-cohomology inputs.

The exact generic interface is as follows. For smooth proper X over a regular Noetherian base, finitely many smooth proper closed `W_a` with fiberwise-dense opens `Z_a` detect geometric-fiber components whenever their union detects total components. Its proof uses the Stein factor `X → E → B`, where E is finite étale and the first map is proper surjective with connected geometric fibers. Each `W_a → E` is proper. It is also smooth: its graph into `W_a ×_B E` is a section of an étale separated map, hence open, and the second projection is smooth. Its image is therefore open and closed.

Regularity identifies connected and irreducible components. Properness and connected fibers identify the total component sets of X and E: a decomposition of the inverse image of a connected component of E would give a disjoint closed partition of it. Thus the images of the `W_a` cover E. Over a geometric b, the points of the finite discrete `E_b` index the connected regular, hence irreducible, components of `X_b`. A nonempty corresponding fiber of a `W_a` is open and closed in `W_a,b`, and fiberwise density of `Z_a,b` reaches it. This is the foundations proof to implement once; C5 supplies its specific geometric instance rather than redefining Stein theory.

The inspected Stacks statements are 76.36.1, 76.36.4 and 76.36.9. This proof uses the geometric fibers of the existing factorization, not an unproved assertion that formation of the Stein factor commutes with every nonflat base change.

The output is exactly the neat-level geometric premise for `AutomorphicBundles:B5/fj-injectivity-cyclic`. The coefficient-sheaf comparison on formal charts, arbitrary-coefficient dévissage and non-neat expansion theorem are separate obligations. No reverse dependency on B5 is introduced.

**Acceptance.** On two disjoint proper smooth curves, choosing strata on just one component fails the premise. A whole standard boundary section on `P1_B` satisfies it. A connected finite étale E may have several points over a geometric b: each must be reached. A non-neat level is not included by appealing to a neat cover without proving coverage of every lifted component and the required descent. A toroidal level map need not be étale at the boundary, and averaging by a stabilizer order is not used.

## Ownership and implementation boundary

The five targets are C5 applications to Lan's actual moduli object. Generic coordinate algebra, morphism properties and density are SF.0 inputs; algebraic-space descent and regular-component topology are SF.1 inputs. The Stein theorem and assembled generic detector belong after SF.2's proper coherent cohomology. The safe order is early spaces/descent → proper coherent cohomology and Stein/detection → early C5 → B5.

The arithmetic-base E is **not** the Shimura minimal compactification. C5's combined stage also contains the minimal/positivity endpoint, which consumes B5 constant terms. Its early and minimal module exports must be separated before whole-stage dependency promotion. The packet retains current ids and records that split proposal; it does not claim a global stage-DAG check.

The reviewed AUDIT-10 and its accepted review distinguish genuine existing foundations from the missing PEL construction. Three declarations were checked again at the exact library pin: `TauCeti.Toric.Fan.ext`, `TauCeti.SplitTorus.groupScheme`, and `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`. The first concerns finite fans, the second works over a commutative base ring, and the third concerns schemes, not algebraic spaces. None is represented as the full theorem above. Searches with no matches are not exhaustive absence certificates.

The suggested file has three real specialization examples using those declarations. The five advanced geometric signatures remain unstated until the actual pinned-compatible PEL/algebraic-space carriers are supplied. No proposition-valued record or arbitrary boundary datum stores their desired conclusions. This is a precise partial boundary, not geometric implementation.

## Retained scope of the eight stages

**C0 — Arithmetic-admissible fans and relative embeddings.** Keep arithmetic cone actions, finite orbit conditions, local finiteness on the positivity domain and compatible cusp supports. Construct the required common, smooth and projective refinements, and the relative integral torus-torsor embeddings and their qualified support/properness theorem. Import L0 and L5. A neighborhood of the origin does not witness local finiteness of an infinite cone family, and the existing finite Fan is not silently enlarged. The relative regular-coordinate calculation used above must specialize to the unchanged finite complex chart.

**C1 — Rational boundary and mixed data.** Import V2's rational boundary components and the existing linear mixed-Hodge vocabulary. Construct the additional mixed boundary data, positivity cones, cusp labels, full stabilizers, lattice transports and actual torsors/finite covers. Keep quotient-stack distinctions. The label compatibility used here is not a complete decomposition of this stage.

**C2 and C2.general — Characteristic-zero gluing and general-data descent.** Reuse the anchor's L0/L2/L3/L4/L5 charts, finite fan gluing, boundary and proper maps. The extension still must prove the arithmetic transition, separation, quotient and gluing results, normality/properness, projectivity for the required fan, comparison to the minimal boundary and canonical descent. The general-data interface uses C2 and V8.general with the same labels. The neat PEL argument here does not strengthen the general arithmetic boundary conclusion to global simple normal crossings or provide a universal abelian scheme for general pure data.

**C3 and C3.general — Refinements and Hecke maps.** Import finite regular toric maps from L5. Retain arithmetic refinement and Hecke extensions with compatible fans, identity/composition and common-refinement comparisons. Structure-sheaf pushforward and higher-direct-image vanishing for the exact coefficient sheaves are separate targets. The general-data interface retains its stated scope, not an all-prime integral theorem. A fixed fan is not assumed stable under every Hecke map.

**C4 — Relative degeneration.** Import local Raynaud and polarized lattice uniformization from R11.3. Extend it to the actual relative cusp bases, biextensions, polarized degeneration data, effectivity, algebraization, universal formal charts and endomorphism/level compatibility. These are not consequences of naming the local uniformization theorem. Keep the modular-curve Tate n-gon and ramified p-level comparisons; the invariant relative differential is `du/u`, not `dq/q` on the base.

**C5 — Integral PEL compactifications.** The five targets above cover one neat boundary strand. The good algebraic models, étale relation and quotient, universal family, formal completions and valuative properness need full declaration-level construction chains. The non-neat branch/stack/level-change theorem requires its own proof. All original positivity, finite generation of sections, minimal projectivity, open quasi-projectivity, higher-p-level normalization and height outputs remain required with their source hypotheses. None is closed by the present component argument.

## Sources and checks

Primary text: [Lan's author revision, 14 March 2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf). The relevant ordinary-chart definitions, relation/stratum descent and theorem proof were read at the packet's precise locators. Printed pp. 503, 519–523 and 539 were inspected as page images in this turn. The attempted p. 504 image failed; its parsed text was read. The publisher edition was not inspected, and no independently measured PDF hash is claimed.

The [author's errata](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf), items 60–74, were checked for the construction and local-model clauses. Known corrections are incorporated as source requirements, not reported as new findings. No new source-error allegation is made.

The other inspected primary references are [Stacks 0CBN](https://stacks.math.columbia.edu/tag/0CBN), distinguishing absolute strict normal crossings from the relative input, and [Stacks 0A18](https://stacks.math.columbia.edu/tag/0A18), including [0E0D](https://stacks.math.columbia.edu/tag/0E0D), for the algebraic-space Stein factor. The exact-pattern and component-detection applications are explicit mathematical deductions, not newly numbered results attributed to Lan.

Local structural checks passed for the prepared packet. An additional finite regression enumerated 4,681 monomial cases: ranks 0–4, every subset J and exponent vectors in 0–3. For the coordinate ideal generated by variables in J, multiplying a monomial by the product of complementary coordinates preserves ideal membership, and the exponent shift is injective. This tests the coordinate saturation calculation only. It is not a proof of Zariski density, a full polynomial calculation, a PEL-model test or Lean validation.

The suggested file was not compiled. Current-head repository submission and blueprint checks are recorded in the PR after observation. No full local repository suite or global dependency-cycle check is claimed.
