# RT-PAPER-NGODAC-21

Red team of the accepted extraction PAPER-NGODAC-21: Tuan Ngo Dac, *On Zagier–Hoffman's conjectures in positive
characteristic*, Annals of Mathematics 194 (2021), 361–392 (HAL manuscript hal-03298790v1). Issue #4079.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, PR #1971; `codex-c83e7a`, PR #2005; `cc-442dc5`, PR #2065);
- its review (`cc-39fac3`, PR #2431).

Disclosure. The routes pass checked RS-25, whose clean red team I verified (REV-RT-RS-25, PR #4897). No finding rests on
it.

**Result: 18 findings, 4 high, 6 medium and 8 low.**

## Method

**The source.** The HAL manuscript (<https://hal.science/hal-03298790/file/ZagierHoffmanHAL.pdf>), the version the
extraction read, was re-downloaded on 2026-10-01; its SHA-256 (`f6bf74f1…71d`) equals the extraction's. Locators are its
printed pages. The Annals version was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all pages (§§1–2, §§3–4, and §§5–6 with the references), with exact computations of power sums, Chen
  coefficients and the p. 24 coefficient systems over small F_q.
- One checked the six routes, the 4 planned and 5 library statuses and the briefs against the atlas, `make_queue.py`,
  other papers' accepted routes, earlier red teams and the pinned libraries.

**Merging.** I merged the DM.8 cycles, route 4's DM.6 owner and the duplicate owners (three passes each), and five
findings that two passes each reported.

**What I re-verified myself.** All four high findings:
- the DM.8 cycles, from the items' dependency fields and DM.8's requires in `data/atlas.json`;
- route 4, from gamma's and small-power-sum's dependencies, route 6's DM.6 import and the DM.6 stage text;
- the duplicate owners, against the accepted PAPER-IM-KIM-LE-ETAL-24 routes;
- Theorem D, against pp. 4–5 and Theorem 6.2 (p. 22).

**Severity I changed.** Route 6's Theorem D derivation is high, not medium: the brief states a false derivation that a
design job would follow.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 4; route 6 brief; PAPER-NGODAC-21/gamma; PAPER-NGODAC-21/small-power-sum; report section 'Ownership and
pinned-library evidence'; report (PAPER-NGODAC-21.md), section 'Ownership and pinned-library evidence'

**Claim.** Route 4 sends gamma (the Carlitz factorials Γ_n and Γ_s = ∏Γ_{s_i}) and small-power-sum (S_d(a) = ℓ_d^(−a)
for 1 ≤ a ≤ q, and S_<d(q−1) = [d]/([1]ℓ_{d−1}^(q−1))) to DrinfeldModulesAndTModules:DM.6, and the route 6 brief tells
the Part II to import 'DM.6 for factorial and depth-one power-sum normalization'. This routing contains a dependency
cycle. gamma depends on PAPER-NGODAC-21/indices and small-power-sum on PAPER-NGODAC-21/degree-sums, and both of those
are routed to the Part II (route 6). Meanwhile the Part II items AT-polynomials, AT-interpolation, L-theta,
isolated-tail and two-index-reduction depend on gamma, and fundamental-relation depends on small-power-sum. These items
would need a link from the Part II to DM.6, which closes a cycle with the Part II's own import of DM.6. Separately, DM.6
plans neither statement: the layer is Taelman's class-number formula. A confirmed red-team verdict on
PAPER-CHANG-CHEN-MISHIBA-23 has already established that DM.6 plans only Taelman's targets. Finally, the accepted Part
II route of PAPER-IM-KIM-LE-ETAL-24 already carries the same mathematics, so route 4 also gives it two owners. There,
anderson-thakur-polynomials defines [k], D_k and Γ_n, and thakur-power-sums-s-le-q states S_d(s) = 1/ℓ_d^s for 1 ≤ s ≤
q, which is the first formula of small-power-sum. Also: small-power-sum (S_d(a) = ℓ_d^(−a) for d ≥ 0 and 1 ≤ a ≤ q, and
S_<d(q−1) = [d]/([1]ℓ_{d−1}^{q−1})) is routed as a source of DrinfeldModulesAndTModules:DM.6, but DM.6 does not plan
Carlitz power sums: it plans Taelman's class-number formula, and it requires DM.2 and DM.5 (the Tate theorem for
Drinfeld modules), which in turn requires DM.1 (and SchemeAndStackFoundations:SF.2) and DM.4. fundamental-relation (R₁)
is proved from small-power-sum (its only other dependency, binary-relation, is a definition), and R₁ feeds
C-fundamental, BC-operation, large-entry-reduction, terminal-q-reduction, admissible-spanning and theorem-A. With this
routing the purely algebraic Theorem A layer of DrinfeldModulesAndTModulesPartII must import DM.6 and so, transitively,
the Tate theorem, for an elementary identity about finite sums. The same statement is also routed elsewhere:
PAPER-IM-KIM-LE-ETAL-24/thakur-power-sums-s-le-q ('For 1 ≤ s ≤ q and d ≥ 0, S_d(s) = Σ_{a ∈ A_+, deg a = d} a^{−s} =
1/ℓ_d^s') is in that paper's part-ii route to DrinfeldModulesAndTModulesPartII, so the one theorem now has two owners.
Also: The Carlitz factorial Γ_n = ∏_j D_j^{n_j} (with n−1 = Σ n_j q^j) is routed as a source to DM.6. DM.6 does not plan
it: DM.6 is Taelman's class-number formula (Euler-product L-value, unit lattice, class module, Fitting polynomial), and
its text mentions no factorials. All five consumers of gamma are Part II items: AT-polynomials, AT-interpolation,
L-theta, isolated-tail and two-index-reduction. The routing therefore makes the Part II import DM.6 (route 6 brief:
'DM.6 for factorial … normalization'), and so transitively DM.5 (the Tate conjecture), DM.1 and
SchemeAndStackFoundations:SF.2, for a one-line definition. It also gives Γ_n two owners.
PAPER-IM-KIM-LE-ETAL-24/anderson-thakur-polynomials, routed to the same DrinfeldModulesAndTModulesPartII, defines Γ_n
(with [k] and D_k) as part of its Anderson–Thakur item.

**Evidence.** Atlas stage DrinfeldModulesAndTModules:DM.6: 'For Taelman's integral Drinfeld-module setting over the
integral closure of F_q[t] in a finite extension of F_q(t), construct the convergent Euler-product value, exponential
unit lattice, finite class module and normalized lattice covolume/Fitting polynomial. Prove the
determinant/nuclear-operator identity and then the class-number formula'. Dependencies recorded in the extraction: gamma
→ [carlitz-products, indices]; small-power-sum → [degree-sums, carlitz-products]. indices and degree-sums are in route
6. Route 6 brief: 'Import … DM.6 for factorial and depth-one power-sum normalization'. RT-PAPER-CHANG-CHEN-MISHIBA-23/2
(verdict confirmed): 'DM.6 plans Taelman's class-number formula for Drinfeld modules … The reviewed library audit lists
DM.6's targets as Taelman's L-value, unit lattice, class module, covolume and class-number formula only.' The paper
defines Γ_n together with the Anderson–Thakur polynomials in §4.2 (p. 17). It uses Γ_s only through (4.2), 'L(s)(θ) =
Γ_s ζ_A(s)/π̃^{w(s)}' (p. 17). PAPER-IM-KIM-LE-ETAL-24 route 1 (part-ii, accepted) lists anderson-thakur-polynomials and
thakur-power-sums-s-le-q. Also: Atlas stage DrinfeldModulesAndTModules:DM.6: 'For Taelman's integral Drinfeld-module
setting over the integral closure of F_q[t] in a finite extension of F_q(t), construct the convergent Euler-product
value, exponential unit lattice, finite class module and normalized lattice covolume/Fitting polynomial. Prove the
determinant/nuclear-operator identity and then the class-number formula', requires DM.2 and DM.5; DM.5 requires DM.1 and
DM.4; DM.1 requires SchemeAndStackFoundations:SF.2. Nothing in DM.6 mentions power sums or ℓ_d. The paper uses the
formula only for the algebraic part: p. 8, Remark 2.2(2), 'it was known from explicit formulas for power sums S_d(a)
with a ≤ q', and (2.8), R₁: S_d(q) + D_1S_{d+1}(1, q−1) = 0. The earlier red team RT-PAPER-CHANG-CHEN-MISHIBA-23
(finding 2) likewise found that DM.6 plans only Taelman's formula. I checked both formulas of the item numerically (q =
2, 3, 4, 5, 7): they are true, so only the owner is wrong. Also: Atlas DM.6 description: 'construct the convergent
Euler-product value, exponential unit lattice, finite class module and normalized lattice covolume/Fitting polynomial.
Prove the determinant/nuclear-operator identity and then the class-number formula …'; DM.6 'requires': [DM.2, DM.5];
DM.5 'requires': [DM.1, DM.4]; DM.1 'requires': [DM.0, SchemeAndStackFoundations:SF.2]. The extraction's dependency
lists: gamma is a dependency of AT-polynomials, AT-interpolation, L-theta, isolated-tail and two-index-reduction, all of
them in route 6. PAPER-IM-KIM-LE-ETAL-24/anderson-thakur-polynomials (route 1, part-ii,
DrinfeldModulesAndTModulesPartII): 'For n ∈ ℕ write n − 1 = Σ_{j≥0} n_jq^j with 0 ≤ n_j ≤ q−1 and put Γ_n := Π_{j≥0}
D_j^{n_j}.' Paper p. 17 defines Γ_n inside §4.2 'Dual t-motives connected to MZV's', next to the Anderson–Thakur
polynomials.

**Fix.** Move PAPER-NGODAC-21/gamma and PAPER-NGODAC-21/small-power-sum from route 4 into route 6, and delete route 4.
Deleting it renumbers routes 5 and 6 as 4 and 5. Because accepted routes are matched to review verdicts by position, the
fix review must record verdicts for the renumbered routes. In the route 6 brief, replace 'DM.6 for factorial and
depth-one power-sum normalization' with a sentence saying that the Part II owns the Carlitz factorials and Thakur's
small power sums. The same sentence should say these are the same statements as PAPER-IM-KIM-LE-ETAL-24's
anderson-thakur-polynomials and thakur-power-sums-s-le-q, to be planned once. In the report (PAPER-NGODAC-21.md, section
'Ownership and pinned-library evidence'), delete 'DM.6 (factorials and depth-one power sums)'. A Drinfeld-module layer
may be wanted for the single factorial Γ_n. In that case split gamma: Γ_n alone goes with carlitz-products, and the
tuple product Γ_s stays in route 6. Do not add a link from the Part II to DM.6. Also: Move
PAPER-NGODAC-21/small-power-sum from route 4 to route 6 (DrinfeldModulesAndTModulesPartII), with a note that it is the
same statement as PAPER-IM-KIM-LE-ETAL-24/thakur-power-sums-s-le-q, so that the Part II design builds it once. Route 4
then carries only gamma; adjust its reason. In the route 6 brief, replace 'DM.6 for factorial and depth-one power-sum
normalization' by 'DM.6 for the factorial normalization'. In the report's ownership paragraph, replace 'DM.6 (factorials
and depth-one power sums)' by 'DM.6 (factorials)', and say that the Carlitz power-sum formula belongs to Part II with
the other power-sum identities. Also: Move PAPER-NGODAC-21/gamma from route 4 to route 6 (the Part II, beside
AT-polynomials, as PAPER-IM-KIM-LE-ETAL-24 has it). Remove 'factorial' from route 4's reason, from the route 6 brief's
DM.6 import ('DM.6 for factorial and depth-one power-sum normalization'), and from the report sentence 'DM.6 (factorials
and depth-one power sums)'.

