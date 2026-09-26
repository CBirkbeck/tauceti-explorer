# REV-AdicSpacesPartII — separated-completion checkpoint

Date: 2026-09-26. Reviewer: ChatGPT (GPT-6 Astra Pro), session
`gpt6-20260926-a73f2c`. Job: `REV-AdicSpacesPartII`, issue #344.
The author handoff identifies Claude Code, session `cc-e94dc5`; this is a
separate agent's review.

## Status and scope

**Partial review; not accepted, and not a completed review job.** This checkpoint
establishes one mathematical dependency failure in R0, supplies three explicit
regression examples, and gives a proof of the strengthened completion statement
needed to repair it. The packet and its suggested file have not been changed.
In particular, this report is not a substitute for the packet's eventual
`review` object and must not authorize promotion.

The reviewed packet snapshot is blob
`ef78e07f190e99151beba41edf6bdff09f506aad`, present at main commit
`28ed861858ba244d26285021d0761ed56384a958`. The suggested file snapshot is
`48d3c1bd7f2c84c74d4c2c7bbd5a33cb0d7961a1`. The author's handoff reports 494
nodes, 409 baseline declarations and 35 source issues. These are author-reported
whole-packet counts, not counts independently recomputed by this review.

The diagnosis below concerns these three nodes, with the prefix
`AdicSpacesPartII:R0/` understood:

| Node | What was checked | Result |
| --- | --- | --- |
| `strict-complex-completion-exact` | Stated separation assumptions, small-lift proof and suggested signature | The stated Hausdorff-input theorem is insufficient for both consumers below; its proof also needs the quantifier correction in Section 4. |
| `noetherian-rod-module-completion-tensor` | Use of the completion lemma on its presentation | The hypotheses permit a non-Hausdorff quotient module. The cited lemma cannot be applied. |
| `noetherian-rod-laurent-cech-strict` | Claim that the uncompleted terms are Hausdorff, and the final completion step | False for an explicit nonempty rational chart. |

`noetherian-rod-sheafy` and `noetherian-type-stably-sheafy` were followed as
consumers to establish the impact, not verified in full. Other R0 statements,
including the discrete sheafiness and fibre-product statements, were read in a
preliminary screen only. None receives a full-node verification verdict here.
R1, R2, R3, R4, R5, F0 and F1 remain unreviewed for acceptance purposes; reading
isolated passages is not stage coverage.

Counts for this checkpoint: one established dependency failure; three directly
diagnosed nodes; zero nodes corrected in place; zero nodes added; zero
whole-packet acceptance verdicts. The strengthened proof is proposed work for
integration, not a claim of Lean implementation.

## 1. Finding REV-AdicSpacesPartII/H1: a Hausdorff-only lemma is used before separation

**Severity: high for dependency closure.** The false assertion is in the
blueprint proof, not in the classical sheafiness theorem.

The completion node assumes a complex of *Hausdorff* abelian topological
groups. In contrast, the Laurent/standard-rational Čech node works with the
algebraic localisations before separated completion and asserts that these are
Hausdorff. Even a complete noetherian original ring does not ensure this for
the localisation topology. The module-completion node likewise assumes only a
Huber ring with a noetherian ring of definition, and does not assume that the
quotient in a finite presentation is Hausdorff.

The suggested signature faithfully reproduces the restrictive hypothesis:
`TauCeti.StrictComplex.completion_exact` has `[∀ i, T2Space (C i)]`. Thus this
is not merely a missing adjective in the narrative, and elaborating this
signature with `sorry` does not discharge its consumers' separation obligations.

### 1.1 Small example: the empty chart

Fix a prime p. Take B = C = Z_p, I = pZ_p, P = B and F = {p, 1}. These satisfy
the complete-Hausdorff and noetherian-ring-of-definition assumptions, and F
generates the unit ideal. For the chart with denominator p, the algebraic ring is

    E = B[1/p] = Q_p.

Its proposed ring of definition is

    D = C[F/p] = Z_p[1/p] = Q_p.

Its zero-neighbourhoods are I^n D = p^n Q_p = Q_p. Consequently E has the
indiscrete topology, is not Hausdorff, and its separated completion is zero.
There is no contradiction: the rational set |1| <= |p| != 0 is empty. This
already disproves the uncompleted-term assertion as written.

### 1.2 Nonempty chart: discarding empty opens does not repair the argument

