# Independent review of the fourth Iwasawa fix round

Refs #8926. Job `REV-FIX-RT-AREA-iwasawa-3~4`; Codex, session
`codex-oMxbbH`, 18 October 2026. Input revision
`41cf8c3315b7f2e20940a5bcf7202e11beceaebe`.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/8926#issuecomment-6243661581)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/8926#issuecomment-6243662781).
This session did none of `FIX-RT-AREA-iwasawa-3~4`.

**Verdict: accepted for all four packets in this bounded fix review.**
All eight confirmed findings now have the required corrections or explicit
owner imports. The residual GH hypothesis and Kato exponent identified by
the third-round review are corrected. The full Nori supplier previously
missing from the plan is now specified with its maps, hypotheses, proof route
and distinguishing tests. No further mathematical edit was necessary.

This reviews the fixes, not every unrelated target in the four roadmaps.
In particular, it neither closes Motives' remaining gaps nor approves its
legacy prototype as a package. All implementation statuses remain unchanged.

## Findings and evidence

The inputs were the original `RT-AREA-iwasawa-3.result.json`, its independent
verification, `RT-AREA-iwasawa-3.fixes-4.md`, the preceding independent review,
and the affected owner nodes, reader contracts and suggested signatures.
The following verdicts concern the current files, independently checked
against the public sources below.

| Finding | Verdict and reason |
|---|---|
| **/1 — CM product model** | **Accepted.** GH.0/`cm-product-good-model` supplies each factor's smooth proper model separately. GH.1/`p-adic-abel-jacobi-map` now separately supplies finite unramified F/Q_p and the models of C and X_m over O_F. BDP §3.2, pp.1067–1068, makes exactly these geometric assumptions; its selected-CM application with p∤cNd_K does not certify every CM twist. Conrad's appendix, pp.1139–1140, supplies the universal modular factor over Z[1/N]. The product stability is imported rather than replanned. At p=5, y²=x³−x has discriminant 64, whereas y²=x³−25x has minimal discriminant valuation 6 and bad reduction despite 5∤7. These distinguish the two hypotheses. |
| **/2 — Moment twist** | **Accepted.** Kato §8.4, equations (8.4.1)–(8.4.3), pp.182–183, identifies T_pE with H_p(1). Thus Sym^(k−2)(T_pE) contributes twist k−2; after twist 2−r the result is k−r. The moment target and its signatures use this orientation. At r=1, weights two and four give twists 1 and 3; reversing the symmetric-power contribution gives −1 in weight four. |
| **/3 — Euler factors and Hecke normalization** | **Accepted.** Lemma 8.8(1), p.185, has n^(r′−1), now present in the owner statement and acceptance test. The inverse-Hecke factor n^(1−r′) times the first diamond factor n^(r′−1−r) gives n^(−r). Central diamond n^(k−2−2r), with covering degree n, gives n^(k−1−2r). At n=2,r=1,r′=2, the linear factor is 1/2, whereas the old exponent gives 1. The light scalar definitions and three proved Lean examples test these formulas. `chernHeckeDiamond` now names the source scalar and still requires its intertwining hypothesis. Proposition 8.7, p.184, and Theorem 9.5, p.188, support the retained linear/quadratic Euler factors, the omitted quadratic term at a prime dividing N, and the trivial p-factor when p divides M. |
| **/4 — Filtration target** | **Accepted.** Kato (9.2.2), p.187, and §9.4, p.188, give filtration steps: F^i is the whole space for i≤0, the modular-form subspace for 1≤i≤k−1, and zero for i≥k. The dual exponential lands in F⁰D_dR(V(i)) identified with F^iD_dR(V). The packet does not replace this by an associated graded piece. For k=4, F¹=F²=F³ can be nonzero while gr¹ and gr² vanish; the i=4 endpoint test also detects the former defect. |
| **/5 — Iwasawa twist** | **Accepted.** Theorem 12.5(1), p.221, twists by k−r before finite-level specialization, localization and exp*. The interpolation target has this order and the inverse cyclotomic semilinearity κ(σ)^(−j). At k=2,r=1 its specialization uses V_f(1). A finite-level root alone cannot turn the opposite representation twist into this target. The dual-form, gamma and sign conventions remain explicit. |
| **/6 — Local-duality limit** | **Accepted.** Lemma 8.5, pp.183–184, passes from inertia H¹ invariants to a Pontryagin dual and then to the dual of the direct limit of residue-field H¹ under restriction. The integrality proof keeps this direction: original inverse corestriction is dual to direct restriction. The vanishing uses p-cohomological dimension zero for the residue-field union. In the μ_p test the undualized inverse system can retain Z/p, while restriction eventually kills the direct limit. The proof and transition tests no longer conflate these systems. |
| **/7 — Theta divisor** | **Accepted.** Kato §1.10, p.124, uses pushforward of D=c²[0]−E[c], consistent with divisor of the norm and multiplication by a on Pic⁰. For c=5,a=2, pushforward fixes D, but pullback is 25E[2]−E[10]. Its coefficient at a nonzero 2-torsion point is 24, rather than D's zero. The owner proof and negative test use this distinction. |
| **/8 — Full formal periods** | **Accepted as a corrected roadmap specification.** The four existing MC.6 targets now supply the full comparison bridge detailed below. The single owner remains Motives; PS.2 imports its P_eff, L and P=P_eff[L⁻¹] and owns the integration normalization. PS.9's changed consumer requires the full equivalence and the same comparison point. It preserves Brown's nonnegative-weight H, nonzero ζᵐ(2) and unipotent coaction H→A⊗H. Brown §1.1, p.2, §2.2, p.4, and Corollaries 1.2/7.5, pp.1/19, support this distinction. Neither numerical injectivity nor inversion of ζᵐ(2) inside H is introduced. |

