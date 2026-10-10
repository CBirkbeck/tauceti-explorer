# Independent review: third Iwasawa area-fix round

Refs #5869. Codex (GPT-6), session `codex-kvRxoX`, 10 October 2026.
Claim confirmed by the bot on 10 October 2026. Initial checkout:
`0339ede22bf7a801e863028435d340d6ab2c0f03`; synchronized before editing to
`e760b5eb86b00b323b8e2d104317e3f0b1a60e98`.

**Verdict: needs_changes. Submission: blocked checkpoint.** The typed
comparison and Tate-period correction is adequate, but the canonical
coefficient-map signature remains missing; the separate reconstruction
objections also remain.

I did none of the blueprint, red team, verification, fixes or earlier
reviews. I read the eight findings and verifier decisions, the third fix
report, the preceding review and handoff, and the intervening independent
reconstruction and algebraic-geometry reviews. This review checks the
current contracts against fresh selected primary-source reads. It does not
claim a new audit of all 182 Motives nodes or every arithmetic owner node.

The live issue permits only the Motives packet, its suggested file and this
report. GH.0 and Kato were inspected read-only. The queue requires additional
verdicts in those two packets; the issue does not authorize their edits.
I requested clarification while completing the permitted review. No scope
extension was received. The exact dispatch obstruction and repairs are
recorded below, so the next worker need not repeat this audit before resolving
the obstruction.

## Finding dispositions

The original fix's handoffs for /1–/7 match the original issue's ownership
instructions. A correct handoff does not certify a later supplier revision.

| Finding | Current disposition and evidence |
| --- | --- |
| /1 — CM product model | The handoff to GH.0 is appropriate. BDP §2.2, p.1060 forms the product with a separately chosen CM factor; §3.2, p.1067 requires a finite unramified local field and supplied smooth proper models. Conrad's appendix, pp.1139–1140 constructs the universal Kuga–Sato factor over the level base. It does not give every CM factor good reduction. The current product-model node makes both models inputs and includes positive and bad-twist checks. The GH.1 consumer still has the ambiguous conductor parenthetical identified below. |
| /2 — symmetric-power twist | The handoff and current moment-map statement agree with Kato §8.4, p.182: the Tate module is cohomology twisted by 1, so its degree k−2 symmetric power contributes k−2. Adding 2−r gives k−r. Weight four with r=1 yields twist 3; weight two alone cannot expose the former sign reversal. |
| /3 — Euler factors | The handoff retains the right linear factors and prime-divisibility branches in Proposition 8.7, p.184 and Theorem 9.5, p.188: linear exponent −r and quadratic exponent k−1−2r. The current Kato Hecke-equivariance supplier nevertheless states r−1 where Lemma 8.8, p.185 requires r′−1. The rendered display and the independent transport calculation below confirm the preceding checkpoint's defect. It remains unrepaired. |
| /4 — de Rham target | Kato (9.2.2), p.187 and §9.4, p.188 use filtration steps. Their upper zero boundary is i≥k; steps 1 through k−1 identify with modular forms. At k=4, consecutive interior steps agree and the corresponding graded quotient is zero. Tate twisting identifies F⁰D(V(i)) with F^iD(V). The current reciprocity node retains this distinction and its interior test. |
| /5 — interpolation order | The current interpolation supplier follows Kato Theorem 12.5(1), p.221: twist the compatible Iwasawa class by k−r, specialize, localize and apply the dual exponential. It retains the cyclotomic action, dual form, omitted p factor and sign. A finite-level root-of-unity factor alone cannot change the coefficient representation. |
| /6 — duality and limits | The integral-limit node retains Lemma 8.5, p.184: local inertia-cohomology invariants describe the cokernel, and their Pontryagin dual is residue-field cohomology of inertia invariants in the dual twisted module. The original inverse limit uses corestriction; the dual direct limit uses restriction. Eventual vanishing of restriction does not prove vanishing of the corestriction inverse limit. |
| /7 — theta divisor | The current theta node uses the divisor of the function norm, hence pushforward under multiplication, as in Kato §1.10, p.124. For c=5,a=2, the pullback is 25E[2]−E[10]; a nonzero 2-torsion point has coefficient 24, rather than the original divisor's coefficient 0. Pushforward preserves the divisor because multiplication permutes the 5-torsion. A divisor-class identity cannot replace this divisor calculation. |
| /8 — effective versus full periods | The six Motives suppliers retain the corrected sequence: present the effective algebra, invert the Tate symbol, compare the localized algebra with the full tensor-isomorphism torsor. HMS Definition 2.8, p.10, Remark 2.9 and Theorem 2.10, p.11, and Corollary 3.4/Remark 3.5, p.13 support those contracts. The typed comparison supplies unit/product and diagram compatibility. The MC.5 algebra-localization prototype still used an arbitrary map; this review retires that unsupported signature and records its missing canonical interface below. PS.2 continues to own integration and analytic normalization. Evaluation injectivity remains unclaimed. |

