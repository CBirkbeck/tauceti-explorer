# REV-RT-AREA-iwasawa-2

Independent verification of all six findings for issue #1496.
Verifier: **Codex — codex-hjdg0j**, 2026-09-24. Input author:
**Claude Code — cc-7b31c4**. This verifier did not write the input red team.

**Five confirmed (1–5), one rejected (6).** Confirmation is for the specific
missing construction/interface stated in the reason, not every assertion or
proposed repair in the finding. In particular, finding 3 incorrectly calls the
Colmez–Nizioł route accepted. Its actual rejected status remains in force;
the confirmed issue is the remaining shared log-syntomic construction, whose
scope exceeds D.2. Finding 6 misses RS-16's explicit decision to retain the
independent proof routes.

## Baseline and method

Repository baseline: `7f01739fc3f4b5f0d7d1148adf4d8975507760ac`.
Read all six findings and the entire input report, the named stage contracts,
the relevant README passages and integrated nodes, their reviewed coverage,
the cited routes and their current review verdicts, and the relevant accepted
RS-13/14/16/26/08 decisions. Used the complete assembled atlas, including
accepted links, restructurings and decompositions, with **2608 stages and
7361 unique directed prerequisite/edge pairs**. Searches and reachability are
against that assembled state, not just the raw snapshot's stage list.

The audit records inspected are DirichletPadicLFunctions L3 (AUDIT-24),
PadicHodgeRegulators D.2/D.5 and PadicMeasuresIwasawaAlgebras L6 (AUDIT-26),
LocallyAnalyticDistributions L4 and IntegralIwasawaTheory I.5/I.6/I.7
(AUDIT-25), and EulerSystemsCyclotomicMainConjecture L3/L4 (AUDIT-24).
An audit's duplicate lead is evidence to investigate; it does not override a
later accepted decision to retain distinct proof methods.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Targeted full-tree Lean
searches found no Morita p-adic Gamma, Gross–Koblitz, Ferrero–Greenberg,
character-group-ring, quadratically-presented-module, compound-matrix or
higher-adjugate declaration under the searched terms. This is bounded negative
evidence, not a universal nonexistence proof. Existing exterior powers,
determinants, minors, presentations and homological carriers are to be reused.
No positive library-declaration claim is newly certified by this review.

Accepted source routes already assign the mathematics in 1, 2, 4 and 5 to
owners. These findings warrant explicit integration into their layer contracts
and eventual fine nodes, rather than fresh competing roadmaps. This distinction
also prevents treating the disappearance of a phrase from a stage summary as
proof that nobody has planned it anywhere in the programme.

Disclosure: this session previously reviewed PAPER-COLMEZ-NIZIOL-17. That
earlier review is read as a current repository decision, not offered as new
independent proof of its own correctness. The present task independently checks
another session's red-team claim against the current route state and rereads the
primary source. The issue prohibits verifying one's own red-team findings;
none of these six is this verifier's work.

## Decisions

### RT-AREA-iwasawa-2/1 — confirmed (medium)

Confirmed the missing explicit layer/API contract, with a correction to 'unowned': accepted DKV18 source route 3 already assigns these items to DirichletPadicLFunctions:L3. It is the live stage/blueprint contract that has not incorporated them. I read that route and its acceptance, L0–L3 in the README, the reviewed L3 audit, and DKV's published p.836 (PDF p.4), which invokes Gross–Koblitz rather than stating its full formula. Fresh searches of both pinned Lean trees and all 2608 assembled stages found no p-adic Gamma/Gross–Koblitz implementation or producer. Gross–Koblitz's original pp.569–571 (scanned PDF pp.2–4, inspected visually) supply Morita's positive-integer limit, both unit/nonunit recurrences, the additive-character/prime choice, and Theorem 1.7. Extend L3, importing Gauss sums from L0/L2 rather than reconstructing them. Fix the additive character and its unique pi with pi^(p−1)=−p and pi congruent to zeta_p−1 modulo (zeta_p−1)^2; reconcile the original paper's NEGATIVE Gauss-sum convention with the consumer's convention. Keep the finite-field q=p^f and prime-to-p denominator conditions explicit. The original paper assumes odd p; a dyadic extension is a separate source obligation, not justified by this theorem. Define Gamma_p on Z_p with values in its units, prove continuity/uniqueness and the recurrences, and test positive integers, zero and a unit/nonunit step. Its analyticity on pZ_p does not mean a single analytic function on the whole closed unit disc. No new competing roadmap is needed; no claim that the full original proof has been decomposed is made.