Take instead

    B = C = Z_p × Z_p,  I = pB,
    f_0 = (p, 1),  f_1 = (1, 1),  F = {f_0, f_1},  P = B.

B is complete Hausdorff and C is noetherian; f_1 is the identity, so F generates
the unit ideal. Localisation at f_0 gives

    E = B[1/f_0] = Q_p × Z_p.

The idempotents (1,0), (0,1) belong to C, and f_1/f_0 = (1/p,1). Therefore

    D = C[F/f_0] = Q_p × Z_p,
    I^n D = Q_p × p^n Z_p,
    intersection_n I^n D = Q_p × {0}.

The element (1,0) belongs to every zero-neighbourhood. The topology is not
Hausdorff. The separated completion is Z_p, via projection onto the second
factor: the quotients by I^n D are Z_p/p^n and their inverse limit is Z_p.

This rational chart is nonempty. A valuation on a product kills one of the two
orthogonal idempotents. On the first component its defining inequality is
1 <= |p|, impossible for a continuous valuation on Z_p because p is topologically
nilpotent. On the second component it is 1 <= 1. Thus the chart is exactly the
second component Spa(Z_p,Z_p), not an empty open. The disappearing Q_p factor
is precisely what separated completion removes.

All computations in Sections 1.1–1.2 are reviewer calculations from the
localisation topology, rather than quotations attributed to Huber or Wedhorn.

### 1.3 A finite-module instance of the same failed dependency

Let A = Z with its p-adic topology, with the noetherian ring of definition A
itself. Choose a prime ell different from p and let M = A/ell A. The natural
module topology has neighbourhoods p^n M = M, since p acts invertibly on M.
Hence the nonzero finite module M is indiscrete.

The sequence

    0 -> ell Z -> Z -> Z/ell Z -> 0

is algebraically exact, with the subspace topology on ell Z and the quotient
module topology on the last term. Its maps are strict. Nonetheless it is not a
sequence of Hausdorff groups. The module-completion node therefore cannot
invoke the completion lemma in its present form, even though A itself is
Hausdorff. The desired conclusion remains correct in this example:
M-hat = 0 and M tensor_Z Z_p = 0 because ell is a unit in Z_p.

## 2. Evidence and pinned-library checks actually performed

The mathematical topology used in the examples agrees with the primary-source
construction, not with the usual p-adic topology on every displayed Q_p.
Wedhorn, *Adic Spaces*, arXiv:1910.05934v1, Proposition and Definition 5.51
(printed pp. 43–44) and Section 8.1 (printed pp. 73–74), constructs a topology
on the algebraic localisation and then takes its completion. The finite
presentation uses the ring generated by the ring of definition and the
fractions, with the extended ideal-of-definition filtration. No Hausdorffness
of the uncompleted localisation is supplied there. Theorem 8.28(a), printed
p. 81, is consistent with the intended sheafiness endpoint; it is not refuted
by these examples.

Source access: the arXiv PDF text layer for the passages just specified was
read, and the page image for printed p. 81 was inspected. Screenshot retrieval
for printed pp. 38, 43, 73 and 74 failed. Huber's 1994 full text was not
independently obtained in this checkpoint; its excerpts in the packet are
therefore not marked verified. There is no newly adjudicated `sourceIssues`
entry here and no allegation of an error in the published theorem.

Primary source: <https://arxiv.org/pdf/1910.05934>.

The following Lean statements were read at the required pins:

1. Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`,
   `Mathlib/Topology/UniformSpace/Completion.lean` (blob
   `e7e1caa48b7abeb673eed6a7d7f69cbbbf4cea8e`):
   `UniformSpace.Completion` is defined for an arbitrary uniform space;
   `UniformSpace.Completion.isUniformInducing_coe` and
   `UniformSpace.Completion.denseRange_coe` do not require separation of the
   input. `UniformSpace.Completion.coe_injective` requires `[T0Space α]`.
   This confirms that the existing completion object already has the right
   generality. It does **not** say that completion-exactness is already proved.
2. At the same Mathlib pin, `Mathlib/Topology/Maps/Strict/Basic.lean` (blob
   `b7493077416edadeef4ca0924721e133776001f8`):
   `Topology.IsStrictMap` means that the corestriction to the image is a
   quotient map; `Topology.IsStrictMap.continuous` supplies continuity.
   For a homomorphism of topological groups this is the intended open-onto-image
   condition: the inverse image of the image of an open set is a union of its
   translates by the kernel, hence open.
3. Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`,
   `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean`:
   `TauCeti.Huber.PairOfDefinition.locSubring` adjoins the distinguished
   fractions to the ring of definition;
   `TauCeti.Huber.PairOfDefinition.locIdeal` is the mapped ideal of definition;
   `TauCeti.Huber.PairOfDefinition.locIdealImage` maps its powers into the
   localisation's additive group. These definitions give exactly the
   neighbourhood computations in Section 1. No separation hypothesis is part
   of those definitions.

