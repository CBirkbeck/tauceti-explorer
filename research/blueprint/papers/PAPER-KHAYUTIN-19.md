# PAPER-KHAYUTIN-19 — Joint equidistribution of CM points

Claude Code — session `cc-7b31c4`; issue #1131; read on 22 September 2026.

Ilya Khayutin, *Joint equidistribution of CM points*, Annals of Mathematics **189** (2019), no. 1, 145–276. Read
in the author's public version, [arXiv:1710.04557v3](https://arxiv.org/abs/1710.04557v3) (22 October 2018, the
last preprint version, "to appear in Annals of Math., updated following referee comments") — in its **LaTeX
source** (`joint_cm_arxiv_v3.tex`, 5208 lines, source archive sha256 `d76399f1…`), since `pdftotext` was
unavailable here.

**On the published version.** The Annals article page and its PDF are reachable, but no PDF text extraction is
available in this environment, so the published text **could not be read**. Every locator is a preprint locator
and the three source issues are recorded against the preprint with no claim about print.

**On numbering.** The preprint runs a **single counter through the whole paper** for every environment:
Conjecture 1, Conjecture 2, Theorem 3, Theorem 4, Definition 5, …, Proposition 175. There are 175 numbered
statements and no duplicate labels. Definitions made in running text are located by section number.

The paper has been extracted into **111 items**, covering every numbered statement that is a definition,
construction or key theorem (the 23 pure remarks are folded into the items they comment on) together with the
unnumbered set-up of §2. Three items are planned by existing layers; the remaining 108 are routed exactly once:
**73 to a Part II** of *Geometry of numbers, quadratic forms and homogeneous arithmetic*, and **35** as sources
of three existing roadmaps. No item is `library`.

## What the paper proves

A packet of CM points on a modular curve is a `Pic(Λ)`-orbit for a quadratic order `Λ`; Duke's theorem says the
counting measure on a packet equidistributes as `|D| → ∞`. Michel and Venkatesh conjectured the **joint**
statement: if `σ_i ∈ Pic(Λ_i)` and `𝔑_i = min{Nr 𝔞 : 𝔞 ⊆ Λ_i, [𝔞] = σ_i} → ∞`, then the counting measures on
`{(z, σ_i.z) : z ∈ P_i} ⊂ Y × Y` converge to `m_Y × m_Y`.

* **Theorem 3 / Theorem 14.** The conjecture holds under two hypotheses: two fixed primes `p_1, p_2` split in
  every CM field `E_i`, and no `ζ_{E_i}` has an exceptional Landau–Siegel zero. Adelically: every weak-* limit of
  the self-joinings of periodic toral measures on `[(G × G)(A)]` is `(G × G)(A)^+`-invariant. **Proposition 18**
  computes which convex combinations of component-Haar measures occur, so the conclusion is sharp — joint
  packets can miss connected components.
* **Theorem 21 / Theorem 22.** The `n`-fold version, via the Einsiedler–Lindenstrauss joining theorem, and hence
  equidistribution of Galois orbits of special points on a product of `n` quaternionic Shimura curves.
* **What is new.** Ellenberg–Michel–Venkatesh had proved the conjecture for one split prime **but only when
  `𝔑_i ≪ |D|^{1/2−η}`**, which fails for most twists; their strategy finds a Hecke correspondence of small volume
  containing the packet. This paper removes the restriction by estimating directly.

**The two halves.** *Measure rigidity* (§4): through the Einsiedler–Lindenstrauss classification of joinings of
higher-rank torus actions, every limit is a convex combination of algebraic measures, each either Haar or
supported on a homogeneous Hecke set `[G^Δ(A)^+ξ]`. *Cross-correlation* (§§5–10): unfolding the automorphic
kernel expands the pair cross-correlation of the packet with a Hecke correspondence into **relative orbital
integrals** indexed by the rational points of the GIT double quotient `G^Δ\(G × G)/T^Δ`, whose invariant ring is
computed explicitly (`Q[PGL_2]^{Ad A} ≅ Q[x,y,z]/(x² = yz)`); explicit coordinates for the quaternion algebra
split by `E`, with its twisted Galois action, convert each orbit into a **pair of integral ideals** of `Λ`, with
multiplicity bounded by `#Pic(Λ)[2]`; the resulting shifted convolution of ideal-counting functions is a sum along
the values of the **reduced norm form of the twisting ideal** over the lattice points of an ellipse
`{q ≤ κ|D|}` — of area `2πκ√|D|` and maximal radius of curvature `≤ √(A(E))·(√|D|/𝔑)^{3/2}`, so that the
hypothesis `𝔑 → ∞` is exactly what makes the ellipse round enough to sieve. A **general two-dimensional sieve**,
built from scratch in §9, bounds that sum by the expected order with a saving `p_1^{-2n}` over Bowen balls of the
diagonal flow at `p_1`. The no-Siegel-zero hypothesis is used **once**: to pass from a sum of the ideal-counting
function to the class number through `L(1, χ_E)` (Proposition 152).

## What the atlas already has

