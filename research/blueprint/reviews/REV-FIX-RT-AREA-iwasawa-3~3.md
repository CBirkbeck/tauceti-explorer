# Independent review of FIX-RT-AREA-iwasawa-3~3

Refs #5869. Codex (GPT-6), session `codex-HPeDsW`, 17 October 2026.
Input revision `b626c0b9290b778007613c1986c248fb254beacb`;
branch `codex-HPeDsW-review-iwasawa-3`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6241573002)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/5869#issuecomment-6241579029).
This session did none of the fix under review.

**Verdict: Motives remains `needs_changes`.** The bounded review and the
permitted corrections are finished. Submission is a **checkpoint** because
intake additionally requires genuine review verdicts in two packets excluded
by the live issue's edit scope. A negative mathematical verdict itself is a
completed review outcome; it is the dispatch mismatch that prevents completion
of this job.

The preceding codex-BIjxwP review object is preserved exactly at the end of
`reviewHistory`. Its full report and handoff are available at the
[input revision](https://github.com/CBirkbeck/tauceti-explorer/tree/b626c0b9290b778007613c1986c248fb254beacb/research/blueprint).
Older histories, fix records and the separate geomlanglands~2 obligation remain.

## Findings checked independently

I read all eight findings in `RT-AREA-iwasawa-3.result.json`, their verification
in `RT-AREA-iwasawa-3.review.json`, the round-three fix report, the preceding
review, the affected Motives contracts and the arithmetic owner nodes. The
arithmetic files were inspected read-only. Their existing blueprint acceptance
markers do not certify this review or establish that the residual errors below
are corrected.

| Finding | Verdict and evidence |
|---|---|
| **/1, CM product model** | **Correct owner handoff, still needs an owner correction.** BDP §3.2, printed pp.1067–1068, separately assumes a finite unramified F/Q_p and smooth proper models of C and X_r over O_F. Conrad's appendix, pp.1139–1140, constructs the universal Kuga–Sato factor over Z[1/N]; it supplies no model for an arbitrary CM factor A. The current GH.0/cm-product-good-model node correctly requires both factor models and retains positive product and bad CM-twist checks. GH.1/p-adic-abel-jacobi-map hypothesis 0 still appends p∤cNd_K to good reduction in parentheses. State the supplied models separately from the conductor condition in BDP's chosen-CM application. For instance the ramified quadratic twist y²=x³−169x over Q(i), at p=13 with N=5 and c=1, retains CM and satisfies that numerical condition but has bad reduction. For r≥1 its H¹ contributes to the product. No GH verdict was rewritten here. |
| **/2, symmetric-power twist** | **Correct owner handoff and correct current target statement.** Kato §8.4, equations (8.4.1)–(8.4.3), printed pp.182–183, has T_pE=H_p(1). Thus Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2), and the total twist is 2−r+(k−2)=k−r. The current Kato moment node has this orientation and weight-two/weight-four tests. At k=4,r=1 the twist is 3; the reversed exponent would give −1. This is a bounded check of the correction, not acceptance of the whole owner packet. |
| **/3, Euler operators and Hecke normalization** | **Partly corrected; the normalization remains wrong.** Kato Proposition 8.7(2), p.184, and Theorem 9.5, p.188, give the linear factors ℓ^(−r) and p^(−r), quadratic exponent k−1−2r, and the trivial p-factor when p divides M. The current norm and reciprocity nodes carry them. But L1/hecke-and-diamond-equivariance-of-the-moment-map still states n^(r−1); its acceptance item 0 and existing review's checked note repeat that exponent. Lemma 8.8(1), p.185, has **n^(r′−1)**, checked on the page image. Inverse Hecke contributes ℓ^(1−r′), and the first diamond contributes ℓ^(r′−1−r), giving ℓ^(−r). At r=1,r′=2,ℓ=2 the product is 1/2; the wrong Hecke exponent gives 1. Central diamond remains n^(k−2−2r). The suggested `chernHeckeDiamond` takes an arbitrary scalar, so it does not test this normalization. Add a normalized proposed statement and this regression in the authorized owner revision. |
| **/4, filtration versus associated graded** | **Correct owner handoff and corrected current target.** Kato (9.2.2), p.187, and §9.4, p.188, concern F^iD_dR: the whole space for i≤0, zero for i≥k, and the modular-form subspace for 1≤i≤k−1. The dual-exponential node now uses these steps and the correct upper endpoint. For k=4, F²=F³ can be nonzero while gr²=0. The interior-degree and endpoint checks distinguish the former wrong target. |
| **/5, interpolation twist** | **Correct owner handoff and corrected current target.** Kato Theorem 12.5(1), p.221, first twists Iwasawa cohomology by k−r, then specializes and localizes before applying exp*. Its displayed first arrow and root exponent were checked on the page image. The current interpolation node has this order and records inverse cyclotomic semilinearity. At k=2,r=1 the target uses V_f(1), whose F⁰ has dimension one, rather than V_f(−1), whose F⁰ is the whole two-dimensional space. A finite-level root does not supply the missing representation twist. |
| **/6, local duality and limit direction** | **Correct owner handoff and corrected current proof plan.** Kato Lemma 8.5, pp.183–184, identifies the local cokernel with residue-Galois invariants of inertia H¹, then with the Pontryagin dual of residue H¹ with coefficients H⁰(K_v^ur,T^∨(1)). It factors through the dual of a **direct limit under restriction**. The current integrality node preserves that variance and its relation to inverse corestriction. For T=μ_p at v∤p, the undualized inverse system under corestriction can retain Z/p, while restriction becomes multiplication by p and its direct limit vanishes. The source's cohomological-dimension argument applies to the latter. |
| **/7, theta divisor** | **Correct owner handoff and corrected current proof plan.** Kato §1.10, p.124, uses divisor pushforward under [a], consistent with div(N_a f)=a_*div(f) and Pic⁰(E)≅E. The current theta node says this. For c=5,a=2, [2]_*D=D, whereas [2]^*D=25E[2]−E[10]; a nonzero 2-torsion point has coefficient 24 in the latter and 0 in D. The negative test detects the false pullback identity. |
| **/8, formal-period localization and torsor** | **Partially corrected; `needs_changes` retained.** The packet distinguishes P_eff, its Tate symbol L, and P=P_eff[L⁻¹], and imports pinned localization APIs. Unit, generator product, both edge laws, shared Künneth signs, the Tate inverse, doubled-comparison rejection and evaluation of the inverse are explicit. Effective evaluation is correctly separated from representability by a full tensor-isomorphism torsor. The missing full bridge described below remains. PS.2 imports the Motives presentation and owns integration and its 2πi normalization; this review constructs no second presentation or integration theory. |

