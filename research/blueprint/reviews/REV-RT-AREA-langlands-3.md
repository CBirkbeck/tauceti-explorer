# Independent verification: RT-AREA-langlands-3

Verifier: Codex, session `codex-hjdg0j`. Job REV-RT-AREA-langlands-3, issue #1504. Input by Claude Code `cc-7b31c4`. I did not write the red-team input or review Dospinescu–Le Bras17. I have separately verified RT-AREA-langlands-1 and RT-AREA-iwasawa-2; those verdicts are not evidence for this review. The source passages and ownership decisions below were checked again against repository snapshot `cfbdebea0365cc2f6aefac36bc7ffa64647cec0e`.

**Result: findings 1 and 4 confirmed; findings 2 and 3 rejected.** Confirmation applies to the scoped repairs below, not every sentence of the proposed fixes.

## Evidence and coverage

Read the full input JSON/report, the issue, WORKERS/PROTOCOL (including §17), UPSTREAM_GUIDE, BROWSER_AGENTS and expansion protocol. Checked the assembled atlas (2,608 stages, including reviewed fine nodes), the named stage descriptions, accepted paper routes and their independent route verdicts. Source routes, proposals and live stages are distinguished throughout. RS-21 has no review object and supplies no accepted ownership decision.

Read `data/library-coverage.json`, including AUDIT-31's R31.1/2/4 entries and AUDIT-13's R15.4 entry. These report the arithmetic constructions absent. The aggregate has no reviewed ML or R20 entries; AUDIT-33's pending ML audit was read only as additional unpromoted evidence. It itself distinguishes ML.1–3 mathematical layers from the registry layers. Searches of the pinned Mathlib `082e2d3` and Tau Ceti `f790474` Lean trees for packet/classification, companion-form and completed-cohomology terms found no supplier; the single “companion form” hit describes an unrelated contour-integrability lemma. No positive library declaration is used to discharge any claim, and no absence conclusion rests on a name search alone.

Public source locators checked:

- [Gan–Takeda, *The local Langlands conjecture for GSp(4)*](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf), Main Theorem and proof architecture, printed pp. 1841–1844.
- [Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, 2410.13504v3](https://arxiv.org/pdf/2410.13504v3), pp. 5 and 15, especially §0.4. Version/status checked against its public arXiv record on 24 September 2026.
- [Newton–Thorne, 2212.03595v2](https://arxiv.org/pdf/2212.03595v2), Theorems 6.4–6.5 and proof, p. 50.
- [Boxer–Calegari–Gee–Newton–Thorne, 2309.15880](https://arxiv.org/pdf/2309.15880), §1.3 pp. 9–11, Theorems E–G. Local PDF SHA-256 `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d` identifies the version read.
- [Gross, *A tameness criterion*](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Proposition 13.8, Theorem 13.10 and Corollary 13.11, printed pp. 497–498 (PDF pp. 53–54); §12's Proposition 12.1 was also inspected to distinguish its ordinary filtration from a blanket weight-one statement.
- [Coleman–Voloch, *Companion Forms and Kodaira–Spencer Theory*](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf), public 21 May 1992 version, introduction pp. 1–3, Theorem 0.1 and Corollary 0.2. Read through the public PDF reader after a direct download returned HTTP 403.
- [Dospinescu–Le Bras, 1509.00606v2](https://arxiv.org/pdf/1509.00606v2), §4.1 pp. 20–21, §5.1 pp. 25–26, and the complete §13 argument pp. 69–73.

This verifies the findings and their repair boundaries. It is not a new extraction of every cited paper, a proof audit of Arthur's entire classification, or a claim of Lean formalisation.

## 1. Classical-group construction inputs — confirmed

ML.4 requires proof-source owners for classification, yet its accepted routes continue to use it as the supplier of Gan–Takeda, Arthur's packets and multiplicities. ET.6 constructs the characteristic-zero correspondence for GL_m and its inner forms; ET.7a proves a scoped unitary transfer, expressly insufficient to recover every local packet member. ET.3 expressly excludes a general weighted fundamental lemma. AS.6's invariant trace formula does not supply the missing classification.

The strongest apparent counterexample is the accepted `GSp4LocalLanglandsAndGaloisRepresentations` proposal in BCGP21 route 4. Reading its **Scope**, **Joined proposal**, prerequisites and review resolves it: Gan–Takeda, Definition 2.3.1 and Arthur transfer/multiplicities are imported from ML.4. Its own construction starts with the explicit local theory built on that correspondence and extends to Galois representations. BCGP21 route 8 names the corresponding ML.4 inputs. This proposal therefore does not fill the gap, but a new classification branch must preserve its existing local, archimedean and Galois tasks rather than duplicate them.

Also checked the accepted ML.4 routes in Gan–Ichino18 (route 3), Gan–Savin23 (4), Gan–Savin23-B (4), Chenevier–Taïbi20 (8), Ichino–Prasanna23 (7), Jiang–Zhang20 (4), CG20 (15) and Pilloni20 (14). Their scopes differ: odd orthogonal inner forms and generic global parameters, Xu's similitude packets, and real/cohomological packet comparisons are not one interchangeable theorem. The input lists nine papers despite saying eight.

**Repair:** either make ML.4's individual construction branches explicit, or coalesce their missing classification work into a scoped continuation of the endoscopy direction. Name local parameters and component groups, packet construction/exhaustion, normalization, endoscopic character relations and the exact multiplicity formula needed by each consumer. Link the existing GSp4 proposal to these suppliers. Keep conditional global branches visible in the endpoint registry until their exact assumptions are proved. No blanket declaration that every GSp4 result is conditional is justified: Gan–Takeda proves its local correspondence over nonarchimedean characteristic-zero fields, using local theta correspondences and the GL2/GL4 inputs.

AGIKMS v3 specifically closes the earlier local-intertwining assertions but retains the twisted weighted fundamental lemma. Its §0.4 distinguishes ordinary/unweighted results from the weighted and nonstandard weighted inputs still required. Preserve this distinction; neither generic weak transfer nor ET.3's ordinary theorem upgrades the global classification to unconditional status.

Acceptance must exhibit an owner and source statement for each routed classification input, the hypotheses propagated into each consumer, and a normalization-compatible packet/transfer interface. A name alone does not satisfy this finding.

## 2. All ML stages are registries — rejected

The execution-state marker describes the maturity of a roadmap specification. It does not cancel its constructive targets. ML.2 explicitly owns the final potential-automorphy theorem. ML.3 owns symmetric powers and the resulting analytic/equidistribution arguments. PA.5 supplies transport operations and explicitly leaves a lifting theorem to its own owner. The suggested wholesale move to PA would erase this division.

The reproducible recount used each current extraction's source routes, matched its independent verdict by route number, and counted distinct item IDs of status `missing` only on accepted routes. Result: **100 items, 21 routes, 19 papers**. Two further accepted Newton–Thorne21 source routes contain only planned items. The input's 101 includes Beuzart-Plessis–Chaudouard25 route 8, whose verdict is rejected.

Newton–Thorne26 route 2 explicitly retains endpoint statements in ML.3; accepted routes 5, 15, 16 and 17 separately propose polarized lifting, tensor-product functoriality lifting, symmetric-power lifting and definite-unitary level raising. The source's Theorem 6.5 has distinct totally-real and CM hypotheses and derives its endpoint from Theorem 6.4 and additional reductions. This is meaningful construction ownership, not merely a registry.

For the Bianchi example, BCGET25 accepted route 1 already gives ML.0/2/3 the definitions and analytic applications E–G. The source explicitly constructs the Fourier/cohomology dictionary and distinguishes principal-prime Hecke operators from the adelic extension across ideal classes. Theorem G has level-one and class-number-one hypotheses and uses Marshall's argument with the newly established Ramanujan bound. These are obligations for that accepted source brief; a coarse-stage text search does not establish that they lack an owner. In particular, mass equidistribution is not automatically the same theorem as Sato–Tate. The blueprint must keep their proofs distinct and import the shared locally symmetric-space and analytic infrastructure.

Finding 1 remains a real, separate ML.4 gap. Rejecting finding 2 neither certifies all 100 items' dependency closure nor approves any pending Part II design.

## 3. Companion forms have no owner — rejected

The current reviewed fine node
`AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`
explicitly places the proof of Edixhoven Theorem 4.5 at R20.3. Its proof steps 4 and 6 name Gross's companion-form input, and its hypotheses record the Coleman–Voloch extension. R15.4 owns the recipe and comparison statement; it deliberately delegates the optimization proof. The red-team's coarse search misses this ownership record.

The route-status premise is also wrong: BCG25 route 6 and CG20 route 27 are accepted, whereas IKM24 route 8 is rejected. The latter explicitly leaves the exact exceptional hypotheses and supplier proof open. Preserve that gate; the reviewed recipe node does not magically complete its source verification.

The proposed fix conflates three statements: the split ordinary companion criterion, lowering an unramified modular representation to Katz weight one, and recovering unramifiedness/Frobenius data from a weight-one form. Gross's cited propositions distinguish the weight-p boundary and the distinct-character assumption. Coleman–Voloch's Theorem 0.1 treats ordinary cuspidal forms with 2<k<=p; Corollary 0.2 assumes p>2. Their introduction leaves the exceptional k=p=2 case open and warns that tameness need not imply splitting in the exceptional case. Thus “the Coleman–Voloch treatment of p=2,3” is not a correct repair.

Expand the existing R20.3 proof obligation with exact sources and separate hypotheses during its blueprint/source closure. Do not open a new missing-owner task or accept IKM route 8 on the strength of this finding. No claim is made here that the full exceptional weight-one/Frobenius interface has been closed.

## 4. Definite quaternionic completion and compatibility — confirmed

DLB17 route 5 has exactly 26 missing items and is accepted. R31.1's current specialization is to curves; R31.4's concrete theorem is Emerton's degree-one promodular branch. R18.4 gives finite-level quaternionic/Jacquet–Langlands inputs and CC.8 supplies generic completed objects, but neither proves the definite Banach compatibility theorem.

DLB fixes a quaternion algebra B-bar over **Q**, split at p and ramified at infinity, with a sufficiently small tame level. Definition 4.3 constructs the compact inverse limit X of finite double quotients. Lemmas 4.4–4.5 identify its compact analytic quotient model and classical algebraic coefficient spaces. Section 5.1 constructs the spherical Hecke actions, their limit, the residual localization A and its Galois representation. The standing assumption is absolute irreducibility of the **local** residual representation at p, not merely global irreducibility.

Appendix §13 gives the proof that the atlas must plan: the finite-orbit model and locally algebraic density; the family Pi-univ from the local correspondence; the multiplicity module M and finite generation of its dual; dense crystalline points and nonzero fibers (Proposition 13.5); injectivity of the completed evaluation map by reduction and residual irreducibility; closed image plus density for surjectivity; then the finite-dimensional fiber identity giving Theorem 5.4 with positive multiplicity. The tensor-product lemmas cited from Emerton remain explicit inputs, not unnamed functional analysis.

**Repair:** add the definite model, classical comparison, Hecke/Galois localization and compatibility branches within R31. Identify C^0(X) with the degree-zero specialization of the generic CC construction and import R18.4, the existing determinant/Galois infrastructure and R30.5's family correspondence. Keep the curve degree-one theorem unchanged. A statement about other number fields is not the obstruction: this quaternion algebra is still over Q. The missing point is the group/tower and cohomological degree, with its own proof.

## Dependency and validation limits

On the assembled graph, checked ten candidate dependency arrows jointly: AS.6, ET.3 and ET.6 into a provisional classical-packet supplier, that supplier into ML.4; CC.2, CC.6, CC.8 and R18.4 into a provisional definite-tower branch, followed by the definite compatibility branch with R30.5. None introduces a cycle. These are minimal boundary checks on 7,361 existing arrows, not a complete classification proof graph. Weighted stabilization, theta and functional-analysis sublemmas still need explicit scoped suppliers; do not import an entire downstream endpoint or whole parent roadmap to fill them.

Only the two review deliverables are changed. `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-langlands-3.review.json` reports `ok`. `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AREA-langlands-3.review.json research/blueprint/reviews/REV-RT-AREA-langlands-3.md` reports 2 files, 0 problems. No Lean file is requested, produced or compiled; no theorem is claimed formalised.
