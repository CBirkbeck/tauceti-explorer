# REV-RT-PAPER-MOK-PILA-TSIMERMAN-19

Reviewer: Codex, session `codex-a71f92`. Source inspection: 30 September 2026.
Issue: [#4094](https://github.com/CBirkbeck/tauceti-explorer/issues/4094).
Input commit: `ab2364e14dcaa1f60f27033ed9daff1432cc7776`.

## Verdict and independence

All thirteen findings are confirmed: eight high and five medium. Confirmation
means the named extraction contract needs the stated change, not that every
proposed replacement theorem has been proved. Findings 2, 5, 6 and 9 especially
need the qualifications below. The companion JSON contains one verdict for
each exact finding ID.

The red team is Codex `codex-rtOQ9t`; the extraction is Claude Code
`cc-7b31c4`; its review is Claude Code `cc-442dc5`. This session did none of
those three jobs excluded by the issue.

There is prior related involvement: this session reviewed
`REV-ERRATA-PAPER-MOK-PILA-TSIMERMAN-19` on 23 September 2026. Findings 3, 4,
5 and 12 concern failures to propagate those accepted, separately recorded
errata into another worker's extraction. This report checks that propagation
and the current red-team evidence; it does not independently re-review or
modify this session's old errata verdicts. Those corrections are prior
evidence, not new discoveries by this verification.

## Sources and inspection ledger

The freely available primary sources were freshly downloaded and personally
read, including proofs, context and bibliography:

- [Published Annals article](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p07-s.pdf),
  189 (2019), 945–978: all 34 pages. SHA-256
  `1eab0797914752bdc91b4f46692f0a5716be2cc9e0d2dd96b478f1cdb762a0ab`.
  Page images 966, 971 and 974 were additionally inspected.
- [arXiv v3](https://arxiv.org/pdf/1711.02189v3), 20 September 2018:
  all 29 pages. SHA-256
  `b3de4f10ea6243fafcfc4a12adc939b1c8c6fab620afa00d2860d5313e1c0167`.

Both hashes match the red team's recorded copies. The following repository
inputs were read in full at the input commit: the red-team JSON and report;
the accepted extraction's 44 items, 13 prerequisites, three routes and eleven
embedded source issues; its reader and extraction review; and the separate
errata JSON (nine issues and its accepted audit metadata) and reader.
The latter is not confused with the extraction's different embedded E-number
series.

For the finding that cites a library declaration, I personally read
`TauCeti/Geometry/Hodge/Structure.lean` at the exact Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, including
`TauCeti.Hodge.HodgeStructureOn` at line 62 and `piece` at line 156.
Mathlib's programme pin remains
`082e2d37e8b0463410cdb532e111cd43d5a66174`; no finding here requires a new
positive Mathlib-availability claim. This verification does not certify
every extra library search listed in the red team's clean-check ledger.
The current ShimuraVarieties V0/V1 descriptions were also reread for the
effective-action comparison.

## Finding-by-finding checks

### 1 — Adjoint Hodge weight: confirmed, high

Published §7.1 p.958 assigns weight zero; v3 §7.1 p.11 assigns weight two.
Item 20 retains the latter. The adjoint pieces have types
`(-1,1), (0,0), (1,-1)`, whose sums are zero. The pinned Hodge carrier takes
the weight as a parameter: opposedness uses the conjugate filtration at
`n+1-p`, and the piece has bidegree `(p,n-p)`. Thus a weight change affects
the formal interface, not merely a heading.

Use the published weight and a version-scoped correction record showing that
print already corrects v3. The generic Hodge carrier does not itself implement
the specialized adjoint construction; retain that as the existing ShimuraData
D2/D3 import.

### 2 — Weighted quotient and functoriality: confirmed, high, scoped

Published §9.2 p.966 and v3 §9.1 p.19 display the unpunctured quotient used by
item 41. In a curve fiber, order and arity one give coordinates `(a,s)`
with weights `(1,1)`. Every nonzero orbit specializes to the origin. The
unpunctured orbit quotient is not the projective line; its affine invariant
quotient is a point, and the stack quotient retains a full multiplicative
stabilizer at zero. The punctured quotient gives the desired projective line.

Specify removal of the constant-jet, `s=0` locus, or use a justified relative
weighted Proj construction. Higher jet transitions still need gluing proofs;
one must not pretend all higher jets form an ordinary vector bundle.

After puncturing, a constant map sends every nonconstant boundary jet to the
excluded origin. This obstructs the *induced quotient map* on that boundary;
it is not a proof that no other extension could exist. Automorphisms preserve
the locus, as required for the group action. Arbitrary-morphism functoriality
needs a restricted domain or a separate extension argument. Weighted-projective
notation might implicitly intend puncturing in the source; the atlas's
literal formal construction must nevertheless state it. No conclusion of
Ax–Schanuel is refuted by this clarification.

### 3 — Direction of functional dependence: confirmed, high

Published §12.2 p.972 / v3 p.24 and item 32 have the reversed rank test.
For `p₁=(t,s), p₂=t`, dependence is a projection, but the joint rank is two
and `rank(p₂)=1`. Conversely `p₁=t, p₂=(t,s)` passes the printed test.
The right side must be `rank(p₁)`.

Link accepted separate errata E7 and specify local analytic dependence at
regular points, not necessarily a rational expression. The applications that
already assume equal ranks do not change. This is a propagation fix, not a
new independent errata verdict.

### 4 — Formal jet matrix versus rank of the base: confirmed, high

Published §12.4 p.974 / v3 p.26 uses an inverse of the moving base and equates
its rank to `dim U`; item 43 repeats the equality. The accepted separate
errata E6 gives an open-base example on an unramified modular curve: independent
parameters `a,b`, `b≠0`, and input second jet `(a,b,0)`. Its graph has
coordinates

`(a,b,0; q(a), q′(a)b, q″(a)b²)`.

The first two coordinates give a two-dimensional locus, whereas its base
`z=a` has rank one. The invertible formal first derivative `r=b` is not
the actual derivative of the varying base with respect to both parameters.

The chain rule instead gives `R=(Dq)r`, hence `Dq=Rr⁻¹`. At higher orders
one subtracts lower-order terms and inverts the action of `r` on the
appropriate symmetric tensor power. The differential inequality uses the
base rank; the generic-fiber inequality accounts for the extra parameters.
Carry accepted E6 into item 43. This repair remains conditional on a sound
differential theorem and does not re-prove it globally. The direct §10 proof
is a different argument.

### 5 — Differential characterization obligations: confirmed, high

Items 30–31/33 do not propagate accepted separate E4/E5. Published Lemma 11.1
p.969 / v3 p.22 counts every strict jet-stabilizer inclusion as a dimension
drop. The recorded compact-dual germ

`X(t)=tI+t³diag(1,0)+t⁴[[0,1],[1,0]]`

has third/fourth stabilizers of orders two and one in PSp₄, both dimension
zero. The prior accepted audit establishes this finite drop. What remains
open is a replacement finite-order determination/uniqueness proof; the
existential lemma, or the possible bound `m=dim G`, is not thereby disproved.

Published Theorem 11.3 p.971 / v3 pp.23–24 only links the zeroth-order value
to `u`. Its displayed foliation does not explicitly impose `du=v₁dw`.
The accepted E5 example `w(t)=2t, u(t)=q(t), v(t)=J_rq(id_r(t))` lies on
the indicated orbit and leaf. Covering uniqueness locally forces a putative
fixed uniformizer at `w` to have first derivative `q′(t)/2`, while `v`
records `q′(t)`.

Add first-order or full chain-rule compatibility, retaining domain and lifting
conditions. On a fixed leaf, writing its parameter as `s` gives
`du=v₁ds`; invertibility and compatibility force `s=w+c`, with the constant
translation absorbed locally. This supplies a local missing step only.
The global characterization and its use in differential Ax–Schanuel remain
explicit design/proof obligations, not completed repairs.

### 6 — Volume growth upstairs: confirmed, high

Item 16 places growth on the quotient, while the counting in published
Lemma 4.3 p.955 / v3 p.9 needs an upstairs lift crossing fundamental domains.
A finite-area torsion-free modular curve, as a subvariety of itself, has every
quotient ball bounded by its total area. No positive exponential lower bound
can hold for all radii. A zero-dimensional point also rules out an
unqualified dimension-zero assertion.

Require a positive-dimensional analytic lift in the Hermitian domain, not
a quotient subvariety; correct the ill-typed intersection expression and
preserve the separate uniform bound for each fundamental-domain piece.
This verification has **not acquired the primary Hwang–To proof**. The exact
closedness, metric, center, multiplicity and constant hypotheses must be
located there before the supplier is decomposed. The counterexample
establishes the extraction error without certifying a stronger replacement.

### 7 — Effective action before freeness: confirmed, high

Item 22 and its consumers export freeness for the extraction's general
semisimple group. Published Proposition 7.2 p.959 / v3 p.12 needs an effective
interpretation. The nonidentity `−I∈SL₂` acts as the identity Möbius map
and fixes every jet. The published introductory Sp₂g example also has a
central kernel. Neat arithmetic level removes stabilizers of the chosen
discrete group, not the kernel of the whole complex algebraic group.

ShimuraVarieties V0/V1 already require effective actions and effective deck
quotients. Use the effective image, or express the stabilizer as the kernel.
A finite center changes no dimension; a positive-dimensional inactive factor
does, so orbit dimensions must use `dim G−dim kernel`. Prove preservation of
the specific uniformization and the expected-dimension terms rather than
silently replacing a general group by an adjoint one.

### 8 — Contradiction context in stabilizer lemmas: confirmed, high

The source's §3.1 Hilbert-family setup has no atypicality assumption. Item 13's
statement exports its conclusion in that setup; mentioning induction in its
notes does not supply all hypotheses. For the full ambient
`W=Ω×X, U=D`, the ambient Hilbert point has no deformation as a closed
subscheme of that same dimension, and `Γ₀=Γ, Θ=G°`, not the identity.
A point on the graph at torsion-free level has trivial stabilizer, invalidating
an unconditional infinite-stabilizer reading of item 14.

Published §4 pp.953–955 instead works within a counterexample argument with
atypicality, weakly-special noncontainment, the relevant induction hypotheses
and a very-general replacement. Carry that context into items 13–14 and the
jet counterpart 29. This corrects extraction contracts, not the main theorem
or the contextualized source lemmas.

### 9 — Published two-sorted theorem: confirmed, medium

Published Theorem 1.2 p.947 gives

`dim(Y^zar)+dim(q(Y)^zar) ≥ dim Y+dim Y^WS`

for the smallest weakly special envelope. No accepted item states it or its
minimal-envelope interface. Add both to the existing Part II, coordinating
with item 2 rather than creating another owner.

This is a published-version completion: the extraction openly used v3, whose
Theorem 1.2 is a different theorem. Record the correspondence v3
1.2/1.3/1.4 → print 1.3/1.4/1.5, and v3 12.3/12.5 → print 12.1/12.2.
Also collate the full-restriction hypotheses in published 1.1 and 9.1.
Do not accuse the preprint locators of fabrication or silently overwrite them.

### 10 — Actual prerequisites and DOI strings: confirmed, medium

Published §7.3 p.960 refers to Mok's 1999 Contemp. Math. article, §2.3,
not the 1989 book in the prerequisite and reader. The two bibliographies
identify it as print [23] p.977 / v3 [24] p.28, DOI
`10.1090/conm/222/03174`. Optional compactification references are separate
Mok and Mok–Zhong works.

Print references [34], [5], [7] give, respectively:

- Scanlon: `10.1016/j.aim.2018.03.008`.
- Bertrand–Zudilin: `10.1515/crll.2003.008`.
- Daw–Ren: `10.1112/s0010437x1800725x`.

These disagree with the accepted prerequisite strings. Correct the links and
reader attribution. This is source-identity verification, not a proof audit
of those prerequisite papers.

### 11 — Keep arity fixed and order explicit: confirmed, medium

Published §5.2 pp.956–957 retains the original source arity in the nested jet.
Item 18 abbreviates `J_kX=J_k^{dim X}X` and then writes `J_aJ_bX`, so
nesting changes that arity. For `X=A¹, a=b=1`, fixed-arity nesting has
dimension four; applying the abbreviation again gives `J₁²(A²)`, dimension
six. Write `J_{a+b}^gX→J_a^g(J_b^gX)` with fixed `g`, including item 19's
identity and subvariety terms.

The source's `V_m^k` in §11 has order `m` and arity `k`; item 31's
order-`k` terminology must change. Use the published ring truncations
`a+b+1, a+1, b+1`. The corresponding v3 display has an off-by-one slip,
so the version supplying that correction must be explicit.

### 12 — Finite field generators, not a vector-space basis: confirmed, medium

Items 4–5 and the route retain finite C-basis wording from published
Theorem 1.3 p.948 / Corollary 9.3 p.965 and v3 pp.3/18. A nonconstant modular
function is transcendental over C; its powers are linearly independent.
The function field cannot have a finite C-vector-space basis.

Use finite field generators with their domain conditions, interpreting the
source charitably. Propagate accepted separate errata E3 and preserve its
version distinction: the published proof names the wrong coordinate field,
while v3 omits derivatives from its modular-function field. The valid
derivative-field conclusion should not be discarded. Embedded sourceIssue E3
is a different tangent-space typo.

### 13 — External rigidity theorem interfaces: confirmed, medium

Item 23 records the derived lower-order rigidity but only names its suppliers.
Published §7.3 p.960 / v3 pp.13–14 states their actual contracts. Theorem A
needs `n≥2`, a convex open subset of Cⁿ and a biholomorphism into Pⁿ
preserving affine-line intersections, giving a projective-linear extension.
Theorem B needs an irreducible compact Hermitian symmetric space of rank at
least two, connected opens and preservation of the distinguished highest-weight
projective tangent orbits, giving an automorphism extension.

Inventory these as two external-theorem items, with the tangent-orbit/VMRT
interface, in the existing Part II; correct the Mok/Ochiai supplier records
and make item 23 consume them. PROTOCOL §16 does not require fresh acquisition
and decomposition of every prerequisite proof to fix these missing statements.

## Validation and handoff limits

Only the issue's two review deliverables are changed. The accepted extraction,
prior errata, atlas data and upstream roadmaps are unchanged. Every confirmed
high/medium finding is intended for the subsequent fix job; proof obligations
above must remain explicit there.

The exact repository red-team checker is run against the review and its
unchanged sibling result. An additional assertion checks exact equality of
the thirteen ID sets and uniqueness, beyond the checker's dictionary-based
coverage test. Submission-path and private-path checks are run for the two
deliverables, and the publication diff is checked for whitespace errors.
Input freshness is checked before publication.

No Lean file is a deliverable. No Lean/Lake build, cache download, language
server or website build was run; Lean compilation is not applicable.
Neither the mathematical counterexamples nor the proposed repairs are claimed
formally verified. This report is not an author-approved erratum, a fresh
novelty search, or a certificate that the full Ax–Schanuel proof has no gaps.

Validation results: red-team review checker **ok**; exact thirteen-ID and
uniqueness assertion **passed**; intake **2 files, 0 problems**. A fresh main
comparison at `fd2c558a5a7e1620290b141b35a63f0298a1700d` found no changes in
the reviewed red-team, extraction, reader, review, errata or ShimuraVarieties
inputs, nor in WORKERS, PROTOCOL or the red-team checker.