### RT-AREA-iwasawa-2/2 — confirmed (medium)

Confirmed the missing derivative-formula contract, under the same already accepted L3 ownership as finding 1. DKV's published p.836 explicitly distinguishes the Ferrero–Greenberg derivative input from Gross–Koblitz. L3 contains Leopoldt's value-at-one and pole statements but no derivative-at-zero theorem, and the other Ferrero occurrences concern mu=0 (Ferrero–Washington), which is different. Besides the cited passage I read Gross's 'Two encounters with the p-adic Stark conjecture', pp.3–4: for an odd primitive character chi of conductor N prime to p, with chi(p)=1 and log_p(p)=0, the simplified formula is L_p'(chi omega,0)=sum_{1≤a<N} chi(a) log_p Gamma_p(a/N), in compatible coefficient embeddings. The general formula has the additional (1−chi(p)) B_{1,chi} log_p(N) term; it may be omitted only in the exceptional case. State and compare the branch/character and derivative-coordinate conventions explicitly. The accepted paper review already removed an unsupported nonvanishing clause; do not restore it merely from the displayed identity. A nonvanishing/order-one deduction needs its own inputs and proof. Add the formula after the Gamma construction in L3 and retain the general statement only with its correction term and source range. The original Ferrero–Greenberg proof has not been independently extracted here; the precise omission and its use are established, not a completed proof plan.

### RT-AREA-iwasawa-2/3 — confirmed (high)

Confirmed the missing general log-syntomic producer, but the claimed conflict between accepted routes is false at this baseline and the proposed D.2 ownership is wrong. PAPER-COLMEZ-NIZIOL-17 has verdict revise: route 5 is explicitly rejected, and items 4,5,8,9 are marked missing with their old D.2 planned references removed. The analogous CDN20 route 7 is also rejected. RS-26 deliberately retains D.2's smooth/unramified regulator scope. I reread the current decisions, D.2/D.5, PR.4/PR.8, CP.4, and the authors' logvanishing6.pdf pp.2–3. The source defines the period map into the MODIFIED twist Z/p^n(r)' for general r; the unmodified twist and actual isomorphism are the small range 0≤i≤r≤p−1. The formal-scheme exponential has its own quasi-compact semistable hypotheses and distinct isomorphism/injectivity ranges. Neither PR's Nygaard construction nor CP.4's rational proper semistable B_st comparison asserts this entire classical integral/open package or its comparison. Complete the already requested shared syntomic/nearby-cycle route revision in the CohomologyComparisons Part-II direction, importing CR.5's log geometry and CR.6's Hyodo–Kato inputs and reconciling the overlap with PR.4/PR.8. D.2 remains an application of the appropriate smooth specialization; D.5's bad/semistable extension imports the new exact statement when formulated. Do not force all good-reduction regulators to depend on the full logarithmic theory or create another standalone regulator-owned syntomic carrier. The candidate CR.5/CR.6 → early classical-log-syntomic producer → D.2/D.5 topology is acyclic, but is not a completed source or API closure argument. This confirms a real remaining construction obligation while preserving the existing rejected-route review boundary; it does not reclassify those routes as accepted.

### RT-AREA-iwasawa-2/4 — confirmed (medium)

Confirmed the missing character-ring/square-presentation interfaces and the absent L6→I.6/I.7 imports. The accepted DK23 route 3 already assigns this algebra to L6; the gap is its explicit integration, not absence of a routing decision. Read DK 2010.00657v3 §§2.2–2.3 (pp.15–18), Lemma 3.9 (pp.25–26) and §6.1 (p.40), L6/I.6/I.7 and their reviewed audits. R_Psi is the IMAGE of O[G] in the product over selected characters, generally a nonmaximal order, not that full product. Preserve finite abelian G, sufficient coefficient roots and the odd-p scope of the source; arbitrary character-ring quotients are not automatically Gorenstein. Lemmas 2.4–2.5 require a non-zero-divisor and the stated finiteness; Lemma 2.6 requires a square presentation of the quotient. Crucially # gives R_Psi ≅ R_{Psi inverse}; it is not an endomorphism of R_Psi unless the character set is inverse-stable. Transpose is presentation-dependent up to projective summands, and the Fitting identity compares the appropriate two coefficient rings. Accepted RS-16 now imports the BASIC Fitting carrier from upstream StableReduction Layer 1, not a second IHG carrier; L6 owns the order-specific extensions. Upstream QuiverRepresentations Layer 6C also plans transpose in its finite-dimensional algebra setting: reuse the abstract presentation construction and prove compatible specialization rather than duplicate its Auslander–Reiten development. The higher-adjugate step must prove the right-sided identity C_r(A') adj_r(A')=det(A') I and use the vector obtained by embedding adj_r(A')x; the source's displayed left multiplication does not on its own prove preservation of the image of the rectangular compound matrix. Record that proof-order correction when decomposing the source. Reuse exterior powers/minors and retain all finiteness hypotheses. L6→I.6 and L6→I.7 are absent and jointly acyclic (the latter becomes redundant through I.6); arithmetic presentations and Brumer–Stark comparisons remain in I.6/I.7.