### /2 — duplicate

**Where.** route 5 reason; routes 1, 2 and 5; route 6 brief; PAPER-NGODAC-21/carlitz-products, PAPER-NGODAC-21/omega,
PAPER-NGODAC-21/entire-ring, PAPER-NGODAC-21/constant-denominator; PAPER-NGODAC-21/entire-ring, PAPER-NGODAC-21/omega,
PAPER-NGODAC-21/carlitz-products; route 5 (reason) and route 2; PAPER-NGODAC-21/entire-ring,
PAPER-NGODAC-21/constant-denominator, PAPER-NGODAC-21/omega

**Claim.** Several objects now have two owners through accepted routes. This is in addition to the factorial and
small-power-sum statements of route 4. The accepted Part II route of PAPER-IM-KIM-LE-ETAL-24 (route 1) sends four of its
items to DrinfeldModulesAndTModulesPartII: tate-algebra-E-and-a-of-t (T, Frac T and E), omega-and-carlitz-period (Ω,
1/Ω(θ) = π̃, its simple zeros), cpy-common-denominator (CPY Proposition 2.2.1) and anderson-thakur-polynomials ([k],
D_k, Γ_n). Its item 5 also defines ℓ_d there. This extraction sends the same statements to DM.8 (entire-ring,
constant-denominator), DM.2 (omega) and DM.0 (carlitz-products), and its route 6 brief tells that same Part II to import
them. Route 5's reason justifies the DM.8 routing with a false statement: 'The two nearby paper routes already identify
this shared owner; do not re-plan these inside Part II.' PAPER-IM-KIM-LE-ETAL-24's only DM.8 route carries just its item
27, the ABP criterion. All accepted part-ii routes with this parent are merged into the single job
DESIGN-DrinfeldModulesAndTModulesPartII, so that job receives contradictory ownership instructions for these objects.
Also: Route 5's reason says of the twist, Tate/entire interfaces, denominator descent and ABP lifting: 'The two nearby
paper routes already identify this shared owner'. This is true for the twist, the ABP criterion and trivialization
uniqueness. It is false for the rest. PAPER-IM-KIM-LE-ETAL-24, which feeds the same DrinfeldModulesAndTModulesPartII,
routes several of the same definitions to the Part II itself: its tate-algebra-E-and-a-of-t (T, Frac T and the ABP ring
E, which is entire-ring here, routed to DM.8), cpy-common-denominator (constant-denominator here, DM.8),
omega-and-carlitz-period (omega here, DM.2), and the [k], D_k part of anderson-thakur-polynomials (carlitz-products
here, DM.0). Both extractions' routes will be applied. The Part II design would then receive items telling it to build
E, Ω/π̃ and D_k, while the DM layers receive this paper as a source for the same objects. The route 6 brief says to
import these objects, but it does not name the conflicting Part II items, so the conflict is not resolved. Also: Route
5's reason asserts: 'The two nearby paper routes already identify this shared owner; do not re-plan these inside Part
II.' At the pinned repository this is false for PAPER-IM-KIM-LE-ETAL-24. That extraction routes three results to
DrinfeldModulesAndTModulesPartII (its route 1): the ring E (tate-algebra-E-and-a-of-t), CPY's common-denominator theorem
(cpy-common-denominator) and Ω with the Carlitz period (omega-and-carlitz-period). Only its ABP item 27 goes to DM.8.
This extraction routes the same three results to DM.8 (entire-ring, constant-denominator) and DM.2 (omega).
PAPER-CHANG-CHEN-MISHIBA-23 agrees with this extraction (its items 30 and 61 at DM.8, 53 and 58 at DM.2). So these
results are planned in two places, and the sentence hides the conflict from the design job.

