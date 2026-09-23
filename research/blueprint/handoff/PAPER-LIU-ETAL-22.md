# PAPER-LIU-ETAL-22 — current handoff (cc-fb70e5, Claude Code, 2026-09-23)

Continuation of merged PR #2236. **Still `partial`**: 214 items (12 library / 20 planned / 182 missing), 21 routes, 371 edges — **all unchanged**. This tick reviewed source findings and did nothing else.

## Delivered

- **Six of the sixteen findings now carry `review.verdict: confirmed`** — **E4, E6, E11, E14, E15, E16** — each re-derived at its locator by a worker independent of the authoring sessions, with the reasoning in `sourceIssues[*].review.reason` so it can be checked rather than trusted. This answers the previous handoff's "no source finding is independently reviewed here" for those six.
- **Provenance re-verified independently**: the NSF published PDF re-downloaded, sha256 byte-for-byte the recorded `dd821abd…ec89d97`.
- Each verdict added something the finding did not have: **E4** — the defect is confined to Prop 2.7.2(3), since Lemma 2.7.1's identical phrase is vacuously safe, and `P ≠ 0` provably suffices for large `ℓ`. **E6** — 4 corrupted against ~25 correct occurrences of the same product, including the identical indexed form on p. 348, *plus a locator correction*: Appendix B.3 has **Proposition** B.3.5 and **Lemma** B.3.6, not the other way round. **E11** — the paper's own tangent-rank formula and the hypotheses of A.1.3(3) both transfer exactly under `h ↦ h−d` and not under `h`. **E14** — the display one paragraph above has coefficient degree `2n−1`. **E15** — footnote 4's convention makes the 1-polarized weight set symmetric about `−1/2`, so `[−n,n−1]`; and Lemma 2.2.7, invoked in the next sentence, needs `a < 0`, which `[1−n,n]` fails at `n = 1`. **E16** — a group-theoretic type mismatch (`Gal(F̃_S/F⁺)` versus the quotient), not merely a symbol slip.

## Resume in this order

1. **The previous handoff's top item is untouched and still first**: derive vanishing, or a uniform-in-`m` bound, for the two obstruction groups from the actual `GI(T²−1)`, `j = 1` tensor hypotheses. Nothing here bears on it.
2. **Ten findings still need review.** **E7** was examined and deliberately left open: the printed `c_{r−1}` carries no `j` while the right side is `d^•_{r−j,p}`, but `DL^•(V_{s^•})` itself depends on `j`, so the `j`-dependence may be honest — settling it needs Theorem 5.7.7 and Proposition A.2.4(2). **E1, E2, E3, E5, E8, E9, E10, E12, E13** were not attempted; E1 and E2 in particular are the normal-closure formula and the diagonal-basis step that the obstruction thread is built on, and they deserve a dedicated reading. No verdict was invented for any of them.
3. **G7's 76 inherited two-test D/C entries** still lack their third typed tests.
4. The two `openInvestigations` (U1: global triviality of the exceptional `P¹`-bundle, Lemma 5.11.3(5); U2: the forgetful-arrow direction in Proposition 5.10.13) are untouched and remain investigations, not findings.

## Boundaries

Fresh reads by this worker: the published PDF at pp. 124, 134–137, 229, 302, 311, 319, 322, 338–348 — the locators of the six reviewed findings and the passages needed to adjudicate them. Everything else is inherited. No item, route, API, test, edge, threshold or obstruction statement was modified; no Lean file; the embedded diagnostics were **not** rerun; the pins were **not** re-read. The JSON was checked to round-trip identically under `json.dumps(indent=2, ensure_ascii=False)` before editing, so the diff is confined to six `review` objects.

**Do not read six confirmed misprint/error verdicts as progress on the mathematics.** Five of the six are typographical, and the sixth (E4) is repaired by a hypothesis the paper's own application already satisfies. The extraction is partial for the reasons the earlier handoffs give.

---

## Previous handoffs — historical context

# PAPER-LIU-ETAL-22 — current handoff (codex-a71f92, 2026-09-23)

Continuation of merged PR #2224. Input `fbfe41975f277338d20c2259ea7426696d29df36`.
Partial checkpoint: **214 items (12 library / 20 planned / 182 missing)**, 21 routes, 371 edges, all 205 inherited items and all 16 findings preserved. No source finding is independently reviewed here, and no new source error is asserted.

Added L11/L12 (existing additive Goursat and integral Smith bases), S23-obstruction/defect/error, S24-rows/bounded, and S25-boundedzero/boundedone. Full statements, proofs, API and six typed construction tests are in the JSON/report.

Key result, for delta=2 and odd ell: with A=K^h, J=im(P_h q), H=im(P_h q,P_h q alpha), common coordinate kernel D and quotient involution tau on C=J/D, the actual Frobenius image G has J/G≃C^-=ker(tau+1) and exact sequence 0→C^-→A/G→A/J→0. Therefore G=A iff J=A and C^-=0. Diagonal paired images can suffice; full-product surjectivity is too strong as a necessary criterion.

If ell^a kills A/J and ell^b kills C^-, the O-span of actual evaluations loses kappa=ord_lambda(ell)(a+b). Do not replace a+b by max(a,b) without a splitting. S24-rows chooses actual evaluations with the same span loss. The source saturation recurrence remains f(1)=1,f(2)=4.

Conditional final thresholds:
- Rank zero: m>mper+mlat+mSigma+rR+kappa+mdif.
- Rank one: m>mper+mlat+mSigma+8rR+2kappa+mdif.

**Next mathematical step:** derive vanishing or a uniform-in-m bound for these two obstruction groups from actual GI(T²−1), j=1 tensor hypotheses. This continuation does neither. The Kummer counterexample remains outside the final theorem's actual setting. E1, E13 and all other geometric gates remain. Independent review of the normal-closure formula and E2 replacement still required.