### RT-AREA-iwasawa-2/5 — confirmed (medium)

Confirmed the missing complex-level contract, with substantive corrections to the suggested repair. Accepted BCGP21 route 28 and BCGP25 route 4 already allocate it to LAD, but its live L4 and all 13 integrated operator nodes still cover modules, not representative-independent finite-slope complexes. Read BCGP21 v3 §6.1.1, p.139: compactness is through a bounded projective Banach representative with degreewise compact maps. The product of degreewise Fredholm series is an auxiliary presentation; the invariant spectral support is defined from the cohomology sheaves, not by asserting that this raw product is invariant under every quasi-isomorphic replacement. Preserve the recorded ≤h correction to the complement condition and compare with the module case. BCGP25 Definition 2.2.17, p.21, requires countable affinoid exhaustion with dense restrictions for quasi-Stein and relative compactness for Stein. Its actual §4.6.46 construction is on p.94 (beginning on p.93): M^fs=f_*f^*M in SOLID derived categories over the character space, and Remark 4.6.47 expressly says it is stronger than merely inverting the monoid. Thus one cannot satisfy that routed item by excluding solid foundations and silently substituting the 2021 Banach construction. Import the shared exact/derived and solid-comparison foundations proposed in BCGP25 route 17, respecting the outstanding CDN20 review objections, or prove a restricted comparison with exactly the required scope. Separate the early analytic foundation from L4's later application so importing a whole Part II does not introduce a circular parent dependency. Generic Stein geometry and cohomology also need a single geometric owner; RF0 already has a specialized Stein exhaustion of the relative Fargues–Fontaine space, so 'no Stein in the atlas' is too broad, but it does not supply the general character-space result. PadicFamilies:L2a already imports L4 and should consume the extended complex interface, keeping its eigenvariety gluing. The 2025 derived localization need not itself have a compact perfect Banach representative, and no equivalence is inferred solely from the common phrase finite slope.

### RT-AREA-iwasawa-2/6 — rejected (medium)

Rejected against the accepted restructuring record. RS-16.result.json's IntegralIwasawaTheory:I.5 decision explicitly retains the independent Mazur–Wiles and odd-prime totally-real Wiles Hecke/congruence proof routes and says the cyclotomic Euler-system method is not a supplier replacing either. This is precisely the deliberate-two-proofs option in the finding's proposed fix, already decided by an accepted review and present in data/restructure. I read that decision, I.5, EulerSystemsCyclotomicMainConjecture L0–L4 and its README, the pertinent integrated endpoint nodes and audit records, and B.4. The README names Kolyvagin–Rubin as its route of record and distinguishes the independent modern totally-real proof. There is no assembled L4→I.5 path, but independence makes that absence appropriate rather than an omission. The reviewed audit's duplicate lead does not override RS-16's subsequent explicit decision. Preserve the separate methods and their shared carrier/normalization imports; do not narrow I.5 to Wiles-only or replace its Hecke-theoretic proof by an Euler-system import. B.4 still needs I.5's totally-real arithmetic Euler-characteristic theorem. This verdict does not claim those proofs are complete or their existing partial decompositions closed; it rejects the assertion that no restructuring has resolved the proof-route ownership.

## Source register and reading limits

Public sources accessed 2026-09-24. Pages are **physical PDF pages starting
at 1**. Hashes identify the versions consulted. This review verifies the cited
omissions and repair boundaries; it is not a complete extraction of these papers.

