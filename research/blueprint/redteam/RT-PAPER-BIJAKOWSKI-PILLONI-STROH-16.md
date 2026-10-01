# RT-PAPER-BIJAKOWSKI-PILLONI-STROH-16

Agent: Codex — session `codex-rtOQ9t`. Date: 2026-10-01.
Issue: [#5063](https://github.com/CBirkbeck/tauceti-explorer/issues/5063).
Input commit: `e77fc6af2ce1556ba6e593af63fdcaf059480b30`.

Complete red-team audit of the accepted extraction. **Four findings: two high,
two medium.** Two exported statements need hypotheses, a proof needs a
different quasi-compactness argument, and one missing item already has an
owner and a decomposed theorem. These findings do not refute the intended
small-slope classicality theorem. No accepted extraction or roadmap was edited.

The extraction and review were by ClaudeCode sessions `cc-fb70e5` and
`cc-58621d`. This session did neither. The bot confirmed this session's
claim before work began.

## Sources and scope

Read the complete published article, pp.975–1014, including proofs and
bibliography, from the [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf).
The hash matches the accepted extraction. Inspected page images 984, 1003 and
1004 to distinguish printed claims from text-extraction errors.

Read all 43 item records, all 19 prerequisite records, all five complete routes,
the full extraction reader and independent-review report, and the printed
claims, corrections and reasons of sourceIssues E1–E14. Those 14 previously
confirmed corrections are prior work, not new findings. In particular:

- E4 already repairs the proof of Proposition 4.1.8.
- E6 already limits the low-dimensional fallback to the case its source covers.
- E12 already requires closed quasi-compact degree boxes before exhaustion.
- The existing gluing, indexing and degree-normalization corrections remain
  part of the accepted input; none is silently reverted here.

Additional primary-source reads were targeted:

| Source | Read |
| --- | --- |
| [Katz, Serre–Tate local moduli](https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf) | PDF pp.1–4, 6 and 31–34; Theorem 1.2.1, printed p.143, and Lemma 4.1.3, printed p.170, also inspected as images |
| [Pilloni, Prolongement analytique](https://www.imo.universite-paris-saclay.fr/~pilloni/pro_an.pdf) | Author-copy PDF pp.27 and 29, including weight/norm conventions and Lemma 5.1 / Propositions 5.2–5.3 |
| [Bijakowski, arXiv:1212.2035v2](https://arxiv.org/pdf/1212.2035v2) | Lemma 2.20 at PDF p.18; Proposition 3.14 and Lemma 3.15 with proof at pp.22–23 |
| [Conrad, Modular curves and rigid-analytic spaces](https://math.stanford.edu/~conrad/papers/genpaper.pdf) | Appendix A.1, pp.37–39, including Theorem A.1.2, its proof, Remark A.1.3 and Lemma A.1.4 |

The result JSON records exact hashes and versions. The Bijakowski preprint is
dated 2015 and is a precursor, not a later correction. The Pilloni PDF is an
author copy; the published version was not obtained. No full read of any of
these prerequisite papers is claimed.

On 2026-10-01 the [Annals article page](https://annals.math.princeton.edu/2016/183-3/p05),
targeted title/erratum/corrigendum searches and Crossref's record/updates query
yielded no additional correction. This is a bounded search. It does not
establish that no correction has ever circulated.

## Finding 1 — high: restrict formal étaleness to the formal deformation problem

**Where:** item 7, the BT/Iwahori construction and its Part II consumer.

The item correctly introduces both algebraic BT stacks and their formal
variants, but then exports the unrestricted algebraic map
`P : X → product BT` as formally étale. Item 6's p-nilpotence restriction
has disappeared. The printed p.984 has the same unqualified assertion.

Katz's Theorem 1.2.1 explicitly requires p to be nilpotent in the base ring,
as well as a nilpotent thickening ideal. The necessity is visible on the
generic fiber, without relying on a subtle integral counterexample:

1. Let K be algebraically closed of characteristic zero and
   R = K[ε]/(ε²).
2. Each level of a p-divisible group over R is finite étale. Finite étale
   objects and their maps lift uniquely across the nilpotent thickening
   Spec K → Spec R. Their compatible systems therefore have no such
   infinitesimal deformation parameters.
3. Elliptic curves do have them. For the Legendre family
   E_t: y² = x(x−1)(x−t),
   j(t) = 256(t²−t+1)³/[t²(1−t)²].
   At t=3 one has j(3)=21952/9 and j′(3)=31360/27 ≠ 0.
   Thus E_(3+ε) is not the constant deformation of E_3.
4. Its principal polarization exists canonically, and a prime-to-p full level
   structure lifts across this thickening. The extra PEL data in this example
   do not eliminate the deformation.

Consequently P has a nonzero infinitesimal kernel; it is not formally
unramified, let alone formally étale, on this generic-fiber test. This
example concerns §1.3's construction; it does not rely on the later
dimension-greater-than-one Köcher argument.

**Repair:** keep the algebraic map and the fiber-product definition of X_Iw.
Assert formal étaleness on p-locally-nilpotent test schemes, or for the
appropriate p-adic formal completions with fixed dimension/signature
components. Import that version of Serre–Tate from
AbelianSchemesAndArithmeticModuli A4. Record the missing qualification as a
sourceIssue and propagate it into the statement, reader and construction
brief. The p-adic local-model use has precisely this restricted scope.

## Finding 2 — high: the bad-operator bound needs a sign hypothesis

**Where:** item 28, Lemma 4.4.5 and the Part II norm-estimate obligation.

Write c_i for the smallest relevant weight: min_j k_(i,j,a_i) in type C,
and min_j(k_(i,j,a_i)+l_(i,j,b_i)) in type A. The last step of the bound
uses deg L ≥ ν to replace p^(−c_i deg L) by p^(−c_i ν).
That implication requires c_i ≥ 0. Dominance alone permits negative scalar
weights. The published weight convention on p.994 imposes no such sign
condition, and Hypothesis 4.5.1 is introduced only after this lemma.

A concrete type-C example realizes the wrong direction as an operator
counterexample, not just an objection to an inequality manipulation.

Take the genus-two Siegel case F0=Q, d_1=n=1, a_1=2, so the normalization
exponent n_1 is 3. On the ordinary locus choose an étale Iwahori flag.
The connected canonical subgroup L=μ_p² is an isotropic complement to its
étale maximal subgroup and has degree 2. This canonical choice defines a
single branch of the correspondence over the ordinary locus; its first
projection is an isomorphism.

Choose κ=(-1,-1). It is dominant, and the coefficient line is (det ω)^(-1).
Katz Lemma 4.1.3 gives multiplication by p on an integral differential basis
under the canonical Frobenius isogeny. Thus the determinant pullback is p²
times a unit, and the inverse-determinant pullback is p^(-2) times a unit.
The trace along the first projection of this single branch is the identity.
BPS §2.3 contributes p^(-3). After shrinking to affinoids with integral local
trivializations, a unit section therefore has image norm p^5.

The assumption deg L ≥ ν holds for ν=1, but the printed estimate gives p^4.
The branch stays in the low-degree target region (the Iwahori subgroup is
étale), so its designation as a bad branch is compatible with the
continuation argument's geometric meaning. This example has Shimura
dimension 3; it does not depend on a modular-curve exception.

The precursor's Lemma 3.15 proof at pp.22–23 displays the same replacement
of degree by a lower bound. Pilloni's author copy, p.29, supplies the
rank-two coefficient convention and canonical-branch norm calculation;
it does not provide the missing sign restriction.

**Repair:** add c_i ≥ 0 to the lower-degree-bound estimate. For arbitrary
weights, retain the actual partial degrees with their signed weights, or
supply an appropriately sign-sensitive bound. Add a sourceIssue and update
item 28, its reader explanation and the Part II brief.

For the intended application, p.994 states v(α_i) ≥ 0, and Hypothesis 4.5.1
then implies c_i > v(α_i)+n_i > 0. Record that discharge explicitly.
The finding changes the standalone lemma's contract, while the later
small-slope contraction argument has the needed positivity.

Exact rational arithmetic checked j(3), j′(3) above and the numerical
inequality p^5 > p^4 for p=2,3,5,7. These arithmetic checks are diagnostics;
the geometric argument and the primary-source differential calculation
supply the counterexample.

## Finding 3 — medium: simultaneous quotient map is not étale

**Where:** item 27's Lemma 4.4.3 proof, its sourceIssues and decomposition brief.

On p.1003 the proof uses the simultaneous quotient map
q:B_k^0 → (X_Iw^rig)^k and says both p and q are finite étale.
For k≥2 that description of q is impossible in positive dimension.
B_k^0 is open in a finite étale cover of the D-dimensional X_Iw^rig;
its nonempty components have dimension D, whereas the target is smooth of
dimension kD. For genus-two Siegel moduli and two distinct complements,
these dimensions are 3 and 6. Étale maps preserve local dimension.

This is absent from E1–E14. The corresponding Lemma 2.20 of the Bijakowski
precursor, PDF p.18, repeats the same helper assertion. The claim needed
for the proof is nevertheless repairable, so this is medium severity.

Use the full space B_k^rig of ordered distinct complements before restricting
over U. For each j, the coordinate q_j factors through the finite étale
forgetful map to C_i^rig and then p_2. The paper's §2.2, pp.989–990, states
both correspondence projections are finite étale and explains that either
projection gives the same good-reduction rigid locus.

For a quasi-compact V_l, each q_j^(-1)(V_l) is a quasi-compact admissible
open. Work over E12's closed quasi-compact box U. Then p^(-1)(U) is
quasi-compact, and separatedness makes its intersection with the finitely
many coordinate inverse images quasi-compact. This intersection is exactly
the inverse image of V_l^k used in the proof. Finally Proposition 4.1.4,
applied to p over U, gives a quasi-compact open image.

**Repair:** add the sourceIssue and attach this argument to item 27 and its
design brief. No product-map étaleness is needed, and no finiteness claim
for a restriction to an arbitrary open is used. Retain the desired lemma
and Theorem 4.4.1, together with the already accepted closed-box/exhaustion
correction E12.

## Finding 4 — medium: reuse the existing finiteness criterion

**Where:** item 21, its status/planned fields, route 1 and reader frontier.

The integrated node
`AdicSpacesPartII:R2/fibral-finiteness-criterion`
already states and decomposes Conrad's Theorem A.1.2. Its source hash matches
the author PDF acquired here. Read both the entire node and pp.37–39.

The criterion applies directly to g=f|U in the accepted, corrected BPS
Proposition 4.1.8:

| Conrad hypothesis | Supplier in item 21 |
| --- | --- |
| Flat | g is étale |
| Quasi-compact | U→X quasi-compact and f finite |
| Separated | Restriction of separated f |
| Finite fibers | Restriction of a finite map |
| Locally constant fiber rank | Constant geometric cardinality for étale fibers |

Thus g is finite and already étale. The map U→X over Y is proper: U→Y is
finite, X→Y is separated, and the graph argument applies. Since it is
also an open immersion, U is open and closed. Its complement is therefore
finite étale over Y. This uses the existing R0 finite/étale API in addition
to the R2 criterion. It also makes explicit how the complement conclusion
fits the previously accepted E4 repair.

**Repair:** change item 21 from missing to planned; name R2 and its exact
fibral-finiteness node, with R0 for the application. Keep the BPS statement
as an application or alternate source in route 1: the protocol permits
source routes to contain planned items. Update the frontier from
1 library / 7 planned / 35 missing to 1 / 8 / 34.

The node is an unchecked implementation plan and records outstanding
formal-model imports. No part of this finding claims the theorem has
already been formalized. The defect is a duplicate planning frontier,
not an incorrect roadmap destination.

## Ownership, library and dependency checks

All 35 items currently marked missing occur in exactly one route. All
existing destination and planned-stage IDs resolve in the assembled atlas.
The proposed HigherHidaAndColemanTheory is still a proposal. Its id, parent,
title and area match the accepted Pilloni-20, Boxer–Calegari–Gee–Pilloni-21
and Boxer–Pilloni-26 contributions. The current brief already instructs the
design to merge these and compare degree-zero classicality with the higher
Coleman result. No second classicality roadmap is warranted.

Read the relevant destination contracts for PELModuli M0–M6,
AbelianSchemesAndArithmeticModuli A4, HodgeTateAndCanonicalSubgroups T0,
AutomorphicBundles B2–B5, ShimuraCompactifications C5–C6,
AdicSpacesPartII R0–R5, and OverconvergentAutomorphicForms O3/O4/O6/O7/O8.
Read the focused available library-audit target notes listed in the result.
Packet inventories and the current Conrad node supply the concrete reuse
finding above; this was not inferred from a similar roadmap title.

Pinned libraries:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

Read `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix` and
`IsMoritaEquivalent.matrix` from the pinned
`Mathlib/RingTheory/Morita/Matrix.lean`, including their hypotheses.
The matrix index must be nonempty, as it is for the positive matrix size in
the paper. No incorrect library attribution was established for item 4.
No claim is made that the entire finite-product PEL construction is already
implemented by this one declaration.

Whole pinned Lean-text searches for Kassaei, Serre–Tate, Barsotti–Tate,
canonical subgroup, overconvergent and classicality returned only unrelated
or bibliographical matches, all inspected. This is evidence for a bounded
absence check, not proof that no equivalent construction exists under any
name. No Lean build or language server was needed.

A fresh assembly has 2907 actual stages and 8322 edge records. Exactly 8246
edges have two actual-stage endpoints, and this graph is acyclic. The
remaining 76 records touch upstream proxy IDs; treating them as actual-stage
indegrees would produce a spurious failure. This report proposes no graph
edges and does not claim to resolve pre-existing proxy representation issues.

## Validation and limits

The result checker, intake allowlist check and staged whitespace check pass.
Only this result JSON and report are submitted. No extraction, decomposition,
library file or roadmap was changed; a verifier must decide each finding
before the queue creates a fix.

The full published BPS argument was read. Prerequisite sources were read
only to the stated extent. The primary evidence and explicit repairs make
each finding independently checkable; source-library implementation and
proof of the prerequisite papers remain their owners' work.
