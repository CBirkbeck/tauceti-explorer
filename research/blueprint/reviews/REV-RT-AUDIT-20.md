# Independent verification of RT-AUDIT-20

Agent: Codex — codex-c83e7a. Issue: #1589. Date: 2026-09-24.

All three findings are **confirmed**: one high-severity definition error and two medium-severity errors in library/ownership scope. Their proposed fixes are appropriate, with the degree and coefficient-topology qualifications below. None requires changing the audit's overall layer verdicts.

The review checks the three submitted findings and their fixes. It does not claim to repeat the entire 240-target audit or its 188-declaration inventory. The reviewed input is `RT-AUDIT-20.result.json`, introduced by PR #2667, by Codex — codex-hjdg0j. The audit and its accepted review were earlier Claude-authored outputs. This session authored none of those three inputs; their commit histories and PR provenance were checked before claiming.

Repository snapshot: `e47d5d09cdcee887d2f7987e2168f2a95a1d0777`. All 21 acquired inputs were matched to GitHub blob hashes. The exact cited Tau Ceti file was fetched separately at `f790474821cf4256814db967cb154e7af3d0c369` and compared byte for byte with the pinned search copy. This verification used public files and the public source below.

## Decisions

| Finding | Verdict | Severity retained | Correction retained |
|---|---|---|---|
| RT-AUDIT-20/1 | confirmed | high | Allow the characteristic map to vanish on its nonzero characteristic ideal. |
| RT-AUDIT-20/2 | confirmed | medium | Credit the existing smooth representation category under the stated topology convention. |
| RT-AUDIT-20/3 | confirmed | medium | Preserve equal-characteristic p-primary and function-field global arithmetic obligations. |

### RT-AUDIT-20/1

Confirmed the high-severity definition error and the proposed correction. AUDIT-20 DM.0 targets[2] says “nonzero constant term”, whereas the roadmap DM.0 requires the constant coefficient to equal the characteristic map and expressly retains special characteristic. For A=F_q[t], L=F_q, iota(t)=0 and phi_t=tau, the Ore relation is commutative on F_q coefficients. Hence a(t) maps injectively to a(tau), its tau-degree is deg(a), and its constant coefficient is a(0)=iota(a). This is a rank-one special-characteristic Drinfeld module, yet phi_t has zero constant coefficient. Its t-kernel is Spec F_q[X]/(X^q), a nonreduced finite group scheme, so replacing it by its single geometric point would also lose the example. Independently checked Poonen, Introduction to Drinfeld modules (2021-12-29), §3.2 Definitions 3.1–3.2, p. 4, and §3.3 Example 3.4/Proposition 3.5, p. 5: https://math.mit.edu/~poonen/papers/drinfeld.pdf (read 2026-09-24). The correction should say constant coefficient = iota(a), and distinguish tau-degree r deg(a) from polynomial degree q^(r deg(a)); nonvanishing applies only outside ker(iota). Retain the absent verdict and use normal audit integration for the coverage copy.

### RT-AUDIT-20/2

Confirmed the medium-severity library claim and its limited fix. Read the pinned source https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean: IsSmoothDiscrete at line 254 requires a discrete carrier and open stabilizers, under a topological monoid; SmoothDiscreteTopRep at line 537 is its full subcategory; DiscreteRep at line 550 has discrete underlying modules with continuous scalar and group actions; its category instance at line 581 uses Representation.IntertwiningMap. The equivalence discreteRepEquivSmoothTopRep at line 678 requires a topological group, with no compactness or profiniteness assumption. The category therefore applies to locally profinite groups. The discrete coefficient topology specified in the finding is essential for the ordinary algebraic smooth category: it makes the scalar action on a discrete module continuous. The claim does not apply automatically to usual-topology C or Q_ell. Correct both the ES summary and ES0 targets[1].note and cite these three constructions, but leave the enhanced-center comparison target absent. No Bernstein block classification or spectral action is obtained from this carrier. The full pinned file was fetched independently and matched byte for byte.

### RT-AUDIT-20/3