Permalinks:

- <https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean>
- <https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Maps/Strict/Basic.lean>
- <https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean>

These are targeted checks, not an audit of all 409 baseline entries. The library
coverage audit, the remaining prerequisite declarations and all 35 recorded
source issues still need independent reconciliation before a final verdict.

## 3. Repair: strict exact complexes of possibly non-Hausdorff groups

The right repair is not to add Hausdorff assumptions to the consumers: that
would exclude the rational localisations and finite modules they actually use.
Instead strengthen the existing completion lemma as follows.

**Proposed statement.** Let C^i be abelian topological groups with countable
bases of open subgroups; they need not be Hausdorff. Let d^i be continuous
homomorphisms. If the complex is algebraically exact and each d^i is strict,
then its Hausdorff completed complex is algebraically exact and every completed
differential is strict. Injectivity of an initial differential also passes to
completion. Completions use the canonical additive uniformities.

Here is a proof which makes the separation issue explicit. It can replace the
current Hausdorff-only argument. The image and kernel assertions are useful
intermediate lemmas if the implementation requires splitting this node.

### 3.1 Neighbourhoods in a separated completion

For a group G as above write i_G : G -> G-hat. If U is an open subgroup of G,
write U-hat for the closure of i_G(U). Then U-hat is an open and closed subgroup
of G-hat and

    i_G^(-1)(U-hat) = U.

For completeness, G/U is discrete, hence complete and Hausdorff; its quotient
map extends to G-hat. The kernel of this extension is U-hat. To see the reverse
inclusion in this kernel equality, approximate a point of the kernel by points
of i_G(G) inside the same open fibre; the corresponding elements lie in U.
Taking a decreasing countable neighbourhood basis U_n shows that the U_n-hat
form a neighbourhood basis. Equivalently, G-hat is the inverse limit of the
discrete groups G/U_n. The map from G to this inverse limit has dense image and
induces the original uniformity, whether or not its kernel is zero. In
particular, no injectivity of i_G is being used.

### 3.2 Completed image and strictness

Let f : G -> H be continuous and strict. Give E = f(G) the subspace topology
and let W be the closure of i_H(E) in H-hat. The map E -> W is uniformly
inducing with dense image, and W is complete and Hausdorff, so W is the
Hausdorff completion of E.

Choose decreasing open subgroups U_n in G with U_0 = G and forming a countable
basis. Strictness makes f(U_n) open subgroups of E, and they form a basis of E:
for any neighbourhood V in E, continuity gives U_n contained in f^(-1)(V).
Let W_n be the closure of i_H(f(U_n)) in W. By Section 3.1 these form a basis
of open and closed subgroups of W.

We claim that

    f-hat(U_n-hat) = W_n.

Continuity gives one inclusion. For the other, take y in W_n. Choose x_0 in U_n
such that y - i_H(f(x_0)) is in W_(n+1). This is possible because W_(n+1) is
open and i_H(f(U_n)) is dense in W_n. Having chosen x_0,...,x_(r-1), with the
remaining error in W_(n+r), choose x_r in U_(n+r) so that the new error is in
W_(n+r+1). The partial sums of i_G(x_r) are Cauchy, converge to an element of
U_n-hat, and their images converge to y. This proves the claim.

For n=0 it says that the image of f-hat is W. For arbitrary n it says that
f-hat is open onto W. Thus the completed map is strict and its image is the
closure of the original image.

### 3.3 Completed kernel

We also have

    ker(f-hat) = closure(i_G(ker f)).

Only the inclusion from left to right needs proof. Take x in ker(f-hat), and
choose a decreasing basis U_n in G. Openness onto E supplies an open subgroup
V_n of H such that

    E intersection V_n is contained in f(U_n).