* `GeometryOfNumbersAndQuadraticArithmetic` **GN.4**, "Lattice points and homogeneous dynamics", plans
  lattice-point estimates and equidistribution and says it will "separately schedule ergodic/mixing,
  unipotent-flow and nondivergence proofs needed for **Oppenheim/Duke-type** arithmetic applications", with
  Margulis among its sources; **GN.2/GN.3** the local–global theory and reduction of quadratic forms.
* `AdelicAlgebraicGroups` **AA.1/AA.3/AA.4**: adelic points, reduction theory, finite volume, compactness for
  anisotropic groups, strong approximation, level maps and Hecke correspondences.
* `HeegnerPointEulerSystems` **HE.0**: quadratic orders `O_c = Z + cO_K`, proper invertible ideals, `Pic(O_c)`,
  conductor-change maps, ring class fields and Artin maps; **HE.1** CM points.
* `SieveMethodsAndPrimePatterns` **SV.0–SV.2**: sieve data and local densities, Brun and Selberg sieves, the
  large sieve with duality and bilinear decompositions.
* `AnalyticNumberTheory` **AN.1/AN.3/AN.5**: Dirichlet `L`-functions, density estimates, multiplicative functions.
* `ShimuraVarieties` **V4** the reciprocity formula at special points; `HilbertModularVarietiesAndShimuraCurves`
  **R18.1** the quaternionic curves; `LogicAndDefinabilityInNumberTheory` **LD.6** the Pila–Zannier route to
  André–Oort.
* The **Tau Ceti** roadmaps: global number fields, layer 11 ("orders and Picard groups", recording that Mathlib
  has neither) and quadratic form invariants, layer 2 (quaternion algebras and the splitting criterion). These
  are existing work and are never re-planned.

What no layer plans: joinings, measure rigidity, toral packets and their discriminants, homogeneous Hecke sets,
relative orbital integrals for the pair `(G^Δ, T^Δ)`, the GIT double quotient, or the mixing conjecture. Searches
return "homogeneous dynamics" and "Duke" only at GN.4 and, through it, at `ProbabilisticAndMetricNumberTheory`
PM.4.

## The routes

### 1. Part II of *Geometry of numbers, quadratic forms and homogeneous arithmetic* — 73 items

`GeometryOfNumbersPartIIToralJoinings`, area `classical`. It takes toral packets and their discriminants,
self-joinings, the residual quotient's role, measure rigidity in this setting, the quaternion coordinates and
local maximal orders, denominators and Bowen balls, the GIT double quotient and its invariant theory,
homogeneous Hecke sets and their volumes, the pair cross-correlation with its geometric expansion and orbital
integrals, the arithmetic invariant map, and the assembly of the proof.

**Why this parent.** GN.4 names Duke-type arithmetic applications as its target; this paper is exactly such an
application pushed one step further, and its own subject — quadratic orders, binary quadratic forms, the ellipse
cut out by the reduced norm form — is the parent roadmap's subject. **The alternative** is a new roadmap in the
`automorphic` galaxy, since every object lives on `[(G × G)(A)]` and the residual spectrum and Hecke
correspondences of `AdelicAlgebraicGroups` are used throughout; the route's `reason` says so, and the brief
transfers unchanged with GN.4 becoming an import.

### 2. Source of *Sieve methods, prime gaps and prime patterns* — SV.0, SV.1, SV.2 — 18 items

Section 9 is a self-contained piece of analytic number theory that belongs in the sieve roadmap: an upper bound
for `Σ_{(x,y) ∈ E ∩ Z²} f(Q(x,y))`, uniform in a multiplicative `f` of class `M(A,B,ε)`, in a binary polynomial
`Q` with `ρ̃_Q(p^k) ≤ Cp^{k(2−r)}`, and in a convex domain `E` whose curvature is controlled by its area — the
uniformity is essential, because the ellipse's eccentricity grows. The route carries the local densities with
their singular correction, DeMillo–Lipton–Schwartz–Zippel, the large sieve on a convex domain, the extension of
the level of distribution, the decoupling inequality for multiplicative functions, the three averaging lemmas
giving the exponential saving, the congruence variants, and the "points on conics" appendix — the `Z_p`-normal
forms including the dyadic case, the densities at regular and at singular primes, and the uniform bound
`ρ_Q(p^n) ≤ 16p^{3n/2}` which is precisely the sieve's hypothesis with `r = 1/2`.

### 3. Source of *Heegner-point Euler systems and arithmetic descent* — HE.0 — 15 items

Two blocks. The **orders attached to a homogeneous toral set**: `Λ_v = E(Q_v) ∩ g_vO_vg_v^{-1}`, its local form
`Z_v + 𝔣_vO_{E_v}` with Galois stability, the local and global discriminants, `Λ = ∩_{v≠∞}Λ_v`, the ideles-to-ideals
map, and the different of a local quadratic order with `Nr 𝒟_v = D_v`. And the **principal genus theory
appendix**: the short exact sequence realising `Pic(Λ)/Pic(Λ)²` through the adelic norm and `χ_E`, the index as a
product of local norm indices, `Nr Λ_v^×` for a non-maximal order with every dyadic case, the principal genus
theorem deciding membership in `Pic(Λ)²` by Kronecker characters evaluated at the norm, and the Galois cohomology
of the local unit groups computing `Pic(Λ)[2]`. All of it is Gauss genus theory for an arbitrary quadratic order,
written adelically.