## Motives contract audit

I read the statements, hypotheses, proof steps, prerequisites, source
locators, API contracts and acceptance records of these suppliers, and their
corresponding suggested signatures and examples. Namespace-local names in
Lean were resolved in their enclosing namespaces. The review adds one
discriminating example; the canonical coefficient-algebra theorem is now
explicitly recorded as unstated in the prototype.

| Supplier | API records | Named examples |
| --- | ---: | ---: |
| MC.5/diagram-localisation | 7 | 5 |
| MC.5/nori-tensor-category | 0 | 0 |
| MC.6/formal-periods | 12 | 7 |
| MC.6/formal-periods-equal-comparison-algebra | 2 | 0 |
| MC.6/period-torsor | 0 | 0 |
| MC.6/period-point | 11 | 7 |

HMS Definition B.18 and Assumption B.20, p.24, and Proposition B.22,
pp.25–26 require a rank-one localization object. Theorem 1.6, pp.4–5 applies
that construction to Nori motives. The rank-two negative example is useful:
over a field its dimension cannot acquire a tensor inverse. The unit-vertex
example tests trivial localization. These contracts do not redevelop the
Chow or geometric-motive localization suppliers.

A fresh check of the coefficient-algebra API uncovered a discrepancy with
its own packet acceptance contract. The former `Diagram.localise.coalgebra`
signature took any ring homomorphism φ and concluded that its algebra
structure was localization at χ. Proposition B.22 uses the canonical
coefficient map from the effective-diagram inclusion with the induced
products. The prototype supplies neither that map nor its compatibility.
An arbitrary map cannot stand in for them.

The added `Diagram.localise.noncanonical_map` example evaluates Q[t] at
t=1 inside Q[t,t⁻¹]. It proves that t maps to 1, t−1 maps to 0, and t−1
is nonzero. All powers of t are regular in the domain Q[t], so a
localization map at t is injective; this map cannot be one, although its
generator image is a unit. I checked the pinned
`IsLocalization.injective_iff_isRegular` contract for that inference.
The three example identities have actual proofs and no placeholder.

I removed the unsupported universal theorem signature, retained its planned
API with an explicit canonical-map requirement, and added a precise gap.
Resume by constructing the map on the finite endomorphism-dual colimit and
its inclusion compatibility, with the induced localized multiplication;
then restate the localization theorem for that map. Merely assuming the
localization conclusion would not repair the supplier interface. No source
erratum is asserted: this discrepancy was in the suggested signature.

The effective formal-period carrier quotients the direct sum of de Rham
classes tensored with homology by pullback and connecting-map relations.
Its product uses exterior and cross products; bilinearity, unit and product
examples check the algebra interface. The full carrier is its localization
at L=(G_m,{1},dlog,S¹), with a named inverse and both inverse identities.
The polynomial model Q[t] has a nonunit distinguished generator; the
Laurent model has the prescribed inverse. These examples distinguish the
two contracts without claiming a computation of all motivic periods.