For each n choose a_n in G so that i_G(a_n) approaches x, and so that
f-hat(i_G(a_n)) belongs to V_n-hat. Both conditions can be imposed
simultaneously: the relevant set is an open neighbourhood of x in G-hat,
its image under f-hat is centred at zero, and i_G(G) is dense. By Section 3.1,
f(a_n) lies in V_n, hence in f(U_n). Choose b_n in U_n with
f(b_n) = f(a_n). Then a_n-b_n belongs to ker f, while

    i_G(a_n-b_n) -> x,

because i_G(b_n) -> 0. This proves the kernel formula without assuming that
G or H is Hausdorff.

### 3.4 Exactness

Apply Sections 3.2–3.3 to consecutive differentials. Algebraic exactness gives
im(d^(i-1)) = ker(d^i); their images in the completion therefore have the same
closure. The two formulas give

    im(d-hat^(i-1)) = ker(d-hat^i).

Every completed differential is strict by Section 3.2. When d^0 is injective,
its completed kernel is the closure of the zero subgroup in the Hausdorff
completion, hence zero. This proves the strengthened statement.

This proof is a mathematical repair proposal. The completion API checks in
Section 2 support the choice of objects, not a claim that all supporting
neighbourhood lemmas or the strengthened theorem have been implemented.

## 4. Exact changes required on integration

1. In `R0/strict-complex-completion-exact`, remove the input Hausdorff assumption
   and specify **Hausdorff completion**. Replace the small-lift argument by
   Section 3, or by named lemmas with these precise image and kernel outputs.
   Preserve exactness and strictness conclusions.
2. Correct the neighbourhood quantifiers. The useful consequence of openness is
   **for every domain neighbourhood U, there exists a codomain neighbourhood V
   with E intersection V contained in f(U)**. The packet instead fixes the
   codomain index first and chooses a domain index. That reversed formulation
   does not supply lifts in a prescribed shrinking sequence of domain
   neighbourhoods. This is part of the same repair, not a second independently
   counted finding.
3. In `R0/noetherian-rod-laurent-cech-strict`, remove the assertion that the
   uncompleted terms are Hausdorff. Retain their countable open-subgroup bases
   and strict differentials, and invoke the strengthened lemma. Do not replace
   the uncompleted rings by their separated quotients without also proving that
   the required exactness survives that replacement.
4. In `R0/noetherian-rod-module-completion-tensor`, apply the strengthened lemma
   to the presentation with the natural module topology. Its quotient module
   need not be Hausdorff. Use the completed strict quotient to identify the
   topology, not merely an algebraic isomorphism of the completed modules.
5. In `suggested/AdicSpacesPartII.lean`, remove the input `T2Space` family from
   `TauCeti.StrictComplex.completion_exact` after aligning it with the repaired
   mathematical statement. Keep the existing countability, nonarchimedean
   group, continuity, exactness and strictness hypotheses. Recompile at the
   actual pins; no compilation claim is made here.
6. Add regression examples corresponding to Sections 1.1–1.3. In particular the
   nonempty product chart must compute its separation kernel as Q_p × {0}
   and its separated completion as Z_p. A test only for empty opens would miss
   the stronger obstruction. These are proposed acceptance checks; they have
   not yet been inserted into the packet or suggested file.
7. Update both downstream sheafiness nodes' dependency accounting. Recheck the
   strengthened lemma and all affected proof paths before recording corrected
   node verdicts in the eventual packet `review` object.

## 5. Remaining review and validation

The next reviewer must apply or independently reject the repair above, finish
source verification for this proof chain, and continue the all-node audit. In
particular: reconcile the library coverage audit; read every claimed baseline
statement at the pins; check every source locator/excerpt and each recorded
source issue; check all requests, ownership boundaries, API/tests, suggested
signatures, planet limits and stage coverage. Preliminary reading of other
nodes in this session is not evidence for accepting them.

No packet validator or Lean compiler was executed by this reviewer. No packet
JSON, suggested Lean, roadmap definition, production source or atlas data was
modified. A report-only submission check, if successful, cannot establish
mathematical completeness or compilation. The author's compilation claim has
not been independently reproduced.

The report is intentionally a checkpoint under WORKERS.md: retain the issue
for continued review rather than declaring the 494-node packet reviewed.