## The full comparison bridge

The previous review correctly rejected an equivalence ending only in an
abstract localization of A_eff, followed by helpers requiring an independently
supplied effective neutral context. The new contracts address both boundaries.

For each finite effective good-pair diagram F, restriction of full comparison
matrices is conjugated by the degree-zero extension isomorphisms α and β:
`a ↦ (v ↦ β_v⁻¹ ∘ a_(v,0) ∘ α_v)`. Dualizing gives the coefficient map in
the correct direction. Its finite-inclusion squares define
`j:A_eff→A_full`, with the good-pair unit and products fixing its algebra
structure. These are specified maps between the MC.5 extensions of the
actual cohomology representations.

The localization claim is explicitly `IsLocalization.Away (e_eff L) A_full`
for this j. Its proof tests arbitrary commutative Q-algebras: an effective
tensor transformation extends exactly when its rank-one Tate scalar is a
unit. Powers and inverse dual powers give the unique extension and must
respect localization edges. HMS Theorem 2.10, p.11, together with Lemma B.21
and Proposition B.22, pp.25–26, provides this route. Thus the resulting
`E:P≃A_full` has a specified actual target and fixes effective coefficients
and the inverse Tate identity. The general Mathlib localization API is used
after this Nori-specific step.

The comparison-category construction applies HMS Lemma 3.1, p.12, with
Betti first. Its faithful exact projections and multiplicative universal
property construct the de Rham fibre on the existing full MM_Nori and the
same complex tensor comparison Φ. Reversing the construction gives the
comparison of diagram categories. MC.5's full rigidity supplies the input
to Lemma 3.2; no effective rigidity is assumed. Theorem 1.14, p.8, and
Theorem 3.3/Corollary 3.4, p.13, support the full application.

With ordinary composition, Betti acts by `b∘f` and de Rham by `f∘d`.
The coordinate coactions therefore have types `H_B⊗P` and `P⊗H_dR`.
Their transport through E, the heap `f∘g⁻¹∘h`, both torsor isomorphisms
and commuting-action identities are required over all Q-algebras.
The point transported through E represents precisely Φ. Its unique factors
are `x∘Φ⁻¹` on the Betti side and `Φ⁻¹∘x` on the de Rham side.
These assertions go beyond checking one complex point.

The tests distinguish Q[t] from Q[t,t⁻¹], reject extending t↦0, exercise
negative Tate powers and both inverse equations, and use noncommuting
rank-two matrices to detect reversed composition. The common signs in
the two inverse Künneth maps cancel; the odd-degree 2-by-3 test gives 6.
The actual `ProductCompatible` signature now also requires the geometric
unit and both unital structures. These requirements agree with HMS
Definition B.14 and Proposition B.16, pp.20–22.