`FormalPeriods.localizeComparison` transports an effective algebra
equivalence to the localizations at L and its image; its companion equation
checks the effective-to-localized square. The actual geometric comparison
still needs the recorded supplier, good-pair products and reconstruction
interfaces. The generic localization API does not prove those inputs.

`PairDiagram.PeriodComparison` is a family of complex-linear equivalences
with pullback and boundary compatibility and explicit unit and product laws.
`ProductCompatible` identifies the multiplicative representations with the
geometric wedge/cross operations on good pairs. The tensor comparison,
period point and period-torsor signatures consume those witnesses.
Doubling a comparison preserves linear isomorphisms and pullback
naturality, but changes the unit period to 2 and breaks multiplicativity:
the product pairing doubles while the product of pairings quadruples.
The negative example therefore rejects the weaker former contract.

The Tate nonvanishing argument uses both parts of the recorded input.
The logarithmic class is nonzero, so its comparison functional is nonzero.
The homology space has rank one and its circle class is nonzero; thus that
functional cannot vanish on the circle. Nonzero vectors alone in a
higher-dimensional dual pairing would not justify the conclusion.
This supplies a unit complex image for L and permits the localization lift.
The inverse's value is the reciprocal of that supplied period. PS.2's
separate integration normalization is needed to identify it with (2πi)⁻¹.

The heap and torsor signatures are conditional on the compatible comparison
and product data. A complex comparison yields a point after the faithfully
flat extension Q→C, consistent with HMS §3, pp.12–13. These proofs remain
admitted. This review does not discharge their reconstruction premises,
the geometric comparison request, Basic Lemma or realization gaps.

## Repairs requiring authority outside this issue

The Kato defect is in
`L1/hecke-and-diamond-equivariance-of-the-moment-map`, both the statement
and acceptance item 0. Restore Hecke exponent r′−1. Keep the central-diamond
exponent k−2−2r: it concerns a different operator.

To check the repair, distinguish source and target operators in
Proposition 2.4, p.126 and Lemma 8.8, p.185. Transporting the source linear
operator T′D(ell⁻¹,1) through the moment map contributes Hecke scalar
ell^(−(r′−1)) and inverse-first-diamond scalar ell^(r′−1−r). Their product
is ell^(−r), independent of r′. The source quadratic term has coefficient
ell; its diamond transports with exponent k−2−2r, giving k−1−2r.

Using the packet's r−1 for the Hecke scalar instead gives exponent r′−2r
in the linear term. At k=4,r=1,r′=2 it gives 1 instead of ell⁻¹.
Add this discriminating transport test and inspect the generic Lean
intertwining contract's scalar instantiation. This is an operator-scalar
test, not an assumption that an arithmetic zeta class is nonzero.
Preserve the earlier Kato review in history when superseding its assertion.

In GH.0's packet, hypothesis 0 of
`GH.1/p-adic-abel-jacobi-map` appends p∤cNd_K to good reduction. Make the
smooth proper models independent inputs and restrict the conductor criterion
to BDP's chosen canonical application. The new product-model statement
already has this distinction. Retain its bad-twist example; the consumer
wording needs clarification rather than a new model theorem.

Neither repair, nor a review-marker replacement in either owner, is
authorized by the live issue. Read-only inspection is not their completed
independent review.

## Baseline, ownership and preserved verdicts

I read the actual pinned Mathlib declarations for
`IsLocalization.Away.invSelf`, `mul_invSelf`, `lift`,
`IsLocalization.algEquivOfAlgEquiv`, `Polynomial.not_isUnit_X` and
`LaurentPolynomial.T_add` with `T_zero`. The lift requires a unit image.
Transport of an algebra equivalence requires equality of the mapped
localization submonoids. Nontrivial coefficients give the polynomial
nonunit example; the Laurent multiplication law gives both inverse laws.
The pin is `082e2d37e8b0463410cdb532e111cd43d5a66174`.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read
`fgPointTensorIsoEquiv`, `tensorAutFunctor` and
`pointsFunctorIsoTensorAutFunctor` from that commit. They consume an
existing bialgebra or, for the equivalence, a commutative Hopf algebra over a
field. They do not construct the algebra of an arbitrary diagram category.
The reviewed library audit's PS.2 record retains the missing formal-period
objects and the MC.6 supplier boundary.