| Source | Pages consulted | SHA-256 |
| --- | --- | --- |
| [Dasgupta–Kakde–Ventullo, published 2018](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p03-s.pdf) | 3, 4 | `974e64272b1883923fac951f86f3491593543d050c8efaf739e53342623fb659` |
| [Colmez–Nizioł, authors’ logvanishing6.pdf](https://webusers.imj-prg.fr/~wieslawa.niziol/logvanishing6.pdf) | 2, 3 | `161d72d919c0798bec4dcec88550bf38b09b9e5c8a5fc554177aadb214124db0` |
| [Boxer–Calegari–Gee–Pilloni, 1812.09269v3](https://arxiv.org/pdf/1812.09269v3) | 139, 140 | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| [Boxer–Calegari–Gee–Pilloni, 2502.20645v1](https://arxiv.org/pdf/2502.20645v1) | 21, 92, 93, 94 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| [Dasgupta–Kakde, 2010.00657v3](https://arxiv.org/pdf/2010.00657v3) | 14, 15, 16, 17, 18, 25, 26, 40 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [Gross–Koblitz, published 1979 scan](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | 1, 2, 3, 4 | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Gross, Two encounters with the p-adic Stark conjecture](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf) | 3, 4 | `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027` |

The Gross–Koblitz scan was inspected as images: p.1 is the archive cover and
pp.2–4 are printed pp.569–571. Its statement and conventions were read; its
crystalline/Stickelberger proof is not claimed as extracted. DKV's p.836
invokes the two classical formulas but does not itself give their full proof.
The Ferrero–Greenberg formula was additionally checked in Gross's account;
the original 1978 proof remains a source obligation. The Gamma tests and the
explicit branch/normalization comparisons belong in the follow-up blueprint.

The CN small-twist theorem is quoted there from Kato/Kurihara/Tsuji; their
proofs are not newly audited here. The all-twist bounded-error theorem is not
silently strengthened to an integral isomorphism. The distinction between
unprimed and denominator-adjusted twists and between scheme and formal-scheme
exponentials is part of the repair.

The DK higher-adjugate passage needs the right-sided image argument stated in
the verdict. The existing local source-issue register and extraction do not
record that wording correction. This review does not claim an exhaustive
erratum search or novelty; the fixer should record and verify the proof-order
correction at source decomposition, not copy the incomplete image inference.
No mathematical falsehood of Lemma 3.9 is alleged.

The BCGP21 representative/support comparison and BCGP25 solid localization
require their full imported functional-analysis proofs. The accepted BCGP25
route points to a shared foundation, while the related CDN20 proposal still has
review objections. Neither a route label nor an abstract derived category
discharges those exactness, tensor, topology or comparison obligations.

## Dependency check and fix handoff

The following six graph-new candidate edges were tested together. No edge has
a return path in the augmented graph, so these additions introduce no cycle.
This does not certify the whole pre-existing graph as acyclic.

| Supplier | Consumer |
| --- | --- |
| `CrystallineCohomology:CR.5` | `proposal:classical-log-syntomic` |
| `CrystallineCohomology:CR.6` | `proposal:classical-log-syntomic` |
| `PadicMeasuresIwasawaAlgebras:L6` | `IntegralIwasawaTheory:I.6` |
| `PadicMeasuresIwasawaAlgebras:L6` | `IntegralIwasawaTheory:I.7` |
| `proposal:classical-log-syntomic` | `PadicHodgeRegulators:D.2` |
| `proposal:classical-log-syntomic` | `PadicHodgeRegulators:D.5` |

The log-syntomic vertex is a **provisional early producer**, not a live or
accepted new roadmap. Its test shows that the named imports/applications have
no topological obstruction; it does not settle their source closure or mandate
the full logarithmic package for every smooth regulator. Follow the existing
route revision and import only the exact specializations each application needs.
The direct L6→I.7 edge becomes optional once I.6 imports L6. L4→PadicFamilies:L2a
already exists and should be reused. The rejected Euler-system→I.5 substitution
is not included.

For the follow-up fix: integrate Gamma and the derivative formula once at L3;
resolve the shared classical log-syntomic producer through the pending route
revision while preserving D.2's boundary; add the character-order algebra and
its I.6/I.7 interfaces under the accepted basic-Fitting ownership; and extend
L4 with exact complex/solid foundation comparisons. Preserve RS-16's independent
main-conjecture proof programmes. Definition APIs, tests, source proof nodes and
fine dependency checks remain part of those implementations, not work claimed
complete by this two-file verification.

## Validation

Exactly six input finding IDs receive exactly one verdict. Only the prescribed
review JSON and this report are deliverables. Run `scripts/check_redteam.py`
and `intake.py check-files` on them and record the actual results in the PR.
Before publication, compare the tracked input hashes and complete graph input
file sets against current main. No Lean file is required or changed; compilation
is not applicable. No result is claimed formalized.