The heavy `NoriPeriod.*` contracts are reader/packet targets under the current
shape rule, with explicit APIs, prerequisites and tests. Their absence as
new Lean constructions is appropriate: the carriers are not library data
at the pins. The retained implementation gap is not a missing mathematical
statement. The MC.5 product-edge/universal-property obligations, relative
Beck and reconstruction obligations, Artin/Tate classification and separate
geomlanglands review remain unaffected. Packaging must still refactor the
legacy Motives file, which exceeds the current size and admitted-data rules.

## Sources and reuse

Only public source versions were used, read on 18 October 2026. Kato's
critical exponents, filtration and limit arrows and BDP's hypotheses were
also checked on rendered pages. No source passage is included here.

| Public source | Bounded locators checked |
|---|---|
| [Bertolini–Darmon–Prasanna, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Introduction p.1040; §3.2 pp.1067–1068; Conrad appendix pp.1139–1140. |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10 p.124; §8.4 pp.182–183; Lemma 8.5 pp.183–184; Proposition 8.7 p.184; Lemma 8.8 p.185; (9.2.2) p.187; §9.4/Theorem 9.5 p.188; Theorem 12.5(1) p.221. |
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2 p.2; Definition 1.1/Theorem 1.6 pp.4–5; Theorem 1.14 p.8; §2/Theorems 2.6 and 2.10 pp.9–11; Lemmas 3.1–3.2 p.12; Theorem 3.3/Corollary 3.4/Remark 3.5 p.13; Definition B.14/Proposition B.16 pp.20–22; B.18 pp.24–25; B.21–B.22 pp.25–26. |
| [Brown, arXiv:1102.1312v1](https://arxiv.org/pdf/1102.1312v1) | Corollary 1.2 p.1; §1.1 p.2; §2.2 p.4; Corollary 7.5 p.19. |

The reviewed GH.0, Kato L1 and PS.2 library-audit entries were read.
At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the smooth/proper
composition and base-change declarations support the GH product step.
`IsLocalization.Away.invSelf`, `mul_invSelf`, `lift`, `liftAlgHom`,
`IsLocalization.algEquivOfAlgEquiv` and `Polynomial.not_isUnit_X` were
checked directly. Their hypotheses support the stated localization tests;
they do not construct the Nori comparison algebra.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti.Tannaka.fgPointTensorIsoEquiv` starts from a known commutative Hopf
algebra and its finite comodules. It supplies no substitute Nori category.
Current upstream was inspected read-only at roadmap revision
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti revision
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including ReductiveGroups and
Completed/HodgeStructures and their suggested statements. Existing group,
Hodge and Tate work is reused. Searches of both current trees found no
Nori/formal-period comparison supplier. No upstream file was changed or built.

## Changes, checks and completion

The only edits are this report and the four top-level review replacements.
Each predecessor review is preserved intact at the end of its packet's
`reviewHistory`; each new note identifies that predecessor and the bounded
scope. No mathematical statement, node, API, test, baseline entry, gap,
request, coverage status, fix record or suggested file was changed.

All four full packet checks pass with **zero errors and zero warnings**.

| Packet | Nodes | API items | Tests | Gaps | Fresh Lean result |
|---|---:|---:|---:|---:|---|
| GH.0 | 66 | 66 | 58 | 17 | Exit 0; 242 sorry warnings |
| Kato | 40 | 60 | 41 | 14 | Exit 0; 134 sorry warnings |
| Motives | 182 | 467 | 264 | 24 | Exit 0; 817 sorry warnings |
| PS.8–PS.9 | 40 | 63 | 63 | 5 | Exit 0; 192 sorry warnings |

The four `lean-check` runs were sequential, each preceded by the memory
check with over 20 GB available. Every warning is `declaration uses sorry`;
there are no errors or other warnings. This establishes elaboration of the
suggested statements, not their proof or construction. Parsed comparison
with the input verifies preservation of all non-review fields. Whitespace
and allowed-path checks pass. No link map or restructuring proposal is
under review, so those checkers have no input.

This is a completed review, not a checkpoint. The earlier dispatch blocker
is absent: the live issue authorizes all four packets and suggested files.
The PS.2 application remains with `BP-PeriodsAndSpecialValues--PS.0`; the
precise owner handoff is already in `RT-AREA-iwasawa-3.fixes-4.md`. No
generated atlas/campaign file was edited. Subsequent work should use that
handoff and the preserved gaps; this review performs no promotion itself.
