# Local dual and coefficient-base-change checkpoint — 2026-10-02

Agent: ChatGPT. Model: GPT-6 Astra Pro. Session: `gpt-6astra-20261002-c4d9`.
Refs #3342. Claim comment `5953359163`, accepted by bot comment `5953363266`.
Branch: `gpt-6astra-20261002-c4d9-stable-ii`.
Suggested-file commit: `34fe25173eec39675e16996e72d040669ca2b4cf`.

**Partial checkpoint, not completion, implementation or independent review.**
This continues merged PR #5761. It changes only the suggested Lean file and this
handoff. The roadmap, packet, definitive reader, all 83 node IDs, source routes,
requests and dependency edges are unchanged. All eight stages and the reserved
`StableReductionPartII:key/moduli-curves` remain partial. No implementation
status is upgraded and no packet gap is closed.

The complete preceding handoff, including the matrix-exactness/cokernel proof,
source hashes, intake repair, original source-reading boundaries and all earlier
continuation instructions, is preserved at this immutable repository version:

[Prior handoff, before this handoff replacement](https://github.com/CBirkbeck/tauceti-explorer/blob/34fe25173eec39675e16996e72d040669ca2b4cf/research/blueprint/handoff/DESIGN-StableReductionPartII.md).

Its blob is `8f2dde85c886a5d19703296319f693d3577ecad7`. Those historical receipts
retain their original authorship; they are not fresh checks by this worker.
The proof below restates the local prerequisites needed for this continuation.
The remaining-work section carries forward the global boundaries explicitly.

## Delivered and deliberately not promoted

Eight native candidates in the existing
`TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel` namespace:

1. `dualGenerator_existsUnique`: the actual R-linear dual generator, specified
   without a chosen inverse of a regular element.
2. `dualNormalForm`: a unique pair in R × A for every element of the dual.
3. `dualNormalEquiv`: the actual A-linear equivalence with R × A.
4. `dualResidue`: the quotient map, its exact kernel and its scalar law through
   the actual section evaluation R → A.
5. `dualScalarCorrection`: the correction term for the non-diagonal R-action,
   its product identity and both generator values with their signs.
6. `sectionIdeal_flat`: flatness of J over A.
7. `sectionDual_flat`: flatness of the actual dual over A.
8. `sectionDual_baseChange`: the natural coefficient-base-change comparison,
   with its evaluation formula on pure tensors and the images of J.

Four new native `example`s test the zero ring, the characteristic-three sign,
the absence of an R-linear splitting, and the nonflat coefficient map Z → F₂.
The original matrix definitions, all four earlier polynomial-model candidates,
all earlier examples, and the geometric omission ledger are preserved. Three
individual Mathlib imports were added: tensor-product basic operations, module
flatness, and ZMod. No new abstract node-ring, dual carrier or geometric Prop
placeholder is introduced.

These remain **candidate signatures**, not canonical packet exports. As in the
preceding checkpoint, the packet's `prototypeCoverage`, baseline declaration
records and reader have not yet integrated the local candidates. Their counts
are not increased. The existing compound exactness/cokernel node and the global
dual-section node still need declaration-sized decomposition with their IDs and
consumers preserved. The new local forms sharpen the integration work; they do
not conceal or close it.

The base-change signature records an A′-linear equivalence between actual
modules and fixes the natural evaluation map. Its full R′-linearity uses the
canonical identification R′ = A′ ⊗_A R and the scalar-action comparison below;
a corresponding native scalar-tower adapter has not been supplied. The global
sheaf theorem is not represented by this local signature.

## Local algebra, with all maps fixed

Let A be any commutative ring and let γ, δ, s, t be elements of A. Set

    q(X,Y) = X² + γXY + δY²,
    R = A[u,v]/(q(u,v) − q(s,t)),
    c = u−s,  d = v−t,
    b = u+s+γt,  a = δv+δt+γu,
    J = (c,d),  D = Hom_R(J,R).

We write ι:A→R for the coefficient map and ev:R→A for evaluation at (s,t).
Coefficient images are suppressed only in the displayed mathematical formulas.
Then bc+ad=0. The two matrix factorizations of the previous checkpoint use
Φ=((a,b),(-c,d)) and Ψ=((d,-b),(c,a)). Their exactness and cokernel maps remain
separate inputs in the original local-algebra continuation.

The following elementary argument needs neither Noetherianity nor a unit
discriminant. This greater generality is a derivation for this explicit
polynomial model, not a claim that Knudsen printed Proposition 3.1 with those
hypotheses removed. It does not assert that a degenerate quadratic defines a
nodal curve.

### 1. Normal forms and the regular coordinate

For nonzero A, monic division in u gives a unique representative

    r = p(v) + u q₁(v),   p,q₁ ∈ A[v].

Thus R is free over A[v] with basis 1,u. In the zero ring the same normal-form
assertion is immediate because every relevant set has one element; a proof
must not apply a positive-degree lemma requiring nontriviality without this
case split.

Multiplication by v−t is injective on A[v], by its monicity. It is therefore
injective on each coefficient of the normal form, and d is regular in R.
The coefficient map ι is injective and ev∘ι=id_A. The kernel of ev is exactly
J: successive division by u−s and v−t gives the usual evaluation kernel, and
the defining equation is already in that ideal. In particular

    0 → J → R → A → 0

is split as a sequence of A-modules. This splitting is not R-linear when A is
nonzero.

### 2. Constructing the genuine dual generator

For j=cx+dy define

    ε(j) = −ax+by.

If cx+dy=0, multiplication by b and bc=−ad give

    d(−ax+by)=0.

Regularity of d shows that the formula is independent of the representation
of j. It is R-linear and satisfies

    ε(c)=−a,   ε(d)=b,   d ε(j)=bj.

Conversely the last identity determines ε uniquely, again by regularity of d.
This constructs an element of Hom_R(J,R); no element 1/d in R is assumed.
The fractional notation b/d is a convenient description after localization,
not a replacement for this construction.

### 3. Generation of the dual by 1 and ε

Every h∈D satisfies d h(c)=c h(d). Modulo d the ring is

    R/dR = A[u]/((u−s)(u+s+γt)) = A[u]/(cb).

The annihilator of c in this quotient is (b). Indeed, lift an equation cH=0
to A[u], obtaining cH=cbQ, and cancel the monic polynomial c=u−s in A[u].
Thus H=bQ modulo cb. This cancellation works with zero divisors in A.

It follows that h(d)=dr+bz for some r,z∈R. The map
h−r·incl−zε kills d. Any R-linear map k:J→R satisfies

    d k(j)=j k(d),

so a map killing d is zero. Hence h=r·incl+zε.

Write z=ι(ev z)+cx+dy. The identities cε=−a·incl and dε=b·incl reduce the
coefficient z modulo J. We obtain

    h = r₀·incl + ι(α)ε,   r₀∈R, α∈A.

For uniqueness suppose r₀·incl+ι(α)ε=0. Evaluation on d gives

d r₀+ι(α)b=0. Write r₀=p(v)+u q₁(v) in normal form. The coefficient of u is

    (v−t)q₁(v)+α=0.

Evaluation at v=t gives α=0, after which d r₀=0 gives r₀=0. Therefore

    D ≅_A R ⊕ A,
    (r,α) ↦ [j ↦ rj+ι(α)ε(j)].

The residue ρ:D→A is the second coordinate. It is surjective, ρ(ε)=1, and
its kernel consists exactly of multiplication maps R→D. Those multiplication
maps are injective because they can be tested on the regular element d.
Consequently D/R≅A with the specified generator, not just an abstract cyclic
quotient.

### 4. The R-action and its correction term

The A-linear splitting is not componentwise R-linear. To describe the action,
write r=p(v)+u q₁(v) and perform exact division in A[v]:

    P(v) = (p(v)−p(t))/(v−t),
    Q(v) = (q₁(v)−q₁(t))/(v−t).

These are polynomials; the displayed fractions are exact polynomial quotients.
Define

    K(r) = b(P(v)+uQ(v)) − a q₁(t).

Expansion of r−ι(ev r) gives

    r−ι(ev r)=d(P(v)+uQ(v))+c q₁(t),
    dK(r)=b(r−ι(ev r)).

The regularity of d proves that K is uniquely determined and A-linear. It also
proves the twisted product identity by multiplication and cancellation:

    K(rz)=rK(z)+ι(ev z)K(r).

In particular K(c)=−a, K(d)=b and K(ι(α))=0. The actual R-action in the
normal coordinates is

    z·(r,α) = (zr+ι(α)K(z), (ev z)α).

Thus ρ(z·h)=(ev z)ρ(h). The quotient is the section module A, with precisely
this R-action. Forgetting K would turn the A-linear splitting into the false
R-linear direct-sum assertion.

For nonzero A, no R-linear section of a residue surjection exists. If
σ:A→D is R-linear for this section action, ev(d)=0 gives dσ(1)=0. Since d
acts injectively on D pointwise, σ(1)=0. A right inverse of ρ would instead
give ρσ(1)=1. The contradiction is the new typed non-example. There is still
an A-linear section α↦ι(α)ε.

### 5. Flatness and arbitrary coefficient base change

As an A-module R is free with basis vⁿ and uvⁿ, n≥0. The split evaluation
sequence makes J a direct summand of this free module, so J is A-flat.
The displayed D≅_A R⊕A makes D A-free, hence A-flat. Neither conclusion
asserts R-flatness of J or invertibility of the section ideal.

Let f:A→A′ be any ring homomorphism. Use primes for the same polynomial
construction with mapped coefficients. Monic normal forms identify the
canonical map A′⊗_A R→R′ as an isomorphism. Tensoring the split evaluation
sequence identifies A′⊗_A J with J′, with c and d mapped to c′ and d′.
No flatness of f is required.

Under these maps the dual generator goes to ε′. The identity

    d′ φ(ε(j)) = b′ φ(j)

and regularity of d′ verify its values on the images of J. The formula for K
uses only polynomial coefficient operations and exact division by the monic
v−t, so it commutes with f. Both tensoring the old A-linear normal form and
forming the new one give R′⊕A′. The resulting comparison is therefore an
isomorphism, and its defining evaluation formula is

    (a′⊗h)(φ(j)) = ι′(a′) φ(h(j)).

This is the natural dual-base-change map. The images of c,d generate J′ over
R′, so these evaluations fix each resulting R′-linear map. The correction
formula verifies compatibility with the R′-action, rather than merely giving
an unrelated isomorphism of A′-modules. The new Lean candidate fixes the
natural evaluation and the A′-linear equivalence; the full native scalar-tower
comparison is still an integration task.

This is a polynomial-model proof only. It does not establish completed local
normal forms for an arbitrary nodal family, stable reflexivity in the source's
sense, faithful descent, or finite-presentation approximation from noetherian
to arbitrary bases. In particular it does not close
`StableReductionPartII:MC.2/dual-section-ideal` or the universal-curve theorem.

## Discriminating tests and executed regression checks

The four added native tests distinguish: a zero coefficient ring; the minus
sign ε(u)=−u over F₃ for u²+uv=0; A-linear versus R-linear splitting; and
coefficient base change along the nonflat map Z→F₂. The last test still uses
untruncated polynomial quotients. It is not the coordinate quotient y²=0
from the preceding checkpoint's counterexample.

Executed symbolic checks in the explicit quotient for
r=p₀+p₁v+u(q₀+q₁v) and z=z₀+z₁v+u(w₀+w₁v): the denominator-free K identity,
its twisted product law, K(c)=−a, K(d)=b, and K of a coefficient constant
is zero. All five checks pass. These are generic symbolic tests for the
specified polynomial inputs, not a substitute for the general proof above.

A separate exhaustive bounded-input regression uses the genuine untruncated
ring (Z/m)[u,v]/(u²+uv). For r=p₀+p₁v+u(q₀+q₁v), the dual element
r·incl+αε has generator values

    h(u)=u[(p₀−α)+(p₁−q₀)v−q₁v²],
    h(v)=p₀v+p₁v²+u[α+q₀v+q₁v²].

All m⁵ coefficient tuples give different value pairs for m=2,3,4,5:
respectively 32,243,1024,3125 inputs and the same numbers of distinct pairs.
Reducing all 1024 Z/4 inputs modulo 2 gives the 32 specified F₂ pairs with
32 inputs in each fibre. No relation vᴺ=0 was imposed, and no finite sample
is described as an enumeration of the infinite module or a tensor proof.

Receipt SHA-256:
`09d7c03e21ca945ef7c5abc6716855bf578afdcb3410b47b770b9d400db1d60a`.
The displayed formulas, input ranges and counts allow the regression to be
reconstructed without retaining scratch files. The checks are not Lean
elaboration, an independent mathematical review, or a global sheaf proof.

## Fresh source and baseline reading

Knudsen, *A closer look at the stacks of stable pointed curves*,
arXiv:1106.1588v2, 3 April 2012; published in JPAA 216 (2012), 2377–2385.
The versioned PDF URL failed, while https://arxiv.org/pdf/1106.1588 returned
a 17-page file displaying the v2 header. Read the header and Main Lemma,
then §3, Proposition 3.1 with its proof, Corollary 3.2, and §4, printed
pp.11–13. This is selected text reading, not a fresh whole-paper audit.
The PDF screenshot requests failed; no visual inspection or newly computed
PDF hash is claimed. The preceding workers' broader reads and hashes remain
historical in the immutable handoff above. Knudsen II's Appendix has not
been newly read here.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, inspected the actual
following source ranges:

- `Mathlib/RingTheory/AdjoinRoot.lean`, lines 30–235 and 265–440, blob
  `1945b7728630a10baf56374f183be1bcfa3727f0`: the quotient, inherited algebra
  structures, root/of, homomorphism extensionality, monic injection, `lift`
  and its generator equations, and `map` with its divisibility hypothesis
  and coefficient/root/composition equations.
- `Mathlib/LinearAlgebra/TensorProduct/Basic.lean`, lines 1–130, blob
  `8227c91e6c37dd509c47ca80aa2e8cb0896c4605`: balanced lifting, the actual
  linear/semilinear tensor lift and its pure-tensor equation.
- `Mathlib/RingTheory/Flat/Basic.lean`, lines 1–135, blob
  `b827fedf96ce35fa107badc6b41b7de0b8e14c66`: the actual `Module.Flat`
  definition and injectivity-preservation interface. The header lists free,
  retract and linear-equivalence results; their full proofs were not reread
  in this continuation.

These are selected source checks, not new canonical baseline records or a
claim to have inspected every transitive import. Final integration must read
and register each additional polynomial, quotient, tensor and flatness lemma
it actually uses. Current-head results must not be silently treated as facts
at the pinned Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`.

Read the accepted `research/blueprint/reviews/REV-AUDIT-02.md` in full, blob
`5684378f76a571d3b24d3ca604948f9a08f4977f`, and the selected current packet
nodes for the explicit matrices, exactness, dual section and expansion.
The aggregate `data/library-coverage.json` was not retrievable through the
connector in this session. The accepted review's checks of 519 citations are
its author's checks, not a claim that this worker reread all 519 declarations.
The parent/foundational geometry remains supplier-owned.

The continuous session read the upstream AdicSpaces and Multiquadratic reader
documents in full, and selected StableReduction/EllipticCurves material. The
preceding worker's full StableReduction/JacobianChallenge reads retain their
historical attribution. No upstream roadmap was edited or replanned.

## Validation and precise resume point

Read the suggested-file commit diff. It consists of three imports, eight
local theorem candidates, four native tests, the pluralized checkpoint header,
and the refined omission notice. No original declaration, test or omitted
geometric name was removed. The roadmap, packet and reader are unchanged;
this continuation does not claim to have rerun their graph/coverage checks.
Repository-local blueprint and atlas validators were not run in this browser
environment. The PR's Swarm submission check is the external validation gate;
its eventual result must not be conflated with the historical validator
success recorded in the archived handoff.

**Lean NOT COMPILED.** No existing built environment at the required pins was
available. No project, cache download, library build or language server was
started. All proof bodies are prototype `sorry`s; elaboration is not certified.
The pure-tensor evaluation formula is a mathematical specification, not a
compiled naturality theorem.

Before promoting any local candidate, integrate the prior exactness/cokernel
forms and the eight new forms into declaration-sized nodes, canonical names,
`prototypeCoverage`, baseline records and the definitive reader together.
Preserve the existing `node-factorization-exact` ID and all its consumers.
Separate monic normal forms, coordinate regularity, exactness, the two cokernel
maps, dual generation/uniqueness, residue/scalar correction and coefficient
base change. Reuse the existing owner of general matrix-factorization theory;
these are applications to this particular polynomial node, not a new generic
matrix-factorization library. Add the discriminating tests to the appropriate
API acceptance lists, without changing any implementation status from unchecked.

For the local dual comparison, supply actual native R′-scalar compatibility,
identity/composition coherence and the quotient comparison from the given
formulas. Read any required additional pinned declarations before citing them.
Elaborate only in an already-built pinned environment under the resource rules.

Then resolve the actual sheaf, completed-local, faithful-descent and stable-
reflexivity interfaces required by the global dual-section theorem; read the
Knudsen II Appendix and the finite-presentation approximation arguments.
The new polynomial proof does not remove these requirements.

The original 15 gaps and 135 supplier requests all remain open. In particular:

- MC.0–MC.1 still require actual pointed-family/moduli/descent carriers,
  Hilbert/Isom/deformation inputs, and DM §§2–4 valuative/algebraization proofs.
- MC.2 still requires completed-local/global passage, arbitrary-base
  approximation, collision charts and the rigid genus-one construction.
- MC.3 retains Ile's distinction between the 3.7 proof repair and the 3.9(b)
  counterexample, and needs a verified boundary-normalization source and
  genuine line/graph quotient interfaces.
- MC.4 retains full-level rigidity, tame/component and Teichmüller inputs,
  correct owner extensions for generic positivity, and the surface vanishing
  and genus-one positivity sources. These do not follow from local node algebra.
- MC.5 retains line-valued determinant/Deligne pairing and integral Noether
  inputs, keeping rank-g Hodge bundles distinct from their determinants and
  rational GRR distinct from integral tensor identities.
- MC.6–MC.7 retain relative curve Picard/Jacobian and strong Torelli ownership,
  all-characteristic compactified Torelli/Hodge comparisons, relative Picᵈ
  representability and the Brauer obstruction, with every Yuan/DGH consumer.

The exact source-locator, supplier and restructuring details for each item
are in the unchanged packet/reader and the immutable prior handoff linked
above. In particular the repaired 58 typed upstream references must not be
reclassified as baseline declarations or deleted to placate a checker.
No stage, shared key or global theorem is marked complete by this checkpoint.