## Corrections made in this review

The previous reviewer corrected `MC.6/period-point` hypothesis 0, but the
matching supplier request and coverage item still described the cohomologies
of **all** pairs as graded multiplicative representations. HMS Definition
1.1, p.4, Theorem 1.6 and its proof, pp.4–5, and Definition B.14, pp.20–21,
require distinguishing compatible pairings from a single-degree Künneth
isomorphism. The latter belongs to good pairs. Arbitrary pairs can have
cohomology in several degrees.

I corrected the `ComplexComparisonPartII:C5` request and the corresponding
`MC.6` remaining item. On all pairs the comparison is natural for pullback
and connecting edges, normalized on the unit, and compatible with the
exterior-product and cross-product pairings. On good pairs it is compatible
with the supplied graded multiplicative structures, related to those pairings
by `ProductCompatible`. The request now includes the exact HMS locators.
The existing `PeriodComparison` and `toTensorIsoOver` signatures already
express these distinct requirements, so the suggested file is unchanged.
These are the only mathematical text changes. No node, API, test, prerequisite,
planet, baseline entry, source issue, gap or coverage status was changed.

The reader still needs the same correction. In particular its period-point
hypothesis, coverage and C5 request retain the older all-pairs wording.
`research/blueprint/readmes/MotivesAndAlgebraicCycles.md` is outside the live
issue and queue's output paths, so it was not edited.

## Remaining full comparison bridge

`FormalPeriods.localizeComparison e` reaches
`Localization.Away (e L)` for an effective algebra equivalence e. It does
not identify that algebra with the comparison algebra of the **full** Nori
diagram. `periodPoint_heap` and `periodPoint_action` instead require a
separately supplied effective `TannakianPair`; no such effective context is
supplied. They are valid conditional statements, not the intended full
Nori application.