### 4. Source of *Adelic algebraic groups and arithmetic quotients* — AA.4 — 2 items

The compact abelian quotient `G_res = G(Q)\G(A)/G(A)^+`, and the theorem describing how the pushforwards of a
sequence of periodic toral measures to `G_res × G_res` behave — converging to Haar on a coset of the diagonal
when the splitting fields are all distinct or all equal, and in general not converging at all. That is what makes
the conclusion of the main theorem sharp.

## Prerequisites the atlas does not cover

Thirteen. The load-bearing ones: **Einsiedler–Lindenstrauss** (the joining classification, the engine of the
rigidity half); **Duke** and **Iwaniec** (the one-fold equidistribution used in each coordinate);
**Michel–Venkatesh** (where the mixing conjecture is stated); **Ellenberg–Michel–Venkatesh** (the previous proof
under `𝔑 ≪ |D|^{1/2−η}`); **Einsiedler–Lindenstrauss–Michel–Venkatesh**, both papers (toral packets and the local
discriminants adopted verbatim); **Khayutin's own earlier paper**; **Reiner** (maximal orders in quaternion
algebras, Hasse–Schilling–Maass); **van der Corput** and **Huxley** (the admissible lattice-point exponents);
**Pila** (André–Oort for `C^n`); and **Zhang** (equidistribution of CM points on quaternionic Shimura varieties).

## Mistakes found in the source

Three, all `affects: nothing`, all recorded against **arXiv v3 only**. The source is otherwise clean on the
mechanical checks: **no duplicate labels**, and exactly one cross-reference whose hand-typed name disagrees with
the type of the environment it points at.

1. **E1 — a Proposition called a Lemma.** The proof of Proposition 56 says "Applying Lemma
   `\ref{prop:Omega_xi_Omega-reduced-norm}`…"; that label is on **Proposition 54**, the statement that every
   `h ∈ Ω_vx_vΩ_v` has a representative `r ∈ O_v` with `|Nrd(r)|_v Denom_v(x_v) = 1`.
2. **E2 — "principle" for "principal", three times.** Definition 12 says the invertible proper `Λ`-fractional
   ideals "are exactly the locally **principle** fractional ideals"; the same slip recurs in the proof of
   Proposition 45 and in the appendix, where the notation `Princp(O)` for the same objects fixes the intended
   word.
3. **E3 — "identity" for "identify".** Definition 35: "Using this isomorphism we **identity** henceforth
   `B_E = M_{2×2,E}`", the identification on which every computation of §§5–6 rests.

Three further pure spelling slips are **not** recorded in the register because they change nothing a formaliser
would read: "algerbraic" for "algebraic" in Corollary 27, "Anrdré-Oort" in §1.1, and "abe to locate" in §5.

I also checked the quantitative claims that could hide an error and found none: the area `2πκ√|D|` of the ellipse
`{q ≤ κ|D|}` for a positive definite form of discriminant `D`, the curvature bound
`R_max ≤ √(A(E))(√|D|/𝔑)^{3/2}` (which for a reduced form `ax² + bxy + cy²` with `a ≍ 𝔑` is `≍ |D|/a^{3/2}`), the
index `p_1^{2n}` of the Bowen ball, the volume `Denom·∏(1 + 1/p)` of a Hecke correspondence, and the compatibility
of `ρ_Q(p^n) ≤ 16p^{3n/2}` with the sieve's hypothesis `r = 1/2` all check out.

## Judgement calls a reviewer should check

* **The parent of the Part II** — `GeometryOfNumbersAndQuadraticArithmetic` against a new roadmap in the
  automorphic galaxy, argued above and in the route's `reason`.
* **Where §9 goes.** I routed the whole two-dimensional sieve, and the appendix on points on conics, out of the
  Part II and into the sieve roadmap, on the ground that the theorem is stated and proved for an arbitrary binary
  polynomial and an arbitrary convex domain and is of independent use. A reviewer who prefers to keep the proof
  of a paper together should move those 18 items back.
* **The principal genus appendix** is routed to HE.0 rather than to GN.3 ("Reduction, mass and theta series").
  Both are defensible; HE.0 was chosen because it owns `Pic(O_c)` for a non-maximal order, which is what the
  appendix is about, and because the statements are about ideals rather than about forms.
* **Bundled statements.** Several items bundle two or three consecutive numbered statements whose content is one
  mathematical step; the `locator` of each such item lists all the numbers it covers, and every one of the 175
  numbered statements that is not a pure Remark is accounted for.
* **The conjectures** of §1 are recorded as items of kind `theorem` whose names begin "The mixing conjecture" and
  "Equidistribution of Galois orbits", following the convention of the earlier extractions here; their notes say
  they are open.