**Evidence.** PAPER-IM-KIM-LE-ETAL-24 (review verdict accept): route 1 (part-ii, DrinfeldModulesAndTModulesPartII)
includes tate-algebra-E-and-a-of-t, omega-and-carlitz-period, cpy-common-denominator, anderson-thakur-polynomials and
item 5 ('Put ℓ_0 := 1 and ℓ_d := ∏_{i=1}^d (θ − θ^{q^i})'). Its route 2 (source, DM.8) has items
['PAPER-IM-KIM-LE-ETAL-24/27'], the ABP criterion. This extraction: route 5 reason as quoted; route 6 brief 'Import …
DM.0 for Carlitz denominator arithmetic, DM.2 for C∞ and period/Ω analysis … DM.8 for generic twists, entire solutions,
ABP lifting and denominator descent'. research/blueprint/make_queue.py paper_designs groups every part-ii route by
parent into one design job; the queue holds DESIGN-DrinfeldModulesAndTModulesPartII (pending) for the three accepted
proposals. Also: Extraction route 5 reason: 'The two nearby paper routes already identify this shared owner; do not
re-plan these inside Part II.' research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.result.json: items
tate-algebra-E-and-a-of-t ('𝕋 is the Tate algebra … ℰ is the ring of series Σ a_nt^n ∈ K̄[[t]] with lim |a_n|^{1/n} = 0
and [K_∞(a_0,a_1,…) : K_∞] < ∞'), omega-and-carlitz-period, anderson-thakur-polynomials ('[k] := θ^{q^k} − θ and D_k :=
Π …') and cpy-common-denominator are all in its route 1 (part-ii, DrinfeldModulesAndTModulesPartII). Its
frobenius-twisting-and-sigma-ring and papanikolas-uniqueness-of-trivializations are planned at DM.8, and its item 27
(ABP) is a DM.8 source, so it agrees with this extraction only on those. PAPER-CHANG-CHEN-MISHIBA-23/30 (twist, T, E)
and /31 (ABP) go to DM.8, and /53 (Ω) is planned at DM.2. Also: PAPER-IM-KIM-LE-ETAL-24 notes read:
cpy-common-denominator, 'Missing: routed to route 1'; tate-algebra-E-and-a-of-t, 'ℰ is the ring in the ABP criterion …
Missing: routed to route 1'; omega-and-carlitz-period, 'Missing: routed to route 1'. Its route 1 is part-ii,
DrinfeldModulesAndTModulesPartII; its route 2 (DM.8) contains only item 27. The statements match this extraction's
items: cpy-common-denominator reads 'If F ∈ Mat_{r_1×r_2}(K̄(t)) satisfies F^{(−1)}Φ_2 = Φ_1F … the common denominator
of the entries of F lies in F_q[t]', which is constant-denominator here. Its ℰ is defined exactly as entire-ring here;
its Ω is defined exactly as omega here.

**Fix.** Replace the quoted sentence of route 5's reason with an accurate one. It should say that
PAPER-CHANG-CHEN-MISHIBA-23 routes the twisting setting and the ABP criterion to DM.8, and that PAPER-IM-KIM-LE-ETAL-24
routes only its ABP criterion there, sending T/E, Ω, the CPY denominator lemma and the Carlitz products to the Part II.
In the route 6 brief add a sentence naming those four PAPER-IM-KIM-LE-ETAL-24 items. It should say they are the same
statements as this extraction's entire-ring, omega, constant-denominator and carlitz-products, that they are owned by
the Drinfeld-module layers these routes name, and that the Part II imports them and does not plan them. In the report,
record a note for the maintainer that PAPER-IM-KIM-LE-ETAL-24's route 1 should drop those items in favour of the same
owners. If the maintainer prefers the Part II as owner, this extraction must instead move the same items to route 6; one
owner either way. Also: Correct route 5's reason. It should say that the nearby extractions agree on DM.8 for the twist,
the ABP criterion and trivialization uniqueness, and that PAPER-IM-KIM-LE-ETAL-24 routes E and the CPY denominator to
the Part II. Add to the route 6 brief: 'PAPER-IM-KIM-LE-ETAL-24 items tate-algebra-E-and-a-of-t,
omega-and-carlitz-period, cpy-common-denominator and the [k], D_k part of anderson-thakur-polynomials are the same
mathematics as PAPER-NGODAC-21/entire-ring, /omega, /constant-denominator and /carlitz-products; import them from the
DrinfeldModulesAndTModules layers to which this extraction routes them, and do not build them in the Part II.' Add a
note for the maintainer so that PAPER-IM-KIM-LE-ETAL-24's routes for these items are aligned. Also: In route 5's reason,
replace the sentence with: 'PAPER-CHANG-CHEN-MISHIBA-23 uses the same owners; PAPER-IM-KIM-LE-ETAL-24 routes its items
tate-algebra-E-and-a-of-t, cpy-common-denominator and omega-and-carlitz-period to the Part II, and these must be
re-routed as sources of DM.8 and DM.2.' Add the same sentence to the ownership section of the report
(PAPER-NGODAC-21.md). In route 6's brief, add: 'E, Ω and CPY's denominator theorem are imported from DM.8 and DM.2 and
are not planned in this Part II, even where a sibling extraction lists them in it.' Add a note for the maintainer to
correct the routing of PAPER-IM-KIM-LE-ETAL-24.

### /3 — error

**Where.** route 6 brief

**Claim.** The brief states the paper's theorems as: Thakur indices span Z_w; 'the smaller family with every entry<q is
independent at every weight; consequently the Thakur family is a basis and dim Z_w=d(w) for 1≤w≤2q−2'. Theorem D is not
a consequence of Theorems A and B. For q > 2 and q < w ≤ 2q−2, T⁰_w is a proper subset of T_w. For example, at q = 3 and
w = 4, |T_4| = d(4) = 6 but |T⁰_4| = 5 (the compositions of 4 into parts 1 and 2), so A and B give only 5 ≤ dim_K Z_4 ≤
6. The paper proves Theorem D from Theorem 6.2 (independence of the family T′_w of indices with no entry divisible by q,
for q > 2 and w ≤ 2q−2), Lemma 6.1 (|T′_w| = |T_w|) and Theorem A. The brief's list of 'theorems from this source' also
omits Theorem 6.2 and Corollary C, although the brief is meant to state the final theorems as the paper does. Severity
set to high by the coordinator: the brief's derivation is false, not just incomplete. The coordinator checked the
manuscript: p. 4 says "When q > 2, contrary to Corollary C, Theorem D needs both the algebraic part and the
transcendental part", and p. 5 that Theorem D follows from a lower bound for a different set T′_w (Theorem 6.2, p. 22).
A design job following the brief would plan Theorem D from Theorems A and B, which cannot work for q < w ≤ 2q − 2. A
false brief statement is high. Also: The brief states the paper's final theorems as: Theorem A; 'the smaller family with
every entry<q is independent at every weight; consequently the Thakur family is a basis and dim Z_w=d(w) for 1≤w≤2q−2.'
The 'consequently' is false. Theorems A and B together give a basis only for w≤q (Corollary C). For q<w≤2q−2 the
small-entry family is strictly smaller than the Thakur family, so A and B give only |I^0_w| ≤ dim_K Z_w ≤ d(w). Example:
q=3, w=4. I^0_4 consists of the 5 compositions of 4 into parts 1 and 2. The Thakur family
I^T_4={(1,1,1,1),(1,1,2),(1,2,1),(2,1,1),(2,2),(3,1)} has d(4)=d(3)+d(2)+d(1)=3+2+1=6 members. Theorem D rests on
Theorem 6.2 (for q>2 and w≤2q−2 the MZVs with no entry divisible by q are K-linearly independent) and on Lemma 6.1
(|T_w|=|T′_w|). The brief never states Theorem 6.2, and it omits Corollary C. It mentions only ingredients of 'the final
range extension'. A design job that follows the brief's statement of the final theorems would plan Theorem D as a
corollary of A and B and omit the theorem it actually needs. The extraction's summary and the report's table state the
logic correctly, so the brief contradicts them.

**Evidence.** The paper (p. 4): 'When q > 2, contrary to Corollary C, Theorem D needs both the algebraic part and the
transcendental part.' (p. 5): 'To prove Theorem D we construct another set of MZV's T′_w having the same cardinality as
T_w and succeed in extending Theorem B to this set. Thus we obtain a lower bound dim_K Z_w ≥ d(w). Combining this lower
bound with the upper bound of Theorem A yields dim_K Z_w = d(w), and Theorem D follows (see §6).' (p. 22): 'Theorem 6.2.
Suppose that q > 2 and w ≤ 2q − 2. Then MZV's in T′_w are all linearly independent over K.' I checked the counts by
enumeration: d(4) = 6 and |T⁰_4| = 5 at q = 3. Also: The paper (p. 4): 'Theorem D. Let w ∈ N with w ≤ 2q − 2. Then Tw is
a K-basis for Zw.' and 'When q > 2, contrary to Corollary C, Theorem D needs both the algebraic part and the
transcendental part.' The paper (p. 22): 'Theorem 6.2. Suppose that q > 2 and w ≤ 2q − 2. Then MZV's in T′w are all
linearly independent over K.' The paper (p. 24): 'Proof of Theorem D. Theorem D follows from Theorem A, Lemma 6.1 and
Theorem 6.2.' Counts checked by hand: |I^0_4|=5 and d(4)=6 at q=3.

**Fix.** Replace the sentence in the route 6 brief by: 'the smaller family with every entry<q is K-linearly independent
at every weight (Theorem B), so the Thakur family is a basis for 1≤w≤q (Corollary C); for q>2 and 1≤w≤2q−2 the family of
indices with no entry divisible by q is K-linearly independent (Theorem 6.2), and with |T′_w|=|T_w| (Lemma 6.1) and
Theorem A this gives that the Thakur family is a basis and dim_K Z_w=d(w) for 1≤w≤2q−2 (Theorem D; for q=2 it is
Corollary C).' Also: In route 6's brief, replace the sentence after Theorem A with: 'the family with every entry<q is
K-linearly independent at every weight (Theorem B), so the Thakur family is a K-basis of Z_w for 1≤w≤q (Corollary C);
for q>2 and 1≤w≤2q−2 the family of indices with no entry divisible by q is K-linearly independent (Theorem 6.2); it has
the same cardinality d(w) as the Thakur family (Lemma 6.1); with Theorem A this gives Theorem D: for every q and
1≤w≤2q−2 the Thakur family is a K-basis of Z_w and dim_K Z_w=d(w).'

### /4 — error

**Where.** PAPER-NGODAC-21/omega, PAPER-NGODAC-21/dual-motive, PAPER-NGODAC-21/twist, PAPER-NGODAC-21/entire-ring;
routes 2, 3 and 5; route 6 brief; route 2; PAPER-NGODAC-21/omega; PAPER-NGODAC-21/period-power; route 3;
PAPER-NGODAC-21/dual-motive; PAPER-NGODAC-21/twist

**Claim.** The routing places two consumers in layers that the atlas puts below their suppliers, which creates
stage-level dependency cycles. PAPER-NGODAC-21/omega (route 2, DM.2) depends on PAPER-NGODAC-21/twist and
PAPER-NGODAC-21/entire-ring, and PAPER-NGODAC-21/dual-motive (route 3, DM.4) depends on PAPER-NGODAC-21/twist. Route 5
sends both twist and entire-ring to DM.8. In the atlas, DM.8 requires DM.2 and DM.4, while DM.2 requires only DM.0 and
FA.2 and DM.4 requires only DM.0. To state Ω^(−1)=(t−θ)Ω, Ω∈E and Ω∈T^×, DM.2 would have to import from DM.8, and to
state σf=f^(−1)σ, DM.4 would have to import from DM.8. That gives the cycles DM.2→DM.8→DM.2 and DM.4→DM.8→DM.4. The
dependencies are genuine. The paper defines the twist (p. 16) before it uses the twist in the definition of K̄[t,σ] and
in the functional equation of Ω (p. 17), and the omega item itself asserts Ω∈E. A mechanical check of the extraction
finds exactly these three item edges that point from a lower layer to a higher one: omega←twist, omega←entire-ring and
dual-motive←twist. Also: Route 2 sends omega to DrinfeldModulesAndTModules:DM.2. Its statement, however (Ω ∈ E, Ω ∈ T^×,
Ω^(−1) = (t−θ)Ω, simple zeros at θ^{q^i}), and its recorded dependencies use PAPER-NGODAC-21/entire-ring and
PAPER-NGODAC-21/twist. Route 5 sends both of those to DM.8. In the atlas DM.8 requires DM.2, so the prerequisite link
from DM.8 to DM.2 that omega needs would close a cycle. period-power, also in route 2, inherits the defect through its
dependency on omega. DM.2 plans uniformization at the level of fields over C∞, not series in the auxiliary variable t. Ω
is the rigid analytic trivialization of the Carlitz dual motive (Φ = t − θ), that is, the rank-one case of the 'analytic
trivialization matrix' that DM.8 builds. Also: Route 3 sends dual-motive to DrinfeldModulesAndTModules:DM.4. Its only
non-library dependency is PAPER-NGODAC-21/twist, which supplies the rule σf = f^(−1)σ, and route 5 sends twist to DM.8.
In the atlas DM.8 requires DM.4, so the link from DM.8 to DM.4 that dual-motive needs would close a cycle. twist also
depends on C-infinity (DM.2), which is not an ancestor of DM.4. The dual-motive definition needs only the inverse
coefficient twist on K̄[t], where K̄ is a perfect field. It does not need the extension of the twist to C∞((t)), the
Tate algebra or E, which is what ties twist to the analytic layers.

**Evidence.** data/atlas.json: DrinfeldModulesAndTModules:DM.8 'requires': [DM.2, DM.4]; DM.2 'requires': [DM.0,
FunctionFieldArithmetic:FA.2]; DM.4 'requires': [DM.0]. Extraction: omega 'dependencies': [C-infinity, entire-ring,
twist], in route 2 (stages [DM.2]); dual-motive 'dependencies': [ore-carrier, twist], in route 3 (stages [DM.4]); twist
and entire-ring in route 5 (stages [DM.8]). Paper p. 16: 'We denote by K̄[t,σ] be the non-commutative K̄[t]-algebra
generated by a new variable σ with the rules σf = f^(−1)σ for all f ∈ K̄[t]'. Paper p. 17: 'Ω(t) := (−θ)^{−q/(q−1)}
∏_{i≥1}(1 − t/θ^{q^i}) ∈ T^× so that Ω^(−1) = (t−θ)Ω'. The DM.8 packet itself asks DM.4 (not DM.8) for 'Papanikolas dual
Anderson σ convention σ(c)=c^(1/q), σ(t)=t'. The DM.0 packet already has node
DrinfeldModulesAndTModules:DM.0/frobenius-action, the q-power action on an F_q-algebra. Also: Atlas:
DrinfeldModulesAndTModules:DM.8 has requires ['DrinfeldModulesAndTModules:DM.2', 'DrinfeldModulesAndTModules:DM.4'].
DM.2: 'Over the completed algebraic closure C_infinity of K_infinity with its standard generic characteristic embedding,
construct the entire exponential … Restrict automatic uniformization to this field setting; t-modules and families over
Tate algebras require separate uniformizability hypotheses.' DM.8: 'Build the analytic trivialization matrix and prove
the specialization/lifting criterion'. In the extraction, omega's dependencies are [C-infinity, entire-ring, twist] and
period-power's are [omega, C-infinity]; entire-ring and twist are in route 5 (DM.8). The paper (p. 17): 'Ω(t) :=
(−θ)^{−q/(q−1)} ∏_{i≥1}(1 − t/θ^{q^i}) ∈ T^× so that Ω^(−1) = (t − θ)Ω and 1/Ω(θ) = π̃'. Also: Atlas:
DrinfeldModulesAndTModules:DM.4 requires only ['DrinfeldModulesAndTModules:DM.0']; DM.8 requires
['DrinfeldModulesAndTModules:DM.2', 'DrinfeldModulesAndTModules:DM.4']. Dependencies recorded in the extraction:
dual-motive → [ore-carrier, twist]; twist → [C-infinity]. The paper (p. 16): 'We denote by K[t, σ] the non-commutative
K[t]-algebra generated by a new variable σ with the rules σf = f^(−1)σ for all f ∈ K[t]', with K̄ the algebraic closure
of K, and Definition 4.1 uses only this ring.

**Fix.** Split PAPER-NGODAC-21/twist in two. (a) The coefficient twist on K̄[t], K̄(t) and matrices over them. The
inverse twist needs only that K̄ is perfect, and it extends the DM.0/frobenius-action node. Route it as a source to
DM.4, or to DM.0, and make dual-motive depend on it. (b) The twist on C∞((t)), on T and on E. Route it as a source to
DM.2, and route entire-ring from route 5 to DM.2 with it. DM.2 already constructs entire functions over C∞, and DM.8's
items (entire-from-equation, ABP-*, constant-denominator) may import from DM.2. If the fixer prefers to keep twist and E
at DM.8, the alternative is to route omega, together with period-power (which depends on omega), and dual-motive to DM.8
instead. In either case, update the route 2, 3 and 5 item lists, rewrite the route 6 brief's import sentence ('DM.2 for
C∞ and period/Ω analysis, DM.4 for the exact dual motive interface, … DM.8 for generic twists, entire solutions …') to
match, and check that every item routed to a DM layer depends only on items in that layer or in layers it requires.
Also: Move PAPER-NGODAC-21/omega from route 2 to route 5 (DM.8). DM.8 already receives twist and entire-ring and imports
DM.2's Carlitz period, so the identity 1/Ω(θ) = π̃ is proved there. Keep period-power in route 2, but change its
dependencies from [omega, C-infinity] to [C-infinity]. Its own proof steps use only that π̃ lies in (−θ)^{1/(q−1)}·K∞^×,
which comes from DM.2's Carlitz period, not from Ω. Rewrite route 2's reason so that it no longer claims the Ω product
for DM.2. In the route 6 brief, change 'DM.2 for C∞ and period/Ω analysis' to 'DM.2 for C∞ and the Carlitz period, DM.8
for Ω'. An alternative with the same effect is to move twist (its C∞-series part) and entire-ring to route 2 instead.
That needs no new link, since DM.2 is already an ancestor of DM.8. Under either option, never add a link from DM.8 to
DM.2. Also: Split PAPER-NGODAC-21/twist in two. The first part is a new item: the coefficient twist f ↦ f^(n), n ∈ Z
(using the inverse Frobenius of the perfect field K̄), on K̄[t], K̄(t) and their matrices. Route it to DM.4 in route 3;
DM.0 also works, next to the q-power Frobenius action that the DM.0 blueprint packet already plans. The second part, the
extension to C∞((t)), the Tate algebra and E, stays with entire-ring. Make dual-motive depend on the new algebraic item
only. An alternative is to move twist whole into route 3 and add the prerequisite link from DM.2 to DM.4. That link
closes no cycle, since there is no path from DM.4 to DM.2. Never add a link from DM.8 to DM.4.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 4; … | Route 4 sends gamma (the Carlitz factorials Γ_n and Γ_s = ∏Γ_{s_i}) and small-power-sum (S_d(a) = ℓ_d^(−a) for 1 ≤ a ≤ q, and S_<d(q−1) = … |
| /2 | high | duplicate | route 5 reason; … | Several objects now have two owners through accepted routes. This is in addition to the factorial and small-power-sum statements of route 4. The accepted Part … |
| /3 | high | error | route 6 brief | The brief states the paper's theorems as: Thakur indices span Z_w; 'the smaller family with every entry<q is independent at every weight; consequently the … |
| /4 | high | error | PAPER-NGODAC-21/omega, PAPER-NGODAC-21/dual-motive, …; … | The routing places two consumers in layers that the atlas puts below their suppliers, which creates stage-level dependency cycles. PAPER-NGODAC-21/omega (route … |
| /5 | medium | error | route 5; … | Route 5 sends monic-frobenius-descent and theta-degree-bound to DrinfeldModulesAndTModules:DM.8 as sources. These two worker derivations exist only to supply … |
| /6 | medium | missing | PAPER-NGODAC-21/rev-canonical-power-sum-product-expansions and …; … | The review added these two items, but neither is connected to the dependency graph. They have no dependencies field and no item depends on them. They also have … |
| /7 | medium | other | PAPER-NGODAC-21/omega, PAPER-NGODAC-21/C-infinity, …; … | The manuscript normalises the Carlitz period as π̃ := 1/Ω(θ) (p. 17, as in Chang 2014 (3.1.3)). Papanikolas 2008 uses the same Ω but π̃ = −1/Ω(θ), and the DM.8 … |
| /8 | medium | missing | PAPER-NGODAC-21/AT-polynomials (and the locator of … | The paper asserts that the Anderson–Thakur polynomials are integral: 'α_n(t) ∈ A[t]' (p. 17), so that H_n ∈ A[t]. The item AT-polynomials only defines α_n by … |
| /9 | medium | missing | PAPER-NGODAC-21/rev-prefix-and-suffix-closure-of, … | The review added the prefix and suffix closure of I^0 and I′ (Remark 5.1, Lemma 6.1(2)) as an item, but did not connect it to the dependency graph. The item … |
| /10 | medium | missing | PAPER-NGODAC-21/trivialization-uniqueness, …; … | trivialization-uniqueness's only proof step uses that the twist-fixed elements of L=Frac(T) are F_q(t), which is rev-twist-fixed-field-of-the (Papanikolas … |
| /11 | low | other | report (PAPER-NGODAC-21.md), opening summary | The report's opening summary still gives the pre-review counts: 'The result has 108 items: 5 library, 3 planned and 100 missing' and 'Twelve are recorded under … |
| /12 | low | error | PAPER-NGODAC-21/chen-coefficient (test …; … | The test still reads 'q=3,a=b=2 gives Δ_2=2 in F_3', which is false: Δ_2(2,2) = (−1)·C(1,1) + (−1)·C(1,1) = −2 = 1 in F_3. The review found this but recorded … |
| /13 | low | error | PAPER-NGODAC-21/B-small (review note) | The note says 'fix((v),t) = [(v+t_1, t_−)] exactly when v + t_1 ≤ q'. The 'only if' half is false. In characteristic 2, Δ_i(a,a) = 2(−1)^{a−1}C(i−1,a−1) = 0 … |
| /14 | low | error | PAPER-NGODAC-21/binary-relation (test CharPMZV.binary_relation.test3) | The non-example test says 'Checking d≥0 alone is weaker than the stated all-integer predicate, because d=−1 tests the shifted boundary.' For a weight-w family … |
| /15 | low | missing | PAPER-NGODAC-21/restricted-carrier, PAPER-NGODAC-21/AT-bound, …; … | The paper equips T with the Gauss norm ‖·‖ (p. 16). It uses that norm in the bound ‖H_n‖ < /θ/^{nq/(q−1)} (p. 17), and Chang's Lemma 5.3.1 uses it to put L(s) … |
| /16 | low | error | PAPER-NGODAC-21/prefix-difference-zero (third proof step); … | Both texts say the maximal-weight coefficients B_t are killed by 'lower-weight algebraic independence'. The input the paper uses, and the only one the … |
| /17 | low | other | PAPER-NGODAC-21/omega | The item asserts 'Ω∈E (entire, with coefficients in the finite extension K∞((−θ)^{1/(q−1)}))'. Membership in E also requires every coefficient to lie in K̄, … |
| /18 | low | error | route 6 brief | The Part II brief gives the Part II work that this extraction routes to DM.2 and DM.8. It says 'Import the verified Tau Ceti high-degree Riemann–Roch theorem … |

## Notes for the fix job

- **Cycles.** Move omega to DM.8 (or split the twist into an algebraic part at DM.4/DM.0 and an analytic part at DM.2),
  and move gamma and small-power-sum to the Part II (route 6), dropping its DM.6 import.
- **Owners.** Name one owner for 𝕋/ℰ, Ω, the CPY denominator lemma, [k]/D_k/ℓ_d and the Kuan–Lin lemmas, in agreement
  with the accepted PAPER-IM-KIM-LE-ETAL-24 and PAPER-CHANG-CHEN-MISHIBA-23 routes, and correct route 5's reason.
- **Theorem D.** State Theorem 6.2, Lemma 6.1 and Corollary C in route 6's brief and derive Theorem D from them.
