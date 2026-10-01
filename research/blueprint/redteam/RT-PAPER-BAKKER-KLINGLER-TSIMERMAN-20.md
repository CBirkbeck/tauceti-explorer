# RT-PAPER-BAKKER-KLINGLER-TSIMERMAN-20

Complete red-team report for [issue #4266](https://github.com/CBirkbeck/tauceti-explorer/issues/4266), by Codex, session `codex-rtOQ9t`, 1 October 2026.

Three findings: **two high, one medium**. They concern the accepted extraction and its proposed repairs. They do not allege new mistakes in the published article or weaken its corrected main theorems. Each finding awaits independent verification.

## Scope and independence

The accepted extraction has 147 items, eight routes and 60 source issues. I read the full published article and the author-hosted erratum, then checked the extraction, its accepted review and the supplied API/test statements. The earlier extraction sessions were `codex-c83e7a`, `codex-a71f92`, `cc-fb70e5` and `cc-442dc5`; the reviewer was `cc-2aeb03`. This session did none of that work. The input snapshot is `fff2b3908c221914c175c97d02773234607768dd`; exact input hashes are in the JSON.

PROTOCOL §16 leaves supplier proof closure to later blueprints. An absent proof or API is therefore not a finding here. Finding 3 attacks an explicitly false proof step, and permits retaining the correctly stated finite-chart theorem as an imported supplier.

## 1. Untwisted type-(p,p) tensors are not Mumford–Tate invariants — high

**Where:** `research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json items /hodge-locus (index 124), /generic-mumford-tate-group (123), and route 8 DegeneratingHodgeStructures`.

The extraction calls any rational tensor of type (p,p) a Hodge tensor and then declares it exceptional exactly when it is not fixed by the generic Mumford–Tate group. Without a Tate twist this equivalence is false. It makes the alleged exceptional locus equal the whole base even for a constant Tate variation, whereas no Mumford–Tate group drops.

The /hodge-locus statement combines "of Hodge type (p, p)" with "not fixed by the generic Mumford–Tate group MT(V)" and identifies this with not being Hodge generically. BKT §1.3, JAMS p.920, refers to Klingler [K17] for this background. Klingler, arXiv:1711.09387, §2.4, p.8, defines a Hodge class by F^0 V_C intersect W_0 V_Q and Lemma 2.5(a) identifies these tensor classes with Mumford–Tate invariants; §2.6, p.9, defines the exceptional locus by a strict group drop. Witness: take the constant polarized integral variation Z(-1) over A^1_C. Its rational fibre has type (1,1), and its Mumford–Tate group is G_m acting nontrivially by scalars, constant on the base. A nonzero u in V is type (1,1) at every point but is moved by the scalar 2 in G_m. The extracted not-fixed test declares u exceptional everywhere; the generic-type and group-drop tests both give the empty locus.

**Correction:** In the untwisted tensor algebra define Hodge tensors to have type (0,0), and define exceptional tensors relative to the generic type-(0,0) subspace. If retaining type (p,p) classes, pass explicitly to T(V)(p) before testing invariance, retaining the Tate character in the Mumford–Tate action. Reconcile /generic-mumford-tate-group, /hodge-locus, countability and preimage consumers and the route-8 brief. Cite [K17] §2.4 Lemma 2.5 and §2.6. Include the constant Z(-1) example as a check: its exceptional locus is empty. This is an extraction error, not a new error alleged in BKT.

## 2. A Mumford–Tate domain is not the full period-point carrier — high

**Where:** `research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json item /general-period-domain (index 53), its api BKT.GeneralPeriodDomain.pointEquivalence and proofSteps, and route 8 brief`.

The general-period-domain item starts with the derived generic Mumford–Tate group and its orbit, but then identifies that domain with the existing fixed-form/fixed-Hodge-type PeriodDomain.Point carrier. That carrier contains all polarized filtrations of the type; a Mumford–Tate domain is generally a proper subdomain requiring additional tensor or orbit conditions. The proposed equality of carriers is false even in rank two.

The item specifies D=G(R)^+·F_0 for the derived Mumford–Tate group, but its proof says "Identify its points with the pinned PeriodDomain.Point carrier" and its API says the analytic domain has that existing carrier. BKT §1.3, JAMS p.920, distinguishes period domains from "more generally Mumford-Tate domains". At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, TauCeti/Geometry/Hodge/PeriodDomain.lean:71–80, Point has exactly hs, htype_weight, pol and hodge_numbers; there is no Mumford–Tate group, extra tensor family or orbit predicate. Witness: V_Q=Q^2 with Q(e_1,e_2)=1, weight one and h^(1,0)=h^(0,1)=1. F^1_tau=C(e_1+tau e_2) gives distinct polarized points for tau=i and tau=2i, since i Q(u,conj u)=2 Im(tau)>0. At tau=i the rational endomorphism J=[[0,-1],[1,0]] is Hodge, the Mumford–Tate group is the Q(i)-torus, and its derived group is trivial. Its domain is the single point F_i. F_(2i) is a point of the same pinned carrier but is not preserved by J, hence is not in that Mumford–Tate domain. Klingler [K17] §3.1, Proposition 3.1 and Definition 3.3, p.10, likewise constructs a domain from a specified group-conjugacy orbit.

**Correction:** Separate the full polarized period-domain realization of the pinned carrier from the Mumford–Tate-domain subtype/orbit for a fixed Hodge datum. Reuse Point as the ambient carrier, add the defining tensor/orbit conditions and any connected-component choice, and construct the manifold and compact dual on the appropriate subspace. Replace the unconditional carrier-identification API and proof step with an inclusion plus the appropriate specialization theorem. Clarify route 8 accordingly. Test the CM weight-one singleton against the two different polarized filtrations above. The existing library definition is correct; the error is the proposed consumer interface.

## 3. A Siegel set has unbounded partial-face remainders — medium

**Where:** `research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json item /siegel-chart-refinement (index 130), note, repairing sourceIssue E23`.

The offered finite-chart repair says that after removing the region where all simple-root heights are large, the remaining part of each Siegel set has bounded A-coordinate and is relatively compact. This is false in rational rank at least two. Partial boundary faces remain unbounded, so the stated finite-small-ball argument does not finish the repair.

The item note states: "The remaining part of each 𝔖_i has bounded A-coordinate, is relatively compact and needs finitely many small balls." BKT Definition 2.3, JAMS p.924, imposes a lower bound on every simple root. For the upper triangular P in SL_3, take K=SO_3, M={1}, and fixed bounded open U,W containing the identity. With a(t)=diag(2t,t,1/(2t^2)), t>=2, det a(t)=1 and the simple-root values are a_1/a_2=2 and a_2/a_3=2t^3. Thus a(t) lies in A_(P,1) outside A_(P,3) for every t, but escapes every compact subset of G. In inverse-root coordinates it approaches (1/2,0), a partial face, not a compact interior remainder. This directly disproves the positive compactness assertion in the extraction. E23 records the original chart gap; E56 concerns a different partial-face problem in §4.5, not this new repair of §3.1.

**Correction:** Remove the false bounded-remainder assertion. If supplying a repair, handle every partial face by parabolic-incidence charts (or another precise finite semialgebraic local-slice theorem), with bounded directions treated as parameters; only the region where every root height is bounded above can be assigned to the compact interior argument. It is also valid under PROTOCOL §16 to leave that finite-chart theorem as a correctly stated supplier without its proof. Preserve E23 as the original source gap, and describe this as an error in the proposed repair, not a new counterexample to quotient definability.

## Source and library checks

The [published article](https://par.nsf.gov/servlets/purl/10200187) was read in full, pp.917–939, including the appendix and bibliography. SHA-256: `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`. The [four-page erratum](https://benjamin-bakker.github.io/DefArithErr.pdf) was also read in full: `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`. Both match the accepted extraction. The author's publication page lists that erratum. The supplemental [Klingler preprint](https://arxiv.org/pdf/1711.09387), pp.2,8–10, was read for the first two findings; its p.8 image confirms the weight-zero convention. Its hash is `fb0ea85a98db871ec140378feef334e2f67cc8215fc2a5e3c0e75d8d42015939`. All source reads were on 1 October 2026.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I checked the actual definitions or statements in:

- `AlgebraicTopology/LocalCoefficient.lean`;
- `Geometry/Hodge/Structure.lean`, `PeriodDomain.lean`, `WeilOperator.lean` and `HodgeForm.lean`;
- `Geometry/Hodge/Mixed/Basic.lean`, `DeligneSplitting.lean` and `Decomposition.lean`.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I checked `RingTheory/Nilpotent/Exp.lean`, including the finite-sum and commuting-addition hypotheses. These cover all ten library items. Finding 2 is a wrong interface proposed on top of a correct existing carrier, not an error in that carrier. No Lean build was run.

The fresh atlas has 2,907 stages and 8,322 stage edges. The source-stage checks included AA.3, ALS.0/2, LD.0/6, ShimuraData D3, ShimuraVarieties V2/V3, R09.7d and ComplexComparisonPartII C0/C4, with their available reviewed coverage entries. The LD stages have no entry in that coverage map. The two proposed Part II identifiers are not yet defined in the current roadmap directory. I found no additional ownership finding in this screen. All 123 missing items have one route, every item prerequisite resolves, and the 147-item, 222-edge dependency graph is acyclic.

The 60 prior source issues were compared with the article and erratum; they are not republished as new findings. This does not freshly certify every external theorem or proposed repair in that ledger. In particular, no conclusion here depends on its E42 claim about all Borel–Serre boundary transitions. Full external proof audits remain outside this extraction red team.

## Validation

Direct calculations checked the nontrivial Tate scalar character, positivity and the rational complex-multiplication condition for the two weight-one filtrations, and the determinant/root values of the SL3 partial-face sequence. These are diagnostics supporting the written arguments, not formal proofs.

Submission checks: `scripts/check_redteam.py` on the JSON, `research/blueprint/intake.py check-files` on both deliverables, and staged whitespace checking. No Lean file is part of this job and no compilation is claimed.