The required next revision should give the canonical comparison map between
the localization of A_eff and the full A, its compatibility on effective
generators and the Tate inverse, the localized de Rham representation and
comparison, and their extension to fibre functors on MM_Nori. It must then
identify the formal evaluation with the complex point of that full
isomorphism torsor and transport the heap and both actions. Use MC.5's
localization and rigidity and MC.6's fibre-functor extension; do not assume
that the effective category is rigid. HMS Lemma B.21/Proposition B.22,
pp.25–26, Theorem 1.14, p.8, Lemmas 3.1–3.2, p.12, and Theorem 3.3/Corollary
3.4, p.13, give this route.

This existing gap remains explicit. Elaborating admitted statements cannot
discharge it. The October 12 compact **package** shape is also not permission
to develop the missing category here: packaging should carry its precise
targets in the README and only statements over existing pinned carriers in
Suggested.lean. The separate relative Beck, abstract reconstruction and
geomlanglands~2 obligations remain untouched.

## Sources, libraries and validation

Public sources were fetched and read on 17 October 2026. Kato's printed
pp.184,185,187,221 were also read as rendered page images; text extraction
loses primes and limit arrows. No restricted book or source passage was
copied into the repository.

| Source | Locators read for this review | PDF SHA-256 |
|---|---|---|
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2, p.2; Definition 1.1/Theorem 1.6, pp.4–5; Theorem 1.14, p.8; Definition 2.8/Theorem 2.10, pp.10–11; Lemmas 3.1–3.2, p.12; Theorem 3.3/Corollary 3.4, p.13; Definition B.14, pp.20–21; Lemma B.21/Proposition B.22, pp.25–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; §8.4/Lemma 8.5, pp.182–184; Proposition 8.7/Lemma 8.8, pp.184–185; §§9.2–9.4/Theorem 9.5, pp.187–188; Theorem 12.5(1), p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [BDP, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | §3.2, pp.1067–1068; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` declarations
read directly include `IsLocalization.Away.invSelf`, `mul_invSelf`, `lift`,
`liftAlgHom`, `IsLocalization.algEquivOfAlgEquiv`, `Polynomial.not_isUnit_X`
and `LaurentPolynomial.T_add`. The lift needs a unit image of L; transport
of an algebra equivalence needs the matching submonoids and scalar towers.
Neither gives the missing Nori-specific identification.

At pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti.Tannaka.fgPointTensorIsoEquiv` starts with a known commutative Hopf
algebra and identifies its algebra-valued points with tensor automorphisms
on its finite-dimensional comodules. It does not construct the Nori
comparison algebra or fibre functors. The reviewed PS.2 audit in
`data/library-coverage.json` likewise marks those objects absent.

Current upstream was checked read-only at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ReductiveGroups supplies the
known-Hopf/comodule direction. Completed/HodgeStructures supplies abstract
Hodge/Tate conventions. AlgebraicVectorBundles supplies geometric bundle
and cycle interfaces. None supplies this Nori period presentation and full
comparison bridge. Existing targets are imported, not replanned; no upstream
checkout was written or built.

All three packet checkers report **0 errors, 0 warnings**. Motives has
182 nodes, 463 API items, 261 tests, 47 planets, 113 baseline declarations,
24 gaps and 16 requests. Its final changed packet is checked again.
A fresh full Motives `lean-check` exits 0 with **817 warnings, all
`declaration uses sorry`**, no errors and no other warnings. The file is
unchanged. Kato and GH.0 were not freshly elaborated in this session.
No language server, library build, update or cache fetch was started.
Parsed preservation, whitespace and intake-file checks pass. No link map or
restructuring proposal is an output of this job. No excerpt field is present
in the edited packet, and implementation statuses remain `unchecked`.

## Dispatch blocker and completion test

The bot-confirmed live #5869 lists only this report and the Motives
packet/suggested pair. WORKERS.md says to edit only the issue's named files.
The queue requires four additional paths: the GH.0 and Kato packet/suggested
pairs. `issues.py:deliverables_complete` requires this job's review marker
and a genuine accepted/needs_changes/rejected verdict in **each** listed
packet. The current arithmetic markers belong to their independent blueprint
reviews. Replacing them solely to satisfy the predicate would not be a review.

The stock predicate is **false** with the actual seven outputs and **true**
when evaluated against the three live outputs substituted only in memory.
All outputs exist. A scope clarification was requested while permitted work
continued; none was received. No queue, prompt, issue body or arithmetic owner
file was changed. Before resuming this job, align dispatch with the live issue
or authorize the four arithmetic paths. Reader synchronization additionally
needs authorization for its readmes path. The handoff records exact remaining
edits so that another worker need not repeat this investigation.