Confirmed both medium-severity ownership qualifications. The current ClassFieldTheory purpose and Layer 11 expressly use number-field idele carriers, NumberFieldArithmetic and archimedean factors. Layer 8 gives the unrestricted local correspondence only for finite extensions of Q_p and exports only the prime-to-residue-characteristic correspondence for a general nonarchimedean local field; it explicitly excludes equal-characteristic p-primary existence. FA.4 requests reciprocity over F_(q^d)((t)) and every finite abelian quotient, and FA.3 owns Artin–Schreier–Witt inputs. The proposed degree-p example is valid: for K=F_(q^d)((t)), v(z)>=0 gives v(z^p-z)>=0; if v(z)=-m<0, v(z^p-z)=-pm, never -1. Thus X^p-X-t^(-1) has no root in K. For prime p, the Artin–Schreier root-translation action then gives an irreducible separable polynomial and cyclic degree-p extension. This is outside the owner's prime-to-p existence theorem. Rewrite FA.4 duplicates[0] as shared formalism plus a restricted overlap, retaining full equal-characteristic p-primary work in FA.4; rewrite duplicates[1] as the number-field arithmetic analogue and reusable abstract formalism. Keep the correctly restricted Layer 12 note, current verdicts and upstream ownership unchanged. The exact owner and consumer passages were opened, rather than inferred from roadmap names.

## Evidence opened independently

### Definition and special characteristic

The [audit's DM.0 entry](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/research/blueprint/audit/AUDIT-20.result.json#L75) adds nonvanishing, while [DM.0's construction and acceptance test](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/campaign/DrinfeldModulesAndTModules/README.md#L13) require the characteristic map and a special-characteristic example. These are incompatible for the displayed rank-one example.

[Poonen, *Introduction to Drinfeld modules*](https://math.mit.edu/~poonen/papers/drinfeld.pdf), dated 29 December 2021, §3.2, Definitions 3.1–3.2, p. 4, independently supplies the field/characteristic and tangent-action definitions. Section 3.3, p. 5, explains the degree convention and the polynomial-ring rank calculation. The paper allows a rank-zero convention in generic characteristic; that convention is irrelevant to this positive-rank counterexample. In the formula with `deg_tau`, degree means the exponent of tau; the corresponding additive polynomial has degree a power of q. The example is checked symbolically for every prime power q, not inferred from a numerical test.

Source read 2026-09-24. PDF SHA-256: `c5498cc792af874a99d6e016e767edb12e352e664426243cbcc4191fb367f272` (20 pages).

### Smooth category and coefficient topology

Read the actual definitions, category instance, functors and equivalence, including their surrounding variable declarations:

- [`TauCeti.IsSmoothDiscrete`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L254), with the open-stabilizer condition; [`isSmoothDiscrete_iff_continuousSMul`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L324) identifies it with continuity of the action on a discrete module over a topological group.
- [`TauCeti.SmoothDiscreteTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L537) and [`TauCeti.DiscreteRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L550), including the scalar-continuity field; [the category instance](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L581) uses equivariant linear maps.
- [`TauCeti.discreteRepEquivSmoothTopRep`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean#L678), after the topological-group variables, with its actual forward and inverse functors.

There is no ambient compactness/profiniteness hypothesis hidden in these sections. For a discrete coefficient ring and discrete module the scalar map has discrete domain, so its continuity is automatic. For nondiscrete coefficients the field remains a real restriction. The [ES summary and ES0 note](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/research/blueprint/audit/AUDIT-20.result.json#L2846) need this distinction. The [ES0 roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/campaign/ExcursionOperatorsAndSpectralAction/README.md#L30) still requests the additional enhanced-center comparison; the carrier alone proves no such comparison.

Pinned file SHA-256: `f8c5af368da63695110117252a07e8607577074d46bf23f616c032637453279e`.

### Arithmetic scope of the cited owner

Read the [ClassFieldTheory purpose](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/tau-ceti/ClassFieldTheory/README.md#L37), the entire [Layer 8 contract](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/tau-ceti/ClassFieldTheory/README.md#L934), and [Layers 11–12](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/tau-ceti/ClassFieldTheory/README.md#L1140). Compare [FA.3–FA.4](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/content/campaign/FunctionFieldArithmetic/README.md#L41) and the [two audit overlap notes plus the qualified Layer 12 note](https://github.com/CBirkbeck/tauceti-explorer/blob/e47d5d09cdcee887d2f7987e2168f2a95a1d0777/research/blueprint/audit/AUDIT-20.result.json#L1703).

The upstream local statement has two distinct domains: full mixed-characteristic existence and prime-to-p existence over general local fields. The upstream global arithmetic instance is for number fields. Its abstract formation theory can be reused, but that does not supply the missing function-field arithmetic instance. The Artin–Schreier example above is a scope witness, not an independent proof of reciprocity.

## Validation and scope

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-20.review.json` passes. The review has exactly one verdict for each of the three input finding IDs, with no extra verdicts. The reviewed mathematical claims were compared to the named files and declarations, not accepted on the red-team narrative alone.

Only `research/blueprint/redteam/RT-AUDIT-20.review.json` and `research/blueprint/reviews/REV-RT-AUDIT-20.md` are submitted. The audit is left for its authorized fix job and normal integration. No Lean file was requested, edited or compiled; no formalization is claimed.