Library/ownership: generic Goursat already exists and is shared with PAPER-WOOD-19/320–322; no new generic route. Read ES roadmap/AUDIT-24 ES.1/ES.4, reuse byte-identical full upstream reads, keep all route identities. K is an additive ell-group, not an assumed O-module. Use Smith bases over O, not O/π^n.

Validation: embedded stdlib program passed 21,134 field cases, 56 higher-torsion cases and 85,880 row sets (84,856 nonvacuous selections). Paper validator and three-file intake pass; all 48 repository tests pass. Internal DAG, unique routes and preservation checks pass. New construction: two consumers, four API entries, six typed tests. **G7 still has 76 inherited two-test D/C entries**; do not claim complete protocol compliance or extraction. Historical CAS/rank-two/normal-closure checks are retained, not rerun or self-reviewed.

Fresh read: targeted §§2.3–2.7, Definition8.1.1/Remark8.1.2 beginning, rank-zero proof pp.310–313. Reused own earlier rank-one proof reading and attributed full-paper history; same main PDF hash reverified. Only the three authorized paper deliverables are submitted; no Lean file.

## Previous handoff (preserved)

# Handoff: PAPER-LIU-ETAL-22

Codex — codex-hjdg0j — 23 September 2026. **Partial continuation of PR #2218.** No independent review or Lean compilation is claimed.

Preserved all 199 prior IDs, 21 routes, proposal identities, prior full-paper reading records and the previous rank-two repair. The inventory now has **205 items: 10 library, 20 planned, 175 missing**, with 349 recorded dependency edges. The new construction has four typed tests; the inherited 76 definition/construction records still need their third typed tests. There are 16 source findings awaiting independent review.

## New mathematical progress

The E1 lifting gate now has an exact replacement formula. Put E=F(m)+, L the normal closure of FS E/F+, N=Gal(L/E), K=Gal(FS/F(m)), and q:N→K restriction. For an order-d lift sigma of gamma, let alpha=conj(sigma)|N. Then **G_(S,gamma)=q(N^alpha)**. The report gives the full partial-norm argument with e=[F:F+] ord(h_gamma), and handles the distinction between E and F(m) and possible ramification in other branches of L.

The new items are S23-closure, S23-lift, S23-norm, S23-paired, L09 and L10. S23 is refined in place, and S24 now assumes the exact fixed-image surjectivity. Mathlib Schur–Zassenhaus and Tau Ceti norm/invariant theorems are imported. Do not replan them. The four missing refinements belong to existing ES.1; upstream Chebotarev is imported. K and N are additive ell-groups, not presumed O_lambda-modules, and q need not be surjective.

For the CM case, the formula is also im(P_h(q+q alpha)); joint surjectivity of the two projected evaluations is sufficient. The main GI(T²−1), j=1 hypotheses have NOT been proved to imply this condition. Separate coordinate surjectivity is insufficient. E1's original Kummer witness remains a counterexample only to the broader lemma.

## Reading and checks

Freshly reacquired the published PDF with identical SHA-256 dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97. Read printed pp.125–138; rendered p.134. Read arXiv v3 PDF19–20 with the inherited hash. Earlier full-paper and rank-one reading claims remain attributed to their workers. E16 is a missing tilde in the final Chebotarev sentence; it does not fix E1. Exact source-search scope is recorded.

Read the full EulerSystemsAndKolyvaginSystems roadmap, reviewed AUDIT24 ES.1/ES.4, relevant upstream Chebotarev layers, exact Schur–Zassenhaus declarations, Tau Ceti's full norm/invariant and fixed-point files, and Mathlib averaging declarations. The report preserves the finite-group checks: 2,144 actions, 26,080 compatible triples, five higher-torsion examples and two hypothesis-boundary regressions. These do not prove arithmetic realizability. Prior CAS/rank-two checks are inherited, not claimed rerun.

## Resume

1. Establish **q(N^alpha)=K^h for the actual GI(T²−1), j=1 tensor setting**, or prove the weaker quantitative image bound sufficient for abundance. An added error must be accounted for in every downstream exponent; do not silently keep 8rR if a new loss is introduced. No new full semidirect-product assertion is needed.
2. Independently check the preceding worker's E2 one-sided rank-two replacement and S25-consumer. It retains a primitive distinguished class, exact first localization zero, and the 8rR budget conditional on abundant evaluations. Never restore the false arbitrary-rank diagonal-basis inference.
3. Address E8's connecting map, E13's uniform integral level comparison, and X03's nonproper potential-map extension. Establish actual Fp² descent of the Fermat fibres and the rank-two reduced H0 convention. U1 remains an investigation; U2 needs image collation.
4. Complete the census and split bundled entries S03/S06/S08/S12/S16/S17/S22, A11, G06–G07/G22/G39–G43/G46/G52, R07/R09/R11, X02/X04/X08, D04, B10/B12 and C04. Complete exact signatures, consumer APIs, three typed tests and all proof leaves.
5. Read/decompose the original external inputs in G5. Keep Hypothesis 3.2.10, survey Conjecture 10.8 and the conjectural Chow/Abel–Jacobi bridge explicit.

All 21 ownership routes and proposal identities remain unchanged. Only result JSON, report Markdown and this handoff are authorized. Keep status partial until the full mathematical closure standard is met.

Validation for this pass: paper validator, intake check, unique IDs, exact missing-item routing, recorded dependency DAG, new typed tests and embedded norm program; git diff --check. No Lean file compiled. Earlier repository-wide tests are historical, not rerun for this document-only continuation.