I also read the relevant current upstream ReductiveGroups README/Suggested
and completed HodgeStructures README/Suggested contracts and checked the
current library. Affine-group/Hopf infrastructure, known-Hopf reconstruction
and abstract Hodge/Tate structures have existing owners. They supply no
replacement for the geometric pair comparison or the outstanding relative
reconstruction adapter. No new target was introduced, and neither read-only
checkout was modified or built.

The previous top-level algebraic-geometry review is archived unchanged.
The [geomlanglands review](REV-FIX-RT-AREA-geomlanglands~2.md) still requires
the relative Beck preservation adapter and typed reconstruction carriers;
its fifteen API and four theorem prototype objections remain. Consequently
the packet's overall verdict stays `needs_changes`, both for those
obligations and the newly recorded canonical-map prototype gap. The typed
comparison and period-point correction remains adequate. Every previous
history entry and all 23 earlier gaps are retained exactly. Outside one
existing API clarification, its added test and the new gap, all non-review
fields remain unchanged, including the 16 requests, source issues,
prerequisites, coverage, planets and implementation status.

The reader has the six main statements and the effective/full distinction.
Its later period-torsor witnesses, period-point rank-one annotation, updated
locator and reconstruction verdict still need synchronization by an
authorized reader job. It is outside this review's edit scope.

## Verification and fresh source receipts

The packet checker with the pinned declaration index reports 0 errors and
0 warnings: 182 nodes, 451 counted APIs, 256 counted tests, 47 planets and
109 baseline declarations. Coverage remains partial; none of its eight
stages is closed.

The revised full suggested file passes `lean-check`, exit 0, with 805
warnings, all `declaration uses sorry`, and no other diagnostics.
SHA-256: `d9b40f1c5e008129bd3faaefc0a17f2cc252febc6af1e9ded8adfe914077fd27`.
The retired unsupported theorem removes one admitted-proof warning. The
new discriminating example has no admitted proof. The remaining warnings
are from the pre-existing placeholders; elaboration does not close them.
Parsed preservation, scope, whitespace and dispatch checks are recorded
in the handoff.

These public PDFs were downloaded afresh on 10 October 2026. Kato's rendered
pp.184,185,187,221 were inspected to disambiguate exponents, limit arrows,
filtration boundaries and twist order; the other listed passages were read
in extracted text. Prior comprehensive source audits remain attributed to
their authors. This report records mathematical conclusions in my own words.

| Source | Selected locators checked | SHA-256 |
| --- | --- | --- |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Theorem 1.6, pp.4–5; Definition 2.8, p.10; Remark 2.9/Theorem 2.10, p.11; §3, pp.12–13; B.18–B.22, pp.24–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; Proposition 2.4, p.126; §8.4, p.182; Lemma 8.5/Proposition 8.7, p.184; Lemma 8.8, p.185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5, p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §2.2, p.1060; §3.2, p.1067; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

## Dispatch obstruction

Issue #5869 names the report and Motives packet/Lean pair. Its embedded
instructions name only Motives as the packet under review. The queue
additionally lists the GH.0 and Kato packet/Lean pairs.
`issues.py:deliverables_complete` requires this exact review job's marker
in every queue-listed packet. Both other packets still name their own
reviewers, so that predicate remains false.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” No authority to add those four files arrived
during this review. Reconcile the live issue and queue before resumption:
authorize the extra owners, or have the manager align the queue with the
intended Motives-only scope. Changing owner markers without reviewing them
or removing queue outputs would not resolve the mathematical or scope
obstruction. This checkpoint neither completes the queue job nor approves
the outstanding reconstruction.
