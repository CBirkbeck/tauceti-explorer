# REV-RT-PAPER-FINTZEN-21

Codex — `codex-5ebb6f`, 2 October 2026, independent verification for issue #4072. **43 findings confirmed; /44 rejected.** The confirmed findings comprise five high, 25 medium and 13 low findings. The machine-readable decisions and individual source locators are in [RT-PAPER-FINTZEN-21.review.json](../redteam/RT-PAPER-FINTZEN-21.review.json). A confirmation verifies the defect; the reason qualifies or replaces a proposed repair where necessary. In particular, /11 must retain torus-fixedness and /20 must exclude the nonabelian half-depth boundary.

The reviewed repository snapshot is `d95ac7170c6bd773529b1f60b768b830d22a3651`. This worker did not write the extraction, its accepted review or the red-team findings. I independently read all 44 findings, the 108 extracted statements and their notes, the four route briefs, prerequisite records and five existing source issues. I checked the affected extraction/report passages and the named ownership contracts, rather than accepting the previous review's inventory or its library searches as evidence of completeness.

The principal source is [Types for tame p-adic groups, arXiv:1810.04198v2](https://arxiv.org/pdf/1810.04198v2), 3 November 2020, 39 PDF pages, SHA-256 `bd332fd73956082656d767870566fdafd0fce3d834cccb223779a7724c3da8cc`. I read every page, including proofs and bibliography, and inspected rendered pages 18, 23, 28 and 29 to check the equations used in /2–4 and /40. All page locators below refer to this version. The [published article's landing page](https://annals.math.princeton.edu/2021/193-1/p04) identifies Annals 193 (2021), pp.303–346. The published PDF was not obtained, so the local source errors are certified only for v2.

Additional public primary sources were read at the relevant statements and surrounding arguments, not from beginning to end:

| Source | Independently checked passages | SHA-256 of acquired PDF |
| --- | --- | --- |
| [Fintzen, On the construction of tame supercuspidal representations, 1908.09819v2](https://arxiv.org/pdf/1908.09819v2) | Theorem 3.1, Remark 3.2 and the MP96 citation in Remark 2.3 | `b3dd2383195b03ae0db91b9649efe72049336f99d9c604962e6dfa332b756457` |
| [Fintzen–Kaletha–Spice, 2106.09120v2](https://arxiv.org/pdf/2106.09120v2) | Definition 4.1.10, Corollaries 4.1.11–12, Theorem 4.1.13 and its preceding twist construction | `126958839c2203b485d22ec960f8e0f6a795d00103adadb6c184aa6edb75b51a` |
| [Adler–Fintzen–Mishra–Ohara, 2408.07805v1](https://arxiv.org/pdf/2408.07805v1) | Remark 4.1.7 and the adjacent qualification concerning extension of a quadratic twist | `e61ea3ecb7d33240fe072c5a4fa5f947907e8bfab5c3b14d4b94798fba3e140a` |
| [Kim–Yu, 1612.04204v1](https://arxiv.org/pdf/1612.04204v1) | Sections 3.5–3.6 and the cover statements in 7.4–7.5 | `56df40e3b35d6deb1ec6bd534395d9a84547e18a5d1db8a8537a8ac81870a6df` |
| [Adler, Refined anisotropic K-types and supercuspidal representations](https://msp.org/pjm/1998/185-1/pjm-v185-n1-p01-p.pdf) | Propositions 1.4.1, 1.9.1 and 1.9.3, Remark 1.9.4 and Definition 2.2.4 | `4210b2d0c166d5e5312f1691c1c712455b1dfe92d2d496a9cc5c698fa5954ce0` |

A fresh correction search on 2 October checked the [arXiv version history](https://arxiv.org/abs/1810.04198), the journal landing page, the [author's publication list](https://www.math.uni-bonn.de/people/fintzen/research.html) and title/identifier searches for an erratum or correction on those primary sites. No matching published correction was found. This records the search, not priority of discovery or identity with the journal text. The Yu construction correction is independently documented in the primary papers above; it is not a newly alleged literature error.

Some cited originals could not be verified at their requested locators. The AMS Yu01 endpoint returned HTTP 403; the MP96 endpoint returned a verification page; the Adler–DeBacker PDF could initially be opened as text but the target retrieval/rendering subsequently failed; the requested KM03 source was not obtained. The full Conrad, Borel–Tits, Bourbaki and Borel source statements were not reread. Findings /10, /12–13, /17, /25 and /27–29 therefore establish missing inputs from their explicit uses in Fintzen, with the accessible Adler statements separately checked. They do not certify that the unread originals or the proposed weaker-hypothesis adaptations close those inputs. The fix must expose those leaves and verify their precise statements before declaring closure. In particular, /28 must reconcile Fintzen's MP96 Proposition 6.6 citation with the later construction paper's reference to the proof of Proposition 6.8.

| Finding | Verdict | Verified defect and repair qualification |
| --- | --- | --- |
| /1 | Confirmed, high | The proposed form/prime-arithmetic imports cycle. Place the form after arithmetic in the generated Part III; coordinate /18 and recompute final counts. This is a design-contract cycle, not an installed stage-graph claim. |
| /2 | Confirmed, high | Changing the building point invalidates the displayed equal-filtration assertion. The resulting lower-semicontinuity gap needs a proof; a fixed-point substitute is not yet a proved repair. |
| /3 | Confirmed, high | Lemma 5.1 gives false exact functional identities. Use conductor-compatible congruences and prove the resulting character identities. |
| /4 | Confirmed, high | Ordinary half-depth H-products do not equal the mixed products, and the printed quotient has extra center. Redefine with mixed groups and recheck the ensuing Heisenberg/tensor arguments. |
| /5 | Confirmed, high | Exhaustion imports the uncorrected Yu/KY construction proof. Supply corrected irreducibility and cover results, with the quadratic twist on the full type group. |
| /6 | Confirmed, medium | General structural inputs depend unnecessarily on downstream data. State them for eligible Levi pairs, tori and points, then specialize. |
| /7 | Confirmed, medium | The shared connected finite-cuspidality predicate has an inverted owner. Put it in the finite-reductive foundation; preserve Stevens's disconnected specialization. |
| /8 | Confirmed, medium | Accepted BHKT prime-arithmetic requests overlap. Share their common supplier, retaining Fintzen's additional root/coroot/subsystem conclusions. |
| /9 | Confirmed, medium | Accepted affine orbit-theory routes were overlooked. Share common foundations, retaining the distinct rational perfect-field Kempf theorem. |
| /10 | Confirmed, medium | Yu's torus-fixed coadjoint-centralizer supplier is omitted. Extract its root-datum and characteristic conditions. |
| /11 | Confirmed, medium | The restriction/depth supplier is omitted. The proposed arbitrary-X version is false; retain T inside the coadjoint centralizer. |
| /12 | Confirmed, medium | Good semisimple Lie elements and the KM/AR bridge are omitted. The advertised weaker-characteristic adaptation remains a proof obligation. |
| /13 | Confirmed, medium | Six classical suppliers are hidden in prerequisites. Existing rank-two Weyl results are partial suppliers, not the all-rank tables. |
| /14 | Confirmed, medium | Levi filtration intersections and filtered orthogonal splitting are missing. Require an eligible Levi-building point and the form hypotheses. |
| /15 | Confirmed, medium | Tame Galois building descent and a rational torus-apartment point are missing; field theory alone does not supply them. |
| /16 | Confirmed, medium | Dual base change and fixed-point depth compatibility are missing. State the needed global inequality; stronger global equality requires another argument. |
| /17 | Confirmed, medium | The Lie-to-dual transfer and removal of MP94's simply-connected hypothesis are conflated. Separate them. |
| /18 | Confirmed, medium | The all-tori Weyl-order consequence belongs after prime arithmetic. General building construction takes individual tame tori as hypotheses. |
| /19 | Confirmed, medium | Auxiliary tori must contain the point in their apartments. Restrict independence to eligible tori and splitting extensions. |
| /20 | Confirmed, medium | A group/Lie quotient supplier is missing. Strict complementary depth above half the denominator cutoff is necessary for the claimed abelian quotient. |
| /21 | Confirmed, medium | Metric, pointwise depth and nearby-point/jump APIs are missing. Reuse RG2's compactness-mod-center supplier and consolidate the metric request. |
| /22 | Confirmed, medium | H-filtration compatibility and the centralizer of the sum are missing. State general structural results first; handle connected depth zero and the empty sum. |
| /23 | Confirmed, medium | The every-maximal-datum criterion needs an additional D2 perturbation argument, preserving the terminal facet/Levi data. |
| /24 | Confirmed, medium | Compact smooth Gallagher factorization needs a supplier. Reduce to a finite quotient and reuse existing finite Clifford theory. |
| /25 | Confirmed, medium | Polarization and Heisenberg-subgroup recognition inputs are omitted. Apply them to the corrected groups from /4. |
| /26 | Confirmed, medium | The generic embedding perturbation supplier is omitted. KY supplies the generic direction; filtration inequalities are separate. |
| /27 | Confirmed, medium | Full Yu genericity and GE2 are undefined. Extract them and the characteristic-dependent bridge, distinct from Fintzen's genericity definition. |
| /28 | Confirmed, medium | The depth-zero compact-induction input is unstated. Verify its original numbering and terminal-group conditions. |
| /29 | Confirmed, medium | Torus/derived intersection and unipotent-subgroup containment inputs are omitted. Do not weaken the latter to generation by unipotents. |
| /30 | Confirmed, medium | Prerequisite purposes are copied or incomplete. Split MP94/96 and correct actual KY, Reeder–Yu, Kim and Kaletha uses. |
| /31 | Confirmed, low | Route proposal names differ from generated design IDs. Use the generated owners without modifying atlas base data. |
| /32 | Confirmed, low | Baer/divisible-circle extension supplies the algebraic core. The entire smooth character theorem still needs transport and an open-kernel argument. |
| /33 | Confirmed, low | General depth and filtration machinery is overspecialized. Feng's restriction-of-scalars comparison is not identical to the twisted-Levi result. |
| /34 | Confirmed, low | The D-type bad/torsion-prime column must start at rank four; D3 is A3. The Weyl-order formula at rank three remains correct. |
| /35 | Confirmed, low | A Borel toral/unipotent decomposition need not be Jordan decomposition. Conjugate to the toral component before transporting the centralizer conclusion. |
| /36 | Confirmed, low | Root-length coefficients need not be one. Prove they are units for the chosen form and use valuation/zero-set equality. |
| /37 | Confirmed, low | Add the second Kempf/lift use on p.14 and both introductory type pages. |
| /38 | Confirmed, low | The comparison datum needs primed entries and its own terminal-centralizer building. |
| /39 | Confirmed, low | The source conclusion omits nonzero; the extraction already has the intended qualifier. Record the source issue. |
| /40 | Confirmed, low | Repair the epsilon index, vector-space subscript, unbound j and inverse-conjugation estimate. These do not resolve /2. |
| /41 | Confirmed, low | Supply strict recursive depth decrease and centralizer properness starting at j=2. |
| /42 | Confirmed, low | Define the initial recursion H1 and finalized length-zero H1 separately; no G2 exists for the latter. |
| /43 | Confirmed, low | An irreducible summand need not contain a chosen subspace. Project to a nonzero datum image and prove its defining properties survive. |
| /44 | Rejected, low | Section 2 explicitly fixes the non-torus convention through Section 8. Items /2 and /6 faithfully retain it; a torus extension would be additional mathematics. |

The high findings and two proposed repairs were checked by concrete calculations. For /2, in split GL3 at a hyperspecial point take r1=1 and d1=1/2. Moving by `(0,0,δ)`, with 0<δ<1/4, makes the relevant root thresholds `ceil(3/4+δ)=1` and `ceil(1+δ)=2`. Thus an element with root parameter of valuation one distinguishes the asserted equal groups. The displacement can be scaled to meet the paper's normalized metric bound. This refutes the displayed equality, not continuity of depth.

For /3, take A=(1/5)diag(1,2,3) and M=E12+E21. The difference between the characteristic polynomials of A+M and A is `−(t−3/5)`. Exact agreement of the alleged conjugated functionals on a full O-lattice would imply agreement on its k-span and force conjugacy of these matrices, which is impossible. The source proof only makes the discarded terms invisible to the conductor-P character. The character conclusion can survive after the functional statement is weakened and its argument is supplied.

For /4, the ordinary SL2 half-depth factor at depth two contains `diag(1+5²,(1+5²)⁻¹)`, absent from the mixed group with torus depth four. Its commutator with the displayed depth-two SL2 matrix has diagonal valuations six and off-diagonal valuations four, so its class is central in the relevant quotient without coming from the claimed center. With conductor-P normalization, the depth-four torus character on the depth-three torus can have order 25. The extra central class and larger central character image prevent reuse of the printed finite Heisenberg assertion. A replacement definition requires renewed proofs of the following steps.

For /5, FKS explicitly extends each quadratic factor from the depth-zero stabilizer to the full type group, trivially on the positive-depth factors. Its Theorem 4.1.13 supplies the twisted irreducible supercuspidal construction. Twisting the depth-zero input cancels the oscillator twist when comparing the two conventions. Because residue characteristic is odd, this quadratic character is trivial on the finite unipotent radicals, preserving cuspidality. AFMO's adjacent warning means an arbitrary restriction of a twist must not simply be assumed to extend to a Levi character; use the actual full-type extension.

For /11, let u=[[1,1/5],[0,1]] and A=uE21u⁻¹. The trace functional of A has depth zero at the hyperspecial point conjugated by u. On the diagonal torus its value on diag(1,0) is 1/5, contradicting the unrestricted depth-zero restriction claim. Fintzen's two uses have a torus centralizing the functional, so retaining that hypothesis repairs the requested supplier's scope.

For /20, opposite SL2 root parameters 5 at depth one have commutator differing from the identity by diagonal entries of valuation two. They survive a depth-2+ denominator, so the half-depth quotient is not abelian. Require `2t > R` for the relevant denominator cutoff R, or change the denominator. The paper's actual `r/2+` and `d+` uses lie on the strict side; the boundary is the separate Heisenberg construction.

The following standard-library Python reproduces these numerical certificates and the low-severity root/form examples. It verifies arithmetic, not all filtration identifications or any Lean proof.

```python
from fractions import Fraction as F
from math import ceil

def mul(a, b):
    return [[sum(x*y for x, y in zip(row, col))
             for col in zip(*b)] for row in a]

def inv(a):
    d = a[0][0]*a[1][1] - a[0][1]*a[1][0]
    return [[a[1][1]/d, -a[0][1]/d],
            [-a[1][0]/d, a[0][0]/d]]

def comm(a, b):
    return mul(mul(mul(a, b), inv(a)), inv(b))

def vp(q):
    q = F(q)
    if not q:
        return float('inf')
    n, d, v = abs(q.numerator), q.denominator, 0
    while n % 5 == 0:
        n //= 5
        v += 1
    while d % 5 == 0:
        d //= 5
        v -= 1
    return v

def valuations_minus_identity(a):
    return [[vp(a[i][j] - (i == j)) for j in range(2)]
            for i in range(2)]

assert [ceil(F(3, 4)+F(1, 100)), ceil(1+F(1, 100))] == [1, 2]
a, b, c = F(1, 5), F(2, 5), F(3, 5)
p = [-a*b*c, a*b+a*c+b*c, -a-b-c, F(1)]
q = [-a*b*c+c, a*b+a*c+b*c-1, -a-b-c, F(1)]
assert [y-x for x, y in zip(p, q)] == [F(3, 5), -1, 0, 0]
t = [[F(26), F(0)], [F(0), F(1, 26)]]
g = [[F(1), F(25)], [F(25), F(626)]]
assert valuations_minus_identity(comm(t, g)) == [[6, 4], [4, 6]]
u = [[F(1), F(1, 5)], [F(0), F(1)]]
e21 = [[F(0), F(0)], [F(1), F(0)]]
assert mul(mul(u, e21), inv(u)) == [[F(1, 5), -F(1, 25)],
                                      [F(1), -F(1, 5)]]
upper = [[F(1), F(5)], [F(0), F(1)]]
lower = [[F(1), F(0)], [F(5), F(1)]]
assert valuations_minus_identity(comm(upper, lower)) == [[2, 3], [3, 2]]
roots = [(0, 1, -1), (1, -1, 0), (0, 1, 1)]
assert [[sum(x*y for x, y in zip(a, b)) for b in roots] for a in roots] == [
    [2, -1, 0], [-1, 2, -1], [0, -1, 2]]
x = [[F(1), F(1)], [F(0), -F(1)]]
assert mul(x, x) == [[1, 0], [0, 1]]
assert [sum(F(x*x, 2) for x in h) for h in
        [(1, 0, -1, 0), (1, -1, -1, 1)]] == [1, 2]
print('All eight arithmetic certificates passed')
```

The pinned library checks read actual statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In Mathlib, [Module.Baer.extension_property_addMonoidHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Injective.lean#L394), [Module.Baer.of_divisible](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/Grp/Injective.lean#L35) and [the divisible additive-circle instance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Instances/AddCircle/Defs.lean#L565) supply algebraic extension without a finite ambient group. A smooth character on the compact open starting subgroup has finite, hence unitary, image; extension through the additive-circle model retains its original open kernel. The entire smooth theorem is still a missing assembly and transport statement. Tau Ceti's `card_weylGroup_of_card_support_eq_two`, `LinearAlgebra/RootSystem/Weyl/Dihedral.lean:102`, explicitly requires support cardinality two. It is a useful special case, not a supplier for every Weyl-order row. The available reviewed coverage entries were consulted as leads; this review does not claim a new complete library audit.

The ownership checks read RG2.1–3 and the relevant existing ReductiveGroups and InductionRestriction contracts, the queue generator's `paper_designs` function, and accepted BHKT, Lafforgue, Feng, Stevens and Lust–Stevens routes. Stevens's /246 already absorbs /306 but still imports Fintzen's connected cuspidality predicate; that merge does not remove /7. The finite Clifford contracts in both InductionRestriction layers 5 and 7 must be reused after the compact-group reduction in /24. Feng's depth construction can share an owner, but its restriction-of-scalars filtration theorem has different hypotheses and is not a replacement for /8a.

The generated design identities are `SmoothRepresentationsOfLocalGroupsPartII`, `MetaplecticAutomorphicFormsPartII` and `ReductiveGroupsPartIII`. Routing corrections must be coordinated across /1, /7–9, /18, /31 and /33. They require handoffs for other extractions and, where appropriate, the maintainer; this verification changes neither those files nor Tau Ceti's own roadmap contracts. Route counts after moves, new supplier entries and possible merges must be recomputed by the fix worker, rather than copying intermediate counts from /1.

Validation: the red-team review checker reports zero errors; intake checks on the two authorized deliverables report no problems; the 44 IDs match the input exactly, and all arithmetic assertions above pass. The staged diff passes whitespace checks. There is no Lean deliverable in this job, and no Lean compilation, Lake setup, cache download or library build was run. These are planning and source-verification verdicts, not formalized proofs or certification that the remaining proof obligations are solved.
